part of '../../raylib_dartified.dart';

/// Backend-agnostic Raylib Camera module.
final class RaylibCameraDart extends XPackageModule<Raylib> {

  RaylibCameraDart(super.pkg);

  RaylibCameraFlat get _flat => pkg.module();

  /// Returns the forward vector (normalized) of [camera].
  Vector3 GetCameraForward(
    Camera3D camera,
  ) => _flat.GetCameraForward(
    Camera3D$.Ref1(camera),
  );

  /// Returns the up vector (normalized) of [camera].
  /// 
  /// The up vector might not be perpendicular to the forward vector.
  Vector3 GetCameraUp(
    Camera3D camera,
  ) => _flat.GetCameraUp(
    Camera3D$.Ref1(camera),
  );

  /// Returns the right vector (normalized) of [camera].
  Vector3 GetCameraRight(
    Camera3D camera,
  ) => _flat.GetCameraRight(
    Camera3D$.Ref1(camera),
  );

  /// Moves the [camera] in its forward direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveForward(
    Camera3D camera,
    num distance,
    bool moveInWorldPlane,
  ) => _flat.CameraMoveForward(
    Camera3D$.Ref1(camera),
    distance.toDouble(),
    moveInWorldPlane,
  );

  /// Moves the [camera] in its up direction by [distance].
  void CameraMoveUp(
    Camera3D camera,
    num distance,
  ) => _flat.CameraMoveUp(
    Camera3D$.Ref1(camera),
    distance.toDouble(),
  );

  /// Moves the [camera] target in its current right direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveRight(
    Camera3D camera,
    num distance,
    bool moveInWorldPlane,
  ) => _flat.CameraMoveRight(
    Camera3D$.Ref1(camera),
    distance.toDouble(),
    moveInWorldPlane,
  );

  /// Moves [camera] closer to or further from its target by [delta].
  void CameraMoveToTarget(
    Camera3D camera,
    num delta,
  ) => _flat.CameraMoveToTarget(
    Camera3D$.Ref1(camera),
    delta.toDouble(),
  );

  /// Rotates [camera] around its up vector by [angle] radians.
  ///
  /// Yaw is "looking left and right".
  ///
  /// If [rotateAroundTarget] is `true`, the camera orbits its target;
  /// otherwise it rotates in place.
  void CameraYaw(
    Camera3D camera,
    num angle,
    bool rotateAroundTarget,
  ) => _flat.CameraYaw(
    Camera3D$.Ref1(camera),
    angle.toDouble(),
    rotateAroundTarget,
  );

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
  void CameraPitch(
    Camera3D camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => _flat.CameraPitch(
    Camera3D$.Ref1(camera),
    angle.toDouble(),
    lockView,
    rotateAroundTarget,
    rotateUp,
  );

  /// Rotates [camera] around its forward vector by [angle] radians.
  /// 
  /// Roll is "turning your head sideways to the left or right"
  void CameraRoll(
    Camera3D camera,
    num angle,
  ) => _flat.CameraRoll(
    Camera3D$.Ref1(camera),
    angle.toDouble(),
  );

  /// Returns the view matrix for [camera].
  Matrix GetCameraViewMatrix(
    Camera3D camera,
  ) => _flat.GetCameraViewMatrix(
    Camera3D$.Ref1(camera),
  );

  /// Returns the projection matrix for [camera] with the given [aspect] ratio.
  Matrix GetCameraProjectionMatrix(
    Camera3D camera,
    num aspect,
  ) => _flat.GetCameraProjectionMatrix(
    Camera3D$.Ref1(camera),
    aspect.toDouble(),
  );
}
