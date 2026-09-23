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
  WaveD LoadWave(
    MemoryPointer<RChar> fileName,
  ) => $.Wave$.RefCapture(
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
  ) => $.Wave$.RefCapture(
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
    $.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  );
  
  @override
  SoundD LoadSound(
    MemoryPointer<RChar> fileName,
  ) => $.Sound$.RefCapture(
    RaylibCaptureIds.LoadSound,
    (p) => _ffi.LoadSound(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );
  
  @override
  SoundD LoadSoundFromWave(
    WaveD wave,
  ) => $.Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundFromWave,
    (p) => _ffi.LoadSoundFromWave(
      $.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  SoundD LoadSoundAlias(
    SoundD source,
  ) => $.Sound$.RefCapture(
    RaylibCaptureIds.LoadSoundAlias,
    (p) => _ffi.LoadSoundAlias(
      $.Sound$.Ref1(source).asNativePointer<SoundC>().ref,
    ).toDart(p.asNativePointer()),
  );
  
  @override
  bool IsSoundValid(
    SoundD sound,
  ) => _ffi.IsSoundValid(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void UpdateSound(
    SoundD sound,
    MemoryPointer<RVoid> data,
    int sampleCount,
  ) => _ffi.UpdateSound(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    data.asNativePointer(),
    sampleCount,
  );
  
  @override
  void UnloadWave(
    WaveD wave,
  ) => _ffi.UnloadWave(
    $.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
  );
  
  @override
  void UnloadSound(
    SoundD sound,
  ) => _ffi.UnloadSound(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void UnloadSoundAlias(
    SoundD alias,
  ) => _ffi.UnloadSoundAlias(
    $.Sound$.Ref1(alias).asNativePointer<SoundC>().ref,
  );
  
  @override
  bool ExportWave(
    WaveD wave,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportWave(
    $.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    fileName.asNativePointer(),
  );
  
  @override
  bool ExportWaveAsCode(
    WaveD wave,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportWaveAsCode(
    $.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
    fileName.asNativePointer(),
  );
  
  @override
  void PlaySound(
    SoundD sound,
  ) => _ffi.PlaySound(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void StopSound(
    SoundD sound,
  ) => _ffi.StopSound(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void PauseSound(
    SoundD sound,
  ) => _ffi.PauseSound(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void ResumeSound(
    SoundD sound,
  ) => _ffi.ResumeSound(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  bool IsSoundPlaying(
    SoundD sound,
  ) => _ffi.IsSoundPlaying(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
  );
  
  @override
  void SetSoundVolume(
    SoundD sound,
    double volume,
  ) => _ffi.SetSoundVolume(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    volume,
  );
  
  @override
  void SetSoundPitch(
    SoundD sound,
    double pitch,
  ) => _ffi.SetSoundPitch(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    pitch,
  );
  
  @override
  void SetSoundPan(
    SoundD sound,
    double pan,
  ) => _ffi.SetSoundPan(
    $.Sound$.Ref1(sound).asNativePointer<SoundC>().ref,
    pan,
  );
  
  @override
  WaveD WaveCopy(
    WaveD wave,
  ) => $.Wave$.RefCapture(
    RaylibCaptureIds.WaveCopy,
    (p) => _ffi.WaveCopy(
      $.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
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
    $.Wave$.Ref1(wave).asNativePointer<WaveC>().ref,
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
  ) => $.Music$.RefCapture(
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
  ) => $.Music$.RefCapture(
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
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void UnloadMusicStream(
    MusicD music,
  ) => _ffi.UnloadMusicStream(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void PlayMusicStream(
    MusicD music,
  ) => _ffi.PlayMusicStream(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  bool IsMusicStreamPlaying(
    MusicD music,
  ) => _ffi.IsMusicStreamPlaying(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void UpdateMusicStream(
    MusicD music,
  ) => _ffi.UpdateMusicStream(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void StopMusicStream(
    MusicD music,
  ) => _ffi.StopMusicStream(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void PauseMusicStream(
    MusicD music,
  ) => _ffi.PauseMusicStream(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void ResumeMusicStream(
    MusicD music,
  ) => _ffi.ResumeMusicStream(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  void SeekMusicStream(
    MusicD music,
    double position,
  ) => _ffi.SeekMusicStream(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    position,
  );
  
  @override
  void SetMusicVolume(
    MusicD music,
    double volume,
  ) => _ffi.SetMusicVolume(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    volume,
  );
  
  @override
  void SetMusicPitch(
    MusicD music,
    double pitch,
  ) => _ffi.SetMusicPitch(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    pitch,
  );
  
  @override
  void SetMusicPan(
    MusicD music,
    double pan,
  ) => _ffi.SetMusicPan(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
    pan,
  );
  
  @override
  double GetMusicTimeLength(
    MusicD music,
  ) => _ffi.GetMusicTimeLength(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  double GetMusicTimePlayed(
    MusicD music,
  ) => _ffi.GetMusicTimePlayed(
    $.Music$.Ref1(music).asNativePointer<MusicC>().ref,
  );
  
  @override
  AudioStreamD LoadAudioStream(
    int sampleRate,
    int sampleSize,
    int channels
  ) => $.AudioStream$.RefCapture(
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
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void UnloadAudioStream(
    AudioStreamD stream,
  ) => _ffi.IsAudioStreamValid(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void UpdateAudioStream(
    AudioStreamD stream,
    MemoryPointer<RVoid> data,
    int frameCount,
  ) => _ffi.UpdateAudioStream(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    data.asNativePointer(),
    frameCount,
  );
  
  @override
  bool IsAudioStreamProcessed(
    AudioStreamD stream,
  ) => _ffi.IsAudioStreamProcessed(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void PlayAudioStream(
    AudioStreamD stream,
  ) => _ffi.PlayAudioStream(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void PauseAudioStream(
    AudioStreamD stream,
  ) => _ffi.PauseAudioStream(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void ResumeAudioStream(
    AudioStreamD stream,
  ) => _ffi.ResumeAudioStream(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  bool IsAudioStreamPlaying(
    AudioStreamD stream,
  ) => _ffi.IsAudioStreamPlaying(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void StopAudioStream(
    AudioStreamD stream,
  ) => _ffi.StopAudioStream(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
  );
  
  @override
  void SetAudioStreamVolume(
    AudioStreamD stream,
    double volume,
  ) => _ffi.SetAudioStreamVolume(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    volume,
  );
  
  @override
  void SetAudioStreamPitch(
    AudioStreamD stream,
    double pitch,
  ) => _ffi.SetAudioStreamPitch(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    pitch,
  );
  
  @override
  void SetAudioStreamPan(
    AudioStreamD stream,
    double pan,
  ) => _ffi.SetAudioStreamPan(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
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
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    callback.asNativePointer(),
  );
  
  @override
  void AttachAudioStreamProcessor(
    AudioStreamD stream,
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => _ffi.AttachAudioStreamProcessor(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
    processor.asNativePointer(),
  );
  
  @override
  void DetachAudioStreamProcessor(
    AudioStreamD stream,
    MemoryPointer<RFunction> processor, // AudioCallback
  ) => _ffi.DetachAudioStreamProcessor(
    $.AudioStream$.Ref1(stream).asNativePointer<AudioStreamC>().ref,
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
