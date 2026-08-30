part of '../../../raylib_dartified.dart';

// MsfGifFileWriteFunc

typedef _MsfGifFileWriteFunction = int Function(
  Pointer<Void> buffer,
  int size,
  int count,
  Pointer<Void> stream,
);

abstract class MsfGifFileWriteCallbackD extends MsfGifFileWriteCallbackBase {
  MsfGifFileWriteCallbackD([super.name]);

  /// The actual trampoline.
  _MsfGifFileWriteFunction get _rawFunction =>
    (buffer, size, count, stream) =>
      function(
        NativeMemoryPointer(buffer),
        size,
        count,
        NativeMemoryPointer(stream),
      );

  late final NativeCallable<MsfGifFileWriteFuncFunctionC> _callable;

  @override
  MemoryPointer<RFunction<MsfGifFileWriteCallbackBase>> initializer() {
    _callable = .isolateLocal(_rawFunction, exceptionalReturn: 0);
    return NativeMemoryPointer(_callable.nativeFunction.cast());
  }

  @override
  void dispose() {
    _callable.close();
    super.dispose();
  }

  factory MsfGifFileWriteCallbackD.function(MsfGifFileWriteFunction f, {String? name})
    => _MsfGifFileWriteCallbackD(f, name: name);
}

class _MsfGifFileWriteCallbackD extends MsfGifFileWriteCallbackD {
  final MsfGifFileWriteFunction _f;

  _MsfGifFileWriteCallbackD(this._f, {String? name}) : super(name);

  @override
  MsfGifFileWriteFunction get function => _f;
}