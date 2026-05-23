part of '../../../../raylib_dartified.dart';

extension MusicCPEx on Pointer<MusicC> {
  Pointer<MusicC> setC(MusicC o) { ref.setC(o); return this; }
  Pointer<MusicC> setD(MusicD o) { ref.setD(o); return this; }
  MusicD toD() => ref.toD(this);
}

extension MusicCEx on MusicC {
  MusicC setC(MusicC o) {
    stream.setC(o.stream);
    frameCount = o.frameCount;
    looping = o.looping;
    ctxType = o.ctxType;
    ctxData = o.ctxData;
    return this;
  }

  MusicC setD(MusicD o) {
    o.structOnOriginalPointer((p) {
      stream.setC(p.ref.stream);
      ctxData = p.ref.ctxData;
    });
    frameCount = o.frameCount;
    looping = o.looping;
    ctxType = o.ctxType.value;
    return this;
  }

  MusicD toD([Pointer<MusicC>? ptr]) => .new(
    originalPointer: ptr,
    stream: stream.toD(ptr?.cast()), // first field, we can just cast
    frameCount: frameCount,
    looping: looping,
    ctxType: .fromValue(ctxType),
  );
}

class MusicD extends StructD<MusicC, MusicD> with MusicBase<
  MusicD,
  AudioStreamD
> {
  @override
  AudioStreamD stream;
  
  @override
  int frameCount;
  
  @override
  bool looping;
  
  @override
  MusicContextType ctxType;

  MusicD({
    super.originalPointer,
    required this.stream,
    required this.frameCount,
    required this.looping,
    required this.ctxType,
  });

  @override
  MusicD setD(MusicD o) {
    stream.setD(o.stream);
    frameCount = o.frameCount;
    looping = o.looping;
    ctxType = o.ctxType;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<MusicC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<MusicC> p, int index) => p[index];

  @override
  void structSyncInto(RaylibTemp temp, Pointer<MusicC> p, String key) {} // NOTE: do nothing

  @override
  void nativeWriteInto(MusicC p)
    => throw UnsupportedError('MusicD: is raylib-owned; cannot write externally.');

  @override
  void nativeReadFrom(MusicC p) {
    structOnOriginalPointer((o) {
      o.ref.stream.setC(p.stream);
      o.ref.ctxData = p.ctxData;
    });
    stream.nativeReadFrom(p.stream);
    frameCount = p.frameCount;
    looping = p.looping;
    ctxType = .fromValue(p.ctxType);
  }

  @override
  MusicD clone() => .new(
    originalPointer: originalPointer,
    stream: stream.clone(),
    frameCount: frameCount,
    looping: looping,
    ctxType: ctxType,
  );
}