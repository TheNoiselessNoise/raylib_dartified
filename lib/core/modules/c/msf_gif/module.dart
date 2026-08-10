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

  int msf_gif_begin(Pointer<MsfGifState> handle, int width, int height)
    => _msf_gif_begin(handle, width, height);
  late final _msf_gif_beginPtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifState>, Int, Int)>>('msf_gif_begin');
  late final _msf_gif_begin = _msf_gif_beginPtr.asFunction<int Function(Pointer<MsfGifState>, int, int)>();

  int msf_gif_frame(Pointer<MsfGifState> handle, Pointer<Uint8> pixelData, int centiSecondsPerFame, int maxBitDepth, int pitchInBytes)
    => _msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);
  late final _msf_gif_framePtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifState>, Pointer<Uint8>, Int, Int, Int)>>('msf_gif_frame');
  late final _msf_gif_frame = _msf_gif_framePtr.asFunction<int Function(Pointer<MsfGifState>, Pointer<Uint8>, int, int, int)>();

  MsfGifResult msf_gif_end(Pointer<MsfGifState> handle)
    => _msf_gif_end(handle);
  late final _msf_gif_endPtr = _lookup<NativeFunction<MsfGifResult Function(Pointer<MsfGifState>)>>('msf_gif_end');
  late final _msf_gif_end = _msf_gif_endPtr.asFunction<MsfGifResult Function(Pointer<MsfGifState>)>();

  void msf_gif_free(MsfGifResult result)
    => _msf_gif_free(result);
  late final _msf_gif_freePtr = _lookup<NativeFunction<Void Function(MsfGifResult)>>('msf_gif_free');
  late final _msf_gif_free = _msf_gif_freePtr.asFunction<void Function(MsfGifResult)>();

  int msf_gif_begin_to_file(Pointer<MsfGifState> handle, int width, int height, MsfGifFileWriteFunc func, Pointer<Void> filePointer)
    => _msf_gif_begin_to_file(handle, width, height, func, filePointer);
  late final _msf_gif_begin_to_filePtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifState>, Int, Int, MsfGifFileWriteFunc, Pointer<Void>)>>('msf_gif_begin_to_file');
  late final _msf_gif_begin_to_file = _msf_gif_begin_to_filePtr.asFunction<int Function(Pointer<MsfGifState>, int, int, MsfGifFileWriteFunc, Pointer<Void>)>();

  int msf_gif_frame_to_file(Pointer<MsfGifState> handle, Pointer<Uint8> pixelData, int centiSecondsPerFame, int maxBitDepth, int pitchInBytes)
    => _msf_gif_frame_to_file(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes);
  late final _msf_gif_frame_to_filePtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifState>, Pointer<Uint8>, Int, Int, Int)>>('msf_gif_frame_to_file');
  late final _msf_gif_frame_to_file = _msf_gif_frame_to_filePtr.asFunction<int Function(Pointer<MsfGifState>, Pointer<Uint8>, int, int, int)>();

  int msf_gif_end_to_file(Pointer<MsfGifState> handle)
    => _msf_gif_end_to_file(handle);
  late final _msf_gif_end_to_filePtr = _lookup<NativeFunction<Int Function(Pointer<MsfGifState>)>>('msf_gif_end_to_file');
  late final _msf_gif_end_to_file = _msf_gif_end_to_filePtr.asFunction<int Function(Pointer<MsfGifState>)>();
}