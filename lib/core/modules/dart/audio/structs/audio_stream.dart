part of '../../../../raylib.dart';

extension AudioStreamCPEx on Pointer<AudioStreamC> {
  Pointer<AudioStreamC> setC(AudioStreamC o) {
    ref.setC(o);
    return this;
  }

  Pointer<AudioStreamC> setD(AudioStreamD o) {
    ref.setD(o);
    return this;
  }

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
    o.structOnOriginalPointer((p) {
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

class AudioStreamD extends StructD<AudioStreamC, AudioStreamD> with AudioStreamBase {
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
  AudioStreamD setC(AudioStreamC o) {
    structOnOriginalPointer((p) {
      p.ref.buffer = o.buffer;
      p.ref.processor = o.processor;
    });
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    return this;
  }

  @override
  AudioStreamD setD(AudioStreamD o) {
    originalPointer ??= o.originalPointer;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp)
    => throw UnsupportedError('AudioStreamD: is raylib-owned; cannot allocate externally.');

  @override
  void structSyncInto(RaylibTemp temp, Pointer<AudioStreamC> p, String key) {} // NOTE: do nothing

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<AudioStreamC> p, String key)
    => throw UnsupportedError('AudioStreamD: is raylib-owned; cannot allocate externally.');

  @override
  void nativeWriteInto(AudioStreamC p)
    => throw UnsupportedError('AudioStreamD: is raylib-owned; cannot write externally.');

  @override
  String signature() => '$structName(sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels)';

  @override
  AudioStreamD clone() => .new(
    originalPointer: originalPointer,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
  );
}