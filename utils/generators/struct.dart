import 'api_xml_reader.dart';
import 'base.dart';
import 'type_resolver.dart';

sealed class FieldKind {}

class EnumField extends FieldKind {
  final RaylibApiEnum value;
  EnumField(this.value);
}

class PrimitiveField extends FieldKind {
  final String dartType;   // int / double / bool
  final String ffiType;    // Int / Float / Bool …
  PrimitiveField(this.dartType, this.ffiType);
}

class PrimitivePointerField extends FieldKind {
  final String ffiType;
  final String dartType;
  final bool ambiguous = true;
  PrimitivePointerField(this.ffiType, this.dartType);
}

class CharArrayField extends FieldKind {
  final int length;
  CharArrayField(this.length);
}

class IntArrayField extends FieldKind {
  final String ffiType;    // UnsignedInt / Int / …
  final String dartType;   // int
  final int length;
  IntArrayField(this.ffiType, this.dartType, this.length);
}

class FloatArrayField extends FieldKind {
  final String ffiType;    // Float / Double
  final String dartType;   // double
  final int length;
  FloatArrayField(this.ffiType, this.dartType, this.length);
}

class StructValueField extends FieldKind {
  final String cType;      // XC
  final String dType;      // XD
  StructValueField(this.cType, this.dType);
}

class StructPointerField extends FieldKind {
  final String cType;
  final String dType;
  final bool ambiguous = true;
  StructPointerField(this.cType, this.dType);
}

class ResolvedField {
  final String name;
  final FieldKind kind;
  ResolvedField(this.name, this.kind);
}

class StructWriter extends Writable {
  final StructGenerator generator;
  StructWriter(this.generator);

  late RaylibApiStruct struct;
  late List<ResolvedField> fields;
  String get name => struct.name;
  String get tempVar => struct.tempVar;
  String get ptrTempVar => struct.ptrTempVar;
  String get tempKey => struct.tempKey;
  String get ptrTempKey => struct.ptrTempKey;
  String get c => struct.c;
  String get d => struct.d;

  void _generateStruct() {
    // _writeFfiStruct();
    _writeCLikeExt();
    _writeDLikeExt();
    _writeCEx();
    _writeCPEx();
    _writeDClass();
    _writeTempRegistration();
    _writeTempExtension();
  }

  String writeStruct(RaylibApiStruct s) {
    struct = s;
    fields = generator._resolveFields(s);
    return writeIsolated(_generateStruct);
  }

  // void _writeFfiStruct() {
  //   writeln('/// FFI struct for ${s.name}. ${s.desc}');

  //   if (s.isOpaque) {
  //     writeln('final class ${s.c} extends Opaque {}');
  //     writeln();
  //     return;
  //   }

  //   writeln('final class ${s.c} extends Struct {');

  //   for (final f in fields) {
  //     switch (f.kind) {
  //       case CharArrayField(:final length):
  //         padln('@Array($length)');
  //         padln('external Array<Char> ${f.name};');

  //       case IntArrayField(:final ffiType, :final length):
  //         padln('@Array($length)');
  //         padln('external Array<$ffiType> ${f.name};');

  //       case FloatArrayField(:final ffiType, :final length):
  //         padln('@Array($length)');
  //         padln('external Array<$ffiType> ${f.name};');

  //       case PrimitiveField(:final ffiType, :final dartType):
  //         padln('@$ffiType()');
  //         padln('external $dartType ${f.name};');

  //       case StructValueField(:final cType):
  //         padln('external $cType ${f.name};');

  //       case StructPointerField(:final cType):
  //         padln('// CODEGEN: ambiguous pointer - verify single vs array');
  //         padln('external Pointer<$cType> ${f.name};');

  //       case PrimitivePointerField(:final ffiType):
  //         padln('// CODEGEN: ambiguous pointer - verify single vs array');
  //         padln('external Pointer<$ffiType> ${f.name};');
  //     }
  //     writeln();
  //   }

  //   writeln('}');
  //   writeln();
  // }

  void _writeCLikeExt() {
    final arrayFields = fields.where((f) =>
      f.kind is CharArrayField        ||
      f.kind is IntArrayField         ||
      f.kind is FloatArrayField       ||
      f.kind is PrimitivePointerField
    ).toList();

    if (arrayFields.isEmpty) return;

    writeln('extension ${c}Like on $c {');
    for (final f in arrayFields) {
      if (f.kind is PrimitivePointerField) {
        padln('// TODO: implement this please');
      }

      final length = switch (f.kind) {
        CharArrayField(:final length)  => length,
        IntArrayField(:final length)   => length,
        FloatArrayField(:final length) => length,
        _                              => 0,
      };
      padln('int get ${f.name}Length => $length;');

      if (f.kind is CharArrayField) {
        padln('String get ${f.name}String => ${f.name}.toD(${f.name}Length);');
      }
    }
    writeln('}');
    writeln();
  }

  void _writeDLikeExt() {
    final arrayFields = fields.where((f) =>
      f.kind is CharArrayField        ||
      f.kind is IntArrayField         ||
      f.kind is FloatArrayField       ||
      f.kind is PrimitivePointerField
    ).toList();

    if (arrayFields.isEmpty) return;

    writeln('extension ${d}Like on $d {');
    for (final f in arrayFields) {
      if (f.kind is PrimitivePointerField) {
        padln('// TODO: implement this please');
      }

      final length = switch (f.kind) {
        CharArrayField(:final length)  => length,
        IntArrayField(:final length)   => length,
        FloatArrayField(:final length) => length,
        _                              => 0,
      };
      padln('int get ${f.name}Length => $length;');
    }
    writeln('}');
    writeln();
  }

  void _writeCEx() {
    writeln('extension ${name}CEx on $c {');

    // setC
    padln('$c setC($c o) {');
    for (final f in fields) {
      _writeCExSetCField(f);
    }
    pad2ln('return this;');
    padln('}');
    writeln();

    // setD
    padln('$c setD($d o) {');
    for (final f in fields) {
      _writeCExSetDField(f);
    }
    pad2ln('return this;');
    padln('}');
    writeln();

    // toD
    padln('$d toD([Pointer<$c>? ptr]) => .new(');
    pad2ln('originalPointer: ptr,');
    for (final f in fields) {
      _writeCExToDField(f);
    }
    padln(');');

    writeln('}');
    writeln();
  }

  void _writeCExSetCField(ResolvedField f) {
    switch (f.kind) {
      case EnumField():
        pad2ln('${f.name}AsInt = o.${f.name}.value;');
      case CharArrayField():
        pad2ln('${f.name} = o.${f.name};');
      case IntArrayField(:final length) || FloatArrayField(:final length):
        pad2ln('for (int i = 0; i < $length; i++) ${f.name}[i] = o.${f.name}[i];');
      case PrimitiveField():
        pad2ln('${f.name} = o.${f.name};');
      case StructValueField():
        pad2ln('${f.name}.setC(o.${f.name});');
      case StructPointerField() || PrimitivePointerField():
        pad2ln('${f.name} = o.${f.name};');
    }
  }

  void _writeCExSetDField(ResolvedField f) {
    switch (f.kind) {
      case EnumField():
        pad2ln('${f.name}AsInt = o.${f.name}.value;');
      case CharArrayField():
        pad2ln('o.onOriginalPointer((p) => ${f.name} = p.ref.${f.name});');
      case IntArrayField(:final length) || FloatArrayField(:final length):
        pad2ln('for (int i = 0; i < $length; i++) ${f.name}[i] = o.${f.name}[i];');
      case PrimitiveField():
        pad2ln('${f.name} = o.${f.name};');
      case StructValueField():
        pad2ln('${f.name}.setD(o.${f.name});');
      case StructPointerField() || PrimitivePointerField():
        pad2ln('o.onOriginalPointer((p) => ${f.name} = p.ref.${f.name});');
    }
  }

  void _writeCExToDField(ResolvedField f) {
    switch (f.kind) {
      case EnumField():
        pad2ln('${f.name}: ${f.name},');
      case CharArrayField():
        pad2ln('${f.name}: ${f.name}.toD(${f.name}Length),');
      case IntArrayField(:final length) || FloatArrayField(:final length):
        pad2ln('${f.name}: .generate($length, (i) => ${f.name}[i]),');
      case PrimitiveField():
        pad2ln('${f.name}: ${f.name},');
      case StructValueField():
        pad2ln('${f.name}: ${f.name}.toD(),');
      case StructPointerField():
        pad2ln('${f.name}: ${f.name} != nullptr ? ${f.name}.ref.toD(${f.name}) : null,');
      case PrimitivePointerField(:final ffiType):
        pad2ln('${f.name}: ${f.name}.cast<$ffiType>().asTypedList(ptr?.ref.${f.name}Length ?? ${f.name}Length).toList(),');
    }
  }

  void _writeCPEx() {
    writeln('extension ${c}PEx on Pointer<$c> {');
    padln('Pointer<$c> setC($c o) { ref.setC(o); return this; }');
    padln('Pointer<$c> setD($d o) { ref.setD(o); return this; }');
    padln('$d toD() => ref.toD(this);');
    writeln('}');
    writeln();
  }

  void _writeDClass() {
    writeln('class $d extends StructDLiteral<$d, $c> {');

    // fields
    for (final f in fields) {
      _writeDField(f);
    }
    writeln();

    // constructor
    padln('$d({');
    pad2ln('super.originalPointer,');
    fields.forEach(_writeDConstructorParam);
    pad('})');

    _writeDInitializers(fields);
    writeln();

    // zero factory
    padln('factory $d.zero() => .new();');
    writeln();

    // writeln(METHODS_TO_IMPLEMENT);

    // setC
    padln('@override');
    padln('$d setC($c o) {');
    fields.forEach(_writeDSetCField);
    pad2ln('return this;');
    padln('}');
    writeln();

    // setD
    padln('@override');
    padln('$d setD($d o) {');
    pad2ln('originalPointer ??= o.originalPointer;');
    fields.forEach(_writeDSetDField);
    pad2ln('return this;');
    padln('}');
    writeln();

    // allocatePointer
    padln('@override');
    padln('Pointer<$c> allocatePointer(RaylibTemp temp, String key, [int count = 1])');
    pad2ln('=> temp.allocStruct<$c, $d>(\'$tempKey\').At(key, count);');
    writeln();

    // allocateInto
    padln('@override');
    padln('void allocateInto(RaylibTemp temp, Pointer<$c> p, String key)');
    pad2ln('=> writeInto(p.ref);');
    writeln();
    
    // writeInto
    padln('@override');
    padln('void writeInto($c p) {');
    fields.forEach(_writeDWriteIntoField);
    padln('}');
    writeln();

    // signature
    padln('@override');
    pad('String signature() => \'$name(');
    final sigParts = fields.map((f) => '${f.name}: \$${f.name}').join(', ');
    write(sigParts);
    writeln(")';");
    writeln();

    // clone
    padln('@override');
    padln('$d clone() => .new(');
    pad2ln('originalPointer: originalPointer,');
    fields.forEach(_writeDCloneField);
    padln(');');

    writeln('}');
    writeln();
  }

  void _writeDField(ResolvedField f) {
    switch (f.kind) {
      case EnumField(:final value):
        padln('${value.name} ${f.name};');
      case CharArrayField():
        padln('String ${f.name};');
      case IntArrayField():
        padln('late List<int> ${f.name};');
      case FloatArrayField():
        padln('late List<double> ${f.name};');
      case PrimitiveField(:final dartType):
        padln('$dartType ${f.name};');
      case StructValueField(:final dType):
        padln('$dType ${f.name};');
      case StructPointerField(:final dType):
        padln('$dType? ${f.name};');
      case PrimitivePointerField(:final dartType):
        padln('List<$dartType> ${f.name};');
    }
  }

  void _writeDConstructorParam(ResolvedField f) {
    switch (f.kind) {
      case EnumField(:final value):
        pad2ln('this.${f.name} = .${value.values.first.name},');
      case CharArrayField():
        pad2ln('this.${f.name} = \'\',');
      case IntArrayField() || FloatArrayField():
        // handled in initializer list
        final dartType = f.kind is FloatArrayField ? 'List<double>' : 'List<int>';
        pad2ln('$dartType? ${f.name},');
      case PrimitiveField(:final dartType):
        final zero = dartType == 'double' ? '0.0' : dartType == 'bool' ? 'false' : '0';
        pad2ln('this.${f.name} = $zero,');
      case StructValueField(:final dType):
        pad2ln('$dType? ${f.name},');
      case StructPointerField():
        pad2ln('this.${f.name},');
      case PrimitivePointerField(:final dartType):
        pad2ln('List<$dartType>? ${f.name},');
    }
  }

  void _writeDInitializers(List<ResolvedField> fields) {
    final listFields = fields.where((f) =>
      f.kind is IntArrayField         ||
      f.kind is FloatArrayField       ||
      f.kind is StructValueField      ||
      f.kind is PrimitivePointerField
    ).toList();

    if (listFields.isNotEmpty) {
      writeln(' :');
      for (final (i, f) in listFields.indexed) {
        switch (f.kind) {
          case IntArrayField(:final length):
            pad2('${f.name} = ${f.name} ?? .filled($length, \'0\')');
          case FloatArrayField(:final length):
            pad2('${f.name} = ${f.name} ?? .filled($length, \'0.0\')');
          case StructValueField():
            pad2('${f.name} = ${f.name} ?? .zero()');
          case PrimitivePointerField():
            pad2('${f.name} = ${f.name} ?? []');
          default: continue;
        }

        if (i < listFields.length - 1) writeln(',');
        if (i == listFields.length - 1) writeln(';');
      }
    } else {
      writeln(';');
    }
  }

  void _writeDSetCField(ResolvedField f) {
    switch (f.kind) {
      case EnumField():
        pad2ln('${f.name} = o.${f.name};');
      case CharArrayField():
        pad2ln('${f.name} = o.${f.name}.toD(${f.name}Length);');
      case IntArrayField(:final length) || FloatArrayField(:final length):
        pad2ln('${f.name} = .generate($length, (i) => o.${f.name}[i]);');
      case PrimitiveField():
        pad2ln('${f.name} = o.${f.name};');
      case StructValueField():
        pad2ln('${f.name}.setC(o.${f.name});');
      case StructPointerField():
        pad2ln('onOriginalPointer((p) { ${f.name} = o.${f.name} != nullptr ? o.${f.name}.ref.toD(o.${f.name}) : null; });');
      case PrimitivePointerField(:final ffiType):
        pad2ln('onOriginalPointer((p) => p.ref.${f.name} = o.${f.name});');
        pad2ln('${f.name} = o.${f.name}.address != 0 ? o.${f.name}.cast<$ffiType>().asTypedList(${f.name}Length).toList() : [];');
    }
  }

  void _writeDSetDField(ResolvedField f) {
    switch (f.kind) {
      case EnumField():
        pad2ln('${f.name} = o.${f.name};');
      case CharArrayField():
        pad2ln('${f.name} = o.${f.name};');
      case IntArrayField() || FloatArrayField():
        pad2ln('${f.name} = .from(o.${f.name});');
      case PrimitiveField():
        pad2ln('${f.name} = o.${f.name};');
      case StructValueField():
        pad2ln('${f.name}.setD(o.${f.name});');
      case StructPointerField():
        pad2ln('onOriginalPointer((p) { ${f.name} = o.${f.name}; });');
      case PrimitivePointerField():
        pad2ln('${f.name} = .from(o.${f.name});');
    }
  }

  void _writeDWriteIntoField(ResolvedField f) {
    switch (f.kind) {
      case EnumField():
        pad2ln('p.${f.name}AsInt = ${f.name}.value;');
      case CharArrayField():
        pad2ln('p.${f.name}.setString(${f.name}, ${f.name}Length);');
      case IntArrayField(:final length) || FloatArrayField(:final length):
        pad2ln('for (int i = 0; i < $length; i++) p.${f.name}[i] = ${f.name}[i];');
      case PrimitiveField():
        pad2ln('p.${f.name} = ${f.name};');
      case StructValueField():
        pad2ln('${f.name}.writeInto(p.${f.name});');
      case StructPointerField():
        pad2ln('p.${f.name} = ${f.name}?.originalPointer ?? nullptr;');
      case PrimitivePointerField(:final ffiType):
        pad2ln('if (p.${f.name}.address != 0 && ${f.name}.isNotEmpty) {');
        pad2ln('  assert(p.${f.name}Length <= ${f.name}.length);');
        pad2ln('  final ${f.name}Ptr = p.${f.name}.cast<$ffiType>();');
        pad2ln('  for (int i = 0; i < p.${f.name}Length; i++) {');
        pad2ln('    ${f.name}Ptr[i] = ${f.name}[i];');
        pad2ln('  }');
        pad2ln('}');
    }
  }

  void _writeDCloneField(ResolvedField f) {
    switch (f.kind) {
      case EnumField():
        pad2ln('${f.name}: ${f.name},');
      case CharArrayField():
        pad2ln('${f.name}: ${f.name},');
      case IntArrayField() || FloatArrayField():
        pad2ln('${f.name}: .from(${f.name}),');
      case PrimitiveField():
        pad2ln('${f.name}: ${f.name},');
      case StructValueField():
        pad2ln('${f.name}: ${f.name}.clone(),');
      case StructPointerField():
        pad2ln('${f.name}: ${f.name},');
      case PrimitivePointerField():
        pad2ln('${f.name}: .from(${f.name}),');
    }
  }

  void _writeTempRegistration() {
    writeln('void register$c(Raylib rl) {');
    
    padln('String name = \'$tempKey\';');
    padln('final alloc = RTempStructAlloc<$c, $d>(rl.Temp, name,');
    padln('  allocatorFunc:        ([count = 1]) => calloc<$c>(count),');
    padln('  sizeOfFunc:           ()            => sizeOf<$c>(),');
    padln('  castFunc:             (ptr)         => ptr.cast<$c>(),');
    padln('  printerFunc:          (ptr)         => ptr.toD().signature(),');
    padln('  indexerFunc:          (ptr, i)      => ptr[i],');
    padln('  writeIntoFunc:        (ptr, v)      => v.writeInto(ptr.ref),');
    padln('  writeIntoIndexedFunc: (ptr, i, v)   => v.writeInto((ptr + i).ref),');
    padln('  setCFunc:             (ptr, i, v)   => ptr[i].setC(v),');
    padln('  indexSetterFunc:      (ptr, i, v)   => ptr[i] = v,');
    padln(');');
    writeln();
    
    padln('rl.Temp.registerAllocator(name, alloc);');
    writeln();

    padln('name = \'$ptrTempKey\';');
    padln('final allocPtr = RTempStructPtrAlloc<$c, $d>(rl.Temp, name,');
    padln('  allocatorFunc:   ([count = 1]) => calloc<${struct.ptr}>(count),');
    padln('  printerFunc:     (ptr) => \'We can\\\'t print ${struct.ptrPtr} at this level\',');
    padln('  valueFunc:       alloc.Value,');
    padln('  rawArrayFunc:    alloc.RawArray,');
    padln('  indexSetterFunc: (ptr, i, value) => ptr[i] = value,');
    padln(');');
    writeln();
    
    padln('rl.Temp.registerAllocator(name, allocPtr);');
    
    writeln('}');
    writeln();
  }
  
  void _writeTempExtension() {
    writeln('extension ${name}TempGetter on RaylibTemp {');
    writeln();

    padln('RTempStructAlloc<$c, $d> get $tempVar => allocStruct(\'$tempKey\');');
    writeln();
    padln('RTempStructPtrAlloc<$c, $d> get $ptrTempVar => allocStructPtr(\'$ptrTempKey\');');
    writeln();

    writeln('}');
    writeln();
  }
}

class StructGenerator extends Writable {
  final TypeResolver resolver;

  late StructWriter structWriter;

  StructGenerator(this.resolver) {
    structWriter = StructWriter(this);
  }

  // Public entry point - returns generated source for [structs].
  String generate(List<RaylibApiStruct> structs) => writeIsolated(() {
    _writeHeader();
    write(structs.map(structWriter.writeStruct).join('\n'));
  });

  // Generate a single struct and return its source (useful for per-file mode).
  String generateOne(RaylibApiStruct s) => writeIsolated(() {
    write(structWriter.writeStruct(s));
  });

  void _writeHeader() {
    writeln('// GENERATED FILE - do not edit by hand.');
    writeln('// ignore_for_file: non_constant_identifier_names');
    writeln();
    writeln("import 'dart:ffi';");
    writeln("import 'package:ffi/ffi.dart';");
    writeln("import '../base.dart';");
    writeln();
  }

  List<ResolvedField> _resolveFields(RaylibApiStruct s) {
    final result = <ResolvedField>[];

    for (final f in s.fields) {
      result.add(ResolvedField(f.name, _resolveKind(f.type, f.name)));
    }

    return result;
  }

  FieldKind _resolveKind(String cType, String fieldName) {
    // char array > String
    final charArrMatch = RegExp(r'^char\s*\[(\d+)\]$').firstMatch(cType.trim());
    if (charArrMatch != null) {
      return CharArrayField(int.parse(charArrMatch.group(1)!));
    }

    // fixed array of other types
    final arrMatch = RegExp(r'^(.+)\[(\d+)\]$').firstMatch(cType.trim());
    if (arrMatch != null) {
      final innerType = arrMatch.group(1)!.trim();
      final length    = int.parse(arrMatch.group(2)!);
      final parsed    = resolver.parseType(innerType);
      if (parsed == null) throw UnsupportedError('Unknown array inner type: $innerType');

      if (parsed.dartType == 'double') {
        return FloatArrayField(parsed.ffiType, 'double', length);
      }
      return IntArrayField(parsed.ffiType, parsed.dartType, length);
    }

    final ptrCount    = '*'.allMatches(cType).length;
    String strippedType = cType
      .replaceAll('*', '')
      .trim()
      .replaceAll('struct ', '');

    // struct pointer
    final struct = resolver.api.getStruct(strippedType);
    if (struct != null) {
      final cName = '${struct.name}C';
      final dName = '${struct.name}D';
      if (ptrCount > 0) {
        return StructPointerField(cName, dName);
      }
      return StructValueField(cName, dName);
    }

    final enum_ = resolver.api.getEnum(strippedType);
    if (enum_ != null) {
      return EnumField(enum_);
    }

    // primitive pointer
    if (ptrCount > 0) {
      final base = resolver.parseBaseType(strippedType);
      if (base == null) throw UnsupportedError('Unknown pointer base type: $strippedType');
      return PrimitivePointerField(base.ffiType, base.dartType);
    }

    // plain primitive
    final base = resolver.parseBaseType(cType);
    if (base == null) throw UnsupportedError('Unknown type: $cType');
    return PrimitiveField(base.dartType, base.ffiType);
  }
}