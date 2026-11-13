part of '../../../raylib_dartified.dart';

// AudioCallback

typedef _AudioCallbackFunction = void Function(
  Pointer<Void> bufferData,
  int frames,
);

abstract class AudioCallback extends AudioCallbackBase {
  AudioCallback([super.name]);

  /// The actual trampoline.
  _AudioCallbackFunction get _rawFunction =>
    (bufferData, frames) =>
      function(
        XNativePtr(bufferData),
        frames,
      );

  late final NativeCallable<AudioCallbackFunctionC> _callable;

  @override
  XPtr<XFunction<AudioCallbackBase>> initializer() {
    _callable = .listener(_rawFunction);
    return XNativePtr(_callable.nativeFunction.cast());
  }
  
  @override
  void dispose() {
    _callable.close();
    super.dispose();
  }

  factory AudioCallback.function(AudioCallbackFunction f, {String? name})
    => _AudioCallback(f, name: name);
}

class _AudioCallback extends AudioCallback {
  final AudioCallbackFunction _f;
  _AudioCallback(this._f, {String? name}) : super(name);

  @override
  AudioCallbackFunction get function => _f;
}