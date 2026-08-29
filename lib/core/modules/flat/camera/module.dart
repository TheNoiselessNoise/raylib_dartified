part of '../../../raylib_dartified.dart';

class RaylibCameraFlat extends RaylibCameraFlatModule<Raylib> {

  RaylibCameraFlat(super.rl);

  @override
  Vector3D GetCameraForward(
    StructPointer<Camera3DD> camera,
  ) => rl.Temp.Vector3$.Extract1(
    (p) => rl.Camera.GetCameraForward(
      camera.asNativePointer(),
    ).toD(p.asNativePointer())
  );

  @override
  Vector3D GetCameraUp(
    StructPointer<Camera3DD> camera,
  ) => rl.Temp.Vector3$.Extract1(
    (p) => rl.Camera.GetCameraUp(
      camera.asNativePointer(),
    ).toD(p.asNativePointer())
  );

  @override
  Vector3D GetCameraRight(
    StructPointer<Camera3DD> camera,
  ) => rl.Temp.Vector3$.Extract1(
    (p) => rl.Camera.GetCameraRight(
      camera.asNativePointer(),
    ).toD(p.asNativePointer())
  );

  @override
  void CameraMoveForward(
    StructPointer<Camera3DD> camera,
    double distance,
    bool moveInWorldPlane,
  ) => rl.Camera.CameraMoveForward(
    camera.asNativePointer(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveUp(
    StructPointer<Camera3DD> camera,
    double distance,
  ) => rl.Camera.CameraMoveUp(
    camera.asNativePointer(),
    distance.toDouble(),
  );

  @override
  void CameraMoveRight(
    StructPointer<Camera3DD> camera,
    double distance,
    bool moveInWorldPlane,
  ) => rl.Camera.CameraMoveRight(
    camera.asNativePointer(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveToTarget(
    StructPointer<Camera3DD> camera,
    double delta,
  ) => rl.Camera.CameraMoveToTarget(
    camera.asNativePointer(),
    delta.toDouble(),
  );

  @override
  void CameraYaw(
    StructPointer<Camera3DD> camera,
    double angle,
    bool rotateAroundTarget,
  ) => rl.Camera.CameraYaw(
    camera.asNativePointer(),
    angle.toDouble(),
    rotateAroundTarget,
  );

  @override
  void CameraPitch(
    StructPointer<Camera3DD> camera,
    double angle,
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
    double angle,
  ) => rl.Camera.CameraRoll(
    camera.asNativePointer(),
    angle.toDouble(),
  );

  @override
  MatrixD GetCameraViewMatrix(
    StructPointer<Camera3DD> camera,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => rl.Camera.GetCameraViewMatrix(
      camera.asNativePointer(),
    ).toD(p.asNativePointer()),
  );

  @override
  MatrixD GetCameraProjectionMatrix(
    StructPointer<Camera3DD> camera,
    double aspect,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => rl.Camera.GetCameraProjectionMatrix(
      camera.asNativePointer(),
      aspect.toDouble(),
    ).toD(p.asNativePointer()),
  );
}
