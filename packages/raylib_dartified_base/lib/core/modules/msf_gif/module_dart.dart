part of '../../raylib_dartified_base.dart';

/// Backend-agnostic MsfGif module.
final class RaylibMsfGifDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibMsfGifDartDebugLabels();
  
  RaylibMsfGifDart(super.rl);

  RaylibMsfGifFlat get _flat => rl.module();

  /// `msf_gif_alpha_threshold`
  int get msf_gif_alpha_threshold => _flat.msf_gif_alpha_threshold;
  set msf_gif_alpha_threshold(int v) => _flat.msf_gif_alpha_threshold = v;

  /// `msf_gif_bgra_flag`
  int get msf_gif_bgra_flag => _flat.msf_gif_bgra_flag;
  set msf_gif_bgra_flag(int v) => _flat.msf_gif_bgra_flag = v;

  /// `msf_gif_begin`
  int msf_gif_begin(
    MsfGifState handle,
    num width,
    num height,
  ) => debugRun(
    () => _debugLabels.msf_gif_begin(handle, width, height),
    () => _flat.msf_gif_begin(
      MsfGifState$.Ref1(handle),
      width.toInt(),
      height.toInt(),
    ),
  );

  /// `msf_gif_frame`
  int msf_gif_frame(
    MsfGifState handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  ) => debugRun(
    () => _debugLabels.msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes),
    () => _flat.msf_gif_frame(
      MsfGifState$.Ref1(handle),
      TypedDataList$.Array(pixelData).cast(),
      centiSecondsPerFame.toInt(),
      maxBitDepth.toInt(),
      pitchInBytes.toInt(),
    ),
  );

  /// `msf_gif_end`
  MsfGifResult msf_gif_end(
    MsfGifState handle,
  ) => debugRun(
    () => _debugLabels.msf_gif_end(handle),
    () => _flat.msf_gif_end(
      MsfGifState$.Ref1(handle),
    ),
  );

  /// `msf_gif_free`
  void msf_gif_free(
    MsfGifResult result,
  ) => debugRun(
    () => _debugLabels.msf_gif_free(result),
    () => _flat.msf_gif_free(
      result,
    ),
  );

  // NOTE: msf_gif_begin_to_file makes sense only in Flat API

  // NOTE: msf_gif_frame_to_file makes sense only in Flat API

  // NOTE: msf_gif_end_to_file makes sense only in Flat API
}
