part of '../../../raylib_dartified_web.dart';

class RaylibMsfGifFlatWeb extends RaylibMsfGifFlat<Raylib> {

  RaylibMsfGifFlatWeb(super.rl);

  RaylibMsfGif get _wasm => rl.module();

  @override int get msf_gif_alpha_threshold => _wasm.msf_gif_alpha_threshold.value;
  @override set msf_gif_alpha_threshold(int v) => _wasm.msf_gif_alpha_threshold.value = v;

  @override int get msf_gif_bgra_flag => _wasm.msf_gif_bgra_flag.value;
  @override set msf_gif_bgra_flag(int v) => _wasm.msf_gif_bgra_flag.value = v;

  @override
  int msf_gif_begin(
    XStructPtr<MsfGifState> handle,
    int width,
    int height,
  ) => _wasm.msf_gif_begin(
    handle.toJS,
    width.toJS,
    height.toJS,
  );

  @override
  int msf_gif_frame(
    XStructPtr<MsfGifState> handle,
    XPtr<XUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  ) => _wasm.msf_gif_frame(
    handle.toJS,
    pixelData.toJS,
    centiSecondsPerFame.toJS,
    maxBitDepth.toJS,
    pitchInBytes.toJS,
  );

  @override
  MsfGifResult msf_gif_end(
    XStructPtr<MsfGifState> handle,
  ) => MsfGifResult$.RefCapture(
    RaylibCaptureIds.msf_gif_end,
    (p) => _wasm.msf_gif_end(
      p.toJS,
      handle.toJS,
    ),
  );

  @override
  void msf_gif_free(
    MsfGifResult result,
  ) => _wasm.msf_gif_free(
    result.getOpAndDispose().toJS,
  );

  @override
  int msf_gif_begin_to_file(
    XStructPtr<MsfGifState> handle,
    int width,
    int height,
    XPtr<XFunction> func,
    XPtr<XVoid> filePointer,
  ) => _wasm.msf_gif_begin_to_file(
    handle.toJS,
    width.toJS,
    height.toJS,
    func.toJS,
    filePointer.toJS,
  );

  @override
  int msf_gif_frame_to_file(
    XStructPtr<MsfGifState> handle,
    XPtr<XUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  ) => _wasm.msf_gif_frame_to_file(
    handle.toJS,
    pixelData.toJS,
    centiSecondsPerFame.toJS,
    maxBitDepth.toJS,
    pitchInBytes.toJS,
  );

  @override
  int msf_gif_end_to_file(
    XStructPtr<MsfGifState> handle,
  ) => _wasm.msf_gif_end_to_file(
    handle.toJS,
  );
}