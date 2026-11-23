import 'package:raylib_dartified/raylib_dartified.dart';

RaylibAudioFlat get _module => Raylib.instance.module();

/// See [RaylibAudioFlatImpl.InitAudioDevice].
void InitAudioDevice() => _module.InitAudioDevice();

/// See [RaylibAudioFlatImpl.CloseAudioDevice].
void CloseAudioDevice() => _module.CloseAudioDevice();

/// See [RaylibAudioFlatImpl.IsAudioDeviceReady].
bool IsAudioDeviceReady() => _module.IsAudioDeviceReady();

/// See [RaylibAudioFlatImpl.SetMasterVolume].
void SetMasterVolume(
  double volume,
) => _module.SetMasterVolume(volume);

/// See [RaylibAudioFlatImpl.GetMasterVolume].
double GetMasterVolume() => _module.GetMasterVolume();

/// See [RaylibAudioFlatImpl.LoadWave].
Wave LoadWave(
  XPtr<XChar> fileName,
) => _module.LoadWave(fileName);

/// See [RaylibAudioFlatImpl.LoadWaveFromMemory].
Wave LoadWaveFromMemory(
  XPtr<XChar> fileType,
  XPtr<XUnsignedChar> fileData,
  int dataSize,
) => _module.LoadWaveFromMemory(fileType, fileData, dataSize);

/// See [RaylibAudioFlatImpl.IsWaveValid].
bool IsWaveValid(
  Wave wave,
) => _module.IsWaveValid(wave);

/// See [RaylibAudioFlatImpl.LoadSound].
Sound LoadSound(
  XPtr<XChar> fileName,
) => _module.LoadSound(fileName);

/// See [RaylibAudioFlatImpl.LoadSoundFromWave].
Sound LoadSoundFromWave(
  Wave wave,
) => _module.LoadSoundFromWave(wave);

/// See [RaylibAudioFlatImpl.LoadSoundAlias].
Sound LoadSoundAlias(
  Sound source,
) => _module.LoadSoundAlias(source);

/// See [RaylibAudioFlatImpl.IsSoundValid].
bool IsSoundValid(
  Sound sound,
) => _module.IsSoundValid(sound);

/// See [RaylibAudioFlatImpl.UpdateSound].
void UpdateSound(
  Sound sound,
  XPtr<XVoid> data,
  int sampleCount,
) => _module.UpdateSound(sound, data, sampleCount);

/// See [RaylibAudioFlatImpl.UnloadWave].
void UnloadWave(
  Wave wave,
) => _module.UnloadWave(wave);

/// See [RaylibAudioFlatImpl.UnloadSound].
void UnloadSound(
  Sound sound,
) => _module.UnloadSound(sound);

/// See [RaylibAudioFlatImpl.UnloadSoundAlias].
void UnloadSoundAlias(
  Sound alias,
) => _module.UnloadSoundAlias(alias);

/// See [RaylibAudioFlatImpl.ExportWave].
bool ExportWave(
  Wave wave,
  XPtr<XChar> fileName,
) => _module.ExportWave(wave, fileName);

/// See [RaylibAudioFlatImpl.ExportWaveAsCode].
bool ExportWaveAsCode(
  Wave wave,
  XPtr<XChar> fileName,
) => _module.ExportWaveAsCode(wave, fileName);

/// See [RaylibAudioFlatImpl.PlaySound].
void PlaySound(
  Sound sound,
) => _module.PlaySound(sound);

/// See [RaylibAudioFlatImpl.StopSound].
void StopSound(
  Sound sound,
) => _module.StopSound(sound);

/// See [RaylibAudioFlatImpl.PauseSound].
void PauseSound(
  Sound sound,
) => _module.PauseSound(sound);

/// See [RaylibAudioFlatImpl.ResumeSound].
void ResumeSound(
  Sound sound,
) => _module.ResumeSound(sound);

/// See [RaylibAudioFlatImpl.IsSoundPlaying].
bool IsSoundPlaying(
  Sound sound,
) => _module.IsSoundPlaying(sound);

/// See [RaylibAudioFlatImpl.SetSoundVolume].
void SetSoundVolume(
  Sound sound,
  double volume,
) => _module.SetSoundVolume(sound, volume);

/// See [RaylibAudioFlatImpl.SetSoundPitch].
void SetSoundPitch(
  Sound sound,
  double pitch,
) => _module.SetSoundPitch(sound, pitch);

/// See [RaylibAudioFlatImpl.SetSoundPan].
void SetSoundPan(
  Sound sound,
  double pan,
) => _module.SetSoundPan(sound, pan);

/// See [RaylibAudioFlatImpl.WaveCopy].
Wave WaveCopy(
  Wave wave,
) => _module.WaveCopy(wave);

/// See [RaylibAudioFlatImpl.WaveCrop].
void WaveCrop(
  XStructPtr<Wave> wave,
  int initFrame,
  int finalFrame,
) => _module.WaveCrop(wave, initFrame, finalFrame);

/// See [RaylibAudioFlatImpl.WaveFormat].
void WaveFormat(
  XStructPtr<Wave> wave,
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.WaveFormat(wave, sampleRate, sampleSize, channels);

/// See [RaylibAudioFlatImpl.LoadWaveSamples].
XPtr<XFloat32> LoadWaveSamples(
  Wave wave,
) => _module.LoadWaveSamples(wave);

/// See [RaylibAudioFlatImpl.UnloadWaveSamples].
void UnloadWaveSamples(
  XPtr<XFloat32> samples,
) => _module.UnloadWaveSamples(samples);

/// See [RaylibAudioFlatImpl.LoadMusicStream].
Music LoadMusicStream(
  XPtr<XChar> fileName,
) => _module.LoadMusicStream(fileName);

/// See [RaylibAudioFlatImpl.LoadMusicStreamFromMemory].
Music LoadMusicStreamFromMemory(
  XPtr<XChar> fileType,
  XPtr<XUnsignedChar> data,
  int dataSize,
) => _module.LoadMusicStreamFromMemory(fileType, data, dataSize);

/// See [RaylibAudioFlatImpl.IsMusicValid].
bool IsMusicValid(
  Music music,
) => _module.IsMusicValid(music);

/// See [RaylibAudioFlatImpl.UnloadMusicStream].
void UnloadMusicStream(
  Music music,
) => _module.UnloadMusicStream(music);

/// See [RaylibAudioFlatImpl.PlayMusicStream].
void PlayMusicStream(
  Music music,
) => _module.PlayMusicStream(music);

/// See [RaylibAudioFlatImpl.IsMusicStreamPlaying].
bool IsMusicStreamPlaying(
  Music music,
) => _module.IsMusicStreamPlaying(music);

/// See [RaylibAudioFlatImpl.UpdateMusicStream].
void UpdateMusicStream(
  Music music,
) => _module.UpdateMusicStream(music);

/// See [RaylibAudioFlatImpl.StopMusicStream].
void StopMusicStream(
  Music music,
) => _module.StopMusicStream(music);

/// See [RaylibAudioFlatImpl.PauseMusicStream].
void PauseMusicStream(
  Music music,
) => _module.PauseMusicStream(music);

/// See [RaylibAudioFlatImpl.ResumeMusicStream].
void ResumeMusicStream(
  Music music,
) => _module.ResumeMusicStream(music);

/// See [RaylibAudioFlatImpl.SeekMusicStream].
void SeekMusicStream(
  Music music,
  double position,
) => _module.SeekMusicStream(music, position);

/// See [RaylibAudioFlatImpl.SetMusicVolume].
void SetMusicVolume(
  Music music,
  double volume,
) => _module.SetMusicVolume(music, volume);

/// See [RaylibAudioFlatImpl.SetMusicPitch].
void SetMusicPitch(
  Music music,
  double pitch,
) => _module.SetMusicPitch(music, pitch);

/// See [RaylibAudioFlatImpl.SetMusicPan].
void SetMusicPan(
  Music music,
  double pan,
) => _module.SetMusicPan(music, pan);

/// See [RaylibAudioFlatImpl.GetMusicTimeLength].
double GetMusicTimeLength(
  Music music,
) => _module.GetMusicTimeLength(music);

/// See [RaylibAudioFlatImpl.GetMusicTimePlayed].
double GetMusicTimePlayed(
  Music music,
) => _module.GetMusicTimePlayed(music);

/// See [RaylibAudioFlatImpl.LoadAudioStream].
AudioStream LoadAudioStream(
  int sampleRate,
  int sampleSize,
  int channels
) => _module.LoadAudioStream(sampleRate, sampleSize, channels);

/// See [RaylibAudioFlatImpl.IsAudioStreamValid].
bool IsAudioStreamValid(
  AudioStream stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioFlatImpl.UnloadAudioStream].
void UnloadAudioStream(
  AudioStream stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioFlatImpl.UpdateAudioStream].
void UpdateAudioStream(
  AudioStream stream,
  XPtr<XVoid> data,
  int frameCount,
) => _module.UpdateAudioStream(stream, data, frameCount);

/// See [RaylibAudioFlatImpl.IsAudioStreamProcessed].
bool IsAudioStreamProcessed(
  AudioStream stream,
) => _module.IsAudioStreamProcessed(stream);

/// See [RaylibAudioFlatImpl.PlayAudioStream].
void PlayAudioStream(
  AudioStream stream,
) => _module.PlayAudioStream(stream);

/// See [RaylibAudioFlatImpl.PauseAudioStream].
void PauseAudioStream(
  AudioStream stream,
) => _module.PauseAudioStream(stream);

/// See [RaylibAudioFlatImpl.ResumeAudioStream].
void ResumeAudioStream(
  AudioStream stream,
) => _module.ResumeAudioStream(stream);

/// See [RaylibAudioFlatImpl.IsAudioStreamPlaying].
bool IsAudioStreamPlaying(
  AudioStream stream,
) => _module.IsAudioStreamPlaying(stream);

/// See [RaylibAudioFlatImpl.StopAudioStream].
void StopAudioStream(
  AudioStream stream,
) => _module.StopAudioStream(stream);

/// See [RaylibAudioFlatImpl.SetAudioStreamVolume].
void SetAudioStreamVolume(
  AudioStream stream,
  double volume,
) => _module.SetAudioStreamVolume(stream, volume);

/// See [RaylibAudioFlatImpl.SetAudioStreamPitch].
void SetAudioStreamPitch(
  AudioStream stream,
  double pitch,
) => _module.SetAudioStreamPitch(stream, pitch);

/// See [RaylibAudioFlatImpl.SetAudioStreamPan].
void SetAudioStreamPan(
  AudioStream stream,
  double pan,
) => _module.SetAudioStreamPan(stream, pan);

/// See [RaylibAudioFlatImpl.SetAudioStreamBufferSizeDefault].
void SetAudioStreamBufferSizeDefault(
  int size,
) => _module.SetAudioStreamBufferSizeDefault(size);

/// See [RaylibAudioFlatImpl.SetAudioStreamCallback].
void SetAudioStreamCallback(
  AudioStream stream,
  XPtr<XFunction<AudioCallbackBase>> callback,
) => _module.SetAudioStreamCallback(stream, callback);

/// See [RaylibAudioFlatImpl.AttachAudioStreamProcessor].
void AttachAudioStreamProcessor(
  AudioStream stream,
  XPtr<XFunction<AudioCallbackBase>> processor,
) => _module.AttachAudioStreamProcessor(stream, processor);

/// See [RaylibAudioFlatImpl.DetachAudioStreamProcessor].
void DetachAudioStreamProcessor(
  AudioStream stream,
  XPtr<XFunction<AudioCallbackBase>> processor,
) => _module.DetachAudioStreamProcessor(stream, processor);

/// See [RaylibAudioFlatImpl.AttachAudioMixedProcessor].
void AttachAudioMixedProcessor(
  XPtr<XFunction<AudioCallbackBase>> processor,
) => _module.AttachAudioMixedProcessor(processor);

/// See [RaylibAudioFlatImpl.DetachAudioMixedProcessor].
void DetachAudioMixedProcessor(
  XPtr<XFunction<AudioCallbackBase>> processor,
) => _module.DetachAudioMixedProcessor(processor);