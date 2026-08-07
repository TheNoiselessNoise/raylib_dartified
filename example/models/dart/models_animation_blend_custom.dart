// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_animation_blend_custom.c
// Run it: dart run models_animation_blend_custom.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import 'dart:typed_data';
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_animation_blend_custom");
  SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(4.0, 4.0, 4.0),
    target: .vec3(0.0, 1.0, 0.0),
    up: .vec3(0.0, 1.0, 0.0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final model = LoadModel("../resources/models/gltf/greenman.glb");
  final Vector3D position = .vec3(0.0, 0.0, 0.0);

  final skinningShader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/skinning.vs",
    "../resources/shaders/glsl$GLSL_VERSION/skinning.fs"
  );
  model.materials[1].shader = skinningShader;

  final anims = LoadModelAnimations("../resources/models/gltf/greenman.glb");

  int animIndex0 = 2;
  int animIndex1 = 3;
  int animCurrentFrame0 = 0;
  int animCurrentFrame1 = 0;

  if (animIndex0 >= anims.length) animIndex0 = 0;
  if (animIndex1 >= anims.length) animIndex1 = (anims.length > 1) ? 1 : 0;

  bool upperBodyBlend = true;

  while (!WindowShouldClose())
  {
    UpdateCamera(camera, .CAMERA_ORBITAL);

    if (IsKeyPressed(.KEY_SPACE))
      upperBodyBlend = !upperBodyBlend;

    final anim0 = anims[animIndex0];
    final anim1 = anims[animIndex1];

    animCurrentFrame0 = (animCurrentFrame0 + 1) % anim0.keyframeCount;
    animCurrentFrame1 = (animCurrentFrame1 + 1) % anim1.keyframeCount;

    final blendFactor = upperBodyBlend ? 1.0 : 0.5;
    UpdateModelAnimationBones(
      model, anim0, animCurrentFrame0,
      anim1, animCurrentFrame1, blendFactor, upperBodyBlend
    );

    // raylib provided animation blending function
    // UpdateModelAnimationEx(
    //   model, anim0, animCurrentFrame0,
    //   anim1, animCurrentFrame1, blendFactor
    // );

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera);

        DrawModel(model, position, 1.0, WHITE);

        DrawGrid(10, 1.0);

      EndMode3D();

      DrawText("ANIM 0: ${anim0.name}", 10, 10, 20, GRAY);
      DrawText("ANIM 1: ${anim1.name}", 10, 40, 20, GRAY);
      DrawText(
        "[SPACE] Toggle blending mode: ${upperBodyBlend ? "Upper/Lower Body Blending" : "Uniform Blending"}",
        10, GetScreenHeight() - 30, 20, DARKGRAY
      );

    EndDrawing();
  }

  UnloadModelAnimations(anims);
  UnloadModel(model);
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
  ModelD model,
  ModelAnimationD anim0,
  int frame0,
  ModelAnimationD anim1,
  int frame1,
  double blend,
  bool upperBodyBlend
) {
  if (
    (anim0.boneCount != 0) && anim0.keyframePoses.isNotEmpty &&
    (anim1.boneCount != 0) && anim1.keyframePoses.isNotEmpty &&
    (model.skeleton.boneCount != 0) && model.skeleton.bindPose.isNotEmpty
  ) {
    blend = math.min(1.0, math.max(0.0, blend));

    if (frame0 >= anim0.keyframeCount)
      frame0 = anim0.keyframeCount - 1;
    if (frame1 >= anim1.keyframeCount)
      frame1 = anim1.keyframeCount - 1;
    if (frame0 < 0)
      frame0 = 0;
    if (frame1 < 0)
      frame1 = 0;

    int boneCount = model.skeleton.boneCount;
    if (anim0.boneCount < boneCount)
      boneCount = anim0.boneCount;
    if (anim1.boneCount < boneCount)
      boneCount = anim1.boneCount;

    for (int boneIndex = 0; boneIndex < boneCount; boneIndex++)
    {
      double boneBlendFactor = blend;

      if (upperBodyBlend)
      {
        final boneName = model.skeleton.bones[boneIndex].name;
        bool isUpperBody = IsUpperBodyBone(boneName);

        if (isUpperBody)
          boneBlendFactor = blend;
        else
          boneBlendFactor = 1.0 - blend;
      }

      final bindTransform = model.skeleton.bindPose[boneIndex];
      final animTransform0 = anim0.keyframePoses[frame0][boneIndex];
      final animTransform1 = anim1.keyframePoses[frame1][boneIndex];

      final blended = TransformD();
      blended.translation = animTransform0.translation.lerp(animTransform1.translation, boneBlendFactor);
      blended.rotation = animTransform0.rotation.sLerp(animTransform1.rotation, boneBlendFactor);
      blended.scale = animTransform0.scale.lerp(animTransform1.scale, boneBlendFactor);

      final MatrixD bindMatrix =
        .scale(bindTransform.scale.x, bindTransform.scale.y, bindTransform.scale.z)
        .mul(bindTransform.rotation.toMatrix())
        .mul(.translate(bindTransform.translation.x, bindTransform.translation.y, bindTransform.translation.z));

      final MatrixD blendedMatrix =
        .scale(blended.scale.x, blended.scale.y, blended.scale.z)
        .mul(blended.rotation.toMatrix())
        .mul(.translate(blended.translation.x, blended.translation.y, blended.translation.z));

      model.boneMatrices[boneIndex] = bindMatrix.invert().mul(blendedMatrix);
    }

    for (int m = 0; m < model.meshCount; m++)
    {
      final mesh = model.meshes[m];
      Vector3D animVertex = .zero();
      Vector3D animNormal = .zero();
      int vertexValuesCount = mesh.vertexCount * 3;

      int boneIndex = 0;
      int boneCounter = 0;
      double boneWeight = 0.0;
      bool bufferUpdateRequired = false;

      if (
        mesh.boneWeights.isEmpty || mesh.boneIndices.isEmpty ||
        mesh.animVertices.isEmpty || mesh.animNormals.isEmpty
      ) continue;

      for (int vCounter = 0; vCounter < vertexValuesCount; vCounter += 3)
      {
        mesh.animVertices[vCounter] = 0;
        mesh.animVertices[vCounter + 1] = 0;
        mesh.animVertices[vCounter + 2] = 0;
        if (mesh.animNormals.isNotEmpty)
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
          animVertex = .vec3(mesh.vertices[vCounter], mesh.vertices[vCounter + 1], mesh.vertices[vCounter + 2]);
          animVertex = animVertex.transform(model.boneMatrices[boneIndex]);
          mesh.animVertices[vCounter] += animVertex.x * boneWeight;
          mesh.animVertices[vCounter + 1] += animVertex.y * boneWeight;
          mesh.animVertices[vCounter + 2] += animVertex.z * boneWeight;
          bufferUpdateRequired = true;

          if (mesh.normals.isNotEmpty && mesh.animNormals.isNotEmpty)
          {
            animNormal = .vec3(mesh.normals[vCounter], mesh.normals[vCounter + 1], mesh.normals[vCounter + 2]);
            animNormal = animNormal.transform(model.boneMatrices[boneIndex].invert().transpose());
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
          Float32List.fromList(mesh.animVertices),
          mesh.vertexCount * 3,
          0
        );

        if (mesh.normals.isNotEmpty)
          rlUpdateVertexBuffer(
            mesh.vboId[ShaderLocationIndex.SHADER_LOC_VERTEX_NORMAL.value],
            Float32List.fromList(mesh.animNormals),
            mesh.vertexCount * 3,
            0
          );
      }
    }
  }
}
