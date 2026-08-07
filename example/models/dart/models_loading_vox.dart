// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/models/models_loading_vox.c
// Run it: dart run models_loading_vox.dart
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "models_loading_vox");
  SetTargetFPS(60);

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
		double t0 = GetTime() * 1000.0;
		models.add(LoadModel(voxFileNames[i]));
		double t1 = GetTime() * 1000.0;

		TraceLog(.LOG_WARNING,
      "[${voxFileNames[i]}] File loaded in ${(t1 - t0).f3} ms"
    );

		final bb = GetModelBoundingBox(models[i]);

    final Vector3D center = .new(
      x: bb.min.x + (((bb.max.x - bb.min.x) / 2)),
		  z: bb.min.z + (((bb.max.z - bb.min.z) / 2)),
    );

		models[i].transform = .translate(-center.x, 0, -center.z);
	}

	int currentModel = 0;

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/voxel_lighting.vs",
		"../resources/shaders/glsl$GLSL_VERSION/voxel_lighting.fs",
  );

	shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value] =
    GetShaderLocation(shader, "viewPos");

	SetShaderValue(shader,
    GetShaderLocation(shader, "ambient"),
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
    CreateLight(.LIGHT_POINT,
      .vec3(-20, 20, -20), .zero(), .GRAY, shader
    ),
    CreateLight(.LIGHT_POINT,
      .vec3(20, -20, 20), .zero(), .GRAY, shader
    ),
    CreateLight(.LIGHT_POINT,
      .vec3(-20, 20, 20), .zero(), .GRAY, shader
    ),
    CreateLight(.LIGHT_POINT,
      .vec3(20, -20, -20), .zero(), .GRAY, shader
    ),
  ];

  final Vector3D modelpos = .zero();
	final Vector3D camerarot = .zero();

  while (!WindowShouldClose())
  {
    if (IsMouseButtonDown(.MOUSE_BUTTON_MIDDLE))
		{
			final mouseDelta = GetMouseDelta();
			camerarot.x = mouseDelta.x * 0.05;
			camerarot.y = mouseDelta.y * 0.05;
		}
		else
		{
			camerarot.x = 0;
			camerarot.y = 0;
		}

    double x = (IsKeyDown(.KEY_W) || IsKeyDown(.KEY_UP)).toInt() * 0.1 -
      (IsKeyDown(.KEY_S) || IsKeyDown(.KEY_DOWN)).toInt() * 0.1;

    double y = (IsKeyDown(.KEY_D) || IsKeyDown(.KEY_RIGHT)).toInt() * 0.1 -
      (IsKeyDown(.KEY_A) || IsKeyDown(.KEY_LEFT)).toInt() * 0.1;

		UpdateCameraPro(camera,
      .vec3(x, y, 0.0),
			camerarot,
			GetMouseWheelMove() * -2.0
    );

		if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
      currentModel = (currentModel + 1) % MAX_VOX_FILES;
    }

    SetShaderValue(shader,
      shader.locs[ShaderLocationIndex.SHADER_LOC_VECTOR_VIEW.value],
      camera.position.toArray(),
      .SHADER_UNIFORM_VEC3,
    );

		for (int i = 0; i < lights.length; i++) {
      UpdateLightValues(shader, lights[i]);
    }

		BeginDrawing();

      ClearBackground(.RAYWHITE);

      BeginMode3D(camera);

      DrawModel(models[currentModel], modelpos, 1.0, .WHITE);
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

      DrawRectangle(10, 400, 340, 60, Fade(.SKYBLUE, 0.5));
      DrawRectangleLines(10, 400, 340, 60, Fade(.DARKBLUE, 0.5));
      DrawText(
        "MOUSE LEFT BUTTON to CYCLE VOX MODELS",
        40, 410, 10, .BLUE
      );
      DrawText(
        "MOUSE MIDDLE BUTTON to ZOOM OR ROTATE CAMERA",
        40, 420, 10, .BLUE
      );
      DrawText(
        "UP-DOWN-LEFT-RIGHT KEYS to MOVE CAMERA",
        40, 430, 10, .BLUE
      );
      DrawText(
        "File: ${GetFileName(voxFileNames[currentModel])}",
        10, 10, 20, .GRAY
      );

		EndDrawing();
  }

  models.forEach(UnloadModel);
  
  CloseWindowAndDispose();
}