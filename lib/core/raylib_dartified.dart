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

// ===== EXTENSIONS =====
part 'extensions/ffi/raymath/matrix/extension.dart';
part 'extensions/flat/raymath/matrix/extension.dart';

part 'extensions/ffi/raymath/quaternion/extension.dart';
part 'extensions/flat/raymath/quaternion/extension.dart';

part 'extensions/ffi/raymath/vector2/extension.dart';
part 'extensions/flat/raymath/vector2/extension.dart';

part 'extensions/ffi/raymath/vector3/extension.dart';
part 'extensions/flat/raymath/vector3/extension.dart';

part 'extensions/ffi/raymath/vector4/extension.dart';
part 'extensions/flat/raymath/vector4/extension.dart';

// ===== AUDIO MODULE =====
part 'modules/ffi/audio/module.dart';
part 'modules/ffi/audio/types.dart';

part 'modules/flat/audio/callbacks.dart';
part 'modules/flat/audio/module.dart';
part 'modules/flat/audio/types.dart';

// ===== CAMERA MODULE =====
part 'modules/ffi/camera/module.dart';

part 'modules/flat/camera/module.dart';

// ===== CORE MODULE =====
part 'modules/ffi/core/module.dart';
part 'modules/ffi/core/types.dart';

part 'modules/flat/core/callbacks.dart';
part 'modules/flat/core/module.dart';
part 'modules/flat/core/types.dart';

// ===== GUI MODULE =====
part 'modules/ffi/gui/module.dart';

part 'modules/flat/gui/module.dart';

// ===== LIGHT MODULE =====
part 'modules/ffi/light/module.dart';
part 'modules/ffi/light/types.dart';

part 'modules/flat/light/module.dart';
part 'modules/flat/light/types.dart';

// ===== MSF_GIF MODULE =====
part 'modules/ffi/msf_gif/module.dart';
part 'modules/ffi/msf_gif/types.dart';

part 'modules/flat/msf_gif/callbacks.dart';
part 'modules/flat/msf_gif/module.dart';
part 'modules/flat/msf_gif/types.dart';

// ===== RLGL MODULE =====
part 'modules/ffi/rlgl/module.dart';
part 'modules/ffi/rlgl/types.dart';

part 'modules/flat/rlgl/module.dart';
part 'modules/flat/rlgl/types.dart';