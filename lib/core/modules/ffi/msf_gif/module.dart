part of '../../../raylib_dartified.dart';

class RaylibMsfGif extends RaylibModule<Raylib> {
  RaylibMsfGif(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibMsfGif>();

  late final _msf_gif_alpha_threshold = _lookup<Int>('msf_gif_alpha_threshold');
  int get msf_gif_alpha_threshold => _msf_gif_alpha_threshold.value;
  set msf_gif_alpha_threshold(int v) => _msf_gif_alpha_threshold.value = v;

  late final _msf_gif_bgra_flag = _lookup<Int>('msf_gif_bgra_flag');
  int get msf_gif_bgra_flag => _msf_gif_bgra_flag.value;
  set msf_gif_bgra_flag(int v) => _msf_gif_bgra_flag.value = v;

  int msf_gif_begin(Pointer<MsfGifStateC> handle, int width, int height)
    => _msf_gif_begin(handle, width, height);
  late final _msf_gif_beginPtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifStateC>, Int, Int)>>('msf_gif_begin');
  late final _msf_gif_begin = _msf_gif_beginPtr.asFunction<int Function(Pointer<MsfGifStateC>, int, int)>();

  int msf_gif_frame(Pointer<MsfGifStateC> handle, Pointer<Uint8> pixelData, int centiSecondsPerFame, int maxBitDepth, int pitchInBytes)
    => _msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);
  late final _msf_gif_framePtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifStateC>, Pointer<Uint8>, Int, Int, Int)>>('msf_gif_frame');
  late final _msf_gif_frame = _msf_gif_framePtr.asFunction<int Function(Pointer<MsfGifStateC>, Pointer<Uint8>, int, int, int)>();

  MsfGifResultC msf_gif_end(Pointer<MsfGifStateC> handle)
    => _msf_gif_end(handle);
  late final _msf_gif_endPtr = _lookup<NativeFunction<MsfGifResultC Function(Pointer<MsfGifStateC>)>>('msf_gif_end');
  late final _msf_gif_end = _msf_gif_endPtr.asFunction<MsfGifResultC Function(Pointer<MsfGifStateC>)>();

  void msf_gif_free(MsfGifResultC result)
    => _msf_gif_free(result);
  late final _msf_gif_freePtr = _lookup<NativeFunction<Void Function(MsfGifResultC)>>('msf_gif_free');
  late final _msf_gif_free = _msf_gif_freePtr.asFunction<void Function(MsfGifResultC)>();

  int msf_gif_begin_to_file(Pointer<MsfGifStateC> handle, int width, int height, MsfGifFileWriteFuncC func, Pointer<Void> filePointer)
    => _msf_gif_begin_to_file(handle, width, height, func, filePointer);
  late final _msf_gif_begin_to_filePtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifStateC>, Int, Int, MsfGifFileWriteFuncC, Pointer<Void>)>>('msf_gif_begin_to_file');
  late final _msf_gif_begin_to_file = _msf_gif_begin_to_filePtr.asFunction<int Function(Pointer<MsfGifStateC>, int, int, MsfGifFileWriteFuncC, Pointer<Void>)>();

  int msf_gif_frame_to_file(Pointer<MsfGifStateC> handle, Pointer<Uint8> pixelData, int centiSecondsPerFame, int maxBitDepth, int pitchInBytes)
    => _msf_gif_frame_to_file(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);
  late final _msf_gif_frame_to_filePtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifStateC>, Pointer<Uint8>, Int, Int, Int)>>('msf_gif_frame_to_file');
  late final _msf_gif_frame_to_file = _msf_gif_frame_to_filePtr.asFunction<int Function(Pointer<MsfGifStateC>, Pointer<Uint8>, int, int, int)>();

  int msf_gif_end_to_file(Pointer<MsfGifStateC> handle)
    => _msf_gif_end_to_file(handle);
  late final _msf_gif_end_to_filePtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifStateC>)>>('msf_gif_end_to_file');
  late final _msf_gif_end_to_file = _msf_gif_end_to_filePtr.asFunction<int Function(Pointer<MsfGifStateC>)>();
}