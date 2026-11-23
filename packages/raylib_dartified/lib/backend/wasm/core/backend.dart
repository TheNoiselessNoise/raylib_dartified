library;

import 'dart:js_interop';
import 'package:raylib_dartified/raylib_dartified.dart';
import 'package:raylib_dartified/api/allocators.dart';
import 'package:xffi_web_emscripten/xffi_web_emscripten.dart';

// ===== EXTENSIONS =====
part 'extensions/wasm/raymath/matrix/extension.dart';
part 'extensions/flat/raymath/matrix/extension.dart';

part 'extensions/wasm/raymath/quaternion/extension.dart';
part 'extensions/flat/raymath/quaternion/extension.dart';

part 'extensions/wasm/raymath/vector2/extension.dart';
part 'extensions/flat/raymath/vector2/extension.dart';

part 'extensions/wasm/raymath/vector3/extension.dart';
part 'extensions/flat/raymath/vector3/extension.dart';

part 'extensions/wasm/raymath/vector4/extension.dart';
part 'extensions/flat/raymath/vector4/extension.dart';

// ===== AUDIO MODULE =====
part 'modules/wasm/audio/module.dart';

part 'modules/flat/audio/callbacks.dart';
part 'modules/flat/audio/module.dart';

// ===== CAMERA MODULE =====
part 'modules/wasm/camera/module.dart';

part 'modules/flat/camera/module.dart';

// ===== CORE MODULE =====
part 'modules/wasm/core/module.dart';

part 'modules/flat/core/callbacks.dart';
part 'modules/flat/core/module.dart';

// ===== GUI MODULE =====
part 'modules/wasm/gui/module.dart';

part 'modules/flat/gui/module.dart';

// ===== LIGHT MODULE =====
part 'modules/wasm/light/module.dart';

part 'modules/flat/light/module.dart';

// ===== MSF_GIF MODULE =====
part 'modules/wasm/msf_gif/module.dart';

part 'modules/flat/msf_gif/callbacks.dart';
part 'modules/flat/msf_gif/module.dart';

// ===== RLGL MODULE =====
part 'modules/wasm/rlgl/module.dart';

part 'modules/flat/rlgl/module.dart';