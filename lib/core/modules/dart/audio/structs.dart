part of '../../../raylib_dartified.dart';

// AudioStream

extension AudioStreamCPEx on Pointer<AudioStreamC> {
  AudioStreamD toD() => ref.toD(this);
}

extension AudioStreamCEx on AudioStreamC {
  AudioStreamD toD([Pointer<AudioStreamC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
  );
}

// Music

extension MusicCPEx on Pointer<MusicC> {
  MusicD toD() => ref.toD(this);
}

extension MusicCEx on MusicC {
  MusicD toD([Pointer<MusicC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    stream: stream.toD(ptr?.cast()), // first field, we can just cast
    frameCount: frameCount,
    looping: looping,
    ctxType: .fromValue(ctxType),
  );
}

// Sound

extension SoundCPEx on Pointer<SoundC> {
  SoundD toD() => ref.toD(this);
}

extension SoundCEx on SoundC {
  SoundD toD([Pointer<SoundC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    stream: stream.toD(),
    frameCount: frameCount,
  );
}

// Wave

extension WaveCPEx on Pointer<WaveC> {
  WaveD toD() => ref.toD(this);
}

extension WaveCEx on WaveC {
  int get waveLength => WaveD.BASE_waveLength(frameCount, channels);

  WaveD toD([Pointer<WaveC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    frameCount: frameCount,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
    data: WaveD.BASE_dataToBufferOrZero(NativeMemoryPointer(data), sampleSize, waveLength),
  );
}