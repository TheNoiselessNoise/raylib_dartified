// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_bone_socket.c
// Run it: dart run models_bone_socket.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int BONE_SOCKETS = 3;
const int BONE_SOCKET_HAT = 0;
const int BONE_SOCKET_HAND_R = 1;
const int BONE_SOCKET_HAND_L = 2;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_bone_socket".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);
  rl.Core.DisableCursor();

  final camera = rl.Temp.Camera3D$.At('camera');
  camera.ref.position.set(5.0, 5.0, 5.0);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final characterModel = rl.Core.LoadModel("../resources/models/gltf/greenman.glb".toC);
  final equipModel = <ModelC>[
    rl.Core.LoadModel("../resources/models/gltf/greenman_hat.glb".toC),
    rl.Core.LoadModel("../resources/models/gltf/greenman_sword.glb".toC),
    rl.Core.LoadModel("../resources/models/gltf/greenman_shield.glb".toC),
  ];
  final showEquip = List.filled(BONE_SOCKETS, true);

  final animsCount = rl.Temp.Int$.At('animsCount');
  int animIndex = 0;
  int animCurrentFrame = 0;
  final modelAnimations = rl.Core.LoadModelAnimations(
    "../resources/models/gltf/greenman.glb".toC,
    animsCount
  );

  final boneSocketIndex = List.filled(BONE_SOCKETS, -1);

  for (int i = 0; i < characterModel.boneCount; i++)
  {
    if (characterModel.bones[i].nameString == "socket_hat")
    {
      boneSocketIndex[BONE_SOCKET_HAT] = i;
      continue;
    }
    
    if (characterModel.bones[i].nameString == "socket_hand_R")
    {
      boneSocketIndex[BONE_SOCKET_HAND_R] = i;
      continue;
    }
    
    if (characterModel.bones[i].nameString == "socket_hand_L")
    {
      boneSocketIndex[BONE_SOCKET_HAND_L] = i;
      continue;
    }
  }

  final position = rl.Temp.Vector3$.At('position').set(0.0, 0.0, 0.0);
  int angle = 0;

  while (!rl.Core.WindowShouldClose())
  {
    rl.Core.UpdateCamera(camera, CameraMode.CAMERA_THIRD_PERSON.value);
    
    if (rl.Core.IsKeyDown(KeyboardKey.KEY_F.value)) angle = (angle + 1)%360;
    else if (rl.Core.IsKeyDown(KeyboardKey.KEY_H.value)) angle = (360 + angle - 1)%360;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_T.value)) animIndex = (animIndex + 1)%animsCount.value;
    else if (rl.Core.IsKeyPressed(KeyboardKey.KEY_G.value)) animIndex = (animIndex + animsCount.value - 1)%animsCount.value;

    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_ONE.value)) showEquip[BONE_SOCKET_HAT] = !showEquip[BONE_SOCKET_HAT];
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_TWO.value)) showEquip[BONE_SOCKET_HAND_R] = !showEquip[BONE_SOCKET_HAND_R];
    if (rl.Core.IsKeyPressed(KeyboardKey.KEY_THREE.value)) showEquip[BONE_SOCKET_HAND_L] = !showEquip[BONE_SOCKET_HAND_L];
    
    final anim = modelAnimations[animIndex];
    animCurrentFrame = (animCurrentFrame + 1)%anim.frameCount;
    rl.Core.UpdateModelAnimation(characterModel, anim, animCurrentFrame);

    rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.C.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);
        final QuaternionD characterRotate = .fromAxisAngle(.vec3(0.0, 1.0, 0.0), angle*rl.DEG2RAD);
        
        final MatrixD characterTransform = .fromQuaternion(characterRotate)
          .mul(.translateVector3(position.toD()));

        characterModel.transform.setD(characterTransform);

        rl.Core.UpdateModelAnimation(characterModel, anim, animCurrentFrame);
        rl.Core.DrawMesh(
          characterModel.meshes[0],
          characterModel.materials[1],
          characterModel.transform
        );

        for (int i = 0; i < BONE_SOCKETS; i++)
        {
          if (!showEquip[i]) continue;

          final transform = anim.framePoses[animCurrentFrame][boneSocketIndex[i]];
          final inRotation = characterModel.bindPose[boneSocketIndex[i]].rotation.toD();
          final outRotation = transform.rotation.toD();

          final rotate = outRotation.mul(inRotation.qInvert());
          final MatrixD matrixTransform = .fromQuaternion(rotate)
            .mul(.translateVector3(transform.translation.toD()))
            .mul(characterTransform);
          
          rl.Core.DrawMesh(
            equipModel[i].meshes[0],
            equipModel[i].materials[1],
            rl.Temp.Matrix$.Value(matrixTransform).ref,
          );
        }

        rl.Core.DrawGrid(10, 1.0);
      rl.Core.EndMode3D();

      rl.Core.DrawText(
        "Use the T/G to switch animation".toC,
        10, 10, 20, rl.C.GRAY
      );
      rl.Core.DrawText(
        "Use the F/H to rotate character left/right".toC,
        10, 35, 20, rl.C.GRAY
      );
      rl.Core.DrawText(
        "Use the 1,2,3 to toggle shown of hat, sword and shield".toC,
        10, 60, 20, rl.C.GRAY
      );

    rl.Core.EndDrawing();
  }

  rl.Core.UnloadModelAnimations(modelAnimations, animsCount.value);
  rl.Core.UnloadModel(characterModel);
  equipModel.forEach(rl.Core.UnloadModel);
  
  rl.CloseWindowAndDispose();
}