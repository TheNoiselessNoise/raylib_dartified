import 'package:raylib_dartified/abbr/dart.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  test('Temp.scalarAlloc<RInt>()', () => expect(Temp.scalarAlloc<RInt>(), isA<RaylibTempScalarAllocator>()));
  test('Temp.scalarAlloc(const RInt())', () => expect(Temp.scalarAlloc(const RInt()), isA<RaylibTempScalarAllocator>()));
  test('Temp.scalarAlloc(RInt)', () => expect(Temp.scalarAlloc(RInt), isA<RaylibTempScalarAllocator>()));

  test('Temp.structAlloc<Vector2>()', () => expect(Temp.structAlloc<Vector2>(), isA<RaylibTempStructAllocator<Vector2>>()));
  test('Temp.structAllocUntyped(Vector2)', () => expect(Temp.structAllocUntyped(Vector2), isA<RaylibTempStructAllocator<Vector2>>()));
  test('Temp.structAllocUntyped(Vector2())', () => expect(Temp.structAllocUntyped(Vector2()), isA<RaylibTempStructAllocator<Vector2>>()));

  test('StructTypes.of<Vector2>()', () => expect(StructTypes.of<Vector2>(), isA<StructType<Vector2>>()));
  test('StructTypes.ofUntyped(Vector2)', () => expect(StructTypes.ofUntyped(Vector2), isA<StructType<Vector2>>()));
  test('StructTypes.ofUntyped(Vector2())', () => expect(StructTypes.ofUntyped(Vector2()), isA<StructType<Vector2>>()));

  tearDownAll(disposeRaylib);
}