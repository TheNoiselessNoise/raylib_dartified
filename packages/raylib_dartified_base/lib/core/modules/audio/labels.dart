part of '../../raylib_dartified_base.dart';

class _RaylibAudioDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibAudioDart.InitAudioDevice].
  String InitAudioDevice() => 'InitAudioDevice()';

  /// Label for [RaylibAudioDart.CloseAudioDevice].
  String CloseAudioDevice() => 'CloseAudioDevice()';

  /// Label for [RaylibAudioDart.IsAudioDeviceReady].
  String IsAudioDeviceReady() => 'IsAudioDeviceReady()';

  /// Label for [RaylibAudioDart.SetMasterVolume].
  String SetMasterVolume(
    num volume,
  ) => 'SetMasterVolume($volume)';

  /// Label for [RaylibAudioDart.GetMasterVolume].
  String GetMasterVolume() => 'GetMasterVolume()';

  /// Label for [RaylibAudioDart.LoadWave].
  String LoadWave(
    String fileName,
  ) => 'LoadWave($fileName)';

  /// Label for [RaylibAudioDart.LoadWaveFromMemory].
  String LoadWaveFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadWaveFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibAudioDart.IsWaveValid].
  String IsWaveValid(
    Wave wave,
  ) => 'IsWaveValid($wave)';

  /// Label for [RaylibAudioDart.LoadSound].
  String LoadSound(
    String fileName,
  ) => 'LoadSound($fileName)';

  /// Label for [RaylibAudioDart.LoadSoundFromWave].
  String LoadSoundFromWave(
    Wave wave,
  ) => 'LoadSoundFromWave($wave)';

  /// Label for [RaylibAudioDart.LoadSoundAlias].
  String LoadSoundAlias(
    Sound source,
  ) => 'LoadSoundAlias($source)';

  /// Label for [RaylibAudioDart.IsSoundValid].
  String IsSoundValid(
    Sound sound,
  ) => 'IsSoundValid($sound)';

  /// Label for [RaylibAudioDart.UpdateSound].
  String UpdateSound(
    Sound sound,
    TypedDataList data,
    num sampleCount,
  ) => 'UpdateSound($sound, data: ${data.length}, sampleCount: $sampleCount)';

  /// Label for [RaylibAudioDart.UnloadWave].
  String UnloadWave(
    Wave wave,
  ) => 'UnloadWave($wave)';

  /// Label for [RaylibAudioDart.UnloadSound].
  String UnloadSound(
    Sound sound,
  ) => 'UnloadSound($sound)';

  /// Label for [RaylibAudioDart.UnloadSoundAlias].
  String UnloadSoundAlias(
    Sound alias,
  ) => 'UnloadSoundAlias($alias)';

  /// Label for [RaylibAudioDart.ExportWave].
  String ExportWave(
    Wave wave,
    String fileName,
  ) => 'ExportWave($wave, $fileName)';

  /// Label for [RaylibAudioDart.ExportWaveAsCode].
  String ExportWaveAsCode(
    Wave wave,
    String fileName,
  ) => 'ExportWaveAsCode($wave, $fileName)';

  /// Label for [RaylibAudioDart.PlaySound].
  String PlaySound(
    Sound sound,
  ) => 'PlaySound($sound)';

  /// Label for [RaylibAudioDart.StopSound].
  String StopSound(
    Sound sound,
  ) => 'StopSound($sound)';

  /// Label for [RaylibAudioDart.PauseSound].
  String PauseSound(
    Sound sound,
  ) => 'PauseSound($sound)';

  /// Label for [RaylibAudioDart.ResumeSound].
  String ResumeSound(
    Sound sound,
  ) => 'ResumeSound($sound)';

  /// Label for [RaylibAudioDart.IsSoundPlaying].
  String IsSoundPlaying(
    Sound sound,
  ) => 'IsSoundPlaying($sound)';

  /// Label for [RaylibAudioDart.SetSoundVolume].
  String SetSoundVolume(
    Sound sound,
    num volume,
  ) => 'SetSoundVolume($sound, $volume)';

  /// Label for [RaylibAudioDart.SetSoundPitch].
  String SetSoundPitch(
    Sound sound,
    num pitch,
  ) => 'SetSoundPitch($sound, $pitch)';

  /// Label for [RaylibAudioDart.SetSoundPan].
  String SetSoundPan(
    Sound sound,
    num pan,
  ) => 'SetSoundPan($sound, $pan)';

  /// Label for [RaylibAudioDart.WaveCopy].
  String WaveCopy(
    Wave wave,
  ) => 'WaveCopy($wave)';

  /// Label for [RaylibAudioDart.WaveCrop].
  String WaveCrop(
    Wave wave,
    num initFrame,
    num finalFrame,
  ) => 'WaveCrop($wave, $initFrame, $finalFrame)';

  /// Label for [RaylibAudioDart.WaveFormat].
  String WaveFormat(
    Wave wave,
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'WaveFormat($wave, $sampleRate, $sampleSize, $channels)';

  /// Label for [RaylibAudioDart.LoadWaveSamples].
  String LoadWaveSamples(
    Wave wave
  ) => 'LoadWaveSamples($wave)';

  /// Label for [RaylibAudioDart.LoadMusicStream].
  String LoadMusicStream(
    String fileName,
  ) => 'LoadMusicStream($fileName)';

  /// Label for [RaylibAudioDart.LoadMusicStreamFromMemory].
  String LoadMusicStreamFromMemory(
    String fileType,
    Uint8List data,
  ) => 'LoadMusicStreamFromMemory($fileType, data: ${data.length})';

  /// Label for [RaylibAudioDart.IsMusicValid].
  String IsMusicValid(
    Music music,
  ) => 'IsMusicValid($music)';

  /// Label for [RaylibAudioDart.UnloadMusicStream].
  String UnloadMusicStream(
    Music music,
  ) => 'UnloadMusicStream($music)';

  /// Label for [RaylibAudioDart.PlayMusicStream].
  String PlayMusicStream(
    Music music,
  ) => 'PlayMusicStream($music)';

  /// Label for [RaylibAudioDart.IsMusicStreamPlaying].
  String IsMusicStreamPlaying(
    Music music,
  ) => 'IsMusicStreamPlaying($music)';

  /// Label for [RaylibAudioDart.UpdateMusicStream].
  String UpdateMusicStream(
    Music music,
  ) => 'UpdateMusicStream($music)';

  /// Label for [RaylibAudioDart.StopMusicStream].
  String StopMusicStream(
    Music music,
  ) => 'StopMusicStream($music)';

  /// Label for [RaylibAudioDart.PauseMusicStream].
  String PauseMusicStream(
    Music music,
  ) => 'PauseMusicStream($music)';

  /// Label for [RaylibAudioDart.ResumeMusicStream].
  String ResumeMusicStream(
    Music music,
  ) => 'ResumeMusicStream($music)';

  /// Label for [RaylibAudioDart.SeekMusicStream].
  String SeekMusicStream(
    Music music,
    num position,
  ) => 'SeekMusicStream($music, $position)';

  /// Label for [RaylibAudioDart.SetMusicVolume].
  String SetMusicVolume(
    Music music,
    num volume,
  ) => 'SetMusicVolume($music, $volume)';

  /// Label for [RaylibAudioDart.SetMusicPitch].
  String SetMusicPitch(
    Music music,
    num pitch,
  ) => 'SetMusicPitch($music, $pitch)';

  /// Label for [RaylibAudioDart.SetMusicPan].
  String SetMusicPan(
    Music music,
    num pan,
  ) => 'SetMusicPan($music, $pan)';

  /// Label for [RaylibAudioDart.GetMusicTimeLength].
  String GetMusicTimeLength(
    Music music,
  ) => 'GetMusicTimeLength($music)';

  /// Label for [RaylibAudioDart.GetMusicTimePlayed].
  String GetMusicTimePlayed(
    Music music,
  ) => 'GetMusicTimePlayed($music)';

  /// Label for [RaylibAudioDart.LoadAudioStream].
  String LoadAudioStream(
    num sampleRate,
    num sampleSize,
    num channels,
  ) => 'LoadAudioStream($sampleRate, $sampleSize, $channels)';

  /// Label for [RaylibAudioDart.IsAudioStreamValid].
  String IsAudioStreamValid(
    AudioStream stream,
  ) => 'IsAudioStreamValid($stream)';

  /// Label for [RaylibAudioDart.UnloadAudioStream].
  String UnloadAudioStream(
    AudioStream stream,
  ) => 'UnloadAudioStream($stream)';

  /// Label for [RaylibAudioDart.UpdateAudioStream].
  String UpdateAudioStream(
    AudioStream stream,
    TypedDataList data,
  ) => 'UpdateAudioStream($stream, data: ${data.length})';

  /// Label for [RaylibAudioDart.IsAudioStreamProcessed].
  String IsAudioStreamProcessed(
    AudioStream stream,
  ) => 'IsAudioStreamProcessed($stream)';

  /// Label for [RaylibAudioDart.PlayAudioStream].
  String PlayAudioStream(
    AudioStream stream,
  ) => 'PlayAudioStream($stream)';

  /// Label for [RaylibAudioDart.PauseAudioStream].
  String PauseAudioStream(
    AudioStream stream,
  ) => 'PauseAudioStream($stream)';

  /// Label for [RaylibAudioDart.ResumeAudioStream].
  String ResumeAudioStream(
    AudioStream stream,
  ) => 'ResumeAudioStream($stream)';

  /// Label for [RaylibAudioDart.IsAudioStreamPlaying].
  String IsAudioStreamPlaying(
    AudioStream stream,
  ) => 'IsAudioStreamPlaying($stream)';

  /// Label for [RaylibAudioDart.StopAudioStream].
  String StopAudioStream(
    AudioStream stream,
  ) => 'StopAudioStream($stream)';

  /// Label for [RaylibAudioDart.SetAudioStreamVolume].
  String SetAudioStreamVolume(
    AudioStream stream,
    num volume,
  ) => 'SetAudioStreamVolume($stream, $volume)';

  /// Label for [RaylibAudioDart.SetAudioStreamPitch].
  String SetAudioStreamPitch(
    AudioStream stream,
    num pitch,
  ) => 'SetAudioStreamPitch($stream, $pitch)';

  /// Label for [RaylibAudioDart.SetAudioStreamPan].
  String SetAudioStreamPan(
    AudioStream stream,
    num pan,
  ) => 'SetAudioStreamPan($stream, $pan)';

  /// Label for [RaylibAudioDart.SetAudioStreamBufferSizeDefault].
  String SetAudioStreamBufferSizeDefault(
    num size,
  ) => 'SetAudioStreamBufferSizeDefault($size)';

  /// Label for [RaylibAudioDart.SetAudioStreamCallback].
  String SetAudioStreamCallback(
    AudioStream stream,
    AudioCallbackBase? callback,
  ) => 'SetAudioStreamCallback($stream, callback: $callback)';

  /// Label for [RaylibAudioDart.AttachAudioStreamProcessor].
  String AttachAudioStreamProcessor(
    AudioStream stream,
    AudioCallbackBase processor,
  ) => 'AttachAudioStreamProcessor($stream, processor: $processor)';

  /// Label for [RaylibAudioDart.DetachAudioStreamProcessor].
  String DetachAudioStreamProcessor(
    AudioStream stream,
    AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => 'DetachAudioStreamProcessor($stream, processor: $processor, keepAlive: $keepAlive)';

  /// Label for [RaylibAudioDart.AttachAudioMixedProcessor].
  String AttachAudioMixedProcessor(
    AudioCallbackBase processor,
  ) => 'AttachAudioMixedProcessor(processor: $processor)';

  /// Label for [RaylibAudioDart.DetachAudioMixedProcessor].
  String DetachAudioMixedProcessor(
    AudioCallbackBase processor,
    {bool keepAlive = false}
  ) => 'DetachAudioMixedProcessor(processor: $processor, keepAlive: $keepAlive)';
  
}
