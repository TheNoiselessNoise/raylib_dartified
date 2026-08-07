// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_vox.c
// Run it: dart run models_loading_vox.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_loading_vox".toC);
  SetTargetFPS(60);

  final camera = Camera3D$.$newPtr;
  camera.ref.position.set(10, 10, 10);
  camera.ref.target.set(0, 0, 0);
  camera.ref.up.set(0, 1, 0);
  camera.ref.fovy = 45;
  camera.ref.projection = CameraProjection.CAMERA_PERSPECTIVE.value;

  final voxFileNames = <String>[
		"../resources/models/vox/chr_knight.vox",
		"../resources/models/vox/chr_sword.vox",
		"../resources/models/vox/monu9.vox",
		"../resources/models/vox/fez.vox"
  ];
  final int MAX_VOX_FILES = voxFileNames.length;

  final models = <ModelC>[];

	for (int i = 0; i < MAX_VOX_FILES; i++)
	{
		double t0 = GetTime() * 1000.0;
		models.add(LoadModel(voxFileNames[i].toC));
		double t1 = GetTime() * 1000.0;

		TraceLog(
      TraceLogLevel.LOG_WARNING.value,
      "[${voxFileNames[i]}] File loaded in ${(t1 - t0).f3} ms".toC,
    );

		final bb = GetModelBoundingBox(models[i]);

    final Vector3D center = .new(
      x: bb.min.x + (((bb.max.x - bb.min.x) / 2)),
		  z: bb.min.z + (((bb.max.z - bb.min.z) / 2)),
    );

		MatrixD matTranslate = .translate(-center.x, 0, -center.z);
		models[i].transform.setD(matTranslate);
	}

	int currentModel = 0;

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/voxel_lighting.vs".toC,
		"../resources/shaders/glsl$GLSL_VERSION/voxel_lighting.fs".toC,
  );

	shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(shader, "viewPos".toC);

	SetShaderValue(shader,
    GetShaderLocation(shader, "ambient".toC),
    Float32$.Array([0.1, 0.1, 0.1, 1.0]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value,
  );

  for (int i = 0; i < MAX_VOX_FILES; i++)
	{
		final m = models[i];
		for (int j = 0; j < m.materialCount; j++)
		{
			m.materials[j].shader = shader;
		}
	}

  final lights = <LightC>[
    CreateLight(
      LightType.LIGHT_POINT.value,
      Vector3$.$1.set(-20, 20, -20), Vector3$.$zero, GRAY, shader
    ),
    CreateLight(
      LightType.LIGHT_POINT.value,
      Vector3$.$1.set(20, -20, 20), Vector3$.$zero, GRAY, shader
    ),
    CreateLight(
      LightType.LIGHT_POINT.value,
      Vector3$.$1.set(-20, 20, 20), Vector3$.$zero, GRAY, shader
    ),
    CreateLight(
      LightType.LIGHT_POINT.value,
      Vector3$.$1.set(20, -20, -20), Vector3$.$zero, GRAY, shader
    ),
  ];

  final modelpos = Vector3$.At('modelpos');
	final camerarot = Vector3$.At('camerarot');

  while (!WindowShouldClose())
  {
    if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_MIDDLE.value))
		{
			final mouseDelta = GetMouseDelta();
			camerarot.ref.x = mouseDelta.x * 0.05;
			camerarot.ref.y = mouseDelta.y * 0.05;
		}
		else
		{
			camerarot.ref.x = 0;
			camerarot.ref.y = 0;
		}

    double x = (IsKeyDown(KeyboardKey.KEY_W.value) || IsKeyDown(KeyboardKey.KEY_UP.value)).toInt() * 0.1 -
      (IsKeyDown(KeyboardKey.KEY_S.value) || IsKeyDown(KeyboardKey.KEY_DOWN.value)).toInt() * 0.1;

    double y = (IsKeyDown(KeyboardKey.KEY_D.value) || IsKeyDown(KeyboardKey.KEY_RIGHT.value)).toInt() * 0.1 -
      (IsKeyDown(KeyboardKey.KEY_A.value) || IsKeyDown(KeyboardKey.KEY_LEFT.value)).toInt() * 0.1;

		UpdateCameraPro(camera,
      Vector3$.$1.set(x, y, 0.0),
			camerarot.ref,
			GetMouseWheelMove() * -2.0
    );

		if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      currentModel = (currentModel + 1) % MAX_VOX_FILES;
    }

    SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      Vector3$.$1Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

		for (int i = 0; i < lights.length; i++) {
      UpdateLightValues(shader, lights[i]);
    }

		BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginMode3D(camera.ref);

      DrawModel(models[currentModel], modelpos.ref, 1.0, WHITE);
      DrawGrid(10, 1.0);

      for (int i = 0; i < lights.length; i++)
      {
        if (lights[i].enabled) {
          DrawSphereEx(lights[i].position, 0.2, 8, 8, lights[i].color);
        }
        else
        {
          DrawSphereWires(lights[i].position, 0.2, 8, 8, ColorAlpha(lights[i].color, 0.3));
        }
      }

      EndMode3D();

      DrawRectangle(10, 400, 340, 60, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(10, 400, 340, 60, Fade(DARKBLUE, 0.5));
      DrawText(
        "MOUSE LEFT BUTTON to CYCLE VOX MODELS".toC,
        40, 410, 10, BLUE
      );
      DrawText(
        "MOUSE MIDDLE BUTTON to ZOOM OR ROTATE CAMERA".toC,
        40, 420, 10, BLUE
      );
      DrawText(
        "UP-DOWN-LEFT-RIGHT KEYS to MOVE CAMERA".toC,
        40, 430, 10, BLUE
      );
      DrawText(
        "File: ${GetFileName(voxFileNames[currentModel].toC).toD}".toC,
        10, 10, 20, GRAY
      );

		EndDrawing();
  }

  models.forEach(UnloadModel);
  
  CloseWindowAndDispose();
}