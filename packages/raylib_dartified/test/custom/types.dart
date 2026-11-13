import 'package:raylib_dartified/abbr/dart.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  test('XTemp.instance.scalarAlloc<XInt>()', () => expect(XTemp.instance.scalarAlloc<XInt>(), isA<XScalarAlloc>()));
  test('XTemp.instance.scalarAlloc(const XInt())', () => expect(XTemp.instance.scalarAlloc(const XInt()), isA<XScalarAlloc>()));
  test('XTemp.instance.scalarAlloc(XInt)', () => expect(XTemp.instance.scalarAlloc(XInt), isA<XScalarAlloc>()));

  test('XTemp.instance.structAlloc<Vector2>()', () => expect(XTemp.instance.structAlloc<Vector2>(), isA<XStructAlloc<Vector2>>()));
  test('XTemp.instance.structAllocUntyped(Vector2)', () => expect(XTemp.instance.structAllocUntyped(Vector2), isA<XStructAlloc<Vector2>>()));
  test('XTemp.instance.structAllocUntyped(Vector2())', () => expect(XTemp.instance.structAllocUntyped(Vector2()), isA<XStructAlloc<Vector2>>()));

  test('XStructTypes.of<Vector2>()', () => expect(XStructTypes.of<Vector2>(), isA<XStructType<Vector2>>()));
  test('XStructTypes.ofUntyped(Vector2)', () => expect(XStructTypes.ofUntyped(Vector2), isA<XStructType<Vector2>>()));
  test('XStructTypes.ofUntyped(Vector2())', () => expect(XStructTypes.ofUntyped(Vector2()), isA<XStructType<Vector2>>()));

  tearDownAll(disposeRaylib);
}