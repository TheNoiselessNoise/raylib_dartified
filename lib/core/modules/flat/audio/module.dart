part of '../../../raylib_dartified.dart';

class RaylibAudioFlatNative extends RaylibAudioFlat<Raylib> {

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
    MemoryPointer<RChar> fileName,
  ) => Wave$.RefCapture(
    RaylibCaptureIds.LoadWave,
    (p) => _ffi.LoadWave(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );
  
  @override
  Wave LoadWaveFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
  ) => Wave$.RefCapture(
    RaylibCaptureIds.LoadWaveFromMemory,
    (p) => _ffi.LoadWaveFromMemory(
      fileType.asNativePointer(),
      fileData.asNativePointer(),
      dataSize,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  bool IsWaveValid(
    Wave wave,
  ) => _ffi.IsWaveValid(
    Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  );
  
  @override
  Sound LoadSound(
    MemoryPointer<RChar> fileName,
  ) => Sound$.RefCapture(
    RaylibCaptureIds.LoadSound,
    (p) => _ffi.LoadSound(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );
  
  @override
  Sound LoadSoundFromWave(
    Wave wave,
  ) => Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundFromWave,
    (p) => _ffi.LoadSoundFromWave(
      Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  Sound LoadSoundAlias(
    Sound source,
  ) => Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundAlias,
    (p) => _ffi.LoadSoundAlias(
      Sound$.Ref1(source).asNativePointer<SoundC>().ref,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  bool IsSoundValid(
    Sound sound,
  ) => _ffi.IsSoundValid(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void UpdateSound(
    Sound sound,
    MemoryPointer<RVoid> data,
    int sampleCount,
  ) => _ffi.UpdateSound(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    data.asNativePointer(),
    sampleCount,
  );
  
  @override
  void UnloadWave(
    Wave wave,
  ) => _ffi.UnloadWave(
    Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  );
  
  @override
  void UnloadSound(
    Sound sound,
  ) => _ffi.UnloadSound(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void UnloadSoundAlias(
    Sound alias,
  ) => _ffi.UnloadSoundAlias(
    Sound$.Ref1(alias).asNativePointer<SoundC>().ref,
  );
  
  @override
  bool ExportWave(
    Wave wave,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportWave(
    Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    fileName.asNativePointer(),
  );
  
  @override
  bool ExportWaveAsCode(
    Wave wave,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportWaveAsCode(
    Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    fileName.asNativePointer(),
  );
  
  @override
  void PlaySound(
    Sound sound,
  ) => _ffi.PlaySound(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void StopSound(
    Sound sound,
  ) => _ffi.StopSound(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void PauseSound(
    Sound sound,
  ) => _ffi.PauseSound(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void ResumeSound(
    Sound sound,
  ) => _ffi.ResumeSound(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  bool IsSoundPlaying(
    Sound sound,
  ) => _ffi.IsSoundPlaying(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void SetSoundVolume(
    Sound sound,
    double volume,
  ) => _ffi.SetSoundVolume(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    volume,
  );
  
  @override
  void SetSoundPitch(
    Sound sound,
    double pitch,
  ) => _ffi.SetSoundPitch(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    pitch,
  );
  
  @override
  void SetSoundPan(
    Sound sound,
    double pan,
  ) => _ffi.SetSoundPan(
    Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    pan,
  );
  
  @override
  Wave WaveCopy(
    Wave wave,
  ) => Wave$.RefCapture(
    RaylibCaptureIds.WaveCopy,
    (p) => _ffi.WaveCopy(
      Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  void WaveCrop(
    StructPointer<Wave> wave,
    int initFrame,
    int finalFrame,
  ) => _ffi.WaveCrop(
    wave.asNativePointer(),
    initFrame,
    finalFrame,
  );
  
  @override
  void WaveFormat(
    StructPointer<Wave> wave,
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
    Wave wave,
  ) => _ffi.LoadWaveSamples(
    Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  ).asMemoryPointer();
  
  @override
  void UnloadWaveSamples(
    MemoryPointer<RFloat32> samples,
  ) => _ffi.UnloadWaveSamples(
    samples.asNativePointer(),
  );
  
  @override
  Music LoadMusicStream(
    MemoryPointer<RChar> fileName,
  ) => Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStream,
    (p) => _ffi.LoadMusicStream(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );
  
  @override
  Music LoadMusicStreamFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => Music$.RefCapture(
    RaylibCaptureIds.LoadMusicStreamFromMemory,
    (p) => _ffi.LoadMusicStreamFromMemory(
      fileType.asNativePointer(),
      data.asNativePointer(),
      dataSize,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  bool IsMusicValid(
    Music music,
  ) => _ffi.IsMusicValid(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void UnloadMusicStream(
    Music music,
  ) => _ffi.UnloadMusicStream(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void PlayMusicStream(
    Music music,
  ) => _ffi.PlayMusicStream(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  bool IsMusicStreamPlaying(
    Music music,
  ) => _ffi.IsMusicStreamPlaying(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void UpdateMusicStream(
    Music music,
  ) => _ffi.UpdateMusicStream(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void StopMusicStream(
    Music music,
  ) => _ffi.StopMusicStream(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void PauseMusicStream(
    Music music,
  ) => _ffi.PauseMusicStream(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void ResumeMusicStream(
    Music music,
  ) => _ffi.ResumeMusicStream(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void SeekMusicStream(
    Music music,
    double position,
  ) => _ffi.SeekMusicStream(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
    position,
  );
  
  @override
  void SetMusicVolume(
    Music music,
    double volume,
  ) => _ffi.SetMusicVolume(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
    volume,
  );
  
  @override
  void SetMusicPitch(
    Music music,
    double pitch,
  ) => _ffi.SetMusicPitch(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
    pitch,
  );
  
  @override
  void SetMusicPan(
    Music music,
    double pan,
  ) => _ffi.SetMusicPan(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
    pan,
  );
  
  @override
  double GetMusicTimeLength(
    Music music,
  ) => _ffi.GetMusicTimeLength(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  double GetMusicTimePlayed(
    Music music,
  ) => _ffi.GetMusicTimePlayed(
    Music$.Ref1(music).asNativePointer<MusicC>().ref,
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
    ).toDart(p.asNativePointer()),
  );
  
  @override
  bool IsAudioStreamValid(
    AudioStream stream,
  ) => _ffi.IsAudioStreamValid(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void UnloadAudioStream(
    AudioStream stream,
  ) => _ffi.IsAudioStreamValid(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void UpdateAudioStream(
    AudioStream stream,
    MemoryPointer<RVoid> data,
    int frameCount,
  ) => _ffi.UpdateAudioStream(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    data.asNativePointer(),
    frameCount,
  );
  
  @override
  bool IsAudioStreamProcessed(
    AudioStream stream,
  ) => _ffi.IsAudioStreamProcessed(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void PlayAudioStream(
    AudioStream stream,
  ) => _ffi.PlayAudioStream(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void PauseAudioStream(
    AudioStream stream,
  ) => _ffi.PauseAudioStream(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void ResumeAudioStream(
    AudioStream stream,
  ) => _ffi.ResumeAudioStream(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  bool IsAudioStreamPlaying(
    AudioStream stream,
  ) => _ffi.IsAudioStreamPlaying(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void StopAudioStream(
    AudioStream stream,
  ) => _ffi.StopAudioStream(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void SetAudioStreamVolume(
    AudioStream stream,
    double volume,
  ) => _ffi.SetAudioStreamVolume(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    volume,
  );
  
  @override
  void SetAudioStreamPitch(
    AudioStream stream,
    double pitch,
  ) => _ffi.SetAudioStreamPitch(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    pitch,
  );
  
  @override
  void SetAudioStreamPan(
    AudioStream stream,
    double pan,
  ) => _ffi.SetAudioStreamPan(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
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
    MemoryPointer<RFunction> callback, // AudioCallback
  ) => _ffi.SetAudioStreamCallback(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    callback.asNativePointer(),
  );
  
  @override
  void AttachAudioStreamProcessor(
    AudioStream stream,
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => _ffi.AttachAudioStreamProcessor(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    processor.asNativePointer(),
  );
  
  @override
  void DetachAudioStreamProcessor(
    AudioStream stream,
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => _ffi.DetachAudioStreamProcessor(
    AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
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
