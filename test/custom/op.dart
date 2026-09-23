import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late Vector2D vec21;
  late Vector2D vec22;
  setUp(() {
    vec21 = .new();
    vec22 = .new();
  });

  test("op - shared ref", () {
    Vector2$.Ref1(vec21);
    Vector2$.Ref1(vec22);
    expect(vec21.op, isNotNull);
    expect(vec22.op, isNotNull);
    expect(vec21.getOp().address, equals(vec22.getOp().address));

    double value = 10;
    vec21.x = value;
    expect(vec22.x, equals(value));
  });

  test("op - unique ref", () {
    Vector2$.Ref1(vec21);
    Vector2$.Ref2(vec22);
    expect(vec21.op, isNotNull);
    expect(vec22.op, isNotNull);
    expect(vec21.getOp().address, isNot(equals(vec22.getOp().address)));
  });

  test("op - unique ref (by tag)", () {
    vec21.structSetTag('vec21');
    Vector2$.Ref1(vec21);
    vec22.structSetTag('vec22');
    Vector2$.Ref1(vec22); // using the same `Ref1`
    expect(vec21.op, isNotNull);
    expect(vec22.op, isNotNull);
    expect(vec21.getOp().address, isNot(equals(vec22.getOp().address)));
  });
  
  tearDownAll(disposeRaylib);
}