import 'package:raylib_dartified/abbr/dart.dart';
import 'package:test/test.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  test('one simple int field', () {
    final dynType = StructType.createDynamic({
      'field': RInt32(),
    });

    final ptr = dynType.calloc();

    dynType.poke(ptr, {'field': 1});
    expect(ptr.ref.values['field'], 1);

    ptr.free();
  });

  test('nested struct', () {
    final nestedType = StructType.createDynamic({
      'field': RInt32(),
    });

    final dynType = StructType.createDynamic({
      'field': RInt32(),
      'nested': RStruct(nestedType),
    });

    final ptr = dynType.calloc();

    dynType.poke(ptr, {'nested': {'field': 100}});
    expect(ptr.ref.values['nested']['field'], 100);

    ptr.free();
  });

  test('getter / setter', () {
    final dynType = StructType.createDynamic({
      'x': RInt32(),
      'y': RInt32(),
    });

    final ptr = dynType.calloc();

    final inst = ptr.ref;
    inst.setField('x', 100);
    expect(inst.getField('x'), 100);

    ptr.free();
  });

  test('equality', () {
    final dynType = StructType.createDynamic({
      'x': RInt32(),
      'y': RInt32(),
    });

    final ptr1 = dynType.calloc();
    final inst1 = ptr1.ref;

    final ptr2 = dynType.calloc();
    final inst2 = ptr2.ref;

    expect(inst1 == inst2, true);

    inst2.setField('x', 100);
    expect(inst1 == inst2, false);

    ptr1.free();
    ptr2.free();
  });

  test('equality of different types', () {
    final dynType1 = StructType.createDynamic({
      'x': RInt32(),
    });

    final dynType2 = StructType.createDynamic({
      'x': RInt32(),
    });

    final ptr1 = dynType1.calloc();
    final inst1 = ptr1.ref;

    final ptr2 = dynType2.calloc();
    final inst2 = ptr2.ref;

    expect(inst1 == inst2, false);
  });

  test('setDart', () {
    final aType = StructType.createDynamic({
      'x': RInt32(),
    });

    final bType = StructType.createDynamic({
      'y': RInt32(),
    });

    final aPtr = aType.calloc();
    final aInst = aPtr.ref;

    final bPtr = bType.calloc();
    final bInst = bPtr.ref;

    expect(() => aInst.setDart(bInst), throwsStateError);
    bPtr.free();

    final xPtr = aType.calloc();
    final xInst = xPtr.ref;

    xInst.setField('x', 100);
    aInst.setDart(xInst);
    expect(aInst.getField('x'), 100);

    aPtr.free();
    xPtr.free();
  });

  test('array', () {
    final xField = 'x';
    final count = 10;
    final value = 100;

    final type = StructType.createDynamic({
      xField: RInt32(),
    });

    final ptr = type.calloc(count);

    for (int i = 0; i < count; i++) {
      ptr[i].setField(xField, value);
    }

    final collection = ptr
      .readArray(count)
      .map((e) => e.getField(xField))
      .toList();

    expect(collection, List.filled(count, value));
  });

  group('Pointer Fields', () {
    const x = 'x';
    const y = 'y';

    const string = 'string';
    const stringUTF32 = 'stringUTF32';
    const stringArray3 = 'stringArray3';

    const ptrToString = 'ptrToString';
    const ptrToBool = 'ptrToBool';
    const ptrToInt = 'ptrToInt';
    const ptrToArrayOf3Ints = 'ptrToArrayOf3Ints';
    const ptrToStruct = 'ptrToStruct';
    const ptrToArrayOf2Structs = 'ptrToArrayOf2Structs';
    const ptrToArrayOf2ArraysOf2Ints = 'ptrToArrayOf2ArraysOf2Ints';
    const ptrToArrayOf2ArraysOf2Structs = 'ptrToArrayOf2ArraysOf2Structs';

    late StructType<RaylibDynamicStruct> inner;
    late StructType<RaylibDynamicStruct> type;
    late MemoryPointer ptr;

    setUp(() {
      inner = .createDynamic({
        x: RInt32(),
        y: RInt32(),
      });

      type = .createDynamic({
        string: RString<RInt8>(5),
        stringUTF32: RString<RInt32>(2),
        stringArray3: RArray(RString<RInt8>(5), 3),
        ptrToString: RPointer(RString<RInt8>()),
        ptrToBool: RPointer(RBool()),
        ptrToInt: RPointer(RInt32()),
        ptrToArrayOf3Ints: RPointer(RArray(RInt32(), 3)),
        ptrToStruct: RPointer(RStruct(inner)),
        ptrToArrayOf2Structs: RPointer(RArray(RStruct(inner), 2)),
        ptrToArrayOf2ArraysOf2Ints: RPointer(RArray(RArray(RInt32(), 2), 2)),
        ptrToArrayOf2ArraysOf2Structs: RPointer(RArray(RArray(RStruct(inner), 2), 2)),
      });

      ptr = type.calloc();
    });

    tearDown(() => ptr.free());

    test('zero initialization', () {
      final values = type.peek(ptr);

      expect(values[string], '');
      expect(values[stringUTF32], '');
      expect(values[stringArray3], ['', '', '']);

      expect(values[ptrToString], null);
      expect(values[ptrToBool], null);
      expect(values[ptrToInt], null);
      expect(values[ptrToArrayOf3Ints], null);
      expect(values[ptrToStruct], null);
      expect(values[ptrToArrayOf2Structs], null);
      expect(values[ptrToArrayOf2ArraysOf2Ints], null);
      expect(values[ptrToArrayOf2ArraysOf2Structs], null);
    });

    test('allocWith initializes pointer fields', () {
      type.allocWith(ptr, {
        ptrToString: 'Hello',
        ptrToBool: true,
        ptrToInt: 99,
        ptrToArrayOf3Ints: [99, 99, 99],
        ptrToStruct: {x: 99, y: 99},
        ptrToArrayOf2Structs: [
          {x: 99, y: 99},
          {x: 99, y: 99},
        ],
        ptrToArrayOf2ArraysOf2Ints: [
          [99, 99],
          [99, 99],
        ],
        ptrToArrayOf2ArraysOf2Structs: [
          [
            {x: 99, y: 99},
            {x: 99, y: 99},
          ],
          [
            {x: 99, y: 99},
            {x: 99, y: 99},
          ],
        ],
      });

      final values = type.peek(ptr);

      expect(values[ptrToString], 'Hello');
      expect(values[ptrToBool], true);
      expect(values[ptrToInt], 99);
      expect(values[ptrToArrayOf3Ints], [99, 99, 99]);
      expect(values[ptrToStruct], {x: 99, y: 99});
      expect(
        values[ptrToArrayOf2Structs],
        [{x: 99, y: 99}, {x: 99, y: 99}],
      );
      expect(
        values[ptrToArrayOf2ArraysOf2Ints],
        [[99, 99], [99, 99]],
      );
      expect(
        values[ptrToArrayOf2ArraysOf2Structs],
        [[{x: 99, y: 99}, {x: 99, y: 99}],
         [{x: 99, y: 99}, {x: 99, y: 99}]],
      );
    });

    test('poke updates inline and allocated pointer fields', () {
      type.allocWith(ptr, {
        ptrToString: 'Hello',
        ptrToBool: true,
        ptrToInt: 99,
        ptrToArrayOf3Ints: [99, 99, 99],
        ptrToStruct: {x: 99, y: 99},
        ptrToArrayOf2Structs: [
          {x: 99, y: 99},
          {x: 99, y: 99},
        ],
        ptrToArrayOf2ArraysOf2Ints: [
          [99, 99],
          [99, 99],
        ],
        ptrToArrayOf2ArraysOf2Structs: [
          [
            {x: 99, y: 99},
            {x: 99, y: 99},
          ],
          [
            {x: 99, y: 99},
            {x: 99, y: 99},
          ],
        ],
      });

      type.poke(ptr, {
        string: 'Hello',
        stringUTF32: '😀🎉',
        stringArray3: ['foo', 'bar', 'baz'],
        ptrToString: 'World',
        ptrToBool: false,
        ptrToInt: 123,
        ptrToArrayOf3Ints: [1, 12, 23],
        ptrToStruct: {x: 12, y: 23},
        ptrToArrayOf2Structs: [
          {x: 12, y: 23},
          {x: 34, y: 45},
        ],
        ptrToArrayOf2ArraysOf2Ints: [
          [12, 23],
          [34, 45],
        ],
        ptrToArrayOf2ArraysOf2Structs: [
          [
            {x: 12, y: 23},
            {x: 34, y: 45},
          ],
          [
            {x: 56, y: 67},
            {x: 78, y: 89},
          ],
        ],
      });

      final values = type.peek(ptr);

      // Inline strings.
      expect(values[string], 'Hello');
      expect(values[stringUTF32], '😀🎉');
      expect(values[stringArray3], ['foo', 'bar', 'baz']);

      // Pointer scalars.
      expect(values[ptrToString], 'World');
      expect(values[ptrToBool], false);
      expect(values[ptrToInt], 123);

      // Pointer arrays and structs.
      expect(values[ptrToArrayOf3Ints], [1, 12, 23]);
      expect(values[ptrToStruct], {x: 12, y: 23});
      expect(
        values[ptrToArrayOf2Structs],
        [{x: 12, y: 23}, {x: 34, y: 45}],
      );
      expect(
        values[ptrToArrayOf2ArraysOf2Ints],
        [[12, 23], [34, 45]],
      );
      expect(
        values[ptrToArrayOf2ArraysOf2Structs],
        [[{x: 12, y: 23}, {x: 34, y: 45}],
         [{x: 56, y: 67}, {x: 78, y: 89}]],
      );
    });
  });

  tearDown(() => StructTypes.unregisterDynamic());

  tearDownAll(disposeRaylib);
}