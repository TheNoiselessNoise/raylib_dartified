// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_animation_blend_custom.c
// Run it: dart run models_animation_blend_custom.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_animation_blend_custom".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.val.$newPtr;
  camera.ref.position.set(4.0, 4.0, 4.0);
  camera.ref.target.set(0.0, 1.0, 0.0);
  camera.ref.up.set(0.0, 1.0, 0.0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final model = Model$.val.RawValueUnique(LoadModel("../resources/models/gltf/greenman.glb".toC));
  final position = Vector3$.val.$new.set(0.0, 0.0, 0.0);

  final skinningShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skinning.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/skinning.fs".toC
  );
  model.ref.materials[1].shader = skinningShader;

  final animCount = Int$.val.$newPtr;
  final anims = LoadModelAnimations("../resources/models/gltf/greenman.glb".toC, animCount);

  int animIndex0 = 2;
  int animIndex1 = 3;
  int animCurrentFrame0 = 0;
  int animCurrentFrame1 = 0;

  if (animIndex0 >= animCount.value) animIndex0 = 0;
  if (animIndex1 >= animCount.value) animIndex1 = (animCount.value > 1) ? 1 : 0;

  bool upperBodyBlend = true;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, CameraMode.CAMERA_ORBITAL.value);

    if (IsKeyPressed(KeyboardKey.KEY_SPACE.value))
      upperBodyBlend = !upperBodyBlend;

    final anim0 = ModelAnimation$.val.RawValue(anims[animIndex0], 'anim0');
    final anim1 = ModelAnimation$.val.RawValue(anims[animIndex1], 'anim1');

    animCurrentFrame0 = (animCurrentFrame0 + 1) % anim0.ref.keyframeCount;
    animCurrentFrame1 = (animCurrentFrame1 + 1) % anim1.ref.keyframeCount;

    final blendFactor = upperBodyBlend ? 1.0 : 0.5;
    UpdateModelAnimationBones(
      model, anim0, animCurrentFrame0,
      anim1, animCurrentFrame1, blendFactor, upperBodyBlend
    );

    // raylib provided animation blending function
    // UpdateModelAnimationEx(
    //   model, anim0, animCurrentFrame0.toDouble(),
    //   anim1, animCurrentFrame1.toDouble(), blendFactor
    // );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

        DrawModel(model.ref, position, 1.0, WHITE);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText("ANIM 0: ${anim0.ref.nameString}".toC, 10, 10, 20, GRAY);
      DrawText("ANIM 1: ${anim1.ref.nameString}".toC, 10, 40, 20, GRAY);
      DrawText(
        "[SPACE] Toggle blending mode: ${upperBodyBlend ? "Upper/Lower Body Blending" : "Uniform Blending"}".toC,
        10, GetScreenHeight() - 30, 20, DARKGRAY
      );

    EndDrawing();
  }

  UnloadModelAnimations(anims, animCount.value);
  UnloadModel(model.ref);
  UnloadShader(skinningShader);
  
  CloseWindowAndDispose();
}

bool IsUpperBodyBone(String boneName)
{
  if (
    boneName == "spine" || boneName == "spine1" || boneName == "spine2" ||
    boneName == "chest" || boneName == "upperChest" ||
    boneName == "neck" || boneName == "head" ||
    boneName == "shoulder" || boneName == "shoulder_L" || boneName == "shoulder_R" ||
    boneName == "upperArm" || boneName == "upperArm_L" || boneName == "upperArm_R" ||
    boneName == "lowerArm" || boneName == "lowerArm_L" || boneName == "lowerArm_R" ||
    boneName == "hand" || boneName == "hand_L" || boneName == "hand_R" ||
    boneName == "clavicle" || boneName == "clavicle_L" || boneName == "clavicle_R"
  ) return true;

  if (
    boneName.contains("spine") ||
    boneName.contains("chest") ||
    boneName.contains("neck") ||
    boneName.contains("head") ||
    boneName.contains("shoulder") ||
    boneName.contains("arm") ||
    boneName.contains("hand") ||
    boneName.contains("clavicle")
  ) return true;

  return false;
}

void UpdateModelAnimationBones(
  Pointer<ModelC> model,
  Pointer<ModelAnimationC> anim0,
  int frame0,
  Pointer<ModelAnimationC> anim1,
  int frame1,
  double blend,
  bool upperBodyBlend
) {
  if (
    (anim0.ref.boneCount != 0) && (anim0.ref.keyframePoses != nullptr) &&
    (anim1.ref.boneCount != 0) && (anim1.ref.keyframePoses != nullptr) &&
    (model.ref.skeleton.boneCount != 0) && (model.ref.skeleton.bindPose != nullptr)
  ) {
    blend = math.min(1.0, math.max(0.0, blend));

    if (frame0 >= anim0.ref.keyframeCount)
      frame0 = anim0.ref.keyframeCount - 1;
    if (frame1 >= anim1.ref.keyframeCount)
      frame1 = anim1.ref.keyframeCount - 1;
    if (frame0 < 0)
      frame0 = 0;
    if (frame1 < 0)
      frame1 = 0;

    int boneCount = model.ref.skeleton.boneCount;
    if (anim0.ref.boneCount < boneCount)
      boneCount = anim0.ref.boneCount;
    if (anim1.ref.boneCount < boneCount)
      boneCount = anim1.ref.boneCount;

    for (int boneIndex = 0; boneIndex < boneCount; boneIndex++)
    {
      double boneBlendFactor = blend;

      if (upperBodyBlend)
      {
        final boneName = model.ref.skeleton.bones[boneIndex].nameString;
        bool isUpperBody = IsUpperBodyBone(boneName);

        if (isUpperBody)
          boneBlendFactor = blend;
        else
          boneBlendFactor = 1.0 - blend;
      }

      final bindTransform = model.ref.skeleton.bindPose + boneIndex;
      final animTransform0 = anim0.ref.keyframePoses[frame0] + boneIndex;
      final animTransform1 = anim1.ref.keyframePoses[frame1] + boneIndex;

      final blended = Transform$.val.$1;
      blended.translation.setD(animTransform0.ref.translation.toD().lerp(animTransform1.ref.translation.toD(), boneBlendFactor));
      blended.rotation.setD(animTransform0.ref.rotation.toD().sLerp(animTransform1.ref.rotation.toD(), boneBlendFactor));
      blended.scale.setD(animTransform0.ref.scale.toD().lerp(animTransform1.ref.scale.toD(), boneBlendFactor));

      final MatrixD bindMatrix =
        .scale(bindTransform.ref.scale.x, bindTransform.ref.scale.y, bindTransform.ref.scale.z)
        .mul(bindTransform.ref.rotation.toD().toMatrix())
        .mul(.translate(bindTransform.ref.translation.x, bindTransform.ref.translation.y, bindTransform.ref.translation.z));

      final MatrixD blendedMatrix =
        .scale(blended.scale.x, blended.scale.y, blended.scale.z)
        .mul(blended.rotation.toD().toMatrix())
        .mul(.translate(blended.translation.x, blended.translation.y, blended.translation.z));

      model.ref.boneMatrices[boneIndex].setD(bindMatrix.invert().mul(blendedMatrix));
    }

    for (int m = 0; m < model.ref.meshCount; m++)
    {
      final mesh = model.ref.meshes[m];
      final animVertex = Vector3$.val.$1;
      final animNormal = Vector3$.val.$2;
      int vertexValuesCount = mesh.vertexCount * 3;

      int boneIndex = 0;
      int boneCounter = 0;
      double boneWeight = 0.0;
      bool bufferUpdateRequired = false;

      if (
        (mesh.boneWeights == nullptr) || (mesh.boneIndices == nullptr) ||
        (mesh.animVertices == nullptr) || (mesh.animNormals == nullptr)
      ) continue;

      for (int vCounter = 0; vCounter < vertexValuesCount; vCounter += 3)
      {
        mesh.animVertices[vCounter] = 0;
        mesh.animVertices[vCounter + 1] = 0;
        mesh.animVertices[vCounter + 2] = 0;
        if (mesh.animNormals != nullptr)
        {
          mesh.animNormals[vCounter] = 0;
          mesh.animNormals[vCounter + 1] = 0;
          mesh.animNormals[vCounter + 2] = 0;
        }

        for (int j = 0; j < 4; j++, boneCounter++)
        {
          boneWeight = mesh.boneWeights[boneCounter];
          boneIndex = mesh.boneIndices[boneCounter];

          if (boneWeight == 0.0)
            continue;
          animVertex.set(mesh.vertices[vCounter], mesh.vertices[vCounter + 1], mesh.vertices[vCounter + 2]);
          animVertex.setD(animVertex.toD().transform(model.ref.boneMatrices[boneIndex].toD()));
          mesh.animVertices[vCounter] += animVertex.x * boneWeight;
          mesh.animVertices[vCounter + 1] += animVertex.y * boneWeight;
          mesh.animVertices[vCounter + 2] += animVertex.z * boneWeight;
          bufferUpdateRequired = true;

          if ((mesh.normals != nullptr) && (mesh.animNormals != nullptr))
          {
            animNormal.set(mesh.normals[vCounter], mesh.normals[vCounter + 1], mesh.normals[vCounter + 2]);
            animNormal.setD(animNormal.toD().transform(model.ref.boneMatrices[boneIndex].toD().invert().transpose()));
            mesh.animNormals[vCounter] += animNormal.x * boneWeight;
            mesh.animNormals[vCounter + 1] += animNormal.y * boneWeight;
            mesh.animNormals[vCounter + 2] += animNormal.z * boneWeight;
          }
        }
      }

      if (bufferUpdateRequired)
      {
        rlUpdateVertexBuffer(
          mesh.vboId[ShaderLocationIndex.SHADER_LOC_VERTEX_POSITION.value],
          mesh.animVertices.cast(),
          mesh.vertexCount * 3 * sizeOf<Float>(),
          0
        );

        if (mesh.normals != nullptr)
          rlUpdateVertexBuffer(
            mesh.vboId[ShaderLocationIndex.SHADER_LOC_VERTEX_NORMAL.value],
            mesh.animNormals.cast(),
            mesh.vertexCount * 3 * sizeOf<Float>(),
            0
          );
      }
    }
  }
}
