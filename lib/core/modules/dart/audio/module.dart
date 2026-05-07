part of '../../../raylib.dart';

class RaylibAudioD extends RaylibModule {
  RaylibAudioD(super.lib);

  @override
  void dispose() {
    super.dispose();

    AudioCallbackD.disposeRegistry();
  }

  void InitAudioDevice() => run(
    () => 'InitAudioDevice()',
    () => rl.Audio.InitAudioDevice(),
  );

  void CloseAudioDevice() => run(
    () => 'CloseAudioDevice()',
    () => rl.Audio.CloseAudioDevice(),
  );
  
  bool IsAudioDeviceReady() => run(
    () => 'IsAudioDeviceReady()',
    () => rl.Audio.IsAudioDeviceReady(),
  );

  void SetMasterVolume(
    num volume,
  ) => run(
    () => 'SetMasterVolume($volume)',
    () => rl.Audio.SetMasterVolume(
      volume.toDouble(),
    ),
  );

  double GetMasterVolume() => run(
    () => 'GetMasterVolume()',
    () => rl.Audio.GetMasterVolume(),
  );

  WaveD LoadWave(
    String fileName,
  ) => run(
    () => 'LoadWave($fileName)',
    () => rl.Temp.Wave$.RefCapture(
      'LoadWave_$fileName',
      rl.Audio.LoadWave(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );

  WaveD LoadWaveFromMemory(
    String fileType,
    List<int> fileData,
  ) => run(
    () => 'LoadWaveFromMemory($fileType, fileData: ${fileData.length})',
    () => rl.Temp.Wave$.RefCapture(
      'LoadWaveFromMemory_${fileType}_${fileData.length}',
      rl.Audio.LoadWaveFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
      ),
    ),
  );

  bool IsWaveValid(
    WaveD wave,
  ) => run(
    () => 'IsWaveValid($wave)',
    () => rl.Audio.IsWaveValid(
      rl.Temp.Wave$.Ref1(wave).ref,
    ),
  );

  SoundD LoadSound(
    String fileName,
  ) => run(
    () => 'LoadSound($fileName)',
    () => rl.Temp.Sound$.RefCapture(
      'LoadSound_$fileName',
      rl.Audio.LoadSound(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );

  SoundD LoadSoundFromWave(
    WaveD wave,
  ) => run(
    () => 'LoadSoundFromWave($wave)',
    () => rl.Temp.Sound$.RefCapture(
      'LoadSoundFromWave_${wave.internalId}',
      rl.Audio.LoadSoundFromWave(
        rl.Temp.Wave$.Ref1(wave).ref,
      ),
    ),
  );

  SoundD LoadSoundAlias(
    SoundD source,
  ) => run(
    () => 'LoadSoundAlias($source)',
    () => rl.Temp.Sound$.RefCapture(
      'LoadSoundAlias_${source.internalId}',
      rl.Audio.LoadSoundAlias(
        rl.Temp.Sound$.Ref1(source).ref,
      ),
    ),
  );

  bool IsSoundValid(
    SoundD sound,
  ) => run(
    () => 'IsSoundValid($sound)',
    () => rl.Audio.IsSoundValid(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  void UpdateSound(
    SoundD sound,
    List<int> data,
    num sampleCount,
  ) => run(
    () => 'UpdateSound($sound, data: ${data.length}, sampleCount: $sampleCount)',
    () => rl.Temp.Sound$.RefUpdate1(sound,
      (p) => rl.Audio.UpdateSound(
        p.ref,
        rl.Temp.Short$.Array(data).cast(),
        sampleCount.toInt(),
      ),
    ),
  );

  void UnloadWave(
    WaveD wave,
  ) => run(
    () => 'UnloadWave($wave)',
    () => rl.Audio.UnloadWave(
      rl.Temp.Wave$.Ref1(wave).ref,
    ),
  );

  void UnloadSound(
    SoundD sound,
  ) => run(
    () => 'UnloadSound($sound)',
    () => rl.Audio.UnloadSound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  void UnloadSoundAlias(
    SoundD alias,
  ) => run(
    () => 'UnloadSoundAlias($alias)',
    () => rl.Audio.UnloadSoundAlias(
      rl.Temp.Sound$.Ref1(alias).ref,
    ),
  );

  bool ExportWave(
    WaveD wave,
    String fileName,
  ) => run(
    () => 'ExportWave($wave, $fileName)',
    () => rl.Audio.ExportWave(
      rl.Temp.Wave$.Ref1(wave).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  bool ExportWaveAsCode(
    WaveD wave,
    String fileName,
  ) => run(
    () => 'ExportWaveAsCode($wave, $fileName)',
    () => rl.Audio.ExportWaveAsCode(
      rl.Temp.Wave$.Ref1(wave).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  void PlaySound(
    SoundD sound,
  ) => run(
    () => 'PlaySound($sound)',
    () => rl.Audio.PlaySound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  void StopSound(
    SoundD sound,
  ) => run(
    () => 'StopSound($sound)',
    () => rl.Audio.StopSound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  void PauseSound(
    SoundD sound,
  ) => run(
    () => 'PauseSound($sound)',
    () => rl.Audio.PauseSound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  void ResumeSound(
    SoundD sound,
  ) => run(
    () => 'ResumeSound($sound)',
    () => rl.Audio.ResumeSound(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  bool IsSoundPlaying(
    SoundD sound,
  ) => run(
    () => 'IsSoundPlaying($sound)',
    () => rl.Audio.IsSoundPlaying(
      rl.Temp.Sound$.Ref1(sound).ref,
    ),
  );

  void SetSoundVolume(
    SoundD sound,
    num volume,
  ) => run(
    () => 'SetSoundVolume($sound, $volume)',
    () => rl.Audio.SetSoundVolume(
      rl.Temp.Sound$.Ref1(sound).ref,
      volume.toDouble(),
    ),
  );

  void SetSoundPitch(
    SoundD sound,
    num pitch,
  ) => run(
    () => 'SetSoundPitch($sound, $pitch)',
    () => rl.Audio.SetSoundPitch(
      rl.Temp.Sound$.Ref1(sound).ref,
      pitch.toDouble(),
    ),
  );

  void SetSoundPan(
    SoundD sound,
    num pan,
  ) => run(
    () => 'SetSoundPan($sound, $pan)',
    () => rl.Audio.SetSoundPan(
      rl.Temp.Sound$.Ref1(sound).ref,
      pan.toDouble(),
    ),
  );

  WaveD WaveCopy(
    WaveD wave,
  ) => run(
    () => 'WaveCopy($wave)',
    () => rl.Temp.Wave$.RefCapture(
      'WaveCopy_${wave.internalId}',
      rl.Audio.WaveCopy(
        rl.Temp.Wave$.Ref2(wave).ref,
      ),
    ),
  );

  void WaveCrop(
    WaveD wave,
    num initFrame,
    num finalFrame,
  ) => run(
    () => 'WaveCrop($wave, $initFrame, $finalFrame)',
    () => rl.Temp.Wave$.RefUpdate1(wave,
      (p) => rl.Audio.WaveCrop(
        p,
        initFrame.toInt(),
        finalFrame.toInt(),
      ),
    ),
  );

  void WaveFormat(
    WaveD wave,
    num sampleRate,
    num sampleSize,
    num channels,
  ) => run(
    () => 'WaveFormat($wave, $sampleRate, $sampleSize, $channels)',
    () => rl.Temp.Wave$.RefUpdate1(wave,
      (p) => rl.Audio.WaveFormat(
        p,
        sampleRate.toInt(),
        sampleSize.toInt(),
        channels.toInt(),
      ),
    ),
  );

  List<double> LoadWaveSamples(
    WaveD wave
  ) => run(
    () => 'LoadWaveSamples($wave)',
    () {
      final samples = rl.Audio.LoadWaveSamples(
        rl.Temp.Wave$.Ref1(wave).ref
      );
      try {
        return .generate(wave.dataLength, (i) => samples[i]);
      } finally {
        rl.Audio.UnloadWaveSamples(samples);
      }
    },
  );

  MusicD LoadMusicStream(
    String fileName,
  ) => run(
    () => 'LoadMusicStream($fileName)',
    () => rl.Temp.Music$.RefCapture(
      'LoadMusicStream_$fileName',
      rl.Audio.LoadMusicStream(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );

  MusicD LoadMusicStreamFromMemory(
    String fileType,
    List<int> data,
  ) => run(
    () => 'LoadMusicStreamFromMemory($fileType, data: ${data.length})',
    () => rl.Temp.Music$.RefCapture(
      'LoadMusicStreamFromMemory_${fileType}_${data.length}',
      rl.Audio.LoadMusicStreamFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.UnsignedChar$.Array(data),
        data.length,
      ),
    ),
  );

  bool IsMusicValid(
    MusicD music,
  ) => run(
    () => 'IsMusicValid($music)',
    () => rl.Audio.IsMusicValid(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  void UnloadMusicStream(
    MusicD music,
  ) => run(
    () => 'UnloadMusicStream($music)',
    () => rl.Audio.UnloadMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  void PlayMusicStream(
    MusicD music,
  ) => run(
    () => 'PlayMusicStream($music)',
    () => rl.Audio.PlayMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  bool IsMusicStreamPlaying(
    MusicD music,
  ) => run(
    () => 'IsMusicStreamPlaying($music)',
    () => rl.Audio.IsMusicStreamPlaying(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  void UpdateMusicStream(
    MusicD music,
  ) => run(
    () => 'UpdateMusicStream($music)',
    () => rl.Audio.UpdateMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  void StopMusicStream(
    MusicD music,
  ) => run(
    () => 'StopMusicStream($music)',
    () => rl.Audio.StopMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  void PauseMusicStream(
    MusicD music,
  ) => run(
    () => 'PauseMusicStream($music)',
    () => rl.Audio.PauseMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  void ResumeMusicStream(
    MusicD music,
  ) => run(
    () => 'ResumeMusicStream($music)',
    () => rl.Audio.ResumeMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  void SeekMusicStream(
    MusicD music,
    num position,
  ) => run(
    () => 'SeekMusicStream($music, $position)',
    () => rl.Audio.SeekMusicStream(
      rl.Temp.Music$.Ref1(music).ref,
      position.toDouble(),
    ),
  );

  void SetMusicVolume(
    MusicD music,
    num volume,
  ) => run(
    () => 'SetMusicVolume($music, $volume)',
    () => rl.Audio.SetMusicVolume(
      rl.Temp.Music$.Ref1(music).ref,
      volume.toDouble(),
    ),
  );

  void SetMusicPitch(
    MusicD music,
    num pitch,
  ) => run(
    () => 'SetMusicPitch($music, $pitch)',
    () => rl.Audio.SetMusicPitch(
      rl.Temp.Music$.Ref1(music).ref,
      pitch.toDouble(),
    ),
  );

  void SetMusicPan(
    MusicD music,
    num pan,
  ) => run(
    () => 'SetMusicPan($music, $pan)',
    () => rl.Audio.SetMusicPan(
      rl.Temp.Music$.Ref1(music).ref,
      pan.toDouble(),
    ),
  );

  double GetMusicTimeLength(
    MusicD music,
  ) => run(
    () => 'GetMusicTimeLength($music)',
    () => rl.Audio.GetMusicTimeLength(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  double GetMusicTimePlayed(
    MusicD music,
  ) => run(
    () => 'GetMusicTimePlayed($music)',
    () => rl.Audio.GetMusicTimePlayed(
      rl.Temp.Music$.Ref1(music).ref,
    ),
  );

  AudioStreamD LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  ) => run(
    () => 'LoadAudioStream($sampleRate, $sampleSize, $channels)',
    () => rl.Temp.AudioStream$.RefCapture(
      'LoadAudioStream_${sampleRate}_${sampleSize}_$channels',
      rl.Audio.LoadAudioStream(
        sampleRate.toInt(),
        sampleSize.toInt(),
        channels.toInt(),
      ),
    ),
  );

  bool IsAudioStreamValid(
    AudioStreamD stream,
  ) => run(
    () => 'IsAudioStreamValid($stream)',
    () => rl.Audio.IsAudioStreamValid(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  void UnloadAudioStream(
    AudioStreamD stream,
  ) => run(
    () => 'UnloadAudioStream($stream)',
    () => rl.Audio.UnloadAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  void UpdateAudioStream(
    AudioStreamD stream,
    List<int> data,
  ) => run(
    () => 'UpdateAudioStream($stream, data: ${data.length})',
    () => rl.Temp.AudioStream$.RefUpdate1(stream,
      (p) => rl.Audio.UpdateAudioStream(
        p.ref,
        rl.Temp.Short$.Array(data).cast(),
        data.length,
      ),
    ),
  );

  bool IsAudioStreamProcessed(
    AudioStreamD stream,
  ) => run(
    () => 'IsAudioStreamProcessed($stream)',
    () => rl.Audio.IsAudioStreamProcessed(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  void PlayAudioStream(
    AudioStreamD stream,
  ) => run(
    () => 'PlayAudioStream($stream)',
    () => rl.Audio.PlayAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  void PauseAudioStream(
    AudioStreamD stream,
  ) => run(
    () => 'PauseAudioStream($stream)',
    () => rl.Audio.PauseAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  void ResumeAudioStream(
    AudioStreamD stream,
  ) => run(
    () => 'ResumeAudioStream($stream)',
    () => rl.Audio.ResumeAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  bool IsAudioStreamPlaying(
    AudioStreamD stream,
  ) => run(
    () => 'IsAudioStreamPlaying($stream)',
    () => rl.Audio.IsAudioStreamPlaying(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  void StopAudioStream(
    AudioStreamD stream,
  ) => run(
    () => 'StopAudioStream($stream)',
    () => rl.Audio.StopAudioStream(
      rl.Temp.AudioStream$.Ref1(stream).ref,
    ),
  );

  void SetAudioStreamVolume(
    AudioStreamD stream,
    num volume,
  ) => run(
    () => 'SetAudioStreamVolume($stream, $volume)',
    () => rl.Audio.SetAudioStreamVolume(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      volume.toDouble(),
    ),
  );

  void SetAudioStreamPitch(
    AudioStreamD stream,
    num pitch,
  ) => run(
    () => 'SetAudioStreamPitch($stream, $pitch)',
    () => rl.Audio.SetAudioStreamPitch(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      pitch.toDouble(),
    ),
  );

  void SetAudioStreamPan(
    AudioStreamD stream,
    num pan,
  ) => run(
    () => 'SetAudioStreamPan($stream, $pan)',
    () => rl.Audio.SetAudioStreamPan(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      pan.toDouble(),
    ),
  );

  void SetAudioStreamBufferSizeDefault(
    num size,
  ) => run(
    () => 'SetAudioStreamBufferSizeDefault($size)',
    () => rl.Audio.SetAudioStreamBufferSizeDefault(
      size.toInt(),
    ),
  );

  void SetAudioStreamCallback(
    AudioStreamD stream,
    AudioCallbackD callback,
  ) => run(
    () => 'SetAudioStreamCallback($stream, callback: $callback)',
    () => rl.Audio.SetAudioStreamCallback(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      callback.attach(),
    ),
  );

  void AttachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackD callback,
  ) => run(
    () => 'AttachAudioStreamProcessor($stream, callback: $callback)',
    () => rl.Audio.AttachAudioStreamProcessor(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      callback.attach(),
    ),
  );

  void DetachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackD callback,
    {bool keepAlive = false}
  ) => run(
    () => 'DetachAudioStreamProcessor($stream, callback: $callback, keepAlive: $keepAlive)',
    () => rl.Audio.DetachAudioStreamProcessor(
      rl.Temp.AudioStream$.Ref1(stream).ref,
      callback.detach(keepAlive),
    ),
  );

  void AttachAudioMixedProcessor(
    AudioCallbackD callback,
  ) => run(
    () => 'AttachAudioMixedProcessor(callback: $callback)',
    () => rl.Audio.AttachAudioMixedProcessor(
      callback.attach(),
    ),
  );

  void DetachAudioMixedProcessor(
    AudioCallbackD callback,
    {bool keepAlive = false}
  ) => run(
    () => 'DetachAudioMixedProcessor(callback: $callback, keepAlive: $keepAlive)',
    () => rl.Audio.DetachAudioMixedProcessor(
      callback.detach(keepAlive),
    ),
  );
}
