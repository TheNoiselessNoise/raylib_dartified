import 'dart:io';

final _path = Platform.script.resolve('assets/emscripten_index.html');

String get template => File(_path.toFilePath()).readAsStringSync();