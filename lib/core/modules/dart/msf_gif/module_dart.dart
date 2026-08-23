part of '../../../raylib_dartified.dart';

class RaylibMsfGifD extends RaylibMsfGifModule<Raylib> {
  
  RaylibMsfGifD(super.rl);

  @override int get msf_gif_alpha_threshold => rl.MsfGifFlat.msf_gif_alpha_threshold;
  @override set msf_gif_alpha_threshold(int v) => rl.MsfGifFlat.msf_gif_alpha_threshold = v;

  @override int get msf_gif_bgra_flag => rl.MsfGifFlat.msf_gif_bgra_flag;
  @override set msf_gif_bgra_flag(int v) => rl.MsfGifFlat.msf_gif_bgra_flag = v;

  @override
  int msf_gif_begin(
    MsfGifStateD handle,
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.msf_gif_begin(handle, width, height),
    () => rl.MsfGifFlat.msf_gif_begin(
      rl.Temp.MsfGifState$.Ref1(handle),
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  int msf_gif_frame(
    MsfGifStateD handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  ) => run(
    () => RaylibDebugLabels.msf_gif_frame(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes),
    () => rl.MsfGifFlat.msf_gif_frame(
      rl.Temp.MsfGifState$.Ref1(handle),
      rl.Temp.TypedDataList$.Array(pixelData).cast(),
      centiSecondsPerFame.toInt(),
      maxBitDepth.toInt(),
      pitchInBytes.toInt(),
    ),
  );

  @override
  MsfGifResultD msf_gif_end(
    MsfGifStateD handle,
  ) => run(
    () => RaylibDebugLabels.msf_gif_end(handle),
    () => rl.MsfGifFlat.msf_gif_end(
      rl.Temp.MsfGifState$.Ref1(handle),
    ),
  );

  @override
  void msf_gif_free(
    MsfGifResultD result,
  ) => run(
    () => RaylibDebugLabels.msf_gif_free(result),
    () => rl.MsfGifFlat.msf_gif_free(
      result,
    ),
  );

  // TODO: this
  // int msf_gif_begin_to_file(
  //   MsfGifStateD handle,
  //   int width,
  //   int height,
  //   MsfGifFileWriteFuncC func,
  //   Pointer<Void> filePointer,
  // )
  //   => _msf_gif_begin_to_file(handle, width, height, func, filePointer);

  @override
  int msf_gif_frame_to_file(
    MsfGifStateD handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  ) => run(
    () => RaylibDebugLabels.msf_gif_frame_to_file(handle, pixelData, centiSecondsPerFame, maxBitDepth, pitchInBytes),
    () => rl.MsfGifFlat.msf_gif_frame_to_file(
      rl.Temp.MsfGifState$.Ref1(handle),
      rl.Temp.TypedDataList$.Array(pixelData).cast(),
      centiSecondsPerFame.toInt(),
      maxBitDepth.toInt(),
      pitchInBytes.toInt(),
    ),
  );

  @override
  int msf_gif_end_to_file(
    MsfGifStateD handle,
  ) => run(
    () => RaylibDebugLabels.msf_gif_end_to_file(handle),
    () => rl.MsfGifFlat.msf_gif_end_to_file(
      rl.Temp.MsfGifState$.Ref1(handle),
    ),
  );
}