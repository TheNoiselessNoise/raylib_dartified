part of '../../../backend.dart';

// AudioStream
extension AudioStreamCPEx on Pointer<AudioStreamC> { AudioStream toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension AudioStreamCEx on AudioStreamC { AudioStream toDart(Pointer<AudioStreamC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }
// Music
extension MusicCPEx on Pointer<MusicC> { Music toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension MusicCEx on MusicC { Music toDart(Pointer<MusicC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }
// Sound
extension SoundCPEx on Pointer<SoundC> { Sound toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension SoundCEx on SoundC { Sound toDart(Pointer<SoundC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }
// Wave
extension WaveCPEx on Pointer<WaveC> { Wave toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension WaveCEx on WaveC { Wave toDart(Pointer<WaveC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }