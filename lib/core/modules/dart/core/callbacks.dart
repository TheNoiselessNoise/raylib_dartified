part of '../../../raylib_dartified.dart';

// TraceLogCallback

typedef _TraceLogCallbackFunction = void Function(
  int logLevel,
  Pointer<Char> text,
  Pointer<Void> args,
);

abstract class TraceLogCallbackD extends TraceLogCallbackBase {
  TraceLogCallbackD([super.name]);

  /// The actual trampoline.
  _TraceLogCallbackFunction get _rawFunction =>
    (int logLevel, Pointer<Char> text, Pointer<Void> args) =>
      function(
        logLevel,
        NativeMemoryPointer(text.cast()),
        NativeMemoryPointer(args),
      );

  late final NativeCallable<TraceLogCallbackFunctionC> _callable;

  @override
  MemoryPointer<RFunction> initializer() {
    _callable = .isolateLocal(_rawFunction);
    return NativeMemoryPointer(_callable.nativeFunction.cast());
  }

  @override
  void dispose() {
    super.dispose();
    _callable.close();
  }

  factory TraceLogCallbackD.function(TraceLogCallbackFunction f, {String? name})
    => _TraceLogCallbackD(f, name: name);

  factory TraceLogCallbackD.friendly(TraceLogCallbackFriendlyFunction f, {String? name})
    => _TraceLogCallbackFriendlyD(f, name: name);
}

class _TraceLogCallbackD extends TraceLogCallbackD {
  final TraceLogCallbackFunction _f;
  _TraceLogCallbackD(this._f, {String? name}) : super(name);

  @override
  TraceLogCallbackFunction get function => _f;
}

class _TraceLogCallbackFriendlyD extends TraceLogCallbackD {
  final TraceLogCallbackFriendlyFunction _f;
  _TraceLogCallbackFriendlyD(this._f, {String? name}) : super(name);

  @override
  TraceLogCallbackFunction get function => (int logLevel, MemoryPointer text, MemoryPointer args) {
    return _f(.fromValue(logLevel), text.toDartString());
  };
}

// LoadFileDataCallback

typedef _LoadFileDataCallbackFunction = Pointer<UnsignedChar> Function(
  Pointer<Char> fileName,
  Pointer<Int> dataSize,
);

abstract class LoadFileDataCallbackD extends LoadFileDataCallbackBase {
  LoadFileDataCallbackD([super.name]);

  /// The actual trampoline.
  _LoadFileDataCallbackFunction get _rawFunction =>
    (Pointer<Char> fileName, Pointer<Int> dataSize) {
      final result = function(
        NativeMemoryPointer(fileName.cast()),
        NativeMemoryPointer(dataSize.cast()),
      );
      if (result.isNull) return nullptr;
      return (result as NativeMemoryPointer).asPointer();
    };

  late final NativeCallable<LoadFileDataCallbackFunctionC> _callable;

  @override
  MemoryPointer<RFunction> initializer() {
    _callable = .isolateLocal(_rawFunction);
    return NativeMemoryPointer(_callable.nativeFunction.cast());
  }

  factory LoadFileDataCallbackD.function(LoadFileDataCallbackFunction f, {String? name})
    => _LoadFileDataCallbackD(f, name: name);

  factory LoadFileDataCallbackD.friendly(LoadFileDataCallbackFriendlyFunction f, {String? name})
    => _LoadFileDataCallbackFriendlyD(f, name: name);
}

class _LoadFileDataCallbackD extends LoadFileDataCallbackD {
  final LoadFileDataCallbackFunction _f;
  _LoadFileDataCallbackD(this._f, {String? name}) : super(name);

  @override
  LoadFileDataCallbackFunction get function => _f;
}

class _LoadFileDataCallbackFriendlyD extends LoadFileDataCallbackD {
  final LoadFileDataCallbackFriendlyFunction _f;
  _LoadFileDataCallbackFriendlyD(this._f, {String? name}) : super(name);

  @override
  LoadFileDataCallbackFunction get function => (MemoryPointer<RInt8> fileName, MemoryPointer<RInt32> dataSize) {
    return _f(fileName.toDartString(), dataSize);
  };
}

// SaveFileDataCallback

typedef _SaveFileDataCallbackFunction = bool Function(
  Pointer<Char> fileName,
  Pointer<Void> data,
  int dataSize,
);

abstract class SaveFileDataCallbackD extends SaveFileDataCallbackBase {
  SaveFileDataCallbackD([super.name]);
  
  /// The actual trampoline.
  _SaveFileDataCallbackFunction get _rawFunction =>
    (Pointer<Char> fileName, Pointer<Void> data, int dataSize) =>
      function(
        NativeMemoryPointer(fileName.cast()),
        NativeMemoryPointer(data),
        dataSize
      );

  late final NativeCallable<SaveFileDataCallbackFunctionC> _callable;

  @override
  MemoryPointer<RFunction> initializer() {
    _callable = .isolateLocal(_rawFunction, exceptionalReturn: false);
    return NativeMemoryPointer(_callable.nativeFunction.cast());
  }

  factory SaveFileDataCallbackD.function(SaveFileDataCallbackFunction f, {String? name})
    => _SaveFileDataCallbackD(f, name: name);

  factory SaveFileDataCallbackD.friendly(SaveFileDataCallbackFriendlyFunction f, {String? name})
    => _SaveFileDataCallbackFriendlyD(f, name: name);
}

class _SaveFileDataCallbackD extends SaveFileDataCallbackD {
  final SaveFileDataCallbackFunction _f;
  _SaveFileDataCallbackD(this._f, {String? name}) : super(name);

  @override
  SaveFileDataCallbackFunction get function => _f;
}

class _SaveFileDataCallbackFriendlyD extends SaveFileDataCallbackD {
  final SaveFileDataCallbackFriendlyFunction _f;
  _SaveFileDataCallbackFriendlyD(this._f, {String? name}) : super(name);

  @override
  SaveFileDataCallbackFunction get function => (MemoryPointer<RInt8> fileName, MemoryPointer<RVoid> data, int dataSize) {
    return _f(fileName.toDartString(), data, dataSize);
  };
}

// LoadFileTextCallback

typedef _LoadFileTextCallbackFunction = Pointer<Char> Function(
  Pointer<Char> fileName,
);

abstract class LoadFileTextCallbackD extends LoadFileTextCallbackBase {
  LoadFileTextCallbackD([super.name]);

  /// The actual trampoline.
  _LoadFileTextCallbackFunction get _rawFunction =>
    (Pointer<Char> fileName) {
      final result = function(
        NativeMemoryPointer(fileName.cast()),
      );
      if (result.isNull) return nullptr;
      return (result as NativeMemoryPointer).asPointer();
    };

  late final NativeCallable<LoadFileTextCallbackFunctionC> _callable;

  @override
  MemoryPointer<RFunction> initializer() {
    _callable = .isolateLocal(_rawFunction);
    return NativeMemoryPointer(_callable.nativeFunction.cast());
  }

  factory LoadFileTextCallbackD.function(LoadFileTextCallbackFunction f, {String? name})
    => _LoadFileTextCallbackD(f, name: name);

  factory LoadFileTextCallbackD.friendly(LoadFileTextCallbackFriendlyFunction f, {String? name})
    => _LoadFileTextCallbackFriendlyD(f, name: name);
}

class _LoadFileTextCallbackD extends LoadFileTextCallbackD {
  final LoadFileTextCallbackFunction _f;
  _LoadFileTextCallbackD(this._f, {String? name}) : super(name);

  @override
  LoadFileTextCallbackFunction get function => _f;
}

class _LoadFileTextCallbackFriendlyD extends LoadFileTextCallbackD {
  final LoadFileTextCallbackFriendlyFunction _f;
  _LoadFileTextCallbackFriendlyD(this._f, {String? name}) : super(name);

  @override
  LoadFileTextCallbackFunction get function => (MemoryPointer fileName) {
    return NativeMemoryPointer(_f(fileName.toDartString()).toNativeUtf8().cast());
  };
}

// SaveFileTextCallback

typedef _SaveFileTextCallbackFunction = bool Function(
  Pointer<Char> fileName,
  Pointer<Char> text,
);

abstract class SaveFileTextCallbackD extends SaveFileTextCallbackBase {
  SaveFileTextCallbackD([super.name]);

  /// The actual trampoline.
  _SaveFileTextCallbackFunction get _rawFunction =>
    (Pointer<Char> fileName, Pointer<Char> text) =>
      function(
        NativeMemoryPointer(fileName.cast()),
        NativeMemoryPointer(text.cast()),
      );

  late final NativeCallable<SaveFileTextCallbackFunctionC> _callable;

  @override
  MemoryPointer<RFunction> initializer() {
    _callable = .isolateLocal(_rawFunction, exceptionalReturn: false);
    return NativeMemoryPointer(_callable.nativeFunction.cast());
  }

  factory SaveFileTextCallbackD.function(SaveFileTextCallbackFunction f, {String? name})
    => _SaveFileTextCallbackD(f, name: name);
  
  factory SaveFileTextCallbackD.friendly(SaveFileTextCallbackFriendlyFunction f, {String? name})
    => _SaveFileTextCallbackFriendlyD(f, name: name);
}

class _SaveFileTextCallbackD extends SaveFileTextCallbackD {
  final SaveFileTextCallbackFunction _f;
  _SaveFileTextCallbackD(this._f, {String? name}) : super(name);

  @override
  SaveFileTextCallbackFunction get function => _f;
}

class _SaveFileTextCallbackFriendlyD extends SaveFileTextCallbackD {
  final SaveFileTextCallbackFriendlyFunction _f;
  _SaveFileTextCallbackFriendlyD(this._f, {String? name}) : super(name);

  @override
  SaveFileTextCallbackFunction get function => (MemoryPointer fileName, MemoryPointer text) {
    return _f(fileName.toDartString(), text.toDartString());
  };
}