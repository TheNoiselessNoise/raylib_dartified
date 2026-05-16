// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_vox.c
// Run it: dart run models_loading_vox.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "models_loading_vox");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final camera = Camera3DD(
    position: .vec3(10, 10, 10),
    target: .vec3(0, 0, 0),
    up: .vec3(0, 1, 0),
    fovy: 45,
    projection: .CAMERA_PERSPECTIVE,
  );

  final voxFileNames = <String>[
		"../resources/models/vox/chr_knight.vox",
		"../resources/models/vox/chr_sword.vox",
		"../resources/models/vox/monu9.vox",
		"../resources/models/vox/fez.vox"
  ];
  final int MAX_VOX_FILES = voxFileNames.length;

  final models = <ModelD>[];

	for (int i = 0; i < MAX_VOX_FILES; i++)
	{
		double t0 = rl.CoreD.GetTime() * 1000.0;
		models.add(rl.CoreD.LoadModel(voxFileNames[i]));
		double t1 = rl.CoreD.GetTime() * 1000.0;

		rl.CoreD.TraceLog(.LOG_WARNING,
      "[${voxFileNames[i]}] File loaded in ${(t1 - t0).f3} ms"
    );

		final bb = rl.CoreD.GetModelBoundingBox(models[i]);

    final Vector3D center = .new(
      x: bb.min.x + (((bb.max.x - bb.min.x) / 2)),
		  z: bb.min.z + (((bb.max.z - bb.min.z) / 2)),
    );

		MatrixD matTranslate = .translate(-center.x, 0, -center.z);
		models[i].transform.setD(matTranslate);
	}

	int currentModel = 0;

  final shader = rl.CoreD.LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/voxel_lighting.vs",
		"../resources/shaders/glsl$GLSL_VERSION/voxel_lighting.fs",
  );

	shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    rl.CoreD.GetShaderLocation(shader, "viewPos");

	rl.CoreD.SetShaderValue(shader,
    rl.CoreD.GetShaderLocation(shader, "ambient"),
    [0.1, 0.1, 0.1, 1.0],
    .SHADER_UNIFORM_VEC4,
  );

  for (int i = 0; i < MAX_VOX_FILES; i++)
	{
		final m = models[i];
		for (int j = 0; j < m.materialCount; j++)
		{
			m.materials[j].shader = shader;
		}
	}

  final lights = <LightD>[
    rl.LightD.CreateLight(.LIGHT_POINT,
      .vec3(-20, 20, -20), .zero(), .GRAY, shader
    ),
    rl.LightD.CreateLight(.LIGHT_POINT,
      .vec3(20, -20, 20), .zero(), .GRAY, shader
    ),
    rl.LightD.CreateLight(.LIGHT_POINT,
      .vec3(-20, 20, 20), .zero(), .GRAY, shader
    ),
    rl.LightD.CreateLight(.LIGHT_POINT,
      .vec3(20, -20, -20), .zero(), .GRAY, shader
    ),
  ];

  final Vector3D modelpos = .zero();
	final Vector3D camerarot = .zero();

  while (!rl.CoreD.WindowShouldClose())
  {
    if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_MIDDLE))
		{
			final mouseDelta = rl.CoreD.GetMouseDelta();
			camerarot.x = mouseDelta.x * 0.05;
			camerarot.y = mouseDelta.y * 0.05;
		}
		else
		{
			camerarot.x = 0;
			camerarot.y = 0;
		}

    double x = (rl.CoreD.IsKeyDown(.KEY_W) || rl.CoreD.IsKeyDown(.KEY_UP)).toInt() * 0.1 -
      (rl.CoreD.IsKeyDown(.KEY_S) || rl.CoreD.IsKeyDown(.KEY_DOWN)).toInt() * 0.1;

    double y = (rl.CoreD.IsKeyDown(.KEY_D) || rl.CoreD.IsKeyDown(.KEY_RIGHT)).toInt() * 0.1 -
      (rl.CoreD.IsKeyDown(.KEY_A) || rl.CoreD.IsKeyDown(.KEY_LEFT)).toInt() * 0.1;

		rl.CoreD.UpdateCameraPro(camera,
      .vec3(x, y, 0.0),
			camerarot,
			rl.CoreD.GetMouseWheelMove() * -2.0
    );

		if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      currentModel = (currentModel + 1) % MAX_VOX_FILES;
    }

    rl.CoreD.SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

		for (int i = 0; i < lights.length; i++) {
      rl.LightD.UpdateLightValues(shader, lights[i]);
    }

		rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginMode3D(camera);

      rl.CoreD.DrawModel(models[currentModel], modelpos, 1.0, .WHITE);
      rl.CoreD.DrawGrid(10, 1.0);

      for (int i = 0; i < lights.length; i++)
      {
        if (lights[i].enabled) {
          rl.CoreD.DrawSphereEx(lights[i].position, 0.2, 8, 8, lights[i].color);
        }
        else
        {
          rl.CoreD.DrawSphereWires(lights[i].position, 0.2, 8, 8, rl.CoreD.ColorAlpha(lights[i].color, 0.3));
        }
      }

      rl.CoreD.EndMode3D();

      rl.CoreD.DrawRectangle(10, 400, 340, 60, rl.CoreD.Fade(.SKYBLUE, 0.5));
      rl.CoreD.DrawRectangleLines(10, 400, 340, 60, rl.CoreD.Fade(.DARKBLUE, 0.5));
      rl.CoreD.DrawText(
        "MOUSE LEFT BUTTON to CYCLE VOX MODELS",
        40, 410, 10, .BLUE
      );
      rl.CoreD.DrawText(
        "MOUSE MIDDLE BUTTON to ZOOM OR ROTATE CAMERA",
        40, 420, 10, .BLUE
      );
      rl.CoreD.DrawText(
        "UP-DOWN-LEFT-RIGHT KEYS to MOVE CAMERA",
        40, 430, 10, .BLUE
      );
      rl.CoreD.DrawText(
        "File: ${rl.CoreD.GetFileName(voxFileNames[currentModel])}",
        10, 10, 20, .GRAY
      );

		rl.CoreD.EndDrawing();
  }

  models.forEach(rl.CoreD.UnloadModel);
  
  rl.CloseWindowAndDispose();
}