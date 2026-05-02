part of '../../../raylib.dart';

class RaylibCamera extends RaylibModule {
  RaylibCamera(super.lib);

  Vector3C GetCameraForward(Pointer<CameraC> camera) {
    return _GetCameraForward(camera);
  }

  late final _GetCameraForwardPtr = rl
      .coreLookup<NativeFunction<Vector3C Function(Pointer<CameraC>)>>(
        'GetCameraForward',
      );
  late final _GetCameraForward =
      _GetCameraForwardPtr.asFunction<Vector3C Function(Pointer<CameraC>)>();

  Vector3C GetCameraUp(Pointer<CameraC> camera) {
    return _GetCameraUp(camera);
  }

  late final _GetCameraUpPtr = rl
      .coreLookup<NativeFunction<Vector3C Function(Pointer<CameraC>)>>(
        'GetCameraUp',
      );
  late final _GetCameraUp =
      _GetCameraUpPtr.asFunction<Vector3C Function(Pointer<CameraC>)>();

  Vector3C GetCameraRight(Pointer<CameraC> camera) {
    return _GetCameraRight(camera);
  }

  late final _GetCameraRightPtr = rl
      .coreLookup<NativeFunction<Vector3C Function(Pointer<CameraC>)>>(
        'GetCameraRight',
      );
  late final _GetCameraRight =
      _GetCameraRightPtr.asFunction<Vector3C Function(Pointer<CameraC>)>();

  void CameraMoveForward(
    Pointer<CameraC> camera,
    double distance,
    bool moveInWorldPlane,
  ) {
    return _CameraMoveForward(camera, distance, moveInWorldPlane);
  }

  late final _CameraMoveForwardPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<CameraC>, Float, Bool)>>(
        'CameraMoveForward',
      );
  late final _CameraMoveForward =
      _CameraMoveForwardPtr.asFunction<
        void Function(Pointer<CameraC>, double, bool)
      >();

  void CameraMoveUp(Pointer<CameraC> camera, double distance) {
    return _CameraMoveUp(camera, distance);
  }

  late final _CameraMoveUpPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<CameraC>, Float)>>(
        'CameraMoveUp',
      );
  late final _CameraMoveUp =
      _CameraMoveUpPtr.asFunction<void Function(Pointer<CameraC>, double)>();

  void CameraMoveRight(
    Pointer<CameraC> camera,
    double distance,
    bool moveInWorldPlane,
  ) {
    return _CameraMoveRight(camera, distance, moveInWorldPlane);
  }

  late final _CameraMoveRightPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<CameraC>, Float, Bool)>>(
        'CameraMoveRight',
      );
  late final _CameraMoveRight =
      _CameraMoveRightPtr.asFunction<
        void Function(Pointer<CameraC>, double, bool)
      >();

  void CameraMoveToTarget(Pointer<CameraC> camera, double delta) {
    return _CameraMoveToTarget(camera, delta);
  }

  late final _CameraMoveToTargetPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<CameraC>, Float)>>(
        'CameraMoveToTarget',
      );
  late final _CameraMoveToTarget =
      _CameraMoveToTargetPtr.asFunction<
        void Function(Pointer<CameraC>, double)
      >();

  void CameraYaw(
    Pointer<CameraC> camera,
    double angle,
    bool rotateAroundTarget,
  ) {
    return _CameraYaw(camera, angle, rotateAroundTarget);
  }

  late final _CameraYawPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<CameraC>, Float, Bool)>>(
        'CameraYaw',
      );
  late final _CameraYaw =
      _CameraYawPtr.asFunction<void Function(Pointer<CameraC>, double, bool)>();

  void CameraPitch(
    Pointer<CameraC> camera,
    double angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) {
    return _CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);
  }

  late final _CameraPitchPtr = rl
      .coreLookup<
        NativeFunction<Void Function(Pointer<CameraC>, Float, Bool, Bool, Bool)>
      >('CameraPitch');
  late final _CameraPitch =
      _CameraPitchPtr.asFunction<
        void Function(Pointer<CameraC>, double, bool, bool, bool)
      >();

  void CameraRoll(Pointer<CameraC> camera, double angle) {
    return _CameraRoll(camera, angle);
  }

  late final _CameraRollPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<CameraC>, Float)>>(
        'CameraRoll',
      );
  late final _CameraRoll =
      _CameraRollPtr.asFunction<void Function(Pointer<CameraC>, double)>();

  MatrixC GetCameraViewMatrix(Pointer<CameraC> camera) {
    return _GetCameraViewMatrix(camera);
  }

  late final _GetCameraViewMatrixPtr = rl
      .coreLookup<NativeFunction<MatrixC Function(Pointer<CameraC>)>>(
        'GetCameraViewMatrix',
      );
  late final _GetCameraViewMatrix =
      _GetCameraViewMatrixPtr.asFunction<MatrixC Function(Pointer<CameraC>)>();

  MatrixC GetCameraProjectionMatrix(Pointer<CameraC> camera, double aspect) {
    return _GetCameraProjectionMatrix(camera, aspect);
  }

  late final _GetCameraProjectionMatrixPtr = rl
      .coreLookup<NativeFunction<MatrixC Function(Pointer<CameraC>, Float)>>(
        'GetCameraProjectionMatrix',
      );
  late final _GetCameraProjectionMatrix =
      _GetCameraProjectionMatrixPtr.asFunction<
        MatrixC Function(Pointer<CameraC>, double)
      >();
}
