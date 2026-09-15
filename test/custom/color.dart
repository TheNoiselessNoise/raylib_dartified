import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  test("RaylibStructLiteral (ColorD) - support for backed memory", () {
    final x = 123;
    final ptr = MemoryPointer.malloc(ColorD.struct.byteSize);

    try {
      // Write through memory mirror reference
      final color = ColorD.struct.ptr(ptr).ref;
      color.r = x; color.g = x; color.b = x; color.a = x;

      // Read new instance backed by the exact same native memory pointer
      final other = ColorD.struct.ptr(ptr).ref;

      // 1. Direct field checks
      expect(other.r, equals(x));
      expect(other.g, equals(x));
      expect(other.b, equals(x));
      expect(other.a, equals(x));

      // 2. Real proof of shared backed memory: mutate `color`, verify `other` updates
      color.r = 255;
      expect(other.r, equals(255));
    } finally {
      // Don't forget to free malloc'd memory!
      ptr.free(); // or MemoryPointer.free(ptr);
    }
  });

  tearDownAll(disposeRaylib);
}