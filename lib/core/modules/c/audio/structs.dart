// ignore_for_file: camel_case_types

part of '../../../raylib.dart';

final class WaveC extends Struct {
  @UnsignedInt()
  external int frameCount;

  @UnsignedInt()
  external int sampleRate;

  @UnsignedInt()
  external int sampleSize;

  @UnsignedInt()
  external int channels;

  external Pointer<Void> data;
}

final class rAudioBuffer extends Opaque {}

final class rAudioProcessor extends Opaque {}

final class AudioStreamC extends Struct {
  external Pointer<rAudioBuffer> buffer;

  external Pointer<rAudioProcessor> processor;

  @UnsignedInt()
  external int sampleRate;

  @UnsignedInt()
  external int sampleSize;

  @UnsignedInt()
  external int channels;
}

final class SoundC extends Struct {
  external AudioStreamC stream;

  @UnsignedInt()
  external int frameCount;
}

final class MusicC extends Struct {
  external AudioStreamC stream;

  @UnsignedInt()
  external int frameCount;

  @Bool()
  external bool looping;

  @Int()
  external int ctxType;

  external Pointer<Void> ctxData;
}