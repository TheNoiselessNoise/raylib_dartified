part of '../../../raylib_dartified_web.dart';

// TraceLogCallback

typedef _TraceLogCallbackFunction = void Function(
  int logLevel,
  int textPtr,
  int argsPtr,
);

abstract class TraceLogCallback extends TraceLogCallbackBase {
  TraceLogCallback([super.name]);

  /// The actual trampoline.
  _TraceLogCallbackFunction get _rawFunction =>
    (int logLevel, int textPtr, int argsPtr) =>
      function(
        logLevel,
        XWasmPtr(textPtr),
        XWasmPtr(argsPtr),
      );

  late final int _funcIndex;

  @override
  XPtr<XFunction<TraceLogCallbackBase>> initializer() {
    _funcIndex = WasmMemory.addFunction(
      _rawFunction.toJS,
      'vipp',
    );
    return XWasmPtr(_funcIndex);
  }
  
  @override
  void dispose() {
    WasmMemory.removeFunction(_funcIndex);
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

typedef _LoadFileDataCallbackFunction = int Function(
  int fileNamePtr, // Pointer<Char>
  int dataSizePtr, // Pointer<Int>
);

abstract class LoadFileDataCallback extends LoadFileDataCallbackBase {
  LoadFileDataCallback([super.name]);

  /// The actual trampoline.
  _LoadFileDataCallbackFunction get _rawFunction =>
    (int fileNamePtr, int dataSizePtr) => function(
      XWasmPtr(fileNamePtr),
      XWasmPtr(dataSizePtr),
    ).address;

  late final int _funcIndex;

  @override
  XPtr<XFunction<LoadFileDataCallbackBase>> initializer() {
    _funcIndex = WasmMemory.addFunction(
      _rawFunction.toJS,
      'ipp',
    );
    return XWasmPtr(_funcIndex);
  }
  
  @override
  void dispose() {
    WasmMemory.removeFunction(_funcIndex);
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

// returnType: bool
typedef _SaveFileDataCallbackFunction = int Function(
  int fileNamePtr, // Pointer<Char>
  int dataPtr, // Pointer<Void>
  int dataSize,
);

abstract class SaveFileDataCallback extends SaveFileDataCallbackBase {
  SaveFileDataCallback([super.name]);

  /// The actual trampoline.
  _SaveFileDataCallbackFunction get _rawFunction =>
    (int fileNamePtr, int dataPtr, int dataSize) =>
      function(
        XWasmPtr(fileNamePtr),
        XWasmPtr(dataPtr),
        dataSize
      ).toInt();

  late final int _funcIndex;

  @override
  XPtr<XFunction<SaveFileDataCallbackBase>> initializer() {
    _funcIndex = WasmMemory.addFunction(
      _rawFunction.toJS,
      'ippi',
    );
    return XWasmPtr(_funcIndex);
  }
  
  @override
  void dispose() {
    WasmMemory.removeFunction(_funcIndex);
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

// returnType: Pointer<Char>
typedef _LoadFileTextCallbackFunction = int Function(
  int fileNamePtr, // Pointer<Char>
);

abstract class LoadFileTextCallback extends LoadFileTextCallbackBase {
  LoadFileTextCallback([super.name]);

  /// The actual trampoline.
  _LoadFileTextCallbackFunction get _rawFunction =>
    (int fileNamePtr) {
      final result = function(
        XWasmPtr(fileNamePtr),
      );
      if (result.isNull) return 0;
      return result.address;
    };

  late final int _funcIndex;

  @override
  XPtr<XFunction<LoadFileTextCallbackBase>> initializer() {
    _funcIndex = WasmMemory.addFunction(
      _rawFunction.toJS,
      'pp',
    );
    return XWasmPtr(_funcIndex);
  }
  
  @override
  void dispose() {
    WasmMemory.removeFunction(_funcIndex);
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
    return XWasmPtr(WasmMemory.allocString(_f(fileName.toDartString())));
  };
}

// SaveFileTextCallback

// returnType: bool
typedef _SaveFileTextCallbackFunction = int Function(
  int fileNamePtr, // Pointer<Char>
  int textPtr, // Pointer<Char>
);

abstract class SaveFileTextCallback extends SaveFileTextCallbackBase {
  SaveFileTextCallback([super.name]);

  /// The actual trampoline.
  _SaveFileTextCallbackFunction get _rawFunction =>
    (int fileNamePtr, int textPtr) =>
      function(
        XWasmPtr(fileNamePtr),
        XWasmPtr(textPtr),
      ).toInt();

  late final int _funcIndex;

  @override
  XPtr<XFunction<SaveFileTextCallbackBase>> initializer() {
    _funcIndex = WasmMemory.addFunction(
      _rawFunction.toJS,
      'ipp',
    );
    return XWasmPtr(_funcIndex);
  }
  
  @override
  void dispose() {
    WasmMemory.removeFunction(_funcIndex);
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