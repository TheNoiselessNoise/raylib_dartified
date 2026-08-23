import 'dart:typed_data';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibMsfGifD get _module => Raylib.instance.module<RaylibMsfGifD>();

int get msf_gif_alpha_threshold => _module.msf_gif_alpha_threshold;
set msf_gif_alpha_threshold(int v) => _module.msf_gif_alpha_threshold = v;

int get msf_gif_bgra_flag => _module.msf_gif_bgra_flag;
set msf_gif_bgra_flag(int v) => _module.msf_gif_bgra_flag = v;

/// See [RaylibMsfGifD.msf_gif_begin].
int msf_gif_begin(
  MsfGifStateD handle,
  num width,
  num height,
) => _module.msf_gif_begin(handle, width, height);

/// See [RaylibMsfGifD.msf_gif_frame].
int msf_gif_frame(
  MsfGifStateD handle,
  Uint8List pixelData,
  num centiSecondsPerFame,
  num maxBitDepth,
  num pitchInBytes,
) => _module.msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);

/// See [RaylibMsfGifD.msf_gif_end].
MsfGifResultD msf_gif_end(
  MsfGifStateD handle,
) => _module.msf_gif_end(handle);

/// See [RaylibMsfGifD.msf_gif_free].
void msf_gif_free(
  MsfGifResultD result,
) => _module.msf_gif_free(result);

// TODO: this
// /// See [RaylibMsfGifD.msf_gif_begin_to_file].
// int msf_gif_begin_to_file(MsfGifStateD handle, int width, int height, MsfGifFileWriteFunc func, Pointer<Void> filePointer)
//   => _module.msf_gif_begin_to_file(handle, width, height, func, filePointer);

/// See [RaylibMsfGifD.msf_gif_frame_to_file].
int msf_gif_frame_to_file(
  MsfGifStateD handle,
  Uint8List pixelData,
  num centiSecondsPerFame,
  num maxBitDepth,
  num pitchInBytes,
) => _module.msf_gif_frame_to_file(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);

/// See [RaylibMsfGifD.msf_gif_end_to_file].
int msf_gif_end_to_file(
  MsfGifStateD handle,
) => _module.msf_gif_end_to_file(handle);
