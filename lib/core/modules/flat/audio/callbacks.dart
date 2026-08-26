part of '../../../raylib_dartified.dart';

// AudioCallback

typedef _AudioCallbackFunction = void Function(
  Pointer<Void> bufferData,
  int frames,
);

abstract class AudioCallbackD extends AudioCallbackBase {
  AudioCallbackD([super.name]);

  /// The actual trampoline.
  _AudioCallbackFunction get _rawFunction =>
    (bufferData, frames) =>
      function(
        NativeMemoryPointer(bufferData),
        frames,
      );

  late final NativeCallable<AudioCallbackFunctionC> _callable;

  @override
  MemoryPointer<RFunction<AudioCallbackBase>> initializer() {
    _callable = .listener(_rawFunction);
    return NativeMemoryPointer(_callable.nativeFunction.cast());
  }
  
  @override
  void dispose() {
    _callable.close();
    super.dispose();
  }

  factory AudioCallbackD.function(AudioCallbackFunction f, {String? name})
    => _AudioCallbackD(f, name: name);
}

class _AudioCallbackD extends AudioCallbackD {
  final AudioCallbackFunction _f;
  _AudioCallbackD(this._f, {String? name}) : super(name);

  @override
  AudioCallbackFunction get function => _f;
}