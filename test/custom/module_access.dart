import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  test("ffi / flat / dart", () {
    final ffiColor = getModule<RaylibCore>()
      .GetColor(0xFF00FF00)
      .toDart(Color$.$newPtr.asNativePointer());

    final flatColor = getModule<RaylibCoreFlat>() 
      .GetColor(0xFF00FF00);

    final dartColor = getModule<RaylibCoreDart>()
      .GetColor(0xFF00FF00);

    expect(ffiColor.toString(), equals(flatColor.toString()));
    expect(ffiColor.toString(), equals(dartColor.toString()));
  });
}