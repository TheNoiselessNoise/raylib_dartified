library;

import 'dart:convert';
import 'dart:io';
import 'dart:ffi';
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:ffi/ffi.dart' as ffi;
import 'package:path/path.dart' as path;
import 'package:logging/logging.dart';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

part 'ext.dart';
part 'lib.dart';
part 'pointer.dart';

// ===== AUDIO MODULE =====
part 'modules/c/audio/module.dart';
part 'modules/c/audio/structs.dart';

part 'modules/flat/audio/callbacks.dart';
part 'modules/flat/audio/module.dart';
part 'modules/flat/audio/structs.dart';

// ===== CAMERA MODULE =====
part 'modules/c/camera/module.dart';

part 'modules/flat/camera/module.dart';

// ===== CORE MODULE =====
part 'modules/c/core/module.dart';
part 'modules/c/core/structs.dart';

part 'modules/flat/core/callbacks.dart';
part 'modules/flat/core/module.dart';
part 'modules/flat/core/structs.dart';

// ===== GUI MODULE =====
part 'modules/c/gui/module.dart';

part 'modules/flat/gui/module.dart';

// ===== LIGHT MODULE =====
part 'modules/c/light/module.dart';
part 'modules/c/light/structs.dart';

part 'modules/flat/light/structs.dart';

// ===== MSF_GIF MODULE =====
part 'modules/c/msf_gif/module.dart';
part 'modules/c/msf_gif/structs.dart';

part 'modules/flat/msf_gif/module.dart';
part 'modules/flat/msf_gif/structs.dart';

// ===== RLGL MODULE =====
part 'modules/c/rlgl/module.dart';
part 'modules/c/rlgl/structs.dart';

part 'modules/flat/rlgl/module.dart';
part 'modules/flat/rlgl/structs.dart';