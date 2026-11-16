part of '../../raylib_dartified_base.dart';

// void (XInt, XPtr<Char>, XPtr<Void>)
/// User-facing `TraceLogCallback` signature.
typedef TraceLogCallbackFunction = void Function(
  int logLevel,
  XPtr<XChar> text,
  XPtr<XVoid> va,
);

typedef TraceLogCallbackFriendlyFunction = void Function(
  TraceLogLevel logLevel,
  String text,
);

/// Raylib's `TraceLogCallback` callback.
abstract class TraceLogCallbackBase extends RaylibCallback<TraceLogCallbackBase, TraceLogCallbackFunction> {
  TraceLogCallbackBase([super.name]);
  static final Map<int, TraceLogCallbackBase> callbackRegistry = {};
  @override @nonVirtual get registry => callbackRegistry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(callbackRegistry);
}

// XPtr<UnsignedChar> (XPtr<Char>, XPtr<Int>)
/// User-facing `LoadFileDataCallback` signature.
typedef LoadFileDataCallbackFunction = XPtr<XUnsignedChar> Function(
  XPtr<XChar> fileName,
  XPtr<XInt> dataSize,
);

// XPtr<UnsignedChar> (String, XPtr<Int>)
typedef LoadFileDataCallbackFriendlyFunction = XPtr<XUnsignedChar> Function(
  String fileName,
  XPtr<XInt> dataSize,
);

/// Raylib's `LoadFileDataCallback` callback.
abstract class LoadFileDataCallbackBase extends RaylibCallback<LoadFileDataCallbackBase, LoadFileDataCallbackFunction> {
  LoadFileDataCallbackBase([super.name]);
  static final Map<int, LoadFileDataCallbackBase> callbackRegistry = {};
  @override @nonVirtual get registry => callbackRegistry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(callbackRegistry);
}

// bool (XPtr<Char>, XPtr<Void>, Int)
/// User-facing `SaveFileDataCallback` signature.
typedef SaveFileDataCallbackFunction = bool Function(
  XPtr<XChar> fileName,
  XPtr<XVoid> data,
  int dataSize,
);

// bool (String, XPtr<Void>, Int)
typedef SaveFileDataCallbackFriendlyFunction = bool Function(
  String fileName,
  XPtr<XVoid> data,
  int dataSize,
);

/// Raylib's `SaveFileDataCallback` callback.
abstract class SaveFileDataCallbackBase extends RaylibCallback<SaveFileDataCallbackBase, SaveFileDataCallbackFunction> {
  SaveFileDataCallbackBase([super.name]);
  static final Map<int, SaveFileDataCallbackBase> callbackRegistry = {};
  @override @nonVirtual get registry => callbackRegistry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(callbackRegistry);
}

// XPtr<Char> (XPtr<Char>)
/// User-facing `LoadFileTextCallback` signature.
typedef LoadFileTextCallbackFunction = XPtr<XChar> Function(
  XPtr<XChar> fileName,
);

typedef LoadFileTextCallbackFriendlyFunction = String Function(
  String fileName,
);

/// Raylib's `LoadFileTextCallback` callback.
abstract class LoadFileTextCallbackBase extends RaylibCallback<LoadFileTextCallbackBase, LoadFileTextCallbackFunction> {
  LoadFileTextCallbackBase([super.name]);
  static final Map<int, LoadFileTextCallbackBase> callbackRegistry = {};
  @override @nonVirtual get registry => callbackRegistry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(callbackRegistry);
}

// bool (XPtr<Char>, XPtr<Char>)
/// User-facing `SaveFileTextCallback` signature.
typedef SaveFileTextCallbackFunction = bool Function(
  XPtr<XChar> fileName,
  XPtr<XChar> text,
);

typedef SaveFileTextCallbackFriendlyFunction = bool Function(
  String fileName,
  String text,
);

/// Raylib's `SaveFileTextCallback` callback.
abstract class SaveFileTextCallbackBase extends RaylibCallback<SaveFileTextCallbackBase, SaveFileTextCallbackFunction> {
  SaveFileTextCallbackBase([super.name]);
  static final Map<int, SaveFileTextCallbackBase> callbackRegistry = {};
  @override @nonVirtual get registry => callbackRegistry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(callbackRegistry);
}