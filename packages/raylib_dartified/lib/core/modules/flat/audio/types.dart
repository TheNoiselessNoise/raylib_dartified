part of '../../../raylib_dartified.dart';

// AudioStream

extension AudioStreamCPEx on Pointer<AudioStreamC> {
  AudioStream toDart() => .new(
    op: AudioStream.struct.ptr(XNativePtr(this)),
  );
}

extension AudioStreamCEx on AudioStreamC {
  AudioStream toDart(Pointer<AudioStreamC> ptr) => .new(
    op: AudioStream.struct.ptr(XNativePtr(ptr..ref = this)),
  );
}

// Music

extension MusicCPEx on Pointer<MusicC> {
  Music toDart() => .new(
    op: Music.struct.ptr(XNativePtr(this)),
  );
}

extension MusicCEx on MusicC {
  Music toDart(Pointer<MusicC> ptr) => .new(
    op: Music.struct.ptr(XNativePtr(ptr..ref = this)),
  );
}

// Sound

extension SoundCPEx on Pointer<SoundC> {
  Sound toDart() => .new(
    op: Sound.struct.ptr(XNativePtr(this)),
  );
}

extension SoundCEx on SoundC {
  Sound toDart(Pointer<SoundC> ptr) => .new(
    op: Sound.struct.ptr(XNativePtr(ptr..ref = this)),
  );
}

// Wave

extension WaveCPEx on Pointer<WaveC> {
  Wave toDart() => .new(
    op: Wave.struct.ptr(XNativePtr(this)),
  );
}

extension WaveCEx on WaveC {
  Wave toDart(Pointer<WaveC> ptr) => .new(
    op: Wave.struct.ptr(XNativePtr(ptr..ref = this)),
  );
}