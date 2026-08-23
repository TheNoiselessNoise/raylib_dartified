import 'package:raylib_dartified/raylib_dartified.dart';

RaylibCameraFlat get _module => Raylib.instance.CameraFlat;

/// See [RaylibCameraFlat.GetCameraForward].
Vector3D GetCameraForward(
  StructPointer<Camera3DD> camera,
) => _module.GetCameraForward(camera);

/// See [RaylibCameraFlat.GetCameraUp].
Vector3D GetCameraUp(
  StructPointer<Camera3DD> camera,
) => _module.GetCameraUp(camera);

/// See [RaylibCameraFlat.GetCameraRight].
Vector3D GetCameraRight(
  StructPointer<Camera3DD> camera,
) => _module.GetCameraRight(camera);

/// See [RaylibCameraFlat.CameraMoveForward].
void CameraMoveForward(
  StructPointer<Camera3DD> camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveForward(camera, distance, moveInWorldPlane);

/// See [RaylibCameraFlat.CameraMoveUp].
void CameraMoveUp(
  StructPointer<Camera3DD> camera,
  num distance,
) => _module.CameraMoveUp(camera, distance);

/// See [RaylibCameraFlat.CameraMoveRight].
void CameraMoveRight(
  StructPointer<Camera3DD> camera,
  num distance,
  bool moveInWorldPlane,
) => _module.CameraMoveRight(camera, distance, moveInWorldPlane);

/// See [RaylibCameraFlat.CameraMoveToTarget].
void CameraMoveToTarget(
  StructPointer<Camera3DD> camera,
  num delta,
) => _module.CameraMoveToTarget(camera, delta);

/// See [RaylibCameraFlat.CameraYaw].
void CameraYaw(
  StructPointer<Camera3DD> camera,
  num angle,
  bool rotateAroundTarget,
) => _module.CameraYaw(camera, angle, rotateAroundTarget);

/// See [RaylibCameraFlat.CameraPitch].
void CameraPitch(
  StructPointer<Camera3DD> camera,
  num angle,
  bool lockView,
  bool rotateAroundTarget,
  bool rotateUp,
) => _module.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);

/// See [RaylibCameraFlat.CameraRoll].
void CameraRoll(
  StructPointer<Camera3DD> camera,
  num angle,
) => _module.CameraRoll(camera, angle);

/// See [RaylibCameraFlat.GetCameraViewMatrix].
MatrixD GetCameraViewMatrix(
  StructPointer<Camera3DD> camera,
) => _module.GetCameraViewMatrix(camera);

/// See [RaylibCameraFlat.GetCameraProjectionMatrix].
MatrixD GetCameraProjectionMatrix(
  StructPointer<Camera3DD> camera,
  num aspect,
) => _module.GetCameraProjectionMatrix(camera, aspect);