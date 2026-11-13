part of '../../../raylib_dartified.dart';

// TraceLogCallback

typedef _TraceLogCallbackFunction = void Function(
  int logLevel,
  Pointer<Char> text,
  Pointer<Void> args,
);

abstract class TraceLogCallback extends TraceLogCallbackBase {
  TraceLogCallback([super.name]);

  /// The actual trampoline.
  _TraceLogCallbackFunction get _rawFunction =>
    (int logLevel, Pointer<Char> text, Pointer<Void> args) =>
      function(
        logLevel,
        XNativePtr(text.cast()),
        XNativePtr(args),
      );

  late final NativeCallable<TraceLogCallbackFunctionC> _callable;

  @override
  XPtr<XFunction<TraceLogCallbackBase>> initializer() {
    _callable = .isolateLocal(_rawFunction);
    return XNativePtr(_callable.nativeFunction.cast());
  }

  @override
  void dispose() {
    _callable.close();
    super.dispose();
  }

  factory TraceLogCallback.function(TraceLogCallbackFunction f, {String? name})
    => _TraceLogCallback(f, name: name);

  factory TraceLogCallback.friendly(TraceLogCallbackFriendlyFunction f, {String? name})
    => _TraceLogCallbackFriendly(f, name: name);
}

class _TraceLogCallback extends TraceLogCallback {
  final TraceLogCallbackFunction _f;
  _TraceLogCallback(this._f, {String? name}) : super(name);

  @override
  TraceLogCallbackFunction get function => _f;
}

class _TraceLogCallbackFriendly extends TraceLogCallback {
  final TraceLogCallbackFriendlyFunction _f;
  _TraceLogCallbackFriendly(this._f, {String? name}) : super(name);

  @override
  TraceLogCallbackFunction get function => (logLevel, text, args) {
    return _f(.fromValue(logLevel), text.toDartString());
  };
}

// LoadFileDataCallback

typedef _LoadFileDataCallbackFunction = Pointer<UnsignedChar> Function(
  Pointer<Char> fileName,
  Pointer<Int> dataSize,
);

abstract class LoadFileDataCallback extends LoadFileDataCallbackBase {
  LoadFileDataCallback([super.name]);

  /// The actual trampoline.
  _LoadFileDataCallbackFunction get _rawFunction =>
    (Pointer<Char> fileName, Pointer<Int> dataSize) => function(
      XNativePtr(fileName.cast()),
      XNativePtr(dataSize.cast()),
    ).asNative();

  late final NativeCallable<LoadFileDataCallbackFunctionC> _callable;

  @override
  XPtr<XFunction<LoadFileDataCallbackBase>> initializer() {
    _callable = .isolateLocal(_rawFunction);
    return XNativePtr(_callable.nativeFunction.cast());
  }

  @override
  void dispose() {
    _callable.close();
    super.dispose();
  }

  factory LoadFileDataCallback.function(LoadFileDataCallbackFunction f, {String? name})
    => _LoadFileDataCallback(f, name: name);

  factory LoadFileDataCallback.friendly(LoadFileDataCallbackFriendlyFunction f, {String? name})
    => _LoadFileDataCallbackFriendly(f, name: name);
}

class _LoadFileDataCallback extends LoadFileDataCallback {
  final LoadFileDataCallbackFunction _f;
  _LoadFileDataCallback(this._f, {String? name}) : super(name);

  @override
  LoadFileDataCallbackFunction get function => _f;
}

class _LoadFileDataCallbackFriendly extends LoadFileDataCallback {
  final LoadFileDataCallbackFriendlyFunction _f;
  _LoadFileDataCallbackFriendly(this._f, {String? name}) : super(name);

  @override
  LoadFileDataCallbackFunction get function => (fileName, dataSize) {
    return _f(fileName.toDartString(), dataSize);
  };
}

// SaveFileDataCallback

typedef _SaveFileDataCallbackFunction = bool Function(
  Pointer<Char> fileName,
  Pointer<Void> data,
  int dataSize,
);

abstract class SaveFileDataCallback extends SaveFileDataCallbackBase {
  SaveFileDataCallback([super.name]);
  
  /// The actual trampoline.
  _SaveFileDataCallbackFunction get _rawFunction =>
    (Pointer<Char> fileName, Pointer<Void> data, int dataSize) =>
      function(
        XNativePtr(fileName.cast()),
        XNativePtr(data),
        dataSize
      );

  late final NativeCallable<SaveFileDataCallbackFunctionC> _callable;

  @override
  XPtr<XFunction<SaveFileDataCallbackBase>> initializer() {
    _callable = .isolateLocal(_rawFunction, exceptionalReturn: false);
    return XNativePtr(_callable.nativeFunction.cast());
  }

  @override
  void dispose() {
    _callable.close();
    super.dispose();
  }

  factory SaveFileDataCallback.function(SaveFileDataCallbackFunction f, {String? name})
    => _SaveFileDataCallback(f, name: name);

  factory SaveFileDataCallback.friendly(SaveFileDataCallbackFriendlyFunction f, {String? name})
    => _SaveFileDataCallbackFriendly(f, name: name);
}

class _SaveFileDataCallback extends SaveFileDataCallback {
  final SaveFileDataCallbackFunction _f;
  _SaveFileDataCallback(this._f, {String? name}) : super(name);

  @override
  SaveFileDataCallbackFunction get function => _f;
}

class _SaveFileDataCallbackFriendly extends SaveFileDataCallback {
  final SaveFileDataCallbackFriendlyFunction _f;
  _SaveFileDataCallbackFriendly(this._f, {String? name}) : super(name);

  @override
  SaveFileDataCallbackFunction get function => (fileName, data, dataSize) {
    return _f(fileName.toDartString(), data, dataSize);
  };
}

// LoadFileTextCallback

typedef _LoadFileTextCallbackFunction = Pointer<Char> Function(
  Pointer<Char> fileName,
);

abstract class LoadFileTextCallback extends LoadFileTextCallbackBase {
  LoadFileTextCallback([super.name]);

  /// The actual trampoline.
  _LoadFileTextCallbackFunction get _rawFunction =>
    (Pointer<Char> fileName) {
      final result = function(
        XNativePtr(fileName.cast()),
      );
      if (result.isNull) return nullptr;
      return (result as XNativePtr).asNative();
    };

  late final NativeCallable<LoadFileTextCallbackFunctionC> _callable;

  @override
  XPtr<XFunction<LoadFileTextCallbackBase>> initializer() {
    _callable = .isolateLocal(_rawFunction);
    return XNativePtr(_callable.nativeFunction.cast());
  }

  @override
  void dispose() {
    _callable.close();
    super.dispose();
  }

  factory LoadFileTextCallback.function(LoadFileTextCallbackFunction f, {String? name})
    => _LoadFileTextCallback(f, name: name);

  factory LoadFileTextCallback.friendly(LoadFileTextCallbackFriendlyFunction f, {String? name})
    => _LoadFileTextCallbackFriendly(f, name: name);
}

class _LoadFileTextCallback extends LoadFileTextCallback {
  final LoadFileTextCallbackFunction _f;
  _LoadFileTextCallback(this._f, {String? name}) : super(name);

  @override
  LoadFileTextCallbackFunction get function => _f;
}

class _LoadFileTextCallbackFriendly extends LoadFileTextCallback {
  final LoadFileTextCallbackFriendlyFunction _f;
  _LoadFileTextCallbackFriendly(this._f, {String? name}) : super(name);

  @override
  LoadFileTextCallbackFunction get function => (fileName) {
    return XNativePtr(_f(fileName.toDartString()).toNativeUtf8());
  };
}

// SaveFileTextCallback

typedef _SaveFileTextCallbackFunction = bool Function(
  Pointer<Char> fileName,
  Pointer<Char> text,
);

abstract class SaveFileTextCallback extends SaveFileTextCallbackBase {
  SaveFileTextCallback([super.name]);

  /// The actual trampoline.
  _SaveFileTextCallbackFunction get _rawFunction =>
    (Pointer<Char> fileName, Pointer<Char> text) =>
      function(
        XNativePtr(fileName.cast()),
        XNativePtr(text.cast()),
      );

  late final NativeCallable<SaveFileTextCallbackFunctionC> _callable;

  @override
  XPtr<XFunction<SaveFileTextCallbackBase>> initializer() {
    _callable = .isolateLocal(_rawFunction, exceptionalReturn: false);
    return XNativePtr(_callable.nativeFunction.cast());
  }

  @override
  void dispose() {
    _callable.close();
    super.dispose();
  }

  factory SaveFileTextCallback.function(SaveFileTextCallbackFunction f, {String? name})
    => _SaveFileTextCallback(f, name: name);
  
  factory SaveFileTextCallback.friendly(SaveFileTextCallbackFriendlyFunction f, {String? name})
    => _SaveFileTextCallbackFriendly(f, name: name);
}

class _SaveFileTextCallback extends SaveFileTextCallback {
  final SaveFileTextCallbackFunction _f;
  _SaveFileTextCallback(this._f, {String? name}) : super(name);

  @override
  SaveFileTextCallbackFunction get function => _f;
}

class _SaveFileTextCallbackFriendly extends SaveFileTextCallback {
  final SaveFileTextCallbackFriendlyFunction _f;
  _SaveFileTextCallbackFriendly(this._f, {String? name}) : super(name);

  @override
  SaveFileTextCallbackFunction get function => (fileName, text) {
    return _f(fileName.toDartString(), text.toDartString());
  };
}