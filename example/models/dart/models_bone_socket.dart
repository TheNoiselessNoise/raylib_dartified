// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_bone_socket.c
// Run it: dart run models_bone_socket.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int BONE_SOCKETS = 3;
const int BONE_SOCKET_HAT = 0;
const int BONE_SOCKET_HAND_R = 1;
const int BONE_SOCKET_HAND_L = 2;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  rl.debugEverything(true);

  InitWindow(screenWidth, screenHeight, "models_bone_socket");
  SetTargetFPS(60);
  DisableCursor();

  final camera = Camera3DD(
    position: .vec3(5.0, 5.0, 5.0),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final characterModel = LoadModel("../resources/models/gltf/greenman.glb");
  final equipModel = <ModelD>[
    LoadModel("../resources/models/gltf/greenman_hat.glb"),
    LoadModel("../resources/models/gltf/greenman_sword.glb"),
    LoadModel("../resources/models/gltf/greenman_shield.glb"),
  ];
  final showEquip = List.filled(BONE_SOCKETS, true);

  int animIndex = 0;
  int animCurrentFrame = 0;
  final modelAnimations = LoadModelAnimations("../resources/models/gltf/greenman.glb");

  final boneSocketIndex = List.filled(BONE_SOCKETS, -1);

  for (int i = 0; i < characterModel.skeleton.boneCount; i++)
  {
    if (characterModel.skeleton.bones[i].name == "socket_hat")
    {
      boneSocketIndex[BONE_SOCKET_HAT] = i;
      continue;
    }
    
    if (characterModel.skeleton.bones[i].name == "socket_hand_R")
    {
      boneSocketIndex[BONE_SOCKET_HAND_R] = i;
      continue;
    }
    
    if (characterModel.skeleton.bones[i].name == "socket_hand_L")
    {
      boneSocketIndex[BONE_SOCKET_HAND_L] = i;
      continue;
    }
  }

  final Vector3D position = .zero();
  int angle = 0;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_THIRD_PERSON);
    
    if (IsKeyDown(.KEY_F)) angle = (angle + 1)%360;
    else if (IsKeyDown(.KEY_H)) angle = (360 + angle - 1)%360;

    if (IsKeyPressed(.KEY_T)) animIndex = (animIndex + 1)%modelAnimations.length;
    else if (IsKeyPressed(.KEY_G)) animIndex = (animIndex + modelAnimations.length - 1)%modelAnimations.length;

    if (IsKeyPressed(.KEY_ONE)) showEquip[BONE_SOCKET_HAT] = !showEquip[BONE_SOCKET_HAT];
    if (IsKeyPressed(.KEY_TWO)) showEquip[BONE_SOCKET_HAND_R] = !showEquip[BONE_SOCKET_HAND_R];
    if (IsKeyPressed(.KEY_THREE)) showEquip[BONE_SOCKET_HAND_L] = !showEquip[BONE_SOCKET_HAND_L];
    
    final anim = modelAnimations[animIndex];
    animCurrentFrame = (animCurrentFrame + 1)%anim.keyframeCount;
    UpdateModelAnimation(characterModel, anim, animCurrentFrame);

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);
        final QuaternionD characterRotate = .fromAxisAngle(.vec3(0.0, 1.0, 0.0), angle*rl.DEG2RAD);
        
        characterModel.transform = .fromQuaternion(characterRotate)
          .mul(.translateVector3(position));

        UpdateModelAnimation(characterModel, anim, animCurrentFrame);
        DrawMesh(characterModel.meshes[0], characterModel.materials[1], characterModel.transform);

        for (int i = 0; i < BONE_SOCKETS; i++)
        {
          if (!showEquip[i]) continue;

          final transform = anim.keyframePoses[animCurrentFrame][boneSocketIndex[i]];
          final inRotation = characterModel.skeleton.bindPose[boneSocketIndex[i]].rotation;
          final outRotation = transform.rotation;
          
          final rotate = outRotation.mul(inRotation.invert());
          final MatrixD matrixTransform = .fromQuaternion(rotate)
            .mul(.translateVector3(transform.translation))
            .mul(characterModel.transform);
          
          DrawMesh(
            equipModel[i].meshes[0],
            equipModel[i].materials[1],
            matrixTransform,
          );
        }

        DrawGrid(10, 1.0);
      EndMode3D();

      DrawText(
        "Use the T/G to switch animation",
        10, 10, 20, .GRAY
      );
      DrawText(
        "Use the F/H to rotate character left/right",
        10, 35, 20, .GRAY
      );
      DrawText(
        "Use the 1,2,3 to toggle shown of hat, sword and shield",
        10, 60, 20, .GRAY
      );

    EndDrawing();
  }

  UnloadModelAnimations(modelAnimations);
  UnloadModel(characterModel);
  equipModel.forEach(UnloadModel);
  
  CloseWindowAndDispose();
}