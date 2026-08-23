import 'package:raylib_dartified/raylib_dartified.dart';

RaylibCameraD get _module => Raylib.instance.CameraD;

/// See [RaylibCameraD.GetCameraForward].
Vector3D GetCameraForward(
  Camera3DD camera,
) => _module.GetCameraForward(camera);

/// See [RaylibCameraD.GetCameraUp].
Vector3D GetCameraUp(
  Camera3DD camera,
) => _module.GetCameraUp(camera);

/// See [RaylibCameraD.GetCameraRight].
Vector3D GetCameraRight(
  Camera3DD camera,
) => _module.GetCameraRight(camera);

/// See [RaylibCameraD.CameraMoveForward].
void CameraMoveForward(
  Camera3DD camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveForward(camera, distance, moveInWorldPlane);

/// See [RaylibCameraD.CameraMoveUp].
void CameraMoveUp(
  Camera3DD camera,
  num distance,
) => _module.CameraMoveUp(camera, distance);

/// See [RaylibCameraD.CameraMoveRight].
void CameraMoveRight(
  Camera3DD camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveRight(camera, distance, moveInWorldPlane);

/// See [RaylibCameraD.CameraMoveToTarget].
void CameraMoveToTarget(
  Camera3DD camera,
  num delta,
) => _module.CameraMoveToTarget(camera, delta);

/// See [RaylibCameraD.CameraYaw].
void CameraYaw(
  Camera3DD camera,
  num angle,
  bool rotateAroundTarget,
) => _module.CameraYaw(camera, angle, rotateAroundTarget);

/// See [RaylibCameraD.CameraPitch].
void CameraPitch(
  Camera3DD camera,
  num angle,
  bool lockView,
  bool rotateAroundTarget,
  bool rotateUp,
) => _module.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);

/// See [RaylibCameraD.CameraRoll].
void CameraRoll(
  Camera3DD camera,
  num angle,
) => _module.CameraRoll(camera, angle);

/// See [RaylibCameraD.GetCameraViewMatrix].
MatrixD GetCameraViewMatrix(
  Camera3DD camera,
) => _module.GetCameraViewMatrix(camera);

/// See [RaylibCameraD.GetCameraProjectionMatrix].
MatrixD GetCameraProjectionMatrix(
  Camera3DD camera,
  num aspect,
) => _module.GetCameraProjectionMatrix(camera, aspect);
