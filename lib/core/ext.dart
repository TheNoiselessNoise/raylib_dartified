part of 'raylib.dart';

class DoNotValidate {
  final String reason;
  const DoNotValidate([this.reason = '']);
}

mixin FEnum on Enum {
  int get value;

  bool lt(FEnum o) => value < o.value;
  bool lte(FEnum o) => value <= o.value;
  bool gt(FEnum o) => value > o.value;
  bool gte(FEnum o) => value >= o.value;
  bool eq(FEnum o) => value == o.value;
  bool neq(FEnum o) => value != o.value;
}

extension CString on String {
  @Deprecated('Use rl.Temp.str() instead. toUnsafeC() leaks native memory.')
  Pointer<U> toUnsafeC<U extends NativeType>() => toNativeUtf8().cast<U>();
}

extension CharCodeString on String {
  int get ch => isEmpty ? 0 : codeUnitAt(0);
}

extension CharPointerEx on Pointer<Char> {
  String get toD => cast<Utf8>().toDartString();
}

extension IterableIntEx on Iterable<int> {
  int get or => fold(0, (acc, f) => acc | f);

  String toDartString() => String.fromCharCodes(takeWhile((c) => c != 0));
}

extension IterableFEnumEx on Iterable<FEnum> {
  int get or => map((e) => e.value).or;
}

extension GetStringFromArrayChar on Array<Char> {
  String toD(int length) {
    final units = List.generate(length, (i) => this[i]);
    final end = units.indexOf(0);
    return String.fromCharCodes(end == -1 ? units : units.sublist(0, end));
  }

  void setString(String value, int maxLength) {
    final bytes = utf8.encode(value);
    final len = bytes.length.clamp(0, maxLength - 1);
    for (int i = 0; i < len; i++) this[i] = bytes[i];
    this[len] = 0;
  }
}

extension DoubleFormatting on double {
  String get f0 => toStringAsFixed(0);
  String get f1 => toStringAsFixed(1);
  String get f2 => toStringAsFixed(2);
  String get f3 => toStringAsFixed(3);
  String get f4 => toStringAsFixed(4);
  String get f5 => toStringAsFixed(5);
  String get f6 => toStringAsFixed(6);
}

extension IntHex on int {
  String get hex => toRadixString(16);
  String hexPad([int width = 2]) => hex.padLeft(width, '0');
  String pad([int width = 2, String ch = '0']) => toString().padLeft(width, ch);
}

extension BoolAsInt on bool {
  int toInt() => this ? 1 : 0;
  
  int operator +(int other) => toInt() + other;
  int operator -(int other) => toInt() - other;
  int operator *(int other) => toInt() * other;
  double operator /(int other) => toInt() / other;
  
  bool operator <(int other) => toInt() < other;
  bool operator >(int other) => toInt() > other;
  bool operator <=(int other) => toInt() <= other;
  bool operator >=(int other) => toInt() >= other;
}

extension IntAsBool on int {
  bool toBool() => this != 0;
}