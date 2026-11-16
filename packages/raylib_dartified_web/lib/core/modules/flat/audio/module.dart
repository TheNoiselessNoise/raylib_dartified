part of '../../../raylib_dartified_web.dart';

final class RaylibAudioFlatWeb extends RaylibAudioFlat<Raylib> {

  RaylibAudioFlatWeb(super.rl);

  RaylibAudio get _wasm => rl.module();

  @override
  void InitAudioDevice() => _wasm.InitAudioDevice();
  
  @override
  void CloseAudioDevice() => _wasm.CloseAudioDevice();
  
  @override
  bool IsAudioDeviceReady() => _wasm.IsAudioDeviceReady();
  
  @override
  void SetMasterVolume(
    double volume,
  ) => _wasm.SetMasterVolume(
    volume.toJS,
  );
  
  @override
  double GetMasterVolume() => _wasm.GetMasterVolume();
  
  @override
  Wave LoadWave(
    XPtr<XChar> fileName,
  ) => Wave$.RefCapture(
    RaylibCaptureIds.LoadWave,
    (p) => _wasm.LoadWave(
      p.toJS,
      fileName.toJS,
    ),
  );
  
  @override
  Wave LoadWaveFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
  ) => Wave$.RefCapture(
    RaylibCaptureIds.LoadWaveFromMemory,
    (p) => _wasm.LoadWaveFromMemory(
      p.toJS,
      fileType.toJS,
      fileData.toJS,
      dataSize.toJS,
    ),
  );
  
  @override
  bool IsWaveValid(
    Wave wave,
  ) => _wasm.IsWaveValid(
    Wave$.Ref1(wave).toJS,
  );
  
  @override
  Sound LoadSound(
    XPtr<XChar> fileName,
  ) => Sound$.RefCapture(
    RaylibCaptureIds.LoadSound,
    (p) => _wasm.LoadSound(
      p.toJS,
      fileName.toJS,
    ),
  );
  
  @override
  Sound LoadSoundFromWave(
    Wave wave,
  ) => Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundFromWave,
    (p) => _wasm.LoadSoundFromWave(
      p.toJS,
      Wave$.Ref1(wave).toJS,
    ),
  );
  
  @override
  Sound LoadSoundAlias(
    Sound source,
  ) => Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundAlias,
    (p) => _wasm.LoadSoundAlias(
      p.toJS,
      Sound$.Ref1(source).toJS,
    ),
  );
  
  @override
  bool IsSoundValid(
    Sound sound,
  ) => _wasm.IsSoundValid(
    Sound$.Ref1(sound).toJS,
  );
  
  @override
  void UpdateSound(
    Sound sound,
    XPtr<XVoid> data,
    int sampleCount,
  ) => _wasm.UpdateSound(
    Sound$.Ref1(sound).toJS,
    data.toJS,
    sampleCount.toJS,
  );
  
  @override
  void UnloadWave(
    Wave wave,
  ) => _wasm.UnloadWave(
    Wave$.Ref1(wave).toJS,
  );
  
  @override
  void UnloadSound(
    Sound sound,
  ) => _wasm.UnloadSound(
    Sound$.Ref1(sound).toJS,
  );
  
  @override
  void UnloadSoundAlias(
    Sound alias,
  ) => _wasm.UnloadSoundAlias(
    Sound$.Ref1(alias).toJS,
  );
  
  @override
  bool ExportWave(
    Wave wave,
    XPtr<XChar> fileName,
  ) => _wasm.ExportWave(
    Wave$.Ref1(wave).toJS,
    fileName.toJS,
  );
  
  @override
  bool ExportWaveAsCode(
    Wave wave,
    XPtr<XChar> fileName,
  ) => _wasm.ExportWaveAsCode(
    Wave$.Ref1(wave).toJS,
    fileName.toJS,
  );
  
  @override
  void PlaySound(
    Sound sound,
  ) => _wasm.PlaySound(
    Sound$.Ref1(sound).toJS,
  );
  
  @override
  void StopSound(
    Sound sound,
  ) => _wasm.StopSound(
    Sound$.Ref1(sound).toJS,
  );
  
  @override
  void PauseSound(
    Sound sound,
  ) => _wasm.PauseSound(
    Sound$.Ref1(sound).toJS,
  );
  
  @override
  void ResumeSound(
    Sound sound,
  ) => _wasm.ResumeSound(
    Sound$.Ref1(sound).toJS,
  );
  
  @override
  bool IsSoundPlaying(
    Sound sound,
  ) => _wasm.IsSoundPlaying(
    Sound$.Ref1(sound).toJS,
  );
  
  @override
  void SetSoundVolume(
    Sound sound,
    double volume,
  ) => _wasm.SetSoundVolume(
    Sound$.Ref1(sound).toJS,
    volume.toJS,
  );
  
  @override
  void SetSoundPitch(
    Sound sound,
    double pitch,
  ) => _wasm.SetSoundPitch(
    Sound$.Ref1(sound).toJS,
    pitch.toJS,
  );
  
  @override
  void SetSoundPan(
    Sound sound,
    double pan,
  ) => _wasm.SetSoundPan(
    Sound$.Ref1(sound).toJS,
    pan.toJS,
  );
  
  @override
  Wave WaveCopy(
    Wave wave,
  ) => Wave$.RefCapture(
    RaylibCaptureIds.WaveCopy,
    (p) => _wasm.WaveCopy(
      p.toJS,
      Wave$.Ref1(wave).toJS,
    ),
  );
  
  @override
  void WaveCrop(
    XStructPtr<Wave> wave,
    int initFrame,
    int finalFrame,
  ) => _wasm.WaveCrop(
    wave.toJS,
    initFrame.toJS,
    finalFrame.toJS,
  );
  
  @override
  void WaveFormat(
    XStructPtr<Wave> wave,
    int sampleRate,
    int sampleSize,
    int channels,
  ) => _wasm.WaveFormat(
    wave.toJS,
    sampleRate.toJS,
    sampleSize.toJS,
    channels.toJS,
  );
  
  @override
  XWasmPtr<XFloat32> LoadWaveSamples(
    Wave wave,
  ) => _wasm.LoadWaveSamples(
    Wave$.Ref1(wave).toJS,
  );
  
  @override
  void UnloadWaveSamples(
    XPtr<XFloat32> samples,
  ) => _wasm.UnloadWaveSamples(
    samples.toJS,
  );
  
  @override
  Music LoadMusicStream(
    XPtr<XChar> fileName,
  ) => Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStream,
    (p) => _wasm.LoadMusicStream(
      p.toJS,
      fileName.toJS,
    ),
  );
  
  @override
  Music LoadMusicStreamFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStreamFromMemory,
    (p) => _wasm.LoadMusicStreamFromMemory(
      p.toJS,
      fileType.toJS,
      data.toJS,
      dataSize.toJS,
    ),
  );
  
  @override
  bool IsMusicValid(
    Music music,
  ) => _wasm.IsMusicValid(
    Music$.Ref1(music).toJS,
  );
  
  @override
  void UnloadMusicStream(
    Music music,
  ) => _wasm.UnloadMusicStream(
    Music$.Ref1(music).toJS,
  );
  
  @override
  void PlayMusicStream(
    Music music,
  ) => _wasm.PlayMusicStream(
    Music$.Ref1(music).toJS,
  );
  
  @override
  bool IsMusicStreamPlaying(
    Music music,
  ) => _wasm.IsMusicStreamPlaying(
    Music$.Ref1(music).toJS,
  );
  
  @override
  void UpdateMusicStream(
    Music music,
  ) => _wasm.UpdateMusicStream(
    Music$.Ref1(music).toJS,
  );
  
  @override
  void StopMusicStream(
    Music music,
  ) => _wasm.StopMusicStream(
    Music$.Ref1(music).toJS,
  );
  
  @override
  void PauseMusicStream(
    Music music,
  ) => _wasm.PauseMusicStream(
    Music$.Ref1(music).toJS,
  );
  
  @override
  void ResumeMusicStream(
    Music music,
  ) => _wasm.ResumeMusicStream(
    Music$.Ref1(music).toJS,
  );
  
  @override
  void SeekMusicStream(
    Music music,
    double position,
  ) => _wasm.SeekMusicStream(
    Music$.Ref1(music).toJS,
    position.toJS,
  );
  
  @override
  void SetMusicVolume(
    Music music,
    double volume,
  ) => _wasm.SetMusicVolume(
    Music$.Ref1(music).toJS,
    volume.toJS,
  );
  
  @override
  void SetMusicPitch(
    Music music,
    double pitch,
  ) => _wasm.SetMusicPitch(
    Music$.Ref1(music).toJS,
    pitch.toJS,
  );
  
  @override
  void SetMusicPan(
    Music music,
    double pan,
  ) => _wasm.SetMusicPan(
    Music$.Ref1(music).toJS,
    pan.toJS,
  );
  
  @override
  double GetMusicTimeLength(
    Music music,
  ) => _wasm.GetMusicTimeLength(
    Music$.Ref1(music).toJS,
  );
  
  @override
  double GetMusicTimePlayed(
    Music music,
  ) => _wasm.GetMusicTimePlayed(
    Music$.Ref1(music).toJS,
  );
  
  @override
  AudioStream LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels
  ) => AudioStream$.RefCapture(
    RaylibCaptureIds.LoadAudioStream,
    (p) => _wasm.LoadAudioStream(
      p.toJS,
      sampleRate.toJS,
      sampleSize.toJS,
      channels.toJS,
    ),
  );
  
  @override
  bool IsAudioStreamValid(
    AudioStream stream,
  ) => _wasm.IsAudioStreamValid(
    AudioStream$.Ref1(stream).toJS,
  );
  
  @override
  void UnloadAudioStream(
    AudioStream stream,
  ) => _wasm.IsAudioStreamValid(
    AudioStream$.Ref1(stream).toJS,
  );
  
  @override
  void UpdateAudioStream(
    AudioStream stream,
    XPtr<XVoid> data,
    int frameCount,
  ) => _wasm.UpdateAudioStream(
    AudioStream$.Ref1(stream).toJS,
    data.toJS,
    frameCount.toJS,
  );
  
  @override
  bool IsAudioStreamProcessed(
    AudioStream stream,
  ) => _wasm.IsAudioStreamProcessed(
    AudioStream$.Ref1(stream).toJS,
  );
  
  @override
  void PlayAudioStream(
    AudioStream stream,
  ) => _wasm.PlayAudioStream(
    AudioStream$.Ref1(stream).toJS,
  );
  
  @override
  void PauseAudioStream(
    AudioStream stream,
  ) => _wasm.PauseAudioStream(
    AudioStream$.Ref1(stream).toJS,
  );
  
  @override
  void ResumeAudioStream(
    AudioStream stream,
  ) => _wasm.ResumeAudioStream(
    AudioStream$.Ref1(stream).toJS,
  );
  
  @override
  bool IsAudioStreamPlaying(
    AudioStream stream,
  ) => _wasm.IsAudioStreamPlaying(
    AudioStream$.Ref1(stream).toJS,
  );
  
  @override
  void StopAudioStream(
    AudioStream stream,
  ) => _wasm.StopAudioStream(
    AudioStream$.Ref1(stream).toJS,
  );
  
  @override
  void SetAudioStreamVolume(
    AudioStream stream,
    double volume,
  ) => _wasm.SetAudioStreamVolume(
    AudioStream$.Ref1(stream).toJS,
    volume.toJS,
  );
  
  @override
  void SetAudioStreamPitch(
    AudioStream stream,
    double pitch,
  ) => _wasm.SetAudioStreamPitch(
    AudioStream$.Ref1(stream).toJS,
    pitch.toJS,
  );
  
  @override
  void SetAudioStreamPan(
    AudioStream stream,
    double pan,
  ) => _wasm.SetAudioStreamPan(
    AudioStream$.Ref1(stream).toJS,
    pan.toJS,
  );
  
  @override
  void SetAudioStreamBufferSizeDefault(
    int size,
  ) => _wasm.SetAudioStreamBufferSizeDefault(
    size.toJS,
  );
  
  @override
  void SetAudioStreamCallback(
    AudioStream stream,
    XPtr<XFunction> callback, // AudioCallback
  ) => _wasm.SetAudioStreamCallback(
    AudioStream$.Ref1(stream).toJS,
    callback.toJS,
  );
  
  @override
  void AttachAudioStreamProcessor(
    AudioStream stream,
    XPtr<XFunction> processor, // AudioCallback
  ) => _wasm.AttachAudioStreamProcessor(
    AudioStream$.Ref1(stream).toJS,
    processor.toJS,
  );
  
  @override
  void DetachAudioStreamProcessor(
    AudioStream stream,
    XPtr<XFunction> processor, // AudioCallback
  ) => _wasm.DetachAudioStreamProcessor(
    AudioStream$.Ref1(stream).toJS,
    processor.toJS,
  );
  
  @override
  void AttachAudioMixedProcessor(
    XPtr<XFunction> processor, // AudioCallback
  ) => _wasm.AttachAudioMixedProcessor(
    processor.toJS,
  );
  
  @override
  void DetachAudioMixedProcessor(
    XPtr<XFunction> processor, // AudioCallback
  ) => _wasm.DetachAudioMixedProcessor(
    processor.toJS,
  );
}