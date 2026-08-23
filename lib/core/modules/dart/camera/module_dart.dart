part of '../../../raylib_dartified.dart';

class RaylibCameraD extends RaylibCameraModule<Raylib> {

  RaylibCameraD(super.rl);

  @override
  Vector3D GetCameraForward(
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetCameraForward(camera),
    () => rl.CameraFlat.GetCameraForward(
      rl.Temp.Camera3D$.Ref1(camera),
    ),
  );

  @override
  Vector3D GetCameraUp(
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetCameraUp(camera),
    () => rl.CameraFlat.GetCameraUp(
      rl.Temp.Camera3D$.Ref1(camera),
    ),
  );

  @override
  Vector3D GetCameraRight(
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetCameraRight(camera),
    () => rl.CameraFlat.GetCameraRight(
      rl.Temp.Camera3D$.Ref1(camera),
    ),
  );

  @override
  void CameraMoveForward(
    Camera3DD camera,
    num distance,
    bool moveInWorldPlane,
  ) => run(
    () => RaylibDebugLabels.CameraMoveForward(camera, distance, moveInWorldPlane),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.CameraFlat.CameraMoveForward(
        pc,
        distance,
        moveInWorldPlane,
      ),
    ),
  );

  @override
  void CameraMoveUp(
    Camera3DD camera,
    num distance,
  ) => run(
    () => RaylibDebugLabels.CameraMoveUp(camera, distance),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.CameraFlat.CameraMoveUp(
        pc,
        distance,
      ),
    ),
  );

  @override
  void CameraMoveRight(
    Camera3DD camera,
    num distance,
    bool moveInWorldPlane,
  ) => run(
    () => RaylibDebugLabels.CameraMoveRight(camera, distance, moveInWorldPlane),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.CameraFlat.CameraMoveRight(
        pc,
        distance,
        moveInWorldPlane,
      ),
    ),
  );

  @override
  void CameraMoveToTarget(
    Camera3DD camera,
    num delta,
  ) => run(
    () => RaylibDebugLabels.CameraMoveToTarget(camera, delta),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.CameraFlat.CameraMoveToTarget(
        pc,
        delta,
      ),
    ),
  );

  @override
  void CameraYaw(
    Camera3DD camera,
    num angle,
    bool rotateAroundTarget,
  ) => run(
    () => RaylibDebugLabels.CameraYaw(camera, angle, rotateAroundTarget),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.CameraFlat.CameraYaw(
        pc,
        angle,
        rotateAroundTarget,
      ),
    ),
  );

  @override
  void CameraPitch(
    Camera3DD camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => run(
    () => RaylibDebugLabels.CameraPitch(camera, angle, lockView, rotateAroundTarget, rotateUp),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.CameraFlat.CameraPitch(
        pc,
        angle,
        lockView,
        rotateAroundTarget,
        rotateUp,
      ),
    ),
  );

  @override
  void CameraRoll(
    Camera3DD camera,
    num angle,
  ) => run(
    () => RaylibDebugLabels.CameraRoll(camera, angle),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.CameraFlat.CameraRoll(
        pc,
        angle,
      ),
    ),
  );

  @override
  MatrixD GetCameraViewMatrix(
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetCameraViewMatrix(camera),
    () => rl.CameraFlat.GetCameraViewMatrix(
      rl.Temp.Camera3D$.Ref1(camera),
    ),
  );

  @override
  MatrixD GetCameraProjectionMatrix(
    Camera3DD camera,
    num aspect,
  ) => run(
    () => RaylibDebugLabels.GetCameraProjectionMatrix(camera, aspect),
    () => rl.CameraFlat.GetCameraProjectionMatrix(
      rl.Temp.Camera3D$.Ref1(camera),
      aspect,
    ),
  );
}
