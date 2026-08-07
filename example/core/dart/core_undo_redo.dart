// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_undo_redo.c
// Run it: dart run core_undo_redo.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

const int MAX_UNDO_STATES = 26;
const int GRID_CELL_SIZE = 24;
const int MAX_GRID_CELLS_X = 30;
const int MAX_GRID_CELLS_Y = 13;

class Point {
  int x = 0;
  int y = 0;

  void set(num x, num y) {
    this.x = x.toInt();
    this.x = y.toInt();
  }
}

class PlayerState {
  Point cell = .new();
  ColorD color = .zero();

  bool equals(PlayerState other) {
    return
      other.cell.x == cell.x &&
      other.cell.y == cell.y &&
      other.color.r == color.r &&
      other.color.g == color.g &&
      other.color.b == color.b &&
      other.color.a == color.a;
  }

  PlayerState copy() {
    PlayerState copy = .new();
    copy.cell = .new();
    copy.cell.x = cell.x;
    copy.cell.y = cell.y;
    copy.color = color.copy();
    return copy;
  }
}

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_undo_redo");
  SetTargetFPS(60);

  int currentUndoIndex = 0;
  int firstUndoIndex = 0;
  int lastUndoIndex = 0;
  int undoFrameCounter = 0;
  final Vector2D undoInfoPos = .vec2(110, 400);

  PlayerState player = .new();
  player.cell.set(10, 10);
  player.color = RED;

  final List<PlayerState> states = .generate(MAX_UNDO_STATES, (_) => .new());
  for (int i = 0; i < MAX_UNDO_STATES; i++) states[i] = player.copy();

  final Vector2D gridPosition = .vec2(40, 60);

  while (!WindowShouldClose()) {
    if (IsKeyPressed(.KEY_RIGHT)) player.cell.x++;
    else if (IsKeyPressed(.KEY_LEFT)) player.cell.x--;
    else if (IsKeyPressed(.KEY_UP)) player.cell.y--;
    else if (IsKeyPressed(.KEY_DOWN)) player.cell.y++;

    if (player.cell.x < 0) player.cell.x = 0;
    else if (player.cell.x >= MAX_GRID_CELLS_X) player.cell.x = MAX_GRID_CELLS_X - 1;
    if (player.cell.y < 0) player.cell.y = 0;
    else if (player.cell.y >= MAX_GRID_CELLS_Y) player.cell.y = MAX_GRID_CELLS_Y - 1;

    if (IsKeyPressed(.KEY_SPACE))
    {
      player.color.r = GetRandomValue(20, 255);
      player.color.g = GetRandomValue(20, 220);
      player.color.b = GetRandomValue(20, 240);
    }

    undoFrameCounter++;

    if (undoFrameCounter >= 2)
    {
      if (!states[currentUndoIndex].equals(player))
      {
        currentUndoIndex++;
        if (currentUndoIndex >= MAX_UNDO_STATES) currentUndoIndex = 0;
        if (currentUndoIndex == firstUndoIndex) firstUndoIndex++;
        if (firstUndoIndex >= MAX_UNDO_STATES) firstUndoIndex = 0;

        states[currentUndoIndex] = player.copy();
        lastUndoIndex = currentUndoIndex;
      }

      undoFrameCounter = 0;
    }

    if (IsKeyDown(.KEY_LEFT_CONTROL) && IsKeyPressed(.KEY_Z))
    {
      if (currentUndoIndex != firstUndoIndex)
      {
        currentUndoIndex--;
        if (currentUndoIndex < 0) currentUndoIndex = MAX_UNDO_STATES - 1;

        if (!states[currentUndoIndex].equals(player))
        {
          player = states[currentUndoIndex].copy();
        }
      }
    }

    if (IsKeyDown(.KEY_LEFT_CONTROL) && IsKeyPressed(.KEY_Y))
    {
      if (currentUndoIndex != lastUndoIndex)
      {
        int nextUndoIndex = currentUndoIndex + 1;
        if (nextUndoIndex >= MAX_UNDO_STATES) nextUndoIndex = 0;

        if (nextUndoIndex != firstUndoIndex)
        {
          currentUndoIndex = nextUndoIndex;

          if (!states[currentUndoIndex].equals(player))
          {
            player = states[currentUndoIndex].copy();
          }
        }
      }
    }

    BeginDrawing();
      ClearBackground(RAYWHITE);

      DrawText("[ARROWS] MOVE PLAYER - [SPACE] CHANGE PLAYER COLOR", 40, 20, 20, DARKGRAY);

      if (lastUndoIndex > firstUndoIndex)
      {
        for (int i = firstUndoIndex; i < currentUndoIndex; i++)
          DrawRectangleRec(
            .rect(gridPosition.x + states[i].cell.x*GRID_CELL_SIZE, gridPosition.y + states[i].cell.y*GRID_CELL_SIZE, GRID_CELL_SIZE, GRID_CELL_SIZE),
            LIGHTGRAY
          );
      }
      else if (firstUndoIndex > lastUndoIndex)
      {
        if ((currentUndoIndex < MAX_UNDO_STATES) && (currentUndoIndex > lastUndoIndex))
        {
          for (int i = firstUndoIndex; i < currentUndoIndex; i++)
            DrawRectangleRec(
              .rect(gridPosition.x + states[i].cell.x*GRID_CELL_SIZE, gridPosition.y + states[i].cell.y*GRID_CELL_SIZE, GRID_CELL_SIZE, GRID_CELL_SIZE),
              LIGHTGRAY
            );
        }
        else
        {
          for (int i = firstUndoIndex; i < MAX_UNDO_STATES; i++)
            DrawRectangle(
              gridPosition.x + states[i].cell.x*GRID_CELL_SIZE, gridPosition.y + states[i].cell.y*GRID_CELL_SIZE, GRID_CELL_SIZE, GRID_CELL_SIZE,
              LIGHTGRAY
            );
          for (int i = 0; i < currentUndoIndex; i++)
            DrawRectangle(
              gridPosition.x + states[i].cell.x*GRID_CELL_SIZE, gridPosition.y + states[i].cell.y*GRID_CELL_SIZE, GRID_CELL_SIZE, GRID_CELL_SIZE,
              LIGHTGRAY
            );
        }
      }

      for (int y = 0; y <= MAX_GRID_CELLS_Y; y++)
        DrawLine(
          gridPosition.x, gridPosition.y + y*GRID_CELL_SIZE, gridPosition.x + MAX_GRID_CELLS_X*GRID_CELL_SIZE, gridPosition.y + y*GRID_CELL_SIZE,
          GRAY
        );
      for (int x = 0; x <= MAX_GRID_CELLS_X; x++)
        DrawLine(
          gridPosition.x + x*GRID_CELL_SIZE, gridPosition.y, gridPosition.x + x*GRID_CELL_SIZE, gridPosition.y + MAX_GRID_CELLS_Y*GRID_CELL_SIZE,
          GRAY
        );

      DrawRectangle(
        gridPosition.x + player.cell.x*GRID_CELL_SIZE, gridPosition.y + player.cell.y*GRID_CELL_SIZE, GRID_CELL_SIZE + 1, GRID_CELL_SIZE + 1,
        player.color
      );

      DrawText("UNDO STATES:", undoInfoPos.x - 85, undoInfoPos.y + 9, 10, DARKGRAY);
      DrawUndoBuffer(undoInfoPos, firstUndoIndex, lastUndoIndex, currentUndoIndex, 24);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void DrawUndoBuffer(Vector2D position, int firstUndoIndex, int lastUndoIndex, int currentUndoIndex, int slotSize)
{
  DrawRectangle(position.x + 8 + slotSize*currentUndoIndex, position.y - 10, 8, 8, RED);
  DrawRectangleLines(position.x + 2 + slotSize*firstUndoIndex, position.y + 27, 8, 8, BLACK);
  DrawRectangle(position.x + 14 + slotSize*lastUndoIndex, position.y + 27, 8, 8, BLACK);

  for (int i = 0; i < MAX_UNDO_STATES; i++)
  {
    DrawRectangle(position.x + slotSize*i, position.y, slotSize, slotSize, LIGHTGRAY);
    DrawRectangleLines(position.x + slotSize*i, position.y, slotSize, slotSize, GRAY);
  }

  if (firstUndoIndex <= lastUndoIndex)
  {
    for (int i = firstUndoIndex; i < lastUndoIndex + 1; i++)
    {
      DrawRectangle(position.x + slotSize*i, position.y, slotSize, slotSize, SKYBLUE);
      DrawRectangleLines(position.x + slotSize*i, position.y, slotSize, slotSize, BLUE);
    }
  }
  else if (lastUndoIndex < firstUndoIndex)
  {
    for (int i = firstUndoIndex; i < MAX_UNDO_STATES; i++)
    {
      DrawRectangle(position.x + slotSize*i, position.y, slotSize, slotSize, SKYBLUE);
      DrawRectangleLines(position.x + slotSize*i, position.y, slotSize, slotSize, BLUE);
    }

    for (int i = 0; i < lastUndoIndex + 1; i++)
    {
      DrawRectangle(position.x + slotSize*i, position.y, slotSize, slotSize, SKYBLUE);
      DrawRectangleLines(position.x + slotSize*i, position.y, slotSize, slotSize, BLUE);
    }
  }

  if (firstUndoIndex < currentUndoIndex)
  {
    for (int i = firstUndoIndex; i < currentUndoIndex; i++)
    {
      DrawRectangle(position.x + slotSize*i, position.y, slotSize, slotSize, GREEN);
      DrawRectangleLines(position.x + slotSize*i, position.y, slotSize, slotSize, LIME);
    }
  }
  else if (currentUndoIndex < firstUndoIndex)
  {
    for (int i = firstUndoIndex; i < MAX_UNDO_STATES; i++)
    {
      DrawRectangle(position.x + slotSize*i, position.y, slotSize, slotSize, GREEN);
      DrawRectangleLines(position.x + slotSize*i, position.y, slotSize, slotSize, LIME);
    }

    for (int i = 0; i < currentUndoIndex; i++)
    {
      DrawRectangle(position.x + slotSize*i, position.y, slotSize, slotSize, GREEN);
      DrawRectangleLines(position.x + slotSize*i, position.y, slotSize, slotSize, LIME);
    }
  }

  DrawRectangle(position.x + slotSize*currentUndoIndex, position.y, slotSize, slotSize, GOLD);
  DrawRectangleLines(position.x + slotSize*currentUndoIndex, position.y, slotSize, slotSize, ORANGE);
}
