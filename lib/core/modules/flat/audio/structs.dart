part of '../../../raylib_dartified.dart';

// AudioStream

extension AudioStreamCPEx on Pointer<AudioStreamC> {
  AudioStreamD toD() => ref.toD(this);
}

extension AudioStreamCEx on AudioStreamC {
  AudioStreamD toD([Pointer<AudioStreamC>? ptr]) => .new(
    op: AudioStreamD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Music

extension MusicCPEx on Pointer<MusicC> {
  MusicD toD() => ref.toD(this);
}

extension MusicCEx on MusicC {
  MusicD toD([Pointer<MusicC>? ptr]) => .new(
    op: MusicD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Sound

extension SoundCPEx on Pointer<SoundC> {
  SoundD toD() => ref.toD(this);
}

extension SoundCEx on SoundC {
  SoundD toD([Pointer<SoundC>? ptr]) => .new(
    op: SoundD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Wave

extension WaveCPEx on Pointer<WaveC> {
  WaveD toD() => ref.toD(this);
}

extension WaveCEx on WaveC {
  WaveD toD([Pointer<WaveC>? ptr]) => .new(
    op: WaveD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}