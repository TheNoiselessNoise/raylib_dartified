import 'package:raylib_dartified_web/raylib_dartified_web.dart';

RaylibCamera get _module => Raylib.instance.module();

/// See [RaylibCamera.GetCameraForward].
XF2<void> get GetCameraForward => _module.GetCameraForward;
/// See [RaylibCamera.GetCameraUp].
XF2<void> get GetCameraUp => _module.GetCameraUp;
/// See [RaylibCamera.GetCameraRight].
XF2<void> get GetCameraRight => _module.GetCameraRight;
/// See [RaylibCamera.CameraMoveForward].
XF3<void> get CameraMoveForward => _module.CameraMoveForward;
/// See [RaylibCamera.CameraMoveUp].
XF2<void> get CameraMoveUp => _module.CameraMoveUp;
/// See [RaylibCamera.CameraMoveRight].
XF3<void> get CameraMoveRight => _module.CameraMoveRight;
/// See [RaylibCamera.CameraMoveToTarget].
XF2<void> get CameraMoveToTarget => _module.CameraMoveToTarget;
/// See [RaylibCamera.CameraYaw].
XF3<void> get CameraYaw => _module.CameraYaw;
/// See [RaylibCamera.CameraPitch].
XF5<void> get CameraPitch => _module.CameraPitch;
/// See [RaylibCamera.CameraRoll].
XF2<void> get CameraRoll => _module.CameraRoll;
/// See [RaylibCamera.GetCameraViewMatrix].
XF2<void> get GetCameraViewMatrix => _module.GetCameraViewMatrix;
/// See [RaylibCamera.GetCameraProjectionMatrix].
XF3<void> get GetCameraProjectionMatrix => _module.GetCameraProjectionMatrix;