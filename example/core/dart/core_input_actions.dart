// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_actions.c
// Run it: dart run core_input_actions.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;

enum ActionType {
  NO_ACTION,
  ACTION_UP,
  ACTION_DOWN,
  ACTION_LEFT,
  ACTION_RIGHT,
  ACTION_FIRE,
}

class ActionInput {
  late KeyboardKey key;
  late GamepadButton button;
}

int gamepadIndex = 0;
final List<ActionInput> actionInputs = .generate(ActionType.values.length, (_) => .new());

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_input_actions");
  SetTargetFPS(60);

  bool actionSet = false;
  SetActionsDefault();
  bool releaseAction = false;

  final Vector2D position = .vec2(400.0, 200.0);
  final Vector2D size = .vec2(40.0, 40.0);

  while (!WindowShouldClose()) {
    gamepadIndex = 0;

    if (IsActionDown(.ACTION_UP)) position.y -= 2;
    if (IsActionDown(.ACTION_DOWN)) position.y += 2;
    if (IsActionDown(.ACTION_LEFT)) position.x -= 2;
    if (IsActionDown(.ACTION_RIGHT)) position.x += 2;
    if (IsActionPressed(.ACTION_FIRE))
    {
      position.x = (screenWidth-size.x)/2;
      position.y = (screenHeight-size.y)/2;
    }

    releaseAction = false;
    if (IsActionReleased(.ACTION_FIRE)) releaseAction = true;

    if (IsKeyPressed(.KEY_TAB))
    {
      actionSet = !actionSet;
      if (!actionSet) SetActionsDefault();
      else SetActionsCursor();
    }

    BeginDrawing();

      ClearBackground(GRAY);

      DrawRectangleV(position, size, releaseAction ? BLUE : RED);

      DrawText(!actionSet ? "Current input set: WASD (default)" : "Current input set: Arrow keys", 10, 10, 20, WHITE);
      DrawText("Use TAB key to toggles Actions keyset", 10, 50, 20, GREEN);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

bool IsActionPressed(ActionType action)
{
  return IsKeyPressed(actionInputs[action.index].key) || IsGamepadButtonPressed(gamepadIndex, actionInputs[action.index].button);
}

bool IsActionReleased(ActionType action)
{
  return IsKeyReleased(actionInputs[action.index].key) || IsGamepadButtonReleased(gamepadIndex, actionInputs[action.index].button);
}

bool IsActionDown(ActionType action)
{
  return IsKeyDown(actionInputs[action.index].key) || IsGamepadButtonDown(gamepadIndex, actionInputs[action.index].button);
}

void SetActionsDefault()
{
  actionInputs[ActionType.ACTION_UP.index].key = .KEY_W;
  actionInputs[ActionType.ACTION_DOWN.index].key = .KEY_S;
  actionInputs[ActionType.ACTION_LEFT.index].key = .KEY_A;
  actionInputs[ActionType.ACTION_RIGHT.index].key = .KEY_D;
  actionInputs[ActionType.ACTION_FIRE.index].key = .KEY_SPACE;

  actionInputs[ActionType.ACTION_UP.index].button = .GAMEPAD_BUTTON_LEFT_FACE_UP;
  actionInputs[ActionType.ACTION_DOWN.index].button = .GAMEPAD_BUTTON_LEFT_FACE_DOWN;
  actionInputs[ActionType.ACTION_LEFT.index].button = .GAMEPAD_BUTTON_LEFT_FACE_LEFT;
  actionInputs[ActionType.ACTION_RIGHT.index].button = .GAMEPAD_BUTTON_LEFT_FACE_RIGHT;
  actionInputs[ActionType.ACTION_FIRE.index].button = .GAMEPAD_BUTTON_RIGHT_FACE_DOWN;
}

void SetActionsCursor()
{
  actionInputs[ActionType.ACTION_UP.index].key = .KEY_UP;
  actionInputs[ActionType.ACTION_DOWN.index].key = .KEY_DOWN;
  actionInputs[ActionType.ACTION_LEFT.index].key = .KEY_LEFT;
  actionInputs[ActionType.ACTION_RIGHT.index].key = .KEY_RIGHT;
  actionInputs[ActionType.ACTION_FIRE.index].key = .KEY_SPACE;

  actionInputs[ActionType.ACTION_UP.index].button = .GAMEPAD_BUTTON_RIGHT_FACE_UP;
  actionInputs[ActionType.ACTION_DOWN.index].button = .GAMEPAD_BUTTON_RIGHT_FACE_DOWN;
  actionInputs[ActionType.ACTION_LEFT.index].button = .GAMEPAD_BUTTON_RIGHT_FACE_LEFT;
  actionInputs[ActionType.ACTION_RIGHT.index].button = .GAMEPAD_BUTTON_RIGHT_FACE_RIGHT;
  actionInputs[ActionType.ACTION_FIRE.index].button = .GAMEPAD_BUTTON_LEFT_FACE_DOWN;
}
