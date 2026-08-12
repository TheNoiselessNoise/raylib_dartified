// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_undo_redo.c
// Run it: dart run core_undo_redo.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int MAX_UNDO_STATES = 26;
const int GRID_CELL_SIZE = 24;
const int MAX_GRID_CELLS_X = 30;
const int MAX_GRID_CELLS_Y = 13;

final class Point extends Struct {
  @Int() external int x;
  @Int() external int y;

  void set(num x, num y) {
    this.x = x.toInt();
    this.x = y.toInt();
  }
}

final class PlayerState extends Struct {
  external Point cell;
  external ColorC color;
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_undo_redo".toC);
  SetTargetFPS(60);

  int currentUndoIndex = 0;
  int firstUndoIndex = 0;
  int lastUndoIndex = 0;
  int undoFrameCounter = 0;
  final undoInfoPos = Vector2$.val.$new.set(110, 400);

  final player = calloc<PlayerState>();
  player.ref.cell.set(10, 10);
  player.ref.color = RED;

  final states = calloc<PlayerState>(MAX_UNDO_STATES);
  for (int i = 0; i < MAX_UNDO_STATES; i++) states[i] = player.ref;

  final gridPosition = Vector2$.val.$new.set(40, 60);

  while (!WindowShouldClose()) {
    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) player.ref.cell.x++;
    else if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) player.ref.cell.x--;
    else if (IsKeyPressed(KeyboardKey.KEY_UP.value)) player.ref.cell.y--;
    else if (IsKeyPressed(KeyboardKey.KEY_DOWN.value)) player.ref.cell.y++;

    if (player.ref.cell.x < 0) player.ref.cell.x = 0;
    else if (player.ref.cell.x >= MAX_GRID_CELLS_X) player.ref.cell.x = MAX_GRID_CELLS_X - 1;
    if (player.ref.cell.y < 0) player.ref.cell.y = 0;
    else if (player.ref.cell.y >= MAX_GRID_CELLS_Y) player.ref.cell.y = MAX_GRID_CELLS_Y - 1;

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
    {
      player.ref.color.r = GetRandomValue(20, 255);
      player.ref.color.g = GetRandomValue(20, 220);
      player.ref.color.b = GetRandomValue(20, 240);
    }

    undoFrameCounter++;

    if (undoFrameCounter >= 2)
    {
      if (memcmp((states + currentUndoIndex).cast(), player.cast(), sizeOf<PlayerState>()) != 0)
      {
        currentUndoIndex++;
        if (currentUndoIndex >= MAX_UNDO_STATES) currentUndoIndex = 0;
        if (currentUndoIndex == firstUndoIndex) firstUndoIndex++;
        if (firstUndoIndex >= MAX_UNDO_STATES) firstUndoIndex = 0;

        states[currentUndoIndex] = player.ref;
        lastUndoIndex = currentUndoIndex;
      }

      undoFrameCounter = 0;
    }

    if (IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) && IsKeyPressed(KeyboardKey.KEY_Z.value))
    {
      if (currentUndoIndex != firstUndoIndex)
      {
        currentUndoIndex--;
        if (currentUndoIndex < 0) currentUndoIndex = MAX_UNDO_STATES - 1;

        if (memcmp((states + currentUndoIndex).cast(), player.cast(), sizeOf<PlayerState>()) != 0)
        {
          player.ref = states[currentUndoIndex];
        }
      }
    }

    if (IsKeyDown(KeyboardKey.KEY_LEFT_CONTROL.value) && IsKeyPressed(KeyboardKey.KEY_Y.value))
    {
      if (currentUndoIndex != lastUndoIndex)
      {
        int nextUndoIndex = currentUndoIndex + 1;
        if (nextUndoIndex >= MAX_UNDO_STATES) nextUndoIndex = 0;

        if (nextUndoIndex != firstUndoIndex)
        {
          currentUndoIndex = nextUndoIndex;

          if (memcmp((states + currentUndoIndex).cast(), player.cast(), sizeOf<PlayerState>()) != 0)
          {
            player.ref = states[currentUndoIndex];
          }
        }
      }
    }

    BeginDrawing();
      ClearBackground(RAYWHITE);

      DrawText("[ARROWS] MOVE PLAYER - [SPACE] CHANGE PLAYER COLOR".toC, 40, 20, 20, DARKGRAY);

      if (lastUndoIndex > firstUndoIndex)
      {
        for (int i = firstUndoIndex; i < currentUndoIndex; i++)
          DrawRectangleRec(
            Rectangle$.val.$1.set(gridPosition.x + states[i].cell.x*GRID_CELL_SIZE, gridPosition.y + states[i].cell.y*GRID_CELL_SIZE, GRID_CELL_SIZE, GRID_CELL_SIZE),
            LIGHTGRAY
          );
      }
      else if (firstUndoIndex > lastUndoIndex)
      {
        if ((currentUndoIndex < MAX_UNDO_STATES) && (currentUndoIndex > lastUndoIndex))
        {
          for (int i = firstUndoIndex; i < currentUndoIndex; i++)
            DrawRectangleRec(
              Rectangle$.val.$1.set(gridPosition.x + states[i].cell.x*GRID_CELL_SIZE, gridPosition.y + states[i].cell.y*GRID_CELL_SIZE, GRID_CELL_SIZE, GRID_CELL_SIZE),
              LIGHTGRAY
            );
        }
        else
        {
          for (int i = firstUndoIndex; i < MAX_UNDO_STATES; i++)
            DrawRectangle(
              (gridPosition.x + states[i].cell.x*GRID_CELL_SIZE).toInt(), (gridPosition.y + states[i].cell.y*GRID_CELL_SIZE).toInt(), GRID_CELL_SIZE, GRID_CELL_SIZE,
              LIGHTGRAY
            );
          for (int i = 0; i < currentUndoIndex; i++)
            DrawRectangle(
              (gridPosition.x + states[i].cell.x*GRID_CELL_SIZE).toInt(), (gridPosition.y + states[i].cell.y*GRID_CELL_SIZE).toInt(), GRID_CELL_SIZE, GRID_CELL_SIZE,
              LIGHTGRAY
            );
        }
      }

      for (int y = 0; y <= MAX_GRID_CELLS_Y; y++)
        DrawLine(
          gridPosition.x.toInt(), (gridPosition.y + y*GRID_CELL_SIZE).toInt(), (gridPosition.x + MAX_GRID_CELLS_X*GRID_CELL_SIZE).toInt(), (gridPosition.y + y*GRID_CELL_SIZE).toInt(),
          GRAY
        );
      for (int x = 0; x <= MAX_GRID_CELLS_X; x++)
        DrawLine(
          (gridPosition.x + x*GRID_CELL_SIZE).toInt(), gridPosition.y.toInt(), (gridPosition.x + x*GRID_CELL_SIZE).toInt(), (gridPosition.y + MAX_GRID_CELLS_Y*GRID_CELL_SIZE).toInt(),
          GRAY
        );

      DrawRectangle(
        (gridPosition.x + player.ref.cell.x*GRID_CELL_SIZE).toInt(), (gridPosition.y + player.ref.cell.y*GRID_CELL_SIZE).toInt(), GRID_CELL_SIZE + 1, GRID_CELL_SIZE + 1,
        player.ref.color
      );

      DrawText("UNDO STATES:".toC, (undoInfoPos.x - 85).toInt(), (undoInfoPos.y + 9).toInt(), 10, DARKGRAY);
      DrawUndoBuffer(undoInfoPos, firstUndoIndex, lastUndoIndex, currentUndoIndex, 24);

    EndDrawing();
  }

  calloc.free(player);
  calloc.free(states);

  CloseWindowAndDispose();
}

void DrawUndoBuffer(Vector2C position, int firstUndoIndex, int lastUndoIndex, int currentUndoIndex, int slotSize)
{
  DrawRectangle((position.x + 8 + slotSize*currentUndoIndex).toInt(), (position.y - 10).toInt(), 8, 8, RED);
  DrawRectangleLines((position.x + 2 + slotSize*firstUndoIndex).toInt(), (position.y + 27).toInt(), 8, 8, BLACK);
  DrawRectangle((position.x + 14 + slotSize*lastUndoIndex).toInt(), (position.y + 27).toInt(), 8, 8, BLACK);

  for (int i = 0; i < MAX_UNDO_STATES; i++)
  {
    DrawRectangle((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, LIGHTGRAY);
    DrawRectangleLines((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, GRAY);
  }

  if (firstUndoIndex <= lastUndoIndex)
  {
    for (int i = firstUndoIndex; i < lastUndoIndex + 1; i++)
    {
      DrawRectangle((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, SKYBLUE);
      DrawRectangleLines((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, BLUE);
    }
  }
  else if (lastUndoIndex < firstUndoIndex)
  {
    for (int i = firstUndoIndex; i < MAX_UNDO_STATES; i++)
    {
      DrawRectangle((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, SKYBLUE);
      DrawRectangleLines((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, BLUE);
    }

    for (int i = 0; i < lastUndoIndex + 1; i++)
    {
      DrawRectangle((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, SKYBLUE);
      DrawRectangleLines((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, BLUE);
    }
  }

  if (firstUndoIndex < currentUndoIndex)
  {
    for (int i = firstUndoIndex; i < currentUndoIndex; i++)
    {
      DrawRectangle((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, GREEN);
      DrawRectangleLines((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, LIME);
    }
  }
  else if (currentUndoIndex < firstUndoIndex)
  {
    for (int i = firstUndoIndex; i < MAX_UNDO_STATES; i++)
    {
      DrawRectangle((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, GREEN);
      DrawRectangleLines((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, LIME);
    }

    for (int i = 0; i < currentUndoIndex; i++)
    {
      DrawRectangle((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, GREEN);
      DrawRectangleLines((position.x + slotSize*i).toInt(), position.y.toInt(), slotSize, slotSize, LIME);
    }
  }

  DrawRectangle((position.x + slotSize*currentUndoIndex).toInt(), position.y.toInt(), slotSize, slotSize, GOLD);
  DrawRectangleLines((position.x + slotSize*currentUndoIndex).toInt(), position.y.toInt(), slotSize, slotSize, ORANGE);
}
