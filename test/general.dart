import 'package:raylib_dartified_base/core/raylib_dartified_base.dart';
import 'package:test/test.dart';
import 'mocks.dart';

void main() {
  initMocks();

  group('MockTestStruct', () {
    test('layout offsets and alignment', () {
      expect(MockTestStruct.structLayout.offset(.a), 0);
      expect(MockTestStruct.structLayout.offset(.ptrField), 8);
      expect(MockTestStruct.structLayout.offset(.b), 16);
      expect(MockTestStruct.byteSize, 24); // 4(a) + 4 pad + 8(ptr) + 4(b) + 4 pad
      expect(MockTestStruct.alignment, 8);
    });

    test('writeInto/readFrom round-trip, including pointer field', () {
      final data = MemoryPointer.malloc<RInt32>(RInt32.scalarByteSize * 4);
      addTearDown(() => data.free());
      data.writeArray([10, 20, 30, 40]);

      final buf = MemoryPointer.malloc(MockTestStruct.byteSize);
      addTearDown(() => buf.free());

      final src = MockTestStruct(a: 1, ptrField: data, b: 2);
      src.structWriteInto(buf.cast());

      final dst = MockTestStruct.zero();
      dst.structReadFrom(buf.cast());

      expect(dst.a, 1);
      expect(dst.b, 2);
      expect(dst.ptrField.address, data.address);
      expect(dst.ptrField.readArray(4), [10, 20, 30, 40]);
    });

    test('live struct reflects backing memory (structOnOp)', () {
      final buf = MemoryPointer.malloc(MockTestStruct.byteSize);
      addTearDown(() => buf.free());

      final s = MockTestStruct.pointer(buf).ref;
      s.a = 42;
      expect(buf.readUint32(MockTestStruct.structLayout.offset(.a)), 42);

      buf.writeUint32(99, MockTestStruct.structLayout.offset(.a));
      expect(s.a, 99);

      final otherData = MemoryPointer.malloc<RInt32>(RInt32.scalarByteSize);
      addTearDown(() => otherData.free());
      buf.writePtr(otherData, MockTestStruct.structLayout.offset(.ptrField));
      expect(s.ptrField.address, otherData.address);
    });
  });
}