part of '../../../backend.dart';

// AudioCallback

abstract class AudioCallback extends AudioCallbackBase {
  AudioCallback([super.name]);

  factory AudioCallback.function(AudioCallbackFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for AudioCallback.function.');
}