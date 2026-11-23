part of '../../../backend.dart';

// TraceLogCallback

abstract class TraceLogCallback extends TraceLogCallbackBase {
  TraceLogCallback([super.name]);

  factory TraceLogCallback.function(TraceLogCallbackFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for TraceLogCallback.function.');

  factory TraceLogCallback.friendly(TraceLogCallbackFriendlyFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for TraceLogCallback.friendly.');
}

// LoadFileDataCallback

abstract class LoadFileDataCallback extends LoadFileDataCallbackBase {
  LoadFileDataCallback([super.name]);

  factory LoadFileDataCallback.function(LoadFileDataCallbackFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for LoadFileDataCallback.function.');

  factory LoadFileDataCallback.friendly(LoadFileDataCallbackFriendlyFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for LoadFileDataCallback.friendly.');
}

// SaveFileDataCallback

abstract class SaveFileDataCallback extends SaveFileDataCallbackBase {
  SaveFileDataCallback([super.name]);

  factory SaveFileDataCallback.function(SaveFileDataCallbackFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for SaveFileDataCallback.function.');

  factory SaveFileDataCallback.friendly(SaveFileDataCallbackFriendlyFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for SaveFileDataCallback.friendly.');
}

// LoadFileTextCallback

abstract class LoadFileTextCallback extends LoadFileTextCallbackBase {
  LoadFileTextCallback([super.name]);

  factory LoadFileTextCallback.function(LoadFileTextCallbackFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for LoadFileTextCallback.function.');

  factory LoadFileTextCallback.friendly(LoadFileTextCallbackFriendlyFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for LoadFileTextCallback.friendly.');
}

// SaveFileTextCallback

abstract class SaveFileTextCallback extends SaveFileTextCallbackBase {
  SaveFileTextCallback([super.name]);

  factory SaveFileTextCallback.function(SaveFileTextCallbackFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for SaveFileTextCallback.function.');
  
  factory SaveFileTextCallback.friendly(SaveFileTextCallbackFriendlyFunction f, {String? name})
    => throw UnsupportedError('Invalid platform for SaveFileTextCallback.friendly.');
}