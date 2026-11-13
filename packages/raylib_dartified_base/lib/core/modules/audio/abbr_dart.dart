import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibAudioDart get _module => RaylibBase.instance.module();

/// See [RaylibAudioDart.InitAudioDevice].
void InitAudioDevice() => _module.InitAudioDevice();

/// See [RaylibAudioDart.CloseAudioDevice].
void CloseAudioDevice() => _module.CloseAudioDevice();

/// See [RaylibAudioDart.IsAudioDeviceReady].
bool IsAudioDeviceReady() => _module.IsAudioDeviceReady();

/// See [RaylibAudioDart.SetMasterVolume].
void SetMasterVolume(
  double volume,
) => _module.SetMasterVolume(volume);

/// See [RaylibAudioDart.GetMasterVolume].
double GetMasterVolume() => _module.GetMasterVolume();

/// See [RaylibAudioDart.LoadWave].
Wave LoadWave(
  String fileName,
) => _module.LoadWave(fileName);

/// See [RaylibAudioDart.LoadWaveFromMemory].
Wave LoadWaveFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadWaveFromMemory(fileType, fileData);

/// See [RaylibAudioDart.IsWaveValid].
bool IsWaveValid(
  Wave wave,
) => _module.IsWaveValid(wave);

/// See [RaylibAudioDart.LoadSound].
Sound LoadSound(
  String fileName,
) => _module.LoadSound(fileName);

/// See [RaylibAudioDart.LoadSoundFromWave].
Sound LoadSoundFromWave(
  Wave wave,
) => _module.LoadSoundFromWave(wave);

/// See [RaylibAudioDart.LoadSoundAlias].
Sound LoadSoundAlias(
  Sound source,
) => _module.LoadSoundAlias(source);

/// See [RaylibAudioDart.IsSoundValid].
bool IsSoundValid(
  Sound sound,
) => _module.IsSoundValid(sound);

/// See [RaylibAudioDart.UpdateSound].
void UpdateSound(
  Sound sound,
  TypedDataList data,
  int sampleCount,
) => _module.UpdateSound(sound, data, sampleCount);

/// See [RaylibAudioDart.UnloadWave].
void UnloadWave(
  Wave wave,
) => _module.UnloadWave(wave);

/// See [RaylibAudioDart.UnloadSound].
void UnloadSound(
  Sound sound,
) => _module.UnloadSound(sound);

/// See [RaylibAudioDart.UnloadSoundAlias].
void UnloadSoundAlias(
  Sound alias,
) => _module.UnloadSoundAlias(alias);

/// See [RaylibAudioDart.ExportWave].
bool ExportWave(
  Wave wave,
  String fileName,
) => _module.ExportWave(wave, fileName);

/// See [RaylibAudioDart.ExportWaveAsCode].
bool ExportWaveAsCode(
  Wave wave,
  String fileName,
) => _module.ExportWaveAsCode(wave, fileName);

/// See [RaylibAudioDart.PlaySound].
void PlaySound(
  Sound sound,
) => _module.PlaySound(sound);

/// See [RaylibAudioDart.StopSound].
void StopSound(
  Sound sound,
) => _module.StopSound(sound);

/// See [RaylibAudioDart.PauseSound].
void PauseSound(
  Sound sound,
) => _module.PauseSound(sound);

/// See [RaylibAudioDart.ResumeSound].
void ResumeSound(
  Sound sound,
) => _module.ResumeSound(sound);

/// See [RaylibAudioDart.IsSoundPlaying].
bool IsSoundPlaying(
  Sound sound,
) => _module.IsSoundPlaying(sound);

/// See [RaylibAudioDart.SetSoundVolume].
void SetSoundVolume(
  Sound sound,
  double volume,
) => _module.SetSoundVolume(sound, volume);

/// See [RaylibAudioDart.SetSoundPitch].
void SetSoundPitch(
  Sound sound,
  double pitch,
) => _module.SetSoundPitch(sound, pitch);

/// See [RaylibAudioDart.SetSoundPan].
void SetSoundPan(
  Sound sound,
  double pan,
) => _module.SetSoundPan(sound, pan);

/// See [RaylibAudioDart.WaveCopy].
Wave WaveCopy(
  Wave wave,
) => _module.WaveCopy(wave);

/// See [RaylibAudioDart.WaveCrop].
void WaveCrop(
  Wave wave,
  int initFrame,
  int finalFrame,
) => _module.WaveCrop(wave, initFrame, finalFrame);

/// See [RaylibAudioDart.WaveFormat].
void WaveFormat(
  Wave wave,
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.WaveFormat(wave, sampleRate, sampleSize, channels);

/// See [RaylibAudioDart.LoadWaveSamples].
List<double> LoadWaveSamples(
  Wave wave,
) => _module.LoadWaveSamples(wave);

/// See [RaylibAudioDart.LoadMusicStream].
Music LoadMusicStream(
  String fileName,
) => _module.LoadMusicStream(fileName);

/// See [RaylibAudioDart.LoadMusicStreamFromMemory].
Music LoadMusicStreamFromMemory(
  String fileType,
  Uint8List data,
) => _module.LoadMusicStreamFromMemory(fileType, data);

/// See [RaylibAudioDart.IsMusicValid].
bool IsMusicValid(
  Music music,
) => _module.IsMusicValid(music);

/// See [RaylibAudioDart.UnloadMusicStream].
void UnloadMusicStream(
  Music music,
) => _module.UnloadMusicStream(music);

/// See [RaylibAudioDart.PlayMusicStream].
void PlayMusicStream(
  Music music,
) => _module.PlayMusicStream(music);

/// See [RaylibAudioDart.IsMusicStreamPlaying].
bool IsMusicStreamPlaying(
  Music music,
) => _module.IsMusicStreamPlaying(music);

/// See [RaylibAudioDart.UpdateMusicStream].
void UpdateMusicStream(
  Music music,
) => _module.UpdateMusicStream(music);

/// See [RaylibAudioDart.StopMusicStream].
void StopMusicStream(
  Music music,
) => _module.StopMusicStream(music);

/// See [RaylibAudioDart.PauseMusicStream].
void PauseMusicStream(
  Music music,
) => _module.PauseMusicStream(music);

/// See [RaylibAudioDart.ResumeMusicStream].
void ResumeMusicStream(
  Music music,
) => _module.ResumeMusicStream(music);

/// See [RaylibAudioDart.SeekMusicStream].
void SeekMusicStream(
  Music music,
  double position,
) => _module.SeekMusicStream(music, position);

/// See [RaylibAudioDart.SetMusicVolume].
void SetMusicVolume(
  Music music,
  double volume,
) => _module.SetMusicVolume(music, volume);

/// See [RaylibAudioDart.SetMusicPitch].
void SetMusicPitch(
  Music music,
  double pitch,
) => _module.SetMusicPitch(music, pitch);

/// See [RaylibAudioDart.SetMusicPan].
void SetMusicPan(
  Music music,
  double pan,
) => _module.SetMusicPan(music, pan);

/// See [RaylibAudioDart.GetMusicTimeLength].
double GetMusicTimeLength(
  Music music,
) => _module.GetMusicTimeLength(music);

/// See [RaylibAudioDart.GetMusicTimePlayed].
double GetMusicTimePlayed(
  Music music,
) => _module.GetMusicTimePlayed(music);

/// See [RaylibAudioDart.LoadAudioStream].
AudioStream LoadAudioStream(
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.LoadAudioStream(sampleRate, sampleSize, channels);

/// See [RaylibAudioDart.IsAudioStreamValid].
bool IsAudioStreamValid(
  AudioStream stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioDart.UnloadAudioStream].
void UnloadAudioStream(
  AudioStream stream,
) => _module.UnloadAudioStream(stream);

/// See [RaylibAudioDart.UpdateAudioStream].
void UpdateAudioStream(
  AudioStream stream,
  TypedDataList data,
) => _module.UpdateAudioStream(stream, data);

/// See [RaylibAudioDart.IsAudioStreamProcessed].
bool IsAudioStreamProcessed(
  AudioStream stream,
) => _module.IsAudioStreamProcessed(stream);

/// See [RaylibAudioDart.PlayAudioStream].
void PlayAudioStream(
  AudioStream stream,
) => _module.PlayAudioStream(stream);

/// See [RaylibAudioDart.PauseAudioStream].
void PauseAudioStream(
  AudioStream stream,
) => _module.PauseAudioStream(stream);

/// See [RaylibAudioDart.ResumeAudioStream].
void ResumeAudioStream(
  AudioStream stream,
) => _module.ResumeAudioStream(stream);

/// See [RaylibAudioDart.IsAudioStreamPlaying].
bool IsAudioStreamPlaying(
  AudioStream stream,
) => _module.IsAudioStreamPlaying(stream);

/// See [RaylibAudioDart.StopAudioStream].
void StopAudioStream(
  AudioStream stream,
) => _module.StopAudioStream(stream);

/// See [RaylibAudioDart.SetAudioStreamVolume].
void SetAudioStreamVolume(
  AudioStream stream,
  double volume,
) => _module.SetAudioStreamVolume(stream, volume);

/// See [RaylibAudioDart.SetAudioStreamPitch].
void SetAudioStreamPitch(
  AudioStream stream,
  double pitch,
) => _module.SetAudioStreamPitch(stream, pitch);

/// See [RaylibAudioDart.SetAudioStreamPan].
void SetAudioStreamPan(
  AudioStream stream,
  double pan,
) => _module.SetAudioStreamPan(stream, pan);

/// See [RaylibAudioDart.SetAudioStreamBufferSizeDefault].
void SetAudioStreamBufferSizeDefault(
  int size,
) => _module.SetAudioStreamBufferSizeDefault(size);

/// See [RaylibAudioDart.SetAudioStreamCallback].
void SetAudioStreamCallback(
  AudioStream stream,
  AudioCallbackBase callback,
) => _module.SetAudioStreamCallback(stream, callback);

/// See [RaylibAudioDart.AttachAudioStreamProcessor].
void AttachAudioStreamProcessor(
  AudioStream stream,
  AudioCallbackBase callback,
) => _module.AttachAudioStreamProcessor(stream, callback);

/// See [RaylibAudioDart.DetachAudioStreamProcessor].
void DetachAudioStreamProcessor(
  AudioStream stream,
  AudioCallbackBase callback,
  {bool keepAlive = false}
) => _module.DetachAudioStreamProcessor(stream, callback, keepAlive: keepAlive);

/// See [RaylibAudioDart.AttachAudioMixedProcessor].
void AttachAudioMixedProcessor(
  AudioCallbackBase callback,
) => _module.AttachAudioMixedProcessor(callback);

/// See [RaylibAudioDart.DetachAudioMixedProcessor].
void DetachAudioMixedProcessor(
  AudioCallbackBase callback,
  {bool keepAlive = false}
) => _module.DetachAudioMixedProcessor(callback, keepAlive: keepAlive);
