part of 'raylib_dartified.dart';

extension CharPointerEx on Pointer<Char> {
  String get toDart => cast<Utf8>().toDartString();
}

extension GetStringFromArrayChar on Array<Char> {
  String toDartString(int length) {
    final units = List.generate(length, (i) => this[i]);
    final end = units.indexOf(0);
    return .fromCharCodes(end == -1 ? units : units.sublist(0, end));
  }

  void setDartString(String value, [int? maxLength]) {
    final bytes = utf8.encode(value);
    final len = bytes.length.clamp(0, (maxLength ?? value.length) - 1);
    for (int i = 0; i < len; i++) this[i] = bytes[i];
    this[len] = 0;
  }
}