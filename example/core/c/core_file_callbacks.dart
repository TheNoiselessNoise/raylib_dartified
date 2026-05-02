// Custom example, there's no original equivalent
// Run it: dart run core_file_callbacks.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

late Raylib rl;

class TestResult {
  final String name;
  TestResult(this.name);

  final List<String> _errorMessages = [];

  void assertIt(bool cond, [String? message]) {
    if (!cond) _errorMessages.add(message ?? 'Unknown Error');
  }

  bool get passed => _errorMessages.isEmpty;
  String get detail => _errorMessages.firstOrNull ?? 'OK';
}

final results = <TestResult>[];

// LoadFileData: returns 8 bytes [1,1,1,1,0,0,0,0]
final TestResult lfdResult = TestResult('LoadFileData');
Pointer<UnsignedChar> LoadFileDataFunction(
  Pointer<Char> fileName,
  Pointer<Int> dataSize,
) {
  lfdResult.assertIt(fileName.toD == 'LoadFileData');
  const dummyDataSize = 8;
  dataSize.value = dummyDataSize;
  final data = rl.Temp.UChar$.At('lfd_${fileName.toD}', dummyDataSize);
  for (int i = 0; i < dummyDataSize ~/ 2; i++) data[i] = 1;
  return data;
}

TestResult testLoadFileData() {
  final cb = NativeCallable<LoadFileDataCallbackFunctionC>.isolateLocal(LoadFileDataFunction);
  rl.Core.SetLoadFileDataCallback(cb.nativeFunction);

  final dataSize = rl.Temp.Int$.At('lfd_size');
  final data = rl.Core.LoadFileData('LoadFileData'.toC, dataSize);

  final bytes = List.generate(dataSize.value, (i) => data[i]);
  lfdResult.assertIt(dataSize.value == 8, 'expected size 8, got ${dataSize.value}');
  lfdResult.assertIt(bytes.join(',') == '1,1,1,1,0,0,0,0', 'unexpected bytes: ${bytes.join(",")}');

  cb.close();
  rl.Core.SetLoadFileDataCallback(nullptr);
  return lfdResult;
}

// SaveFileData: records how many bytes were "written"
int _savedDataSize = 0;
List<int> _savedDataBytes = [];
final TestResult sfdResult = TestResult('SaveFileData');
bool SaveFileDataFunction(
  Pointer<Char> fileName,
  Pointer<Void> data,
  int dataSize,
) {
  sfdResult.assertIt(fileName.toD == 'SaveFileData');
  _savedDataSize = dataSize;
  final bytes = data.cast<UnsignedChar>();
  _savedDataBytes = List.generate(dataSize, (i) => bytes[i]);
  return true;
}

TestResult testSaveFileData() {
  final cb = NativeCallable<SaveFileDataCallbackFunctionC>.isolateLocal(SaveFileDataFunction, exceptionalReturn: false);
  rl.Core.SetSaveFileDataCallback(cb.nativeFunction);

  const count = 6;
  final buf = rl.Temp.UChar$.At('sfd_buf', count);
  for (int i = 0; i < count; i++) buf[i] = (i + 1) * 10;

  final ok = rl.Core.SaveFileData('SaveFileData'.toC, buf.cast(), count);

  sfdResult.assertIt(ok, 'SaveFileData returned false');
  sfdResult.assertIt(_savedDataSize == count, 'expected size $count, got $_savedDataSize');
  sfdResult.assertIt(_savedDataBytes.join(',') == '10,20,30,40,50,60', 'unexpected bytes: ${_savedDataBytes.join(",")}');

  cb.close();
  rl.Core.SetSaveFileDataCallback(nullptr);
  return sfdResult;
}

// LoadFileText: returns a fixed null-terminated C string
final TestResult lftResult = TestResult('LoadFileText');
Pointer<Char> LoadFileTextFunction(Pointer<Char> fileName) {
  lftResult.assertIt(fileName.toD == 'LoadFileText');
  const text = 'hello raylib';
  return rl.Temp.String$.ValueAt('lft_${fileName.toD}', text);
}

TestResult testLoadFileText() {
  final cb = NativeCallable<LoadFileTextCallbackFunctionC>.isolateLocal(LoadFileTextFunction);
  rl.Core.SetLoadFileTextCallback(cb.nativeFunction);

  final text = rl.Core.LoadFileText('LoadFileText'.toC);
  final dart = text.toD;

  lftResult.assertIt(dart == 'hello raylib', 'expected "hello raylib", got "$dart"');

  cb.close();
  rl.Core.SetLoadFileTextCallback(nullptr);
  return lftResult;
}

// SaveFileText: records the text that was "written"
String _savedText = '';
final TestResult sftResult = TestResult('SaveFileText');
bool SaveFileTextFunction(
  Pointer<Char> fileName,
  Pointer<Char> text,
) {
  sftResult.assertIt(fileName.toD == 'SaveFileText');
  _savedText = text.toD;
  return true;
}

TestResult testSaveFileText() {
  final cb = NativeCallable<SaveFileTextCallbackFunctionC>.isolateLocal(SaveFileTextFunction, exceptionalReturn: false);
  rl.Core.SetSaveFileTextCallback(cb.nativeFunction);

  final ok = rl.Core.SaveFileText('SaveFileText'.toC, 'greetings'.toC);

  sftResult.assertIt(ok, 'SaveFileText returned false');
  sftResult.assertIt(_savedText == 'greetings', 'expected "greetings", got "$_savedText"');

  cb.close();
  rl.Core.SetSaveFileTextCallback(nullptr);
  return sftResult;
}

void main() {
  rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_file_callbacks'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  results.add(testLoadFileData());
  results.add(testSaveFileData());
  results.add(testLoadFileText());
  results.add(testSaveFileText());

  final allPassed = results.every((r) => r.passed);

  final TestResult failedTest = .new('FailedTest');
  failedTest.assertIt(false, 'This test is failing on purpose');
  results.add(failedTest);

  while (!rl.Core.WindowShouldClose()) {
    rl.Core.BeginDrawing();
    rl.Core.ClearBackground(rl.C.RAYWHITE);

    DrawTestResults(allPassed);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}

void DrawTestResults(bool allPassed) {
  const int padX   = 30;
  const int padY   = 30;
  const int rowH   = 52;
  const int iconW  = 36;
  const int fontSize = 18;
  const int smallFont = 13;

  final headerColor = allPassed ? rl.C.DARKGREEN : rl.C.MAROON;
  final headerText  = allPassed ? 'ALL TESTS PASSED' : 'SOME TESTS FAILED';
  rl.Core.DrawText(headerText.toC, padX, padY, 24, headerColor);

  rl.Core.DrawLine(padX, padY + 34, screenWidth - padX, padY + 34, rl.C.LIGHTGRAY);

  for (int i = 0; i < results.length; i++) {
    final r   = results[i];
    final y   = padY + 44 + i * rowH;
    final bg  = r.passed ? rl.Temp.color1(220, 255, 220, 255) : rl.Temp.color1(255, 220, 220, 255);
    final dot = r.passed ? rl.C.GREEN : rl.C.RED;

    rl.Core.DrawRectangle(padX, y, screenWidth - padX * 2, rowH - 4, bg);
    rl.Core.DrawRectangleLines(padX, y, screenWidth - padX * 2, rowH - 4, dot);

    rl.Core.DrawCircle(padX + iconW ~/ 2, y + (rowH - 4) ~/ 2, 13, dot);

    final signSize = 20;
    final signX = padX + iconW ~/ 2 - signSize ~/ 2;
    final signY = y + (rowH - 4) ~/ 2 - signSize ~/ 2;

    if (r.passed) {
      DrawCheckmark(signX, signY, signSize, rl.C.WHITE);
    } else {
      DrawXSign(signX, signY, signSize, rl.C.WHITE);
    }

    rl.Core.DrawText(r.name.toC, padX + iconW + 10, y + 7, fontSize, rl.C.BLACK);

    final detail = r.detail.length > 72 ? '${r.detail.substring(0, 69)}...' : r.detail;
    rl.Core.DrawText(detail.toC, padX + iconW + 10, y + 28, smallFont, rl.C.DARKGRAY);
  }
}

void DrawCheckmark(int x, int y, int size, ColorC color) {
  rl.Core.DrawLineEx(
    rl.Temp.vec21(x + size * 0.15, y + size * 0.50),
    rl.Temp.vec22(x + size * 0.40, y + size * 0.75),
    size * 0.15, color,
  );
  rl.Core.DrawLineEx(
    rl.Temp.vec21(x + size * 0.40, y + size * 0.75),
    rl.Temp.vec22(x + size * 0.85, y + size * 0.20),
    size * 0.15, color,
  );
}

void DrawXSign(int x, int y, int size, ColorC color) {
  rl.Core.DrawLineEx(
    rl.Temp.vec21(x + size * 0.20, y + size * 0.20),
    rl.Temp.vec22(x + size * 0.80, y + size * 0.80),
    size * 0.15, color,
  );
  rl.Core.DrawLineEx(
    rl.Temp.vec21(x + size * 0.80, y + size * 0.20),
    rl.Temp.vec22(x + size * 0.20, y + size * 0.80),
    size * 0.15, color,
  );
}