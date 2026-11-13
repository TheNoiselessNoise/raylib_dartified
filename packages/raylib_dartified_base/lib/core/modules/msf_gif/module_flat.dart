part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib MsfGif module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibMsfGifFlat<R extends RaylibBase> extends RaylibModule<R> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibMsfGifDartCaptureIds();

  RaylibMsfGifFlat(super.rl);

  @override
  @nonVirtual
  @DoNotAbbreviate()
  void onDispose() {
    MsfGifFileWriteCallbackBase.disposeRegistry();
  }

  /// `msf_gif_alpha_threshold`
  abstract int msf_gif_alpha_threshold;

  /// `msf_gif_bgra_flag`
  abstract int msf_gif_bgra_flag;

  /// `msf_gif_begin`
  int msf_gif_begin(
    XStructPtr<MsfGifState> handle,
    int width,
    int height,
  );

  /// `msf_gif_frame`
  int msf_gif_frame(
    XStructPtr<MsfGifState> handle,
    XPtr<XUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  );

  /// `msf_gif_end`
  MsfGifResult msf_gif_end(
    XStructPtr<MsfGifState> handle,
  );

  /// `msf_gif_free`
  void msf_gif_free(
    MsfGifResult result,
  );

  /// `msf_gif_begin_to_file`
  int msf_gif_begin_to_file(
    XStructPtr<MsfGifState> handle,
    int width,
    int height,
    XPtr<XFunction> func,
    XPtr<XVoid> filePointer,
  );

  /// `msf_gif_frame_to_file`
  int msf_gif_frame_to_file(
    XStructPtr<MsfGifState> handle,
    XPtr<XUint8> pixelData,
    int centiSecondsPerFame,
    int maxBitDepth,
    int pitchInBytes,
  );

  /// `msf_gif_end_to_file`
  int msf_gif_end_to_file(
    XStructPtr<MsfGifState> handle,
  );
}
