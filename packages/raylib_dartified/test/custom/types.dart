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

  test('XStructDefinitions.of<Vector2>()', () => expect(XStructDefinitions.of<Vector2>(), isA<XStructDef<Vector2>>()));
  test('XStructDefinitions.ofUntyped(Vector2)', () => expect(XStructDefinitions.ofUntyped(Vector2), isA<XStructDef<Vector2>>()));
  test('XStructDefinitions.ofUntyped(Vector2())', () => expect(XStructDefinitions.ofUntyped(Vector2()), isA<XStructDef<Vector2>>()));

  tearDownAll(disposeRaylib);
}