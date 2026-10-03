part of '../../../raylib_dartified.dart';

class RaylibCameraFlatNative extends RaylibCameraFlat<Raylib> {

  RaylibCameraFlatNative(super.rl);

  RaylibCamera get _ffi => rl.module();

  @override
  Vector3 GetCameraForward(
    StructPointer<Camera3D> camera,
  ) => Vector3$.Extract1(
    (p) => _ffi.GetCameraForward(
      camera.asNativePointer(),
    ).toDart(p.asNativePointer())
  );

  @override
  Vector3 GetCameraUp(
    StructPointer<Camera3D> camera,
  ) => Vector3$.Extract1(
    (p) => _ffi.GetCameraUp(
      camera.asNativePointer(),
    ).toDart(p.asNativePointer())
  );

  @override
  Vector3 GetCameraRight(
    StructPointer<Camera3D> camera,
  ) => Vector3$.Extract1(
    (p) => _ffi.GetCameraRight(
      camera.asNativePointer(),
    ).toDart(p.asNativePointer())
  );

  @override
  void CameraMoveForward(
    StructPointer<Camera3D> camera,
    double distance,
    bool moveInWorldPlane,
  ) => _ffi.CameraMoveForward(
    camera.asNativePointer(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveUp(
    StructPointer<Camera3D> camera,
    double distance,
  ) => _ffi.CameraMoveUp(
    camera.asNativePointer(),
    distance.toDouble(),
  );

  @override
  void CameraMoveRight(
    StructPointer<Camera3D> camera,
    double distance,
    bool moveInWorldPlane,
  ) => _ffi.CameraMoveRight(
    camera.asNativePointer(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveToTarget(
    StructPointer<Camera3D> camera,
    double delta,
  ) => _ffi.CameraMoveToTarget(
    camera.asNativePointer(),
    delta.toDouble(),
  );

  @override
  void CameraYaw(
    StructPointer<Camera3D> camera,
    double angle,
    bool rotateAroundTarget,
  ) => _ffi.CameraYaw(
    camera.asNativePointer(),
    angle.toDouble(),
    rotateAroundTarget,
  );

  @override
  void CameraPitch(
    StructPointer<Camera3D> camera,
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
    StructPointer<Camera3D> camera,
    double angle,
  ) => _ffi.CameraRoll(
    camera.asNativePointer(),
    angle.toDouble(),
  );

  @override
  Matrix GetCameraViewMatrix(
    StructPointer<Camera3D> camera,
  ) => Matrix$.Extract1(
    (p) => _ffi.GetCameraViewMatrix(
      camera.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  Matrix GetCameraProjectionMatrix(
    StructPointer<Camera3D> camera,
    double aspect,
  ) => Matrix$.Extract1(
    (p) => _ffi.GetCameraProjectionMatrix(
      camera.asNativePointer(),
      aspect.toDouble(),
    ).toDart(p.asNativePointer()),
  );
}
