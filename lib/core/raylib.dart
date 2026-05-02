library;

import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ffi';
import 'dart:math' show Random;
import 'dart:typed_data';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart' show nonVirtual, mustCallSuper;
import 'package:path/path.dart' as path;
import 'package:logging/logging.dart';

part 'base.dart';
part 'ext.dart';
part 'lib.dart';

// ===== EXTENSIONS =====
part 'extensions/colors.dart';
part 'extensions/easings.dart';
part 'extensions/matrices.dart';
part 'extensions/quaternions.dart';
part 'extensions/temp.dart';
part 'extensions/vectors.dart';

// ===== AUDIO MODULE =====
part 'modules/c/audio/module.dart';
part 'modules/c/audio/structs.dart';

part 'modules/dart/audio/callbacks.dart';
part 'modules/dart/audio/enums.dart';
part 'modules/dart/audio/module.dart';
part 'modules/dart/audio/structs/audio_stream.dart';
part 'modules/dart/audio/structs/music.dart';
part 'modules/dart/audio/structs/sound.dart';
part 'modules/dart/audio/structs/wave.dart';

// ===== CAMERA MODULE =====
part 'modules/c/camera/module.dart';

part 'modules/dart/camera/module.dart';

// ===== CORE MODULE =====
part 'modules/c/core/module.dart';
part 'modules/c/core/structs.dart';

part 'modules/dart/core/callbacks.dart';
part 'modules/dart/core/enums.dart';
part 'modules/dart/core/module.dart';
part 'modules/dart/core/extra.dart';
part 'modules/dart/core/structs.dart';
part 'modules/dart/core/structs/automation_event_list.dart';
part 'modules/dart/core/structs/automation_event.dart';
part 'modules/dart/core/structs/bone_info.dart';
part 'modules/dart/core/structs/bounding_box.dart';
part 'modules/dart/core/structs/camera_2d.dart';
part 'modules/dart/core/structs/camera_3d.dart';
part 'modules/dart/core/structs/color.dart';
part 'modules/dart/core/structs/file_path_list.dart';
part 'modules/dart/core/structs/font.dart';
part 'modules/dart/core/structs/glyph_info.dart';
part 'modules/dart/core/structs/image.dart';
part 'modules/dart/core/structs/material_map.dart';
part 'modules/dart/core/structs/material.dart';
part 'modules/dart/core/structs/matrix.dart';
part 'modules/dart/core/structs/mesh.dart';
part 'modules/dart/core/structs/model_animation.dart';
part 'modules/dart/core/structs/model.dart';
part 'modules/dart/core/structs/n_patch_info.dart';
part 'modules/dart/core/structs/ray_collision.dart';
part 'modules/dart/core/structs/ray.dart';
part 'modules/dart/core/structs/rectangle.dart';
part 'modules/dart/core/structs/render_texture.dart';
part 'modules/dart/core/structs/shader.dart';
part 'modules/dart/core/structs/texture.dart';
part 'modules/dart/core/structs/transform.dart';
part 'modules/dart/core/structs/vector2.dart';
part 'modules/dart/core/structs/vector3.dart';
part 'modules/dart/core/structs/vector4.dart';
part 'modules/dart/core/structs/vr_device_info.dart';
part 'modules/dart/core/structs/vr_stereo_config.dart';

// ===== GUI MODULE =====
part 'modules/c/gui/module.dart';

part 'modules/dart/gui/enums.dart';
part 'modules/dart/gui/module.dart';

// ===== LIGHT MODULE =====
part 'modules/c/light/module.dart';
part 'modules/c/light/structs.dart';

part 'modules/dart/light/enums.dart';
part 'modules/dart/light/module.dart';
part 'modules/dart/light/structs/light.dart';

// ===== RLGL MODULE =====
part 'modules/c/rlgl/module.dart';
part 'modules/c/rlgl/structs.dart';

part 'modules/dart/rlgl/enums.dart';
part 'modules/dart/rlgl/module.dart';
part 'modules/dart/rlgl/structs/rl_draw_call.dart';
part 'modules/dart/rlgl/structs/rl_render_batch.dart';
part 'modules/dart/rlgl/structs/rl_vertex_buffer.dart';