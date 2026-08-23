part of '../../../raylib_dartified.dart';

class RaylibCameraFlat extends RaylibCameraFlatModule<Raylib> {

  RaylibCameraFlat(super.rl);

  @override
  Vector3D GetCameraForward(
    StructPointer<Camera3DD> camera,
  ) => rl.Camera.GetCameraForward(
    camera.asNativePointer(),
  ).toD();

  @override
  Vector3D GetCameraUp(
    StructPointer<Camera3DD> camera,
  ) => rl.Camera.GetCameraUp(
    camera.asNativePointer(),
  ).toD();

  @override
  Vector3D GetCameraRight(
    StructPointer<Camera3DD> camera,
  ) => rl.Camera.GetCameraRight(
    camera.asNativePointer(),
  ).toD();

  @override
  void CameraMoveForward(
    StructPointer<Camera3DD> camera,
    num distance,
    bool moveInWorldPlane,
  ) => rl.Camera.CameraMoveForward(
    camera.asNativePointer(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveUp(
    StructPointer<Camera3DD> camera,
    num distance,
  ) => rl.Camera.CameraMoveUp(
    camera.asNativePointer(),
    distance.toDouble(),
  );

  @override
  void CameraMoveRight(
    StructPointer<Camera3DD> camera,
    num distance,
    bool moveInWorldPlane,
  ) => rl.Camera.CameraMoveRight(
    camera.asNativePointer(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveToTarget(
    StructPointer<Camera3DD> camera,
    num delta,
  ) => rl.Camera.CameraMoveToTarget(
    camera.asNativePointer(),
    delta.toDouble(),
  );

  @override
  void CameraYaw(
    StructPointer<Camera3DD> camera,
    num angle,
    bool rotateAroundTarget,
  ) => rl.Camera.CameraYaw(
    camera.asNativePointer(),
    angle.toDouble(),
    rotateAroundTarget,
  );

  @override
  void CameraPitch(
    StructPointer<Camera3DD> camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => rl.Camera.CameraPitch(
    camera.asNativePointer(),
    angle.toDouble(),
    lockView,
    rotateAroundTarget,
    rotateUp,
  );

  @override
  void CameraRoll(
    StructPointer<Camera3DD> camera,
    num angle,
  ) => rl.Camera.CameraRoll(
    camera.asNativePointer(),
    angle.toDouble(),
  );

  @override
  MatrixD GetCameraViewMatrix(
    StructPointer<Camera3DD> camera,
  ) => rl.Camera.GetCameraViewMatrix(
    camera.asNativePointer(),
  ).toD();

  @override
  MatrixD GetCameraProjectionMatrix(
    StructPointer<Camera3DD> camera,
    num aspect,
  ) => rl.Camera.GetCameraProjectionMatrix(
    camera.asNativePointer(),
    aspect.toDouble(),
  ).toD();
}
