part of '../../../raylib_dartified_web.dart';

// AudioCallback

typedef _AudioCallbackFunction = void Function(
  int bufferData,
  int frames,
);

abstract class AudioCallback extends AudioCallbackBase {
  AudioCallback([super.name]);

  /// The actual trampoline.
  _AudioCallbackFunction get _rawFunction =>
    (bufferData, frames) =>
      function(
        XWasmPtr(bufferData),
        frames,
      );

  late final int _funcIndex;

  @override
  XPtr<XFunction<AudioCallbackBase>> initializer() {
    _funcIndex = WasmMemory.addFunction(
      _rawFunction.toJS,
      'vpi',
    );
    return XWasmPtr(_funcIndex);
  }
  
  @override
  void dispose() {
    WasmMemory.removeFunction(_funcIndex);
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