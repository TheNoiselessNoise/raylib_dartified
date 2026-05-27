part of '../../../raylib_dartified.dart';

// LoadFileDataCallback

typedef LoadFileDataCallbackFunctionD = Pointer<UnsignedChar> Function(
  Pointer<Char> fileName,
  Pointer<Int> dataSize,
);

typedef LoadFileDataCallbackFriendlyFunctionD = Pointer<UnsignedChar> Function(
  String fileName,
  Pointer<Int> dataSize,
);

abstract class LoadFileDataCallbackD extends CallbackD<
  LoadFileDataCallbackFunctionC,
  LoadFileDataCallbackFunctionD
> with LoadFileDataCallbackBase {
  LoadFileDataCallbackD([super.name]);

  static final List<LoadFileDataCallbackD> _registry = [];

  @override
  @nonVirtual
  get registry => _registry;

  @override
  initializer() => .isolateLocal(function);

  static void disposeRegistry() => CallbackD.disposeRegistry(_registry);

  factory LoadFileDataCallbackD.function(LoadFileDataCallbackFunctionD f, {String? name})
    => _LoadFileDataCallbackD(f, name: name);

  factory LoadFileDataCallbackD.friendly(LoadFileDataCallbackFriendlyFunctionD f, {String? name})
    => _LoadFileDataCallbackFriendlyD(f, name: name);
}

class _LoadFileDataCallbackD extends LoadFileDataCallbackD {
  final LoadFileDataCallbackFunctionD _f;
  _LoadFileDataCallbackD(this._f, {String? name}) : super(name);

  @override
  LoadFileDataCallbackFunctionD get function => _f;
}

class _LoadFileDataCallbackFriendlyD extends LoadFileDataCallbackD {
  final LoadFileDataCallbackFriendlyFunctionD _f;
  _LoadFileDataCallbackFriendlyD(this._f, {String? name}) : super(name);

  @override
  LoadFileDataCallbackFunctionD get function => (Pointer<Char> fileName, Pointer<Int> dataSize) {
    return _f(fileName.toD, dataSize);
  };
}

// SaveFileDataCallback

typedef SaveFileDataCallbackFunctionD = bool Function(
  Pointer<Char> fileName,
  Pointer<Void> data,
  int dataSize,
);

typedef SaveFileDataCallbackFriendlyFunctionD = bool Function(
  String fileName,
  Pointer<Void> data,
  int dataSize,
);

abstract class SaveFileDataCallbackD extends CallbackD<
  SaveFileDataCallbackFunctionC,
  SaveFileDataCallbackFunctionD
> with SaveFileDataCallbackBase {
  SaveFileDataCallbackD([super.name]);

  static final List<SaveFileDataCallbackD> _registry = [];

  @override
  @nonVirtual
  get registry => _registry;

  @override
  initializer() => .isolateLocal(function, exceptionalReturn: false);

  static void disposeRegistry() => CallbackD.disposeRegistry(_registry);

  factory SaveFileDataCallbackD.function(SaveFileDataCallbackFunctionD f, {String? name})
    => _SaveFileDataCallbackD(f, name: name);

  factory SaveFileDataCallbackD.friendly(SaveFileDataCallbackFriendlyFunctionD f, {String? name})
    => _SaveFileDataCallbackFriendlyD(f, name: name);
}

class _SaveFileDataCallbackD extends SaveFileDataCallbackD {
  final SaveFileDataCallbackFunctionD _f;
  _SaveFileDataCallbackD(this._f, {String? name}) : super(name);

  @override
  SaveFileDataCallbackFunctionD get function => _f;
}

class _SaveFileDataCallbackFriendlyD extends SaveFileDataCallbackD {
  final SaveFileDataCallbackFriendlyFunctionD _f;
  _SaveFileDataCallbackFriendlyD(this._f, {String? name}) : super(name);

  @override
  SaveFileDataCallbackFunctionD get function => (Pointer<Char> fileName, Pointer<Void> data, int dataSize) {
    return _f(fileName.toD, data, dataSize);
  };
}

// LoadFileTextCallback

typedef LoadFileTextCallbackFunctionD = Pointer<Char> Function(
  Pointer<Char> fileName,
);

typedef LoadFileTextCallbackFriendlyFunctionD = String Function(
  String fileName,
);

abstract class LoadFileTextCallbackD extends CallbackD<
  LoadFileTextCallbackFunctionC,
  LoadFileTextCallbackFunctionD
> with LoadFileTextCallbackBase {
  LoadFileTextCallbackD([super.name]);

  static final List<LoadFileTextCallbackD> _registry = [];

  @override
  @nonVirtual
  get registry => _registry;

  @override
  initializer() => .isolateLocal(function);

  static void disposeRegistry() => CallbackD.disposeRegistry(_registry);

  factory LoadFileTextCallbackD.function(LoadFileTextCallbackFunctionD f, {String? name})
    => _LoadFileTextCallbackD(f, name: name);

  factory LoadFileTextCallbackD.friendly(LoadFileTextCallbackFriendlyFunctionD f, {String? name})
    => _LoadFileTextCallbackFriendlyD(f, name: name);
}

class _LoadFileTextCallbackD extends LoadFileTextCallbackD {
  final LoadFileTextCallbackFunctionD _f;
  _LoadFileTextCallbackD(this._f, {String? name}) : super(name);

  @override
  LoadFileTextCallbackFunctionD get function => _f;
}

class _LoadFileTextCallbackFriendlyD extends LoadFileTextCallbackD {
  final LoadFileTextCallbackFriendlyFunctionD _f;
  _LoadFileTextCallbackFriendlyD(this._f, {String? name}) : super(name);

  @override
  LoadFileTextCallbackFunctionD get function => (Pointer<Char> fileName) {
    return Raylib.instance.Temp.String$.Value(_f(fileName.toD));
  };
}

// SaveFileTextCallback

typedef SaveFileTextCallbackFunctionD = bool Function(
  Pointer<Char> fileName,
  Pointer<Char> text,
);

typedef SaveFileTextCallbackFriendlyFunctionD = bool Function(
  String fileName,
  String text,
);

abstract class SaveFileTextCallbackD extends CallbackD<
  SaveFileTextCallbackFunctionC,
  SaveFileTextCallbackFunctionD
> with SaveFileTextCallbackBase {
  SaveFileTextCallbackD([super.name]);

  static final List<SaveFileTextCallbackD> _registry = [];

  @override
  @nonVirtual
  get registry => _registry;

  @override
  initializer() => .isolateLocal(function, exceptionalReturn: false);

  static void disposeRegistry() => CallbackD.disposeRegistry(_registry);

  factory SaveFileTextCallbackD.function(SaveFileTextCallbackFunctionD f, {String? name})
    => _SaveFileTextCallbackD(f, name: name);
  
  factory SaveFileTextCallbackD.friendly(SaveFileTextCallbackFriendlyFunctionD f, {String? name})
    => _SaveFileTextCallbackFriendlyD(f, name: name);
}

class _SaveFileTextCallbackD extends SaveFileTextCallbackD {
  final SaveFileTextCallbackFunctionD _f;
  _SaveFileTextCallbackD(this._f, {String? name}) : super(name);

  @override
  SaveFileTextCallbackFunctionD get function => _f;
}

class _SaveFileTextCallbackFriendlyD extends SaveFileTextCallbackD {
  final SaveFileTextCallbackFriendlyFunctionD _f;
  _SaveFileTextCallbackFriendlyD(this._f, {String? name}) : super(name);

  @override
  SaveFileTextCallbackFunctionD get function => (Pointer<Char> fileName, Pointer<Char> text) {
    return _f(fileName.toD, text.toD);
  };
}