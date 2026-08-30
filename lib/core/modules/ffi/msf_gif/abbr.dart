import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibMsfGif get _module => Raylib.instance.module<RaylibMsfGif>();

int get msf_gif_bgra_flag => _module.msf_gif_bgra_flag;
set msf_gif_bgra_flag(int v) => _module.msf_gif_bgra_flag = v;

/// See [RaylibMsfGif.msf_gif_begin].
int msf_gif_begin(Pointer<MsfGifStateC> handle, int width, int height)
  => _module.msf_gif_begin(handle, width, height);

/// See [RaylibMsfGif.msf_gif_frame].
int msf_gif_frame(Pointer<MsfGifStateC> handle, Pointer<Uint8> pixelData, int centiSecondsPerFame, int maxBitDepth, int pitchInBytes)
  => _module.msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);

/// See [RaylibMsfGif.msf_gif_end].
MsfGifResultC msf_gif_end(Pointer<MsfGifStateC> handle)
  => _module.msf_gif_end(handle);

/// See [RaylibMsfGif.msf_gif_free].
void msf_gif_free(MsfGifResultC result)
  => _module.msf_gif_free(result);

/// See [RaylibMsfGif.msf_gif_begin_to_file].
int msf_gif_begin_to_file(Pointer<MsfGifStateC> handle, int width, int height, MsfGifFileWriteFuncC func, Pointer<Void> filePointer)
  => _module.msf_gif_begin_to_file(handle, width, height, func, filePointer);

/// See [RaylibMsfGif.msf_gif_frame_to_file].
int msf_gif_frame_to_file(Pointer<MsfGifStateC> handle, Pointer<Uint8> pixelData, int centiSecondsPerFame, int maxBitDepth, int pitchInBytes)
  => _module.msf_gif_frame_to_file(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);

/// See [RaylibMsfGif.msf_gif_end_to_file].
int msf_gif_end_to_file(Pointer<MsfGifStateC> handle)
  => _module.msf_gif_end_to_file(handle);
