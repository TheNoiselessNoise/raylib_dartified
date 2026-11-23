part of '../../../backend.dart';

// MsfGifFileWriteFunc

typedef _MsfGifFileWriteFunction = int Function(
  int bufferPtr,
  int size,
  int count,
  int streamPtr,
);

abstract class MsfGifFileWriteCallback extends MsfGifFileWriteCallbackBase {
  MsfGifFileWriteCallback([super.name]);

  /// The actual trampoline.
  _MsfGifFileWriteFunction get _rawFunction =>
    (buffer, size, count, stream) =>
      function(
        XWasmPtr(buffer),
        size,
        count,
        XWasmPtr(stream),
      );

  late final int _funcIndex;

  @override
  XPtr<XFunction<MsfGifFileWriteCallbackBase>> initializer() {
    _funcIndex = WasmMemory.addFunction(
      _rawFunction.toJS,
      'ipiip',
    );
    return XWasmPtr(_funcIndex);
  }

  @override
  void dispose() {
    WasmMemory.removeFunction(_funcIndex);
    super.dispose();
  }

  factory MsfGifFileWriteCallback.function(MsfGifFileWriteFunction f, {String? name})
    => _MsfGifFileWriteCallback(f, name: name);
}

final class _MsfGifFileWriteCallback extends MsfGifFileWriteCallback {
  final MsfGifFileWriteFunction _f;

  _MsfGifFileWriteCallback(this._f, {String? name}) : super(name);

  @override
  MsfGifFileWriteFunction get function => _f;
}