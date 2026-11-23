part of '../../../backend.dart';

final class RaylibCameraFlatWeb extends RaylibCameraFlat {

  RaylibCameraFlatWeb(super.pkg);

  RaylibCamera get _wasm => pkg.module();

  @override
  Vector3 GetCameraForward(
    XStructPtr<Camera3D> camera,
  ) => Vector3$.Extract(
    (p) => _wasm.GetCameraForward(
      p.toJS,
      camera.toJS,
    ),
  );

  @override
  Vector3 GetCameraUp(
    XStructPtr<Camera3D> camera,
  ) => Vector3$.Extract(
    (p) => _wasm.GetCameraUp(
      p.toJS,
      camera.toJS,
    ),
  );

  @override
  Vector3 GetCameraRight(
    XStructPtr<Camera3D> camera,
  ) => Vector3$.Extract(
    (p) => _wasm.GetCameraRight(
      p.toJS,
      camera.toJS,
    ),
  );

  @override
  void CameraMoveForward(
    XStructPtr<Camera3D> camera,
    double distance,
    bool moveInWorldPlane,
  ) => _wasm.CameraMoveForward(
    camera.toJS,
    distance.toJS,
    moveInWorldPlane.toJS,
  );

  @override
  void CameraMoveUp(
    XStructPtr<Camera3D> camera,
    double distance,
  ) => _wasm.CameraMoveUp(
    camera.toJS,
    distance.toJS,
  );

  @override
  void CameraMoveRight(
    XStructPtr<Camera3D> camera,
    double distance,
    bool moveInWorldPlane,
  ) => _wasm.CameraMoveRight(
    camera.toJS,
    distance.toJS,
    moveInWorldPlane.toJS,
  );

  @override
  void CameraMoveToTarget(
    XStructPtr<Camera3D> camera,
    double delta,
  ) => _wasm.CameraMoveToTarget(
    camera.toJS,
    delta.toJS,
  );

  @override
  void CameraYaw(
    XStructPtr<Camera3D> camera,
    double angle,
    bool rotateAroundTarget,
  ) => _wasm.CameraYaw(
    camera.toJS,
    angle.toJS,
    rotateAroundTarget.toJS,
  );

  @override
  void CameraPitch(
    XStructPtr<Camera3D> camera,
    double angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => _wasm.CameraPitch(
    camera.toJS,
    angle.toJS,
    lockView.toJS,
    rotateAroundTarget.toJS,
    rotateUp.toJS,
  );

  @override
  void CameraRoll(
    XStructPtr<Camera3D> camera,
    double angle,
  ) => _wasm.CameraRoll(
    camera.toJS,
    angle.toJS,
  );

  @override
  Matrix GetCameraViewMatrix(
    XStructPtr<Camera3D> camera,
  ) => Matrix$.Extract(
    (p) => _wasm.GetCameraViewMatrix(
      p.toJS,
      camera.toJS,
    ),
  );

  @override
  Matrix GetCameraProjectionMatrix(
    XStructPtr<Camera3D> camera,
    double aspect,
  ) => Matrix$.Extract(
    (p) => _wasm.GetCameraProjectionMatrix(
      p.toJS,
      camera.toJS,
      aspect.toJS,
    ),
  );
}