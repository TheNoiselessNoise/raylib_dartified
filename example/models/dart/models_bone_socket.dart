// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_bone_socket.c
// Run it: dart run models_bone_socket.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int BONE_SOCKETS = 3;
const int BONE_SOCKET_HAT = 0;
const int BONE_SOCKET_HAND_R = 1;
const int BONE_SOCKET_HAND_L = 2;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_bone_socket");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);
  rl.CoreD.DisableCursor();

  final camera = Camera3DD(
    position: .vec3(5.0, 5.0, 5.0),
    target: .vec3(0, 2, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final characterModel = rl.CoreD.LoadModel("../resources/models/gltf/greenman.glb");
  final equipModel = <ModelD>[
    rl.CoreD.LoadModel("../resources/models/gltf/greenman_hat.glb"),
    rl.CoreD.LoadModel("../resources/models/gltf/greenman_sword.glb"),
    rl.CoreD.LoadModel("../resources/models/gltf/greenman_shield.glb"),
  ];
  final showEquip = List.filled(BONE_SOCKETS, true);

  int animIndex = 0;
  int animCurrentFrame = 0;
  final modelAnimations = rl.CoreD.LoadModelAnimations("../resources/models/gltf/greenman.glb");

  final boneSocketIndex = List.filled(BONE_SOCKETS, -1);

  for (int i = 0; i < characterModel.boneCount; i++)
  {
    if (characterModel.bones[i].name == "socket_hat")
    {
      boneSocketIndex[BONE_SOCKET_HAT] = i;
      continue;
    }
    
    if (characterModel.bones[i].name == "socket_hand_R")
    {
      boneSocketIndex[BONE_SOCKET_HAND_R] = i;
      continue;
    }
    
    if (characterModel.bones[i].name == "socket_hand_L")
    {
      boneSocketIndex[BONE_SOCKET_HAND_L] = i;
      continue;
    }
  }

  final Vector3D position = .zero();
  int angle = 0;

  while (!rl.CoreD.WindowShouldClose())
  {
    rl.CoreD.UpdateCamera(camera, .CAMERA_THIRD_PERSON);
    
    if (rl.CoreD.IsKeyDown(.KEY_F)) angle = (angle + 1)%360;
    else if (rl.CoreD.IsKeyDown(.KEY_H)) angle = (360 + angle - 1)%360;

    if (rl.CoreD.IsKeyPressed(.KEY_T)) animIndex = (animIndex + 1)%modelAnimations.length;
    else if (rl.CoreD.IsKeyPressed(.KEY_G)) animIndex = (animIndex + modelAnimations.length - 1)%modelAnimations.length;

    if (rl.CoreD.IsKeyPressed(.KEY_ONE)) showEquip[BONE_SOCKET_HAT] = !showEquip[BONE_SOCKET_HAT];
    if (rl.CoreD.IsKeyPressed(.KEY_TWO)) showEquip[BONE_SOCKET_HAND_R] = !showEquip[BONE_SOCKET_HAND_R];
    if (rl.CoreD.IsKeyPressed(.KEY_THREE)) showEquip[BONE_SOCKET_HAND_L] = !showEquip[BONE_SOCKET_HAND_L];
    
    final anim = modelAnimations[animIndex];
    animCurrentFrame = (animCurrentFrame + 1)%anim.frameCount;
    rl.CoreD.UpdateModelAnimation(characterModel, anim, animCurrentFrame);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);
        final QuaternionD characterRotate = .fromAxisAngle(.vec3(0.0, 1.0, 0.0), angle*rl.DEG2RAD);
        
        characterModel.transform = .fromQuaternion(characterRotate)
          .mul(.translateVector3(position));

        rl.CoreD.UpdateModelAnimation(characterModel, anim, animCurrentFrame);
        rl.CoreD.DrawMesh(characterModel.meshes[0], characterModel.materials[1], characterModel.transform);

        for (int i = 0; i < BONE_SOCKETS; i++)
        {
          if (!showEquip[i]) continue;

          final transform = anim.framePoses[animCurrentFrame][boneSocketIndex[i]];
          final inRotation = characterModel.bindPose[boneSocketIndex[i]].rotation;
          final outRotation = transform.rotation;
          
          final rotate = outRotation.mul(inRotation.invert());
          final MatrixD matrixTransform = .fromQuaternion(rotate)
            .mul(.translateVector3(transform.translation))
            .mul(characterModel.transform);
          
          rl.CoreD.DrawMesh(
            equipModel[i].meshes[0],
            equipModel[i].materials[1],
            matrixTransform,
          );
        }

        rl.CoreD.DrawGrid(10, 1.0);
      rl.CoreD.EndMode3D();

      rl.CoreD.DrawText(
        "Use the T/G to switch animation",
        10, 10, 20, .GRAY
      );
      rl.CoreD.DrawText(
        "Use the F/H to rotate character left/right",
        10, 35, 20, .GRAY
      );
      rl.CoreD.DrawText(
        "Use the 1,2,3 to toggle shown of hat, sword and shield",
        10, 60, 20, .GRAY
      );

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadModelAnimations(modelAnimations);
  rl.CoreD.UnloadModel(characterModel);
  equipModel.forEach(rl.CoreD.UnloadModel);
  
  rl.CloseWindowAndDispose();
}