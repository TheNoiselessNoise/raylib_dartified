part of '../../raylib_dartified.dart';

/// Backend-agnostic contract for the Raylib Camera module.
///
/// Concrete platform implementations extend this to provide
/// the full API surface across different backends.
abstract class RaylibCameraFlat extends XPackageModule<Raylib> {

  RaylibCameraFlat(super.pkg);

  /// Returns the forward vector (normalized) of [camera].
  Vector3 GetCameraForward(
    XStructPtr<Camera3D> camera,
  );

  /// Returns the up vector (normalized) of [camera].
  /// 
  /// The up vector might not be perpendicular to the forward vector.
  Vector3 GetCameraUp(
    XStructPtr<Camera3D> camera,
  );

  /// Returns the right vector (normalized) of [camera].
  Vector3 GetCameraRight(
    XStructPtr<Camera3D> camera,
  );

  /// Moves the [camera] in its forward direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveForward(
    XStructPtr<Camera3D> camera,
    double distance,
    bool moveInWorldPlane,
  );

  /// Moves the [camera] in its up direction by [distance].
  void CameraMoveUp(
    XStructPtr<Camera3D> camera,
    double distance,
  );

  /// Moves the [camera] target in its current right direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  void CameraMoveRight(
    XStructPtr<Camera3D> camera,
    double distance,
    bool moveInWorldPlane,
  );

  /// Moves [camera] closer to or further from its target by [delta].
  void CameraMoveToTarget(
    XStructPtr<Camera3D> camera,
    double delta,
  );

  /// Rotates [camera] around its up vector by [angle] radians.
  ///
  /// Yaw is "looking left and right".
  ///
  /// If [rotateAroundTarget] is `true`, the camera orbits its target;
  /// otherwise it rotates in place.
  void CameraYaw(
    XStructPtr<Camera3D> camera,
    double angle,
    bool rotateAroundTarget,
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
    XStructPtr<Camera3D> camera,
    double angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  );

  /// Rotates [camera] around its forward vector by [angle] radians.
  /// 
  /// Roll is "turning your head sideways to the left or right"
  void CameraRoll(
    XStructPtr<Camera3D> camera,
    double angle,
  );

  /// Returns the view matrix for [camera].
  Matrix GetCameraViewMatrix(
    XStructPtr<Camera3D> camera,
  );

  /// Returns the projection matrix for [camera] with the given [aspect] ratio.
  Matrix GetCameraProjectionMatrix(
    XStructPtr<Camera3D> camera,
    double aspect,
  );
}


