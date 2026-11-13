import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibAudioFlat get _module => RaylibBase.instance.module();

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
Wave LoadWave(
  XPtr<XChar> fileName,
) => _module.LoadWave(fileName);

/// See [RaylibAudioFlat.LoadWaveFromMemory].
Wave LoadWaveFromMemory(
  XPtr<XChar> fileType,
  XPtr<XUnsignedChar> fileData,
  int dataSize,
) => _module.LoadWaveFromMemory(fileType, fileData, dataSize);

/// See [RaylibAudioFlat.IsWaveValid].
bool IsWaveValid(
  Wave wave,
) => _module.IsWaveValid(wave);

/// See [RaylibAudioFlat.LoadSound].
Sound LoadSound(
  XPtr<XChar> fileName,
) => _module.LoadSound(fileName);

/// See [RaylibAudioFlat.LoadSoundFromWave].
Sound LoadSoundFromWave(
  Wave wave,
) => _module.LoadSoundFromWave(wave);

/// See [RaylibAudioFlat.LoadSoundAlias].
Sound LoadSoundAlias(
  Sound source,
) => _module.LoadSoundAlias(source);

/// See [RaylibAudioFlat.IsSoundValid].
bool IsSoundValid(
  Sound sound,
) => _module.IsSoundValid(sound);

/// See [RaylibAudioFlat.UpdateSound].
void UpdateSound(
  Sound sound,
  XPtr<XVoid> data,
  int sampleCount,
) => _module.UpdateSound(sound, data, sampleCount);

/// See [RaylibAudioFlat.UnloadWave].
void UnloadWave(
  Wave wave,
) => _module.UnloadWave(wave);

/// See [RaylibAudioFlat.UnloadSound].
void UnloadSound(
  Sound sound,
) => _module.UnloadSound(sound);

/// See [RaylibAudioFlat.UnloadSoundAlias].
void UnloadSoundAlias(
  Sound alias,
) => _module.UnloadSoundAlias(alias);

/// See [RaylibAudioFlat.ExportWave].
bool ExportWave(
  Wave wave,
  XPtr<XChar> fileName,
) => _module.ExportWave(wave, fileName);

/// See [RaylibAudioFlat.ExportWaveAsCode].
bool ExportWaveAsCode(
  Wave wave,
  XPtr<XChar> fileName,
) => _module.ExportWaveAsCode(wave, fileName);

/// See [RaylibAudioFlat.PlaySound].
void PlaySound(
  Sound sound,
) => _module.PlaySound(sound);

/// See [RaylibAudioFlat.StopSound].
void StopSound(
  Sound sound,
) => _module.StopSound(sound);

/// See [RaylibAudioFlat.PauseSound].
void PauseSound(
  Sound sound,
) => _module.PauseSound(sound);

/// See [RaylibAudioFlat.ResumeSound].
void ResumeSound(
  Sound sound,
) => _module.ResumeSound(sound);

/// See [RaylibAudioFlat.IsSoundPlaying].
bool IsSoundPlaying(
  Sound sound,
) => _module.IsSoundPlaying(sound);

/// See [RaylibAudioFlat.SetSoundVolume].
void SetSoundVolume(
  Sound sound,
  double volume,
) => _module.SetSoundVolume(sound, volume);

/// See [RaylibAudioFlat.SetSoundPitch].
void SetSoundPitch(
  Sound sound,
  double pitch,
) => _module.SetSoundPitch(sound, pitch);

/// See [RaylibAudioFlat.SetSoundPan].
void SetSoundPan(
  Sound sound,
  double pan,
) => _module.SetSoundPan(sound, pan);

/// See [RaylibAudioFlat.WaveCopy].
Wave WaveCopy(
  Wave wave,
) => _module.WaveCopy(wave);

/// See [RaylibAudioFlat.WaveCrop].
void WaveCrop(
  XStructPtr<Wave> wave,
  int initFrame,
  int finalFrame,
) => _module.WaveCrop(wave, initFrame, finalFrame);

/// See [RaylibAudioFlat.WaveFormat].
void WaveFormat(
  XStructPtr<Wave> wave,
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.WaveFormat(wave, sampleRate, sampleSize, channels);

/// See [RaylibAudioFlat.LoadWaveSamples].
XPtr<XFloat32> LoadWaveSamples(
  Wave wave,
) => _module.LoadWaveSamples(wave);

/// See [RaylibAudioFlat.UnloadWaveSamples].
void UnloadWaveSamples(
  XPtr<XFloat32> samples,
) => _module.UnloadWaveSamples(samples);

/// See [RaylibAudioFlat.LoadMusicStream].
Music LoadMusicStream(
  XPtr<XChar> fileName,
) => _module.LoadMusicStream(fileName);

/// See [RaylibAudioFlat.LoadMusicStreamFromMemory].
Music LoadMusicStreamFromMemory(
  XPtr<XChar> fileType,
  XPtr<XUnsignedChar> data,
  int dataSize,
) => _module.LoadMusicStreamFromMemory(fileType, data, dataSize);

/// See [RaylibAudioFlat.IsMusicValid].
bool IsMusicValid(
  Music music,
) => _module.IsMusicValid(music);

/// See [RaylibAudioFlat.UnloadMusicStream].
void UnloadMusicStream(
  Music music,
) => _module.UnloadMusicStream(music);

/// See [RaylibAudioFlat.PlayMusicStream].
void PlayMusicStream(
  Music music,
) => _module.PlayMusicStream(music);

/// See [RaylibAudioFlat.IsMusicStreamPlaying].
bool IsMusicStreamPlaying(
  Music music,
) => _module.IsMusicStreamPlaying(music);

/// See [RaylibAudioFlat.UpdateMusicStream].
void UpdateMusicStream(
  Music music,
) => _module.UpdateMusicStream(music);

/// See [RaylibAudioFlat.StopMusicStream].
void StopMusicStream(
  Music music,
) => _module.StopMusicStream(music);

/// See [RaylibAudioFlat.PauseMusicStream].
void PauseMusicStream(
  Music music,
) => _module.PauseMusicStream(music);

/// See [RaylibAudioFlat.ResumeMusicStream].
void ResumeMusicStream(
  Music music,
) => _module.ResumeMusicStream(music);

/// See [RaylibAudioFlat.SeekMusicStream].
void SeekMusicStream(
  Music music,
  double position,
) => _module.SeekMusicStream(music, position);

/// See [RaylibAudioFlat.SetMusicVolume].
void SetMusicVolume(
  Music music,
  double volume,
) => _module.SetMusicVolume(music, volume);

/// See [RaylibAudioFlat.SetMusicPitch].
void SetMusicPitch(
  Music music,
  double pitch,
) => _module.SetMusicPitch(music, pitch);

/// See [RaylibAudioFlat.SetMusicPan].
void SetMusicPan(
  Music music,
  double pan,
) => _module.SetMusicPan(music, pan);

/// See [RaylibAudioFlat.GetMusicTimeLength].
double GetMusicTimeLength(
  Music music,
) => _module.GetMusicTimeLength(music);

/// See [RaylibAudioFlat.GetMusicTimePlayed].
double GetMusicTimePlayed(
  Music music,
) => _module.GetMusicTimePlayed(music);

/// See [RaylibAudioFlat.LoadAudioStream].
AudioStream LoadAudioStream(
  int sampleRate,
  int sampleSize,
  int channels
) => _module.LoadAudioStream(sampleRate, sampleSize, channels);

/// See [RaylibAudioFlat.IsAudioStreamValid].
bool IsAudioStreamValid(
  AudioStream stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioFlat.UnloadAudioStream].
void UnloadAudioStream(
  AudioStream stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioFlat.UpdateAudioStream].
void UpdateAudioStream(
  AudioStream stream,
  XPtr<XVoid> data,
  int frameCount,
) => _module.UpdateAudioStream(stream, data, frameCount);

/// See [RaylibAudioFlat.IsAudioStreamProcessed].
bool IsAudioStreamProcessed(
  AudioStream stream,
) => _module.IsAudioStreamProcessed(stream);

/// See [RaylibAudioFlat.PlayAudioStream].
void PlayAudioStream(
  AudioStream stream,
) => _module.PlayAudioStream(stream);

/// See [RaylibAudioFlat.PauseAudioStream].
void PauseAudioStream(
  AudioStream stream,
) => _module.PauseAudioStream(stream);

/// See [RaylibAudioFlat.ResumeAudioStream].
void ResumeAudioStream(
  AudioStream stream,
) => _module.ResumeAudioStream(stream);

/// See [RaylibAudioFlat.IsAudioStreamPlaying].
bool IsAudioStreamPlaying(
  AudioStream stream,
) => _module.IsAudioStreamPlaying(stream);

/// See [RaylibAudioFlat.StopAudioStream].
void StopAudioStream(
  AudioStream stream,
) => _module.StopAudioStream(stream);

/// See [RaylibAudioFlat.SetAudioStreamVolume].
void SetAudioStreamVolume(
  AudioStream stream,
  double volume,
) => _module.SetAudioStreamVolume(stream, volume);

/// See [RaylibAudioFlat.SetAudioStreamPitch].
void SetAudioStreamPitch(
  AudioStream stream,
  double pitch,
) => _module.SetAudioStreamPitch(stream, pitch);

/// See [RaylibAudioFlat.SetAudioStreamPan].
void SetAudioStreamPan(
  AudioStream stream,
  double pan,
) => _module.SetAudioStreamPan(stream, pan);

/// See [RaylibAudioFlat.SetAudioStreamBufferSizeDefault].
void SetAudioStreamBufferSizeDefault(
  int size,
) => _module.SetAudioStreamBufferSizeDefault(size);

/// See [RaylibAudioFlat.SetAudioStreamCallback].
void SetAudioStreamCallback(
  AudioStream stream,
  XPtr<XFunction<AudioCallbackBase>> callback,
) => _module.SetAudioStreamCallback(stream, callback);

/// See [RaylibAudioFlat.AttachAudioStreamProcessor].
void AttachAudioStreamProcessor(
  AudioStream stream,
  XPtr<XFunction<AudioCallbackBase>> processor,
) => _module.AttachAudioStreamProcessor(stream, processor);

/// See [RaylibAudioFlat.DetachAudioStreamProcessor].
void DetachAudioStreamProcessor(
  AudioStream stream,
  XPtr<XFunction<AudioCallbackBase>> processor,
) => _module.DetachAudioStreamProcessor(stream, processor);

/// See [RaylibAudioFlat.AttachAudioMixedProcessor].
void AttachAudioMixedProcessor(
  XPtr<XFunction<AudioCallbackBase>> processor,
) => _module.AttachAudioMixedProcessor(processor);

/// See [RaylibAudioFlat.DetachAudioMixedProcessor].
void DetachAudioMixedProcessor(
  XPtr<XFunction<AudioCallbackBase>> processor,
) => _module.DetachAudioMixedProcessor(processor);