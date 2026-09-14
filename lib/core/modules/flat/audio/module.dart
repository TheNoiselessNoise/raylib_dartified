part of '../../../raylib_dartified.dart';

class RaylibAudioFlat extends RaylibAudioFlatModule<Raylib> {

  RaylibAudioFlat(super.rl);

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
  WaveD LoadWave(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Wave$.RefCapture(
    RaylibCaptureIds.LoadWave,
    (p) => _ffi.LoadWave(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );
  
  @override
  WaveD LoadWaveFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
  ) => rl.Temp.Wave$.RefCapture(
    RaylibCaptureIds.LoadWaveFromMemory,
    (p) => _ffi.LoadWaveFromMemory(
      fileType.asNativePointer(),
      fileData.asNativePointer(),
      dataSize,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  bool IsWaveValid(
    WaveD wave,
  ) => _ffi.IsWaveValid(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  );
  
  @override
  SoundD LoadSound(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Sound$.RefCapture(
    RaylibCaptureIds.LoadSound,
    (p) => _ffi.LoadSound(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );
  
  @override
  SoundD LoadSoundFromWave(
    WaveD wave,
  ) => rl.Temp.Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundFromWave,
    (p) => _ffi.LoadSoundFromWave(
      rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  SoundD LoadSoundAlias(
    SoundD source,
  ) => rl.Temp.Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundAlias,
    (p) => _ffi.LoadSoundAlias(
      rl.Temp.Sound$.Ref1(source).asNativePointer<SoundC>().ref,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  bool IsSoundValid(
    SoundD sound,
  ) => _ffi.IsSoundValid(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void UpdateSound(
    SoundD sound,
    MemoryPointer<RVoid> data,
    int sampleCount,
  ) => _ffi.UpdateSound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    data.asNativePointer(),
    sampleCount,
  );
  
  @override
  void UnloadWave(
    WaveD wave,
  ) => _ffi.UnloadWave(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  );
  
  @override
  void UnloadSound(
    SoundD sound,
  ) => _ffi.UnloadSound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void UnloadSoundAlias(
    SoundD alias,
  ) => _ffi.UnloadSoundAlias(
    rl.Temp.Sound$.Ref1(alias).asNativePointer<SoundC>().ref,
  );
  
  @override
  bool ExportWave(
    WaveD wave,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportWave(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    fileName.asNativePointer(),
  );
  
  @override
  bool ExportWaveAsCode(
    WaveD wave,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportWaveAsCode(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    fileName.asNativePointer(),
  );
  
  @override
  void PlaySound(
    SoundD sound,
  ) => _ffi.PlaySound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void StopSound(
    SoundD sound,
  ) => _ffi.StopSound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void PauseSound(
    SoundD sound,
  ) => _ffi.PauseSound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void ResumeSound(
    SoundD sound,
  ) => _ffi.ResumeSound(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  bool IsSoundPlaying(
    SoundD sound,
  ) => _ffi.IsSoundPlaying(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void SetSoundVolume(
    SoundD sound,
    double volume,
  ) => _ffi.SetSoundVolume(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    volume,
  );
  
  @override
  void SetSoundPitch(
    SoundD sound,
    double pitch,
  ) => _ffi.SetSoundPitch(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    pitch,
  );
  
  @override
  void SetSoundPan(
    SoundD sound,
    double pan,
  ) => _ffi.SetSoundPan(
    rl.Temp.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    pan,
  );
  
  @override
  WaveD WaveCopy(
    WaveD wave,
  ) => rl.Temp.Wave$.RefCapture(
    RaylibCaptureIds.WaveCopy,
    (p) => _ffi.WaveCopy(
      rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  void WaveCrop(
    StructPointer<WaveD> wave,
    int initFrame,
    int finalFrame,
  ) => _ffi.WaveCrop(
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
  ) => _ffi.WaveFormat(
    wave.asNativePointer(),
    sampleRate,
    sampleSize,
    channels,
  );
  
  @override
  NativeMemoryPointer<RFloat32> LoadWaveSamples(
    WaveD wave,
  ) => _ffi.LoadWaveSamples(
    rl.Temp.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  ).asMemoryPointer();
  
  @override
  void UnloadWaveSamples(
    MemoryPointer<RFloat32> samples,
  ) => _ffi.UnloadWaveSamples(
    samples.asNativePointer(),
  );
  
  @override
  MusicD LoadMusicStream(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStream,
    (p) => _ffi.LoadMusicStream(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );
  
  @override
  MusicD LoadMusicStreamFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => rl.Temp.Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStreamFromMemory,
    (p) => _ffi.LoadMusicStreamFromMemory(
      fileType.asNativePointer(),
      data.asNativePointer(),
      dataSize,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  bool IsMusicValid(
    MusicD music,
  ) => _ffi.IsMusicValid(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void UnloadMusicStream(
    MusicD music,
  ) => _ffi.UnloadMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void PlayMusicStream(
    MusicD music,
  ) => _ffi.PlayMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  bool IsMusicStreamPlaying(
    MusicD music,
  ) => _ffi.IsMusicStreamPlaying(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void UpdateMusicStream(
    MusicD music,
  ) => _ffi.UpdateMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void StopMusicStream(
    MusicD music,
  ) => _ffi.StopMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void PauseMusicStream(
    MusicD music,
  ) => _ffi.PauseMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void ResumeMusicStream(
    MusicD music,
  ) => _ffi.ResumeMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void SeekMusicStream(
    MusicD music,
    double position,
  ) => _ffi.SeekMusicStream(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    position,
  );
  
  @override
  void SetMusicVolume(
    MusicD music,
    double volume,
  ) => _ffi.SetMusicVolume(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    volume,
  );
  
  @override
  void SetMusicPitch(
    MusicD music,
    double pitch,
  ) => _ffi.SetMusicPitch(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    pitch,
  );
  
  @override
  void SetMusicPan(
    MusicD music,
    double pan,
  ) => _ffi.SetMusicPan(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    pan,
  );
  
  @override
  double GetMusicTimeLength(
    MusicD music,
  ) => _ffi.GetMusicTimeLength(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  double GetMusicTimePlayed(
    MusicD music,
  ) => _ffi.GetMusicTimePlayed(
    rl.Temp.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  AudioStreamD LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels
  ) => rl.Temp.AudioStream$.RefCapture(
    RaylibCaptureIds.LoadAudioStream,
    (p) => _ffi.LoadAudioStream(
      sampleRate,
      sampleSize,
      channels,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  bool IsAudioStreamValid(
    AudioStreamD stream,
  ) => _ffi.IsAudioStreamValid(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void UnloadAudioStream(
    AudioStreamD stream,
  ) => _ffi.IsAudioStreamValid(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void UpdateAudioStream(
    AudioStreamD stream,
    MemoryPointer<RVoid> data,
    int frameCount,
  ) => _ffi.UpdateAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    data.asNativePointer(),
    frameCount,
  );
  
  @override
  bool IsAudioStreamProcessed(
    AudioStreamD stream,
  ) => _ffi.IsAudioStreamProcessed(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void PlayAudioStream(
    AudioStreamD stream,
  ) => _ffi.PlayAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void PauseAudioStream(
    AudioStreamD stream,
  ) => _ffi.PauseAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void ResumeAudioStream(
    AudioStreamD stream,
  ) => _ffi.ResumeAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  bool IsAudioStreamPlaying(
    AudioStreamD stream,
  ) => _ffi.IsAudioStreamPlaying(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void StopAudioStream(
    AudioStreamD stream,
  ) => _ffi.StopAudioStream(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void SetAudioStreamVolume(
    AudioStreamD stream,
    double volume,
  ) => _ffi.SetAudioStreamVolume(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    volume,
  );
  
  @override
  void SetAudioStreamPitch(
    AudioStreamD stream,
    double pitch,
  ) => _ffi.SetAudioStreamPitch(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    pitch,
  );
  
  @override
  void SetAudioStreamPan(
    AudioStreamD stream,
    double pan,
  ) => _ffi.SetAudioStreamPan(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
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
    AudioStreamD stream,
    MemoryPointer<RFunction> callback, // AudioCallback
  ) => _ffi.SetAudioStreamCallback(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    callback.asNativePointer(),
  );
  
  @override
  void AttachAudioStreamProcessor(
    AudioStreamD stream,
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => _ffi.AttachAudioStreamProcessor(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    processor.asNativePointer(),
  );
  
  @override
  void DetachAudioStreamProcessor(
    AudioStreamD stream,
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => _ffi.DetachAudioStreamProcessor(
    rl.Temp.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    processor.asNativePointer(),
  );
  
  @override
  void AttachAudioMixedProcessor(
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => _ffi.AttachAudioMixedProcessor(
    processor.asNativePointer(),
  );
  
  @override
  void DetachAudioMixedProcessor(
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => _ffi.DetachAudioMixedProcessor(
    processor.asNativePointer(),
  );
}
