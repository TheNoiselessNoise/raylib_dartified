// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_compute_hash.c
// Run it: dart run core_compute_hash.dart
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

enum Endian {
  BIG,
  LITTLE,
}

Pointer<Char> GetDataAsHexText(Raylib rl, Pointer<UnsignedInt> data, int size, [Endian endian = .BIG]) {
  if (data == nullptr) return ('00000000' * size).toC;

  final fixedData = switch (endian) {
    .BIG => rl.Temp.UnsignedInt$.ToBEBytes(data, size),
    .LITTLE => rl.Temp.UnsignedInt$.ToLEBytes(data, size),
  };

  return fixedData.map((b) => b.hex).join('').toC;
}

void main() {
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, 'core_compute_hash'.toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  String input = "The quick brown fox jumps over the lazy dog.";
  Pointer<Char> textInput = rl.Temp.strAt('textInput', input);

  bool textBoxEditMode = false;
  bool btnComputeHashes = false;

  int hashCRC32 = 0;
  Pointer<UnsignedInt> hashMD5 = nullptr;
  Pointer<UnsignedInt> hashSHA1 = nullptr;
  // TODO: ON NEW RAYLIB RELEASE - SHA256
  // Pointer<UnsignedInt> hashSHA256 = nullptr;

  Pointer<Char> base64Text = nullptr;
  final base64TextSize = rl.Temp.Int$.At('base64TextSize');

  void computeHashes() {
    final inputLength = textInput.toD.length;
    base64Text = rl.Core.EncodeDataBase64(textInput.cast(), inputLength, base64TextSize);
    hashCRC32 = rl.Core.ComputeCRC32(textInput.cast(), inputLength);
    hashMD5 = rl.Core.ComputeMD5(textInput.cast(), inputLength);
    hashSHA1 = rl.Core.ComputeSHA1(textInput.cast(), inputLength);
    // hashSHA256 = rl.Core.ComputeSHA256(textInput.cast(), inputLength);
  } computeHashes();

  while (!rl.Core.WindowShouldClose()) {
    if (btnComputeHashes) computeHashes();

    rl.Core.BeginDrawing();

    rl.Core.ClearBackground(rl.C.RAYWHITE);

    rl.Gui.GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 20);
    rl.Gui.GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SPACING.value, 2);
    rl.Gui.GuiLabel(rl.Temp.rect1(40, 26, 720, 32), "INPUT DATA (TEXT):".toC);
    rl.Gui.GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SPACING.value, 1);
    rl.Gui.GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 10);

    if (rl.Gui.GuiTextBox(
      rl.Temp.rect1(40, 64, 720, 32),
      textInput,
      95,
      textBoxEditMode
    ).toBool()) textBoxEditMode = !textBoxEditMode;

    btnComputeHashes = rl.Gui.GuiButton(
      rl.Temp.rect1(40, 64 + 40, 720, 32),
      "COMPUTE INPUT DATA HASHES".toC,
    ).toBool();

    rl.Gui.GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 20);
    rl.Gui.GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SPACING.value, 2);
    rl.Gui.GuiLabel(rl.Temp.rect1(40, 160, 720, 32), "INPUT DATA HASH VALUES:".toC);
    rl.Gui.GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SPACING.value, 1);
    rl.Gui.GuiSetStyle(GuiControl.DEFAULT.value, GuiDefaultProperty.TEXT_SIZE.value, 10);

    rl.Gui.GuiSetStyle(GuiControl.TEXTBOX.value, GuiTextBoxProperty.TEXT_READONLY.value, 1);
    rl.Gui.GuiLabel(rl.Temp.rect1(40, 200, 120, 32), "CRC32 [32 bit]:".toC);
    rl.Gui.GuiTextBox(rl.Temp.rect1(40 + 120, 200, 720 - 120, 32), hashCRC32.hex.toC, 120, false);
    rl.Gui.GuiLabel(rl.Temp.rect1(40, 200 + 36, 120, 32), "MD5 [128 bit]:".toC);
    rl.Gui.GuiTextBox(rl.Temp.rect1(40 + 120, 200 + 36, 720 - 120, 32), GetDataAsHexText(rl, hashMD5, 4, .LITTLE), 120, false);
    rl.Gui.GuiLabel(rl.Temp.rect1(40, 200 + 36*2, 120, 32), "SHA1 [160 bit]:".toC);
    rl.Gui.GuiTextBox(rl.Temp.rect1(40 + 120, 200 + 36*2, 720 - 120, 32), GetDataAsHexText(rl, hashSHA1, 5, .BIG), 120, false);
    // rl.Gui.GuiLabel(rl.Temp.rect1(40, 200 + 36*3, 120, 32), "SHA256 [256 bit]:".c);
    // rl.Gui.GuiTextBox(rl.Temp.rect1(40 + 120, 200 + 36*3, 720 - 120, 32), GetDataAsHexText(rl, hashSHA256, 8), 120, false);

    rl.Gui.GuiSetState(GuiState.STATE_FOCUSED.value);
    rl.Gui.GuiLabel(rl.Temp.rect1(40, 200 + 36*5 - 30, 320, 32), "BONUS - BAS64 ENCODED STRING:".toC);
    rl.Gui.GuiSetState(GuiState.STATE_NORMAL.value);
    rl.Gui.GuiLabel(rl.Temp.rect1(40, 200 + 36*5, 120, 32), "BASE64 ENCODING:".toC);
    rl.Gui.GuiTextBox(rl.Temp.rect1(40 + 120, 200 + 36*5, 720 - 120, 32), base64Text, 120, false);
    rl.Gui.GuiSetStyle(GuiControl.TEXTBOX.value, GuiTextBoxProperty.TEXT_READONLY.value, 0);

    rl.Core.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}