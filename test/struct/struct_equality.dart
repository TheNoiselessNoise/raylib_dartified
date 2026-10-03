import 'package:test/test.dart';
import 'package:raylib_dartified_base/abbr/allocators.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  test("Color - compareBytes", () {
    final struct1 = Color$.Allocate(.new()).ref..set(42, 42, 42, 42);
    final struct2 = Color$.Allocate(.new()).ref..set(42, 42, 42, 42);
    final layout = StructTypes.of(struct1);
    final cmp = struct1.getOp().compareBytes(struct2.getOp(), layout.byteSize);
    expect(cmp, equals(0));
  });

  test("Color - direct memory backed comparison", () {
    final struct1 = Color$.Allocate(.new()).ref..set(42, 42, 42, 42);
    final struct2 = Color$.Allocate(.new()).ref..set(42, 42, 42, 42);
    expect(struct1, equals(struct2));
  });

  test("Color - 1 memory backed, 1 dart literal comparison", () {
    final struct1 = Color$.Allocate(.new()).ref..set(42, 42, 42, 42);
    final struct2 = Color.zero();
    struct2.set(42, 42, 42, 42);
    expect(struct1, equals(struct2));
  });

  test("Color - just dart literals comparison", () {
    final struct1 = Color.zero();
    final struct2 = Color.zero();
    expect(struct1, equals(struct2));
  });

  test("Vector2 - positive/negative zero equal (dart literals)", () {
    final v1 = Vector2.zero()..set(0.0, 1.0);
    final v2 = Vector2.zero()..set(-0.0, 1.0);
    expect(v1, equals(v2));
    expect(v1.hashCode, equals(v2.hashCode));
  });

  test("Vector2 - positive/negative zero equal (memory backed)", () {
    final v1 = Vector2$.Allocate(.new()).ref..set(0.0, 1.0);
    final v2 = Vector2$.Allocate(.new()).ref..set(-0.0, 1.0);
    expect(v1, equals(v2));
    expect(v1.hashCode, equals(v2.hashCode));
  });

  test("Vector2 - positive/negative zero equal (1 memory, 1 literal)", () {
    final v1 = Vector2$.Allocate(.new()).ref..set(0.0, 1.0);
    final v2 = Vector2.zero()..set(-0.0, 1.0);
    expect(v1, equals(v2));
  });

  test("Vector2 - NaN equals itself (reflexivity)", () {
    final v1 = Vector2.zero()..set(double.nan, 1.0);
    final v2 = Vector2.zero()..set(double.nan, 1.0);
    expect(v1, equals(v2)); // bytewise NaN==NaN, by design
  });

  test("Vector2 - distinguishes actually-different floats", () {
    final v1 = Vector2.zero()..set(1.0, 1.0);
    final v2 = Vector2.zero()..set(1.0000001, 1.0);
    expect(v1, isNot(equals(v2)));
  });

  test("Vector2 - equal structs have equal hashCodes (memory backed)", () {
    final v1 = Vector2$.Allocate(.new()).ref..set(0.0, 1.0);
    final v2 = Vector2$.Allocate(.new()).ref..set(-0.0, 1.0);
    expect(v1 == v2, isTrue);
    expect(v1.hashCode, equals(v2.hashCode));
  });

  tearDownAll(disposeRaylib);
}