part of '../../../raylib_dartified.dart';

final class RaylibCameraFlatNative extends RaylibCameraFlat<Raylib> {

  RaylibCameraFlatNative(super.rl);

  RaylibCamera get _ffi => rl.module();

  @override
  Vector3 GetCameraForward(
    XStructPtr<Camera3D> camera,
  ) => Vector3$.Extract(
    (p) => _ffi.GetCameraForward(
      camera.asNative(),
    ).toDart(p.asNative())
  );

  @override
  Vector3 GetCameraUp(
    XStructPtr<Camera3D> camera,
  ) => Vector3$.Extract(
    (p) => _ffi.GetCameraUp(
      camera.asNative(),
    ).toDart(p.asNative())
  );

  @override
  Vector3 GetCameraRight(
    XStructPtr<Camera3D> camera,
  ) => Vector3$.Extract(
    (p) => _ffi.GetCameraRight(
      camera.asNative(),
    ).toDart(p.asNative())
  );

  @override
  void CameraMoveForward(
    XStructPtr<Camera3D> camera,
    double distance,
    bool moveInWorldPlane,
  ) => _ffi.CameraMoveForward(
    camera.asNative(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveUp(
    XStructPtr<Camera3D> camera,
    double distance,
  ) => _ffi.CameraMoveUp(
    camera.asNative(),
    distance.toDouble(),
  );

  @override
  void CameraMoveRight(
    XStructPtr<Camera3D> camera,
    double distance,
    bool moveInWorldPlane,
  ) => _ffi.CameraMoveRight(
    camera.asNative(),
    distance.toDouble(),
    moveInWorldPlane,
  );

  @override
  void CameraMoveToTarget(
    XStructPtr<Camera3D> camera,
    double delta,
  ) => _ffi.CameraMoveToTarget(
    camera.asNative(),
    delta.toDouble(),
  );

  @override
  void CameraYaw(
    XStructPtr<Camera3D> camera,
    double angle,
    bool rotateAroundTarget,
  ) => _ffi.CameraYaw(
    camera.asNative(),
    angle.toDouble(),
    rotateAroundTarget,
  );

  @override
  void CameraPitch(
    XStructPtr<Camera3D> camera,
    double angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => _ffi.CameraPitch(
    camera.asNative(),
    angle.toDouble(),
    lockView,
    rotateAroundTarget,
    rotateUp,
  );

  @override
  void CameraRoll(
    XStructPtr<Camera3D> camera,
    double angle,
  ) => _ffi.CameraRoll(
    camera.asNative(),
    angle.toDouble(),
  );

  @override
  Matrix GetCameraViewMatrix(
    XStructPtr<Camera3D> camera,
  ) => Matrix$.Extract(
    (p) => _ffi.GetCameraViewMatrix(
      camera.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  Matrix GetCameraProjectionMatrix(
    XStructPtr<Camera3D> camera,
    double aspect,
  ) => Matrix$.Extract(
    (p) => _ffi.GetCameraProjectionMatrix(
      camera.asNative(),
      aspect.toDouble(),
    ).toDart(p.asNative()),
  );
}
