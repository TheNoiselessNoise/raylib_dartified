import 'dart:io';
import 'generators/api_xml_reader.dart';
import 'generators/web.dart';

void exportFunctionList(RaylibApiReaderResult api) {
  final modules = ['audio', 'camera', 'core', 'gui', 'light', 'rlgl'];

  StringBuffer sb = StringBuffer();

  sb.writeln('_UnloadImageColors');

  for (final module in modules) {
    final modulePath = '../lib/core/modules/dart/$module/module.dart';

    if (!File(modulePath).existsSync()) {
      print("Module '$module' does not exist, skipping...");
    }

    final gen = WebGenerator(api,
      inputPath: modulePath,
      libraryName: '_',
    );

    sb.write(gen.generateFunctionList());
  }

  File('./raylib_func_list.txt').writeAsStringSync(sb.toString());
}

void exportWebModules(RaylibApiReaderResult api) {
  final modules = ['audio', 'camera', 'core', 'gui', 'light', 'rlgl'];

  for (final module in modules) {
    final modulePath = '../lib/core/modules/c/$module/module.dart';

    if (!File(modulePath).existsSync()) {
      print("Module does not exist, skipping...");
      continue;
    }

    final gen = WebGenerator(api,
      inputPath: modulePath,
      libraryName: 'Raylib${module[0].toUpperCase()}${module.substring(1)}',
    );

    File('./output/web_module_$module.dart').writeAsStringSync(gen.generateWebModule());
  }
}

void main() {
  Directory.current = File(Platform.script.toFilePath()).parent;

  if (!Directory.current.path.endsWith('utils')) {
    print('Please, run this inside <root>/utils folder!');
    exit(1);
  }

  final api = RaylibApiReader('./resources/raylib_api.xml').result;
  // exportFunctionList(api);
  exportWebModules(api);

  // final gen = WebGenerator(api,
  //   inputPath: '../lib/core/modules/dart/core/module.dart',
  //   libraryName: 'RaylibCore',
  //   outputPath: null
  // );

  // final web = gen.generate();
  // File('')
}