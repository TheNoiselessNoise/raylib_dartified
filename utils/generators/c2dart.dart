import 'dart:io';
import 'base.dart';
import 'package:ffigen/src/logger.dart';
import 'package:ffigen/src/context.dart';
import 'package:ffigen/src/config_provider.dart';
import 'package:ffigen/src/header_parser/parser.dart';
import 'package:ffigen/src/code_generator.dart';
import 'package:ffigen/src/code_generator/utils.dart';
import 'package:ffigen/src/visitor/ast.dart';

class C2DartPadInfo {
  final String ch;
  final int count;

  const C2DartPadInfo(this.ch, this.count);

  String string() => ch * count;
}

abstract class C2DartVisitor extends Visitation {
  late C2DartWriter writer;
  Context get context => writer.context;
  void reset() {}
}

class C2DartWriteOptions {
  final String libraryName;

  C2DartWriteOptions({
    required this.libraryName,
  });

  factory C2DartWriteOptions.empty() => C2DartWriteOptions(
    libraryName: 'UnknownLibrary',
  );
}

abstract class C2DartWriter<V extends C2DartVisitor> extends Writable {
  final Library library;
  final V visitor;
  final FfiGenerator generator;
  final C2DartWriteOptions options;
  final bool importFFIAsAlias;

  Context get context => library.context;

  C2DartWriter({
    required this.library,
    required this.visitor,
    required this.generator,
    required this.options,
    this.importFFIAsAlias = false,
  }) { visitor.writer = this; }

  void _visit({bool debug = false}) {
    visitor.reset();
    Visitor(library.context, visitor, debug: debug).visitAll(library.bindings);
  }

  // NOTE: it seems that stringify into FFI binding
  //       is not so easy, so let's keep ffigen's way for now
  String getNodeDartCode(Binding node) => node.toBindingString(library.writer).string;

  String writeBindings(List<Binding> bindings)
    => writeIsolated(() => write(bindings.map(getNodeDartCode).join('\n')));

  String writeContent();
}

class C2DartDummyVisitor extends C2DartVisitor {
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
  void visitMacroConstant(MacroConstant node) => macroConstants.add(node);

  @override
  void visitStruct(Struct node) => structs.add(node);

  @override
  void visitEnumClass(EnumClass node) => enums.add(node);

  @override
  void visitFunc(Func node) => funcs.add(node);

  @override
  void visitTypealias(Typealias node) => typeAliases.add(node);
}

class C2DartDummyWriter<V extends C2DartVisitor> extends C2DartWriter<V> {
  C2DartDummyWriter({
    required super.library,
    required super.visitor,
    required super.generator,
    required super.options,
    required super.importFFIAsAlias,
  });

  @override
  String writeContent() => '';
}

typedef C2DartWriterConstructor<V extends C2DartVisitor> = C2DartWriter<V> Function({
  required Library library,
  required V visitor,
  required FfiGenerator generator,
  required C2DartWriteOptions options,
  required bool importFFIAsAlias,
});

typedef C2DartVisitorConstructor<V extends C2DartVisitor> = V Function();

class C2Dart<V extends C2DartVisitor> {
  final C2DartWriterConstructor<V> c2DartWriter;
  final C2DartVisitorConstructor c2DartVisitor;
  final bool importFFIAsAlias;
  final Uri outputDartFile;
  final List<Uri> entryPoints;
  final List<String> compilerOptions;
  final C2DartWriteOptions writerOptions;
  final bool formatDartFile;

  C2Dart({
    C2DartWriterConstructor<V>? c2DartWriter,
    C2DartVisitorConstructor? c2DartVisitor,
    this.importFFIAsAlias = false,
    required this.outputDartFile,
    required this.entryPoints,
    required this.compilerOptions,
    C2DartWriteOptions? writerOptions,
    this.formatDartFile = true,
  }) :
    writerOptions = writerOptions ?? .empty(),
    c2DartWriter = c2DartWriter ?? C2DartDummyWriter<V>.new,
    c2DartVisitor = c2DartVisitor ?? C2DartDummyVisitor.new
  { _init(); }

  late FfiGenerator generator;
  late Context context;
  late V visitor;
  late C2DartWriter<V> writer;

  void _init() {
    generator = .new(
      output: .new(
        // NOTE: is not used when using our custom Writer
        dartFile: outputDartFile,
        format: formatDartFile,

        // NOTE: keep DynamicLibraryBindings
        style: DynamicLibraryBindings(
          wrapperName: writerOptions.libraryName,
        ),
      ),
      headers: .new(
        entryPoints: entryPoints,
        compilerOptions: compilerOptions,
      ),
      typedefs: .includeAll,
      functions: .includeAll,
      globals: .includeAll,
      macros: .includeAll,
      structs: .includeAll,
      enums: .includeAll,
      unions: .includeAll,
      unnamedEnums: .includeAll,
    );

    context = .new(createDefaultLogger(), Config(generator));

    visitor = c2DartVisitor() as V;

    writer = c2DartWriter(
      library: parse(context),
      visitor: visitor,
      generator: generator,
      options: writerOptions,
      importFFIAsAlias: importFFIAsAlias,
    );
  }

  void collect() => writer._visit();

  Future<void> writeOutput({bool format = false}) async {
    await File(outputDartFile.toFilePath()).writeAsString(writer.writeContent());
    if (format) await this.format(outputDartFile.toFilePath());
  }

  Future<void> format(String outputPath) async {
    final file = File(outputPath);
    // NOTE: stolen from ffigen
    final result = await Process.run(dartExecutable, [
      'format',
      file.absolute.path,
    ], workingDirectory: file.parent.absolute.path);
    if (result.exitCode != 0) {
      context.logger.severe('Formatting failed\n${result.stdout}\n${result.stderr}');
    }
  }
}

class C2DartDummy extends C2Dart<C2DartDummyVisitor> {
  C2DartDummy({
    super.c2DartWriter,
    super.c2DartVisitor,
    super.importFFIAsAlias = false,
    required super.outputDartFile,
    required super.entryPoints,
    required super.compilerOptions,
    super.writerOptions,
    super.formatDartFile = true,
  });
}