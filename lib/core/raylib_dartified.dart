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
part 'modules/ffi/audio/module.dart';
part 'modules/ffi/audio/structs.dart';

part 'modules/flat/audio/callbacks.dart';
part 'modules/flat/audio/module.dart';
part 'modules/flat/audio/structs.dart';

// ===== CAMERA MODULE =====
part 'modules/ffi/camera/module.dart';

part 'modules/flat/camera/module.dart';

// ===== CORE MODULE =====
part 'modules/ffi/core/module.dart';
part 'modules/ffi/core/structs.dart';

part 'modules/flat/core/callbacks.dart';
part 'modules/flat/core/module.dart';
part 'modules/flat/core/structs.dart';

// ===== GUI MODULE =====
part 'modules/ffi/gui/module.dart';

part 'modules/flat/gui/module.dart';

// ===== LIGHT MODULE =====
part 'modules/ffi/light/module.dart';
part 'modules/ffi/light/structs.dart';

part 'modules/flat/light/module.dart';
part 'modules/flat/light/structs.dart';

// ===== MSF_GIF MODULE =====
part 'modules/ffi/msf_gif/module.dart';
part 'modules/ffi/msf_gif/structs.dart';

part 'modules/flat/msf_gif/callbacks.dart';
part 'modules/flat/msf_gif/module.dart';
part 'modules/flat/msf_gif/structs.dart';

// ===== RLGL MODULE =====
part 'modules/ffi/rlgl/module.dart';
part 'modules/ffi/rlgl/structs.dart';

part 'modules/flat/rlgl/module.dart';
part 'modules/flat/rlgl/structs.dart';