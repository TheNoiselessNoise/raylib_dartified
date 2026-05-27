part of '../../../../raylib_dartified.dart';

extension SoundCPEx on Pointer<SoundC> {
  Pointer<SoundC> setC(SoundC o) { ref.setC(o); return this; }
  Pointer<SoundC> setD(SoundD o) { ref.setD(o); return this; }
  SoundD toD() => ref.toD(this);
}

extension SoundCEx on SoundC {
  SoundC setC(SoundC o) {
    stream.setC(o.stream);
    frameCount = o.frameCount;
    return this;
  }

  SoundC setD(SoundD o) {
    o.structOnOp((p) {
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

class SoundD extends StructD<SoundC, SoundD> with SoundBase<
  SoundD,
  AudioStreamD
> {
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
  SoundD setD(SoundD o) {
    stream.setD(o.stream);
    frameCount = o.frameCount;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<SoundC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<SoundC> p, int index) => p[index];

  @override
  void structSyncInto(RaylibTemp temp, Pointer<SoundC> p, String key) {} // NOTE: do nothing

  @override
  void nativeWriteInto(SoundC p)
    => throw UnsupportedError('SoundD: is raylib-owned; cannot write externally.');

  @override
  void nativeReadFrom(SoundC p) {
    structOnOp((o) {
      o.ref.stream.setC(p.stream);
    });
    stream.nativeReadFrom(p.stream);
    frameCount = p.frameCount;
  }

  @override
  SoundD clone() => .new(
    originalPointer: originalPointer,
    stream: stream.clone(),
    frameCount: frameCount,
  );
}