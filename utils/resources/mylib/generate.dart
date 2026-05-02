import 'dart:io';
import '../../generators/api_xml_reader.dart';
import '../../generators/module.dart';

void main() async {
  Directory.current = File(Platform.script.toFilePath()).parent;

  // purely for checking unique Struct names for collisions of existing Raylib structs
  final api = RaylibApiReader('../raylib_api.xml').result;
  // you can do empty one
  // final api = RaylibApiReaderResult();

  final g = ModuleGenerator(api,
    libraryName: 'MyModule',
    inputPath: Uri(path: './src'),
  );

  final cModule = g.generateCModule();
  final cModuleOutputPath = './output/generated_c_module.dart';
  await File(cModuleOutputPath).writeAsString(cModule);
  await g.c2Dart.format(cModuleOutputPath);

  final dartModule = g.generateDartModule();
  final dartModuleOutputPath = './output/generated_d_module.dart';
  await File(dartModuleOutputPath).writeAsString(dartModule);
}