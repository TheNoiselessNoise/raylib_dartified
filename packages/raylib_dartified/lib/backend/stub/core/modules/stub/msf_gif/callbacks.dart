part of '../../../backend.dart';

// MsfGifFileWriteFunc

abstract class MsfGifFileWriteCallback extends MsfGifFileWriteCallbackBase {
  MsfGifFileWriteCallback([super.name]);

  factory MsfGifFileWriteCallback.function(MsfGifFileWriteFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for MsfGifFileWriteCallback.function.');
}