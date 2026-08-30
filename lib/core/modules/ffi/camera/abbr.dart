import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibCamera get _module => Raylib.instance.Camera;

/// See [RaylibCamera.GetCameraForward].
Vector3C GetCameraForward(Pointer<Camera3DC> camera) => _module.GetCameraForward(camera);

/// See [RaylibCamera.GetCameraUp].
Vector3C GetCameraUp(Pointer<Camera3DC> camera) => _module.GetCameraUp(camera);

/// See [RaylibCamera.GetCameraRight].
Vector3C GetCameraRight(Pointer<Camera3DC> camera) => _module.GetCameraRight(camera);

/// See [RaylibCamera.CameraMoveForward].
void CameraMoveForward(
  Pointer<Camera3DC> camera,
  double distance,
  bool moveInWorldPlane,
) => _module.CameraMoveForward(camera, distance, moveInWorldPlane);

/// See [RaylibCamera.CameraMoveUp].
void CameraMoveUp(Pointer<Camera3DC> camera, double distance) => _module.CameraMoveUp(camera, distance);

/// See [RaylibCamera.CameraMoveRight].
void CameraMoveRight(
  Pointer<Camera3DC> camera,
  double distance,
  bool moveInWorldPlane,
) => _module.CameraMoveRight(camera, distance, moveInWorldPlane);

/// See [RaylibCamera.CameraMoveToTarget].
void CameraMoveToTarget(Pointer<Camera3DC> camera, double delta) => _module.CameraMoveToTarget(camera, delta);

/// See [RaylibCamera.CameraYaw].
void CameraYaw(
  Pointer<Camera3DC> camera,
  double angle,
  bool rotateAroundTarget,
) => _module.CameraYaw(camera, angle, rotateAroundTarget);

/// See [RaylibCamera.CameraPitch].
void CameraPitch(
  Pointer<Camera3DC> camera,
  double angle,
  bool lockView,
  bool rotateAroundTarget,
  bool rotateUp,
) => _module.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);

/// See [RaylibCamera.CameraRoll].
void CameraRoll(Pointer<Camera3DC> camera, double angle) => _module.CameraRoll(camera, angle);

/// See [RaylibCamera.GetCameraViewMatrix].
MatrixC GetCameraViewMatrix(Pointer<Camera3DC> camera) => _module.GetCameraViewMatrix(camera);

/// See [RaylibCamera.GetCameraProjectionMatrix].
MatrixC GetCameraProjectionMatrix(Pointer<Camera3DC> camera, double aspect) => _module.GetCameraProjectionMatrix(camera, aspect);

