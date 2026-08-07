// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_compute_hash.c
// Run it: dart run core_compute_hash.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

enum Endian {
  BIG,
  LITTLE,
}

Pointer<Char> GetDataAsHexText(Pointer<UnsignedInt> data, int size, [Endian endian = .BIG]) {
  if (data == nullptr) return ('00000000' * size).toC;

  final fixedData = switch (endian) {
    .BIG => UnsignedInt$.ToBEBytes(data, size),
    .LITTLE => UnsignedInt$.ToLEBytes(data, size),
  };

  return fixedData.map((b) => b.hex).join('').toC;
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_compute_hash".toC);
  SetTargetFPS(60);

  String input = "The quick brown fox jumps over the lazy dog.";
  Pointer<Char> textInput = String$.ValueAt('textInput', input);

  bool textBoxEditMode = false;
  bool btnComputeHashes = false;

  int hashCRC32 = 0;
  Pointer<UnsignedInt> hashMD5 = nullptr;
  Pointer<UnsignedInt> hashSHA1 = nullptr;
  Pointer<UnsignedInt> hashSHA256 = nullptr;

  Pointer<Char> base64Text = nullptr;
  final base64TextSize = Int$.At('base64TextSize');

  void computeHashes() {
    final inputLength = textInput.toD.length;
    base64Text = EncodeDataBase64(textInput.cast(), inputLength, base64TextSize);
    hashCRC32 = ComputeCRC32(textInput.cast(), inputLength);
    hashMD5 = ComputeMD5(textInput.cast(), inputLength);
    hashSHA1 = ComputeSHA1(textInput.cast(), inputLength);
    hashSHA256 = ComputeSHA256(textInput.cast(), inputLength);
  } computeHashes();

  while (!WindowShouldClose()) {
    if (btnComputeHashes) computeHashes();

    BeginDrawing();

    ClearBackground(RAYWHITE);

    GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 20);
    GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SPACING.value, 2);
    GuiLabel(Rectangle$.$1.set(40, 26, 720, 32), "INPUT DATA (TEXT):".toC);
    GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SPACING.value, 1);
    GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 10);

    if (GuiTextBox(
      Rectangle$.$1.set(40, 64, 720, 32),
      textInput,
      95,
      textBoxEditMode
    ).toBool()) textBoxEditMode = !textBoxEditMode;

    btnComputeHashes = GuiButton(
      Rectangle$.$1.set(40, 64 + 40, 720, 32),
      "COMPUTE INPUT DATA HASHES".toC,
    ).toBool();

    GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 20);
    GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SPACING.value, 2);
    GuiLabel(Rectangle$.$1.set(40, 160, 720, 32), "INPUT DATA HASH VALUES:".toC);
    GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SPACING.value, 1);
    GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 10);

    GuiSetStyle(GuiControl.TEXTBOX.value, GuiTextBoxProperty.TEXT_READONLY.value, 1);
    GuiLabel(Rectangle$.$1.set(40, 200, 120, 32), "CRC32 [32 bit]:".toC);
    GuiTextBox(Rectangle$.$1.set(40 + 120, 200, 720 - 120, 32), hashCRC32.hex.toC, 120, false);
    GuiLabel(Rectangle$.$1.set(40, 200 + 36, 120, 32), "MD5 [128 bit]:".toC);
    GuiTextBox(Rectangle$.$1.set(40 + 120, 200 + 36, 720 - 120, 32), GetDataAsHexText(hashMD5, rl.Utils.md5Uint32HashLength, .LITTLE), 120, false);
    GuiLabel(Rectangle$.$1.set(40, 200 + 36*2, 120, 32), "SHA1 [160 bit]:".toC);
    GuiTextBox(Rectangle$.$1.set(40 + 120, 200 + 36*2, 720 - 120, 32), GetDataAsHexText(hashSHA1, rl.Utils.sha1Uint32HashLength, .BIG), 120, false);
    GuiLabel(Rectangle$.$1.set(40, 200 + 36*3, 120, 32), "SHA256 [256 bit]:".toC);
    GuiTextBox(Rectangle$.$1.set(40 + 120, 200 + 36*3, 720 - 120, 32), GetDataAsHexText(hashSHA256, rl.Utils.sha256Uint32HashLength), 120, false);

    GuiSetState(GuiState.STATE_FOCUSED.value);
    GuiLabel(Rectangle$.$1.set(40, 200 + 36*5 - 30, 320, 32), "BONUS - BAS64 ENCODED STRING:".toC);
    GuiSetState(GuiState.STATE_NORMAL.value);
    GuiLabel(Rectangle$.$1.set(40, 200 + 36*5, 120, 32), "BASE64 ENCODING:".toC);
    GuiTextBox(Rectangle$.$1.set(40 + 120, 200 + 36*5, 720 - 120, 32), base64Text, 120, false);
    GuiSetStyle(GuiControl.TEXTBOX.value, GuiTextBoxProperty.TEXT_READONLY.value, 0);

    EndDrawing();
  }

  CloseWindowAndDispose();
}