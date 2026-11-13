part of '../../../raylib_dartified.dart';

class RaylibMsfGifFlatNative extends RaylibMsfGifFlat<Raylib> {
  
  RaylibMsfGifFlatNative(super.rl);

  RaylibMsfGif get _ffi => rl.module();

  @override int get msf_gif_alpha_threshold => _ffi._msf_gif_alpha_threshold.value;
  @override set msf_gif_alpha_threshold(int v) => _ffi._msf_gif_alpha_threshold.value = v;

  @override int get msf_gif_bgra_flag => _ffi._msf_gif_bgra_flag.value;
  @override set msf_gif_bgra_flag(int v) => _ffi._msf_gif_bgra_flag.value = v;

  @override
  int msf_gif_begin(
    XStructPtr<MsfGifState> handle,
    int width,
    int height,
  ) => _ffi.msf_gif_begin(
    handle.asNative(),
    width,
    height,
  );

  @override
  int msf_gif_frame(
    XStructPtr<MsfGifState> handle,
    XPtr<XUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  ) => _ffi.msf_gif_frame(
    handle.asNative(),
    pixelData.asNative(),
    centiSecondsPerFame,
    maxBitDepth,
    pitchInBytes,
  );

  @override
  MsfGifResult msf_gif_end(
    XStructPtr<MsfGifState> handle,
  ) => MsfGifResult$.RefCapture(
    RaylibCaptureIds.msf_gif_end,
    (p) => _ffi.msf_gif_end(
      handle.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  void msf_gif_free(
    MsfGifResult result,
  ) => disposeStructWithOpFreed(result, (ptr) {
    _ffi.msf_gif_free(
      ptr.asNative<MsfGifResultC>().ref,
    );
  });

  @override
  int msf_gif_begin_to_file(
    XStructPtr<MsfGifState> handle,
    int width,
    int height,
    XPtr<XFunction> func,
    XPtr<XVoid> filePointer,
  ) => _ffi.msf_gif_begin_to_file(
    handle.asNative(),
    width,
    height,
    func.asNative(),
    filePointer.asNative(),
  );

  @override
  int msf_gif_frame_to_file(
    XStructPtr<MsfGifState> handle,
    XPtr<XUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  ) => _ffi.msf_gif_frame_to_file(
    handle.asNative(),
    pixelData.asNative(),
    centiSecondsPerFame,
    maxBitDepth,
    pitchInBytes,
  );

  @override
  int msf_gif_end_to_file(
    XStructPtr<MsfGifState> handle,
  ) => _ffi.msf_gif_end_to_file(
    handle.asNative(),
  );
}