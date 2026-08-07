// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_storage_values.c
// Run it: dart run core_storage_values.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const String STORAGE_DATA_FILE = "storage.data";

enum StorageData {
  STORAGE_POSITION_SCORE,
  STORAGE_POSITION_HISCORE
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_storage_values".toC);
  SetTargetFPS(60);

  int score = 0;
  int hiscore = 0;
  int framesCounter = 0;

  while (!WindowShouldClose()) {
    if (IsKeyPressed(KeyboardKey.KEY_R.value))
    {
      score = GetRandomValue(1000, 2000);
      hiscore = GetRandomValue(2000, 4000);
    }

    if (IsKeyPressed(KeyboardKey.KEY_ENTER.value))
    {
      SaveStorageValue(.STORAGE_POSITION_SCORE, score);
      SaveStorageValue(.STORAGE_POSITION_HISCORE, hiscore);
    }
    else if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      score = LoadStorageValue(.STORAGE_POSITION_SCORE);
      hiscore = LoadStorageValue(.STORAGE_POSITION_HISCORE);
    }

    framesCounter++;

    BeginDrawing();

      ClearBackground(RAYWHITE);

      DrawText("SCORE: $score".toC, 280, 130, 40, MAROON);
      DrawText("HI-SCORE: $hiscore".toC, 210, 200, 50, BLACK);

      DrawText("frames: $framesCounter".toC, 10, 10, 20, LIME);

      DrawText("Press R to generate random numbers".toC, 220, 40, 20, LIGHTGRAY);
      DrawText("Press ENTER to SAVE values".toC, 250, 310, 20, LIGHTGRAY);
      DrawText("Press SPACE to LOAD values".toC, 252, 350, 20, LIGHTGRAY);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

bool SaveStorageValue(StorageData position, int value)
{
  bool success = false;
  final dataSize = Int$.$newPtr;
  int newDataSize = 0;
  var fileData = LoadFileData(STORAGE_DATA_FILE.toC, dataSize);
  Pointer<UnsignedChar> newFileData = nullptr;

  if (fileData != nullptr)
  {
    if (dataSize.value <= position.index*sizeOf<Int>())
    {
      newDataSize = (position.index + 1)*sizeOf<Int>();
      newFileData = realloc(fileData.cast(), dataSize.value, newDataSize).cast();

      if (newFileData != nullptr)
      {
        final dataPtr = newFileData.cast<Int32>();
        dataPtr[position.index] = value;
      }
      else
      {
        TraceLog(
          TraceLogLevel.LOG_WARNING.value,
          "FILEIO: [$STORAGE_DATA_FILE] Failed to realloc data ($dataSize), position in bytes (${position.index*sizeOf<Int>()}) bigger than actual file size".toC
        );
        newFileData = fileData;
        newDataSize = dataSize.value;
      }
    }
    else
    {
      newFileData = fileData;
      newDataSize = dataSize.value;
      final dataPtr = newFileData.cast<Int32>();
      dataPtr[position.index] = value;
    }

    success = SaveFileData(STORAGE_DATA_FILE.toC, newFileData.cast(), newDataSize);
    calloc.free(newFileData);

    TraceLog(
      TraceLogLevel.LOG_INFO.value,
      "FILEIO: [$STORAGE_DATA_FILE] Saved storage value: $value".toC
    );
  }
  else
  {
    TraceLog(
      TraceLogLevel.LOG_INFO.value,
      "FILEIO: [$STORAGE_DATA_FILE] File created successfully".toC 
    );

    dataSize.value = (position.index + 1)*sizeOf<Int>();
    fileData = calloc<UnsignedChar>(dataSize.value);
    final dataPtr = fileData.cast<Int32>();
    dataPtr[position.index] = value;

    success = SaveFileData(STORAGE_DATA_FILE.toC, fileData.cast(), dataSize.value);
    UnloadFileData(fileData);

    TraceLog(
      TraceLogLevel.LOG_INFO.value,
      "FILEIO: [$STORAGE_DATA_FILE] Saved storage value: $value".toC
    );
  }

  return success;
}

int LoadStorageValue(StorageData position)
{
  int value = 0;
  final dataSize = Int$.$newPtr;
  final fileData = LoadFileData(STORAGE_DATA_FILE.toC, dataSize);

  if (fileData != nullptr)
  {
    if (dataSize.value < position.index*4) TraceLog(
      TraceLogLevel.LOG_WARNING.value,
      "FILEIO: [$STORAGE_DATA_FILE] Failed to find storage position: ${position.index}".toC
    );
    else
    {
      final dataPtr = fileData.cast<Int32>();
      value = dataPtr[position.index];
    }

    UnloadFileData(fileData);

    TraceLog(
      TraceLogLevel.LOG_INFO.value,
      "FILEIO: [$STORAGE_DATA_FILE] Loaded storage value: $value".toC
    );
  }

  return value;
}