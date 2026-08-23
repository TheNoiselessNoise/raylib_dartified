part of '../../../raylib_dartified.dart';

class RaylibAudioD extends RaylibAudioModule<Raylib> {

  RaylibAudioD(super.rl);

  @override
  void SetAudioStreamCallback(
    AudioStreamD stream,
    AudioCallbackD callback,
  ) => run(
    () => RaylibDebugLabels.SetAudioStreamCallback(stream, callback),
    () => rl.AudioFlat.SetAudioStreamCallback(
      stream,
      callback.attach(),
    ),
  );

  @override
  void AttachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackD processor,
  ) => run(
    () => RaylibDebugLabels.AttachAudioStreamProcessor(stream, processor),
    () => rl.AudioFlat.AttachAudioStreamProcessor(
      stream,
      processor.attach(),
    ),
  );

  @override
  void DetachAudioStreamProcessor(
    AudioStreamD stream,
    AudioCallbackD processor,
    {bool keepAlive = false}
  ) => run(
    () => RaylibDebugLabels.DetachAudioStreamProcessor(stream, processor, keepAlive: keepAlive),
    () => rl.AudioFlat.DetachAudioStreamProcessor(
      stream,
      processor.detach(keepAlive),
    ),
  );

  @override
  void AttachAudioMixedProcessor(
    AudioCallbackD processor,
  ) => run(
    () => RaylibDebugLabels.AttachAudioMixedProcessor(processor),
    () => rl.AudioFlat.AttachAudioMixedProcessor(
      processor.attach(),
    ),
  );

  @override
  void DetachAudioMixedProcessor(
    AudioCallbackD processor,
    {bool keepAlive = false}
  ) => run(
    () => RaylibDebugLabels.DetachAudioMixedProcessor(processor, keepAlive: keepAlive),
    () => rl.AudioFlat.DetachAudioMixedProcessor(
      processor.detach(keepAlive),
    ),
  );
}
