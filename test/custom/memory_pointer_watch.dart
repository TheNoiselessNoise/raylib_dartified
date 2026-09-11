import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  setUpAll(() => bootMemoryBackend());

  group("MemoryPointer watch", () {
    late MemoryPointer ptr;
    int reads = 0;
    int writes = 0;
  
    setUp(() {
      reads = 0;
      writes = 0;
      ptr = MemoryPointer.calloc(1, RFloat32.scalarByteSize);

      MemoryTrace.watchReadAny((_, _, _) => reads++);
      MemoryTrace.watchWriteAny((_, _, _) => writes++);
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

  group("MemoryPointer watch based on address", () {
    late MemoryPointer ptr1;
    late MemoryPointer ptr2;
    int reads = 0;
    int writes = 0;

    setUp(() {
      reads = 0;
      writes = 0;

      ptr1 = MemoryPointer.calloc(1, RFloat32.scalarByteSize);
      ptr2 = MemoryPointer.calloc(1, RFloat32.scalarByteSize);

      MemoryTrace.watchReadAny((ptr, _, _) { if (ptr == ptr1) reads++; });
      MemoryTrace.watchWriteAny((ptr, _, _) { if (ptr == ptr1) writes++; });
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