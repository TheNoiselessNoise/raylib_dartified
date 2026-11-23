part of '../../raylib_dartified.dart';

/// Backend-agnostic Raylib Audio module.
final class RaylibAudioDart extends XPackageModule<Raylib> {

  RaylibAudioDart(super.pkg);

  RaylibAudioFlat get _flat => pkg.module();

  /// Initialize audio device and context
  void InitAudioDevice() => _flat.InitAudioDevice();

  /// Close the audio device and context
  void CloseAudioDevice() => _flat.CloseAudioDevice();
  
  /// Check if audio device has been initialized successfully
  bool IsAudioDeviceReady() => _flat.IsAudioDeviceReady();

  /// Set master volume (listener)
  void SetMasterVolume(
    double volume,
  ) => _flat.SetMasterVolume(
    volume,
  );

  /// Get master volume (listener)
  double GetMasterVolume() => _flat.GetMasterVolume();

  /// Load wave data from file
  Wave LoadWave(
    String fileName,
  ) => _flat.LoadWave(
    String$.ValueOrNull(fileName),
  );

  /// Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
  Wave LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => _flat.LoadWaveFromMemory(
    String$.ValueOrNull(fileType),
    UnsignedChar$.Array(fileData),
    fileData.length,
  );

  /// Checks if wave data is valid (data loaded and parameters)
  bool IsWaveValid(
    Wave wave,
  ) => _flat.IsWaveValid(
    wave,
  );

  /// Load sound from file
  Sound LoadSound(
    String fileName,
  ) => _flat.LoadSound(
    String$.ValueOrNull(fileName),
  );

  /// Load sound from wave data
  Sound LoadSoundFromWave(
    Wave wave,
  ) => _flat.LoadSoundFromWave(
    wave,
  );

  /// Create a new sound that shares the same sample data as the source sound, does not own the sound data
  Sound LoadSoundAlias(
    Sound source,
  ) => _flat.LoadSoundAlias(
    source,
  );

  /// Checks if a sound is valid (data loaded and buffers initialized)
  bool IsSoundValid(
    Sound sound,
  ) => _flat.IsSoundValid(
    sound,
  );

  /// Update sound buffer with new data
  void UpdateSound(
    Sound sound,
    TypedDataList data,
    int sampleCount,
  ) => _flat.UpdateSound(
    sound,
    TypedDataList$.Array(data),
    sampleCount,
  );

  /// Unload wave data
  void UnloadWave(
    Wave wave,
  ) => _flat.UnloadWave(
    wave,
  );

  /// Unload sound
  void UnloadSound(
    Sound sound,
  ) => _flat.UnloadSound(
    sound,
  );

  /// Unload a sound alias (does not deallocate sample data)
  void UnloadSoundAlias(
    Sound alias,
  ) => _flat.UnloadSoundAlias(
    alias,
  );

  /// Export wave data to file, returns true on success
  bool ExportWave(
    Wave wave,
    String fileName,
  ) => _flat.ExportWave(
    wave,
    String$.ValueOrNull(fileName),
  );

  /// Export wave sample data to code (.h), returns true on success
  bool ExportWaveAsCode(
    Wave wave,
    String fileName,
  ) => _flat.ExportWaveAsCode(
    wave,
    String$.ValueOrNull(fileName),
  );

  /// Play a sound
  void PlaySound(
    Sound sound,
  ) => _flat.PlaySound(
    sound,
  );

  /// Stop playing a sound
  void StopSound(
    Sound sound,
  ) => _flat.StopSound(
    sound,
  );

  /// Pause a sound
  void PauseSound(
    Sound sound,
  ) => _flat.PauseSound(
    sound,
  );

  /// Resume a paused sound
  void ResumeSound(
    Sound sound,
  ) => _flat.ResumeSound(
    sound,
  );

  /// Check if a sound is currently playing
  bool IsSoundPlaying(
    Sound sound,
  ) => _flat.IsSoundPlaying(
    sound,
  );

  /// Set volume for a sound (1.0 is max level)
  void SetSoundVolume(
    Sound sound,
    double volume,
  ) => _flat.SetSoundVolume(
    sound,
    volume,
  );

  /// Set pitch for a sound (1.0 is base level)
  void SetSoundPitch(
    Sound sound,
    double pitch,
  ) => _flat.SetSoundPitch(
    sound,
    pitch,
  );

  /// Set pan for a sound (0.5 is center)
  void SetSoundPan(
    Sound sound,
    double pan,
  ) => _flat.SetSoundPan(
    sound,
    pan,
  );

  /// Copy a wave to a new wave
  Wave WaveCopy(
    Wave wave,
  ) => _flat.WaveCopy(
    wave,
  );

  /// Crop a wave to defined frames range
  void WaveCrop(
    Wave wave,
    int initFrame,
    int finalFrame,
  ) => _flat.WaveCrop(
    Wave$.Ref1(wave),
    initFrame,
    finalFrame,
  );

  /// Convert wave data to desired format
  void WaveFormat(
    Wave wave,
    int sampleRate,
    int sampleSize,
    int channels,
  ) => _flat.WaveFormat(
    Wave$.Ref1(wave),
    sampleRate,
    sampleSize,
    channels,
  );

  /// Load samples data from wave as a 32bit float data array
  List<double> LoadWaveSamples(
    Wave wave,
  ) {
    final samples = _flat.LoadWaveSamples(
      wave,
    );
    try {
      return .generate(wave.waveLength, (i) => samples[i]);
    } finally {
      _flat.UnloadWaveSamples(samples);
    }
  }

  /// Load music stream from file
  Music LoadMusicStream(
    String fileName,
  ) => _flat.LoadMusicStream(
    String$.ValueOrNull(fileName),
  );

  /// Load music stream from data
  Music LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => _flat.LoadMusicStreamFromMemory(
    String$.ValueOrNull(fileType),
    UnsignedChar$.Array(data),
    data.length,
  );

  /// Checks if a music stream is valid (context and buffers initialized)
  bool IsMusicValid(
    Music music,
  ) => _flat.IsMusicValid(
    music,
  );

  /// Unload music stream
  void UnloadMusicStream(
    Music music,
  ) => _flat.UnloadMusicStream(
    music,
  );

  /// Start music playing
  void PlayMusicStream(
    Music music,
  ) => _flat.PlayMusicStream(
    music,
  );

  /// Check if music is playing
  bool IsMusicStreamPlaying(
    Music music,
  ) => _flat.IsMusicStreamPlaying(
    music,
  );

  /// Updates buffers for music streaming
  void UpdateMusicStream(
    Music music,
  ) => _flat.UpdateMusicStream(
    music,
  );

  /// Stop music playing
  void StopMusicStream(
    Music music,
  ) => _flat.StopMusicStream(
    music,
  );

  /// Pause music playing
  void PauseMusicStream(
    Music music,
  ) => _flat.PauseMusicStream(
    music,
  );

  /// Resume playing paused music
  void ResumeMusicStream(
    Music music,
  ) => _flat.ResumeMusicStream(
    music,
  );

  /// Seek music to a position (in seconds)
  void SeekMusicStream(
    Music music,
    double position,
  ) => _flat.SeekMusicStream(
    music,
    position,
  );

  /// Set volume for music (1.0 is max level)
  void SetMusicVolume(
    Music music,
    double volume,
  ) => _flat.SetMusicVolume(
    music,
    volume,
  );

  /// Set pitch for a music (1.0 is base level)
  void SetMusicPitch(
    Music music,
    double pitch,
  ) => _flat.SetMusicPitch(
    music,
    pitch,
  );

  /// Set pan for a music (0.5 is center)
  void SetMusicPan(
    Music music,
    double pan,
  ) => _flat.SetMusicPan(
    music,
    pan,
  );

  /// Get music time length (in seconds)
  double GetMusicTimeLength(
    Music music,
  ) => _flat.GetMusicTimeLength(
    music,
  );

  /// Get current music time played (in seconds)
  double GetMusicTimePlayed(
    Music music,
  ) => _flat.GetMusicTimePlayed(
    music,
  );

  /// Load audio stream (to stream raw audio pcm data)
  AudioStream LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels,
  ) => _flat.LoadAudioStream(
    sampleRate,
    sampleSize,
    channels,
  );

  /// Checks if an audio stream is valid (buffers initialized)
  bool IsAudioStreamValid(
    AudioStream stream,
  ) => _flat.IsAudioStreamValid(
    stream,
  );

  /// Unload audio stream and free memory
  void UnloadAudioStream(
    AudioStream stream,
  ) => _flat.UnloadAudioStream(
    stream,
  );

  /// Update audio stream buffers with data
  void UpdateAudioStream(
    AudioStream stream,
    TypedDataList data,
  ) => _flat.UpdateAudioStream(
    stream,
    TypedDataList$.Array(data),
    data.length,
  );

  /// Check if any audio stream buffers requires refill
  bool IsAudioStreamProcessed(
    AudioStream stream,
  ) => _flat.IsAudioStreamProcessed(
    stream,
  );

  /// Play audio stream
  void PlayAudioStream(
    AudioStream stream,
  ) => _flat.PlayAudioStream(
    stream,
  );

  /// Pause audio stream
  void PauseAudioStream(
    AudioStream stream,
  ) => _flat.PauseAudioStream(
    stream,
  );

  /// Resume audio stream
  void ResumeAudioStream(
    AudioStream stream,
  ) => _flat.ResumeAudioStream(
    stream,
  );

  /// Check if audio stream is playing
  bool IsAudioStreamPlaying(
    AudioStream stream,
  ) => _flat.IsAudioStreamPlaying(
    stream,
  );

  /// Stop audio stream
  void StopAudioStream(
    AudioStream stream,
  ) => _flat.StopAudioStream(
    stream,
  );

  /// Set volume for audio stream (1.0 is max level)
  void SetAudioStreamVolume(
    AudioStream stream,
    double volume,
  ) => _flat.SetAudioStreamVolume(
    stream,
    volume,
  );

  /// Set pitch for audio stream (1.0 is base level)
  void SetAudioStreamPitch(
    AudioStream stream,
    double pitch,
  ) => _flat.SetAudioStreamPitch(
    stream,
    pitch,
  );

  /// Set pan for a sound (-1.0 left, 0.0 center, 1.0 right)
  void SetAudioStreamPan(
    AudioStream stream,
    double pan,
  ) => _flat.SetAudioStreamPan(
    stream,
    pan,
  );

  /// Default size for new audio streams
  void SetAudioStreamBufferSizeDefault(
    int size,
  ) => _flat.SetAudioStreamBufferSizeDefault(
    size,
  );

  /// Audio thread callback to request new data
  void SetAudioStreamCallback(
    AudioStream stream,
    covariant AudioCallbackBase? callback,
  ) => _flat.SetAudioStreamCallback(
    stream,
    callback?.attach() ?? .nullptr(),
  );

  /// Attach audio stream processor to stream, receives the samples as 'float'
  void AttachAudioStreamProcessor(
    AudioStream stream,
    covariant AudioCallbackBase processor,
  ) => _flat.AttachAudioStreamProcessor(
    stream,
    processor.attach(),
  );

  /// Detach audio stream processor from stream
  void DetachAudioStreamProcessor(
    AudioStream stream,
    covariant AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => _flat.DetachAudioStreamProcessor(
    stream,
    processor.detach(keepAlive),
  );

  /// Attach audio stream processor to the entire audio pipeline, receives the samples as 'float'
  void AttachAudioMixedProcessor(
    covariant AudioCallbackBase processor,
  ) => _flat.AttachAudioMixedProcessor(
    processor.attach(),
  );

  /// Detach audio stream processor from the entire audio pipeline
  void DetachAudioMixedProcessor(
    covariant AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => _flat.DetachAudioMixedProcessor(
    processor.detach(keepAlive),
  );
}