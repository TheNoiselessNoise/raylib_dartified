part of '../../../raylib_dartified.dart';

// AudioStream

extension AudioStreamCPEx on Pointer<AudioStreamC> {
  AudioStream toDart() => ref.toDart(this);
}

extension AudioStreamCEx on AudioStreamC {
  AudioStream toDart([Pointer<AudioStreamC>? ptr]) => .new(
    op: AudioStream.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Music

extension MusicCPEx on Pointer<MusicC> {
  Music toDart() => ref.toDart(this);
}

extension MusicCEx on MusicC {
  Music toDart([Pointer<MusicC>? ptr]) => .new(
    op: Music.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Sound

extension SoundCPEx on Pointer<SoundC> {
  Sound toDart() => ref.toDart(this);
}

extension SoundCEx on SoundC {
  Sound toDart([Pointer<SoundC>? ptr]) => .new(
    op: Sound.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Wave

extension WaveCPEx on Pointer<WaveC> {
  Wave toDart() => ref.toDart(this);
}

extension WaveCEx on WaveC {
  Wave toDart([Pointer<WaveC>? ptr]) => .new(
    op: Wave.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}