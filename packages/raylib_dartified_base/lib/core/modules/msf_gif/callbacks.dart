part of '../../raylib_dartified_base.dart';

// size_t (XPtr<Void>, size_t, size_t, XPtr<Void>)
/// User-facing `MsfGifFileWriteFunc` signature.
typedef MsfGifFileWriteFunction = int Function(
  XPtr<XVoid> buffer,
  int size,
  int count,
  XPtr<XVoid> stream,
);

/// MsfGif's `MsfGifFileWriteFunc` callback.
abstract class MsfGifFileWriteCallbackBase extends RaylibCallback<MsfGifFileWriteCallbackBase, MsfGifFileWriteFunction> {
  MsfGifFileWriteCallbackBase([super.name]);
  static final Map<int, MsfGifFileWriteCallbackBase> callbackRegistry = {};
  @override @nonVirtual get registry => callbackRegistry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(callbackRegistry);
}