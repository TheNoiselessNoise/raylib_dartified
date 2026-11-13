library;

import 'dart:collection';
import 'dart:math' as math;
import 'dart:typed_data';
import 'package:meta/meta.dart' show nonVirtual, mustCallSuper;
import 'package:raylib_dartified_base/boot/boot.dart';
import 'package:xffi_core/xffi_core.dart';
import 'package:raylib_dartified_base/abbr/allocators.dart';
export 'package:xffi_core/xffi_core.dart';

part 'base.dart';
part 'callback.dart';
part 'ext.dart';

// ===== EXTENSIONS =====
part 'extensions/ease/extension_dart.dart';

part 'extensions/raymath/matrix/extension_dart.dart';
part 'extensions/raymath/matrix/extension_flat.dart';
part 'extensions/raymath/matrix/labels.dart';

part 'extensions/raymath/quaternion/extension_dart.dart';
part 'extensions/raymath/quaternion/extension_flat.dart';
part 'extensions/raymath/quaternion/labels.dart';

part 'extensions/raymath/vector2/extension_dart.dart';
part 'extensions/raymath/vector2/extension_flat.dart';
part 'extensions/raymath/vector2/labels.dart';

part 'extensions/raymath/vector3/extension_dart.dart';
part 'extensions/raymath/vector3/extension_flat.dart';
part 'extensions/raymath/vector3/labels.dart';

part 'extensions/raymath/vector4/extension_dart.dart';
part 'extensions/raymath/vector4/extension_flat.dart';
part 'extensions/raymath/vector4/labels.dart';

// ===== AUDIO MODULE =====
part 'modules/audio/callbacks.dart';
part 'modules/audio/capture_ids.dart';
part 'modules/audio/enums.dart';
part 'modules/audio/labels.dart';
part 'modules/audio/module_dart.dart';
part 'modules/audio/module_flat.dart';
part 'modules/audio/structs/audio_stream.dart';
part 'modules/audio/structs/music.dart';
part 'modules/audio/structs/sound.dart';
part 'modules/audio/structs/wave.dart';

// ===== CAMERA MODULE =====
part 'modules/camera/labels.dart';
part 'modules/camera/module_dart.dart';
part 'modules/camera/module_flat.dart';

// ===== CORE MODULE =====
part 'modules/core/callbacks.dart';
part 'modules/core/capture_ids.dart';
part 'modules/core/consts.dart';
part 'modules/core/enums.dart';
part 'modules/core/extra.dart';
part 'modules/core/labels.dart';
part 'modules/core/module_dart.dart';
part 'modules/core/module_flat.dart';
part 'modules/core/structs/automation_event_list.dart';
part 'modules/core/structs/automation_event.dart';
part 'modules/core/structs/bone_info.dart';
part 'modules/core/structs/bounding_box.dart';
part 'modules/core/structs/camera_2d.dart';
part 'modules/core/structs/camera_3d.dart';
part 'modules/core/structs/color.dart';
part 'modules/core/structs/file_path_list.dart';
part 'modules/core/structs/float3.dart';
part 'modules/core/structs/float16.dart';
part 'modules/core/structs/font.dart';
part 'modules/core/structs/gesture_event.dart';
part 'modules/core/structs/glyph_info.dart';
part 'modules/core/structs/image.dart';
part 'modules/core/structs/material_map.dart';
part 'modules/core/structs/material.dart';
part 'modules/core/structs/matrix.dart';
part 'modules/core/structs/mesh.dart';
part 'modules/core/structs/model_animation.dart';
part 'modules/core/structs/model_skeleton.dart';
part 'modules/core/structs/model.dart';
part 'modules/core/structs/n_patch_info.dart';
part 'modules/core/structs/quaternion.dart';
part 'modules/core/structs/ray_collision.dart';
part 'modules/core/structs/ray.dart';
part 'modules/core/structs/rectangle.dart';
part 'modules/core/structs/render_texture.dart';
part 'modules/core/structs/shader.dart';
part 'modules/core/structs/texture.dart';
part 'modules/core/structs/transform.dart';
part 'modules/core/structs/vector2.dart';
part 'modules/core/structs/vector3.dart';
part 'modules/core/structs/vector4.dart';
part 'modules/core/structs/vr_device_info.dart';
part 'modules/core/structs/vr_stereo_config.dart';

// ===== GUI MODULE =====
part 'modules/gui/capture_ids.dart';
part 'modules/gui/consts.dart';
part 'modules/gui/enums.dart';
part 'modules/gui/labels.dart';
part 'modules/gui/module_dart.dart';
part 'modules/gui/module_flat.dart';

// ===== LIGHT MODULE =====
part 'modules/light/capture_ids.dart';
part 'modules/light/enums.dart';
part 'modules/light/consts.dart';
part 'modules/light/labels.dart';
part 'modules/light/module_dart.dart';
part 'modules/light/module_flat.dart';
part 'modules/light/structs/light.dart';

// ===== MSF_GIF MODULE =====
part 'modules/msf_gif/callbacks.dart';
part 'modules/msf_gif/capture_ids.dart';
part 'modules/msf_gif/labels.dart';
part 'modules/msf_gif/module_dart.dart';
part 'modules/msf_gif/module_flat.dart';
part 'modules/msf_gif/structs/msf_gif_result.dart';
part 'modules/msf_gif/structs/msf_gif_state.dart';

// ===== RLGL MODULE =====
part 'modules/rlgl/capture_ids.dart';
part 'modules/rlgl/consts.dart';
part 'modules/rlgl/enums.dart';
part 'modules/rlgl/labels.dart';
part 'modules/rlgl/module_dart.dart';
part 'modules/rlgl/module_flat.dart';
part 'modules/rlgl/structs/rl_draw_call.dart';
part 'modules/rlgl/structs/rl_render_batch.dart';
part 'modules/rlgl/structs/rl_vertex_buffer.dart';

final class DoNotValidate {
  final String reason;
  const DoNotValidate([this.reason = '']);
}

final class DoNotAbbreviate {
  const DoNotAbbreviate();
}