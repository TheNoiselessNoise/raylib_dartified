part of '../raylib_dartified_unhinged.dart';

typedef MapData<T> = Map<String, T>;
typedef MapDataEntry<T> = MapEntry<String, T>;

class _MapUtils {
  static void mergeMaps(Map original, Map updates) {
    updates.forEach((key, value) {
      if (value is Map && original[key] is Map) {
        mergeMaps(original[key], value);
      } else {
        original[key] = value;
      }
    });
  }

  static dynamic mapListSetter(dynamic json, String path, dynamic value) {
    if (json == null) return null;
    if (path.isEmpty) return value;
    String pathPart = path.contains('.') ? path.split('.').first : path;

    if (json is Map) {
      if (json.containsKey(pathPart)) {
        if (path.contains('.')) {
          json[pathPart] = mapListSetter(json[pathPart], path.split('.').sublist(1).join('.'), value);
        } else {
          json[pathPart] = value;
        }
      }
    }

    if (json is List) {
      int pathIndex = int.tryParse(pathPart) ?? -1;
      if (pathIndex < 0) return null;
      if (pathIndex >= json.length) return null;
      if (path.contains('.')) {
        json[pathIndex] = mapListSetter(json[pathIndex], path.split('.').sublist(1).join('.'), value);
      } else {
        json[pathIndex] = value;
      }
    }

    return json;
  }

  static dynamic mapListWalker(dynamic json, String path) {
    if (json == null) return null;
    if (path.isEmpty) return json;
    String pathPart = path.contains('.') ? path.split('.').first : path;

    if (json is Map) {
      if (json.containsKey(pathPart)) {
        if (path.contains('.')) {
          return mapListWalker(json[pathPart], path.split('.').sublist(1).join('.'));
        } else {
          return json[pathPart];
        }
      }
    }

    if (json is List) {
      int pathIndex = int.tryParse(pathPart) ?? -1;
      if (pathIndex < 0) return null;
      if (pathIndex >= json.length) return null;
      if (path.contains('.')) {
        return mapListWalker(json[pathIndex], path.split('.').sublist(1).join('.'));
      } else {
        return json[pathIndex];
      }
    }

    return null;
  }
}

class MapTraversable<T> {
  const MapTraversable([this.data = const {}]);

  final MapData<T> data;
  bool get hasData => data.isNotEmpty;
  Map get dataCopy => .from(data);
  Iterable<MapDataEntry<T>> get entries => data.entries;

  bool has(String path) => _MapUtils.mapListWalker(data, path) != null;

  bool __isDataEmpty(dynamic test) {
    if (test is String) return test.isEmpty;
    if (test is List) return test.isEmpty;
    if (test is Map) return test.isEmpty;
    if (test == null) return true;
    return false;
  }

  Map changesOf(Map newData, [
    bool includeNonExistingKeys = false,
    bool Function(dynamic)? testFunc,
  ]) {
    if (newData.isEmpty) return {};

    bool Function(dynamic) isDataEmpty = testFunc ?? __isDataEmpty;

    Map changes = {};
    for (String key in newData.keys) {
      if (!includeNonExistingKeys && !data.containsKey(key)) continue;

      dynamic oldValue = data[key];
      dynamic newValue = newData[key];

      if (isDataEmpty(oldValue) && isDataEmpty(newValue)) continue;

      if (data[key] != newData[key]) {
        changes[key] = newData[key];
      }
    }

    return changes;
  }

  bool hasKey(String path, [String? key]) {
    if (key == null) return data.containsKey(path);
    dynamic value = _MapUtils.mapListWalker(data, path);
    return value is Map && value.containsKey(key);
  }

  void set(String path, dynamic value) {
    _MapUtils.mapListSetter(data, path, value);
  }

  dynamic get(String path) => _MapUtils.mapListWalker(data, path);

  String getString(String path, [String defaultValue = '']) {
    final value = get(path);
    if (value is String) return value;
    return defaultValue;
  }

  String? getStringOrNull(String path, [String? defaultValue]) {
    final value = get(path);
    if (value == null) return defaultValue;
    return value.toString();
  }

  int getInt(String path, [int defaultValue = 0]) {
    return getIntOrNull(path, defaultValue) ?? defaultValue;
  }

  int? getIntOrNull(String path, [int? defaultValue]) {
    final value = get(path);
    if (value == null) return defaultValue;
    if (value is int) return value;
    if (value is double) return value.toInt();
    if (value is String) return .tryParse(value);
    return defaultValue;
  }

  double getDouble(String path, [double defaultValue = 0.0]) {
    return getDoubleOrNull(path, defaultValue) ?? defaultValue;
  }

  double? getDoubleOrNull(String path, [double? defaultValue]) {
    final value = get(path);
    if (value == null) return defaultValue;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return .tryParse(value);
    return defaultValue;
  }

  bool getBool(String path, [bool defaultValue = false]) {
    return getBoolOrNull(path, defaultValue) ?? defaultValue;
  }

  bool? getBoolOrNull(String path, [bool? defaultValue]) {
    final value = get(path);
    if (value == null) return defaultValue;
    if (value is bool) return value;
    if (value is String) return value.toLowerCase().trim() == 'true';
    return defaultValue;
  }

  DateTime getDateTime(String path, [DateTime? defaultValue]) {
    return getDateTimeOrNull(path, defaultValue) ?? .now();
  }

  DateTime? getDateTimeOrNull(String path, [DateTime? defaultValue]) {
    final value = get(path);
    if (value == null) return defaultValue;
    if (value is DateTime) return value;
    if (value is String) return .tryParse(value) ?? defaultValue;
    if (value is int) return .fromMillisecondsSinceEpoch(value);
    return defaultValue;
  }

  List<X>? _getEnumValues<X extends Enum>(String path, List<X> values) {
    final value = get(path);
    if (value == null) return null;
    if (value is! String) return null;
    if (!values.any((e) => e.toString() == value)) return null;
    return values.where((e) => e.toString() == value).toList();
  }

  X getEnum<X extends Enum>(String path, List<X> values, [X? defaultValue]) {
    final processed = _getEnumValues(path, values);
    if (processed == null) return defaultValue ?? values.first;
    return processed.first;
  }

  X? getEnumOrNull<X extends Enum>(String path, List<X> values, [X? defaultValue]) {
    final processed = _getEnumValues(path, values);
    if (processed == null) return defaultValue;
    return processed.firstOrNull;
  }

  Map<String, X> getMap<X>(String path, [Map<String, X> defaultValue = const {}]) {
    dynamic value = get(path);
    if (value == null) return defaultValue;
    if (value is MapTraversable) return .from(value.data);
    if (value is! Map) return defaultValue;
    return .from(value);
  }

  MapTraversable<X> getMapTraversable<X>(String path, [Map<String, X> defaultValue = const {}])
    => .new(getMap(path, defaultValue));

  List<X> getList<X>(String path, [List<X> defaultValue = const []]) {
    final value = get(path);
    if (value is List) return .from(value);
    return defaultValue;
  }

  List<X>? getListOrNull<X>(String path, [List<X>? defaultValue]) {
    final value = get(path);
    if (value is List) return .from(value);
    return null;
  }

  MapTraversable merge([MapTraversable? other]) {
    MapData oldData = .from(data);
    _MapUtils.mergeMaps(oldData, other?.data ?? {});
    return .new(oldData);
  }
}