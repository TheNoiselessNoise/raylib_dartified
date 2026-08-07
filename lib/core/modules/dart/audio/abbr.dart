import 'dart:typed_data';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibAudioD get _module => Raylib.instance.AudioD;

/// See [RaylibAudioD.InitAudioDevice].
void InitAudioDevice() => _module.InitAudioDevice();

/// See [RaylibAudioD.CloseAudioDevice].
void CloseAudioDevice() => _module.CloseAudioDevice();

/// See [RaylibAudioD.IsAudioDeviceReady].
bool IsAudioDeviceReady() => _module.IsAudioDeviceReady();

/// See [RaylibAudioD.SetMasterVolume].
void SetMasterVolume(
  num volume,
) => _module.SetMasterVolume(volume);

/// See [RaylibAudioD.GetMasterVolume].
double GetMasterVolume() => _module.GetMasterVolume();

/// See [RaylibAudioD.LoadWave].
WaveD LoadWave(
  String fileName,
) => _module.LoadWave(fileName);

/// See [RaylibAudioD.LoadWaveFromMemory].
WaveD LoadWaveFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadWaveFromMemory(fileType, fileData);

/// See [RaylibAudioD.IsWaveValid].
bool IsWaveValid(
  WaveD wave,
) => _module.IsWaveValid(wave);

/// See [RaylibAudioD.LoadSound].
SoundD LoadSound(
  String fileName,
) => _module.LoadSound(fileName);

/// See [RaylibAudioD.LoadSoundFromWave].
SoundD LoadSoundFromWave(
  WaveD wave,
) => _module.LoadSoundFromWave(wave);

/// See [RaylibAudioD.LoadSoundAlias].
SoundD LoadSoundAlias(
  SoundD source,
) => _module.LoadSoundAlias(source);

/// See [RaylibAudioD.IsSoundValid].
bool IsSoundValid(
  SoundD sound,
) => _module.IsSoundValid(sound);

/// See [RaylibAudioD.UpdateSound].
void UpdateSound(
  SoundD sound,
  TypedDataList data,
  num sampleCount,
) => _module.UpdateSound(sound, data, sampleCount);

/// See [RaylibAudioD.UnloadWave].
void UnloadWave(
  WaveD wave,
) => _module.UnloadWave(wave);

/// See [RaylibAudioD.UnloadSound].
void UnloadSound(
  SoundD sound,
) => _module.UnloadSound(sound);

/// See [RaylibAudioD.UnloadSoundAlias].
void UnloadSoundAlias(
  SoundD alias,
) => _module.UnloadSoundAlias(alias);

/// See [RaylibAudioD.ExportWave].
bool ExportWave(
  WaveD wave,
  String fileName,
) => _module.ExportWave(wave, fileName);

/// See [RaylibAudioD.ExportWaveAsCode].
bool ExportWaveAsCode(
  WaveD wave,
  String fileName,
) => _module.ExportWaveAsCode(wave, fileName);

/// See [RaylibAudioD.PlaySound].
void PlaySound(
  SoundD sound,
) => _module.PlaySound(sound);

/// See [RaylibAudioD.StopSound].
void StopSound(
  SoundD sound,
) => _module.StopSound(sound);

/// See [RaylibAudioD.PauseSound].
void PauseSound(
  SoundD sound,
) => _module.PauseSound(sound);

/// See [RaylibAudioD.ResumeSound].
void ResumeSound(
  SoundD sound,
) => _module.ResumeSound(sound);

/// See [RaylibAudioD.IsSoundPlaying].
bool IsSoundPlaying(
  SoundD sound,
) => _module.IsSoundPlaying(sound);

/// See [RaylibAudioD.SetSoundVolume].
void SetSoundVolume(
  SoundD sound,
  num volume,
) => _module.SetSoundVolume(sound, volume);

/// See [RaylibAudioD.SetSoundPitch].
void SetSoundPitch(
  SoundD sound,
  num pitch,
) => _module.SetSoundPitch(sound, pitch);

/// See [RaylibAudioD.SetSoundPan].
void SetSoundPan(
  SoundD sound,
  num pan,
) => _module.SetSoundPan(sound, pan);

/// See [RaylibAudioD.WaveCopy].
WaveD WaveCopy(
  WaveD wave,
) => _module.WaveCopy(wave);

/// See [RaylibAudioD.WaveCrop].
void WaveCrop(
  WaveD wave,
  num initFrame,
  num finalFrame,
) => _module.WaveCrop(wave, initFrame, finalFrame);

/// See [RaylibAudioD.WaveFormat].
void WaveFormat(
  WaveD wave,
  num sampleRate,
  num sampleSize,
  num channels,
) => _module.WaveFormat(wave, sampleRate, sampleSize, channels);

/// See [RaylibAudioD.LoadWaveSamples].
List<double> LoadWaveSamples(
  WaveD wave,
) => _module.LoadWaveSamples(wave);

/// See [RaylibAudioD.LoadMusicStream].
MusicD LoadMusicStream(
  String fileName,
) => _module.LoadMusicStream(fileName);

/// See [RaylibAudioD.LoadMusicStreamFromMemory].
MusicD LoadMusicStreamFromMemory(
  String fileType,
  Uint8List data,
) => _module.LoadMusicStreamFromMemory(fileType, data);

/// See [RaylibAudioD.IsMusicValid].
bool IsMusicValid(
  MusicD music,
) => _module.IsMusicValid(music);

/// See [RaylibAudioD.UnloadMusicStream].
void UnloadMusicStream(
  MusicD music,
) => _module.UnloadMusicStream(music);

/// See [RaylibAudioD.PlayMusicStream].
void PlayMusicStream(
  MusicD music,
) => _module.PlayMusicStream(music);

/// See [RaylibAudioD.IsMusicStreamPlaying].
bool IsMusicStreamPlaying(
  MusicD music,
) => _module.IsMusicStreamPlaying(music);

/// See [RaylibAudioD.UpdateMusicStream].
void UpdateMusicStream(
  MusicD music,
) => _module.UpdateMusicStream(music);

/// See [RaylibAudioD.StopMusicStream].
void StopMusicStream(
  MusicD music,
) => _module.StopMusicStream(music);

/// See [RaylibAudioD.PauseMusicStream].
void PauseMusicStream(
  MusicD music,
) => _module.PauseMusicStream(music);

/// See [RaylibAudioD.ResumeMusicStream].
void ResumeMusicStream(
  MusicD music,
) => _module.ResumeMusicStream(music);

/// See [RaylibAudioD.SeekMusicStream].
void SeekMusicStream(
  MusicD music,
  num position,
) => _module.SeekMusicStream(music, position);

/// See [RaylibAudioD.SetMusicVolume].
void SetMusicVolume(
  MusicD music,
  num volume,
) => _module.SetMusicVolume(music, volume);

/// See [RaylibAudioD.SetMusicPitch].
void SetMusicPitch(
  MusicD music,
  num pitch,
) => _module.SetMusicPitch(music, pitch);

/// See [RaylibAudioD.SetMusicPan].
void SetMusicPan(
  MusicD music,
  num pan,
) => _module.SetMusicPan(music, pan);

/// See [RaylibAudioD.GetMusicTimeLength].
double GetMusicTimeLength(
  MusicD music,
) => _module.GetMusicTimeLength(music);

/// See [RaylibAudioD.GetMusicTimePlayed].
double GetMusicTimePlayed(
  MusicD music,
) => _module.GetMusicTimePlayed(music);

/// See [RaylibAudioD.LoadAudioStream].
AudioStreamD LoadAudioStream(
  num sampleRate,
  num sampleSize,
  num channels,
) => _module.LoadAudioStream(sampleRate, sampleSize, channels);

/// See [RaylibAudioD.IsAudioStreamValid].
bool IsAudioStreamValid(
  AudioStreamD stream,
) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudioD.UnloadAudioStream].
void UnloadAudioStream(
  AudioStreamD stream,
) => _module.UnloadAudioStream(stream);

/// See [RaylibAudioD.UpdateAudioStream].
void UpdateAudioStream(
  AudioStreamD stream,
  TypedDataList data,
) => _module.UpdateAudioStream(stream, data);

/// See [RaylibAudioD.IsAudioStreamProcessed].
bool IsAudioStreamProcessed(
  AudioStreamD stream,
) => _module.IsAudioStreamProcessed(stream);

/// See [RaylibAudioD.PlayAudioStream].
void PlayAudioStream(
  AudioStreamD stream,
) => _module.PlayAudioStream(stream);

/// See [RaylibAudioD.PauseAudioStream].
void PauseAudioStream(
  AudioStreamD stream,
) => _module.PauseAudioStream(stream);

/// See [RaylibAudioD.ResumeAudioStream].
void ResumeAudioStream(
  AudioStreamD stream,
) => _module.ResumeAudioStream(stream);

/// See [RaylibAudioD.IsAudioStreamPlaying].
bool IsAudioStreamPlaying(
  AudioStreamD stream,
) => _module.IsAudioStreamPlaying(stream);

/// See [RaylibAudioD.StopAudioStream].
void StopAudioStream(
  AudioStreamD stream,
) => _module.StopAudioStream(stream);

/// See [RaylibAudioD.SetAudioStreamVolume].
void SetAudioStreamVolume(
  AudioStreamD stream,
  num volume,
) => _module.SetAudioStreamVolume(stream, volume);

/// See [RaylibAudioD.SetAudioStreamPitch].
void SetAudioStreamPitch(
  AudioStreamD stream,
  num pitch,
) => _module.SetAudioStreamPitch(stream, pitch);

/// See [RaylibAudioD.SetAudioStreamPan].
void SetAudioStreamPan(
  AudioStreamD stream,
  num pan,
) => _module.SetAudioStreamPan(stream, pan);

/// See [RaylibAudioD.SetAudioStreamBufferSizeDefault].
void SetAudioStreamBufferSizeDefault(
  num size,
) => _module.SetAudioStreamBufferSizeDefault(size);

/// See [RaylibAudioD.SetAudioStreamCallback].
void SetAudioStreamCallback(
  AudioStreamD stream,
  AudioCallbackD callback,
) => _module.SetAudioStreamCallback(stream, callback);

/// See [RaylibAudioD.AttachAudioStreamProcessor].
void AttachAudioStreamProcessor(
  AudioStreamD stream,
  AudioCallbackD callback,
) => _module.AttachAudioStreamProcessor(stream, callback);

/// See [RaylibAudioD.DetachAudioStreamProcessor].
void DetachAudioStreamProcessor(
  AudioStreamD stream,
  AudioCallbackD callback,
  {bool keepAlive = false}
) => _module.DetachAudioStreamProcessor(stream, callback, keepAlive: keepAlive);

/// See [RaylibAudioD.AttachAudioMixedProcessor].
void AttachAudioMixedProcessor(
  AudioCallbackD callback,
) => _module.AttachAudioMixedProcessor(callback);

/// See [RaylibAudioD.DetachAudioMixedProcessor].
void DetachAudioMixedProcessor(
  AudioCallbackD callback,
  {bool keepAlive = false}
) => _module.DetachAudioMixedProcessor(callback, keepAlive: keepAlive);

