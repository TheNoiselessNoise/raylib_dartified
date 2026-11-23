import 'package:raylib_dartified/raylib_dartified.dart';

RaylibCameraFlat get _module => Raylib.instance.module();

/// See [RaylibCameraFlat.GetCameraForward].
Vector3 GetCameraForward(
  XStructPtr<Camera3D> camera,
) => _module.GetCameraForward(camera);

/// See [RaylibCameraFlat.GetCameraUp].
Vector3 GetCameraUp(
  XStructPtr<Camera3D> camera,
) => _module.GetCameraUp(camera);

/// See [RaylibCameraFlat.GetCameraRight].
Vector3 GetCameraRight(
  XStructPtr<Camera3D> camera,
) => _module.GetCameraRight(camera);

/// See [RaylibCameraFlat.CameraMoveForward].
void CameraMoveForward(
  XStructPtr<Camera3D> camera,
  double distance,
  bool moveInWorldPlane,
) => _module.CameraMoveForward(camera, distance, moveInWorldPlane);

/// See [RaylibCameraFlat.CameraMoveUp].
void CameraMoveUp(
  XStructPtr<Camera3D> camera,
  double distance,
) => _module.CameraMoveUp(camera, distance);

/// See [RaylibCameraFlat.CameraMoveRight].
void CameraMoveRight(
  XStructPtr<Camera3D> camera,
  double distance,
  bool moveInWorldPlane,
) => _module.CameraMoveRight(camera, distance, moveInWorldPlane);

/// See [RaylibCameraFlat.CameraMoveToTarget].
void CameraMoveToTarget(
  XStructPtr<Camera3D> camera,
  double delta,
) => _module.CameraMoveToTarget(camera, delta);

/// See [RaylibCameraFlat.CameraYaw].
void CameraYaw(
  XStructPtr<Camera3D> camera,
  double angle,
  bool rotateAroundTarget,
) => _module.CameraYaw(camera, angle, rotateAroundTarget);

/// See [RaylibCameraFlat.CameraPitch].
void CameraPitch(
  XStructPtr<Camera3D> camera,
  double angle,
  bool lockView,
  bool rotateAroundTarget,
  bool rotateUp,
) => _module.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);

/// See [RaylibCameraFlat.CameraRoll].
void CameraRoll(
  XStructPtr<Camera3D> camera,
  double angle,
) => _module.CameraRoll(camera, angle);

/// See [RaylibCameraFlat.GetCameraViewMatrix].
Matrix GetCameraViewMatrix(
  XStructPtr<Camera3D> camera,
) => _module.GetCameraViewMatrix(camera);

/// See [RaylibCameraFlat.GetCameraProjectionMatrix].
Matrix GetCameraProjectionMatrix(
  XStructPtr<Camera3D> camera,
  double aspect,
) => _module.GetCameraProjectionMatrix(camera, aspect);