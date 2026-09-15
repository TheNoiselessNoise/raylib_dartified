part of '../../../raylib_dartified.dart';

class RaylibCameraFlat extends RaylibCameraFlatModule<Raylib> {

  RaylibCameraFlat(super.rl);

  RaylibCamera get _ffi => rl.module();

  @override
  Vector3D GetCameraForward(
    StructPointer<Camera3DD> camera,
  ) => $.Vector3$.Extract1(
    (p) => _ffi.GetCameraForward(
      camera.asNativePointer(),
    ).toDart(p.asNativePointer())
  );

  @override
  Vector3D GetCameraUp(
    StructPointer<Camera3DD> camera,
  ) => $.Vector3$.Extract1(
    (p) => _ffi.GetCameraUp(
      camera.asNativePointer(),
    ).toDart(p.asNativePointer())
  );

  @override
  Vector3D GetCameraRight(
    StructPointer<Camera3DD> camera,
  ) => $.Vector3$.Extract1(
    (p) => _ffi.GetCameraRight(
      camera.asNativePointer(),
    ).toDart(p.asNativePointer())
  );

  @override
  void CameraMoveForward(
    StructPointer<Camera3DD> camera,
    double distance,
    bool moveInWorldPlane,
  ) => _ffi.CameraMoveForward(
    camera.asNativePointer(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveUp(
    StructPointer<Camera3DD> camera,
    double distance,
  ) => _ffi.CameraMoveUp(
    camera.asNativePointer(),
    distance.toDouble(),
  );

  @override
  void CameraMoveRight(
    StructPointer<Camera3DD> camera,
    double distance,
    bool moveInWorldPlane,
  ) => _ffi.CameraMoveRight(
    camera.asNativePointer(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveToTarget(
    StructPointer<Camera3DD> camera,
    double delta,
  ) => _ffi.CameraMoveToTarget(
    camera.asNativePointer(),
    delta.toDouble(),
  );

  @override
  void CameraYaw(
    StructPointer<Camera3DD> camera,
    double angle,
    bool rotateAroundTarget,
  ) => _ffi.CameraYaw(
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
  ) => _ffi.CameraPitch(
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
  ) => _ffi.CameraRoll(
    camera.asNativePointer(),
    angle.toDouble(),
  );

  @override
  MatrixD GetCameraViewMatrix(
    StructPointer<Camera3DD> camera,
  ) => $.Matrix$.Extract1(
    (p) => _ffi.GetCameraViewMatrix(
      camera.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD GetCameraProjectionMatrix(
    StructPointer<Camera3DD> camera,
    double aspect,
  ) => $.Matrix$.Extract1(
    (p) => _ffi.GetCameraProjectionMatrix(
      camera.asNativePointer(),
      aspect.toDouble(),
    ).toDart(p.asNativePointer()),
  );
}
