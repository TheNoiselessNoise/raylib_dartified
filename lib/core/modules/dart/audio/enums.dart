part of '../../../raylib.dart';

enum MusicContextType {
  MUSIC_AUDIO_NONE(0), // No audio context loaded
  MUSIC_AUDIO_WAV(1),  // WAV audio context
  MUSIC_AUDIO_OGG(2),  // OGG audio context
  MUSIC_AUDIO_FLAC(3), // FLAC audio context
  MUSIC_AUDIO_MP3(4),  // MP3 audio context
  MUSIC_AUDIO_QOA(5),  // QOA audio context
  MUSIC_MODULE_XM(6),  // XM module audio context
  MUSIC_MODULE_MOD(7); // MOD module audio context

  final int value;
  const MusicContextType(this.value);

  static MusicContextType fromValue(int value) => switch (value) {
    0 => MUSIC_AUDIO_NONE,
    1 => MUSIC_AUDIO_WAV,
    2 => MUSIC_AUDIO_OGG,
    3 => MUSIC_AUDIO_FLAC,
    4 => MUSIC_AUDIO_MP3,
    5 => MUSIC_AUDIO_QOA,
    6 => MUSIC_MODULE_XM,
    7 => MUSIC_MODULE_MOD,
    _ => throw ArgumentError('Unknown value for MusicContextType: $value'),
  };
}