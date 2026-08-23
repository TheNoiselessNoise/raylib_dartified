part of '../../../raylib_dartified.dart';

class RaylibAudioFlat extends RaylibAudioFlatModule<Raylib> {

  RaylibAudioFlat(super.rl);

  @override
  void InitAudioDevice() => rl.Audio.InitAudioDevice();
  
  @override
  void CloseAudioDevice() => rl.Audio.CloseAudioDevice();
  
  @override
  bool IsAudioDeviceReady() => rl.Audio.IsAudioDeviceReady();
  
  @override
  void SetMasterVolume(
    double volume,
  ) => rl.Audio.SetMasterVolume(
    volume,
  );
  
  @override
  double GetMasterVolume() => rl.Audio.GetMasterVolume();
  
  @override
  WaveD LoadWave(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Wave$.RefCapture(
    RaylibCaptureIds.LoadWave,
    (_) => rl.Audio.LoadWave(
      fileName.asNativePointer(),
    ).toD(),
  );
  
  @override
  WaveD LoadWaveFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
  ) => rl.Temp.Wave$.RefCapture(
    RaylibCaptureIds.LoadWaveFromMemory,
    (_) => rl.Audio.LoadWaveFromMemory(
      fileType.asNativePointer(),
      fileData.asNativePointer(),
      dataSize,
    ).toD(),
  );
  
  @override
  bool IsWaveValid(
    WaveD wave,
  ) => rl.Audio.IsWaveValid(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  );
  
  @override
  SoundD LoadSound(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Sound$.RefCapture(
    RaylibCaptureIds.LoadSound,
    (_) => rl.Audio.LoadSound(
      fileName.asNativePointer(),
    ).toD(),
  );
  
  @override
  SoundD LoadSoundFromWave(
    WaveD wave,
  ) => rl.Temp.Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundFromWave,
    (_) => rl.Audio.LoadSoundFromWave(
      rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    ).toD(),
  );
  
  @override
  SoundD LoadSoundAlias(
    SoundD source,
  ) => rl.Temp.Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundAlias,
    (_) => rl.Audio.LoadSoundAlias(
      rl.Temp.Sound$.Ref1(source).asNativePointer<SoundC>().ref,
    ).toD(),
  );
  
  @override
  bool IsSoundValid(
    SoundD sound,
  ) => rl.Audio.IsSoundValid(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void UpdateSound(
    SoundD sound,
    MemoryPointer<RVoid> data,
    int sampleCount,
  ) => rl.Temp.Sound$.RefUpdate1(sound,
    (p) => rl.Audio.UpdateSound(
      p.asNativePointer<SoundC>().ref,
      data.asNativePointer(),
      sampleCount,
    ),
  );
  
  @override
  void UnloadWave(
    WaveD wave,
  ) => rl.Audio.UnloadWave(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  );
  
  @override
  void UnloadSound(
    SoundD sound,
  ) => rl.Audio.UnloadSound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void UnloadSoundAlias(
    SoundD alias,
  ) => rl.Audio.UnloadSoundAlias(
    rl.Temp.Sound$.Ref1(alias).asNativePointer<SoundC>().ref,
  );
  
  @override
  bool ExportWave(
    WaveD wave,
    MemoryPointer<RChar> fileName,
  ) => rl.Audio.ExportWave(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    fileName.asNativePointer(),
  );
  
  @override
  bool ExportWaveAsCode(
    WaveD wave,
    MemoryPointer<RChar> fileName,
  ) => rl.Audio.ExportWaveAsCode(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    fileName.asNativePointer(),
  );
  
  @override
  void PlaySound(
    SoundD sound,
  ) => rl.Audio.PlaySound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void StopSound(
    SoundD sound,
  ) => rl.Audio.StopSound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void PauseSound(
    SoundD sound,
  ) => rl.Audio.PauseSound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void ResumeSound(
    SoundD sound,
  ) => rl.Audio.ResumeSound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  bool IsSoundPlaying(
    SoundD sound,
  ) => rl.Audio.IsSoundPlaying(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void SetSoundVolume(
    SoundD sound,
    double volume,
  ) => rl.Audio.SetSoundVolume(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    volume,
  );
  
  @override
  void SetSoundPitch(
    SoundD sound,
    double pitch,
  ) => rl.Audio.SetSoundPitch(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    pitch,
  );
  
  @override
  void SetSoundPan(
    SoundD sound,
    double pan,
  ) => rl.Audio.SetSoundPan(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    pan,
  );
  
  @override
  WaveD WaveCopy(
    WaveD wave,
  ) => rl.Temp.Wave$.RefCapture(
    RaylibCaptureIds.WaveCopy,
    (_) => rl.Audio.WaveCopy(
      rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    ).toD(),
  );
  
  @override
  void WaveCrop(
    StructPointer<WaveD> wave,
    int initFrame,
    int finalFrame,
  ) => rl.Audio.WaveCrop(
    wave.asNativePointer(),
    initFrame,
    finalFrame,
  );
  
  @override
  void WaveFormat(
    StructPointer<WaveD> wave,
    int sampleRate,
    int sampleSize,
    int channels,
  ) => rl.Audio.WaveFormat(
    wave.asNativePointer(),
    sampleRate,
    sampleSize,
    channels,
  );
  
  @override
  NativeMemoryPointer<RFloat32> LoadWaveSamples(
    WaveD wave,
  ) => rl.Audio.LoadWaveSamples(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  ).asMemoryPointer();
  
  @override
  void UnloadWaveSamples(
    MemoryPointer<RFloat32> samples,
  ) => rl.Audio.UnloadWaveSamples(
    samples.asNativePointer(),
  );
  
  @override
  MusicD LoadMusicStream(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStream,
    (_) => rl.Audio.LoadMusicStream(
      fileName.asNativePointer(),
    ).toD(),
  );
  
  @override
  MusicD LoadMusicStreamFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => rl.Temp.Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStreamFromMemory,
    (_) => rl.Audio.LoadMusicStreamFromMemory(
      fileType.asNativePointer(),
      data.asNativePointer(),
      dataSize,
    ).toD(),
  );
  
  @override
  bool IsMusicValid(
    MusicD music,
  ) => rl.Audio.IsMusicValid(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void UnloadMusicStream(
    MusicD music,
  ) => rl.Audio.UnloadMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void PlayMusicStream(
    MusicD music,
  ) => rl.Audio.PlayMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  bool IsMusicStreamPlaying(
    MusicD music,
  ) => rl.Audio.IsMusicStreamPlaying(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void UpdateMusicStream(
    MusicD music,
  ) => rl.Audio.UpdateMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void StopMusicStream(
    MusicD music,
  ) => rl.Audio.StopMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void PauseMusicStream(
    MusicD music,
  ) => rl.Audio.PauseMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void ResumeMusicStream(
    MusicD music,
  ) => rl.Audio.ResumeMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void SeekMusicStream(
    MusicD music,
    double position,
  ) => rl.Audio.SeekMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    position,
  );
  
  @override
  void SetMusicVolume(
    MusicD music,
    double volume,
  ) => rl.Audio.SetMusicVolume(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    volume,
  );
  
  @override
  void SetMusicPitch(
    MusicD music,
    double pitch,
  ) => rl.Audio.SetMusicPitch(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    pitch,
  );
  
  @override
  void SetMusicPan(
    MusicD music,
    double pan,
  ) => rl.Audio.SetMusicPan(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    pan,
  );
  
  @override
  double GetMusicTimeLength(
    MusicD music,
  ) => rl.Audio.GetMusicTimeLength(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  double GetMusicTimePlayed(
    MusicD music,
  ) => rl.Audio.GetMusicTimePlayed(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  AudioStreamD LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels
  ) => rl.Temp.AudioStream$.RefCapture(
    RaylibCaptureIds.LoadAudioStream,
    (_) => rl.Audio.LoadAudioStream(
      sampleRate,
      sampleSize,
      channels,
    ).toD(),
  );
  
  @override
  bool IsAudioStreamValid(
    AudioStreamD stream,
  ) => rl.Audio.IsAudioStreamValid(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void UnloadAudioStream(
    AudioStreamD stream,
  ) => rl.Audio.IsAudioStreamValid(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void UpdateAudioStream(
    AudioStreamD stream,
    MemoryPointer<RVoid> data,
    int frameCount,
  ) => rl.Audio.UpdateAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    data.asNativePointer(),
    frameCount,
  );
  
  @override
  bool IsAudioStreamProcessed(
    AudioStreamD stream,
  ) => rl.Audio.IsAudioStreamProcessed(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void PlayAudioStream(
    AudioStreamD stream,
  ) => rl.Audio.PlayAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void PauseAudioStream(
    AudioStreamD stream,
  ) => rl.Audio.PauseAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void ResumeAudioStream(
    AudioStreamD stream,
  ) => rl.Audio.ResumeAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  bool IsAudioStreamPlaying(
    AudioStreamD stream,
  ) => rl.Audio.IsAudioStreamPlaying(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void StopAudioStream(
    AudioStreamD stream,
  ) => rl.Audio.StopAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void SetAudioStreamVolume(
    AudioStreamD stream,
    double volume,
  ) => rl.Audio.SetAudioStreamVolume(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    volume,
  );
  
  @override
  void SetAudioStreamPitch(
    AudioStreamD stream,
    double pitch,
  ) => rl.Audio.SetAudioStreamPitch(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    pitch,
  );
  
  @override
  void SetAudioStreamPan(
    AudioStreamD stream,
    double pan,
  ) => rl.Audio.SetAudioStreamPan(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    pan,
  );
  
  @override
  void SetAudioStreamBufferSizeDefault(
    int size,
  ) => rl.Audio.SetAudioStreamBufferSizeDefault(
    size,
  );
  
  @override
  void SetAudioStreamCallback(
    AudioStreamD stream,
    MemoryPointer<RFunction> callback, // AudioCallback
  ) => rl.Audio.SetAudioStreamCallback(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    callback.asNativePointer(),
  );
  
  @override
  void AttachAudioStreamProcessor(
    AudioStreamD stream,
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => rl.Audio.AttachAudioStreamProcessor(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    processor.asNativePointer(),
  );
  
  @override
  void DetachAudioStreamProcessor(
    AudioStreamD stream,
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => rl.Audio.DetachAudioStreamProcessor(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    processor.asNativePointer(),
  );
  
  @override
  void AttachAudioMixedProcessor(
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => rl.Audio.AttachAudioMixedProcessor(
    processor.asNativePointer(),
  );
  
  @override
  void DetachAudioMixedProcessor(
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => rl.Audio.DetachAudioMixedProcessor(
    processor.asNativePointer(),
  );
}
