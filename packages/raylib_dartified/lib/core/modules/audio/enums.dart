part of '../../raylib_dartified.dart';

/// `MusicContextType`
enum MusicContextType with XEnum {
  /// `MUSIC_AUDIO_NONE`, no audio context loaded
  MUSIC_AUDIO_NONE(0),
  /// `MUSIC_AUDIO_WAV`, WAV audio context
  MUSIC_AUDIO_WAV(1),
  /// `MUSIC_AUDIO_OGG`, OGG audio context
  MUSIC_AUDIO_OGG(2),
  /// `MUSIC_AUDIO_FLAC`, FLAC audio context
  MUSIC_AUDIO_FLAC(3),
  /// `MUSIC_AUDIO_MP3`, MP3 audio context
  MUSIC_AUDIO_MP3(4),
  /// `MUSIC_AUDIO_QOA`, QOA audio context
  MUSIC_AUDIO_QOA(5),
  /// `MUSIC_MODULE_XM`, XM module audio context
  MUSIC_MODULE_XM(6),
  /// `MUSIC_MODULE_MOD`, MOD module audio context
  MUSIC_MODULE_MOD(7);

  const MusicContextType(this.value);

  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [MusicContextType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static MusicContextType fromValue(int value) => switch (value) {
    0 => MUSIC_AUDIO_NONE,
    1 => MUSIC_AUDIO_WAV,
    2 => MUSIC_AUDIO_OGG,
    3 => MUSIC_AUDIO_FLAC,
    4 => MUSIC_AUDIO_MP3,
    5 => MUSIC_AUDIO_QOA,
    6 => MUSIC_MODULE_XM,
    7 => MUSIC_MODULE_MOD,
    _ => throw ArgumentError('Unknown value for $MusicContextType: $value'),
  };
}