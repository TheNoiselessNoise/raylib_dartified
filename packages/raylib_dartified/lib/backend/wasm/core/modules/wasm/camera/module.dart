part of '../../../backend.dart';

final class RaylibCamera extends XPackageModuleWasm<Raylib> {
  /// Returns the forward vector (normalized) of [camera].
  late final XF2<void> GetCameraForward;
  /// Returns the up vector (normalized) of [camera].
  /// 
  /// The up vector might not be perpendicular to the forward vector.
  late final XF2<void> GetCameraUp;
  /// Returns the right vector (normalized) of [camera].
  late final XF2<void> GetCameraRight;
  /// Moves the [camera] in its forward direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  late final XF3<void> CameraMoveForward;
  /// Moves the [camera] in its up direction by [distance].
  late final XF2<void> CameraMoveUp;
  /// Moves the [camera] target in its current right direction by [distance].
  ///
  /// If [moveInWorldPlane] is `true`, movement is constrained to the XZ plane
  /// regardless of the camera's pitch.
  late final XF3<void> CameraMoveRight;
  /// Moves [camera] closer to or further from its target by [delta].
  late final XF2<void> CameraMoveToTarget;
  /// Rotates [camera] around its up vector by [angle] radians.
  ///
  /// Yaw is "looking left and right".
  ///
  /// If [rotateAroundTarget] is `true`, the camera orbits its target;
  /// otherwise it rotates in place.
  late final XF3<void> CameraYaw;
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
  late final XF5<void> CameraPitch;
  /// Rotates [camera] around its forward vector by [angle] radians.
  /// 
  /// Roll is "turning your head sideways to the left or right"
  late final XF2<void> CameraRoll;
  /// Returns the view matrix for [camera].
  late final XF2<void> GetCameraViewMatrix;
  /// Returns the projection matrix for [camera] with the given [aspect] ratio.
  late final XF3<void> GetCameraProjectionMatrix;

  RaylibCamera(super.pkg) {
    GetCameraForward          = swrap1('GetCameraForward');
    GetCameraUp               = swrap1('GetCameraUp');
    GetCameraRight            = swrap1('GetCameraRight');
    CameraMoveForward         = dwrap3('CameraMoveForward');
    CameraMoveUp              = dwrap2('CameraMoveUp');
    CameraMoveRight           = dwrap3('CameraMoveRight');
    CameraMoveToTarget        = dwrap2('CameraMoveToTarget');
    CameraYaw                 = dwrap3('CameraYaw');
    CameraPitch               = dwrap5('CameraPitch');
    CameraRoll                = dwrap2('CameraRoll');
    GetCameraViewMatrix       = swrap1('GetCameraViewMatrix');
    GetCameraProjectionMatrix = swrap2('GetCameraProjectionMatrix');
  }
}