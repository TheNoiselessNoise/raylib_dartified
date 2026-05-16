part of '../../../raylib.dart';

class RaylibCameraD extends RaylibModule implements RaylibCameraModuleBase<
  // types
  Camera3DD,
  MatrixD,
  Vector3D
  
> {

  RaylibCameraD(super.rl);

  @override
  Vector3D GetCameraForward(
    Camera3DD camera,
  ) => run(
    () => 'GetCameraForward($camera)',
    () => rl.Camera.GetCameraForward(
      rl.Temp.Camera3D$.Ref1(camera),
    ).toD(),
  );

  @override
  Vector3D GetCameraUp(
    Camera3DD camera,
  ) => run(
    () => 'GetCameraUp($camera)',
    () => rl.Camera.GetCameraUp(
      rl.Temp.Camera3D$.Ref1(camera),
    ).toD(),
  );

  @override
  Vector3D GetCameraRight(
    Camera3DD camera,
  ) => run(
    () => 'GetCameraRight($camera)',
    () => rl.Camera.GetCameraRight(
      rl.Temp.Camera3D$.Ref1(camera),
    ).toD(),
  );

  @override
  void CameraMoveForward(
    Camera3DD camera,
    num distance,
    bool moveInWorldPlane,
  ) => run(
    () => 'CameraMoveForward($camera, $distance, $moveInWorldPlane)',
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.Camera.CameraMoveForward(
        pc,
        distance.toDouble(),
        moveInWorldPlane,
      ),
    ),
  );

  @override
  void CameraMoveUp(
    Camera3DD camera,
    num distance,
  ) => run(
    () => 'CameraMoveUp($camera, $distance)',
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.Camera.CameraMoveUp(
        pc,
        distance.toDouble(),
      ),
    ),
  );

  @override
  void CameraMoveRight(
    Camera3DD camera,
    num distance,
    bool moveInWorldPlane,
  ) => run(
    () => 'CameraMoveRight($camera, $distance, $moveInWorldPlane)',
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.Camera.CameraMoveRight(
        pc,
        distance.toDouble(),
        moveInWorldPlane,
      ),
    ),
  );

  @override
  void CameraMoveToTarget(
    Camera3DD camera,
    num delta,
  ) => run(
    () => 'CameraMoveToTarget($camera, $delta)',
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.Camera.CameraMoveToTarget(
        pc,
        delta.toDouble(),
      ),
    ),
  );

  @override
  void CameraYaw(
    Camera3DD camera,
    num angle,
    bool rotateAroundTarget,
  ) => run(
    () => 'CameraYaw($camera, $angle, $rotateAroundTarget)',
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.Camera.CameraYaw(
        pc,
        angle.toDouble(),
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
    () => 'CameraPitch($camera, $angle, $lockView, $rotateAroundTarget, $rotateUp)',
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.Camera.CameraPitch(
        pc,
        angle.toDouble(),
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
    () => 'CameraRoll($camera, $angle)',
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (pc) => rl.Camera.CameraRoll(
        pc,
        angle.toDouble(),
      ),
    ),
  );

  @override
  MatrixD GetCameraViewMatrix(
    Camera3DD camera,
  ) => run(
    () => 'GetCameraViewMatrix($camera)',
    () => rl.Camera.GetCameraViewMatrix(
      rl.Temp.Camera3D$.Ref1(camera),
    ).toD(),
  );

  @override
  MatrixD GetCameraProjectionMatrix(
    Camera3DD camera,
    num aspect,
  ) => run(
    () => 'GetCameraProjectionMatrix($camera)',
    () => rl.Camera.GetCameraProjectionMatrix(
      rl.Temp.Camera3D$.Ref1(camera),
      aspect.toDouble(),
    ).toD(),
  );
}
