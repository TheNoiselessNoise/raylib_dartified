import 'package:test/test.dart';
import 'package:raylib_dartified_base/abbr/allocators.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  const int N = 2;

  final List<List<Color>> colorMatrix = [
    [.RED, .ORANGE],
    [.BLACK, .WHITE],
    [.BLUE, .GREEN],
  ];

  for (final (i, m) in colorMatrix.indexed) {
    assert(m.length == N, 'Sublist at $i must have $N elements');
  }

  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  late XPtr<XPtrType<XStructType>> ptr;
  setUp(() => ptr = Color$.$.Array(colorMatrix));

  test("readMatrix (direct)", () {
    // `materialize` is required
    final extracted = ptr.readMatrix<Color>(colorMatrix.length, N, materialize: true);
    expect(extracted.toString(), colorMatrix.toString());
  });

  test("readMatrix (owned)", () {
    final pListIndex = 1;
    final pColorIndex = 1;
    final expectedValue = 42;
    
    // read the matrix and change a color
    final ownedMatrix = ptr.readMatrix<Color>(colorMatrix.length, N);
    final someColor = ownedMatrix[pListIndex][pColorIndex];
    // should reflect to underlying memory
    someColor.r = expectedValue;
    someColor.g = expectedValue;
    someColor.b = expectedValue;

    // offset to the underlying memory
    final colorPtr = ptr
      .readPtr(pListIndex * XType.nativeWordSize)
      .offsetBy(pColorIndex * Color.struct.byteSize);

    // test the values on dart-side detached synced object 
    final ref = Color.struct.ptr(colorPtr).value;
    expect(ref.r, equals(expectedValue));
    expect(ref.g, equals(expectedValue));
    expect(ref.b, equals(expectedValue));
  });

  test("writeMatrix", () {
    final pListIndex = 1;
    final pColorIndex = 1;
    final expectedValue = 99;

    final matrix = ptr.readMatrix<Color>(colorMatrix.length, N);
    matrix[pListIndex][pColorIndex].r = expectedValue;
    ptr.writeMatrix(matrix);

    final newMatrix = ptr.readMatrix<Color>(colorMatrix.length, N, materialize: true);
    expect(newMatrix[pListIndex][pColorIndex].r, equals(expectedValue));
  });
  
  tearDownAll(disposeRaylib);
}