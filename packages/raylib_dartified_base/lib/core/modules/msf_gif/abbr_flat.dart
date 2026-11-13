import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibMsfGifFlat get _module => RaylibBase.instance.module();

/// See [RaylibMsfGifFlat.msf_gif_alpha_threshold].
int get msf_gif_alpha_threshold => _module.msf_gif_alpha_threshold;
/// See [RaylibMsfGifFlat.msf_gif_alpha_threshold].
set msf_gif_alpha_threshold(int v) => _module.msf_gif_alpha_threshold = v;

/// See [RaylibMsfGifFlat.msf_gif_bgra_flag].
int get msf_gif_bgra_flag => _module.msf_gif_bgra_flag;
/// See [RaylibMsfGifFlat.msf_gif_bgra_flag].
set msf_gif_bgra_flag(int v) => _module.msf_gif_bgra_flag = v;

/// See [RaylibMsfGifFlat.msf_gif_begin].
int msf_gif_begin(
  XStructPtr<MsfGifState> handle,
  int width,
  int height,
) => _module.msf_gif_begin(handle, width, height);

/// See [RaylibMsfGifFlat.msf_gif_frame].
int msf_gif_frame(
  XStructPtr<MsfGifState> handle,
  XPtr<XUint8> pixelData,
  int centiSecondsPerFame,
  int maxBitDepth,
  int pitchInBytes,
) => _module.msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);

/// See [RaylibMsfGifFlat.msf_gif_end].
MsfGifResult msf_gif_end(
  XStructPtr<MsfGifState> handle,
) => _module.msf_gif_end(handle);

/// See [RaylibMsfGifFlat.msf_gif_free].
void msf_gif_free(
  MsfGifResult result,
) => _module.msf_gif_free(result);

/// See [RaylibMsfGifFlat.msf_gif_begin_to_file].
int msf_gif_begin_to_file(
  XStructPtr<MsfGifState> handle,
  int width,
  int height,
  XPtr<XFunction> func,
  XPtr<XVoid> filePointer,
) => _module.msf_gif_begin_to_file(handle, width, height, func, filePointer);

/// See [RaylibMsfGifFlat.msf_gif_frame_to_file].
int msf_gif_frame_to_file(
  XStructPtr<MsfGifState> handle,
  XPtr<XUint8> pixelData,
  int centiSecondsPerFame,
  int maxBitDepth,
  int pitchInBytes,
) => _module.msf_gif_frame_to_file(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);

/// See [RaylibMsfGifFlat.msf_gif_end_to_file].
int msf_gif_end_to_file(
  XStructPtr<MsfGifState> handle,
) => _module.msf_gif_end_to_file(handle);
