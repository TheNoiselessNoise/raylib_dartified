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
    o.onOriginalPointer((p) {
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

class AudioStreamD extends StructD<AudioStreamD, AudioStreamC> {
  int sampleRate;
  int sampleSize;
  int channels;

  AudioStreamD({
    super.originalPointer,
    this.sampleRate = 0,
    this.sampleSize = 0,
    this.channels = 0,
  });

  @override
  AudioStreamD setC(AudioStreamC o) {
    onOriginalPointer((p) {
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
  Pointer<AudioStreamC> allocatePointer(RaylibTemp temp, String key, [int count = 1]) =>
      throw UnsupportedError('FAudioStreamD: is raylib-owned; cannot allocate externally.');

  @override
  void syncInto(RaylibTemp temp, Pointer<AudioStreamC> p, String key) {} // NOTE: do nothing

  @override
  void allocateInto(RaylibTemp temp, Pointer<AudioStreamC> p, String key) =>
      throw UnsupportedError('FAudioStreamD: is raylib-owned; cannot allocate externally.');

  @override
  void writeInto(AudioStreamC p) =>
      throw UnsupportedError('FAudioStreamD: is raylib-owned; cannot write externally.');

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