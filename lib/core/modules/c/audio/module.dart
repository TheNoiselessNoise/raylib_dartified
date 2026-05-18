part of '../../../raylib_dartified.dart';

class RaylibAudio extends RaylibModule<Raylib> {
  RaylibAudio(super.rl);

  void InitAudioDevice() {
    return _InitAudioDevice();
  }

  late final _InitAudioDevicePtr = rl
      .coreLookup<NativeFunction<Void Function()>>('InitAudioDevice');
  late final _InitAudioDevice =
      _InitAudioDevicePtr.asFunction<void Function()>();

  void CloseAudioDevice() {
    return _CloseAudioDevice();
  }

  late final _CloseAudioDevicePtr = rl
      .coreLookup<NativeFunction<Void Function()>>('CloseAudioDevice');
  late final _CloseAudioDevice =
      _CloseAudioDevicePtr.asFunction<void Function()>();

  bool IsAudioDeviceReady() {
    return _IsAudioDeviceReady();
  }

  late final _IsAudioDeviceReadyPtr = rl
      .coreLookup<NativeFunction<Bool Function()>>('IsAudioDeviceReady');
  late final _IsAudioDeviceReady =
      _IsAudioDeviceReadyPtr.asFunction<bool Function()>();

  void SetMasterVolume(double volume) {
    return _SetMasterVolume(volume);
  }

  late final _SetMasterVolumePtr = rl
      .coreLookup<NativeFunction<Void Function(Float)>>('SetMasterVolume');
  late final _SetMasterVolume =
      _SetMasterVolumePtr.asFunction<void Function(double)>();

  double GetMasterVolume() {
    return _GetMasterVolume();
  }

  late final _GetMasterVolumePtr = rl
      .coreLookup<NativeFunction<Float Function()>>('GetMasterVolume');
  late final _GetMasterVolume =
      _GetMasterVolumePtr.asFunction<double Function()>();

  WaveC LoadWave(Pointer<Char> fileName) {
    return _LoadWave(fileName);
  }

  late final _LoadWavePtr = rl
      .coreLookup<NativeFunction<WaveC Function(Pointer<Char>)>>('LoadWave');
  late final _LoadWave =
      _LoadWavePtr.asFunction<WaveC Function(Pointer<Char>)>();

  WaveC LoadWaveFromMemory(
    Pointer<Char> fileType,
    Pointer<UnsignedChar> fileData,
    int dataSize,
  ) {
    return _LoadWaveFromMemory(fileType, fileData, dataSize);
  }

  late final _LoadWaveFromMemoryPtr = rl
      .coreLookup<
        NativeFunction<WaveC Function(Pointer<Char>, Pointer<UnsignedChar>, Int)>
      >('LoadWaveFromMemory');
  late final _LoadWaveFromMemory =
      _LoadWaveFromMemoryPtr.asFunction<
        WaveC Function(Pointer<Char>, Pointer<UnsignedChar>, int)
      >();

  bool IsWaveValid(WaveC wave) {
    return _IsWaveValid(wave);
  }

  late final _IsWaveValidPtr = rl
      .coreLookup<NativeFunction<Bool Function(WaveC)>>('IsWaveValid');
  late final _IsWaveValid = _IsWaveValidPtr.asFunction<bool Function(WaveC)>();

  SoundC LoadSound(Pointer<Char> fileName) {
    return _LoadSound(fileName);
  }

  late final _LoadSoundPtr = rl
      .coreLookup<NativeFunction<SoundC Function(Pointer<Char>)>>('LoadSound');
  late final _LoadSound =
      _LoadSoundPtr.asFunction<SoundC Function(Pointer<Char>)>();

  SoundC LoadSoundFromWave(WaveC wave) {
    return _LoadSoundFromWave(wave);
  }

  late final _LoadSoundFromWavePtr = rl
      .coreLookup<NativeFunction<SoundC Function(WaveC)>>('LoadSoundFromWave');
  late final _LoadSoundFromWave =
      _LoadSoundFromWavePtr.asFunction<SoundC Function(WaveC)>();

  SoundC LoadSoundAlias(SoundC source) {
    return _LoadSoundAlias(source);
  }

  late final _LoadSoundAliasPtr = rl
      .coreLookup<NativeFunction<SoundC Function(SoundC)>>('LoadSoundAlias');
  late final _LoadSoundAlias =
      _LoadSoundAliasPtr.asFunction<SoundC Function(SoundC)>();

  bool IsSoundValid(SoundC sound) {
    return _IsSoundValid(sound);
  }

  late final _IsSoundValidPtr = rl
      .coreLookup<NativeFunction<Bool Function(SoundC)>>('IsSoundValid');
  late final _IsSoundValid =
      _IsSoundValidPtr.asFunction<bool Function(SoundC)>();

  void UpdateSound(SoundC sound, Pointer<Void> data, int sampleCount) {
    return _UpdateSound(sound, data, sampleCount);
  }

  late final _UpdateSoundPtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC, Pointer<Void>, Int)>>(
        'UpdateSound',
      );
  late final _UpdateSound =
      _UpdateSoundPtr.asFunction<void Function(SoundC, Pointer<Void>, int)>();

  void UnloadWave(WaveC wave) {
    return _UnloadWave(wave);
  }

  late final _UnloadWavePtr = rl
      .coreLookup<NativeFunction<Void Function(WaveC)>>('UnloadWave');
  late final _UnloadWave = _UnloadWavePtr.asFunction<void Function(WaveC)>();

  void UnloadSound(SoundC sound) {
    return _UnloadSound(sound);
  }

  late final _UnloadSoundPtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC)>>('UnloadSound');
  late final _UnloadSound = _UnloadSoundPtr.asFunction<void Function(SoundC)>();

  void UnloadSoundAlias(SoundC alias) {
    return _UnloadSoundAlias(alias);
  }

  late final _UnloadSoundAliasPtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC)>>('UnloadSoundAlias');
  late final _UnloadSoundAlias =
      _UnloadSoundAliasPtr.asFunction<void Function(SoundC)>();

  bool ExportWave(WaveC wave, Pointer<Char> fileName) {
    return _ExportWave(wave, fileName);
  }

  late final _ExportWavePtr = rl
      .coreLookup<NativeFunction<Bool Function(WaveC, Pointer<Char>)>>(
        'ExportWave',
      );
  late final _ExportWave =
      _ExportWavePtr.asFunction<bool Function(WaveC, Pointer<Char>)>();

  bool ExportWaveAsCode(WaveC wave, Pointer<Char> fileName) {
    return _ExportWaveAsCode(wave, fileName);
  }

  late final _ExportWaveAsCodePtr = rl
      .coreLookup<NativeFunction<Bool Function(WaveC, Pointer<Char>)>>(
        'ExportWaveAsCode',
      );
  late final _ExportWaveAsCode =
      _ExportWaveAsCodePtr.asFunction<bool Function(WaveC, Pointer<Char>)>();

  void PlaySound(SoundC sound) {
    return _PlaySound(sound);
  }

  late final _PlaySoundPtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC)>>('PlaySound');
  late final _PlaySound = _PlaySoundPtr.asFunction<void Function(SoundC)>();

  void StopSound(SoundC sound) {
    return _StopSound(sound);
  }

  late final _StopSoundPtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC)>>('StopSound');
  late final _StopSound = _StopSoundPtr.asFunction<void Function(SoundC)>();

  void PauseSound(SoundC sound) {
    return _PauseSound(sound);
  }

  late final _PauseSoundPtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC)>>('PauseSound');
  late final _PauseSound = _PauseSoundPtr.asFunction<void Function(SoundC)>();

  void ResumeSound(SoundC sound) {
    return _ResumeSound(sound);
  }

  late final _ResumeSoundPtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC)>>('ResumeSound');
  late final _ResumeSound = _ResumeSoundPtr.asFunction<void Function(SoundC)>();

  bool IsSoundPlaying(SoundC sound) {
    return _IsSoundPlaying(sound);
  }

  late final _IsSoundPlayingPtr = rl
      .coreLookup<NativeFunction<Bool Function(SoundC)>>('IsSoundPlaying');
  late final _IsSoundPlaying =
      _IsSoundPlayingPtr.asFunction<bool Function(SoundC)>();

  void SetSoundVolume(SoundC sound, double volume) {
    return _SetSoundVolume(sound, volume);
  }

  late final _SetSoundVolumePtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC, Float)>>(
        'SetSoundVolume',
      );
  late final _SetSoundVolume =
      _SetSoundVolumePtr.asFunction<void Function(SoundC, double)>();

  void SetSoundPitch(SoundC sound, double pitch) {
    return _SetSoundPitch(sound, pitch);
  }

  late final _SetSoundPitchPtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC, Float)>>('SetSoundPitch');
  late final _SetSoundPitch =
      _SetSoundPitchPtr.asFunction<void Function(SoundC, double)>();

  void SetSoundPan(SoundC sound, double pan) {
    return _SetSoundPan(sound, pan);
  }

  late final _SetSoundPanPtr = rl
      .coreLookup<NativeFunction<Void Function(SoundC, Float)>>('SetSoundPan');
  late final _SetSoundPan =
      _SetSoundPanPtr.asFunction<void Function(SoundC, double)>();

  WaveC WaveCopy(WaveC wave) {
    return _WaveCopy(wave);
  }

  late final _WaveCopyPtr = rl.coreLookup<NativeFunction<WaveC Function(WaveC)>>(
    'WaveCopy',
  );
  late final _WaveCopy = _WaveCopyPtr.asFunction<WaveC Function(WaveC)>();

  void WaveCrop(Pointer<WaveC> wave, int initFrame, int finalFrame) {
    return _WaveCrop(wave, initFrame, finalFrame);
  }

  late final _WaveCropPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<WaveC>, Int, Int)>>(
        'WaveCrop',
      );
  late final _WaveCrop =
      _WaveCropPtr.asFunction<void Function(Pointer<WaveC>, int, int)>();

  void WaveFormat(
    Pointer<WaveC> wave,
    int sampleRate,
    int sampleSize,
    int channels,
  ) {
    return _WaveFormat(wave, sampleRate, sampleSize, channels);
  }

  late final _WaveFormatPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<WaveC>, Int, Int, Int)>>(
        'WaveFormat',
      );
  late final _WaveFormat =
      _WaveFormatPtr.asFunction<void Function(Pointer<WaveC>, int, int, int)>();

  Pointer<Float> LoadWaveSamples(WaveC wave) {
    return _LoadWaveSamples(wave);
  }

  late final _LoadWaveSamplesPtr = rl
      .coreLookup<NativeFunction<Pointer<Float> Function(WaveC)>>(
        'LoadWaveSamples',
      );
  late final _LoadWaveSamples =
      _LoadWaveSamplesPtr.asFunction<Pointer<Float> Function(WaveC)>();

  void UnloadWaveSamples(Pointer<Float> samples) {
    return _UnloadWaveSamples(samples);
  }

  late final _UnloadWaveSamplesPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<Float>)>>(
        'UnloadWaveSamples',
      );
  late final _UnloadWaveSamples =
      _UnloadWaveSamplesPtr.asFunction<void Function(Pointer<Float>)>();

  MusicC LoadMusicStream(Pointer<Char> fileName) {
    return _LoadMusicStream(fileName);
  }

  late final _LoadMusicStreamPtr = rl
      .coreLookup<NativeFunction<MusicC Function(Pointer<Char>)>>(
        'LoadMusicStream',
      );
  late final _LoadMusicStream =
      _LoadMusicStreamPtr.asFunction<MusicC Function(Pointer<Char>)>();

  MusicC LoadMusicStreamFromMemory(
    Pointer<Char> fileType,
    Pointer<UnsignedChar> data,
    int dataSize,
  ) {
    return _LoadMusicStreamFromMemory(fileType, data, dataSize);
  }

  late final _LoadMusicStreamFromMemoryPtr = rl
      .coreLookup<
        NativeFunction<
          MusicC Function(Pointer<Char>, Pointer<UnsignedChar>, Int)
        >
      >('LoadMusicStreamFromMemory');
  late final _LoadMusicStreamFromMemory =
      _LoadMusicStreamFromMemoryPtr.asFunction<
        MusicC Function(Pointer<Char>, Pointer<UnsignedChar>, int)
      >();

  bool IsMusicValid(MusicC music) {
    return _IsMusicValid(music);
  }

  late final _IsMusicValidPtr = rl
      .coreLookup<NativeFunction<Bool Function(MusicC)>>('IsMusicValid');
  late final _IsMusicValid =
      _IsMusicValidPtr.asFunction<bool Function(MusicC)>();

  void UnloadMusicStream(MusicC music) {
    return _UnloadMusicStream(music);
  }

  late final _UnloadMusicStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC)>>('UnloadMusicStream');
  late final _UnloadMusicStream =
      _UnloadMusicStreamPtr.asFunction<void Function(MusicC)>();

  void PlayMusicStream(MusicC music) {
    return _PlayMusicStream(music);
  }

  late final _PlayMusicStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC)>>('PlayMusicStream');
  late final _PlayMusicStream =
      _PlayMusicStreamPtr.asFunction<void Function(MusicC)>();

  bool IsMusicStreamPlaying(MusicC music) {
    return _IsMusicStreamPlaying(music);
  }

  late final _IsMusicStreamPlayingPtr = rl
      .coreLookup<NativeFunction<Bool Function(MusicC)>>('IsMusicStreamPlaying');
  late final _IsMusicStreamPlaying =
      _IsMusicStreamPlayingPtr.asFunction<bool Function(MusicC)>();

  void UpdateMusicStream(MusicC music) {
    return _UpdateMusicStream(music);
  }

  late final _UpdateMusicStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC)>>('UpdateMusicStream');
  late final _UpdateMusicStream =
      _UpdateMusicStreamPtr.asFunction<void Function(MusicC)>();

  void StopMusicStream(MusicC music) {
    return _StopMusicStream(music);
  }

  late final _StopMusicStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC)>>('StopMusicStream');
  late final _StopMusicStream =
      _StopMusicStreamPtr.asFunction<void Function(MusicC)>();

  void PauseMusicStream(MusicC music) {
    return _PauseMusicStream(music);
  }

  late final _PauseMusicStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC)>>('PauseMusicStream');
  late final _PauseMusicStream =
      _PauseMusicStreamPtr.asFunction<void Function(MusicC)>();

  void ResumeMusicStream(MusicC music) {
    return _ResumeMusicStream(music);
  }

  late final _ResumeMusicStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC)>>('ResumeMusicStream');
  late final _ResumeMusicStream =
      _ResumeMusicStreamPtr.asFunction<void Function(MusicC)>();

  void SeekMusicStream(MusicC music, double position) {
    return _SeekMusicStream(music, position);
  }

  late final _SeekMusicStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC, Float)>>(
        'SeekMusicStream',
      );
  late final _SeekMusicStream =
      _SeekMusicStreamPtr.asFunction<void Function(MusicC, double)>();

  void SetMusicVolume(MusicC music, double volume) {
    return _SetMusicVolume(music, volume);
  }

  late final _SetMusicVolumePtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC, Float)>>(
        'SetMusicVolume',
      );
  late final _SetMusicVolume =
      _SetMusicVolumePtr.asFunction<void Function(MusicC, double)>();

  void SetMusicPitch(MusicC music, double pitch) {
    return _SetMusicPitch(music, pitch);
  }

  late final _SetMusicPitchPtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC, Float)>>('SetMusicPitch');
  late final _SetMusicPitch =
      _SetMusicPitchPtr.asFunction<void Function(MusicC, double)>();

  void SetMusicPan(MusicC music, double pan) {
    return _SetMusicPan(music, pan);
  }

  late final _SetMusicPanPtr = rl
      .coreLookup<NativeFunction<Void Function(MusicC, Float)>>('SetMusicPan');
  late final _SetMusicPan =
      _SetMusicPanPtr.asFunction<void Function(MusicC, double)>();

  double GetMusicTimeLength(MusicC music) {
    return _GetMusicTimeLength(music);
  }

  late final _GetMusicTimeLengthPtr = rl
      .coreLookup<NativeFunction<Float Function(MusicC)>>('GetMusicTimeLength');
  late final _GetMusicTimeLength =
      _GetMusicTimeLengthPtr.asFunction<double Function(MusicC)>();

  double GetMusicTimePlayed(MusicC music) {
    return _GetMusicTimePlayed(music);
  }

  late final _GetMusicTimePlayedPtr = rl
      .coreLookup<NativeFunction<Float Function(MusicC)>>('GetMusicTimePlayed');
  late final _GetMusicTimePlayed =
      _GetMusicTimePlayedPtr.asFunction<double Function(MusicC)>();

  AudioStreamC LoadAudioStream(int sampleRate, int sampleSize, int channels) {
    return _LoadAudioStream(sampleRate, sampleSize, channels);
  }

  late final _LoadAudioStreamPtr = rl
      .coreLookup<
        NativeFunction<
          AudioStreamC Function(UnsignedInt, UnsignedInt, UnsignedInt)
        >
      >('LoadAudioStream');
  late final _LoadAudioStream =
      _LoadAudioStreamPtr.asFunction<AudioStreamC Function(int, int, int)>();

  bool IsAudioStreamValid(AudioStreamC stream) {
    return _IsAudioStreamValid(stream);
  }

  late final _IsAudioStreamValidPtr = rl
      .coreLookup<NativeFunction<Bool Function(AudioStreamC)>>(
        'IsAudioStreamValid',
      );
  late final _IsAudioStreamValid =
      _IsAudioStreamValidPtr.asFunction<bool Function(AudioStreamC)>();

  void UnloadAudioStream(AudioStreamC stream) {
    return _UnloadAudioStream(stream);
  }

  late final _UnloadAudioStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC)>>(
        'UnloadAudioStream',
      );
  late final _UnloadAudioStream =
      _UnloadAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  void UpdateAudioStream(
    AudioStreamC stream,
    Pointer<Void> data,
    int frameCount,
  ) {
    return _UpdateAudioStream(stream, data, frameCount);
  }

  late final _UpdateAudioStreamPtr = rl
      .coreLookup<
        NativeFunction<Void Function(AudioStreamC, Pointer<Void>, Int)>
      >('UpdateAudioStream');
  late final _UpdateAudioStream =
      _UpdateAudioStreamPtr.asFunction<
        void Function(AudioStreamC, Pointer<Void>, int)
      >();

  bool IsAudioStreamProcessed(AudioStreamC stream) {
    return _IsAudioStreamProcessed(stream);
  }

  late final _IsAudioStreamProcessedPtr = rl
      .coreLookup<NativeFunction<Bool Function(AudioStreamC)>>(
        'IsAudioStreamProcessed',
      );
  late final _IsAudioStreamProcessed =
      _IsAudioStreamProcessedPtr.asFunction<bool Function(AudioStreamC)>();

  void PlayAudioStream(AudioStreamC stream) {
    return _PlayAudioStream(stream);
  }

  late final _PlayAudioStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC)>>(
        'PlayAudioStream',
      );
  late final _PlayAudioStream =
      _PlayAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  void PauseAudioStream(AudioStreamC stream) {
    return _PauseAudioStream(stream);
  }

  late final _PauseAudioStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC)>>(
        'PauseAudioStream',
      );
  late final _PauseAudioStream =
      _PauseAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  void ResumeAudioStream(AudioStreamC stream) {
    return _ResumeAudioStream(stream);
  }

  late final _ResumeAudioStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC)>>(
        'ResumeAudioStream',
      );
  late final _ResumeAudioStream =
      _ResumeAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  bool IsAudioStreamPlaying(AudioStreamC stream) {
    return _IsAudioStreamPlaying(stream);
  }

  late final _IsAudioStreamPlayingPtr = rl
      .coreLookup<NativeFunction<Bool Function(AudioStreamC)>>(
        'IsAudioStreamPlaying',
      );
  late final _IsAudioStreamPlaying =
      _IsAudioStreamPlayingPtr.asFunction<bool Function(AudioStreamC)>();

  void StopAudioStream(AudioStreamC stream) {
    return _StopAudioStream(stream);
  }

  late final _StopAudioStreamPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC)>>(
        'StopAudioStream',
      );
  late final _StopAudioStream =
      _StopAudioStreamPtr.asFunction<void Function(AudioStreamC)>();

  void SetAudioStreamVolume(AudioStreamC stream, double volume) {
    return _SetAudioStreamVolume(stream, volume);
  }

  late final _SetAudioStreamVolumePtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC, Float)>>(
        'SetAudioStreamVolume',
      );
  late final _SetAudioStreamVolume =
      _SetAudioStreamVolumePtr.asFunction<void Function(AudioStreamC, double)>();

  void SetAudioStreamPitch(AudioStreamC stream, double pitch) {
    return _SetAudioStreamPitch(stream, pitch);
  }

  late final _SetAudioStreamPitchPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC, Float)>>(
        'SetAudioStreamPitch',
      );
  late final _SetAudioStreamPitch =
      _SetAudioStreamPitchPtr.asFunction<void Function(AudioStreamC, double)>();

  void SetAudioStreamPan(AudioStreamC stream, double pan) {
    return _SetAudioStreamPan(stream, pan);
  }

  late final _SetAudioStreamPanPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC, Float)>>(
        'SetAudioStreamPan',
      );
  late final _SetAudioStreamPan =
      _SetAudioStreamPanPtr.asFunction<void Function(AudioStreamC, double)>();

  void SetAudioStreamBufferSizeDefault(int size) {
    return _SetAudioStreamBufferSizeDefault(size);
  }

  late final _SetAudioStreamBufferSizeDefaultPtr = rl
      .coreLookup<NativeFunction<Void Function(Int)>>(
        'SetAudioStreamBufferSizeDefault',
      );
  late final _SetAudioStreamBufferSizeDefault =
      _SetAudioStreamBufferSizeDefaultPtr.asFunction<void Function(int)>();

  void SetAudioStreamCallback(AudioStreamC stream, AudioCallbackC callback) {
    return _SetAudioStreamCallback(stream, callback);
  }

  late final _SetAudioStreamCallbackPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC, AudioCallbackC)>>(
        'SetAudioStreamCallback',
      );
  late final _SetAudioStreamCallback =
      _SetAudioStreamCallbackPtr.asFunction<
        void Function(AudioStreamC, AudioCallbackC)
      >();

  void AttachAudioStreamProcessor(AudioStreamC stream, AudioCallbackC processor) {
    return _AttachAudioStreamProcessor(stream, processor);
  }

  late final _AttachAudioStreamProcessorPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC, AudioCallbackC)>>(
        'AttachAudioStreamProcessor',
      );
  late final _AttachAudioStreamProcessor =
      _AttachAudioStreamProcessorPtr.asFunction<
        void Function(AudioStreamC, AudioCallbackC)
      >();

  void DetachAudioStreamProcessor(AudioStreamC stream, AudioCallbackC processor) {
    return _DetachAudioStreamProcessor(stream, processor);
  }

  late final _DetachAudioStreamProcessorPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioStreamC, AudioCallbackC)>>(
        'DetachAudioStreamProcessor',
      );
  late final _DetachAudioStreamProcessor =
      _DetachAudioStreamProcessorPtr.asFunction<
        void Function(AudioStreamC, AudioCallbackC)
      >();

  void AttachAudioMixedProcessor(AudioCallbackC processor) {
    return _AttachAudioMixedProcessor(processor);
  }

  late final _AttachAudioMixedProcessorPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioCallbackC)>>(
        'AttachAudioMixedProcessor',
      );
  late final _AttachAudioMixedProcessor =
      _AttachAudioMixedProcessorPtr.asFunction<void Function(AudioCallbackC)>();

  void DetachAudioMixedProcessor(AudioCallbackC processor) {
    return _DetachAudioMixedProcessor(processor);
  }

  late final _DetachAudioMixedProcessorPtr = rl
      .coreLookup<NativeFunction<Void Function(AudioCallbackC)>>(
        'DetachAudioMixedProcessor',
      );
  late final _DetachAudioMixedProcessor =
      _DetachAudioMixedProcessorPtr.asFunction<void Function(AudioCallbackC)>();
}
