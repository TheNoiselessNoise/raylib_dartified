// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_bone_socket.c
// Run it: dart run models_bone_socket.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int BONE_SOCKETS = 3;
const int BONE_SOCKET_HAT = 0;
const int BONE_SOCKET_HAND_R = 1;
const int BONE_SOCKET_HAND_L = 2;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_bone_socket".toC);
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(5.0, 5.0, 5.0);
  camera.ref.target.set(0, 2, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final characterModel = LoadModel("../resources/models/gltf/greenman.glb".toC);
  final equipModel = <ModelC>[
    LoadModel("../resources/models/gltf/greenman_hat.glb".toC),
    LoadModel("../resources/models/gltf/greenman_sword.glb".toC),
    LoadModel("../resources/models/gltf/greenman_shield.glb".toC),
  ];
  final showEquip = List.filled(BONE_SOCKETS, true);

  final animsCount = Int$.At('animsCount');
  int animIndex = 0;
  int animCurrentFrame = 0;
  final modelAnimations = LoadModelAnimations(
    "../resources/models/gltf/greenman.glb".toC,
    animsCount
  );

  final boneSocketIndex = List.filled(BONE_SOCKETS, -1);

  for (int i = 0; i < characterModel.skeleton.boneCount; i++)
  {
    if (characterModel.skeleton.bones[i].nameString == "socket_hat")
    {
      boneSocketIndex[BONE_SOCKET_HAT] = i;
      continue;
    }
    
    if (characterModel.skeleton.bones[i].nameString == "socket_hand_R")
    {
      boneSocketIndex[BONE_SOCKET_HAND_R] = i;
      continue;
    }
    
    if (characterModel.skeleton.bones[i].nameString == "socket_hand_L")
    {
      boneSocketIndex[BONE_SOCKET_HAND_L] = i;
      continue;
    }
  }

  final position = Vector3$.At('position').set(0.0, 0.0, 0.0);
  int angle = 0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_THIRD_PERSON.value);
    
    if (IsKeyDown(KeyboardKey.KEY_F.value)) angle = (angle + 1)%360;
    else if (IsKeyDown(KeyboardKey.KEY_H.value)) angle = (360 + angle - 1)%360;

    if (IsKeyPressed(KeyboardKey.KEY_T.value)) animIndex = (animIndex + 1)%animsCount.value;
    else if (IsKeyPressed(KeyboardKey.KEY_G.value)) animIndex = (animIndex + animsCount.value - 1)%animsCount.value;

    if (IsKeyPressed(KeyboardKey.KEY_ONE.value)) showEquip[BONE_SOCKET_HAT] = !showEquip[BONE_SOCKET_HAT];
    if (IsKeyPressed(KeyboardKey.KEY_TWO.value)) showEquip[BONE_SOCKET_HAND_R] = !showEquip[BONE_SOCKET_HAND_R];
    if (IsKeyPressed(KeyboardKey.KEY_THREE.value)) showEquip[BONE_SOCKET_HAND_L] = !showEquip[BONE_SOCKET_HAND_L];
    
    final anim = modelAnimations[animIndex];
    animCurrentFrame = (animCurrentFrame + 1)%anim.keyframeCount;
    UpdateModelAnimation(characterModel, anim, animCurrentFrame.toDouble());

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);
        final QuaternionD characterRotate = .fromAxisAngle(.vec3(0.0, 1.0, 0.0), angle*rl.DEG2RAD);
        
        final MatrixD characterTransform = .fromQuaternion(characterRotate)
          .mul(.translateVector3(position.toD()));

        characterModel.transform.setD(characterTransform);

        UpdateModelAnimation(characterModel, anim, animCurrentFrame.toDouble());
        DrawMesh(
          characterModel.meshes[0],
          characterModel.materials[1],
          characterModel.transform
        );

        for (int i = 0; i < BONE_SOCKETS; i++)
        {
          if (!showEquip[i]) continue;

          final transform = anim.keyframePoses[animCurrentFrame][boneSocketIndex[i]];
          final inRotation = characterModel.skeleton.bindPose[boneSocketIndex[i]].rotation.toD();
          final outRotation = transform.rotation.toD();

          final rotate = outRotation.mul(inRotation.invert());
          final MatrixD matrixTransform = .fromQuaternion(rotate)
            .mul(.translateVector3(transform.translation.toD()))
            .mul(characterTransform);
          
          DrawMesh(
            equipModel[i].meshes[0],
            equipModel[i].materials[1],
            Matrix$.Value(matrixTransform).ref,
          );
        }

        DrawGrid(10, 1.0);
      EndMode3D();

      DrawText(
        "Use the T/G to switch animation".toC,
        10, 10, 20, GRAY
      );
      DrawText(
        "Use the F/H to rotate character left/right".toC,
        10, 35, 20, GRAY
      );
      DrawText(
        "Use the 1,2,3 to toggle shown of hat, sword and shield".toC,
        10, 60, 20, GRAY
      );

    EndDrawing();
  }

  UnloadModelAnimations(modelAnimations, animsCount.value);
  UnloadModel(characterModel);
  equipModel.forEach(UnloadModel);
  
  CloseWindowAndDispose();
}