// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/core/core_input_actions.c
// Run it: dart run core_input_actions.dart
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

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

final class ActionInput extends Struct {
  @Int() external int key;
  @Int() external int button;
}

int gamepadIndex = 0;
final actionInputs = calloc<ActionInput>(ActionType.values.length);

void main() {
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "core_input_actions".toC);
  SetTargetFPS(60);

  bool actionSet = false;
  SetActionsDefault();
  bool releaseAction = false;

  final position = Vector2$.$new.set(400.0, 200.0);
  final size = Vector2$.$new.set(40.0, 40.0);

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

    if (IsKeyPressed(KeyboardKey.KEY_TAB.value))
    {
      actionSet = !actionSet;
      if (!actionSet) SetActionsDefault();
      else SetActionsCursor();
    }

    BeginDrawing();

      ClearBackground(GRAY);

      DrawRectangleV(position, size, releaseAction ? BLUE : RED);

      DrawText(!actionSet ? "Current input set: WASD (default)".toC : "Current input set: Arrow keys".toC, 10, 10, 20, WHITE);
      DrawText("Use TAB key to toggles Actions keyset".toC, 10, 50, 20, GREEN);

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
  actionInputs[ActionType.ACTION_UP.index].key = KeyboardKey.KEY_W.value;
  actionInputs[ActionType.ACTION_DOWN.index].key = KeyboardKey.KEY_S.value;
  actionInputs[ActionType.ACTION_LEFT.index].key = KeyboardKey.KEY_A.value;
  actionInputs[ActionType.ACTION_RIGHT.index].key = KeyboardKey.KEY_D.value;
  actionInputs[ActionType.ACTION_FIRE.index].key = KeyboardKey.KEY_SPACE.value;

  actionInputs[ActionType.ACTION_UP.index].button = GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_UP.value;
  actionInputs[ActionType.ACTION_DOWN.index].button = GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_DOWN.value;
  actionInputs[ActionType.ACTION_LEFT.index].button = GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_LEFT.value;
  actionInputs[ActionType.ACTION_RIGHT.index].button = GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_RIGHT.value;
  actionInputs[ActionType.ACTION_FIRE.index].button = GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_DOWN.value;
}

void SetActionsCursor()
{
  actionInputs[ActionType.ACTION_UP.index].key = KeyboardKey.KEY_UP.value;
  actionInputs[ActionType.ACTION_DOWN.index].key = KeyboardKey.KEY_DOWN.value;
  actionInputs[ActionType.ACTION_LEFT.index].key = KeyboardKey.KEY_LEFT.value;
  actionInputs[ActionType.ACTION_RIGHT.index].key = KeyboardKey.KEY_RIGHT.value;
  actionInputs[ActionType.ACTION_FIRE.index].key = KeyboardKey.KEY_SPACE.value;

  actionInputs[ActionType.ACTION_UP.index].button = GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_UP.value;
  actionInputs[ActionType.ACTION_DOWN.index].button = GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_DOWN.value;
  actionInputs[ActionType.ACTION_LEFT.index].button = GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_LEFT.value;
  actionInputs[ActionType.ACTION_RIGHT.index].button = GamepadButton.GAMEPAD_BUTTON_RIGHT_FACE_RIGHT.value;
  actionInputs[ActionType.ACTION_FIRE.index].button = GamepadButton.GAMEPAD_BUTTON_LEFT_FACE_DOWN.value;
}
