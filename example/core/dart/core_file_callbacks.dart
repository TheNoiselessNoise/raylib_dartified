// Custom example, there's no original equivalent
// Run it: dart run core_file_callbacks.dart
import 'dart:typed_data';
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

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
TestResult testLoadFileData() {
  SetLoadFileDataCallback(LoadFileDataCallbackD.friendly((fileName, dataSize) {
    lfdResult.assertIt(fileName == 'LoadFileData');
    const dummyDataSize = 8;
    dataSize.value = dummyDataSize;
    final data = Uint8List(dummyDataSize);
    for (int i = 0; i < dummyDataSize ~/ 2; i++) data[i] = 1;
    return .fromBytes(data).cast();
  }));

  final bytes = LoadFileData('LoadFileData');
  lfdResult.assertIt(bytes.length == 8, 'expected size 8, got ${bytes.length}');
  lfdResult.assertIt(bytes.join(',') == '1,1,1,1,0,0,0,0', 'unexpected bytes: ${bytes.join(",")}');

  SetLoadFileDataCallback(null);
  return lfdResult;
}

// SaveFileData: records how many bytes were "written"
int _savedDataSize = 0;
List<int> _savedDataBytes = [];
final TestResult sfdResult = TestResult('SaveFileData');
TestResult testSaveFileData() {
  SetSaveFileDataCallback(SaveFileDataCallbackD.friendly((fileName, data, dataSize) {
    sfdResult.assertIt(fileName == 'SaveFileData');
    _savedDataSize = dataSize;
    final bytes = data.to<Uint8List>(dataSize);
    _savedDataBytes = .generate(dataSize, (i) => bytes[i]);
    return true;
  },));

  const count = 6;
  final buf = Uint8List(count);
  for (int i = 0; i < count; i++) buf[i] = (i + 1) * 10;

  final ok = SaveFileData('SaveFileData', buf);

  sfdResult.assertIt(ok, 'SaveFileData returned false');
  sfdResult.assertIt(_savedDataSize == count, 'expected size $count, got $_savedDataSize');
  sfdResult.assertIt(_savedDataBytes.join(',') == '10,20,30,40,50,60', 'unexpected bytes: ${_savedDataBytes.join(",")}');

  SetSaveFileDataCallback(null);
  return sfdResult;
}

// LoadFileText: returns a fixed null-terminated C string
final TestResult lftResult = TestResult('LoadFileText');
TestResult testLoadFileText() {
  SetLoadFileTextCallback(LoadFileTextCallbackD.friendly((fileName) {
    lftResult.assertIt(fileName == 'LoadFileText');
    return 'hello raylib';
  },));

  final text = LoadFileText('LoadFileText');
  lftResult.assertIt(text == 'hello raylib', 'expected "hello raylib", got "$text"');

  SetLoadFileTextCallback(null);
  return lftResult;
}

// SaveFileText: records the text that was "written"
String _savedText = '';
final TestResult sftResult = TestResult('SaveFileText');
TestResult testSaveFileText() {
  SetSaveFileTextCallback(SaveFileTextCallbackD.friendly((fileName, text) {
    sftResult.assertIt(fileName == 'SaveFileText');
    _savedText = text;
    return true;
  }));

  final ok = SaveFileText('SaveFileText', 'greetings');

  sftResult.assertIt(ok, 'SaveFileText returned false');
  sftResult.assertIt(_savedText == 'greetings', 'expected "greetings", got "$_savedText"');

  SetSaveFileTextCallback(null);
  return sftResult;
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_file_callbacks");
  SetTargetFPS(60);

  results.add(testLoadFileData());
  results.add(testSaveFileData());
  results.add(testLoadFileText());
  results.add(testSaveFileText());

  final allPassed = results.every((r) => r.passed);

  final TestResult failedTest = .new('FailedTest');
  failedTest.assertIt(false, 'This test is failing on purpose');
  results.add(failedTest);

  while (!WindowShouldClose()) {
    BeginDrawing();
    ClearBackground(.RAYWHITE);

    DrawTestResults(allPassed);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void DrawTestResults(bool allPassed) {
  const int padX   = 30;
  const int padY   = 30;
  const int rowH   = 52;
  const int iconW  = 36;
  const int fontSize = 18;
  const int smallFont = 13;

  final ColorD headerColor = allPassed ? .DARKGREEN : .MAROON;
  final headerText  = allPassed ? 'ALL TESTS PASSED' : 'SOME TESTS FAILED';
  DrawText(headerText, padX, padY, 24, headerColor);

  DrawLine(padX, padY + 34, screenWidth - padX, padY + 34, .LIGHTGRAY);

  for (int i = 0; i < results.length; i++) {
    final r   = results[i];
    final y   = padY + 44 + i * rowH;
    final ColorD bg  = r.passed ? .color(220, 255, 220, 255) : .color(255, 220, 220, 255);
    final ColorD dot = r.passed ? .GREEN : .RED;

    DrawRectangle(padX, y, screenWidth - padX * 2, rowH - 4, bg);
    DrawRectangleLines(padX, y, screenWidth - padX * 2, rowH - 4, dot);

    DrawCircle(padX + iconW ~/ 2, y + (rowH - 4) ~/ 2, 13, dot);

    final signSize = 20;
    final signX = padX + iconW ~/ 2 - signSize ~/ 2;
    final signY = y + (rowH - 4) ~/ 2 - signSize ~/ 2;

    if (r.passed) {
      DrawCheckmark(signX, signY, signSize, .WHITE);
    } else {
      DrawXSign(signX, signY, signSize, .WHITE);
    }

    DrawText(r.name, padX + iconW + 10, y + 7, fontSize, .BLACK);

    final detail = r.detail.length > 72 ? '${r.detail.substring(0, 69)}...' : r.detail;
    DrawText(detail, padX + iconW + 10, y + 28, smallFont, .DARKGRAY);
  }
}

void DrawCheckmark(int x, int y, int size, ColorD color) {
  DrawLineEx(
    .vec2(x + size * 0.15, y + size * 0.50),
    .vec2(x + size * 0.40, y + size * 0.75),
    size * 0.15, color,
  );
  DrawLineEx(
    .vec2(x + size * 0.40, y + size * 0.75),
    .vec2(x + size * 0.85, y + size * 0.20),
    size * 0.15, color,
  );
}

void DrawXSign(int x, int y, int size, ColorD color) {
  DrawLineEx(
    .vec2(x + size * 0.20, y + size * 0.20),
    .vec2(x + size * 0.80, y + size * 0.80),
    size * 0.15, color,
  );
  DrawLineEx(
    .vec2(x + size * 0.80, y + size * 0.20),
    .vec2(x + size * 0.20, y + size * 0.80),
    size * 0.15, color,
  );
}