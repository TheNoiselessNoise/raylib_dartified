import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  test("Struct Nested Array - RawArray", () {
    final List<List<ColorD>> colors = [[.RED, .GREEN], [.BLUE, .YELLOW]];
    final pp = Color$.$.RawArray(colors);

    final ptrs = pp.readPtrArray<RStruct>(colors.length);
    for (final (i, p) in ptrs.indexed) {
      final memColors = ColorD.pointer(p).readArray(colors[i].length);
      expect(memColors.toString(), colors[i].toString());
      p.free();
    }
    pp.free();
  });

  test("Struct Nested Array - Array", () {
    final List<List<ColorD>> colors = [[.RED, .GREEN], [.BLUE, .YELLOW]];
    final pp = Color$.$.Array(colors, key: 'mySuperNestedArray');

    final ptrs = pp.readPtrArray<RStruct>(colors.length);
    for (final (i, p) in ptrs.indexed) {
      final memColors = ColorD.pointer(p).readArray(colors[i].length);
      expect(memColors.toString(), colors[i].toString());
    }
  });

  tearDownAll(disposeRaylib);
}