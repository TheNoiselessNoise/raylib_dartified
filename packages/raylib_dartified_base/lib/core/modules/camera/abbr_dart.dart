import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibCameraDart get _module => RaylibBase.instance.module();

/// See [RaylibCameraDart.GetCameraForward].
Vector3 GetCameraForward(
  Camera3D camera,
) => _module.GetCameraForward(camera);

/// See [RaylibCameraDart.GetCameraUp].
Vector3 GetCameraUp(
  Camera3D camera,
) => _module.GetCameraUp(camera);

/// See [RaylibCameraDart.GetCameraRight].
Vector3 GetCameraRight(
  Camera3D camera,
) => _module.GetCameraRight(camera);

/// See [RaylibCameraDart.CameraMoveForward].
void CameraMoveForward(
  Camera3D camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveForward(camera, distance, moveInWorldPlane);

/// See [RaylibCameraDart.CameraMoveUp].
void CameraMoveUp(
  Camera3D camera,
  num distance,
) => _module.CameraMoveUp(camera, distance);

/// See [RaylibCameraDart.CameraMoveRight].
void CameraMoveRight(
  Camera3D camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveRight(camera, distance, moveInWorldPlane);

/// See [RaylibCameraDart.CameraMoveToTarget].
void CameraMoveToTarget(
  Camera3D camera,
  num delta,
) => _module.CameraMoveToTarget(camera, delta);

/// See [RaylibCameraDart.CameraYaw].
void CameraYaw(
  Camera3D camera,
  num angle,
  bool rotateAroundTarget,
) => _module.CameraYaw(camera, angle, rotateAroundTarget);

/// See [RaylibCameraDart.CameraPitch].
void CameraPitch(
  Camera3D camera,
  num angle,
  bool lockView,
  bool rotateAroundTarget,
  bool rotateUp,
) => _module.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);

/// See [RaylibCameraDart.CameraRoll].
void CameraRoll(
  Camera3D camera,
  num angle,
) => _module.CameraRoll(camera, angle);

/// See [RaylibCameraDart.GetCameraViewMatrix].
Matrix GetCameraViewMatrix(
  Camera3D camera,
) => _module.GetCameraViewMatrix(camera);

/// See [RaylibCameraDart.GetCameraProjectionMatrix].
Matrix GetCameraProjectionMatrix(
  Camera3D camera,
  num aspect,
) => _module.GetCameraProjectionMatrix(camera, aspect);
