part of '../../../raylib_dartified.dart';

// AudioCallback

typedef AudioCallbackFunctionD = void Function(Pointer<Void> bufferData, int frames);

abstract class AudioCallbackD extends CallbackD<
  AudioCallbackFunctionC,
  AudioCallbackFunctionD
> with AudioCallbackBase {
  AudioCallbackD([super.name]);

  static final List<AudioCallbackD> _registry = [];

  @override
  @nonVirtual
  get registry => _registry;

  @override
  initializer() => .listener(function);

  static void disposeRegistry() => CallbackD.disposeRegistry(_registry);

  factory AudioCallbackD.function(AudioCallbackFunctionD f, {String? name})
    => _AudioCallbackD(f, name: name);

  // NOTE: no need for `friendly` factory
}

class _AudioCallbackD extends AudioCallbackD {
  final AudioCallbackFunctionD _f;
  _AudioCallbackD(this._f, {String? name}) : super(name);

  @override
  AudioCallbackFunctionD get function => _f;
}