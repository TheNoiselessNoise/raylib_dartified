import 'dart:io';
import 'api_xml_reader.dart';
import 'base.dart';
import 'c2dart.dart';
import 'struct.dart';
import 'type_resolver.dart';
import 'package:ffigen/src/code_generator.dart';

class ModuleVisitor extends C2DartVisitor {
  List<Struct> structs = [];
  List<Typealias> typeAliases = [];
  List<EnumClass> enums = [];
  List<Func> funcs = [];
  List<MacroConstant> macroConstants = [];
  List<Constant> constants = [];

  @override
  void reset() {
    structs.clear();
    typeAliases.clear();
    enums.clear();
    funcs.clear();
    constants.clear();
    macroConstants.clear();
  }

  @override
  void visitConstant(Constant node) => constants.add(node);
  @override
  void visitMacroConstant(MacroConstant node) {
    if (!node.name.startsWith('_')) macroConstants.add(node);
  }
  @override
  void visitStruct(Struct node) {
    if (!node.name.startsWith('_') || node.name == '__va_list_tag') {
      structs.add(node);
    }
  }
  @override
  void visitEnumClass(EnumClass node) => enums.add(node);
  @override
  void visitFunc(Func node) {
    if (!node.name.startsWith('_')) funcs.add(node);
  }
  @override
  void visitTypealias(Typealias node) {
    if (node.name.startsWith('_')) return;
    if (node.name.contains('__')) return;
    final cType = node.type.getCType(context).trim();
    if (cType.startsWith('_')) return;
    if (cType.contains('__')) return;
    typeAliases.add(node);
  }
}

abstract class ModuleWriter extends Writable {
  final ModuleGenerator generator;
  ModuleWriter(this.generator);

  String get libraryName => generator.libraryName;
  String get libraryNameD => '${libraryName}D';
  bool get importFFIAsAlias => generator.importFFIAsAlias;
  String get ffiLib => '_ffi';
  C2Dart<ModuleVisitor> get c2Dart => generator.c2Dart;
  RaylibApiReaderResult get sourceAPI => generator.api;
  RaylibApiReaderResult get providedAPI => generator.builtAPI;

  void _writeHeader({bool includeFFIPackage = false}) {
    writeln('// GENERATED FILE - do not edit by hand.');
    // writeln('// ignore_for_file: non_constant_identifier_names');
    writeln();
    if (importFFIAsAlias) {
      writeln("import 'dart:ffi' as ffi;");
    } else {
      writeln("import 'dart:ffi';");
    }
    if (includeFFIPackage) writeln("import 'package:ffi/ffi.dart';");
    writeln("import 'package:raylib_dartified/raylib.dart';");
  }

  String generate();
}

class ModuleMappedType {
  final int ptr;
  final String dartType;
  final RaylibApiStruct? struct;
  const ModuleMappedType(this.ptr, this.dartType, this.struct);

  bool get isPtr => ptr > 0;
  bool get isPtrPtr => ptr > 1;
}

class ModuleCWriter extends ModuleWriter {
  ModuleCWriter(super.generator);

  // String _writeConstants() => writeIsolated(() {
  //   final constants = c2Dart.visitor.macroConstants.where((e) => !e.name.contains('\$')).toList();
  //   if (constants.isNotEmpty) {
  //     writeSection('MACROS');
  //     write(constants.map(c2Dart.writer.getNodeDartCode).join(''));
  //   }
  // });

  String _writeStructC(Struct struct) => writeIsolated(() {
    String str = c2Dart.writer.getNodeDartCode(struct);

    if (!importFFIAsAlias) {
      str = str.replaceAll('ffi.', '');
    }

    write(str);
  });

  void _writeStructsC() {
    if (c2Dart.visitor.structs.isEmpty) return;

    writeSection('STRUCTS');
    write(c2Dart.visitor.structs.map(_writeStructC).join());
  }

//   String _writeTypeAliases() => writeIsolated(() {
// //     if (visitor.typeAliases.isNotEmpty) {
// //       final current = sb.toString();

// //       final filtered = visitor.typeAliases.where((a) {
// //         return a.name.allMatches(current).isNotEmpty;
// //       }).toList();

// //       if (filtered.isNotEmpty) {
// //         writeSection('TYPEALIASES');
// //         writeBindings(filtered);
// //       }
// //     }
//   });

  String _writeEnumC(EnumClass struct) => writeIsolated(() {
    String str = c2Dart.writer.getNodeDartCode(struct);

    if (!importFFIAsAlias) {
      str = str.replaceAll('ffi.', '');
    }

    write(str);
  });

  void _writeEnumsC() {
    if (c2Dart.visitor.enums.isEmpty) return;

    writeSection('ENUMS');
    write(c2Dart.visitor.enums.map(_writeEnumC).join());
  }

  String _writeFuncC(Func func) => writeIsolated(() {
    String str = c2Dart.writer.getNodeDartCode(func);

    if (!importFFIAsAlias) {
      str = str.replaceAll('ffi.', '');
    }

    write(str);
  });

  @override
  String generate() => writeIsolated(() {
    _writeHeader();

    _writeStructsC();
    _writeEnumsC();

    writeln('class $libraryName extends RaylibModule<Raylib> {');
    writeln('  $libraryName(super.rl);');
    writeln();
    writeln('  RaylibLookup get _lookup => rl.dynLib<$libraryName>().lookup;');
    writeln();

    writeln();
    write(c2Dart.visitor.funcs.map(_writeFuncC).join(''));
    writeln();

    writeln('}');
  });
}

class ModuleDartWriter extends ModuleWriter {
  ModuleDartWriter(super.generator);

  int _nextRef(Map<String, int> refsUsed, String key) =>
  refsUsed[key] = 1 + refsUsed.putIfAbsent(key, () => 0);

  String _ffiBaseType(Type type) {
    final baseType = type.baseType.getCType(c2Dart.context).replaceAll('ffi.', '').trim();
    if (baseType == 'Float') return 'Float32';
    return baseType;
  }

  String _ffiPtrType(Type type) =>
    type.getCType(c2Dart.context).replaceAll('ffi.', '').trim();
  
  ModuleMappedType _mapType(Type type) {
    final dartType = type.baseType.getDartType(c2Dart.context).trim();
    final ptr = type.getDartType(c2Dart.context).trim()
      .replaceAll('ffi.', '')
      .split('Pointer<').length - 1;

    final struct = sourceAPI.getStruct(dartType) ?? providedAPI.getStruct(dartType);
    return .new(ptr, struct != null ? '${dartType}D' : dartType, struct);
  }

  // LOL, sleep deprivated mastermind
  String _writeFuncD(Func func) => writeIsolated(() {
    final refsUsed = <String, int>{};
    final funcType = func.functionType;
    final returnType = _mapType(funcType.returnType);

    final paramsUsingVoidPointer = <String>[];
    final paramsUsingPointer = <String>[];

    if (returnType.isPtr && returnType.struct == null) {
      paramsUsingPointer.add('return value');
    }

    final listParams = <String>{};
    final countParams = <String>{};

    final parameters = funcType.parameters;
    for (int i = 0; i < parameters.length; i++) {
      final p = parameters[i];
      final pType = _mapType(p.type);
      if (!(pType.isPtr || pType.isPtrPtr)) continue;
      if (_ffiBaseType(p.type) == 'Void') continue;

      final prev = i > 0 ? parameters[i - 1] : null;
      final next = i < parameters.length - 1 ? parameters[i + 1] : null;

      final countParam = (next != null && _mapType(next.type).dartType == 'int')
        ? next
        : (prev != null && _mapType(prev.type).dartType == 'int')
          ? prev
          : null;

      if (countParam != null) {
        listParams.add(p.name);
        countParams.add(countParam.name);
      }
    }

    final listParamForReturn = listParams.isNotEmpty
      && (returnType.isPtr || returnType.isPtrPtr)
      && returnType.struct != null
      ? listParams.first
      : null;

    final params = parameters
      .where((p) => !countParams.contains(p.name))
      .map((p) {
        final pType = _mapType(p.type);
        final ffiType = _ffiBaseType(p.type);

        if (pType.isPtr || pType.isPtrPtr) {
          if (ffiType == 'Void') {
            paramsUsingVoidPointer.add(p.name);
            paramsUsingPointer.add(p.name);
            return '${_ffiPtrType(p.type)} ${p.name}';
          }

          if (listParams.contains(p.name)) {
            final dartType = pType.struct != null ? '${pType.struct!.name}D' : pType.dartType;
            return 'List<$dartType> ${p.name}';
          }

          paramsUsingPointer.add(p.name);
        }

        return '${pType.dartType} ${p.name}';
      }).join(', ');

    final debugArgs = parameters
      .where((p) => !countParams.contains(p.name))
      .map((p) => listParams.contains(p.name)
        ? '${p.name}: \$${p.name}.length'
        : '${p.name}: \$${p.name}')
      .join(', ');

    final callArgs = parameters.map((p) {
      final pType = _mapType(p.type);
      final pStruct = pType.struct;

      if (countParams.contains(p.name)) {
        // find which list param this count belongs to
        final listParam = listParams.firstWhere((lp) {
          final idx = parameters.indexWhere((x) => x.name == lp);
          final cidx = parameters.indexWhere((x) => x.name == p.name);
          return (cidx - idx).abs() == 1;
        });
        return '$listParam.length';
      }

      if (pType.isPtr || pType.isPtrPtr) {
        if (pStruct != null) {
          if (listParams.contains(p.name)) {
            if (pType.isPtrPtr) {
              return '${pStruct.refListPtrMethod}(${p.name})';
            } else {
              return '${pStruct.refListMethod}(${p.name})';
            }
          }
          final ref = _nextRef(refsUsed, pStruct.name);
          final call = '${pStruct.refMethod}$ref(${p.name})';
          return pType.isPtr ? call : '$call.ref';
        }

        final ffiType = _ffiBaseType(p.type);
        // if (ffiType == 'Void') return 'nullptr';
        if (ffiType == 'Void') return p.name;

        if (listParams.contains(p.name)) {
          return 'rl.Temp.$ffiType\$.Array(${p.name})';
        }

        final ref = _nextRef(refsUsed, pType.dartType);
        return 'rl.Temp.$ffiType\$.Ref$ref(${p.name})';
      }

      if (pStruct != null) {
        final ref = _nextRef(refsUsed, pStruct.name);
        return '${pStruct.refMethod}$ref(${p.name}).ref';
      } else {
        return p.name;
      }
    }).join(', ');

    if (paramsUsingPointer.isNotEmpty) {
      final sus = paramsUsingPointer.map((p) => '`$p`').join(', ');
      final reason = returnType.dartType == 'void'
        ? '`mutation/update` or `out parameter`'
        : '`capture` or `out parameter`';
      padln('// TODO: Needs manual check');
      padln('//     REASON: possible $reason');
      padln('// SUS PARAMS: $sus');
    }
    if (paramsUsingVoidPointer.isNotEmpty) {
      final sus = paramsUsingVoidPointer.map((p) => '`$p`').join(', ');
      padln("// TODO: Can't handle Pointer<Void>");
      padln('// SUS PARAMS: $sus');
    }

    // determine return type string
    final returnTypeStr = listParamForReturn != null
      ? 'List<${returnType.struct!.name}D>'
      : returnType.dartType;

    writeln('  $returnTypeStr ${func.name}($params) => run(');
    writeln("    () => '${func.name}($debugArgs)',");

    if (listParamForReturn != null) {
      writeln('    () {');
      writeln('      final p = $ffiLib.${func.name}($callArgs);');
      if (returnType.isPtrPtr) {
        writeln('      return .generate($listParamForReturn.length, (i) => (p + i).value.toD());');
      } else {
        writeln('      return .generate($listParamForReturn.length, (i) => (p + i).toD());');
      }
      writeln('    },');
    } else {
      write  ('    () => $ffiLib.${func.name}($callArgs)');
      if (returnType.struct != null) write('.toD()');
      writeln(',');
    }

    writeln('  );');
    writeln();
  });
  
  void _writeStructsD() {
    if (providedAPI.structs.isEmpty) return;

    writeSection('STRUCTS');
    for (final struct in providedAPI.structs) {
      writeSection(struct.name);
      write(generator.structGenerator.generateOne(struct));
    }
  }

  void _writeRaylibExtension() {
    writeln('extension ${libraryNameD}Shortcuts on Raylib {');

    padln('$libraryName get $libraryName\$ => module<$libraryName>();');
    padln('$libraryNameD get $libraryNameD\$ => module<$libraryNameD>();');

    writeln('}');
  }

  void _writeModule() {
    writeln();
    writeln('class $libraryNameD extends RaylibModule<Raylib> {');
    writeln('  $libraryNameD(super.rl);');
    writeln();
    writeln('  $libraryName get $ffiLib => rl.module<$libraryName>();');
    
    
    writeln();
    write(c2Dart.visitor.funcs.map(_writeFuncD).join(''));
    writeln();

    writeln('}');
  }

  void _writeRegister() {
    writeln('class ${libraryName}Register {');
    writeln('  static void register(Raylib rl, String path) {');
    writeln('    rl.registerDynLib($libraryName(rl), .open(path));');
    writeln('    rl.registerModule($libraryNameD(rl));');
    for (final struct in providedAPI.structs) {
      writeln('    register${struct.name}(rl);');
    }
    writeln('  }');
    writeln('}');
  }

  @override
  String generate() => writeIsolated(() {
    _writeHeader(includeFFIPackage: true);
    writeln("import 'generated_c_module.dart';");
    writeln();

    _writeStructsD();

    _writeRaylibExtension();

    _writeModule();

    _writeRegister();
  });
}

class ModuleGenerator extends Writable {
  final RaylibApiReaderResult api;
  final Uri inputPath;
  final Uri? outputPath;
  final String libraryName;
  final List<String> compilerOptions;
  final List<Uri> entryPoints;
  final bool importFFIAsAlias;

  late C2Dart<ModuleVisitor> c2Dart;
  late ModuleVisitor visitor;
  late C2DartWriter writer;
  
  late final ModuleCWriter moduleCWriter;
  late final ModuleDartWriter moduleDartWriter;
  late StructGenerator structGenerator;

  ModuleGenerator(this.api, {
    required this.inputPath,
    this.outputPath,
    required this.libraryName,
    this.compilerOptions = const [
      '-I/usr/include',
      '-I/usr/lib/clang/21/include'
    ],
    this.entryPoints = const [],
    this.importFFIAsAlias = false,
  }) {
    moduleCWriter = ModuleCWriter(this);
    moduleDartWriter = ModuleDartWriter(this);
    _collectFFI();
  }

  List<Uri> _collectHeaderFiles(Uri entryPoint) {
    final List<Uri> headerFiles;

    final type = FileSystemEntity.typeSync(inputPath.toFilePath());

    switch (type) {
      case FileSystemEntityType.directory:
        headerFiles = Directory(inputPath.toFilePath())
          .listSync(recursive: true)
          .whereType<File>()
          .where((f) => f.path.endsWith('.h'))
          .map((f) => f.uri)
          .toList();

      case FileSystemEntityType.file:
        if (!inputPath.path.endsWith('.h')) {
          throw ArgumentError('Input file is not a header file: $inputPath');
        }
        headerFiles = [inputPath];

      default:
        throw ArgumentError(
          'Input path is neither an existing file nor directory: $inputPath',
        );
    }

    return headerFiles;
  }

  void _collectFFI() {
    final allHeaders = {
      ..._collectHeaderFiles(inputPath),
      ...entryPoints
    }.toList();

    c2Dart = .new(
      c2DartVisitor: ModuleVisitor.new,
      outputDartFile: outputPath ?? Uri(path: './i_dont_care_lol'),
      entryPoints: allHeaders,
      compilerOptions: compilerOptions,
      writerOptions: .new(
        libraryName: libraryName,
      ),
      importFFIAsAlias: importFFIAsAlias,
    );

    visitor = c2Dart.visitor;
    writer = c2Dart.writer;

    c2Dart.collect();

    _buildAPI();

    structGenerator = StructGenerator(TypeResolver(
      api.merge(builtAPI),
    ));
  }

  RaylibApiReaderResult builtAPI = .new();
  void _buildAPI() {
    builtAPI = .new();

    for (final x in visitor.funcs) {
      // NOTE: functions are separated by modules, no possibility of duplication

      final params = <RaylibApiFunctionParam>[];

      for (final param in x.functionType.parameters) {
        params.add(.new(
          desc: '',
          name: param.name,
          type: param.type.getNativeType().trim(),
        ));
      }

      builtAPI.functions.add(.new(
        desc: x.dartDoc ?? '',
        name: x.name,
        retType: x.functionType.returnType.getNativeType().trim(),
        params: params,
      ));
    }

    for (final x in visitor.enums) {
      final existing = api.getEnum(x.name);

      if (existing != null) {
        throw StateError("Enum '${x.name} already exists!");
      }

      final values = <RaylibApiEnumValue>[];

      for (final cnst in x.enumConstants) {
        values.add(.new(
          name: cnst.name,
          integer: cnst.value.toString(),
          desc: '',
        ));
      }

      builtAPI.enums.add(.new(
        desc: x.dartDoc ?? '',
        name: x.name,
        values: values,
      ));
    }

    // NOTE: for TypeAliases, we need to check collisions before registering our structs
    for (final x in visitor.typeAliases) {
      final existing = api.getStruct(x.name);

      if (existing != null) {
        throw StateError("Struct (TypeAlias) '${x.name} already exists!");
      }
    }

    for (final x in visitor.structs) {
      final existing = api.getStruct(x.name);

      if (existing != null) {
        throw StateError("Struct '${x.name} already exists!");
      }

      final fields = <RaylibApiStructField>[];

      for (final field in x.members) {
        fields.add(.new(
          name: field.name,
          type: field.type.getNativeType().trim(),
          desc: field.dartDoc ?? '',
        ));
      }

      builtAPI.structs.add(.new(
        desc: x.dartDoc ?? '',
        name: x.name,
        isOpaque: x.isOpaque,
        isCustom: true,
        fields: fields,
      ));
    }

    builtAPI.update();

    // NOTE: now we can register TypeAliases
    for (final x in visitor.typeAliases) {
      if (x.name.startsWith('int_') && x.name.endsWith('_t')) continue;
      if (x.name.startsWith('uint_') && x.name.endsWith('_t')) continue;

      final target = x.type.getNativeType().trim();
      
      final existing = api.getStruct(target);
      if (existing == null) {
        throw StateError("Could not find existing Struct for TypeAlias '$target'");
      }

      builtAPI.structMap[x.name] = existing.copy();
    }
  }

  String generateCModule() => moduleCWriter.generate();
  String generateDartModule() => moduleDartWriter.generate();
}