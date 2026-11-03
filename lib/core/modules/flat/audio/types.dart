part of '../../../raylib_dartified.dart';

// AudioStream

extension AudioStreamCPEx on Pointer<AudioStreamC> {
  AudioStream toDart() => .new(
    op: AudioStream.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension AudioStreamCEx on AudioStreamC {
  AudioStream toDart(Pointer<AudioStreamC> ptr) => .new(
    op: AudioStream.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}

// Music

extension MusicCPEx on Pointer<MusicC> {
  Music toDart() => .new(
    op: Music.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension MusicCEx on MusicC {
  Music toDart(Pointer<MusicC> ptr) => .new(
    op: Music.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}

// Sound

extension SoundCPEx on Pointer<SoundC> {
  Sound toDart() => .new(
    op: Sound.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension SoundCEx on SoundC {
  Sound toDart(Pointer<SoundC> ptr) => .new(
    op: Sound.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}

// Wave

extension WaveCPEx on Pointer<WaveC> {
  Wave toDart() => .new(
    op: Wave.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension WaveCEx on WaveC {
  Wave toDart(Pointer<WaveC> ptr) => .new(
    op: Wave.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}