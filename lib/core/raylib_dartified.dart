library;

// TODO: move all `abbr_dart.dart` into base package
// TODO: move all `abbr_flat.dart` into base package

import 'dart:collection';
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

part 'modules/dart/audio/callbacks.dart';
part 'modules/dart/audio/module_dart.dart';
part 'modules/dart/audio/module_flat.dart';
part 'modules/dart/audio/structs.dart';

// ===== CAMERA MODULE =====
part 'modules/c/camera/module.dart';

part 'modules/dart/camera/module_dart.dart';
part 'modules/dart/camera/module_flat.dart';

// ===== CORE MODULE =====
part 'modules/c/core/module.dart';
part 'modules/c/core/structs.dart';

part 'modules/dart/core/callbacks.dart';
part 'modules/dart/core/module_dart.dart';
part 'modules/dart/core/module_flat.dart';
part 'modules/dart/core/structs.dart';

// ===== GUI MODULE =====
part 'modules/c/gui/module.dart';

part 'modules/dart/gui/module_dart.dart';
part 'modules/dart/gui/module_flat.dart';

// ===== LIGHT MODULE =====
part 'modules/c/light/module.dart';
part 'modules/c/light/structs.dart';

part 'modules/dart/light/module_dart.dart';
part 'modules/dart/light/module_flat.dart';
part 'modules/dart/light/structs.dart';

// ===== MSF_GIF MODULE =====
part 'modules/c/msf_gif/module.dart';
part 'modules/c/msf_gif/structs.dart';

part 'modules/dart/msf_gif/module_dart.dart';
part 'modules/dart/msf_gif/module_flat.dart';
part 'modules/dart/msf_gif/structs.dart';

// ===== RLGL MODULE =====
part 'modules/c/rlgl/module.dart';
part 'modules/c/rlgl/structs.dart';

part 'modules/dart/rlgl/module_dart.dart';
part 'modules/dart/rlgl/module_flat.dart';
part 'modules/dart/rlgl/structs.dart';