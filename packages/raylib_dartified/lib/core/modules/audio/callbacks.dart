part of '../../raylib_dartified.dart';

// void (XPtr<Void>, UnsignedInt)
/// User-facing `AudioCallback` signature.
typedef AudioCallbackFunction = void Function(
  XPtr<XVoid> bufferData,
  int frames,
);

/// Raylib's `AudioCallback` callback.
abstract class AudioCallbackBase extends RaylibCallback<AudioCallbackBase, AudioCallbackFunction> {
  AudioCallbackBase([super.name]);
  static final Map<int, AudioCallbackBase> callbackRegistry = {};
  @override @nonVirtual get registry => callbackRegistry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(callbackRegistry);
}