part of '../../../raylib_dartified.dart';

class RaylibMsfGifFlat extends RaylibMsfGifFlatModule<Raylib> {
  
  RaylibMsfGifFlat(super.rl);

  RaylibMsfGif get _ffi => rl.module();

  @override int get msf_gif_alpha_threshold => _ffi._msf_gif_alpha_threshold.value;
  @override set msf_gif_alpha_threshold(int v) => _ffi._msf_gif_alpha_threshold.value = v;

  @override int get msf_gif_bgra_flag => _ffi._msf_gif_bgra_flag.value;
  @override set msf_gif_bgra_flag(int v) => _ffi._msf_gif_bgra_flag.value = v;

  @override
  int msf_gif_begin(
    StructPointer<MsfGifStateD> handle,
    int width,
    int height,
  ) => _ffi.msf_gif_begin(
    handle.asNativePointer(),
    width,
    height,
  );

  @override
  int msf_gif_frame(
    StructPointer<MsfGifStateD> handle,
    MemoryPointer<RUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  ) => _ffi.msf_gif_frame(
    handle.asNativePointer(),
    pixelData.asNativePointer(),
    centiSecondsPerFame,
    maxBitDepth,
    pitchInBytes,
  );

  @override
  MsfGifResultD msf_gif_end(
    StructPointer<MsfGifStateD> handle,
  ) => $.MsfGifResult$.RefCapture(
    RaylibCaptureIds.msf_gif_end,
    (p) => _ffi.msf_gif_end(
      handle.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  void msf_gif_free(
    MsfGifResultD result,
  ) => disposeStructWithOpFreed(result, (ptr) {
    _ffi.msf_gif_free(
      ptr.asNativePointer<MsfGifResultC>().ref,
    );
  });

  @override
  int msf_gif_begin_to_file(
    StructPointer<MsfGifStateD> handle,
    int width,
    int height,
    MemoryPointer<RFunction> func,
    MemoryPointer<RVoid> filePointer,
  ) => _ffi.msf_gif_begin_to_file(
    handle.asNativePointer(),
    width,
    height,
    func.asNativePointer(),
    filePointer.asNativePointer(),
  );

  @override
  int msf_gif_frame_to_file(
    StructPointer<MsfGifStateD> handle,
    MemoryPointer<RUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  ) => _ffi.msf_gif_frame_to_file(
    handle.asNativePointer(),
    pixelData.asNativePointer(),
    centiSecondsPerFame,
    maxBitDepth,
    pitchInBytes,
  );

  @override
  int msf_gif_end_to_file(
    StructPointer<MsfGifStateD> handle,
  ) => _ffi.msf_gif_end_to_file(
    handle.asNativePointer(),
  );
}