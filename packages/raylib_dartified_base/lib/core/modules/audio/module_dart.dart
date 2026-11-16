part of '../../raylib_dartified_base.dart';

/// Backend-agnostic Raylib Audio module.
final class RaylibAudioDart<R extends RaylibBase> extends RaylibModule<R> {

  RaylibAudioDart(super.rl);

  RaylibAudioFlat get _flat => rl.module();

  /// Initialize audio device and context
  void InitAudioDevice() => debugRun(
    () => 'InitAudioDevice()',
    () => _flat.InitAudioDevice(),
  );

  /// Close the audio device and context
  void CloseAudioDevice() => debugRun(
    () => 'CloseAudioDevice()',
    () => _flat.CloseAudioDevice(),
  );
  
  /// Check if audio device has been initialized successfully
  bool IsAudioDeviceReady() => debugRun(
    () => 'IsAudioDeviceReady()',
    () => _flat.IsAudioDeviceReady(),
  );

  /// Set master volume (listener)
  void SetMasterVolume(
    double volume,
  ) => debugRun(
    () => 'SetMasterVolume($volume)',
    () => _flat.SetMasterVolume(
      volume,
    ),
  );

  /// Get master volume (listener)
  double GetMasterVolume() => debugRun(
    () => 'GetMasterVolume()',
    () => _flat.GetMasterVolume(),
  );

  /// Load wave data from file
  Wave LoadWave(
    String fileName,
  ) => debugRun(
    () => 'LoadWave($fileName)',
    () => _flat.LoadWave(
      String$.ValueOrNull(fileName),
    ),
  );

  /// Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
  Wave LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => debugRun(
    () => 'LoadWaveFromMemory($fileType, fileData: ${fileData.length})',
    () => _flat.LoadWaveFromMemory(
      String$.ValueOrNull(fileType),
      UnsignedChar$.Array(fileData),
      fileData.length,
    ),
  );

  /// Checks if wave data is valid (data loaded and parameters)
  bool IsWaveValid(
    Wave wave,
  ) => debugRun(
    () => 'IsWaveValid($wave)',
    () => _flat.IsWaveValid(
      wave,
    ),
  );

  /// Load sound from file
  Sound LoadSound(
    String fileName,
  ) => debugRun(
    () => 'LoadSound($fileName)',
    () => _flat.LoadSound(
      String$.ValueOrNull(fileName),
    ),
  );

  /// Load sound from wave data
  Sound LoadSoundFromWave(
    Wave wave,
  ) => debugRun(
    () => 'LoadSoundFromWave($wave)',
    () => _flat.LoadSoundFromWave(
      wave,
    ),
  );

  /// Create a new sound that shares the same sample data as the source sound, does not own the sound data
  Sound LoadSoundAlias(
    Sound source,
  ) => debugRun(
    () => 'LoadSoundAlias($source)',
    () => _flat.LoadSoundAlias(
      source,
    ),
  );

  /// Checks if a sound is valid (data loaded and buffers initialized)
  bool IsSoundValid(
    Sound sound,
  ) => debugRun(
    () => 'IsSoundValid($sound)',
    () => _flat.IsSoundValid(
      sound,
    ),
  );

  /// Update sound buffer with new data
  void UpdateSound(
    Sound sound,
    TypedDataList data,
    int sampleCount,
  ) => debugRun(
    () => 'UpdateSound($sound, data: ${data.length}, sampleCount: $sampleCount)',
    () => _flat.UpdateSound(
      sound,
      TypedDataList$.Array(data),
      sampleCount,
    ),
  );

  /// Unload wave data
  void UnloadWave(
    Wave wave,
  ) => debugRun(
    () => 'UnloadWave($wave)',
    () => _flat.UnloadWave(
      wave,
    ),
  );

  /// Unload sound
  void UnloadSound(
    Sound sound,
  ) => debugRun(
    () => 'UnloadSound($sound)',
    () => _flat.UnloadSound(
      sound,
    ),
  );

  /// Unload a sound alias (does not deallocate sample data)
  void UnloadSoundAlias(
    Sound alias,
  ) => debugRun(
    () => 'UnloadSoundAlias($alias)',
    () => _flat.UnloadSoundAlias(
      alias,
    ),
  );

  /// Export wave data to file, returns true on success
  bool ExportWave(
    Wave wave,
    String fileName,
  ) => debugRun(
    () => 'ExportWave($wave, $fileName)',
    () => _flat.ExportWave(
      wave,
      String$.ValueOrNull(fileName),
    ),
  );

  /// Export wave sample data to code (.h), returns true on success
  bool ExportWaveAsCode(
    Wave wave,
    String fileName,
  ) => debugRun(
    () => 'ExportWaveAsCode($wave, $fileName)',
    () => _flat.ExportWaveAsCode(
      wave,
      String$.ValueOrNull(fileName),
    ),
  );

  /// Play a sound
  void PlaySound(
    Sound sound,
  ) => debugRun(
    () => 'PlaySound($sound)',
    () => _flat.PlaySound(
      sound,
    ),
  );

  /// Stop playing a sound
  void StopSound(
    Sound sound,
  ) => debugRun(
    () => 'StopSound($sound)',
    () => _flat.StopSound(
      sound,
    ),
  );

  /// Pause a sound
  void PauseSound(
    Sound sound,
  ) => debugRun(
    () => 'PauseSound($sound)',
    () => _flat.PauseSound(
      sound,
    ),
  );

  /// Resume a paused sound
  void ResumeSound(
    Sound sound,
  ) => debugRun(
    () => 'ResumeSound($sound)',
    () => _flat.ResumeSound(
      sound,
    ),
  );

  /// Check if a sound is currently playing
  bool IsSoundPlaying(
    Sound sound,
  ) => debugRun(
    () => 'IsSoundPlaying($sound)',
    () => _flat.IsSoundPlaying(
      sound,
    ),
  );

  /// Set volume for a sound (1.0 is max level)
  void SetSoundVolume(
    Sound sound,
    double volume,
  ) => debugRun(
    () => 'SetSoundVolume($sound, $volume)',
    () => _flat.SetSoundVolume(
      sound,
      volume,
    ),
  );

  /// Set pitch for a sound (1.0 is base level)
  void SetSoundPitch(
    Sound sound,
    double pitch,
  ) => debugRun(
    () => 'SetSoundPitch($sound, $pitch)',
    () => _flat.SetSoundPitch(
      sound,
      pitch,
    ),
  );

  /// Set pan for a sound (0.5 is center)
  void SetSoundPan(
    Sound sound,
    double pan,
  ) => debugRun(
    () => 'SetSoundPan($sound, $pan)',
    () => _flat.SetSoundPan(
      sound,
      pan,
    ),
  );

  /// Copy a wave to a new wave
  Wave WaveCopy(
    Wave wave,
  ) => debugRun(
    () => 'WaveCopy($wave)',
    () => _flat.WaveCopy(
      wave,
    ),
  );

  /// Crop a wave to defined frames range
  void WaveCrop(
    Wave wave,
    int initFrame,
    int finalFrame,
  ) => debugRun(
    () => 'WaveCrop($wave, $initFrame, $finalFrame)',
    () => _flat.WaveCrop(
      Wave$.Ref1(wave),
      initFrame,
      finalFrame,
    ),
  );

  /// Convert wave data to desired format
  void WaveFormat(
    Wave wave,
    int sampleRate,
    int sampleSize,
    int channels,
  ) => debugRun(
    () => 'WaveFormat($wave, $sampleRate, $sampleSize, $channels)',
    () => _flat.WaveFormat(
      Wave$.Ref1(wave),
      sampleRate,
      sampleSize,
      channels,
    ),
  );

  /// Load samples data from wave as a 32bit float data array
  List<double> LoadWaveSamples(
    Wave wave,
  ) => debugRun(
    () => 'LoadWaveSamples($wave)',
    () {
      final samples = _flat.LoadWaveSamples(
        wave,
      );
      try {
        return .generate(wave.waveLength, (i) => samples[i]);
      } finally {
        _flat.UnloadWaveSamples(samples);
      }
    },
  );

  /// Load music stream from file
  Music LoadMusicStream(
    String fileName,
  ) => debugRun(
    () => 'LoadMusicStream($fileName)',
    () => _flat.LoadMusicStream(
      String$.ValueOrNull(fileName),
    ),
  );

  /// Load music stream from data
  Music LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => debugRun(
    () => 'LoadMusicStreamFromMemory($fileType, data: ${data.length})',
    () => _flat.LoadMusicStreamFromMemory(
      String$.ValueOrNull(fileType),
      UnsignedChar$.Array(data),
      data.length,
    ),
  );

  /// Checks if a music stream is valid (context and buffers initialized)
  bool IsMusicValid(
    Music music,
  ) => debugRun(
    () => 'IsMusicValid($music)',
    () => _flat.IsMusicValid(
      music,
    ),
  );

  /// Unload music stream
  void UnloadMusicStream(
    Music music,
  ) => debugRun(
    () => 'UnloadMusicStream($music)',
    () => _flat.UnloadMusicStream(
      music,
    ),
  );

  /// Start music playing
  void PlayMusicStream(
    Music music,
  ) => debugRun(
    () => 'PlayMusicStream($music)',
    () => _flat.PlayMusicStream(
      music,
    ),
  );

  /// Check if music is playing
  bool IsMusicStreamPlaying(
    Music music,
  ) => debugRun(
    () => 'IsMusicStreamPlaying($music)',
    () => _flat.IsMusicStreamPlaying(
      music,
    ),
  );

  /// Updates buffers for music streaming
  void UpdateMusicStream(
    Music music,
  ) => debugRun(
    () => 'UpdateMusicStream($music)',
    () => _flat.UpdateMusicStream(
      music,
    ),
  );

  /// Stop music playing
  void StopMusicStream(
    Music music,
  ) => debugRun(
    () => 'StopMusicStream($music)',
    () => _flat.StopMusicStream(
      music,
    ),
  );

  /// Pause music playing
  void PauseMusicStream(
    Music music,
  ) => debugRun(
    () => 'PauseMusicStream($music)',
    () => _flat.PauseMusicStream(
      music,
    ),
  );

  /// Resume playing paused music
  void ResumeMusicStream(
    Music music,
  ) => debugRun(
    () => 'ResumeMusicStream($music)',
    () => _flat.ResumeMusicStream(
      music,
    ),
  );

  /// Seek music to a position (in seconds)
  void SeekMusicStream(
    Music music,
    double position,
  ) => debugRun(
    () => 'SeekMusicStream($music, $position)',
    () => _flat.SeekMusicStream(
      music,
      position,
    ),
  );

  /// Set volume for music (1.0 is max level)
  void SetMusicVolume(
    Music music,
    double volume,
  ) => debugRun(
    () => 'SetMusicVolume($music, $volume)',
    () => _flat.SetMusicVolume(
      music,
      volume,
    ),
  );

  /// Set pitch for a music (1.0 is base level)
  void SetMusicPitch(
    Music music,
    double pitch,
  ) => debugRun(
    () => 'SetMusicPitch($music, $pitch)',
    () => _flat.SetMusicPitch(
      music,
      pitch,
    ),
  );

  /// Set pan for a music (0.5 is center)
  void SetMusicPan(
    Music music,
    double pan,
  ) => debugRun(
    () => 'SetMusicPan($music, $pan)',
    () => _flat.SetMusicPan(
      music,
      pan,
    ),
  );

  /// Get music time length (in seconds)
  double GetMusicTimeLength(
    Music music,
  ) => debugRun(
    () => 'GetMusicTimeLength($music)',
    () => _flat.GetMusicTimeLength(
      music,
    ),
  );

  /// Get current music time played (in seconds)
  double GetMusicTimePlayed(
    Music music,
  ) => debugRun(
    () => 'GetMusicTimePlayed($music)',
    () => _flat.GetMusicTimePlayed(
      music,
    ),
  );

  /// Load audio stream (to stream raw audio pcm data)
  AudioStream LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels,
  ) => debugRun(
    () => 'LoadAudioStream($sampleRate, $sampleSize, $channels)',
    () => _flat.LoadAudioStream(
      sampleRate,
      sampleSize,
      channels,
    ),
  );

  /// Checks if an audio stream is valid (buffers initialized)
  bool IsAudioStreamValid(
    AudioStream stream,
  ) => debugRun(
    () => 'IsAudioStreamValid($stream)',
    () => _flat.IsAudioStreamValid(
      stream,
    ),
  );

  /// Unload audio stream and free memory
  void UnloadAudioStream(
    AudioStream stream,
  ) => debugRun(
    () => 'UnloadAudioStream($stream)',
    () => _flat.UnloadAudioStream(
      stream,
    ),
  );

  /// Update audio stream buffers with data
  void UpdateAudioStream(
    AudioStream stream,
    TypedDataList data,
  ) => debugRun(
    () => 'UpdateAudioStream($stream, data: ${data.length})',
    () => _flat.UpdateAudioStream(
      stream,
      TypedDataList$.Array(data),
      data.length,
    ),
  );

  /// Check if any audio stream buffers requires refill
  bool IsAudioStreamProcessed(
    AudioStream stream,
  ) => debugRun(
    () => 'IsAudioStreamProcessed($stream)',
    () => _flat.IsAudioStreamProcessed(
      stream,
    ),
  );

  /// Play audio stream
  void PlayAudioStream(
    AudioStream stream,
  ) => debugRun(
    () => 'PlayAudioStream($stream)',
    () => _flat.PlayAudioStream(
      stream,
    ),
  );

  /// Pause audio stream
  void PauseAudioStream(
    AudioStream stream,
  ) => debugRun(
    () => 'PauseAudioStream($stream)',
    () => _flat.PauseAudioStream(
      stream,
    ),
  );

  /// Resume audio stream
  void ResumeAudioStream(
    AudioStream stream,
  ) => debugRun(
    () => 'ResumeAudioStream($stream)',
    () => _flat.ResumeAudioStream(
      stream,
    ),
  );

  /// Check if audio stream is playing
  bool IsAudioStreamPlaying(
    AudioStream stream,
  ) => debugRun(
    () => 'IsAudioStreamPlaying($stream)',
    () => _flat.IsAudioStreamPlaying(
      stream,
    ),
  );

  /// Stop audio stream
  void StopAudioStream(
    AudioStream stream,
  ) => debugRun(
    () => 'StopAudioStream($stream)',
    () => _flat.StopAudioStream(
      stream,
    ),
  );

  /// Set volume for audio stream (1.0 is max level)
  void SetAudioStreamVolume(
    AudioStream stream,
    double volume,
  ) => debugRun(
    () => 'SetAudioStreamVolume($stream, $volume)',
    () => _flat.SetAudioStreamVolume(
      stream,
      volume,
    ),
  );

  /// Set pitch for audio stream (1.0 is base level)
  void SetAudioStreamPitch(
    AudioStream stream,
    double pitch,
  ) => debugRun(
    () => 'SetAudioStreamPitch($stream, $pitch)',
    () => _flat.SetAudioStreamPitch(
      stream,
      pitch,
    ),
  );

  /// Set pan for a sound (-1.0 left, 0.0 center, 1.0 right)
  void SetAudioStreamPan(
    AudioStream stream,
    double pan,
  ) => debugRun(
    () => 'SetAudioStreamPan($stream, $pan)',
    () => _flat.SetAudioStreamPan(
      stream,
      pan,
    ),
  );

  /// Default size for new audio streams
  void SetAudioStreamBufferSizeDefault(
    int size,
  ) => debugRun(
    () => 'SetAudioStreamBufferSizeDefault($size)',
    () => _flat.SetAudioStreamBufferSizeDefault(
      size,
    ),
  );

  /// Audio thread callback to request new data
  void SetAudioStreamCallback(
    AudioStream stream,
    covariant AudioCallbackBase? callback,
  ) => debugRun(
    () => 'SetAudioStreamCallback($stream, callback: $callback)',
    () => _flat.SetAudioStreamCallback(
      stream,
      callback?.attach() ?? .nullptr(),
    ),
  );

  /// Attach audio stream processor to stream, receives the samples as 'float'
  void AttachAudioStreamProcessor(
    AudioStream stream,
    covariant AudioCallbackBase processor,
  ) => debugRun(
    () => 'AttachAudioStreamProcessor($stream, processor: $processor)',
    () => _flat.AttachAudioStreamProcessor(
      stream,
      processor.attach(),
    ),
  );

  /// Detach audio stream processor from stream
  void DetachAudioStreamProcessor(
    AudioStream stream,
    covariant AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => debugRun(
    () => 'DetachAudioStreamProcessor($stream, processor: $processor, keepAlive: $keepAlive)',
    () => _flat.DetachAudioStreamProcessor(
      stream,
      processor.detach(keepAlive),
    ),
  );

  /// Attach audio stream processor to the entire audio pipeline, receives the samples as 'float'
  void AttachAudioMixedProcessor(
    covariant AudioCallbackBase processor,
  ) => debugRun(
    () => 'AttachAudioMixedProcessor(processor: $processor)',
    () => _flat.AttachAudioMixedProcessor(
      processor.attach(),
    ),
  );

  /// Detach audio stream processor from the entire audio pipeline
  void DetachAudioMixedProcessor(
    covariant AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => debugRun(
    () => 'DetachAudioMixedProcessor(processor: $processor, keepAlive: $keepAlive)',
    () => _flat.DetachAudioMixedProcessor(
      processor.detach(keepAlive),
    ),
  );
}