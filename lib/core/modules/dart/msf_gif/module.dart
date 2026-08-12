part of '../../../raylib_dartified.dart';

class RaylibMsfGifD extends RaylibModule<Raylib> {
  late final NativeStructAlloc<MsfGifStateC, MsfGifStateD> _MsfGifState$;
  late final NativeStructAlloc<MsfGifResultC, MsfGifResultD> _MsfGifResult$;

  RaylibMsfGifD(super.rl) {
    rl.Temp.registerAllocator(_MsfGifState$ = .new(rl.Temp,
      byteSize:        sizeOf<MsfGifStateC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));

    rl.Temp.registerAllocator(_MsfGifResult$ = .new(rl.Temp,
      byteSize:        sizeOf<MsfGifResultC>(),
      refFunc:         (ptr)         => ptr.ref,
      setRefFunc:      (ptr, v)      => ptr..ref = v,
      pointerToStruct: (ptr)         => ptr.toD(),
      setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
      indexerFunc:     (ptr, i)      => ptr[i],
      indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
      updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
    ));
  }

  RaylibMsfGif get _ffi => rl.module<RaylibMsfGif>();

  int get msf_gif_alpha_threshold => _ffi._msf_gif_alpha_threshold.value;
  set msf_gif_alpha_threshold(int v) => _ffi._msf_gif_alpha_threshold.value = v;

  int get msf_gif_bgra_flag => _ffi._msf_gif_bgra_flag.value;
  set msf_gif_bgra_flag(int v) => _ffi._msf_gif_bgra_flag.value = v;

  int msf_gif_begin(
    MsfGifStateD handle,
    num width,
    num height,
  ) => run(
    () => 'msf_gif_begin(...)',
    () => _ffi.msf_gif_begin(
      _MsfGifState$.Ref1(handle),
      width.toInt(),
      height.toInt(),
    ),
  );

  int msf_gif_frame(
    MsfGifStateD handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  ) => run(
    () => 'msf_gif_frame(...)',
    () => _ffi.msf_gif_frame(
      _MsfGifState$.Ref1(handle),
      rl.Temp.TypedDataList$.Array(pixelData).cast(),
      centiSecondsPerFame.toInt(),
      maxBitDepth.toInt(),
      pitchInBytes.toInt(),
    ),
  );

  MsfGifResultD msf_gif_end(
    MsfGifStateD handle,
  ) => run(
    () => 'msf_gif_end(...)',
    () => _MsfGifResult$.RefCapture(
      'msf_gif_end',
      (p) => _ffi.msf_gif_end(
        _MsfGifState$.Ref1(handle),
      ),
    ),
  );

  void msf_gif_free(
    MsfGifResultD result,
  ) => run(
    () => 'msf_gif_free(...)',
    () => _ffi.msf_gif_free(
      result.getOriginalPointerAndDispose().ref,
    ),
  );

  // int msf_gif_begin_to_file(
  //   MsfGifStateD handle,
  //   int width,
  //   int height,
  //   MsfGifFileWriteFuncC func,
  //   Pointer<Void> filePointer,
  // )
  //   => _msf_gif_begin_to_file(handle, width, height, func, filePointer);

  int msf_gif_frame_to_file(
    MsfGifStateD handle,
    Uint8List pixelData,
    num centiSecondsPerFame,
    num maxBitDepth,
    num pitchInBytes,
  ) => run(
    () => 'msf_gif_frame_to_file(...)',
    () => _ffi.msf_gif_frame_to_file(
      _MsfGifState$.Ref1(handle),
      rl.Temp.TypedDataList$.Array(pixelData).cast(),
      centiSecondsPerFame.toInt(),
      maxBitDepth.toInt(),
      pitchInBytes.toInt(),
    ),
  );

  int msf_gif_end_to_file(
    MsfGifStateD handle,
  ) => run(
    () => 'msf_gif_end_to_file(...)',
    () => _ffi.msf_gif_end_to_file(
      _MsfGifState$.Ref1(handle),
    ),
  );
}