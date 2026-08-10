part of '../../../raylib_dartified.dart';

class RaylibAudio extends RaylibModule<Raylib> {
  RaylibAudio(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  void InitAudioDevice()
    => _InitAudioDevice();
  late final _InitAudioDevicePtr = _lookup<NativeFunction<Void Function()>>('InitAudioDevice');
  late final _InitAudioDevice = _InitAudioDevicePtr.asFunction<void Function()>();

  void CloseAudioDevice()
    => _CloseAudioDevice();
  late final _CloseAudioDevicePtr = _lookup<NativeFunction<Void Function()>>('CloseAudioDevice');
  late final _CloseAudioDevice = _CloseAudioDevicePtr.asFunction<void Function()>();

  bool IsAudioDeviceReady()
    => _IsAudioDeviceReady();
  late final _IsAudioDeviceReadyPtr = _lookup<NativeFunction<Bool Function()>>('IsAudioDeviceReady');
  late final _IsAudioDeviceReady = _IsAudioDeviceReadyPtr.asFunction<bool Function()>();

  void SetMasterVolume(double volume)
    => _SetMasterVolume(volume);
  late final _SetMasterVolumePtr = _lookup<NativeFunction<Void Function(Float)>>('SetMasterVolume');
  late final _SetMasterVolume = _SetMasterVolumePtr.asFunction<void Function(double)>();

  double GetMasterVolume()
    => _GetMasterVolume();
  late final _GetMasterVolumePtr = _lookup<NativeFunction<Float Function()>>('GetMasterVolume');
  late final _GetMasterVolume = _GetMasterVolumePtr.asFunction<double Function()>();

  WaveC LoadWave(Pointer<Char> fileName)
    => _LoadWave(fileName);
  late final _LoadWavePtr = _lookup<NativeFunction<WaveC Function(Pointer<Char>)>>('LoadWave');
  late final _LoadWave = _LoadWavePtr.asFunction<WaveC Function(Pointer<Char>)>();

  WaveC LoadWaveFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> fileData, int dataSize)
    => _LoadWaveFromMemory(fileType, fileData, dataSize);
  late final _LoadWaveFromMemoryPtr = _lookup<NativeFunction<WaveC Function(Pointer<Char>, Pointer<UnsignedChar>, Int)>>('LoadWaveFromMemory');
  late final _LoadWaveFromMemory = _LoadWaveFromMemoryPtr.asFunction<WaveC Function(Pointer<Char>, Pointer<UnsignedChar>, int)>();

  bool IsWaveValid(WaveC wave)
    => _IsWaveValid(wave);
  late final _IsWaveValidPtr = _lookup<NativeFunction<Bool Function(WaveC)>>('IsWaveValid');
  late final _IsWaveValid = _IsWaveValidPtr.asFunction<bool Function(WaveC)>();

  SoundC LoadSound(Pointer<Char> fileName)
    => _LoadSound(fileName);
  late final _LoadSoundPtr = _lookup<NativeFunction<SoundC Function(Pointer<Char>)>>('LoadSound');
  late final _LoadSound = _LoadSoundPtr.asFunction<SoundC Function(Pointer<Char>)>();

  SoundC LoadSoundFromWave(WaveC wave)
    => _LoadSoundFromWave(wave);
  late final _LoadSoundFromWavePtr = _lookup<NativeFunction<SoundC Function(WaveC)>>('LoadSoundFromWave');
  late final _LoadSoundFromWave = _LoadSoundFromWavePtr.asFunction<SoundC Function(WaveC)>();

  SoundC LoadSoundAlias(SoundC source)
    => _LoadSoundAlias(source);
  late final _LoadSoundAliasPtr = _lookup<NativeFunction<SoundC Function(SoundC)>>('LoadSoundAlias');
  late final _LoadSoundAlias = _LoadSoundAliasPtr.asFunction<SoundC Function(SoundC)>();

  bool IsSoundValid(SoundC sound)
    => _IsSoundValid(sound);
  late final _IsSoundValidPtr = _lookup<NativeFunction<Bool Function(SoundC)>>('IsSoundValid');
  late final _IsSoundValid = _IsSoundValidPtr.asFunction<bool Function(SoundC)>();

  void UpdateSound(SoundC sound, Pointer<Void> data, int sampleCount)
    => _UpdateSound(sound, data, sampleCount);
  late final _UpdateSoundPtr = _lookup<NativeFunction<Void Function(SoundC, Pointer<Void>, Int)>>('UpdateSound');
  late final _UpdateSound = _UpdateSoundPtr.asFunction<void Function(SoundC, Pointer<Void>, int)>();

  void UnloadWave(WaveC wave)
    => _UnloadWave(wave);
  late final _UnloadWavePtr = _lookup<NativeFunction<Void Function(WaveC)>>('UnloadWave');
  late final _UnloadWave = _UnloadWavePtr.asFunction<void Function(WaveC)>();

  void UnloadSound(SoundC sound)
    => _UnloadSound(sound);
  late final _UnloadSoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('UnloadSound');
  late final _UnloadSound = _UnloadSoundPtr.asFunction<void Function(SoundC)>();

  void UnloadSoundAlias(SoundC alias)
    => _UnloadSoundAlias(alias);
  late final _UnloadSoundAliasPtr = _lookup<NativeFunction<Void Function(SoundC)>>('UnloadSoundAlias');
  late final _UnloadSoundAlias = _UnloadSoundAliasPtr.asFunction<void Function(SoundC)>();

  bool ExportWave(WaveC wave, Pointer<Char> fileName)
    => _ExportWave(wave, fileName);
  late final _ExportWavePtr = _lookup<NativeFunction<Bool Function(WaveC, Pointer<Char>)>>('ExportWave');
  late final _ExportWave = _ExportWavePtr.asFunction<bool Function(WaveC, Pointer<Char>)>();

  bool ExportWaveAsCode(WaveC wave, Pointer<Char> fileName)
    => _ExportWaveAsCode(wave, fileName);
  late final _ExportWaveAsCodePtr = _lookup<NativeFunction<Bool Function(WaveC, Pointer<Char>)>>('ExportWaveAsCode');
  late final _ExportWaveAsCode = _ExportWaveAsCodePtr.asFunction<bool Function(WaveC, Pointer<Char>)>();

  void PlaySound(SoundC sound)
    => _PlaySound(sound);
  late final _PlaySoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('PlaySound');
  late final _PlaySound = _PlaySoundPtr.asFunction<void Function(SoundC)>();

  void StopSound(SoundC sound)
    => _StopSound(sound);
  late final _StopSoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('StopSound');
  late final _StopSound = _StopSoundPtr.asFunction<void Function(SoundC)>();

  void PauseSound(SoundC sound)
    => _PauseSound(sound);
  late final _PauseSoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('PauseSound');
  late final _PauseSound = _PauseSoundPtr.asFunction<void Function(SoundC)>();

  void ResumeSound(SoundC sound)
    => _ResumeSound(sound);
  late final _ResumeSoundPtr = _lookup<NativeFunction<Void Function(SoundC)>>('ResumeSound');
  late final _ResumeSound = _ResumeSoundPtr.asFunction<void Function(SoundC)>();

  bool IsSoundPlaying(SoundC sound)
    => _IsSoundPlaying(sound);
  late final _IsSoundPlayingPtr = _lookup<NativeFunction<Bool Function(SoundC)>>('IsSoundPlaying');
  late final _IsSoundPlaying = _IsSoundPlayingPtr.asFunction<bool Function(SoundC)>();

  void SetSoundVolume(SoundC sound, double volume)
    => _SetSoundVolume(sound, volume);
  late final _SetSoundVolumePtr = _lookup<NativeFunction<Void Function(SoundC, Float)>>('SetSoundVolume');
  late final _SetSoundVolume = _SetSoundVolumePtr.asFunction<void Function(SoundC, double)>();

  void SetSoundPitch(SoundC sound, double pitch)
    => _SetSoundPitch(sound, pitch);
  late final _SetSoundPitchPtr = _lookup<NativeFunction<Void Function(SoundC, Float)>>('SetSoundPitch');
  late final _SetSoundPitch = _SetSoundPitchPtr.asFunction<void Function(SoundC, double)>();

  void SetSoundPan(SoundC sound, double pan)
    => _SetSoundPan(sound, pan);
  late final _SetSoundPanPtr = _lookup<NativeFunction<Void Function(SoundC, Float)>>('SetSoundPan');
  late final _SetSoundPan = _SetSoundPanPtr.asFunction<void Function(SoundC, double)>();

  WaveC WaveCopy(WaveC wave)
    => _WaveCopy(wave);
  late final _WaveCopyPtr = _lookup<NativeFunction<WaveC Function(WaveC)>>('WaveCopy',);
  late final _WaveCopy = _WaveCopyPtr.asFunction<WaveC Function(WaveC)>();

  void WaveCrop(Pointer<WaveC> wave, int initFrame, int finalFrame)
    => _WaveCrop(wave, initFrame, finalFrame);
  late final _WaveCropPtr = _lookup<NativeFunction<Void Function(Pointer<WaveC>, Int, Int)>>('WaveCrop');
  late final _WaveCrop = _WaveCropPtr.asFunction<void Function(Pointer<WaveC>, int, int)>();

  void WaveFormat(Pointer<WaveC> wave, int sampleRate, int sampleSize, int channels)
    => _WaveFormat(wave, sampleRate, sampleSize, channels);
  late final _WaveFormatPtr = _lookup<NativeFunction<Void Function(Pointer<WaveC>, Int, Int, Int)>>('WaveFormat');
  late final _WaveFormat = _WaveFormatPtr.asFunction<void Function(Pointer<WaveC>, int, int, int)>();

  Pointer<Float> LoadWaveSamples(WaveC wave)
    => _LoadWaveSamples(wave);
  late final _LoadWaveSamplesPtr = _lookup<NativeFunction<Pointer<Float> Function(WaveC)>>('LoadWaveSamples');
  late final _LoadWaveSamples = _LoadWaveSamplesPtr.asFunction<Pointer<Float> Function(WaveC)>();

  void UnloadWaveSamples(Pointer<Float> samples)
    => _UnloadWaveSamples(samples);
  late final _UnloadWaveSamplesPtr = _lookup<NativeFunction<Void Function(Pointer<Float>)>>('UnloadWaveSamples');
  late final _UnloadWaveSamples = _UnloadWaveSamplesPtr.asFunction<void Function(Pointer<Float>)>();

  MusicC LoadMusicStream(Pointer<Char> fileName)
    => _LoadMusicStream(fileName);
  late final _LoadMusicStreamPtr = _lookup<NativeFunction<MusicC Function(Pointer<Char>)>>('LoadMusicStream');
  late final _LoadMusicStream = _LoadMusicStreamPtr.asFunction<MusicC Function(Pointer<Char>)>();

  MusicC LoadMusicStreamFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> data, int dataSize)
    => _LoadMusicStreamFromMemory(fileType, data, dataSize);
  late final _LoadMusicStreamFromMemoryPtr = _lookup<NativeFunction<MusicC Function(Pointer<Char>, Pointer<UnsignedChar>, Int)>>('LoadMusicStreamFromMemory');
  late final _LoadMusicStreamFromMemory = _LoadMusicStreamFromMemoryPtr.asFunction<MusicC Function(Pointer<Char>, Pointer<UnsignedChar>, int)>();

  bool IsMusicValid(MusicC music)
    => _IsMusicValid(music);
  late final _IsMusicValidPtr = _lookup<NativeFunction<Bool Function(MusicC)>>('IsMusicValid');
  late final _IsMusicValid = _IsMusicValidPtr.asFunction<bool Function(MusicC)>();

  void UnloadMusicStream(MusicC music)
    => _UnloadMusicStream(music);
  late final _UnloadMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('UnloadMusicStream');
  late final _UnloadMusicStream = _UnloadMusicStreamPtr.asFunction<void Function(MusicC)>();

  void PlayMusicStream(MusicC music)
    => _PlayMusicStream(music);
  late final _PlayMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('PlayMusicStream');
  late final _PlayMusicStream = _PlayMusicStreamPtr.asFunction<void Function(MusicC)>();

  bool IsMusicStreamPlaying(MusicC music)
    => _IsMusicStreamPlaying(music);
  late final _IsMusicStreamPlayingPtr = _lookup<NativeFunction<Bool Function(MusicC)>>('IsMusicStreamPlaying');
  late final _IsMusicStreamPlaying = _IsMusicStreamPlayingPtr.asFunction<bool Function(MusicC)>();

  void UpdateMusicStream(MusicC music)
    => _UpdateMusicStream(music);
  late final _UpdateMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('UpdateMusicStream');
  late final _UpdateMusicStream = _UpdateMusicStreamPtr.asFunction<void Function(MusicC)>();

  void StopMusicStream(MusicC music)
    => _StopMusicStream(music);
  late final _StopMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('StopMusicStream');
  late final _StopMusicStream = _StopMusicStreamPtr.asFunction<void Function(MusicC)>();

  void PauseMusicStream(MusicC music)
    => _PauseMusicStream(music);
  late final _PauseMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('PauseMusicStream');
  late final _PauseMusicStream = _PauseMusicStreamPtr.asFunction<void Function(MusicC)>();

  void ResumeMusicStream(MusicC music)
    => _ResumeMusicStream(music);
  late final _ResumeMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC)>>('ResumeMusicStream');
  late final _ResumeMusicStream = _ResumeMusicStreamPtr.asFunction<void Function(MusicC)>();

  void SeekMusicStream(MusicC music, double position)
    => _SeekMusicStream(music, position);
  late final _SeekMusicStreamPtr = _lookup<NativeFunction<Void Function(MusicC, Float)>>('SeekMusicStream');
  late final _SeekMusicStream = _SeekMusicStreamPtr.asFunction<void Function(MusicC, double)>();

  void SetMusicVolume(MusicC music, double volume)
    => _SetMusicVolume(music, volume);
  late final _SetMusicVolumePtr = _lookup<NativeFunction<Void Function(MusicC, Float)>>('SetMusicVolume');
  late final _SetMusicVolume = _SetMusicVolumePtr.asFunction<void Function(MusicC, double)>();

  void SetMusicPitch(MusicC music, double pitch)
    => _SetMusicPitch(music, pitch);
  late final _SetMusicPitchPtr = _lookup<NativeFunction<Void Function(MusicC, Float)>>('SetMusicPitch');
  late final _SetMusicPitch = _SetMusicPitchPtr.asFunction<void Function(MusicC, double)>();

  void SetMusicPan(MusicC music, double pan)
    => _SetMusicPan(music, pan);
  late final _SetMusicPanPtr = _lookup<NativeFunction<Void Function(MusicC, Float)>>('SetMusicPan');
  late final _SetMusicPan = _SetMusicPanPtr.asFunction<void Function(MusicC, double)>();

  double GetMusicTimeLength(MusicC music)
    => _GetMusicTimeLength(music);
  late final _GetMusicTimeLengthPtr = _lookup<NativeFunction<Float Function(MusicC)>>('GetMusicTimeLength');
  late final _GetMusicTimeLength = _GetMusicTimeLengthPtr.asFunction<double Function(MusicC)>();

  double GetMusicTimePlayed(MusicC music)
    => _GetMusicTimePlayed(music);
  late final _GetMusicTimePlayedPtr = _lookup<NativeFunction<Float Function(MusicC)>>('GetMusicTimePlayed');
  late final _GetMusicTimePlayed = _GetMusicTimePlayedPtr.asFunction<double Function(MusicC)>();

  AudioStreamC LoadAudioStream(int sampleRate, int sampleSize, int channels)
    => _LoadAudioStream(sampleRate, sampleSize, channels);
  late final _LoadAudioStreamPtr = _lookup<NativeFunction<AudioStreamC Function(UnsignedInt, UnsignedInt, UnsignedInt)>>('LoadAudioStream');
  late final _LoadAudioStream = _LoadAudioStreamPtr.asFunction<AudioStreamC Function(int, int, int)>();

  bool IsAudioStreamValid(AudioStreamC stream)
    => _IsAudioStreamValid(stream);
  late final _IsAudioStreamValidPtr = _lookup<NativeFunction<Bool Function(AudioStreamC)>>('IsAudioStreamValid');
  late final _IsAudioStreamValid = _IsAudioStreamValidPtr.asFunction<bool Function(AudioStreamC)>();

  void UnloadAudioStream(AudioStreamC stream)
    => _UnloadAudioStream(stream);
  late final _UnloadAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('UnloadAudioStream');
  late final _UnloadAudioStream = _UnloadAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  void UpdateAudioStream(AudioStreamC stream, Pointer<Void> data, int frameCount)
    => _UpdateAudioStream(stream, data, frameCount);
  late final _UpdateAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC, Pointer<Void>, Int)>>('UpdateAudioStream');
  late final _UpdateAudioStream = _UpdateAudioStreamPtr.asFunction<void Function(AudioStreamC, Pointer<Void>, int)>();

  bool IsAudioStreamProcessed(AudioStreamC stream)
    => _IsAudioStreamProcessed(stream);
  late final _IsAudioStreamProcessedPtr = _lookup<NativeFunction<Bool Function(AudioStreamC)>>('IsAudioStreamProcessed');
  late final _IsAudioStreamProcessed = _IsAudioStreamProcessedPtr.asFunction<bool Function(AudioStreamC)>();

  void PlayAudioStream(AudioStreamC stream)
    => _PlayAudioStream(stream);
  late final _PlayAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('PlayAudioStream');
  late final _PlayAudioStream = _PlayAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  void PauseAudioStream(AudioStreamC stream)
    => _PauseAudioStream(stream);
  late final _PauseAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('PauseAudioStream');
  late final _PauseAudioStream = _PauseAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  void ResumeAudioStream(AudioStreamC stream)
    => _ResumeAudioStream(stream);
  late final _ResumeAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('ResumeAudioStream');
  late final _ResumeAudioStream = _ResumeAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  bool IsAudioStreamPlaying(AudioStreamC stream)
    => _IsAudioStreamPlaying(stream);
  late final _IsAudioStreamPlayingPtr = _lookup<NativeFunction<Bool Function(AudioStreamC)>>('IsAudioStreamPlaying');
  late final _IsAudioStreamPlaying = _IsAudioStreamPlayingPtr.asFunction<bool Function(AudioStreamC)>();

  void StopAudioStream(AudioStreamC stream)
    => _StopAudioStream(stream);
  late final _StopAudioStreamPtr = _lookup<NativeFunction<Void Function(AudioStreamC)>>('StopAudioStream');
  late final _StopAudioStream = _StopAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  void SetAudioStreamVolume(AudioStreamC stream, double volume)
    => _SetAudioStreamVolume(stream, volume);
  late final _SetAudioStreamVolumePtr = _lookup<NativeFunction<Void Function(AudioStreamC, Float)>>('SetAudioStreamVolume');
  late final _SetAudioStreamVolume = _SetAudioStreamVolumePtr.asFunction<void Function(AudioStreamC, double)>();

  void SetAudioStreamPitch(AudioStreamC stream, double pitch)
    => _SetAudioStreamPitch(stream, pitch);
  late final _SetAudioStreamPitchPtr = _lookup<NativeFunction<Void Function(AudioStreamC, Float)>>('SetAudioStreamPitch');
  late final _SetAudioStreamPitch = _SetAudioStreamPitchPtr.asFunction<void Function(AudioStreamC, double)>();

  void SetAudioStreamPan(AudioStreamC stream, double pan)
    => _SetAudioStreamPan(stream, pan);
  late final _SetAudioStreamPanPtr = _lookup<NativeFunction<Void Function(AudioStreamC, Float)>>('SetAudioStreamPan');
  late final _SetAudioStreamPan = _SetAudioStreamPanPtr.asFunction<void Function(AudioStreamC, double)>();

  void SetAudioStreamBufferSizeDefault(int size)
    => _SetAudioStreamBufferSizeDefault(size);
  late final _SetAudioStreamBufferSizeDefaultPtr = _lookup<NativeFunction<Void Function(Int)>>('SetAudioStreamBufferSizeDefault');
  late final _SetAudioStreamBufferSizeDefault = _SetAudioStreamBufferSizeDefaultPtr.asFunction<void Function(int)>();

  void SetAudioStreamCallback(AudioStreamC stream, AudioCallbackC callback)
    => _SetAudioStreamCallback(stream, callback);
  late final _SetAudioStreamCallbackPtr = _lookup<NativeFunction<Void Function(AudioStreamC, AudioCallbackC)>>('SetAudioStreamCallback');
  late final _SetAudioStreamCallback = _SetAudioStreamCallbackPtr.asFunction<void Function(AudioStreamC, AudioCallbackC)>();

  void AttachAudioStreamProcessor(AudioStreamC stream, AudioCallbackC processor)
    => _AttachAudioStreamProcessor(stream, processor);
  late final _AttachAudioStreamProcessorPtr = _lookup<NativeFunction<Void Function(AudioStreamC, AudioCallbackC)>>('AttachAudioStreamProcessor');
  late final _AttachAudioStreamProcessor = _AttachAudioStreamProcessorPtr.asFunction<void Function(AudioStreamC, AudioCallbackC)>();

  void DetachAudioStreamProcessor(AudioStreamC stream, AudioCallbackC processor)
    => _DetachAudioStreamProcessor(stream, processor);
  late final _DetachAudioStreamProcessorPtr = _lookup<NativeFunction<Void Function(AudioStreamC, AudioCallbackC)>>('DetachAudioStreamProcessor');
  late final _DetachAudioStreamProcessor = _DetachAudioStreamProcessorPtr.asFunction<void Function(AudioStreamC, AudioCallbackC)>();

  void AttachAudioMixedProcessor(AudioCallbackC processor)
    => _AttachAudioMixedProcessor(processor);
  late final _AttachAudioMixedProcessorPtr = _lookup<NativeFunction<Void Function(AudioCallbackC)>>('AttachAudioMixedProcessor');
  late final _AttachAudioMixedProcessor = _AttachAudioMixedProcessorPtr.asFunction<void Function(AudioCallbackC)>();

  void DetachAudioMixedProcessor(AudioCallbackC processor)
    => _DetachAudioMixedProcessor(processor);
  late final _DetachAudioMixedProcessorPtr = _lookup<NativeFunction<Void Function(AudioCallbackC)>>('DetachAudioMixedProcessor');
  late final _DetachAudioMixedProcessor = _DetachAudioMixedProcessorPtr.asFunction<void Function(AudioCallbackC)>();
}
