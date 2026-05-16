// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_vox.c
// Run it: dart run models_loading_vox.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.Core.InitWindow(screenWidth, screenHeight, "models_loading_vox".toC);
  rl.Core.SetWindowMonitor(0);
  rl.Core.SetTargetFPS(60);

  final camera = rl.Temp.Camera3D$.At('camera');
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
		double t0 = rl.Core.GetTime() * 1000.0;
		models.add(rl.Core.LoadModel(voxFileNames[i].toC));
		double t1 = rl.Core.GetTime() * 1000.0;

		rl.Core.TraceLog(
      TraceLogLevel.LOG_WARNING.value,
      "[${voxFileNames[i]}] File loaded in ${(t1 - t0).f3} ms".toC,
    );

		final bb = rl.Core.GetModelBoundingBox(models[i]);

    final Vector3D center = .new(
      x: bb.min.x + (((bb.max.x - bb.min.x) / 2)),
		  z: bb.min.z + (((bb.max.z - bb.min.z) / 2)),
    );

		MatrixD matTranslate = .translate(-center.x, 0, -center.z);
		models[i].transform.setD(matTranslate);
	}

	int currentModel = 0;

  final shader = rl.Core.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/voxel_lighting.vs".toC,
		"../resources/shaders/glsl$GLSL_VERSION/voxel_lighting.fs".toC,
  );

	shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.Core.GetShaderLocation(shader, "viewPos".toC);

	rl.Core.SetShaderValue(shader,
    rl.Core.GetShaderLocation(shader, "ambient".toC),
    rl.Temp.Float$.Array([0.1, 0.1, 0.1, 1.0]).cast(),
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
    rl.Light.CreateLight(
      LightType.LIGHT_POINT.value,
      rl.Temp.vec31(-20, 20, -20), rl.Temp.vec3Zero, rl.Color.GRAY, shader
    ),
    rl.Light.CreateLight(
      LightType.LIGHT_POINT.value,
      rl.Temp.vec31(20, -20, 20), rl.Temp.vec3Zero, rl.Color.GRAY, shader
    ),
    rl.Light.CreateLight(
      LightType.LIGHT_POINT.value,
      rl.Temp.vec31(-20, 20, 20), rl.Temp.vec3Zero, rl.Color.GRAY, shader
    ),
    rl.Light.CreateLight(
      LightType.LIGHT_POINT.value,
      rl.Temp.vec31(20, -20, -20), rl.Temp.vec3Zero, rl.Color.GRAY, shader
    ),
  ];

  final modelpos = rl.Temp.Vector3$.At('modelpos');
	final camerarot = rl.Temp.Vector3$.At('camerarot');

  while (!rl.Core.WindowShouldClose())
  {
    if (rl.Core.IsMouseButtonDown(MouseButton.MOUSE_BUTTON_MIDDLE.value))
		{
			final mouseDelta = rl.Core.GetMouseDelta();
			camerarot.ref.x = mouseDelta.x * 0.05;
			camerarot.ref.y = mouseDelta.y * 0.05;
		}
		else
		{
			camerarot.ref.x = 0;
			camerarot.ref.y = 0;
		}

    double x = (rl.Core.IsKeyDown(KeyboardKey.KEY_W.value) || rl.Core.IsKeyDown(KeyboardKey.KEY_UP.value)).toInt() * 0.1 -
      (rl.Core.IsKeyDown(KeyboardKey.KEY_S.value) || rl.Core.IsKeyDown(KeyboardKey.KEY_DOWN.value)).toInt() * 0.1;

    double y = (rl.Core.IsKeyDown(KeyboardKey.KEY_D.value) || rl.Core.IsKeyDown(KeyboardKey.KEY_RIGHT.value)).toInt() * 0.1 -
      (rl.Core.IsKeyDown(KeyboardKey.KEY_A.value) || rl.Core.IsKeyDown(KeyboardKey.KEY_LEFT.value)).toInt() * 0.1;

		rl.Core.UpdateCameraPro(camera,
      rl.Temp.vec31(x, y, 0.0),
			camerarot.ref,
			rl.Core.GetMouseWheelMove() * -2.0
    );

		if (rl.Core.IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_LEFT.value)) {
      currentModel = (currentModel + 1) % MAX_VOX_FILES;
    }

    rl.Core.SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      rl.Temp.vec31Ptr.setC(camera.ref.position).cast(),
      ShaderUniformDataType.SHADER_UNIFORM_VEC3.value,
    );

		for (int i = 0; i < lights.length; i++) {
      rl.Light.UpdateLightValues(shader, lights[i]);
    }

		rl.Core.BeginDrawing();

      rl.Core.ClearBackground(rl.Color.RAYWHITE);

      rl.Core.BeginMode3D(camera.ref);

      rl.Core.DrawModel(models[currentModel], modelpos.ref, 1.0, rl.Color.WHITE);
      rl.Core.DrawGrid(10, 1.0);

      for (int i = 0; i < lights.length; i++)
      {
        if (lights[i].enabled) {
          rl.Core.DrawSphereEx(lights[i].position, 0.2, 8, 8, lights[i].color);
        }
        else
        {
          rl.Core.DrawSphereWires(lights[i].position, 0.2, 8, 8, rl.Core.ColorAlpha(lights[i].color, 0.3));
        }
      }

      rl.Core.EndMode3D();

      rl.Core.DrawRectangle(10, 400, 340, 60, rl.Core.Fade(rl.Color.SKYBLUE, 0.5));
      rl.Core.DrawRectangleLines(10, 400, 340, 60, rl.Core.Fade(rl.Color.DARKBLUE, 0.5));
      rl.Core.DrawText(
        "MOUSE LEFT BUTTON to CYCLE VOX MODELS".toC,
        40, 410, 10, rl.Color.BLUE
      );
      rl.Core.DrawText(
        "MOUSE MIDDLE BUTTON to ZOOM OR ROTATE CAMERA".toC,
        40, 420, 10, rl.Color.BLUE
      );
      rl.Core.DrawText(
        "UP-DOWN-LEFT-RIGHT KEYS to MOVE CAMERA".toC,
        40, 430, 10, rl.Color.BLUE
      );
      rl.Core.DrawText(
        "File: ${rl.Core.GetFileName(voxFileNames[currentModel].toC).toD}".toC,
        10, 10, 20, rl.Color.GRAY
      );

		rl.Core.EndDrawing();
  }

  models.forEach(rl.Core.UnloadModel);
  
  rl.CloseWindowAndDispose();
}