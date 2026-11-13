part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Audio flat module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
abstract class RaylibAudioFlat<R extends RaylibBase> extends RaylibModule<R> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibAudioDartCaptureIds();

  RaylibAudioFlat(super.rl);

  @override
  @nonVirtual
  @DoNotAbbreviate()
  void onDispose() {
    AudioCallbackBase.disposeRegistry();
  }

  /// Initialize audio device and context
  void InitAudioDevice();
  
  /// Close the audio device and context
  void CloseAudioDevice();
  
  /// Check if audio device has been initialized successfully
  bool IsAudioDeviceReady();
  
  /// Set master volume (listener)
  void SetMasterVolume(
    double volume,
  );
  
  /// Get master volume (listener)
  double GetMasterVolume();
  
  /// Load wave data from file
  Wave LoadWave(
    XPtr<XChar> fileName,
  );
  
  /// Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
  Wave LoadWaveFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
  );
  
  /// Checks if wave data is valid (data loaded and parameters)
  bool IsWaveValid(
    Wave wave,
  );
  
  /// Load sound from file
  Sound LoadSound(
    XPtr<XChar> fileName,
  );
  
  /// Load sound from wave data
  Sound LoadSoundFromWave(
    Wave wave,
  );
  
  /// Create a new sound that shares the same sample data as the source sound, does not own the sound data
  Sound LoadSoundAlias(
    Sound source,
  );
  
  /// Checks if a sound is valid (data loaded and buffers initialized)
  bool IsSoundValid(
    Sound sound,
  );
  
  /// Update sound buffer with new data
  void UpdateSound(
    Sound sound,
    XPtr<XVoid> data,
    int sampleCount,
  );
  
  /// Unload wave data
  void UnloadWave(
    Wave wave,
  );
  
  /// Unload sound
  void UnloadSound(
    Sound sound,
  );
  
  /// Unload a sound alias (does not deallocate sample data)
  void UnloadSoundAlias(
    Sound alias,
  );
  
  /// Export wave data to file, returns true on success
  bool ExportWave(
    Wave wave,
    XPtr<XChar> fileName,
  );
  
  /// Export wave sample data to code (.h), returns true on success
  bool ExportWaveAsCode(
    Wave wave,
    XPtr<XChar> fileName,
  );
  
  /// Play a sound
  void PlaySound(
    Sound sound,
  );
  
  /// Stop playing a sound
  void StopSound(
    Sound sound,
  );
  
  /// Pause a sound
  void PauseSound(
    Sound sound,
  );
  
  /// Resume a paused sound
  void ResumeSound(
    Sound sound,
  );
  
  /// Check if a sound is currently playing
  bool IsSoundPlaying(
    Sound sound,
  );
  
  /// Set volume for a sound (1.0 is max level)
  void SetSoundVolume(
    Sound sound,
    double volume,
  );
  
  /// Set pitch for a sound (1.0 is base level)
  void SetSoundPitch(
    Sound sound,
    double pitch,
  );
  
  /// Set pan for a sound (0.5 is center)
  void SetSoundPan(
    Sound sound,
    double pan,
  );
  
  /// Copy a wave to a new wave
  Wave WaveCopy(
    Wave wave,
  );

  /// Crop a wave to defined frames range
  void WaveCrop(
    XStructPtr<Wave> wave,
    int initFrame,
    int finalFrame,
  );
  
  /// Convert wave data to desired format
  void WaveFormat(
    XStructPtr<Wave> wave,
    int sampleRate,
    int sampleSize,
    int channels,
  );
  
  /// Load samples data from wave as a 32bit float data array
  XPtr<XFloat32> LoadWaveSamples(
    Wave wave,
  );
  
  /// Unload samples data loaded with LoadWaveSamples()
  void UnloadWaveSamples(
    XPtr<XFloat32> samples,
  );
  
  /// Load music stream from file
  Music LoadMusicStream(
    XPtr<XChar> fileName,
  );
  
  /// Load music stream from data
  Music LoadMusicStreamFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> data,
    int dataSize,
  );
  
  /// Checks if a music stream is valid (context and buffers initialized)
  bool IsMusicValid(
    Music music,
  );
  
  /// Unload music stream
  void UnloadMusicStream(
    Music music,
  );
  
  /// Start music playing
  void PlayMusicStream(
    Music music,
  );
  
  /// Check if music is playing
  bool IsMusicStreamPlaying(
    Music music,
  );
  
  /// Updates buffers for music streaming
  void UpdateMusicStream(
    Music music,
  );
  
  /// Stop music playing
  void StopMusicStream(
    Music music,
  );
  
  /// Pause music playing
  void PauseMusicStream(
    Music music,
  );
  
  /// Resume playing paused music
  void ResumeMusicStream(
    Music music,
  );
  
  /// Seek music to a position (in seconds)
  void SeekMusicStream(
    Music music,
    double position,
  );
  
  /// Set volume for music (1.0 is max level)
  void SetMusicVolume(
    Music music,
    double volume,
  );
  
  /// Set pitch for a music (1.0 is base level)
  void SetMusicPitch(
    Music music,
    double pitch,
  );
  
  /// Set pan for a music (0.5 is center)
  void SetMusicPan(
    Music music,
    double pan,
  );
  
  /// Get music time length (in seconds)
  double GetMusicTimeLength(
    Music music,
  );
  
  /// Get current music time played (in seconds)
  double GetMusicTimePlayed(
    Music music,
  );
  
  /// Load audio stream (to stream raw audio pcm data)
  AudioStream LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels
  );
  
  /// Checks if an audio stream is valid (buffers initialized)
  bool IsAudioStreamValid(
    AudioStream stream,
  );
  
  /// Unload audio stream and free memory
  void UnloadAudioStream(
    AudioStream stream,
  );
  
  /// Update audio stream buffers with data
  void UpdateAudioStream(
    AudioStream stream,
    XPtr<XVoid> data,
    int frameCount,
  );
  
  /// Check if any audio stream buffers requires refill
  bool IsAudioStreamProcessed(
    AudioStream stream,
  );
  
  /// Play audio stream
  void PlayAudioStream(
    AudioStream stream,
  );
  
  /// Pause audio stream
  void PauseAudioStream(
    AudioStream stream,
  );
  
  /// Resume audio stream
  void ResumeAudioStream(
    AudioStream stream,
  );
  
  /// Check if audio stream is playing
  bool IsAudioStreamPlaying(
    AudioStream stream,
  );
  
  /// Stop audio stream
  void StopAudioStream(
    AudioStream stream,
  );
  
  /// Set volume for audio stream (1.0 is max level)
  void SetAudioStreamVolume(
    AudioStream stream,
    double volume,
  );
  
  /// Set pitch for audio stream (1.0 is base level)
  void SetAudioStreamPitch(
    AudioStream stream,
    double pitch,
  );
  
  /// Set pan for a sound (-1.0 left, 0.0 center, 1.0 right)
  void SetAudioStreamPan(
    AudioStream stream,
    double pan,
  );
  
  /// Default size for new audio streams
  void SetAudioStreamBufferSizeDefault(
    int size,
  );
  
  /// Audio thread callback to request new data
  void SetAudioStreamCallback(
    AudioStream stream,
    XPtr<XFunction<AudioCallbackBase>> callback,
  );
  
  /// Attach audio stream processor to stream, receives the samples as 'float'
  void AttachAudioStreamProcessor(
    AudioStream stream,
    XPtr<XFunction<AudioCallbackBase>> processor,
  );
  
  /// Detach audio stream processor from stream
  void DetachAudioStreamProcessor(
    AudioStream stream,
    XPtr<XFunction<AudioCallbackBase>> processor,
  );
  
  /// Attach audio stream processor to the entire audio pipeline, receives the samples as 'float'
  void AttachAudioMixedProcessor(
    XPtr<XFunction<AudioCallbackBase>> processor,
  );
  
  /// Detach audio stream processor from the entire audio pipeline
  void DetachAudioMixedProcessor(
    XPtr<XFunction<AudioCallbackBase>> processor,
  );
}