import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibAudio get _module => Raylib.instance.Audio;

/// See [RaylibAudio.InitAudioDevice].
void InitAudioDevice() => _module.InitAudioDevice();

/// See [RaylibAudio.CloseAudioDevice].
void CloseAudioDevice() => _module.CloseAudioDevice();

/// See [RaylibAudio.IsAudioDeviceReady].
bool IsAudioDeviceReady() => _module.IsAudioDeviceReady();

/// See [RaylibAudio.SetMasterVolume].
void SetMasterVolume(double volume) => _module.SetMasterVolume(volume);

/// See [RaylibAudio.GetMasterVolume].
double GetMasterVolume() => _module.GetMasterVolume();

/// See [RaylibAudio.LoadWave].
WaveC LoadWave(Pointer<Char> fileName) => _module.LoadWave(fileName);

/// See [RaylibAudio.LoadWaveFromMemory].
WaveC LoadWaveFromMemory(
  Pointer<Char> fileType,
  Pointer<UnsignedChar> fileData,
  int dataSize,
) => _module.LoadWaveFromMemory(fileType, fileData, dataSize);

/// See [RaylibAudio.IsWaveValid].
bool IsWaveValid(WaveC wave) => _module.IsWaveValid(wave);

/// See [RaylibAudio.LoadSound].
SoundC LoadSound(Pointer<Char> fileName) => _module.LoadSound(fileName);

/// See [RaylibAudio.LoadSoundFromWave].
SoundC LoadSoundFromWave(WaveC wave) => _module.LoadSoundFromWave(wave);

/// See [RaylibAudio.LoadSoundAlias].
SoundC LoadSoundAlias(SoundC source) => _module.LoadSoundAlias(source);

/// See [RaylibAudio.IsSoundValid].
bool IsSoundValid(SoundC sound) => _module.IsSoundValid(sound);

/// See [RaylibAudio.UpdateSound].
void UpdateSound(SoundC sound, Pointer<Void> data, int sampleCount) => _module.UpdateSound(sound, data, sampleCount);

/// See [RaylibAudio.UnloadWave].
void UnloadWave(WaveC wave) => _module.UnloadWave(wave);

/// See [RaylibAudio.UnloadSound].
void UnloadSound(SoundC sound) => _module.UnloadSound(sound);

/// See [RaylibAudio.UnloadSoundAlias].
void UnloadSoundAlias(SoundC alias) => _module.UnloadSoundAlias(alias);

/// See [RaylibAudio.ExportWave].
bool ExportWave(WaveC wave, Pointer<Char> fileName) => _module.ExportWave(wave, fileName);

/// See [RaylibAudio.ExportWaveAsCode].
bool ExportWaveAsCode(WaveC wave, Pointer<Char> fileName) => _module.ExportWaveAsCode(wave, fileName);

/// See [RaylibAudio.PlaySound].
void PlaySound(SoundC sound) => _module.PlaySound(sound);

/// See [RaylibAudio.StopSound].
void StopSound(SoundC sound) => _module.StopSound(sound);

/// See [RaylibAudio.PauseSound].
void PauseSound(SoundC sound) => _module.PauseSound(sound);

/// See [RaylibAudio.ResumeSound].
void ResumeSound(SoundC sound) => _module.ResumeSound(sound);

/// See [RaylibAudio.IsSoundPlaying].
bool IsSoundPlaying(SoundC sound) => _module.IsSoundPlaying(sound);

/// See [RaylibAudio.SetSoundVolume].
void SetSoundVolume(SoundC sound, double volume) => _module.SetSoundVolume(sound, volume);

/// See [RaylibAudio.SetSoundPitch].
void SetSoundPitch(SoundC sound, double pitch) => _module.SetSoundPitch(sound, pitch);

/// See [RaylibAudio.SetSoundPan].
void SetSoundPan(SoundC sound, double pan) => _module.SetSoundPan(sound, pan);

/// See [RaylibAudio.WaveCopy].
WaveC WaveCopy(WaveC wave) => _module.WaveCopy(wave);

/// See [RaylibAudio.WaveCrop].
void WaveCrop(Pointer<WaveC> wave, int initFrame, int finalFrame) => _module.WaveCrop(wave, initFrame, finalFrame);

/// See [RaylibAudio.WaveFormat].
void WaveFormat(
  Pointer<WaveC> wave,
  int sampleRate,
  int sampleSize,
  int channels,
) => _module.WaveFormat(wave, sampleRate, sampleSize, channels);

/// See [RaylibAudio.LoadWaveSamples].
Pointer<Float> LoadWaveSamples(WaveC wave) => _module.LoadWaveSamples(wave);

/// See [RaylibAudio.UnloadWaveSamples].
void UnloadWaveSamples(Pointer<Float> samples) => _module.UnloadWaveSamples(samples);

/// See [RaylibAudio.LoadMusicStream].
MusicC LoadMusicStream(Pointer<Char> fileName) => _module.LoadMusicStream(fileName);

/// See [RaylibAudio.LoadMusicStreamFromMemory].
MusicC LoadMusicStreamFromMemory(
  Pointer<Char> fileType,
  Pointer<UnsignedChar> data,
  int dataSize,
) => _module.LoadMusicStreamFromMemory(fileType, data, dataSize);

/// See [RaylibAudio.IsMusicValid].
bool IsMusicValid(MusicC music) => _module.IsMusicValid(music);

/// See [RaylibAudio.UnloadMusicStream].
void UnloadMusicStream(MusicC music) => _module.UnloadMusicStream(music);

/// See [RaylibAudio.PlayMusicStream].
void PlayMusicStream(MusicC music) => _module.PlayMusicStream(music);

/// See [RaylibAudio.IsMusicStreamPlaying].
bool IsMusicStreamPlaying(MusicC music) => _module.IsMusicStreamPlaying(music);

/// See [RaylibAudio.UpdateMusicStream].
void UpdateMusicStream(MusicC music) => _module.UpdateMusicStream(music);

/// See [RaylibAudio.StopMusicStream].
void StopMusicStream(MusicC music) => _module.StopMusicStream(music);

/// See [RaylibAudio.PauseMusicStream].
void PauseMusicStream(MusicC music) => _module.PauseMusicStream(music);

/// See [RaylibAudio.ResumeMusicStream].
void ResumeMusicStream(MusicC music) => _module.ResumeMusicStream(music);

/// See [RaylibAudio.SeekMusicStream].
void SeekMusicStream(MusicC music, double position) => _module.SeekMusicStream(music, position);

/// See [RaylibAudio.SetMusicVolume].
void SetMusicVolume(MusicC music, double volume) => _module.SetMusicVolume(music, volume);

/// See [RaylibAudio.SetMusicPitch].
void SetMusicPitch(MusicC music, double pitch) => _module.SetMusicPitch(music, pitch);

/// See [RaylibAudio.SetMusicPan].
void SetMusicPan(MusicC music, double pan) => _module.SetMusicPan(music, pan);

/// See [RaylibAudio.GetMusicTimeLength].
double GetMusicTimeLength(MusicC music) => _module.GetMusicTimeLength(music);

/// See [RaylibAudio.GetMusicTimePlayed].
double GetMusicTimePlayed(MusicC music) => _module.GetMusicTimePlayed(music);

/// See [RaylibAudio.LoadAudioStream].
AudioStreamC LoadAudioStream(int sampleRate, int sampleSize, int channels) => _module.LoadAudioStream(sampleRate, sampleSize, channels);

/// See [RaylibAudio.IsAudioStreamValid].
bool IsAudioStreamValid(AudioStreamC stream) => _module.IsAudioStreamValid(stream);

/// See [RaylibAudio.UnloadAudioStream].
void UnloadAudioStream(AudioStreamC stream) => _module.UnloadAudioStream(stream);

/// See [RaylibAudio.UpdateAudioStream].
void UpdateAudioStream(
  AudioStreamC stream,
  Pointer<Void> data,
  int frameCount,
) => _module.UpdateAudioStream(stream, data, frameCount);

/// See [RaylibAudio.IsAudioStreamProcessed].
bool IsAudioStreamProcessed(AudioStreamC stream) => _module.IsAudioStreamProcessed(stream);

/// See [RaylibAudio.PlayAudioStream].
void PlayAudioStream(AudioStreamC stream) => _module.PlayAudioStream(stream);

/// See [RaylibAudio.PauseAudioStream].
void PauseAudioStream(AudioStreamC stream) => _module.PauseAudioStream(stream);

/// See [RaylibAudio.ResumeAudioStream].
void ResumeAudioStream(AudioStreamC stream) => _module.ResumeAudioStream(stream);

/// See [RaylibAudio.IsAudioStreamPlaying].
bool IsAudioStreamPlaying(AudioStreamC stream) => _module.IsAudioStreamPlaying(stream);

/// See [RaylibAudio.StopAudioStream].
void StopAudioStream(AudioStreamC stream) => _module.StopAudioStream(stream);

/// See [RaylibAudio.SetAudioStreamVolume].
void SetAudioStreamVolume(AudioStreamC stream, double volume) => _module.SetAudioStreamVolume(stream, volume);

/// See [RaylibAudio.SetAudioStreamPitch].
void SetAudioStreamPitch(AudioStreamC stream, double pitch) => _module.SetAudioStreamPitch(stream, pitch);

/// See [RaylibAudio.SetAudioStreamPan].
void SetAudioStreamPan(AudioStreamC stream, double pan) => _module.SetAudioStreamPan(stream, pan);

/// See [RaylibAudio.SetAudioStreamBufferSizeDefault].
void SetAudioStreamBufferSizeDefault(int size) => _module.SetAudioStreamBufferSizeDefault(size);

/// See [RaylibAudio.SetAudioStreamCallback].
void SetAudioStreamCallback(AudioStreamC stream, AudioCallbackC callback) => _module.SetAudioStreamCallback(stream, callback);

/// See [RaylibAudio.AttachAudioStreamProcessor].
void AttachAudioStreamProcessor(AudioStreamC stream, AudioCallbackC processor) => _module.AttachAudioStreamProcessor(stream, processor);

/// See [RaylibAudio.DetachAudioStreamProcessor].
void DetachAudioStreamProcessor(AudioStreamC stream, AudioCallbackC processor) => _module.DetachAudioStreamProcessor(stream, processor);

/// See [RaylibAudio.AttachAudioMixedProcessor].
void AttachAudioMixedProcessor(AudioCallbackC processor) => _module.AttachAudioMixedProcessor(processor);

/// See [RaylibAudio.DetachAudioMixedProcessor].
void DetachAudioMixedProcessor(AudioCallbackC processor) => _module.DetachAudioMixedProcessor(processor);

