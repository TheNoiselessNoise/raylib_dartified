import '../validators/base.dart';
import 'api_xml_reader.dart';
import 'base.dart';
import 'c2dart.dart';

class WebModuleVisitor extends RecursiveAstVisitor<void> {
  List<MethodDeclaration> methods = [];

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    methods.add(node);
    super.visitMethodDeclaration(node);
  }
}

class WebModuleWriter extends Writable {
  final WebGenerator generator;

  WebModuleWriter(this.generator);

  String get libraryName => generator.libraryName;

  String? typeToJs(String? type) {
    if (type == null) return 'void';
    // literal types
    final map = <String, String>{
      'void': 'void',
      'bool': 'number',
      'int': 'number',
      'double': 'number',
      'String': 'string',
    };
    if (map.containsKey(type)) return map[type]!;
    // structs
    if (type.endsWith('C')) {
      final structType = type.substring(0, type.length - 1);
      if (generator.api.getStruct(structType) != null) return 'number';
      if (generator.api.getCallback(structType) != null) return null;
    }
    // pointers
    if (type == 'Pointer') return null;
    if (type == 'Pointer<Char>') return 'string';
    if (type.contains('Pointer<')) return 'number';
    throw StateError('Unknown type \'$type\' for JavaScript type!');
  }

  (Map<String, String> types, bool simple) checkMethod(
    MethodDeclaration method,
  ) {
    final params = method.parameters;
    bool isSimple = true;
    final types = <String, String>{};
    if (params == null) return ({}, true);

    for (final param in params.parameters) {
      // Parameter name
      final name = param.name?.lexeme;

      // Parameter type — cast to the most common kind first
      if (param is SimpleFormalParameter) {
        final type = param.type; // TypeAnnotation?
        if (type is NamedType) {
          final typeName = type.name.lexeme; // e.g. "String"
          final typeArgs = type.typeArguments; // e.g. <int> in List<int>
          if (typeName == 'List') isSimple = false;
          if (typeArgs != null) isSimple = false;
          types[name!] = typeName == 'List'
              ? '$typeName[$typeArgs]'
              : param.type?.toSource() ?? typeName;
        } else {
          types[name!] = param.type?.toSource() ?? param.toSource();
        }
      } else {
        types[name!] = param.toSource();
      }

      // For function-typed params: void Function(int) callback
      // if (param is FunctionTypedFormalParameter) {
      //   final returnType = param.returnType;
      //   print('function-typed: $name, returnType: $returnType');
      // }
    }
    return (types, isSimple);
  }

  String generateFunctionList() => writeIsolated(() {
    writeln('_malloc');
    writeln('_free');

    final skip = <String>[
      'dispose',
      'rlColor',
      'rlGetPixelDataSize',
      'GetClipboardImage',
    ];

    for (final method in generator.visitor.methods) {
      if (skip.contains(method.name.lexeme)) continue;
      writeln('_${method.name.lexeme}');
    }
  });

  String generateWebModule() => writeIsolated(() {
    writeln("import 'dart:js_interop';");
    writeln("import 'package:raylib_dartified/raylib.dart';");
    writeln();

    writeln("@JS('Module')");
    writeln("external _EmscriptenModule get _module;");

    writeln(
      "extension type _EmscriptenModule._(JSObject _) implements JSObject {",
    );
    writeln(
      "  external JSFunction cwrap(JSString name, JSAny? returnType, JSArray argTypes);",
    );
    writeln(
      "  JSFunction dwrap(String name, [List<String> argTypes = const [], String? returnType]) {",
    );
    writeln("    return cwrap(name.toJS, returnType?.toJS, _args(argTypes));");
    writeln("  }");
    writeln("  JSArray<JSString> _args(List<String> types) {");
    writeln("    final arr = JSArray<JSString>();");
    writeln("    for (final t in types) {");
    writeln("      arr.add(t.toJS);");
    writeln("    }");
    writeln("    return arr;");
    writeln("  }");
    writeln("}");

    writeln("abstract class RaylibModule {");
    writeln("  Raylib rl;");
    writeln("  RaylibModule(this.rl);");
    writeln("}");
    writeln();

    writeln('class $libraryName extends RaylibModule {');
    writeln('  $libraryName(super.rl);');

    writeln();
    for (final method in generator.visitor.methods) {
      if (method.isGetter) continue;
      
      final name = method.name.lexeme;
      writeln('  late final JSFunction $name;');
    }

    writeln();
    writeln('  @override');
    writeln('  void _initialize() {');
    for (final method in generator.visitor.methods) {
      if (method.isGetter) continue;

      final name = method.name.lexeme;
      print('Generating $libraryName.$name');

      final returnType = typeToJs(method.returnType?.toSource());

      final (types, isSimple) = checkMethod(method);

      final shouldBeSkipped =
          returnType == null ||
          types.values.map(typeToJs).whereType<Null>().isNotEmpty;

      if (!isSimple || shouldBeSkipped) {
        writeln('    $name = _module.dwrap(\'$name\', /*$types*/);');
      } else {
        final args = types.values.map(typeToJs).map((t) => '"$t"').join(', ');

        if (returnType == 'void') {
          writeln('    $name = _module.dwrap(\'$name\', [$args]);');
        } else {
          writeln(
            '    $name = _module.dwrap(\'$name\', [$args], \'$returnType\');',
          );
        }
      }
    }
    writeln('  }');

    //   void InitWindow(int w, int h, String title) => _initWindow.execute(
    //     w.toJS,
    //     h.toJS,
    //     title.toJS,
    //   );

    //   void BeginDrawing() => _beginDrawing.execute();
    //   void EndDrawing() => _endDrawing.execute();

    //   void ClearBackground(ColorD color) => _clearBackground.execute(
    //     RaylibTemp.Color$.Ref1(color),
    //   );

    //   void DrawRectangle(
    //     double posX,
    //     double posY,
    //     double width,
    //     double height,
    //     ColorD color,
    //   ) => _drawRectangle.execute(
    //     posX.toJS,
    //     posY.toJS,
    //     width.toJS,
    //     height.toJS,
    //     RaylibTemp.Color$.Ref1(color),
    //   );

    //   void DrawText(String text, int x, int y, int fontSize, int r, int g, int b, int a) {
    //     final strPtr = mallocString(text);
    //     final colorPtr = mallocColor(r, g, b, a);
    //     _drawText.execute(strPtr.toJS, x.toJS, y.toJS, fontSize.toJS, colorPtr.toJS);
    //     free(strPtr);
    //     free(colorPtr);
    //   }
    writeln('}');
  });
}

class WebGenerator extends Writable {
  final RaylibApiReaderResult api;
  final String inputPath;
  final String? outputPath;
  final String libraryName;

  late WebModuleVisitor visitor;
  late C2DartWriter writer;

  late final WebModuleWriter webModuleWriter;

  WebGenerator(
    this.api, {
    required this.inputPath,
    this.outputPath,
    required this.libraryName,
  }) {
    visitor = .new();
    webModuleWriter = .new(this);
    validateFile(inputPath, [visitor]);
  }

  String generateFunctionList() => webModuleWriter.generateFunctionList();
  String generateWebModule() => webModuleWriter.generateWebModule();
}
