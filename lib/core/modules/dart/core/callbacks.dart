part of '../../../raylib.dart';

// LoadFileDataCallback

typedef LoadFileDataCallbackFunctionD = Pointer<UnsignedChar> Function(
  Pointer<Char> fileName,
  Pointer<Int> dataSize,
);

abstract class LoadFileDataCallbackD extends CallbackD<
  LoadFileDataCallbackFunctionC,
  LoadFileDataCallbackFunctionD
> {
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
}

class _LoadFileDataCallbackD extends LoadFileDataCallbackD {
  final LoadFileDataCallbackFunctionD _f;
  _LoadFileDataCallbackD(this._f, {String? name}) : super(name);

  @override
  LoadFileDataCallbackFunctionD get function => _f;
}

// SaveFileDataCallback

typedef SaveFileDataCallbackFunctionD = bool Function(
  Pointer<Char> fileName,
  Pointer<Void> data,
  int dataSize,
);

abstract class SaveFileDataCallbackD extends CallbackD<
  SaveFileDataCallbackFunctionC,
  SaveFileDataCallbackFunctionD
> {
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
}

class _SaveFileDataCallbackD extends SaveFileDataCallbackD {
  final SaveFileDataCallbackFunctionD _f;
  _SaveFileDataCallbackD(this._f, {String? name}) : super(name);

  @override
  SaveFileDataCallbackFunctionD get function => _f;
}

// LoadFileTextCallback

typedef LoadFileTextCallbackFunctionD = Pointer<Char> Function(Pointer<Char> fileName);

abstract class LoadFileTextCallbackD extends CallbackD<
  LoadFileTextCallbackFunctionC,
  LoadFileTextCallbackFunctionD
> {
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
}

class _LoadFileTextCallbackD extends LoadFileTextCallbackD {
  final LoadFileTextCallbackFunctionD _f;
  _LoadFileTextCallbackD(this._f, {String? name}) : super(name);

  @override
  LoadFileTextCallbackFunctionD get function => _f;
}

// SaveFileTextCallback

typedef SaveFileTextCallbackFunctionD = bool Function(
  Pointer<Char> fileName,
  Pointer<Char> text,
);

abstract class SaveFileTextCallbackD extends CallbackD<
  SaveFileTextCallbackFunctionC,
  SaveFileTextCallbackFunctionD
> {
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
}

class _SaveFileTextCallbackD extends SaveFileTextCallbackD {
  final SaveFileTextCallbackFunctionD _f;
  _SaveFileTextCallbackD(this._f, {String? name}) : super(name);

  @override
  SaveFileTextCallbackFunctionD get function => _f;
}