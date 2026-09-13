part of '../../../raylib_dartified.dart';

// AudioStream

extension AudioStreamCPEx on Pointer<AudioStreamC> {
  AudioStreamD toDart() => ref.toDart(this);
}

extension AudioStreamCEx on AudioStreamC {
  AudioStreamD toDart([Pointer<AudioStreamC>? ptr]) => .new(
    op: AudioStreamD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Music

extension MusicCPEx on Pointer<MusicC> {
  MusicD toDart() => ref.toDart(this);
}

extension MusicCEx on MusicC {
  MusicD toDart([Pointer<MusicC>? ptr]) => .new(
    op: MusicD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Sound

extension SoundCPEx on Pointer<SoundC> {
  SoundD toDart() => ref.toDart(this);
}

extension SoundCEx on SoundC {
  SoundD toDart([Pointer<SoundC>? ptr]) => .new(
    op: SoundD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Wave

extension WaveCPEx on Pointer<WaveC> {
  WaveD toDart() => ref.toDart(this);
}

extension WaveCEx on WaveC {
  WaveD toDart([Pointer<WaveC>? ptr]) => .new(
    op: WaveD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}