// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_compute_hash.c
// Run it: dart run core_compute_hash.dart
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

String GetDataAsHexText(List<int> data, int size) {
  if (data.isEmpty) return ('00000000' * size);
  return List.generate(data.length, (i) => data[i].hex).join('');
}

void main() {
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'core_compute_hash');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  String input = "The quick brown fox jumps over the lazy dog.";

  bool textBoxEditMode = false;
  bool btnComputeHashes = false;

  int hashCRC32 = 0;
  List<int> hashMD5 = [];
  List<int> hashSHA1 = [];
  // TODO: ON NEW RAYLIB RELEASE - SHA256
  // List<int> hashSHA256 = [];

  String base64Text = '';

  void computeHashes() {
    base64Text = rl.CoreD.EncodeDataBase64(input.codeUnits).toDartString();
    hashCRC32 = rl.CoreD.ComputeCRC32(input.codeUnits);
    hashMD5 = rl.CoreD.ComputeMD5(input.codeUnits);
    hashSHA1 = rl.CoreD.ComputeSHA1(input.codeUnits);
    // hashSHA256 = rl.CoreD.ComputeSHA256(input.codeUnits);
  } computeHashes();

  while (!rl.CoreD.WindowShouldClose()) {
    if (btnComputeHashes) computeHashes();

    rl.CoreD.BeginDrawing();

    rl.CoreD.ClearBackground(.RAYWHITE);

    rl.GuiD.GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 20);
    rl.GuiD.GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SPACING, 2);
    rl.GuiD.GuiLabel(.rect(40, 26, 720, 32), "INPUT DATA (TEXT):");
    rl.GuiD.GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SPACING, 1);
    rl.GuiD.GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 10);

    {
      final (result, newValue) = rl.GuiD.GuiTextBox(
        .rect(40, 64, 720, 32),
        input, 95, textBoxEditMode
      );
      input = newValue;
      if (result != 0) textBoxEditMode = !textBoxEditMode;
    }

    btnComputeHashes = rl.GuiD.GuiButton(
      .rect(40, 64 + 40, 720, 32),
      "COMPUTE INPUT DATA HASHES",
    ) != 0;

    rl.GuiD.GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 20);
    rl.GuiD.GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SPACING, 2);
    rl.GuiD.GuiLabel(.rect(40, 160, 720, 32), "INPUT DATA HASH VALUES:");
    rl.GuiD.GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SPACING, 1);
    rl.GuiD.GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 10);

    rl.GuiD.GuiSetStyle(.TEXTBOX, GuiTextBoxProperty.TEXT_READONLY, 1);
    rl.GuiD.GuiLabel(.rect(40, 200, 120, 32), "CRC32 [32 bit]:");
    rl.GuiD.GuiTextBox(.rect(40 + 120, 200, 720 - 120, 32), hashCRC32.hex, 120, false);
    rl.GuiD.GuiLabel(.rect(40, 200 + 36, 120, 32), "MD5 [128 bit]:");
    rl.GuiD.GuiTextBox(.rect(40 + 120, 200 + 36, 720 - 120, 32), GetDataAsHexText(hashMD5, 4), 120, false);
    rl.GuiD.GuiLabel(.rect(40, 200 + 36*2, 120, 32), "SHA1 [160 bit]:");
    rl.GuiD.GuiTextBox(.rect(40 + 120, 200 + 36*2, 720 - 120, 32), GetDataAsHexText(hashSHA1, 5), 120, false);
    // rl.GuiD.GuiLabel(.rect(40, 200 + 36*3, 120, 32), "SHA256 [256 bit]:");
    // rl.GuiD.GuiTextBox(.rect(40 + 120, 200 + 36*3, 720 - 120, 32), GetDataAsHexText(hashSHA256), 120, false);

    rl.GuiD.GuiSetState(.STATE_FOCUSED);
    rl.GuiD.GuiLabel(.rect(40, 200 + 36*5 - 30, 320, 32), "BONUS - BAS64 ENCODED STRING:");
    rl.GuiD.GuiSetState(.STATE_NORMAL);
    rl.GuiD.GuiLabel(.rect(40, 200 + 36*5, 120, 32), "BASE64 ENCODING:");
    rl.GuiD.GuiTextBox(.rect(40 + 120, 200 + 36*5, 720 - 120, 32), base64Text, 120, false);
    rl.GuiD.GuiSetStyle(.TEXTBOX, GuiTextBoxProperty.TEXT_READONLY, 0);

    rl.CoreD.EndDrawing();
  }

  rl.CloseWindowAndDispose();
}