part of '../../raylib_dartified_base.dart';

class _RaylibCameraDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibCameraDart.GetCameraForward].
  String GetCameraForward(
    Camera3D camera,
  ) => 'GetCameraForward($camera)';

  /// Label for [RaylibCameraDart.GetCameraUp].
  String GetCameraUp(
    Camera3D camera,
  ) => 'GetCameraUp($camera)';

  /// Label for [RaylibCameraDart.GetCameraRight].
  String GetCameraRight(
    Camera3D camera,
  ) => 'GetCameraRight($camera)';

  /// Label for [RaylibCameraDart.CameraMoveForward].
  String CameraMoveForward(
    Camera3D camera,
    num distance,
    bool moveInWorldPlane,
  ) => 'CameraMoveForward($camera, $distance, $moveInWorldPlane)';

  /// Label for [RaylibCameraDart.CameraMoveUp].
  String CameraMoveUp(
    Camera3D camera,
    num distance,
  ) => 'CameraMoveUp($camera, $distance)';

  /// Label for [RaylibCameraDart.CameraMoveRight].
  String CameraMoveRight(
    Camera3D camera,
    num distance,
    bool moveInWorldPlane,
  ) => 'CameraMoveRight($camera, $distance, $moveInWorldPlane)';

  /// Label for [RaylibCameraDart.CameraMoveToTarget].
  String CameraMoveToTarget(
    Camera3D camera,
    num delta,
  ) => 'CameraMoveToTarget($camera, $delta)';

  /// Label for [RaylibCameraDart.CameraYaw].
  String CameraYaw(
    Camera3D camera,
    num angle,
    bool rotateAroundTarget,
  ) => 'CameraYaw($camera, $angle, $rotateAroundTarget)';

  /// Label for [RaylibCameraDart.CameraPitch].
  String CameraPitch(
    Camera3D camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => 'CameraPitch($camera, $angle, $lockView, $rotateAroundTarget, $rotateUp)';

  /// Label for [RaylibCameraDart.CameraRoll].
  String CameraRoll(
    Camera3D camera,
    num angle,
  ) => 'CameraRoll($camera, $angle)';

  /// Label for [RaylibCameraDart.GetCameraViewMatrix].
  String GetCameraViewMatrix(
    Camera3D camera,
  ) => 'GetCameraViewMatrix($camera)';

  /// Label for [RaylibCameraDart.GetCameraProjectionMatrix].
  String GetCameraProjectionMatrix(
    Camera3D camera,
    num aspect,
  ) => 'GetCameraProjectionMatrix($camera)';
  
}
