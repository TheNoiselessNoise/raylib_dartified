part of '../../../../raylib_dartified.dart';

extension AudioStreamCPEx on Pointer<AudioStreamC> {
  Pointer<AudioStreamC> setC(AudioStreamC o) { ref.setC(o); return this; }
  Pointer<AudioStreamC> setD(AudioStreamD o) { ref.setD(o); return this; }
  AudioStreamD toD() => ref.toD(this);
}

extension AudioStreamCEx on AudioStreamC {
  AudioStreamC setC(AudioStreamC o) {
    buffer = o.buffer;
    processor = o.processor;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    return this;
  }

  AudioStreamC setD(AudioStreamD o) {
    o.structOnOp((p) {
      buffer = p.ref.buffer;
      processor = p.ref.processor;
    });
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    return this;
  }

  AudioStreamD toD([Pointer<AudioStreamC>? ptr]) => .new(
    originalPointer: ptr,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
  );
}

class AudioStreamD extends StructD<AudioStreamC, AudioStreamD> with AudioStreamBase<AudioStreamD> {
  @override
  int sampleRate;
  
  @override
  int sampleSize;
  
  @override
  int channels;

  AudioStreamD({
    super.originalPointer,
    this.sampleRate = 0,
    this.sampleSize = 0,
    this.channels = 0,
  });

  @override
  AudioStreamD setD(AudioStreamD o) {
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<AudioStreamC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<AudioStreamC> p, int index) => p[index];

  @override
  void structSyncInto(RaylibTemp temp, Pointer<AudioStreamC> p, String key) {} // NOTE: do nothing

  @override
  void nativeWriteInto(AudioStreamC p)
    => throw UnsupportedError('AudioStreamD: is raylib-owned; cannot write externally.');

  @override
  void nativeReadFrom(AudioStreamC p) {
    structOnOp((o) {
      o.ref.buffer = p.buffer;
      o.ref.processor = p.processor;
    });
    sampleRate = p.sampleRate;
    sampleSize = p.sampleSize;
    channels = p.channels;
  }

  @override
  AudioStreamD clone() => .new(
    originalPointer: originalPointer,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
  );
}