// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_compute_hash.c
// Run it: dart run core_compute_hash.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

String GetDataAsHexText(List<int> data, int size) {
  if (data.isEmpty) return ('00000000' * size);
  return List.generate(data.length, (i) => data[i].hex).join('');
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_compute_hash");
  SetTargetFPS(60);

  String input = "The quick brown fox jumps over the lazy dog.";

  bool textBoxEditMode = false;
  bool btnComputeHashes = false;

  int hashCRC32 = 0;
  List<int> hashMD5 = [];
  List<int> hashSHA1 = [];
  List<int> hashSHA256 = [];

  String base64Text = '';

  void computeHashes() {
    base64Text = EncodeDataBase64(.fromList(input.codeUnits)).toDartString();
    hashCRC32 = ComputeCRC32(.fromList(input.codeUnits));
    hashMD5 = ComputeMD5(.fromList(input.codeUnits));
    hashSHA1 = ComputeSHA1(.fromList(input.codeUnits));
    hashSHA256 = ComputeSHA256(.fromList(input.codeUnits));
  } computeHashes();

  while (!WindowShouldClose()) {
    if (btnComputeHashes) computeHashes();

    BeginDrawing();

    ClearBackground(.RAYWHITE);

    GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 20);
    GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SPACING, 2);
    GuiLabel(.rect(40, 26, 720, 32), "INPUT DATA (TEXT):");
    GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SPACING, 1);
    GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 10);

    {
      final (result, newValue) = GuiTextBox(
        .rect(40, 64, 720, 32),
        input, 95, textBoxEditMode
      );
      input = newValue;
      if (result != 0) textBoxEditMode = !textBoxEditMode;
    }

    btnComputeHashes = GuiButton(
      .rect(40, 64 + 40, 720, 32),
      "COMPUTE INPUT DATA HASHES",
    ) != 0;

    GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 20);
    GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SPACING, 2);
    GuiLabel(.rect(40, 160, 720, 32), "INPUT DATA HASH VALUES:");
    GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SPACING, 1);
    GuiSetStyle(.DEFAULT, GuiDefaultProperty.TEXT_SIZE, 10);

    GuiSetStyle(.TEXTBOX, GuiTextBoxProperty.TEXT_READONLY, 1);
    GuiLabel(.rect(40, 200, 120, 32), "CRC32 [32 bit]:");
    GuiTextBox(.rect(40 + 120, 200, 720 - 120, 32), hashCRC32.hex, 120, false);
    GuiLabel(.rect(40, 200 + 36, 120, 32), "MD5 [128 bit]:");
    GuiTextBox(.rect(40 + 120, 200 + 36, 720 - 120, 32), GetDataAsHexText(hashMD5, rl.Utils.md5Uint32HashLength), 120, false);
    GuiLabel(.rect(40, 200 + 36*2, 120, 32), "SHA1 [160 bit]:");
    GuiTextBox(.rect(40 + 120, 200 + 36*2, 720 - 120, 32), GetDataAsHexText(hashSHA1, rl.Utils.sha1Uint32HashLength), 120, false);
    GuiLabel(.rect(40, 200 + 36*3, 120, 32), "SHA256 [256 bit]:");
    GuiTextBox(.rect(40 + 120, 200 + 36*3, 720 - 120, 32), GetDataAsHexText(hashSHA256, rl.Utils.sha256Uint32HashLength), 120, false);

    GuiSetState(.STATE_FOCUSED);
    GuiLabel(.rect(40, 200 + 36*5 - 30, 320, 32), "BONUS - BAS64 ENCODED STRING:");
    GuiSetState(.STATE_NORMAL);
    GuiLabel(.rect(40, 200 + 36*5, 120, 32), "BASE64 ENCODING:");
    GuiTextBox(.rect(40 + 120, 200 + 36*5, 720 - 120, 32), base64Text, 120, false);
    GuiSetStyle(.TEXTBOX, GuiTextBoxProperty.TEXT_READONLY, 0);

    EndDrawing();
  }

  CloseWindowAndDispose();
}