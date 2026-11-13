part of '../../../raylib_dartified.dart';

class RaylibAudio extends RaylibModule<Raylib> {
  RaylibAudio(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  /// Initialize audio device and context
  void InitAudioDevice()
    => _InitAudioDevice();
  late final _InitAudioDevicePtr = _lookup<NativeFunction<Void Function()>>('InitAudioDevice');
  late final _InitAudioDevice = _InitAudioDevicePtr.asFunction<void Function()>();

  /// Close the audio device and context
  void CloseAudioDevice()
    => _CloseAudioDevice();
  late final _CloseAudioDevicePtr = _lookup<NativeFunction<Void Function()>>('CloseAudioDevice');
  late final _CloseAudioDevice = _CloseAudioDevicePtr.asFunction<void Function()>();

  /// Check if audio device has been initialized successfully
  bool IsAudioDeviceReady()
    => _IsAudioDeviceReady();
  late final _IsAudioDeviceReadyPtr = _lookup<NativeFunction<Bool Function()>>('IsAudioDeviceReady');
  late final _IsAudioDeviceReady = _IsAudioDeviceReadyPtr.asFunction<bool Function()>();

  /// Set master volume (listener)
  void SetMasterVolume(double volume)
    => _SetMasterVolume(volume);
  late final _SetMasterVolumePtr = _lookup<NativeFunction<Void Function(Float)>>('SetMasterVolume');
  late final _SetMasterVolume = _SetMasterVolumePtr.asFunction<void Function(double)>();

  /// Get master volume (listener)
  double GetMasterVolume()
    => _GetMasterVolume();
  late final _GetMasterVolumePtr = _lookup<NativeFunction<Float Function()>>('GetMasterVolume');
  late final _GetMasterVolume = _GetMasterVolumePtr.asFunction<double Function()>();

  /// Load wave data from file
  WaveC LoadWave(Pointer<Char> fileName)
    => _LoadWave(fileName);
  late final _LoadWavePtr = _lookup<NativeFunction<WaveC Function(Pointer<Char>)>>('LoadWave');
  late final _LoadWave = _LoadWavePtr.asFunction<WaveC Function(Pointer<Char>)>();

  /// Load wave from memory buffer, fileType refers to extension: i.e. '.wav'
  WaveC LoadWaveFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> fileData, int dataSize)
    => _LoadWaveFromMemory(fileType, fileData, dataSize);
  late final _LoadWaveFromMemoryPtr = _lookup<NativeFunction<WaveC Function(Pointer<Char>, Pointer<UnsignedChar>, Int)>>('LoadWaveFromMemory');
  late final _LoadWaveFromMemory = _LoadWaveFromMemoryPtr.asFunction<WaveC Function(Pointer<Char>, Pointer<UnsignedChar>, int)>();

  /// Checks if wave data is valid (data loaded and parameters)
  bool IsWaveValid(WaveC wave)
    => _IsWaveValid(wave);
  late final _IsWaveValidPtr = _lookup<NativeFunction<Bool Function(WaveC)>>('IsWaveValid');
  late final _IsWaveValid = _IsWaveValidPtr.asFunction<bool Function(WaveC)>();

  /// Load sound from file
  SoundC LoadSound(Pointer<Char> fileName)
    => _LoadSound(fileName);
  late final _LoadSoundPtr = _lookup<NativeFunction<SoundC Function(Pointer<Char>)>>('LoadSound');
  late final _LoadSound = _LoadSoundPtr.asFunction<SoundC Function(Pointer<Char>)>();

  /// Load sound from wave data
  SoundC LoadSoundFromWave(WaveC wave)
    => _LoadSoundFromWave(wave);
  late final _LoadSoundFromWavePtr = _lookup<NativeFunction<SoundC Function(WaveC)>>('LoadSoundFromWave');
  late final _LoadSoundFromWave = _LoadSoundFromWavePtr.asFunction<SoundC Function(WaveC)>();

  /// Create a new sound that shares the same sample data as the source sound, does not own the sound data
  SoundC LoadSoundAlias(SoundC source)
    => _LoadSoundAlias(source);
  late final _LoadSoundAliasPtr = _lookup<NativeFunction<SoundC Function(SoundC)>>('LoadSoundAlias');
  late final _LoadSoundAlias = _LoadSoundAliasPtr.asFunction<SoundC Function(SoundC)>();

  /// Checks if a sound is valid (data loaded and buffers initialized)
  bool IsSoundValid(SoundC sound)
    => _IsSoundValid(sound);
  late final _IsSoundValidPtr = _lookup<NativeFunction<Bool Function(SoundC)>>('IsSoundValid');
  late final _IsSoundValid = _IsSoundValidPtr.asFunction<bool Function(SoundC)>();

  /// Update sound buffer with new data
  void UpdateSound(SoundC sound, Pointer<Void> data, int sampleCount)
    => _UpdateSound(sound, data, sampleCount);
  late final _UpdateSoundPtr = _lookup<NativeFunction<Void Function(SoundC, Pointer<Void>, Int)>>('UpdateSound');
  late final _UpdateSound = _UpdateSoundPtr.asFunction<void Function(SoundC, Pointer<Void>, int)>();

  /// Unload wave data
  void UnloadWave(WaveC wave)
    => _UnloadWave(wave);
  late final _UnloadWavePtr = _lookup<NativeFunction<Void Function(WaveC)>>('UnloadWave');
  late final _UnloadWave = _UnloadWavePtr.asFunction<void Function(WaveC)>();

  /// Unload sound
  void UnloadSound(SoundC sound)
    => _UnloadSound(sound);
  late final _UnloadSoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('UnloadSound');
  late final _UnloadSound = _UnloadSoundPtr.asFunction<void Function(SoundC)>();

  /// Unload a sound alias (does not deallocate sample data)
  void UnloadSoundAlias(SoundC alias)
    => _UnloadSoundAlias(alias);
  late final _UnloadSoundAliasPtr = _lookup<NativeFunction<Void Function(SoundC)>>('UnloadSoundAlias');
  late final _UnloadSoundAlias = _UnloadSoundAliasPtr.asFunction<void Function(SoundC)>();

  /// Export wave data to file, returns true on success
  bool ExportWave(WaveC wave, Pointer<Char> fileName)
    => _ExportWave(wave, fileName);
  late final _ExportWavePtr = _lookup<NativeFunction<Bool Function(WaveC, Pointer<Char>)>>('ExportWave');
  late final _ExportWave = _ExportWavePtr.asFunction<bool Function(WaveC, Pointer<Char>)>();

  /// Export wave sample data to code (.h), returns true on success
  bool ExportWaveAsCode(WaveC wave, Pointer<Char> fileName)
    => _ExportWaveAsCode(wave, fileName);
  late final _ExportWaveAsCodePtr = _lookup<NativeFunction<Bool Function(WaveC, Pointer<Char>)>>('ExportWaveAsCode');
  late final _ExportWaveAsCode = _ExportWaveAsCodePtr.asFunction<bool Function(WaveC, Pointer<Char>)>();

  /// Play a sound
  void PlaySound(SoundC sound)
    => _PlaySound(sound);
  late final _PlaySoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('PlaySound');
  late final _PlaySound = _PlaySoundPtr.asFunction<void Function(SoundC)>();

  /// Stop playing a sound
  void StopSound(SoundC sound)
    => _StopSound(sound);
  late final _StopSoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('StopSound');
  late final _StopSound = _StopSoundPtr.asFunction<void Function(SoundC)>();

  /// Pause a sound
  void PauseSound(SoundC sound)
    => _PauseSound(sound);
  late final _PauseSoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('PauseSound');
  late final _PauseSound = _PauseSoundPtr.asFunction<void Function(SoundC)>();

  /// Resume a paused sound
  void ResumeSound(SoundC sound)
    => _ResumeSound(sound);
  late final _ResumeSoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('ResumeSound');
  late final _ResumeSound = _ResumeSoundPtr.asFunction<void Function(SoundC)>();

  /// Check if a sound is currently playing
  bool IsSoundPlaying(SoundC sound)
    => _IsSoundPlaying(sound);
  late final _IsSoundPlayingPtr = _lookup<NativeFunction<Bool Function(SoundC)>>('IsSoundPlaying');
  late final _IsSoundPlaying = _IsSoundPlayingPtr.asFunction<bool Function(SoundC)>();

  /// Set volume for a sound (1.0 is max level)
  void SetSoundVolume(SoundC sound, double volume)
    => _SetSoundVolume(sound, volume);
  late final _SetSoundVolumePtr = _lookup<NativeFunction<Void Function(SoundC, Float)>>('SetSoundVolume');
  late final _SetSoundVolume = _SetSoundVolumePtr.asFunction<void Function(SoundC, double)>();

  /// Set pitch for a sound (1.0 is base level)
  void SetSoundPitch(SoundC sound, double pitch)
    => _SetSoundPitch(sound, pitch);
  late final _SetSoundPitchPtr = _lookup<NativeFunction<Void Function(SoundC, Float)>>('SetSoundPitch');
  late final _SetSoundPitch = _SetSoundPitchPtr.asFunction<void Function(SoundC, double)>();

  /// Set pan for a sound (-1.0 left, 0.0 center, 1.0 right)
  void SetSoundPan(SoundC sound, double pan)
    => _SetSoundPan(sound, pan);
  late final _SetSoundPanPtr = _lookup<NativeFunction<Void Function(SoundC, Float)>>('SetSoundPan');
  late final _SetSoundPan = _SetSoundPanPtr.asFunction<void Function(SoundC, double)>();

  /// Copy a wave to a new wave
  WaveC WaveCopy(WaveC wave)
    => _WaveCopy(wave);
  late final _WaveCopyPtr = _lookup<NativeFunction<WaveC Function(WaveC)>>('WaveCopy',);
  late final _WaveCopy = _WaveCopyPtr.asFunction<WaveC Function(WaveC)>();

  /// Crop a wave to defined frames range
  void WaveCrop(Pointer<WaveC> wave, int initFrame, int finalFrame)
    => _WaveCrop(wave, initFrame, finalFrame);
  late final _WaveCropPtr = _lookup<NativeFunction<Void Function(Pointer<WaveC>, Int, Int)>>('WaveCrop');
  late final _WaveCrop = _WaveCropPtr.asFunction<void Function(Pointer<WaveC>, int, int)>();

  /// Convert wave data to desired format
  void WaveFormat(Pointer<WaveC> wave, int sampleRate, int sampleSize, int channels)
    => _WaveFormat(wave, sampleRate, sampleSize, channels);
  late final _WaveFormatPtr = _lookup<NativeFunction<Void Function(Pointer<WaveC>, Int, Int, Int)>>('WaveFormat');
  late final _WaveFormat = _WaveFormatPtr.asFunction<void Function(Pointer<WaveC>, int, int, int)>();

  /// Load samples data from wave as a 32bit float data array
  Pointer<Float> LoadWaveSamples(WaveC wave)
    => _LoadWaveSamples(wave);
  late final _LoadWaveSamplesPtr = _lookup<NativeFunction<Pointer<Float> Function(WaveC)>>('LoadWaveSamples');
  late final _LoadWaveSamples = _LoadWaveSamplesPtr.asFunction<Pointer<Float> Function(WaveC)>();

  /// Unload samples data loaded with LoadWaveSamples()
  void UnloadWaveSamples(Pointer<Float> samples)
    => _UnloadWaveSamples(samples);
  late final _UnloadWaveSamplesPtr = _lookup<NativeFunction<Void Function(Pointer<Float>)>>('UnloadWaveSamples');
  late final _UnloadWaveSamples = _UnloadWaveSamplesPtr.asFunction<void Function(Pointer<Float>)>();

  /// Load music stream from file
  MusicC LoadMusicStream(Pointer<Char> fileName)
    => _LoadMusicStream(fileName);
  late final _LoadMusicStreamPtr = _lookup<NativeFunction<MusicC Function(Pointer<Char>)>>('LoadMusicStream');
  late final _LoadMusicStream = _LoadMusicStreamPtr.asFunction<MusicC Function(Pointer<Char>)>();

  /// Load music stream from data
  MusicC LoadMusicStreamFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> data, int dataSize)
    => _LoadMusicStreamFromMemory(fileType, data, dataSize);
  late final _LoadMusicStreamFromMemoryPtr = _lookup<NativeFunction<MusicC Function(Pointer<Char>, Pointer<UnsignedChar>, Int)>>('LoadMusicStreamFromMemory');
  late final _LoadMusicStreamFromMemory = _LoadMusicStreamFromMemoryPtr.asFunction<MusicC Function(Pointer<Char>, Pointer<UnsignedChar>, int)>();

  /// Checks if a music stream is valid (context and buffers initialized)
  bool IsMusicValid(MusicC music)
    => _IsMusicValid(music);
  late final _IsMusicValidPtr = _lookup<NativeFunction<Bool Function(MusicC)>>('IsMusicValid');
  late final _IsMusicValid = _IsMusicValidPtr.asFunction<bool Function(MusicC)>();

  /// Unload music stream
  void UnloadMusicStream(MusicC music)
    => _UnloadMusicStream(music);
  late final _UnloadMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('UnloadMusicStream');
  late final _UnloadMusicStream = _UnloadMusicStreamPtr.asFunction<void Function(MusicC)>();

  /// Start music playing
  void PlayMusicStream(MusicC music)
    => _PlayMusicStream(music);
  late final _PlayMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('PlayMusicStream');
  late final _PlayMusicStream = _PlayMusicStreamPtr.asFunction<void Function(MusicC)>();

  /// Check if music is playing
  bool IsMusicStreamPlaying(MusicC music)
    => _IsMusicStreamPlaying(music);
  late final _IsMusicStreamPlayingPtr = _lookup<NativeFunction<Bool Function(MusicC)>>('IsMusicStreamPlaying');
  late final _IsMusicStreamPlaying = _IsMusicStreamPlayingPtr.asFunction<bool Function(MusicC)>();

  /// Updates buffers for music streaming
  void UpdateMusicStream(MusicC music)
    => _UpdateMusicStream(music);
  late final _UpdateMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('UpdateMusicStream');
  late final _UpdateMusicStream = _UpdateMusicStreamPtr.asFunction<void Function(MusicC)>();

  /// Stop music playing
  void StopMusicStream(MusicC music)
    => _StopMusicStream(music);
  late final _StopMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('StopMusicStream');
  late final _StopMusicStream = _StopMusicStreamPtr.asFunction<void Function(MusicC)>();

  /// Pause music playing
  void PauseMusicStream(MusicC music)
    => _PauseMusicStream(music);
  late final _PauseMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('PauseMusicStream');
  late final _PauseMusicStream = _PauseMusicStreamPtr.asFunction<void Function(MusicC)>();

  /// Resume playing paused music
  void ResumeMusicStream(MusicC music)
    => _ResumeMusicStream(music);
  late final _ResumeMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('ResumeMusicStream');
  late final _ResumeMusicStream = _ResumeMusicStreamPtr.asFunction<void Function(MusicC)>();

  /// Seek music to a position (in seconds)
  void SeekMusicStream(MusicC music, double position)
    => _SeekMusicStream(music, position);
  late final _SeekMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC, Float)>>('SeekMusicStream');
  late final _SeekMusicStream = _SeekMusicStreamPtr.asFunction<void Function(MusicC, double)>();

  /// Set volume for music (1.0 is max level)
  void SetMusicVolume(MusicC music, double volume)
    => _SetMusicVolume(music, volume);
  late final _SetMusicVolumePtr = _lookup<NativeFunction<Void Function(MusicC, Float)>>('SetMusicVolume');
  late final _SetMusicVolume = _SetMusicVolumePtr.asFunction<void Function(MusicC, double)>();

  /// Set pitch for a music (1.0 is base level)
  void SetMusicPitch(MusicC music, double pitch)
    => _SetMusicPitch(music, pitch);
  late final _SetMusicPitchPtr = _lookup<NativeFunction<Void Function(MusicC, Float)>>('SetMusicPitch');
  late final _SetMusicPitch = _SetMusicPitchPtr.asFunction<void Function(MusicC, double)>();

  /// Set pan for a music (0.5 is center)
  void SetMusicPan(MusicC music, double pan)
    => _SetMusicPan(music, pan);
  late final _SetMusicPanPtr = _lookup<NativeFunction<Void Function(MusicC, Float)>>('SetMusicPan');
  late final _SetMusicPan = _SetMusicPanPtr.asFunction<void Function(MusicC, double)>();

  /// Get music time length (in seconds)
  double GetMusicTimeLength(MusicC music)
    => _GetMusicTimeLength(music);
  late final _GetMusicTimeLengthPtr = _lookup<NativeFunction<Float Function(MusicC)>>('GetMusicTimeLength');
  late final _GetMusicTimeLength = _GetMusicTimeLengthPtr.asFunction<double Function(MusicC)>();

  /// Get current music time played (in seconds)
  double GetMusicTimePlayed(MusicC music)
    => _GetMusicTimePlayed(music);
  late final _GetMusicTimePlayedPtr = _lookup<NativeFunction<Float Function(MusicC)>>('GetMusicTimePlayed');
  late final _GetMusicTimePlayed = _GetMusicTimePlayedPtr.asFunction<double Function(MusicC)>();

  /// Load audio stream (to stream raw audio pcm data)
  AudioStreamC LoadAudioStream(int sampleRate, int sampleSize, int channels)
    => _LoadAudioStream(sampleRate, sampleSize, channels);
  late final _LoadAudioStreamPtr = _lookup<NativeFunction<AudioStreamC Function(UnsignedInt, UnsignedInt, UnsignedInt)>>('LoadAudioStream');
  late final _LoadAudioStream = _LoadAudioStreamPtr.asFunction<AudioStreamC Function(int, int, int)>();

  /// Checks if an audio stream is valid (buffers initialized)
  bool IsAudioStreamValid(AudioStreamC stream)
    => _IsAudioStreamValid(stream);
  late final _IsAudioStreamValidPtr = _lookup<NativeFunction<Bool Function(AudioStreamC)>>('IsAudioStreamValid');
  late final _IsAudioStreamValid = _IsAudioStreamValidPtr.asFunction<bool Function(AudioStreamC)>();

  /// Unload audio stream and free memory
  void UnloadAudioStream(AudioStreamC stream)
    => _UnloadAudioStream(stream);
  late final _UnloadAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('UnloadAudioStream');
  late final _UnloadAudioStream = _UnloadAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  /// Update audio stream buffers with data
  void UpdateAudioStream(AudioStreamC stream, Pointer<Void> data, int frameCount)
    => _UpdateAudioStream(stream, data, frameCount);
  late final _UpdateAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC, Pointer<Void>, Int)>>('UpdateAudioStream');
  late final _UpdateAudioStream = _UpdateAudioStreamPtr.asFunction<void Function(AudioStreamC, Pointer<Void>, int)>();

  /// Check if any audio stream buffers requires refill
  bool IsAudioStreamProcessed(AudioStreamC stream)
    => _IsAudioStreamProcessed(stream);
  late final _IsAudioStreamProcessedPtr = _lookup<NativeFunction<Bool Function(AudioStreamC)>>('IsAudioStreamProcessed');
  late final _IsAudioStreamProcessed = _IsAudioStreamProcessedPtr.asFunction<bool Function(AudioStreamC)>();

  /// Play audio stream
  void PlayAudioStream(AudioStreamC stream)
    => _PlayAudioStream(stream);
  late final _PlayAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('PlayAudioStream');
  late final _PlayAudioStream = _PlayAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  /// Pause audio stream
  void PauseAudioStream(AudioStreamC stream)
    => _PauseAudioStream(stream);
  late final _PauseAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('PauseAudioStream');
  late final _PauseAudioStream = _PauseAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  /// Resume audio stream
  void ResumeAudioStream(AudioStreamC stream)
    => _ResumeAudioStream(stream);
  late final _ResumeAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('ResumeAudioStream');
  late final _ResumeAudioStream = _ResumeAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  /// Check if audio stream is playing
  bool IsAudioStreamPlaying(AudioStreamC stream)
    => _IsAudioStreamPlaying(stream);
  late final _IsAudioStreamPlayingPtr = _lookup<NativeFunction<Bool Function(AudioStreamC)>>('IsAudioStreamPlaying');
  late final _IsAudioStreamPlaying = _IsAudioStreamPlayingPtr.asFunction<bool Function(AudioStreamC)>();

  /// Stop audio stream
  void StopAudioStream(AudioStreamC stream)
    => _StopAudioStream(stream);
  late final _StopAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('StopAudioStream');
  late final _StopAudioStream = _StopAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  /// Set volume for audio stream (1.0 is max level)
  void SetAudioStreamVolume(AudioStreamC stream, double volume)
    => _SetAudioStreamVolume(stream, volume);
  late final _SetAudioStreamVolumePtr = _lookup<NativeFunction<Void Function(AudioStreamC, Float)>>('SetAudioStreamVolume');
  late final _SetAudioStreamVolume = _SetAudioStreamVolumePtr.asFunction<void Function(AudioStreamC, double)>();

  /// Set pitch for audio stream (1.0 is base level)
  void SetAudioStreamPitch(AudioStreamC stream, double pitch)
    => _SetAudioStreamPitch(stream, pitch);
  late final _SetAudioStreamPitchPtr = _lookup<NativeFunction<Void Function(AudioStreamC, Float)>>('SetAudioStreamPitch');
  late final _SetAudioStreamPitch = _SetAudioStreamPitchPtr.asFunction<void Function(AudioStreamC, double)>();

  /// Set pan for audio stream (0.5 is centered)
  void SetAudioStreamPan(AudioStreamC stream, double pan)
    => _SetAudioStreamPan(stream, pan);
  late final _SetAudioStreamPanPtr = _lookup<NativeFunction<Void Function(AudioStreamC, Float)>>('SetAudioStreamPan');
  late final _SetAudioStreamPan = _SetAudioStreamPanPtr.asFunction<void Function(AudioStreamC, double)>();

  /// Default size for new audio streams
  void SetAudioStreamBufferSizeDefault(int size)
    => _SetAudioStreamBufferSizeDefault(size);
  late final _SetAudioStreamBufferSizeDefaultPtr = _lookup<NativeFunction<Void Function(Int)>>('SetAudioStreamBufferSizeDefault');
  late final _SetAudioStreamBufferSizeDefault = _SetAudioStreamBufferSizeDefaultPtr.asFunction<void Function(int)>();

  /// Audio thread callback to request new data
  void SetAudioStreamCallback(AudioStreamC stream, AudioCallbackC callback)
    => _SetAudioStreamCallback(stream, callback);
  late final _SetAudioStreamCallbackPtr = _lookup<NativeFunction<Void Function(AudioStreamC, AudioCallbackC)>>('SetAudioStreamCallback');
  late final _SetAudioStreamCallback = _SetAudioStreamCallbackPtr.asFunction<void Function(AudioStreamC, AudioCallbackC)>();

  /// Attach audio stream processor to stream, receives the samples as 'float'
  void AttachAudioStreamProcessor(AudioStreamC stream, AudioCallbackC processor)
    => _AttachAudioStreamProcessor(stream, processor);
  late final _AttachAudioStreamProcessorPtr = _lookup<NativeFunction<Void Function(AudioStreamC, AudioCallbackC)>>('AttachAudioStreamProcessor');
  late final _AttachAudioStreamProcessor = _AttachAudioStreamProcessorPtr.asFunction<void Function(AudioStreamC, AudioCallbackC)>();

  /// Detach audio stream processor from stream
  void DetachAudioStreamProcessor(AudioStreamC stream, AudioCallbackC processor)
    => _DetachAudioStreamProcessor(stream, processor);
  late final _DetachAudioStreamProcessorPtr = _lookup<NativeFunction<Void Function(AudioStreamC, AudioCallbackC)>>('DetachAudioStreamProcessor');
  late final _DetachAudioStreamProcessor = _DetachAudioStreamProcessorPtr.asFunction<void Function(AudioStreamC, AudioCallbackC)>();

  /// Attach audio stream processor to the entire audio pipeline, receives the samples as 'float'
  void AttachAudioMixedProcessor(AudioCallbackC processor)
    => _AttachAudioMixedProcessor(processor);
  late final _AttachAudioMixedProcessorPtr = _lookup<NativeFunction<Void Function(AudioCallbackC)>>('AttachAudioMixedProcessor');
  late final _AttachAudioMixedProcessor = _AttachAudioMixedProcessorPtr.asFunction<void Function(AudioCallbackC)>();

  /// Detach audio stream processor from the entire audio pipeline
  void DetachAudioMixedProcessor(AudioCallbackC processor)
    => _DetachAudioMixedProcessor(processor);
  late final _DetachAudioMixedProcessorPtr = _lookup<NativeFunction<Void Function(AudioCallbackC)>>('DetachAudioMixedProcessor');
  late final _DetachAudioMixedProcessor = _DetachAudioMixedProcessorPtr.asFunction<void Function(AudioCallbackC)>();
}
