part of '../../../raylib_dartified.dart';

class RaylibCamera extends RaylibModule<Raylib> {
  RaylibCamera(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  /// Returns the forward vector (normalized) of [camera].
  Vector3C GetCameraForward(Pointer<Camera3DC> camera)
    => _GetCameraForward(camera);
  late final _GetCameraForwardPtr = _lookup<NativeFunction<Vector3C Function(Pointer<Camera3DC>)>>('GetCameraForward');
  late final _GetCameraForward = _GetCameraForwardPtr.asFunction<Vector3C Function(Pointer<Camera3DC>)>();

  /// Returns the up vector (normalized) of [camera].
  /// 
  /// The up vector might not be perpendicular to the forward vector.
  Vector3C GetCameraUp(Pointer<Camera3DC> camera)
    => _GetCameraUp(camera);
  late final _GetCameraUpPtr = _lookup<NativeFunction<Vector3C Function(Pointer<Camera3DC>)>>('GetCameraUp');
  late final _GetCameraUp = _GetCameraUpPtr.asFunction<Vector3C Function(Pointer<Camera3DC>)>();

  /// Returns the right vector (normalized) of [camera].
  Vector3C GetCameraRight(Pointer<Camera3DC> camera)
    => _GetCameraRight(camera);
  late final _GetCameraRightPtr = _lookup<NativeFunction<Vector3C Function(Pointer<Camera3DC>)>>('GetCameraRight');
  late final _GetCameraRight = _GetCameraRightPtr.asFunction<Vector3C Function(Pointer<Camera3DC>)>();

  /// Moves the [camera] in its forward direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveForward(Pointer<Camera3DC> camera, double distance, bool moveInWorldPlane)
    => _CameraMoveForward(camera, distance, moveInWorldPlane);
  late final _CameraMoveForwardPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float, Bool)>>('CameraMoveForward');
  late final _CameraMoveForward = _CameraMoveForwardPtr.asFunction<void Function(Pointer<Camera3DC>, double, bool)>();

  /// Moves the [camera] in its up direction by [distance].
  void CameraMoveUp(Pointer<Camera3DC> camera, double distance)
    => _CameraMoveUp(camera, distance);
  late final _CameraMoveUpPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float)>>('CameraMoveUp');
  late final _CameraMoveUp = _CameraMoveUpPtr.asFunction<void Function(Pointer<Camera3DC>, double)>();

  /// Moves the [camera] target in its current right direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveRight(Pointer<Camera3DC> camera, double distance, bool moveInWorldPlane)
    => _CameraMoveRight(camera, distance, moveInWorldPlane);
  late final _CameraMoveRightPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float, Bool)>>('CameraMoveRight');
  late final _CameraMoveRight = _CameraMoveRightPtr.asFunction<void Function(Pointer<Camera3DC>, double, bool)>();

  /// Moves [camera] closer to or further from its target by [delta].
  void CameraMoveToTarget(Pointer<Camera3DC> camera, double delta)
    => _CameraMoveToTarget(camera, delta);
  late final _CameraMoveToTargetPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float)>>('CameraMoveToTarget');
  late final _CameraMoveToTarget = _CameraMoveToTargetPtr.asFunction<void Function(Pointer<Camera3DC>, double)>();

  /// Rotates [camera] around its up vector by [angle] radians.
  ///
  /// Yaw is "looking left and right".
  ///
  /// If [rotateAroundTarget] is `true`, the camera orbits its target;
  /// otherwise it rotates in place.
  void CameraYaw(Pointer<Camera3DC> camera, double angle, bool rotateAroundTarget)
    => _CameraYaw(camera, angle, rotateAroundTarget);
  late final _CameraYawPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float, Bool)>>('CameraYaw');
  late final _CameraYaw = _CameraYawPtr.asFunction<void Function(Pointer<Camera3DC>, double, bool)>();

  /// Rotates [camera] around its right vector by [angle] radians.
  /// 
  /// Pitch is "looking up and down".
  ///
  /// If [lockView] is `true`, pitch is clamped to prevent flipping.
  /// 
  /// If [rotateAroundTarget] is `true`, the camera orbits its target;
  /// otherwise it rotates in place.
  /// 
  /// If [rotateUp] is `true`, the up vector is rotated as well (typically useful in [CameraMode.CAMERA_FREE]).
  void CameraPitch(Pointer<Camera3DC> camera, double angle, bool lockView, bool rotateAroundTarget, bool rotateUp)
    => _CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp);
  late final _CameraPitchPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float, Bool, Bool, Bool)>>('CameraPitch');
  late final _CameraPitch = _CameraPitchPtr.asFunction<void Function(Pointer<Camera3DC>, double, bool, bool, bool)>();

  /// Rotates [camera] around its forward vector by [angle] radians.
  /// 
  /// Roll is "turning your head sideways to the left or right"
  void CameraRoll(Pointer<Camera3DC> camera, double angle)
    => _CameraRoll(camera, angle);
  late final _CameraRollPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Float)>>('CameraRoll');
  late final _CameraRoll = _CameraRollPtr.asFunction<void Function(Pointer<Camera3DC>, double)>();

  /// Returns the view matrix for [camera].
  MatrixC GetCameraViewMatrix(Pointer<Camera3DC> camera)
    => _GetCameraViewMatrix(camera);
  late final _GetCameraViewMatrixPtr = _lookup<NativeFunction<MatrixC Function(Pointer<Camera3DC>)>>('GetCameraViewMatrix');
  late final _GetCameraViewMatrix = _GetCameraViewMatrixPtr.asFunction<MatrixC Function(Pointer<Camera3DC>)>();

  /// Returns the projection matrix for [camera] with the given [aspect] ratio.
  MatrixC GetCameraProjectionMatrix(Pointer<Camera3DC> camera, double aspect)
    => _GetCameraProjectionMatrix(camera, aspect);
  late final _GetCameraProjectionMatrixPtr = _lookup<NativeFunction<MatrixC Function(Pointer<Camera3DC>, Float)>>('GetCameraProjectionMatrix');
  late final _GetCameraProjectionMatrix = _GetCameraProjectionMatrixPtr.asFunction<MatrixC Function(Pointer<Camera3DC>, double)>();
}
