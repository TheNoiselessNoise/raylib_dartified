part of '../../../raylib_dartified.dart';

// MsfGifFileWriteFunc

typedef _MsfGifFileWriteFunction = int Function(
  Pointer<Void> buffer,
  int size,
  int count,
  Pointer<Void> stream,
);

abstract class MsfGifFileWriteCallback extends MsfGifFileWriteCallbackBase {
  MsfGifFileWriteCallback([super.name]);

  /// The actual trampoline.
  _MsfGifFileWriteFunction get _rawFunction =>
    (buffer, size, count, stream) =>
      function(
        XNativePtr(buffer),
        size,
        count,
        XNativePtr(stream),
      );

  late final NativeCallable<MsfGifFileWriteFuncFunctionC> _callable;

  @override
  XPtr<XFunction<MsfGifFileWriteCallbackBase>> initializer() {
    _callable = .isolateLocal(_rawFunction, exceptionalReturn: 0);
    return XNativePtr(_callable.nativeFunction.cast());
  }

  @override
  void dispose() {
    _callable.close();
    super.dispose();
  }

  factory MsfGifFileWriteCallback.function(MsfGifFileWriteFunction f, {String? name})
    => _MsfGifFileWriteCallback(f, name: name);
}

class _MsfGifFileWriteCallback extends MsfGifFileWriteCallback {
  final MsfGifFileWriteFunction _f;

  _MsfGifFileWriteCallback(this._f, {String? name}) : super(name);

  @override
  MsfGifFileWriteFunction get function => _f;
}