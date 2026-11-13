import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';
import 'package:xffi_native/xffi_native.dart';

void main() {
  setUpAll(() => bootMemoryBackend());

  group("XPtr watch", () {
    late XPtr ptr;
    int reads = 0;
    int writes = 0;
  
    setUp(() {
      reads = 0;
      writes = 0;
      ptr = XPtr.calloc(1, XFloat32.size);

      XTrace.watchReadAny((_, _, _) => reads++);
      XTrace.watchWriteAny((_, _, _) => writes++);
    });

    tearDown(() => ptr.free());

    test("reads", () {
      ptr.readFloat32();
      ptr.readFloat32();
      ptr.readFloat32();
      expect(reads, equals(3));
    });

    test("writes", () {
      ptr.writeFloat32(0);
      ptr.writeFloat32(0);
      ptr.writeFloat32(0);
      expect(writes, equals(3));
    });
  });

  group("XPtr watch based on address", () {
    late XPtr ptr1;
    late XPtr ptr2;
    int reads = 0;
    int writes = 0;

    setUp(() {
      reads = 0;
      writes = 0;

      ptr1 = XPtr.calloc(1, XFloat32.size);
      ptr2 = XPtr.calloc(1, XFloat32.size);

      XTrace.watchReadAny((ptr, _, _) { if (ptr == ptr1) reads++; });
      XTrace.watchWriteAny((ptr, _, _) { if (ptr == ptr1) writes++; });
    });

    tearDown(() {
      ptr1.free();
      ptr2.free();
    });

    test("reads", () {
      ptr1.readFloat32();
      ptr1.readFloat32();
      ptr1.readFloat32();
      ptr2.readFloat32();
      ptr2.readFloat32();
      ptr2.readFloat32();
      expect(reads, equals(3));
    });

    test("writes", () {
      ptr1.writeFloat32(0);
      ptr1.writeFloat32(0);
      ptr1.writeFloat32(0);
      ptr2.writeFloat32(0);
      ptr2.writeFloat32(0);
      ptr2.writeFloat32(0);
      expect(writes, equals(3));
    });
  });
}