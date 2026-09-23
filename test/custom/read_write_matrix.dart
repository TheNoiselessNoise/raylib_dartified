import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  const int N = 2;

  final List<List<ColorD>> colorMatrix = [
    [.RED, .ORANGE],
    [.BLACK, .WHITE],
    [.BLUE, .GREEN],
  ];

  for (final (i, m) in colorMatrix.indexed) {
    assert(m.length == N, 'Sublist at $i must have $N elements');
  }

  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late MemoryPointer<RPointer<RStruct>> ptr;
  setUp(() => ptr = $.Color$.$.Array(colorMatrix));

  test("readMatrix (direct)", () {
    final extracted = ptr.readMatrix<ColorD>(colorMatrix.length, N, owned: false);
    expect(extracted.toString(), colorMatrix.toString());
  });

  test("readMatrix (owned)", () {
    final pListIndex = 1;
    final pColorIndex = 1;
    final expectedValue = 42;
    
    // read the matrix and change a color
    final ownedMatrix = ptr.readMatrix<ColorD>(colorMatrix.length, N, owned: true);
    final someColor = ownedMatrix[pListIndex][pColorIndex];
    // should reflect to underlying memory
    someColor.r = expectedValue;
    someColor.g = expectedValue;
    someColor.b = expectedValue;

    // offset to the underlying memory
    final colorPtr = ptr
      .readPtr(pListIndex * RType.nativeWordSize)
      .offsetBy(pColorIndex * ColorD.struct.byteSize);

    // test the values on dart-side detached synced object 
    final ref = ColorD.struct.ptr(colorPtr).detached;
    expect(ref.r, equals(expectedValue));
    expect(ref.g, equals(expectedValue));
    expect(ref.b, equals(expectedValue));
  });

  test("writeMatrix", () {
    final pListIndex = 1;
    final pColorIndex = 1;
    final expectedValue = 99;

    final matrix = ptr.readMatrix<ColorD>(colorMatrix.length, N, owned: false);
    matrix[pListIndex][pColorIndex].r = expectedValue;
    ptr.writeMatrix(matrix);

    final newMatrix = ptr.readMatrix<ColorD>(colorMatrix.length, N, owned: false);
    expect(newMatrix[pListIndex][pColorIndex].r, equals(expectedValue));
  });
  
  tearDownAll(disposeRaylib);
}