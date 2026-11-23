import 'package:raylib_dartified/backend/wasm/abbr/wasm.dart';

RaylibAudio get _module => Raylib.instance.module();

/// See [RaylibAudio.InitAudioDevice].
XF0<void> get InitAudioDevice => _module.InitAudioDevice;
/// See [RaylibAudio.CloseAudioDevice].
XF0<void> get CloseAudioDevice => _module.CloseAudioDevice;
/// See [RaylibAudio.IsAudioDeviceReady].
XF0<bool> get IsAudioDeviceReady => _module.IsAudioDeviceReady;
/// See [RaylibAudio.SetMasterVolume].
XF1<void> get SetMasterVolume => _module.SetMasterVolume;
/// See [RaylibAudio.GetMasterVolume].
XF0<double> get GetMasterVolume => _module.GetMasterVolume;
/// See [RaylibAudio.LoadWave].
XF2<void> get LoadWave => _module.LoadWave;
/// See [RaylibAudio.LoadWaveFromMemory].
XF4<void> get LoadWaveFromMemory => _module.LoadWaveFromMemory;
/// See [RaylibAudio.IsWaveValid].
XF1<bool> get IsWaveValid => _module.IsWaveValid;
/// See [RaylibAudio.LoadSound].
XF2<void> get LoadSound => _module.LoadSound;
/// See [RaylibAudio.LoadSoundFromWave].
XF2<void> get LoadSoundFromWave => _module.LoadSoundFromWave;
/// See [RaylibAudio.LoadSoundAlias].
XF2<void> get LoadSoundAlias => _module.LoadSoundAlias;
/// See [RaylibAudio.IsSoundValid].
XF1<bool> get IsSoundValid => _module.IsSoundValid;
/// See [RaylibAudio.UpdateSound].
XF3<void> get UpdateSound => _module.UpdateSound;
/// See [RaylibAudio.UnloadWave].
XF1<void> get UnloadWave => _module.UnloadWave;
/// See [RaylibAudio.UnloadSound].
XF1<void> get UnloadSound => _module.UnloadSound;
/// See [RaylibAudio.UnloadSoundAlias].
XF1<void> get UnloadSoundAlias => _module.UnloadSoundAlias;
/// See [RaylibAudio.ExportWave].
XF2<bool> get ExportWave => _module.ExportWave;
/// See [RaylibAudio.ExportWaveAsCode].
XF2<bool> get ExportWaveAsCode => _module.ExportWaveAsCode;
/// See [RaylibAudio.PlaySound].
XF1<void> get PlaySound => _module.PlaySound;
/// See [RaylibAudio.StopSound].
XF1<void> get StopSound => _module.StopSound;
/// See [RaylibAudio.PauseSound].
XF1<void> get PauseSound => _module.PauseSound;
/// See [RaylibAudio.ResumeSound].
XF1<void> get ResumeSound => _module.ResumeSound;
/// See [RaylibAudio.IsSoundPlaying].
XF1<bool> get IsSoundPlaying => _module.IsSoundPlaying;
/// See [RaylibAudio.SetSoundVolume].
XF2<void> get SetSoundVolume => _module.SetSoundVolume;
/// See [RaylibAudio.SetSoundPitch].
XF2<void> get SetSoundPitch => _module.SetSoundPitch;
/// See [RaylibAudio.SetSoundPan].
XF2<void> get SetSoundPan => _module.SetSoundPan;
/// See [RaylibAudio.WaveCopy].
XF2<void> get WaveCopy => _module.WaveCopy;
/// See [RaylibAudio.WaveCrop].
XF3<void> get WaveCrop => _module.WaveCrop;
/// See [RaylibAudio.WaveFormat].
XF4<void> get WaveFormat => _module.WaveFormat;
/// See [RaylibAudio.LoadWaveSamples].
XF1<XWasmPtr<XFloat>> get LoadWaveSamples => _module.LoadWaveSamples;
/// See [RaylibAudio.UnloadWaveSamples].
XF1<void> get UnloadWaveSamples => _module.UnloadWaveSamples;
/// See [RaylibAudio.LoadMusicStream].
XF2<void> get LoadMusicStream => _module.LoadMusicStream;
/// See [RaylibAudio.LoadMusicStreamFromMemory].
XF4<void> get LoadMusicStreamFromMemory => _module.LoadMusicStreamFromMemory;
/// See [RaylibAudio.IsMusicValid].
XF1<bool> get IsMusicValid => _module.IsMusicValid;
/// See [RaylibAudio.UnloadMusicStream].
XF1<void> get UnloadMusicStream => _module.UnloadMusicStream;
/// See [RaylibAudio.PlayMusicStream].
XF1<void> get PlayMusicStream => _module.PlayMusicStream;
/// See [RaylibAudio.IsMusicStreamPlaying].
XF1<bool> get IsMusicStreamPlaying => _module.IsMusicStreamPlaying;
/// See [RaylibAudio.UpdateMusicStream].
XF1<void> get UpdateMusicStream => _module.UpdateMusicStream;
/// See [RaylibAudio.StopMusicStream].
XF1<void> get StopMusicStream => _module.StopMusicStream;
/// See [RaylibAudio.PauseMusicStream].
XF1<void> get PauseMusicStream => _module.PauseMusicStream;
/// See [RaylibAudio.ResumeMusicStream].
XF1<void> get ResumeMusicStream => _module.ResumeMusicStream;
/// See [RaylibAudio.SeekMusicStream].
XF2<void> get SeekMusicStream => _module.SeekMusicStream;
/// See [RaylibAudio.SetMusicVolume].
XF2<void> get SetMusicVolume => _module.SetMusicVolume;
/// See [RaylibAudio.SetMusicPitch].
XF2<void> get SetMusicPitch => _module.SetMusicPitch;
/// See [RaylibAudio.SetMusicPan].
XF2<void> get SetMusicPan => _module.SetMusicPan;
/// See [RaylibAudio.GetMusicTimeLength].
XF1<double> get GetMusicTimeLength => _module.GetMusicTimeLength;
/// See [RaylibAudio.GetMusicTimePlayed].
XF1<double> get GetMusicTimePlayed => _module.GetMusicTimePlayed;
/// See [RaylibAudio.LoadAudioStream].
XF4<void> get LoadAudioStream => _module.LoadAudioStream;
/// See [RaylibAudio.IsAudioStreamValid].
XF1<bool> get IsAudioStreamValid => _module.IsAudioStreamValid;
/// See [RaylibAudio.UnloadAudioStream].
XF1<void> get UnloadAudioStream => _module.UnloadAudioStream;
/// See [RaylibAudio.UpdateAudioStream].
XF3<void> get UpdateAudioStream => _module.UpdateAudioStream;
/// See [RaylibAudio.IsAudioStreamProcessed].
XF1<bool> get IsAudioStreamProcessed => _module.IsAudioStreamProcessed;
/// See [RaylibAudio.PlayAudioStream].
XF1<void> get PlayAudioStream => _module.PlayAudioStream;
/// See [RaylibAudio.PauseAudioStream].
XF1<void> get PauseAudioStream => _module.PauseAudioStream;
/// See [RaylibAudio.ResumeAudioStream].
XF1<void> get ResumeAudioStream => _module.ResumeAudioStream;
/// See [RaylibAudio.IsAudioStreamPlaying].
XF1<bool> get IsAudioStreamPlaying => _module.IsAudioStreamPlaying;
/// See [RaylibAudio.StopAudioStream].
XF1<void> get StopAudioStream => _module.StopAudioStream;
/// See [RaylibAudio.SetAudioStreamVolume].
XF2<void> get SetAudioStreamVolume => _module.SetAudioStreamVolume;
/// See [RaylibAudio.SetAudioStreamPitch].
XF2<void> get SetAudioStreamPitch => _module.SetAudioStreamPitch;
/// See [RaylibAudio.SetAudioStreamPan].
XF2<void> get SetAudioStreamPan => _module.SetAudioStreamPan;
/// See [RaylibAudio.SetAudioStreamBufferSizeDefault].
XF1<void> get SetAudioStreamBufferSizeDefault => _module.SetAudioStreamBufferSizeDefault;
/// See [RaylibAudio.SetAudioStreamCallback].
XF2<void> get SetAudioStreamCallback => _module.SetAudioStreamCallback;
/// See [RaylibAudio.AttachAudioStreamProcessor].
XF2<void> get AttachAudioStreamProcessor => _module.AttachAudioStreamProcessor;
/// See [RaylibAudio.DetachAudioStreamProcessor].
XF2<void> get DetachAudioStreamProcessor => _module.DetachAudioStreamProcessor;
/// See [RaylibAudio.AttachAudioMixedProcessor].
XF1<void> get AttachAudioMixedProcessor => _module.AttachAudioMixedProcessor;
/// See [RaylibAudio.DetachAudioMixedProcessor].
XF1<void> get DetachAudioMixedProcessor => _module.DetachAudioMixedProcessor;
