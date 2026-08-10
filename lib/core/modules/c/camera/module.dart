part of '../../../raylib_dartified.dart';

class RaylibCamera extends RaylibModule<Raylib> {
  RaylibCamera(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  Vector3C GetCameraForward(Pointer<Camera3DC> camera)
    => _GetCameraForward(camera);
  late final _GetCameraForwardPtr = _lookup<NativeFunction<Vector3C Function(Pointer<Camera3DC>)>>('GetCameraForward');
  late final _GetCameraForward = _GetCameraForwardPtr.asFunction<Vector3C Function(Pointer<Camera3DC>)>();

  Vector3C GetCameraUp(Pointer<Camera3DC> camera)
    => _GetCameraUp(camera);
  late final _GetCameraUpPtr = _lookup<NativeFunction<Vector3C Function(Pointer<Camera3DC>)>>('GetCameraUp');
  late final _GetCameraUp = _GetCameraUpPtr.asFunction<Vector3C Function(Pointer<Camera3DC>)>();

  Vector3C GetCameraRight(Pointer<Camera3DC> camera)
    => _GetCameraRight(camera);
  late final _GetCameraRightPtr = _lookup<NativeFunction<Vector3C Function(Pointer<Camera3DC>)>>('GetCameraRight');
  late final _GetCameraRight = _GetCameraRightPtr.asFunction<Vector3C Function(Pointer<Camera3DC>)>();

  void CameraMoveForward(Pointer<Camera3DC> camera, double distance, bool moveInWorldPlane)
    => _CameraMoveForward(camera, distance, moveInWorldPlane);
  late final _CameraMoveForwardPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float, Bool)>>('CameraMoveForward');
  late final _CameraMoveForward = _CameraMoveForwardPtr.asFunction<void Function(Pointer<Camera3DC>, double, bool)>();

  void CameraMoveUp(Pointer<Camera3DC> camera, double distance)
    => _CameraMoveUp(camera, distance);
  late final _CameraMoveUpPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float)>>('CameraMoveUp');
  late final _CameraMoveUp = _CameraMoveUpPtr.asFunction<void Function(Pointer<Camera3DC>, double)>();

  void CameraMoveRight(Pointer<Camera3DC> camera, double distance, bool moveInWorldPlane)
    => _CameraMoveRight(camera, distance, moveInWorldPlane);
  late final _CameraMoveRightPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float, Bool)>>('CameraMoveRight');
  late final _CameraMoveRight = _CameraMoveRightPtr.asFunction<void Function(Pointer<Camera3DC>, double, bool)>();

  void CameraMoveToTarget(Pointer<Camera3DC> camera, double delta)
    => _CameraMoveToTarget(camera, delta);
  late final _CameraMoveToTargetPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float)>>('CameraMoveToTarget');
  late final _CameraMoveToTarget = _CameraMoveToTargetPtr.asFunction<void Function(Pointer<Camera3DC>, double)>();

  void CameraYaw(Pointer<Camera3DC> camera, double angle, bool rotateAroundTarget)
    => _CameraYaw(camera, angle, rotateAroundTarget);
  late final _CameraYawPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float, Bool)>>('CameraYaw');
  late final _CameraYaw = _CameraYawPtr.asFunction<void Function(Pointer<Camera3DC>, double, bool)>();

  void CameraPitch(Pointer<Camera3DC> camera, double angle, bool lockView, bool rotateAroundTarget, bool rotateUp)
    => _CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);
  late final _CameraPitchPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float, Bool, Bool, Bool)>>('CameraPitch');
  late final _CameraPitch = _CameraPitchPtr.asFunction<void Function(Pointer<Camera3DC>, double, bool, bool, bool)>();

  void CameraRoll(Pointer<Camera3DC> camera, double angle)
    => _CameraRoll(camera, angle);
  late final _CameraRollPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float)>>('CameraRoll');
  late final _CameraRoll = _CameraRollPtr.asFunction<void Function(Pointer<Camera3DC>, double)>();

  MatrixC GetCameraViewMatrix(Pointer<Camera3DC> camera)
    => _GetCameraViewMatrix(camera);
  late final _GetCameraViewMatrixPtr = _lookup<NativeFunction<MatrixC Function(Pointer<Camera3DC>)>>('GetCameraViewMatrix');
  late final _GetCameraViewMatrix = _GetCameraViewMatrixPtr.asFunction<MatrixC Function(Pointer<Camera3DC>)>();

  MatrixC GetCameraProjectionMatrix(Pointer<Camera3DC> camera, double aspect)
    => _GetCameraProjectionMatrix(camera, aspect);
  late final _GetCameraProjectionMatrixPtr = _lookup<NativeFunction<MatrixC Function(Pointer<Camera3DC>, Float)>>('GetCameraProjectionMatrix');
  late final _GetCameraProjectionMatrix = _GetCameraProjectionMatrixPtr.asFunction<MatrixC Function(Pointer<Camera3DC>, double)>();
}
