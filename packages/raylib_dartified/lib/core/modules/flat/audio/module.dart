part of '../../../raylib_dartified.dart';

final class RaylibAudioFlatNative extends RaylibAudioFlat<Raylib> {

  RaylibAudioFlatNative(super.rl);

  RaylibAudio get _ffi => rl.module();

  @override
  void InitAudioDevice() => _ffi.InitAudioDevice();
  
  @override
  void CloseAudioDevice() => _ffi.CloseAudioDevice();
  
  @override
  bool IsAudioDeviceReady() => _ffi.IsAudioDeviceReady();
  
  @override
  void SetMasterVolume(
    double volume,
  ) => _ffi.SetMasterVolume(
    volume,
  );
  
  @override
  double GetMasterVolume() => _ffi.GetMasterVolume();
  
  @override
  Wave LoadWave(
    XPtr<XChar> fileName,
  ) => Wave$.RefCapture(
    RaylibCaptureIds.LoadWave,
    (p) => _ffi.LoadWave(
      fileName.asNative(),
    ).toDart(p.asNative()),
  );
  
  @override
  Wave LoadWaveFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
  ) => Wave$.RefCapture(
    RaylibCaptureIds.LoadWaveFromMemory,
    (p) => _ffi.LoadWaveFromMemory(
      fileType.asNative(),
      fileData.asNative(),
      dataSize,
    ).toDart(p.asNative()),
  );
  
  @override
  bool IsWaveValid(
    Wave wave,
  ) => _ffi.IsWaveValid(
    Wave$.Ref1(wave).asNative<WaveC>().ref,
  );
  
  @override
  Sound LoadSound(
    XPtr<XChar> fileName,
  ) => Sound$.RefCapture(
    RaylibCaptureIds.LoadSound,
    (p) => _ffi.LoadSound(
      fileName.asNative(),
    ).toDart(p.asNative()),
  );
  
  @override
  Sound LoadSoundFromWave(
    Wave wave,
  ) => Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundFromWave,
    (p) => _ffi.LoadSoundFromWave(
      Wave$.Ref1(wave).asNative<WaveC>().ref,
    ).toDart(p.asNative()),
  );
  
  @override
  Sound LoadSoundAlias(
    Sound source,
  ) => Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundAlias,
    (p) => _ffi.LoadSoundAlias(
      Sound$.Ref1(source).asNative<SoundC>().ref,
    ).toDart(p.asNative()),
  );
  
  @override
  bool IsSoundValid(
    Sound sound,
  ) => _ffi.IsSoundValid(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
  );
  
  @override
  void UpdateSound(
    Sound sound,
    XPtr<XVoid> data,
    int sampleCount,
  ) => _ffi.UpdateSound(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
    data.asNative(),
    sampleCount,
  );
  
  @override
  void UnloadWave(
    Wave wave,
  ) => _ffi.UnloadWave(
    Wave$.Ref1(wave).asNative<WaveC>().ref,
  );
  
  @override
  void UnloadSound(
    Sound sound,
  ) => _ffi.UnloadSound(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
  );
  
  @override
  void UnloadSoundAlias(
    Sound alias,
  ) => _ffi.UnloadSoundAlias(
    Sound$.Ref1(alias).asNative<SoundC>().ref,
  );
  
  @override
  bool ExportWave(
    Wave wave,
    XPtr<XChar> fileName,
  ) => _ffi.ExportWave(
    Wave$.Ref1(wave).asNative<WaveC>().ref,
    fileName.asNative(),
  );
  
  @override
  bool ExportWaveAsCode(
    Wave wave,
    XPtr<XChar> fileName,
  ) => _ffi.ExportWaveAsCode(
    Wave$.Ref1(wave).asNative<WaveC>().ref,
    fileName.asNative(),
  );
  
  @override
  void PlaySound(
    Sound sound,
  ) => _ffi.PlaySound(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
  );
  
  @override
  void StopSound(
    Sound sound,
  ) => _ffi.StopSound(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
  );
  
  @override
  void PauseSound(
    Sound sound,
  ) => _ffi.PauseSound(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
  );
  
  @override
  void ResumeSound(
    Sound sound,
  ) => _ffi.ResumeSound(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
  );
  
  @override
  bool IsSoundPlaying(
    Sound sound,
  ) => _ffi.IsSoundPlaying(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
  );
  
  @override
  void SetSoundVolume(
    Sound sound,
    double volume,
  ) => _ffi.SetSoundVolume(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
    volume,
  );
  
  @override
  void SetSoundPitch(
    Sound sound,
    double pitch,
  ) => _ffi.SetSoundPitch(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
    pitch,
  );
  
  @override
  void SetSoundPan(
    Sound sound,
    double pan,
  ) => _ffi.SetSoundPan(
    Sound$.Ref1(sound).asNative<SoundC>().ref,
    pan,
  );
  
  @override
  Wave WaveCopy(
    Wave wave,
  ) => Wave$.RefCapture(
    RaylibCaptureIds.WaveCopy,
    (p) => _ffi.WaveCopy(
      Wave$.Ref1(wave).asNative<WaveC>().ref,
    ).toDart(p.asNative()),
  );
  
  @override
  void WaveCrop(
    XStructPtr<Wave> wave,
    int initFrame,
    int finalFrame,
  ) => _ffi.WaveCrop(
    wave.asNative(),
    initFrame,
    finalFrame,
  );
  
  @override
  void WaveFormat(
    XStructPtr<Wave> wave,
    int sampleRate,
    int sampleSize,
    int channels,
  ) => _ffi.WaveFormat(
    wave.asNative(),
    sampleRate,
    sampleSize,
    channels,
  );
  
  @override
  XNativePtr<XFloat32> LoadWaveSamples(
    Wave wave,
  ) => _ffi.LoadWaveSamples(
    Wave$.Ref1(wave).asNative<WaveC>().ref,
  ).asXPtr();
  
  @override
  void UnloadWaveSamples(
    XPtr<XFloat32> samples,
  ) => _ffi.UnloadWaveSamples(
    samples.asNative(),
  );
  
  @override
  Music LoadMusicStream(
    XPtr<XChar> fileName,
  ) => Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStream,
    (p) => _ffi.LoadMusicStream(
      fileName.asNative(),
    ).toDart(p.asNative()),
  );
  
  @override
  Music LoadMusicStreamFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStreamFromMemory,
    (p) => _ffi.LoadMusicStreamFromMemory(
      fileType.asNative(),
      data.asNative(),
      dataSize,
    ).toDart(p.asNative()),
  );
  
  @override
  bool IsMusicValid(
    Music music,
  ) => _ffi.IsMusicValid(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  void UnloadMusicStream(
    Music music,
  ) => _ffi.UnloadMusicStream(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  void PlayMusicStream(
    Music music,
  ) => _ffi.PlayMusicStream(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  bool IsMusicStreamPlaying(
    Music music,
  ) => _ffi.IsMusicStreamPlaying(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  void UpdateMusicStream(
    Music music,
  ) => _ffi.UpdateMusicStream(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  void StopMusicStream(
    Music music,
  ) => _ffi.StopMusicStream(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  void PauseMusicStream(
    Music music,
  ) => _ffi.PauseMusicStream(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  void ResumeMusicStream(
    Music music,
  ) => _ffi.ResumeMusicStream(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  void SeekMusicStream(
    Music music,
    double position,
  ) => _ffi.SeekMusicStream(
    Music$.Ref1(music).asNative<MusicC>().ref,
    position,
  );
  
  @override
  void SetMusicVolume(
    Music music,
    double volume,
  ) => _ffi.SetMusicVolume(
    Music$.Ref1(music).asNative<MusicC>().ref,
    volume,
  );
  
  @override
  void SetMusicPitch(
    Music music,
    double pitch,
  ) => _ffi.SetMusicPitch(
    Music$.Ref1(music).asNative<MusicC>().ref,
    pitch,
  );
  
  @override
  void SetMusicPan(
    Music music,
    double pan,
  ) => _ffi.SetMusicPan(
    Music$.Ref1(music).asNative<MusicC>().ref,
    pan,
  );
  
  @override
  double GetMusicTimeLength(
    Music music,
  ) => _ffi.GetMusicTimeLength(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  double GetMusicTimePlayed(
    Music music,
  ) => _ffi.GetMusicTimePlayed(
    Music$.Ref1(music).asNative<MusicC>().ref,
  );
  
  @override
  AudioStream LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels
  ) => AudioStream$.RefCapture(
    RaylibCaptureIds.LoadAudioStream,
    (p) => _ffi.LoadAudioStream(
      sampleRate,
      sampleSize,
      channels,
    ).toDart(p.asNative()),
  );
  
  @override
  bool IsAudioStreamValid(
    AudioStream stream,
  ) => _ffi.IsAudioStreamValid(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
  );
  
  @override
  void UnloadAudioStream(
    AudioStream stream,
  ) => _ffi.IsAudioStreamValid(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
  );
  
  @override
  void UpdateAudioStream(
    AudioStream stream,
    XPtr<XVoid> data,
    int frameCount,
  ) => _ffi.UpdateAudioStream(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
    data.asNative(),
    frameCount,
  );
  
  @override
  bool IsAudioStreamProcessed(
    AudioStream stream,
  ) => _ffi.IsAudioStreamProcessed(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
  );
  
  @override
  void PlayAudioStream(
    AudioStream stream,
  ) => _ffi.PlayAudioStream(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
  );
  
  @override
  void PauseAudioStream(
    AudioStream stream,
  ) => _ffi.PauseAudioStream(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
  );
  
  @override
  void ResumeAudioStream(
    AudioStream stream,
  ) => _ffi.ResumeAudioStream(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
  );
  
  @override
  bool IsAudioStreamPlaying(
    AudioStream stream,
  ) => _ffi.IsAudioStreamPlaying(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
  );
  
  @override
  void StopAudioStream(
    AudioStream stream,
  ) => _ffi.StopAudioStream(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
  );
  
  @override
  void SetAudioStreamVolume(
    AudioStream stream,
    double volume,
  ) => _ffi.SetAudioStreamVolume(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
    volume,
  );
  
  @override
  void SetAudioStreamPitch(
    AudioStream stream,
    double pitch,
  ) => _ffi.SetAudioStreamPitch(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
    pitch,
  );
  
  @override
  void SetAudioStreamPan(
    AudioStream stream,
    double pan,
  ) => _ffi.SetAudioStreamPan(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
    pan,
  );
  
  @override
  void SetAudioStreamBufferSizeDefault(
    int size,
  ) => _ffi.SetAudioStreamBufferSizeDefault(
    size,
  );
  
  @override
  void SetAudioStreamCallback(
    AudioStream stream,
    XPtr<XFunction> callback, // AudioCallback
  ) => _ffi.SetAudioStreamCallback(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
    callback.asNative(),
  );
  
  @override
  void AttachAudioStreamProcessor(
    AudioStream stream,
    XPtr<XFunction> processor, // AudioCallback
  ) => _ffi.AttachAudioStreamProcessor(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
    processor.asNative(),
  );
  
  @override
  void DetachAudioStreamProcessor(
    AudioStream stream,
    XPtr<XFunction> processor, // AudioCallback
  ) => _ffi.DetachAudioStreamProcessor(
    AudioStream$.Ref1(stream).asNative<AudioStreamC>().ref,
    processor.asNative(),
  );
  
  @override
  void AttachAudioMixedProcessor(
    XPtr<XFunction> processor, // AudioCallback
  ) => _ffi.AttachAudioMixedProcessor(
    processor.asNative(),
  );
  
  @override
  void DetachAudioMixedProcessor(
    XPtr<XFunction> processor, // AudioCallback
  ) => _ffi.DetachAudioMixedProcessor(
    processor.asNative(),
  );
}
