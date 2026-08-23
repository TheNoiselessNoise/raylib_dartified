import 'package:raylib_dartified/raylib_dartified.dart';

RaylibAudioFlat get _module => Raylib.instance.AudioFlat;

/// See [RaylibAudioFlat.InitAudioDevice].
void InitAudioDevice() => _module.InitAudioDevice();

/// See [RaylibAudioFlat.CloseAudioDevice].
void CloseAudioDevice() => _module.CloseAudioDevice();

/// See [RaylibAudioFlat.IsAudioDeviceReady].
bool IsAudioDeviceReady() => _module.IsAudioDeviceReady();

/// See [RaylibAudioFlat.SetMasterVolume].
void SetMasterVolume(
  double volume,
) => _module.SetMasterVolume(volume);

/// See [RaylibAudioFlat.GetMasterVolume].
double GetMasterVolume() => _module.GetMasterVolume();

/// See [RaylibAudioFlat.LoadWave].
WaveD LoadWave(
  MemoryPointer<RChar> fileName,
) => _module.LoadWave(fileName);

/// See [RaylibAudioFlat.LoadWaveFromMemory].
WaveD LoadWaveFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
) => _module.LoadWaveFromMemory(fileType, fileData, dataSize);

/// See [RaylibAudioFlat.IsWaveValid].
bool IsWaveValid(
  WaveD wave,
) => _module.IsWaveValid(wave);

/// See [RaylibAudioFlat.LoadSound].
SoundD LoadSound(
  MemoryPointer<RChar> fileName,
) => _module.LoadSound(fileName);

/// See [RaylibAudioFlat.LoadSoundFromWave].
SoundD LoadSoundFromWave(
  WaveD wave,
) => _module.LoadSoundFromWave(wave);

/// See [RaylibAudioFlat.LoadSoundAlias].
SoundD LoadSoundAlias(
  SoundD source,
) => _module.LoadSoundAlias(source);

/// See [RaylibAudioFlat.IsSoundValid].
bool IsSoundValid(
  SoundD sound,
) => _module.IsSoundValid(sound);

/// See [RaylibAudioFlat.UpdateSound].
void UpdateSound(
  SoundD sound,
  MemoryPointer<RVoid> data,
  int sampleCount,
) => _module.UpdateSound(sound, data, sampleCount);

/// See [RaylibAudioFlat.UnloadWave].
void UnloadWave(
  WaveD wave,
) => _module.UnloadWave(wave);

/// See [RaylibAudioFlat.UnloadSound].
void UnloadSound(
  SoundD sound,
) => _module.UnloadSound(sound);

/// See [RaylibAudioFlat.UnloadSoundAlias].
void UnloadSoundAlias(
  SoundD alias,
) => _module.UnloadSoundAlias(alias);

/// See [RaylibAudioFlat.ExportWave].
bool ExportWave(
  WaveD wave,
  MemoryPointer<RChar> fileName,
) => _module.ExportWave(wave, fileName);

/// See [RaylibAudioFlat.ExportWaveAsCode].
bool ExportWaveAsCode(
  WaveD wave,
  MemoryPointer<RChar> fileName,
) => _module.ExportWaveAsCode(wave, fileName);

/// See [RaylibAudioFlat.PlaySound].
void PlaySound(
  SoundD sound,
) => _module.PlaySound(sound);

/// See [RaylibAudioFlat.StopSound].
void StopSound(
  SoundD sound,
) => _module.StopSound(sound);

/// See [RaylibAudioFlat.PauseSound].
void PauseSound(
  SoundD sound,
) => _module.PauseSound(sound);

/// See [RaylibAudioFlat.ResumeSound].
void ResumeSound(
  SoundD sound,
) => _module.ResumeSound(sound);

/// See [RaylibAudioFlat.IsSoundPlaying].
bool IsSoundPlaying(
  SoundD sound,
) => _module.IsSoundPlaying(sound);

/// See [RaylibAudioFlat.SetSoundVolume].
void SetSoundVolume(
  SoundD sound,
  double volume,
) => _module.SetSoundVolume(sound, volume);

/// See [RaylibAudioFlat.SetSoundPitch].
void SetSoundPitch(
  SoundD sound,
  double pitch,
) => _module.SetSoundPitch(sound, pitch);

/// See [RaylibAudioFlat.SetSoundPan].
void SetSoundPan(
  SoundD sound,
  double pan,
) => _module.SetSoundPan(sound, pan);

/// See [RaylibAudioFlat.WaveCopy].
WaveD WaveCopy(
  WaveD wave,
) => _module.WaveCopy(wave);

/// See [RaylibAudioFlat.WaveCrop].
void WaveCrop(
  StructPointer<WaveD> wave,
  int initFrame,
  int finalFrame,
) => _module.WaveCrop(wave, initFrame, finalFrame);

/// See [RaylibAudioFlat.WaveFormat].
void WaveFormat(
  StructPointer<WaveD> wave,
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.WaveFormat(wave, sampleRate, sampleSize, channels);

/// See [RaylibAudioFlat.LoadWaveSamples].
NativeMemoryPointer<RFloat32> LoadWaveSamples(
  WaveD wave,
) => _module.LoadWaveSamples(wave);

/// See [RaylibAudioFlat.UnloadWaveSamples].
void UnloadWaveSamples(
  MemoryPointer<RFloat32> samples,
) => _module.UnloadWaveSamples(samples);

/// See [RaylibAudioFlat.LoadMusicStream].
MusicD LoadMusicStream(
  MemoryPointer<RChar> fileName,
) => _module.LoadMusicStream(fileName);

/// See [RaylibAudioFlat.LoadMusicStreamFromMemory].
MusicD LoadMusicStreamFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.LoadMusicStreamFromMemory(fileType, data, dataSize);

/// See [RaylibAudioFlat.IsMusicValid].
bool IsMusicValid(
  MusicD music,
) => _module.IsMusicValid(music);

/// See [RaylibAudioFlat.UnloadMusicStream].
void UnloadMusicStream(
  MusicD music,
) => _module.UnloadMusicStream(music);

/// See [RaylibAudioFlat.PlayMusicStream].
void PlayMusicStream(
  MusicD music,
) => _module.PlayMusicStream(music);

/// See [RaylibAudioFlat.IsMusicStreamPlaying].
bool IsMusicStreamPlaying(
  MusicD music,
) => _module.IsMusicStreamPlaying(music);

/// See [RaylibAudioFlat.UpdateMusicStream].
void UpdateMusicStream(
  MusicD music,
) => _module.UpdateMusicStream(music);

/// See [RaylibAudioFlat.StopMusicStream].
void StopMusicStream(
  MusicD music,
) => _module.StopMusicStream(music);

/// See [RaylibAudioFlat.PauseMusicStream].
void PauseMusicStream(
  MusicD music,
) => _module.PauseMusicStream(music);

/// See [RaylibAudioFlat.ResumeMusicStream].
void ResumeMusicStream(
  MusicD music,
) => _module.ResumeMusicStream(music);

/// See [RaylibAudioFlat.SeekMusicStream].
void SeekMusicStream(
  MusicD music,
  double position,
) => _module.SeekMusicStream(music, position);

/// See [RaylibAudioFlat.SetMusicVolume].
void SetMusicVolume(
  MusicD music,
  double volume,
) => _module.SetMusicVolume(music, volume);

/// See [RaylibAudioFlat.SetMusicPitch].
void SetMusicPitch(
  MusicD music,
  double pitch,
) => _module.SetMusicPitch(music, pitch);

/// See [RaylibAudioFlat.SetMusicPan].
void SetMusicPan(
  MusicD music,
  double pan,
) => _module.SetMusicPan(music, pan);

/// See [RaylibAudioFlat.GetMusicTimeLength].
double GetMusicTimeLength(
  MusicD music,
) => _module.GetMusicTimeLength(music);

/// See [RaylibAudioFlat.GetMusicTimePlayed].
double GetMusicTimePlayed(
  MusicD music,
) => _module.GetMusicTimePlayed(music);

/// See [RaylibAudioFlat.LoadAudioStream].
AudioStreamD LoadAudioStream(
  int sampleRate,
  int sampleSize,
  int channels
) => _module.LoadAudioStream(sampleRate, sampleSize, channels);

/// See [RaylibAudioFlat.IsAudioStreamValid].
bool IsAudioStreamValid(
  AudioStreamD stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioFlat.UnloadAudioStream].
void UnloadAudioStream(
  AudioStreamD stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioFlat.UpdateAudioStream].
void UpdateAudioStream(
  AudioStreamD stream,
  MemoryPointer<RVoid> data,
  int frameCount,
) => _module.UpdateAudioStream(stream, data, frameCount);

/// See [RaylibAudioFlat.IsAudioStreamProcessed].
bool IsAudioStreamProcessed(
  AudioStreamD stream,
) => _module.IsAudioStreamProcessed(stream);

/// See [RaylibAudioFlat.PlayAudioStream].
void PlayAudioStream(
  AudioStreamD stream,
) => _module.PlayAudioStream(stream);

/// See [RaylibAudioFlat.PauseAudioStream].
void PauseAudioStream(
  AudioStreamD stream,
) => _module.PauseAudioStream(stream);

/// See [RaylibAudioFlat.ResumeAudioStream].
void ResumeAudioStream(
  AudioStreamD stream,
) => _module.ResumeAudioStream(stream);

/// See [RaylibAudioFlat.IsAudioStreamPlaying].
bool IsAudioStreamPlaying(
  AudioStreamD stream,
) => _module.IsAudioStreamPlaying(stream);

/// See [RaylibAudioFlat.StopAudioStream].
void StopAudioStream(
  AudioStreamD stream,
) => _module.StopAudioStream(stream);

/// See [RaylibAudioFlat.SetAudioStreamVolume].
void SetAudioStreamVolume(
  AudioStreamD stream,
  double volume,
) => _module.SetAudioStreamVolume(stream, volume);

/// See [RaylibAudioFlat.SetAudioStreamPitch].
void SetAudioStreamPitch(
  AudioStreamD stream,
  double pitch,
) => _module.SetAudioStreamPitch(stream, pitch);

/// See [RaylibAudioFlat.SetAudioStreamPan].
void SetAudioStreamPan(
  AudioStreamD stream,
  double pan,
) => _module.SetAudioStreamPan(stream, pan);

/// See [RaylibAudioFlat.SetAudioStreamBufferSizeDefault].
void SetAudioStreamBufferSizeDefault(
  int size,
) => _module.SetAudioStreamBufferSizeDefault(size);

/// See [RaylibAudioFlat.SetAudioStreamCallback].
void SetAudioStreamCallback(
  AudioStreamD stream,
  MemoryPointer<RFunction> callback, // AudioCallback
) => _module.SetAudioStreamCallback(stream, callback);

/// See [RaylibAudioFlat.AttachAudioStreamProcessor].
void AttachAudioStreamProcessor(
  AudioStreamD stream,
  MemoryPointer<RFunction> processor, // AudioCallback
) => _module.AttachAudioStreamProcessor(stream, processor);

/// See [RaylibAudioFlat.DetachAudioStreamProcessor].
void DetachAudioStreamProcessor(
  AudioStreamD stream,
  MemoryPointer<RFunction> processor, // AudioCallback
) => _module.DetachAudioStreamProcessor(stream, processor);

/// See [RaylibAudioFlat.AttachAudioMixedProcessor].
void AttachAudioMixedProcessor(
  MemoryPointer<RFunction> processor, // AudioCallback
) => _module.AttachAudioMixedProcessor(processor);

/// See [RaylibAudioFlat.DetachAudioMixedProcessor].
void DetachAudioMixedProcessor(
  MemoryPointer<RFunction> processor, // AudioCallback
) => _module.DetachAudioMixedProcessor(processor);