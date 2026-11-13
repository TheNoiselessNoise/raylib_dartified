// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_storage_values.c
import 'dart:typed_data';
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const String STORAGE_DATA_FILE = "storage.data";

enum StorageData {
  STORAGE_POSITION_SCORE,
  STORAGE_POSITION_HISCORE
}

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "core_storage_values");
  SetTargetFPS(60);

  int score = 0;
  int hiscore = 0;
  int framesCounter = 0;

  rl.setMainLoop(() {
    if (IsKeyPressed(.KEY_R))
    {
      score = GetRandomValue(1000, 2000);
      hiscore = GetRandomValue(2000, 4000);
    }

    if (IsKeyPressed(.KEY_ENTER))
    {
      SaveStorageValue(.STORAGE_POSITION_SCORE, score);
      SaveStorageValue(.STORAGE_POSITION_HISCORE, hiscore);
    }
    else if (IsKeyPressed(.KEY_SPACE))
    {
      score = LoadStorageValue(.STORAGE_POSITION_SCORE);
      hiscore = LoadStorageValue(.STORAGE_POSITION_HISCORE);
    }

    framesCounter++;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("SCORE: $score", 280, 130, 40, MAROON);
      DrawText("HI-SCORE: $hiscore", 210, 200, 50, BLACK);

      DrawText("frames: $framesCounter", 10, 10, 20, LIME);

      DrawText("Press R to generate random numbers", 220, 40, 20, LIGHTGRAY);
      DrawText("Press ENTER to SAVE values", 250, 310, 20, LIGHTGRAY);
      DrawText("Press SPACE to LOAD values", 252, 350, 20, LIGHTGRAY);

    EndDrawing();
  });
});

const int _intSize = 4;

bool SaveStorageValue(StorageData position, int value) {
  Uint8List fileData;
  try {
    fileData = LoadFileData(STORAGE_DATA_FILE);
  } catch (_) {
    final newFileData = Uint8List((position.index + 1) * _intSize);
    ByteData.sublistView(newFileData).setInt32(
      position.index * _intSize,
      value,
      Endian.host,
    );

    final success = SaveFileData(STORAGE_DATA_FILE, newFileData);
    TraceLog(.LOG_INFO, "FILEIO: [$STORAGE_DATA_FILE] File created successfully");
    TraceLog(.LOG_INFO, "FILEIO: [$STORAGE_DATA_FILE] Saved storage value: $value");
    return success;
  }

  final requiredSize = (position.index + 1) * _intSize;
  Uint8List newFileData;

  if (fileData.length <= position.index * _intSize) {
    newFileData = Uint8List(requiredSize)..setRange(0, fileData.length, fileData);
  } else {
    newFileData = fileData;
  }

  ByteData.sublistView(newFileData).setInt32(
    position.index * _intSize,
    value,
    Endian.host,
  );

  final success = SaveFileData(STORAGE_DATA_FILE, newFileData);
  TraceLog(.LOG_INFO, "FILEIO: [$STORAGE_DATA_FILE] Saved storage value: $value");
  return success;
}

int LoadStorageValue(StorageData position) {
  int value = 0;

  Uint8List fileData;
  try {
    fileData = LoadFileData(STORAGE_DATA_FILE);
  } catch (_) {
    return value;
  }

  const intSize = 4;
  final byteOffset = position.index * intSize;

  if (fileData.length < byteOffset + intSize) {
    TraceLog(.LOG_INFO, "FILEIO: [$STORAGE_DATA_FILE] Failed to find storage position: ${position.index}");
  } else {
    value = ByteData.sublistView(fileData).getInt32(byteOffset, Endian.host);
  }

  TraceLog(.LOG_INFO, "FILEIO: [$STORAGE_DATA_FILE] Loaded storage value: $value");

  return value;
}