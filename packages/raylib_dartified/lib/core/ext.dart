part of 'raylib_dartified.dart';

/// Convenience getters for formatting a [double] to a fixed number of decimal places.
extension DoubleFormatting on double {
  /// Formats this value to 0 decimal places.
  String get f0 => toStringAsFixed(0);
  /// Formats this value to 1 decimal place.
  String get f1 => toStringAsFixed(1);
  /// Formats this value to 2 decimal places.
  String get f2 => toStringAsFixed(2);
  /// Formats this value to 3 decimal places.
  String get f3 => toStringAsFixed(3);
  /// Formats this value to 4 decimal places.
  String get f4 => toStringAsFixed(4);
  /// Formats this value to 5 decimal places.
  String get f5 => toStringAsFixed(5);
  /// Formats this value to 6 decimal places.
  String get f6 => toStringAsFixed(6);
}

extension CString on String {
  @Deprecated('Use String\$.Value() instead. toUnsafeC() leaks memory.')
  XPtr<X> toUnsafeC<X extends XType>([int? bufferSize])
    => .fromString(this, bufferSize).cast();
}

extension CharCodeString on String {
  int get ch => isEmpty ? 0 : codeUnitAt(0);
}

extension IterableIntEx on Iterable<int> {
  int get or => fold(0, (acc, f) => acc | f);

  String toDartString() => .fromCharCodes(takeWhile((c) => c != 0));
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