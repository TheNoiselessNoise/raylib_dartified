import 'dart:io';
import '_log.dart';
import '_paths.dart';
import 'package:args/args.dart';
import 'package:path/path.dart' as p;
import 'assets/html_index.dart' as html_index show template;
import 'assets/raylib_func_lists.dart' show
  EmscriptenFuncList, // core
  AudioFuncList, // core
  CameraFuncList, // core
  CoreFuncList, // core
  GuiFuncList,
  LightFuncList, // core
  MsfGifFuncList,
  RlglFuncList, // core
  MatrixExtFuncList, // core
  QuaternionExtFuncList, // core
  Vector2ExtFuncList, // core
  Vector3ExtFuncList, // core
  Vector4ExtFuncList; // core
import 'assets/raylib_c.dart' show
  headerTemplate, // core
  CoreTemplate, // core
  GuiTemplate,
  MsfGifTemplate;
import 'package:raylib_dartified_base/raylib_dartified_base.dart' show RaylibSupportedLibs;

// NOTE: for building final `.c` entry file for compilation from selected modules
final Map<RaylibSupportedLibs, String> entryTemplates = {
  .raylib: <String>[
    headerTemplate,
    CoreTemplate
  ].join(),
  .raygui: GuiTemplate,
  .msf_gif: MsfGifTemplate,
};

// NOTE: for building final function list for `EXPORTED_FUNCTIONS` from selected modules
final Map<RaylibSupportedLibs, String> funcListTemplates = {
  .raylib: <String>[
    // modules
    EmscriptenFuncList,
    AudioFuncList,
    CameraFuncList,
    CoreFuncList,
    LightFuncList,
    RlglFuncList,

    // extensions
    MatrixExtFuncList,
    QuaternionExtFuncList,
    Vector2ExtFuncList,
    Vector3ExtFuncList,
    Vector4ExtFuncList,
  ].join(),
  .raygui: GuiFuncList,
  .msf_gif: MsfGifFuncList,
};

final cwd = Directory.current;
final buildDir = Directory(p.join(cwd.path, 'build'));

final _builtinRaylibC = File(p.join(packageRoot.path, 'raylib.c'));
final _builtinFuncList = File(p.join(packageRoot.path, 'raylib_func_list.txt'));

const String FLAG_HELP = 'help';
const String OPT_ENTRY = 'entry';
const String OPT_RAYLIB_C = 'raylib-c';
const String OPT_RAYLIB_FUNC_LIST = 'raylib-func-list';
const String OPT_RAYLIB_MODULES = 'raylib-module';
const String OPT_INCLUDE_ALL_RAYLIB_MODULES = 'include-all-raylib-modules';
const String OPT_RESOURCES = 'raylib-resources';
const String OPT_EMCC_SETTING = 'emcc-setting';
const String OPT_EMCC_ARG = 'emcc-arg';

const defaultEmccSettings = <String, String>{
  'STACK_SIZE': '1048576',
  'USE_GLFW': '3',
  'ALLOW_MEMORY_GROWTH': '1',
  'ALLOW_TABLE_GROWTH': '1',
  'FULL_ES3': '1',
  'MAX_WEBGL_VERSION': '2',
  'MIN_WEBGL_VERSION': '2',
};

const defaultExportedRuntimeMethods = <String>[
  'wasmExports', 'wasmTable', 'cwrap', 'ccall',
  'UTF8ToString', 'stringToUTF8', 'lengthBytesUTF8',
  'addFunction', 'removeFunction',
  'HEAP8', 'HEAPU8', 'HEAP16', 'HEAPU16',
  'HEAP32', 'HEAPU32', 'HEAP64', 'HEAPU64',
  'HEAPF32', 'HEAPF64',
];

ArgParser setupParser(List<String> args) {
  final parser = ArgParser(allowTrailingOptions: true);

  parser.addFlag(FLAG_HELP, abbr: 'h', help: 'Displays the usage of this tool.', hideNegatedUsage: true);
  parser.addOption(OPT_ENTRY, valueHelp: 'path', help: 'Path to dart file to compile', mandatory: true);

  parser.addSeparator('OPTIONS');

  parser.addOption(OPT_RAYLIB_C, valueHelp: 'path', help: 'Path to custom raylib.c (default: package builtin)');
  parser.addOption(OPT_RAYLIB_FUNC_LIST, valueHelp: 'path', help: 'Path to custom raylib function list file (default: package builtin)');
  parser.addMultiOption(OPT_RAYLIB_MODULES, valueHelp: 'name', help: 'What optional modules to include',
    allowed: RaylibSupportedLibs.values.map((e) => e.id).skip(1), // don't include the "core"
  );
  parser.addFlag(OPT_INCLUDE_ALL_RAYLIB_MODULES, abbr: 'a', help: 'Includes all supported modules.', defaultsTo: false);
  parser.addOption(OPT_RESOURCES, valueHelp: 'path', help: 'Path to resources/ directory (default: ./resources)');

  parser.addSeparator('ADVANCED');

  parser.addMultiOption(
    OPT_EMCC_SETTING,
    valueHelp: 'KEY=VALUE',
    help: 'Extra emcc -s KEY=VALUE setting (repeatable). Overrides a built-in\n'
        'default of the same KEY, e.g. --emcc-setting=INITIAL_MEMORY=64MB',
  );
  parser.addMultiOption(
    OPT_EMCC_ARG,
    valueHelp: 'arg',
    help: 'Extra raw emcc argument (repeatable), appended just before -o,\n'
        'e.g. --emcc-arg=-O3 --emcc-arg=-g3',
  );

  return parser;
}

Future<void> main(List<String> args) async {
  final parser = setupParser(args);

  logBanner('raylib_dartified_web / BUILD');

  final parsedArgs = parser.parse(args);

  if (args.isEmpty || parsedArgs.flag(FLAG_HELP)) {
    print(parser.usage);
    exit(1);
  }

  final entryPoint = File(parsedArgs.option(OPT_ENTRY)!);
  if (!entryPoint.existsSync()) {
    logDie('Entry point not found: ${parsedArgs.option(OPT_ENTRY)}');
  }

  File? raylibC;
  File? raylibFuncList;
  Directory? resourcesDir;

  final raylibCPath = parsedArgs.option(OPT_RAYLIB_C);
  if (raylibCPath != null) {
    raylibC = File(raylibCPath);
    if (!raylibC.existsSync()) logDie('$raylibCPath is not a valid raylib.c path');
  }

  final raylibFuncListPath = parsedArgs.option(OPT_RAYLIB_FUNC_LIST);
  if (raylibFuncListPath != null) {
    raylibFuncList = File(raylibFuncListPath);
    if (!raylibFuncList.existsSync()) logDie('$raylibFuncListPath is not a valid function list path');
  }

  final resourcesDirPath = parsedArgs.option(OPT_RESOURCES);
  if (resourcesDirPath != null) {
    resourcesDir = Directory(resourcesDirPath);
    if (!resourcesDir.existsSync()) logDie('$resourcesDirPath is not a valid resources/ path');
  }

  final emccSettings = _parseEmccSettings(parsedArgs.multiOption(OPT_EMCC_SETTING));
  final emccExtraArgs = parsedArgs.multiOption(OPT_EMCC_ARG);

  final includeAllModules = parsedArgs.flag(OPT_INCLUDE_ALL_RAYLIB_MODULES);
  final raylibOptionalModules = parsedArgs.multiOption(OPT_RAYLIB_MODULES);

  final allowedModules = includeAllModules
    ? RaylibSupportedLibs.values.skip(1) // don't include the "core"
    : raylibOptionalModules.map(RaylibSupportedLibs.byId);

  if (raylibC == null) {
    String entry = entryTemplates[RaylibSupportedLibs.raylib]!;
    allowedModules.forEach((m) => entry += entryTemplates[m]!);
    _builtinRaylibC.writeAsStringSync(entry);
  }

  if (raylibFuncList == null) {
    String funcList = funcListTemplates[RaylibSupportedLibs.raylib]!;
    allowedModules.forEach((m) => funcList += funcListTemplates[m]!);
    _builtinFuncList.writeAsStringSync(funcList);
  }

  _checkEnv();
  _checkSetupDone();
  await _prepareBuildDir();

  await _emccLink(
    raylibC: raylibC ?? _builtinRaylibC,
    raylibFuncList: raylibFuncList ?? _builtinFuncList,
    resourcesDir: resourcesDir ?? Directory(p.join(cwd.path, 'resources')),
    buildDir: buildDir,
    extraSettings: emccSettings,
    extraArgs: emccExtraArgs,
  );

  if (raylibC == null) _builtinRaylibC.deleteSync();
  if (raylibFuncList == null) _builtinFuncList.deleteSync();

  await _dartCompile(entryPoint: entryPoint, buildDir: buildDir);

  _buildHtmlTemplate(buildDir: buildDir);

  final originalRaylibHTML = File(p.join(buildDir.path, 'raylib.html'));
  if (originalRaylibHTML.existsSync()) {
    originalRaylibHTML.deleteSync();
  }

  logOk('Build complete: ${buildDir.path}${p.separator}');
}

/// Parses repeated --emcc-setting KEY=VALUE args into a map. Later
/// duplicates of the same KEY win, same as command-line order would suggest.
Map<String, String> _parseEmccSettings(List<String> raw) {
  final settings = <String, String>{};
  for (final entry in raw) {
    final idx = entry.indexOf('=');
    if (idx <= 0) {
      logDie('--$OPT_EMCC_SETTING expects KEY=VALUE, got "$entry"');
    }
    settings[entry.substring(0, idx)] = entry.substring(idx + 1);
  }
  return settings;
}

void _checkEnv() {
  logStep('Checking environment');

  logRequireEnv('EMSDK', () => logDie(
    'EMSDK environment variable is not set.\n'
    '  Source emscripten first:\n'
    '${_emsdkSourceHint()}',
  ));
  logRequireTool('emcc');
  logRequireTool('dart');
}

String _emsdkSourceHint() {
  if (Platform.isWindows) {
    return '    cmd:        %EMSDK%\\emsdk_env.bat\n'
           '    powershell: & "\$env:EMSDK\\emsdk_env.bat"';
  }
  return '    source \$EMSDK/emsdk_env.sh';
}

void _checkSetupDone() {
  logStep('Checking raylib build');

  if (!raylibLibDir.existsSync()) {
    logDie(
      'raylib does not appear to be built yet.\n'
      '  Run setup first:  dart run raylib_dartified_web:setup',
    );
  }

  logOk(raylibLibDir.path);
}

Future<void> _prepareBuildDir() async {
  logStep('Preparing build/ directory');
  buildDir.createSync(recursive: true);
  logOk(buildDir.path);
}

Future<void> _emccLink({
  required File raylibC,
  required Directory resourcesDir,
  File? raylibFuncList,
  required Directory buildDir,
  required Map<String, String> extraSettings,
  required List<String> extraArgs,
}) async {
  logStep('Linking with emcc');

  final raylibInclude = p.join(raylibSrc.path, 'src');
  final rayguiInclude = p.join(rayguiSrc.path, 'src');

  final hasResources = resourcesDir.existsSync();
  if (!hasResources) {
    logWarn('resources/ not found, skipping --preload-file');
  }

  if (raylibFuncList == null) {
    logWarn('raylib_func_list.txt not found, skipping EXPORTED_FUNCTIONS');
  }

  final outputHtml = p.join(buildDir.path, 'raylib.html');

  // emcc expects forward slashes on all platforms
  String toEmccPath(String path) => path.replaceAll(r'\', '/');

  // Defaults required to make raylib run on WASM at all, in the order emcc
  // will see them. --emcc-setting=KEY=VALUE (extraSettings) can override any
  // of these, or add settings this file has never heard of.
  final settings = <String, String>{
    ...defaultEmccSettings,
    ...extraSettings,
  };

  if (extraSettings.isNotEmpty) {
    final pretty = extraSettings.entries.map((e) => '${e.key}=${e.value}').join(', ');
    logInfo('emcc setting overrides: $pretty');
  }

  final settingArgs = settings.entries.expand((e) => ['-s', '${e.key}=${e.value}']);

  final emccArgs = [
    raylibC.path,
    '-I${toEmccPath(raylibInclude)}',
    '-I${toEmccPath(extraHeadersDir.path)}',
    '-L${toEmccPath(raylibLibDir.path)}', '-lraylib',
    '-I${toEmccPath(rayguiInclude)}',
    ...settingArgs,
    if (raylibFuncList != null) ...['-s', 'EXPORTED_FUNCTIONS=@${toEmccPath(raylibFuncList.path)}'],
    if (hasResources) ...['--preload-file', '${toEmccPath(resourcesDir.path)}@/resources'],
    '-s', 'EXPORTED_RUNTIME_METHODS=[${defaultExportedRuntimeMethods.map((m) => '"$m"').join(',')}]',
    ...extraArgs,
    '-o', outputHtml,
  ];

  await logRun('emcc', emccArgs);
}

Future<void> _dartCompile({
  required File entryPoint,
  required Directory buildDir,
}) async {
  logStep('Compiling Dart to JS');

  final outputJs = p.join(buildDir.path, 'main.js');
  await logRun('dart', ['compile', 'js', entryPoint.path, '-o', outputJs]);
}

void _buildHtmlTemplate({required Directory buildDir}) {
  logStep('Building HTML template');

  final index = File(p.join(buildDir.path, 'index.html'));
  index.writeAsStringSync(html_index.template);
  logInfo('Built ${index.path}');
}