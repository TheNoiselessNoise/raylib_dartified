part of '../raylib_dartified_unhinged.dart';

sealed class FieldDescriptor {
  const FieldDescriptor({required this.nullable});

  final bool nullable;
  bool get isSettable;

  String asString();
}

final class StringFieldDescriptor extends FieldDescriptor {
  final String? Function() getter;
  final void Function(String?)? setter;

  const StringFieldDescriptor._(this.getter, this.setter, {required super.nullable});

  factory StringFieldDescriptor(String Function() get, [void Function(String)? set]) => ._(
    get, set == null ? null : (v) => set(v ?? ''),
    nullable: false,
  );

  factory StringFieldDescriptor.nullable(String? Function() get, [void Function(String?)? set]) => ._(
    get, set,
    nullable: true,
  );

  @override
  bool get isSettable => setter != null;

  @override
  String asString() => getter() ?? '';
}

final class BoolFieldDescriptor extends FieldDescriptor {
  final bool Function() getter;
  final void Function(bool)? setter;

  const BoolFieldDescriptor(this.getter, [this.setter]) : super(nullable: false);

  @override
  bool get isSettable => setter != null;

  @override
  String asString() => getter().toString();
}

abstract class NumberFieldDescriptor<X extends num> extends FieldDescriptor {
  final X? Function() getter;
  final void Function(X?)? setter;
  final X? min;
  final X? max;
  final X? step; // null = continuous
  final X defaultValue;

  const NumberFieldDescriptor({
    required this.getter,
    required this.setter,
    required super.nullable,
    this.min,
    this.max,
    this.step,
    required this.defaultValue,
  });

  X get value => getter() ?? min ?? defaultValue;

  @override
  bool get isSettable => setter != null;

  @override
  String asString() => getter().toString();
}

final class DoubleFieldDescriptor extends NumberFieldDescriptor<double> {
  const DoubleFieldDescriptor({
    required super.getter,
    required super.setter,
    required super.nullable,
    super.min,
    super.max,
    super.step,
    super.defaultValue = 0,
  });

  factory DoubleFieldDescriptor.value(
    double Function() get, [
    void Function(double)? set,
    double? min,
    double? max,
    double? step,
    double? defaultValue,
  ]) => .new(
    getter: get,
    setter: set == null ? null : (v) => set(v ?? defaultValue ?? min ?? 0),
    nullable: false,
    min: min,
    max: max,
    step: step,
    defaultValue: defaultValue ?? 0,
  );

  factory DoubleFieldDescriptor.nullable(
    double? Function() get, [
    void Function(double?)? set,
    double? min,
    double? max,
    double? step,
    double? defaultValue,
  ]) => .new(
    getter: get,
    setter: set,
    nullable: true,
    min: min,
    max: max,
    step: step,
    defaultValue: defaultValue ?? 0,
  );
}

final class IntFieldDescriptor extends NumberFieldDescriptor<int> {
  const IntFieldDescriptor({
    required super.getter,
    required super.setter,
    required super.nullable,
    super.min,
    super.max,
    super.step,
    super.defaultValue = 0,
  });

  factory IntFieldDescriptor.value(
    int Function() get, [
    void Function(int)? set,
    int? min,
    int? max,
    int? step,
    int? defaultValue,
  ]) => .new(
    getter: get,
    setter: set == null ? null : (v) => set(v ?? defaultValue ?? min ?? 0),
    nullable: false,
    min: min,
    max: max,
    step: step,
    defaultValue: defaultValue ?? 0,
  );

  factory IntFieldDescriptor.nullable(
    int? Function() get, [
    void Function(int?)? set,
    int? min,
    int? max,
    int? step,
    int? defaultValue,
  ]) => .new(
    getter: get,
    setter: set,
    nullable: true,
    min: min,
    max: max,
    step: step,
    defaultValue: defaultValue ?? 0,
  );
}

class ObjectFieldDescriptor<X> extends FieldDescriptor {
  final X? Function() getter;
  final void Function(X?)? setter;

  Type get type => X;

  const ObjectFieldDescriptor({
    required this.getter,
    required this.setter,
    required super.nullable,
  });

  factory ObjectFieldDescriptor.value(X Function() get, [void Function(X)? set]) => .new(
    getter: get,
    setter: set == null ? null : (v) => set(v ?? get()),
    nullable: false,
  );

  factory ObjectFieldDescriptor.nullable(X? Function() get, [void Function(X?)? set, bool alpha = true]) => .new(
    getter: get,
    setter: set,
    nullable: true,
  );

  @override
  bool get isSettable => setter != null;

  @override
  String asString() => getter().toString();
}

final class ColorFieldDescriptor extends ObjectFieldDescriptor<Color> {
  final bool alpha;

  const ColorFieldDescriptor({
    required super.getter,
    required super.setter,
    required super.nullable,
    required this.alpha,
  });

  factory ColorFieldDescriptor.value(Color Function() get, [void Function(Color)? set, bool alpha = true]) => .new(
    getter: get,
    setter: set == null ? null : (v) => set(v ?? get()),
    nullable: false,
    alpha: alpha,
  );

  factory ColorFieldDescriptor.nullable(Color? Function() get, [void Function(Color?)? set, bool alpha = true]) => .new(
    getter: get,
    setter: set,
    nullable: true,
    alpha: alpha,
  );
}

class ObjectDescriptor<T extends App<T>> {
  final Map<String, FieldDescriptor> fields = {};

  FieldDescriptor getField<X>(String name) {
    if (!fields.containsKey(name)) throw StateError(
      "Field descriptor for '$name' does not exist."
    );
    return fields[name]!;
  }

  FieldDescriptor addField<X>(String name, FieldDescriptor descriptor) {
    if (fields.containsKey(name)) throw StateError(
      "Field descriptor for '$name' already exist."
    );
    return fields[name] = descriptor;
  }
}