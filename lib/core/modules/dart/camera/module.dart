part of '../../../raylib.dart';

class RaylibCameraD extends RaylibModuleD {
  RaylibCameraD(super.lib);

  Vector3D GetCameraForward(
    CameraD camera,
  ) => run(
    () => 'GetCameraForward($camera)',
    () => rl.Cam.GetCameraForward(
      _refCamera3D1(camera),
    ).toD(),
  );

  Vector3D GetCameraUp(
    CameraD camera,
  ) => run(
    () => 'GetCameraUp($camera)',
    () => rl.Cam.GetCameraUp(
      _refCamera3D1(camera),
    ).toD(),
  );

  Vector3D GetCameraRight(
    CameraD camera,
  ) => run(
    () => 'GetCameraRight($camera)',
    () => rl.Cam.GetCameraRight(
      _refCamera3D1(camera),
    ).toD(),
  );

  void CameraMoveForward(
    CameraD camera,
    num distance,
    bool moveInWorldPlane,
  ) => run(
    () => 'CameraMoveForward($camera, $distance, $moveInWorldPlane)',
    () => _refUpdateCamera3D(camera,
      (pc) => rl.Cam.CameraMoveForward(
        pc,
        distance.toDouble(),
        moveInWorldPlane,
      ),
    ),
  );

  void CameraMoveUp(
    CameraD camera,
    num distance,
  ) => run(
    () => 'CameraMoveUp($camera, $distance)',
    () => _refUpdateCamera3D(camera,
      (pc) => rl.Cam.CameraMoveUp(
        pc,
        distance.toDouble(),
      ),
    ),
  );

  void CameraMoveRight(
    CameraD camera,
    num distance,
    bool moveInWorldPlane,
  ) => run(
    () => 'CameraMoveRight($camera, $distance, $moveInWorldPlane)',
    () => _refUpdateCamera3D(camera,
      (pc) => rl.Cam.CameraMoveRight(
        pc,
        distance.toDouble(),
        moveInWorldPlane,
      ),
    ),
  );

  void CameraMoveToTarget(
    CameraD camera,
    num delta,
  ) => run(
    () => 'CameraMoveToTarget($camera, $delta)',
    () => _refUpdateCamera3D(camera,
      (pc) => rl.Cam.CameraMoveToTarget(
        pc,
        delta.toDouble(),
      ),
    ),
  );

  void CameraYaw(
    CameraD camera,
    num angle,
    bool rotateAroundTarget,
  ) => run(
    () => 'CameraYaw($camera, $angle, $rotateAroundTarget)',
    () => _refUpdateCamera3D(camera,
      (pc) => rl.Cam.CameraYaw(
        pc,
        angle.toDouble(),
        rotateAroundTarget,
      ),
    ),
  );

  void CameraPitch(
    CameraD camera,
    num angle,
    bool lockView,
    bool rotateAroundTarget,
    bool rotateUp,
  ) => run(
    () => 'CameraPitch($camera, $angle, $lockView, $rotateAroundTarget, $rotateUp)',
    () => _refUpdateCamera3D(camera,
      (pc) => rl.Cam.CameraPitch(
        pc,
        angle.toDouble(),
        lockView,
        rotateAroundTarget,
        rotateUp,
      ),
    ),
  );

  void CameraRoll(
    CameraD camera,
    num angle,
  ) => run(
    () => 'CameraRoll($camera, $angle)',
    () => _refUpdateCamera3D(camera,
      (pc) => rl.Cam.CameraRoll(
        pc,
        angle.toDouble(),
      ),
    ),
  );

  MatrixD GetCameraViewMatrix(
    CameraD camera,
  ) => run(
    () => 'GetCameraViewMatrix($camera)',
    () => rl.Cam.GetCameraViewMatrix(
      _refCamera3D1(camera),
    ).toD(),
  );

  MatrixD GetCameraProjectionMatrix(
    CameraD camera,
    num aspect,
  ) => run(
    () => 'GetCameraProjectionMatrix($camera)',
    () => rl.Cam.GetCameraProjectionMatrix(
      _refCamera3D1(camera),
      aspect.toDouble(),
    ).toD(),
  );
}
