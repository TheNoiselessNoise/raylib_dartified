part of '../../../../raylib.dart';

extension SoundCPEx on Pointer<SoundC> {
  Pointer<SoundC> setC(SoundC o) {
    ref.setC(o);
    return this;
  }

  Pointer<SoundC> setD(SoundD o) {
    ref.setD(o);
    return this;
  }

  SoundD toD() => ref.toD(this);
}

extension SoundCEx on SoundC {
  SoundC setC(SoundC o) {
    stream.setC(o.stream);
    frameCount = o.frameCount;
    return this;
  }

  SoundC setD(SoundD o) {
    o.nativeOnOriginalPointer((p) {
      stream.setC(p.ref.stream);
    });
    frameCount = o.frameCount;
    return this;
  }

  SoundD toD([Pointer<SoundC>? ptr]) => .new(
    originalPointer: ptr,
    stream: stream.toD(),
    frameCount: frameCount,
  );
}

class SoundD extends StructD<SoundD, SoundC> with SoundBase {
  @override
  AudioStreamD stream;
  
  @override
  int frameCount;

  SoundD({
    super.originalPointer,
    required this.stream,
    required this.frameCount,
  });

  @override
  SoundD setC(SoundC o) {
    nativeOnOriginalPointer((p) {
      p.ref.stream.setC(o.stream);
    });
    stream.setC(o.stream);
    frameCount = o.frameCount;
    return this;
  }

  @override
  SoundD setD(SoundD o) {
    originalPointer ??= o.originalPointer;
    stream.setD(o.stream);
    frameCount = o.frameCount;
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp)
    => throw UnsupportedError('SoundD: is raylib-owned; cannot allocate externally.');

  @override
  void nativeSyncInto(RaylibTemp temp, Pointer<SoundC> p, String key) {} // NOTE: do nothing

  @override
  void nativeAllocateInto(RaylibTemp temp, Pointer<SoundC> p, String key)
    => throw UnsupportedError('SoundD: is raylib-owned; cannot allocate externally.');

  @override
  void nativeWriteInto(SoundC p)
    => throw UnsupportedError('SoundD: is raylib-owned; cannot write externally.');

  @override
  String signature() => '$structName(stream: $stream, frameCount: $frameCount)';

  @override
  SoundD clone() => .new(
    originalPointer: originalPointer,
    stream: stream.clone(),
    frameCount: frameCount,
  );
}