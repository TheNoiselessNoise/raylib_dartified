part of '../../../raylib_dartified.dart';

class RaylibAudioD extends RaylibAudioModuleBase<
  Raylib,
  
  // types
  AudioStreamD,
  MusicD,
  SoundD,
  WaveD,

  // callbacks
  AudioCallbackD
  
> {

  RaylibAudioD(super.rl);

  @override
  void dispose() {
    super.dispose();

    AudioCallbackD.disposeRegistry();
  }

  @override
  void InitAudioDevice() => run(
    () => RaylibDebugLabels.InitAudioDevice(),
    () => rl.Audio.InitAudioDevice(),
  );

  @override
  void CloseAudioDevice() => run(
    () => RaylibDebugLabels.CloseAudioDevice(),
    () => rl.Audio.CloseAudioDevice(),
  );
  
  @override
  bool IsAudioDeviceReady() => run(
    () => RaylibDebugLabels.IsAudioDeviceReady(),
    () => rl.Audio.IsAudioDeviceReady(),
  );

  @override
  void SetMasterVolume(
    num volume,
  ) => run(
    () => RaylibDebugLabels.SetMasterVolume(volume),
    () => rl.Audio.SetMasterVolume(
      volume.toDouble(),
    ),
  );

  @override
  double GetMasterVolume() => run(
    () => RaylibDebugLabels.GetMasterVolume(),
    () => rl.Audio.GetMasterVolume(),
  );

  @override
  WaveD LoadWave(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadWave(fileName),
    () => rl.Temp.Wave$.RefCapture(
      RaylibCaptureIds.LoadWave(fileName),
      (_) => rl.Audio.LoadWave(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );

  @override
  WaveD LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => RaylibDebugLabels.LoadWaveFromMemory(fileType, fileData),
    () => rl.Temp.Wave$.RefCapture(
      RaylibCaptureIds.LoadWaveFromMemory(fileType, fileData),
      (_) => rl.Audio.LoadWaveFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
      ),
    ),
  );

  @override
  bool IsWaveValid(
    WaveD wave,
  ) => run(
    () => RaylibDebugLabels.IsWaveValid(wave),
    () => rl.Audio.IsWaveValid(
      rl.Temp.Wave$.Ref1(wave).ref,
    ),
  );

  @override
  SoundD LoadSound(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadSound(fileName),
    () => rl.Temp.Sound$.RefCapture(
      RaylibCaptureIds.LoadSound(fileName),
      (_) => rl.Audio.LoadSound(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );

  @override
  SoundD LoadSoundFromWave(
    WaveD wave,
  ) => run(
    () => RaylibDebugLabels.LoadSoundFromWave(wave),
    () => rl.Temp.Sound$.RefCapture(
      RaylibCaptureIds.LoadSoundFromWave(wave),
      (_) => rl.Audio.LoadSoundFromWave(
        rl.Temp.Wave$.Ref1(wave).ref,
      ),
    ),
  );

  @override
  SoundD LoadSoundAlias(
    SoundD source,
  ) => run(
    () => RaylibDebugLabels.LoadSoundAlias(source),
    () => rl.Temp.Sound$.RefCapture(
      RaylibCaptureIds.LoadSoundAlias(source),
      (_) => rl.Audio.LoadSoundAlias(
        rl.Temp.Sound$.Ref1(source).ref,
      ),
    ),
  );

  @override
  bool IsSoundValid(
    SoundD sound,
  ) => run(
    () => RaylibDebugLabels.IsSoundValid(sound),
    () => rl.Audio.IsSoundValid(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  @override
  void UpdateSound(
    SoundD sound,
    TypedDataList data,
    num sampleCount,
  ) => run(
    () => RaylibDebugLabels.UpdateSound(sound, data, sampleCount),
    () => rl.Temp.Sound$.RefUpdate1(sound,
      (p) => rl.Audio.UpdateSound(
        p.ref,
        rl.Temp.TypedDataList$.Array(data).cast(),
        sampleCount.toInt(),
      ),
    ),
  );

  @override
  void UnloadWave(
    WaveD wave,
  ) => run(
    () => RaylibDebugLabels.UnloadWave(wave),
    () => rl.Audio.UnloadWave(
      rl.Temp.Wave$.Ref1(wave).ref,
    ),
  );

  @override
  void UnloadSound(
    SoundD sound,
  ) => run(
    () => RaylibDebugLabels.UnloadSound(sound),
    () => rl.Audio.UnloadSound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  @override
  void UnloadSoundAlias(
    SoundD alias,
  ) => run(
    () => RaylibDebugLabels.UnloadSoundAlias(alias),
    () => rl.Audio.UnloadSoundAlias(
      rl.Temp.Sound$.Ref1(alias).ref,
    ),
  );

  @override
  bool ExportWave(
    WaveD wave,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportWave(wave, fileName),
    () => rl.Audio.ExportWave(
      rl.Temp.Wave$.Ref1(wave).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  bool ExportWaveAsCode(
    WaveD wave,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportWaveAsCode(wave, fileName),
    () => rl.Audio.ExportWaveAsCode(
      rl.Temp.Wave$.Ref1(wave).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  void PlaySound(
    SoundD sound,
  ) => run(
    () => RaylibDebugLabels.PlaySound(sound),
    () => rl.Audio.PlaySound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  @override
  void StopSound(
    SoundD sound,
  ) => run(
    () => RaylibDebugLabels.StopSound(sound),
    () => rl.Audio.StopSound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  @override
  void PauseSound(
    SoundD sound,
  ) => run(
    () => RaylibDebugLabels.PauseSound(sound),
    () => rl.Audio.PauseSound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  @override
  void ResumeSound(
    SoundD sound,
  ) => run(
    () => RaylibDebugLabels.ResumeSound(sound),
    () => rl.Audio.ResumeSound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  @override
  bool IsSoundPlaying(
    SoundD sound,
  ) => run(
    () => RaylibDebugLabels.IsSoundPlaying(sound),
    () => rl.Audio.IsSoundPlaying(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  @override
  void SetSoundVolume(
    SoundD sound,
    num volume,
  ) => run(
    () => RaylibDebugLabels.SetSoundVolume(sound, volume),
    () => rl.Audio.SetSoundVolume(
      rl.Temp.Sound$.Ref1(sound).ref,
      volume.toDouble(),
    ),
  );

  @override
  void SetSoundPitch(
    SoundD sound,
    num pitch,
  ) => run(
    () => RaylibDebugLabels.SetSoundPitch(sound, pitch),
    () => rl.Audio.SetSoundPitch(
      rl.Temp.Sound$.Ref1(sound).ref,
      pitch.toDouble(),
    ),
  );

  @override
  void SetSoundPan(
    SoundD sound,
    num pan,
  ) => run(
    () => RaylibDebugLabels.SetSoundPan(sound, pan),
    () => rl.Audio.SetSoundPan(
      rl.Temp.Sound$.Ref1(sound).ref,
      pan.toDouble(),
    ),
  );

  @override
  WaveD WaveCopy(
    WaveD wave,
  ) => run(
    () => RaylibDebugLabels.WaveCopy(wave),
    () => rl.Temp.Wave$.RefCapture(
      RaylibCaptureIds.WaveCopy(wave),
      (_) => rl.Audio.WaveCopy(
        rl.Temp.Wave$.Ref1(wave).ref,
      ),
    ),
  );

  @override
  void WaveCrop(
    WaveD wave,
    num initFrame,
    num finalFrame,
  ) => run(
    () => RaylibDebugLabels.WaveCrop(wave, initFrame, finalFrame),
    () => rl.Temp.Wave$.RefUpdate1(wave,
      (p) => rl.Audio.WaveCrop(
        p,
        initFrame.toInt(),
        finalFrame.toInt(),
      ),
    ),
  );

  @override
  void WaveFormat(
    WaveD wave,
    num sampleRate,
    num sampleSize,
    num channels,
  ) => run(
    () => RaylibDebugLabels.WaveFormat(wave, sampleRate, sampleSize, channels),
    () => rl.Temp.Wave$.RefUpdate1(wave,
      (p) => rl.Audio.WaveFormat(
        p,
        sampleRate.toInt(),
        sampleSize.toInt(),
        channels.toInt(),
      ),
    ),
  );

  @override
  List<double> LoadWaveSamples(
    WaveD wave,
  ) => run(
    () => RaylibDebugLabels.LoadWaveSamples(wave),
    () {
      final samples = rl.Audio.LoadWaveSamples(
        rl.Temp.Wave$.Ref1(wave).ref,
      );
      try {
        return .generate(wave.waveLength, (i) => samples[i]);
      } finally {
        rl.Audio.UnloadWaveSamples(samples);
      }
    },
  );

  @override
  MusicD LoadMusicStream(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadMusicStream(fileName),
    () => rl.Temp.Music$.RefCapture(
      RaylibCaptureIds.LoadMusicStream(fileName),
      (_) => rl.Audio.LoadMusicStream(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );

  @override
  MusicD LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.LoadMusicStreamFromMemory(fileType, data),
    () => rl.Temp.Music$.RefCapture(
      RaylibCaptureIds.LoadMusicStreamFromMemory(fileType, data),
      (_) => rl.Audio.LoadMusicStreamFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.UnsignedChar$.Array(data),
        data.length,
      ),
    ),
  );

  @override
  bool IsMusicValid(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.IsMusicValid(music),
    () => rl.Audio.IsMusicValid(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  void UnloadMusicStream(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.UnloadMusicStream(music),
    () => rl.Audio.UnloadMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  void PlayMusicStream(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.PlayMusicStream(music),
    () => rl.Audio.PlayMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  bool IsMusicStreamPlaying(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.IsMusicStreamPlaying(music),
    () => rl.Audio.IsMusicStreamPlaying(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  void UpdateMusicStream(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.UpdateMusicStream(music),
    () => rl.Audio.UpdateMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  void StopMusicStream(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.StopMusicStream(music),
    () => rl.Audio.StopMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  void PauseMusicStream(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.PauseMusicStream(music),
    () => rl.Audio.PauseMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  void ResumeMusicStream(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.ResumeMusicStream(music),
    () => rl.Audio.ResumeMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  void SeekMusicStream(
    MusicD music,
    num position,
  ) => run(
    () => RaylibDebugLabels.SeekMusicStream(music, position),
    () => rl.Audio.SeekMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
      position.toDouble(),
    ),
  );

  @override
  void SetMusicVolume(
    MusicD music,
    num volume,
  ) => run(
    () => RaylibDebugLabels.SetMusicVolume(music, volume),
    () => rl.Audio.SetMusicVolume(
      rl.Temp.Music$.Ref1(music).ref,
      volume.toDouble(),
    ),
  );

  @override
  void SetMusicPitch(
    MusicD music,
    num pitch,
  ) => run(
    () => RaylibDebugLabels.SetMusicPitch(music, pitch),
    () => rl.Audio.SetMusicPitch(
      rl.Temp.Music$.Ref1(music).ref,
      pitch.toDouble(),
    ),
  );

  @override
  void SetMusicPan(
    MusicD music,
    num pan,
  ) => run(
    () => RaylibDebugLabels.SetMusicPan(music, pan),
    () => rl.Audio.SetMusicPan(
      rl.Temp.Music$.Ref1(music).ref,
      pan.toDouble(),
    ),
  );

  @override
  double GetMusicTimeLength(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.GetMusicTimeLength(music),
    () => rl.Audio.GetMusicTimeLength(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  double GetMusicTimePlayed(
    MusicD music,
  ) => run(
    () => RaylibDebugLabels.GetMusicTimePlayed(music),
    () => rl.Audio.GetMusicTimePlayed(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  @override
  AudioStreamD LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  ) => run(
    () => RaylibDebugLabels.LoadAudioStream(sampleRate, sampleSize, channels),
    () => rl.Temp.AudioStream$.RefCapture(
      RaylibCaptureIds.LoadAudioStream(sampleRate, sampleSize, channels),
      (_) => rl.Audio.LoadAudioStream(
        sampleRate.toInt(),
        sampleSize.toInt(),
        channels.toInt(),
      ),
    ),
  );

  @override
  bool IsAudioStreamValid(
    AudioStreamD stream,
  ) => run(
    () => RaylibDebugLabels.IsAudioStreamValid(stream),
    () => rl.Audio.IsAudioStreamValid(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  @override
  void UnloadAudioStream(
    AudioStreamD stream,
  ) => run(
    () => RaylibDebugLabels.UnloadAudioStream(stream),
    () => rl.Audio.UnloadAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  @override
  void UpdateAudioStream(
    AudioStreamD stream,
    TypedDataList data,
  ) => run(
    () => RaylibDebugLabels.UpdateAudioStream(stream, data),
    () => rl.Temp.AudioStream$.RefUpdate1(stream,
      (p) => rl.Audio.UpdateAudioStream(
        p.ref,
        rl.Temp.TypedDataList$.Array(data).cast(),
        data.length,
      ),
    ),
  );

  @override
  bool IsAudioStreamProcessed(
    AudioStreamD stream,
  ) => run(
    () => RaylibDebugLabels.IsAudioStreamProcessed(stream),
    () => rl.Audio.IsAudioStreamProcessed(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  @override
  void PlayAudioStream(
    AudioStreamD stream,
  ) => run(
    () => RaylibDebugLabels.PlayAudioStream(stream),
    () => rl.Audio.PlayAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  @override
  void PauseAudioStream(
    AudioStreamD stream,
  ) => run(
    () => RaylibDebugLabels.PauseAudioStream(stream),
    () => rl.Audio.PauseAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  @override
  void ResumeAudioStream(
    AudioStreamD stream,
  ) => run(
    () => RaylibDebugLabels.ResumeAudioStream(stream),
    () => rl.Audio.ResumeAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  @override
  bool IsAudioStreamPlaying(
    AudioStreamD stream,
  ) => run(
    () => RaylibDebugLabels.IsAudioStreamPlaying(stream),
    () => rl.Audio.IsAudioStreamPlaying(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  @override
  void StopAudioStream(
    AudioStreamD stream,
  ) => run(
    () => RaylibDebugLabels.StopAudioStream(stream),
    () => rl.Audio.StopAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  @override
  void SetAudioStreamVolume(
    AudioStreamD stream,
    num volume,
  ) => run(
    () => RaylibDebugLabels.SetAudioStreamVolume(stream, volume),
    () => rl.Audio.SetAudioStreamVolume(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      volume.toDouble(),
    ),
  );

  @override
  void SetAudioStreamPitch(
    AudioStreamD stream,
    num pitch,
  ) => run(
    () => RaylibDebugLabels.SetAudioStreamPitch(stream, pitch),
    () => rl.Audio.SetAudioStreamPitch(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      pitch.toDouble(),
    ),
  );

  @override
  void SetAudioStreamPan(
    AudioStreamD stream,
    num pan,
  ) => run(
    () => RaylibDebugLabels.SetAudioStreamPan(stream, pan),
    () => rl.Audio.SetAudioStreamPan(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      pan.toDouble(),
    ),
  );

  @override
  void SetAudioStreamBufferSizeDefault(
    num size,
  ) => run(
    () => RaylibDebugLabels.SetAudioStreamBufferSizeDefault(size),
    () => rl.Audio.SetAudioStreamBufferSizeDefault(
      size.toInt(),
    ),
  );

  @override
  void SetAudioStreamCallback(
    AudioStreamD stream,
    AudioCallbackD callback,
  ) => run(
    () => RaylibDebugLabels.SetAudioStreamCallback(stream, callback),
    () => rl.Audio.SetAudioStreamCallback(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      callback.attach(),
    ),
  );

  @override
  void AttachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackD callback,
  ) => run(
    () => RaylibDebugLabels.AttachAudioStreamProcessor(stream, callback),
    () => rl.Audio.AttachAudioStreamProcessor(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      callback.attach(),
    ),
  );

  @override
  void DetachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackD callback,
    {bool keepAlive = false}
  ) => run(
    () => RaylibDebugLabels.DetachAudioStreamProcessor(stream, callback, keepAlive: keepAlive),
    () => rl.Audio.DetachAudioStreamProcessor(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      callback.detach(keepAlive),
    ),
  );

  @override
  void AttachAudioMixedProcessor(
    AudioCallbackD callback,
  ) => run(
    () => RaylibDebugLabels.AttachAudioMixedProcessor(callback),
    () => rl.Audio.AttachAudioMixedProcessor(
      callback.attach(),
    ),
  );

  @override
  void DetachAudioMixedProcessor(
    AudioCallbackD callback,
    {bool keepAlive = false}
  ) => run(
    () => RaylibDebugLabels.DetachAudioMixedProcessor(callback, keepAlive: keepAlive),
    () => rl.Audio.DetachAudioMixedProcessor(
      callback.detach(keepAlive),
    ),
  );
}
