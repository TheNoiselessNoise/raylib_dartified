// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_top_down_lights.c
// Run it: dart run shapes_top_down_lights.dart
import 'dart:ffi';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int RLGL_SRC_ALPHA = 0x0302;
const int RLGL_MIN = 0x8007;
const int RLGL_MAX = 0x8008;
const int MAX_BOXES = 20;
const int MAX_SHADOWS = MAX_BOXES*3;
const int MAX_LIGHTS = 16;

class ShadowGeometry {
  Pointer<Vector2C> vertices;

  ShadowGeometry({
    required this.vertices,
  });
}

class LightInfo {
  bool active;
  bool dirty;
  bool valid;

  Pointer<Vector2C> position;
  Pointer<RenderTextureC> mask;
  double outerRadius;
  Pointer<RectangleC> bounds;

  List<ShadowGeometry> shadows;
  int shadowCount;

  LightInfo({
    this.active = false,
    this.dirty = false,
    this.valid = false,
    required this.position,
    required this.mask,
    this.outerRadius = 0,
    required this.bounds,
    required this.shadows,
    this.shadowCount = 0,
  });
}

late List<LightInfo> lights;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_top_down_lights".toC);
  SetTargetFPS(60);

  lights = .generate(MAX_LIGHTS, (i) => .new(
    position: Vector2$.At('light_position_$i'),
    mask: RenderTexture$.At('light_mask_$i'),
    bounds: Rectangle$.At('light_bounds_$i'),
    shadows: .generate(MAX_SHADOWS, (j) => .new(
      vertices: Vector2$.At('light_shadows_${i}_vertices_$j', 4)
    ))
  ));

  final boxes = Rectangle$.FillInto(key: 'boxes', MAX_BOXES, (i, r) => switch (i) {
    0 => r.set(150, 80, 40, 40),
    1 => r.set(1200, 700, 40, 40),
    2 => r.set(200, 600, 40, 40),
    3 => r.set(1000, 50, 40, 40),
    4 => r.set(500, 350, 40, 40),
    _ => r.set(
      GetRandomValue(0, GetScreenWidth()),
      GetRandomValue(0, GetScreenHeight()),
      GetRandomValue(10, 100),
      GetRandomValue(10, 100)
    ),
  });

  final img = GenImageChecked(64, 64, 32, 32, DARKBROWN, DARKGRAY);
  final backgroundTexture = LoadTextureFromImage(img);
  UnloadImage(img);

  final lightMask = LoadRenderTexture(GetScreenWidth(), GetScreenHeight());

  SetupLight(0, 600, 400, 300);
  int nextLight = 1;

  bool showLines = false;

  while (!WindowShouldClose())
  {
    final mousePos = GetMousePosition();
    final w = GetScreenWidth(), h = GetScreenHeight();

    if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value))
      MoveLight(0, mousePos.x, mousePos.y);

    if (IsMouseButtonPressed(MouseButton.MOUSE_BUTTON_RIGHT.value) && (nextLight < MAX_LIGHTS))
    {
      SetupLight(nextLight, mousePos.x, mousePos.y, 200);
      nextLight++;
    }

    if (IsKeyPressed(KeyboardKey.KEY_F1.value)) showLines = !showLines;

    bool dirtyLights = false;
    for (int i = 0; i < MAX_LIGHTS; i++)
    {
      if (UpdateLight(i, boxes)) dirtyLights = true;
    }

    if (dirtyLights)
    {
      BeginTextureMode(lightMask);

        ClearBackground(BLACK);

        rlSetBlendFactors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN);
        rlSetBlendMode(BlendMode.BLEND_CUSTOM.value);

        for (int i = 0; i < MAX_LIGHTS; i++)
        {
          if (lights[i].active) DrawTextureRec(
            lights[i].mask.ref.texture,
            Rectangle$.$1.set(0, 0, w, -h),
            Vector2$.$1.set(0, 0),
            WHITE,
          );
        }

        rlDrawRenderBatchActive();

        rlSetBlendMode(BlendMode.BLEND_ALPHA.value);

      EndTextureMode();
    }
      
    BeginDrawing();

      ClearBackground(BLACK);

      DrawTextureRec(
        backgroundTexture,
        Rectangle$.$1.set(0, 0, w, h),
        Vector2$.$1.set(0, 0),
        WHITE,
      );
      
      DrawTextureRec(
        lightMask.texture,
        Rectangle$.$1.set(0, 0, w, -h),
        Vector2$.$1.set(0, 0),
        ColorAlpha(WHITE, showLines ? 0.75 : 1.0),
      );

      for (int i = 0; i < MAX_LIGHTS; i++)
      {
        if (lights[i].active) DrawCircle(
          lights[i].position.ref.x.toInt(),
          lights[i].position.ref.y.toInt(),
          10, (i == 0) ? YELLOW : WHITE,
        );
      }

      if (showLines)
      {
        for (int s = 0; s < lights[0].shadowCount; s++)
        {
          DrawTriangleFan(lights[0].shadows[s].vertices, 4, DARKPURPLE);
        }

        for (int b = 0; b < MAX_BOXES; b++)
        {
          if (CheckCollisionRecs(boxes[b], lights[0].bounds.ref))
            DrawRectangleRec(boxes[b], PURPLE);

          DrawRectangleLines(
            boxes[b].x.toInt(), boxes[b].y.toInt(),
            boxes[b].width.toInt(), boxes[b].height.toInt(),
            DARKBLUE
          );
        }

        DrawText(
          "(F1) Hide Shadow Volumes".toC,
          10, 50, 10, GREEN
        );
      }
      else
      {
        DrawText(
          "(F1) Show Shadow Volumes".toC,
          10, 50, 10, GREEN
        );
      }

      DrawFPS(screenWidth - 80, 10);
      DrawText("Drag to move light #1".toC, 10, 10, 10, DARKGREEN);
      DrawText("Right click to add new light".toC, 10, 30, 10, DARKGREEN);

    EndDrawing();
  }

  UnloadTexture(backgroundTexture);
  UnloadRenderTexture(lightMask);
  for (int i = 0; i < MAX_LIGHTS; i++)
  {
    if (lights[i].active) UnloadRenderTexture(lights[i].mask.ref);
  }

  CloseWindowAndDispose();
}

void MoveLight(int slot, double x, double y)
{
  lights[slot].dirty = true;
  lights[slot].position.ref.x = x; 
  lights[slot].position.ref.y = y;

  lights[slot].bounds.ref.x = x - lights[slot].outerRadius;
  lights[slot].bounds.ref.y = y - lights[slot].outerRadius;
}

void ComputeShadowVolumeForEdge(int slot, Vector2C sp, Vector2C ep)
{
  if (lights[slot].shadowCount >= MAX_SHADOWS) return;

  double extension = lights[slot].outerRadius*2;

  Vector2D spVector = sp.toD().sub(lights[slot].position.toD()).normalize();
  Vector2D spProjection = sp.toD().add(spVector.scale(extension));

  Vector2D epVector = ep.toD().sub(lights[slot].position.toD()).normalize();
  Vector2D epProjection = ep.toD().add(epVector.scale(extension));

  lights[slot].shadows[lights[slot].shadowCount].vertices[0].setC(sp);
  lights[slot].shadows[lights[slot].shadowCount].vertices[1].setC(ep);
  lights[slot].shadows[lights[slot].shadowCount].vertices[2].setD(epProjection);
  lights[slot].shadows[lights[slot].shadowCount].vertices[3].setD(spProjection);

  lights[slot].shadowCount++;
}

void DrawLightMask(int slot)
{
  BeginTextureMode(lights[slot].mask.ref);

    ClearBackground(WHITE);

    rlSetBlendFactors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN);
    rlSetBlendMode(BlendMode.BLEND_CUSTOM.value);

    if (lights[slot].valid) DrawCircleGradient(
      Vector2$.$1.set(lights[slot].position.ref.x, lights[slot].position.ref.y),
      lights[slot].outerRadius,
      ColorAlpha(WHITE, 0),
      WHITE
    );
    
    rlDrawRenderBatchActive();

    rlSetBlendMode(BlendMode.BLEND_ALPHA.value);
    rlSetBlendFactors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MAX);
    rlSetBlendMode(BlendMode.BLEND_CUSTOM.value);

    for (int i = 0; i < lights[slot].shadowCount; i++)
    {
      DrawTriangleFan(lights[slot].shadows[i].vertices, 4, WHITE);
    }

    rlDrawRenderBatchActive();
    
    rlSetBlendMode(BlendMode.BLEND_ALPHA.value);

  EndTextureMode();
}

void SetupLight(int slot, double x, double y, double radius)
{
  lights[slot].active = true;
  lights[slot].valid = false;
  lights[slot].mask.ref = LoadRenderTexture(GetScreenWidth(), GetScreenHeight());
  lights[slot].outerRadius = radius;

  lights[slot].bounds.ref.width = radius * 2;
  lights[slot].bounds.ref.height = radius * 2;

  MoveLight(slot, x, y);

  DrawLightMask(slot);
}

bool UpdateLight(int slot, Pointer<RectangleC> boxes)
{
  if (!lights[slot].active || !lights[slot].dirty) return false;

  lights[slot].dirty = false;
  lights[slot].shadowCount = 0;
  lights[slot].valid = false;

  for (int i = 0; i < MAX_BOXES; i++)
  {
    if (CheckCollisionPointRec(lights[slot].position.ref, boxes[i])) return false;

    if (!CheckCollisionRecs(lights[slot].bounds.ref, boxes[i])) continue;

    final sp = Vector2$.$1.set(boxes[i].x, boxes[i].y);
    final ep = Vector2$.$2.set(boxes[i].x + boxes[i].width, boxes[i].y);

    if (lights[slot].position.ref.y > ep.y) ComputeShadowVolumeForEdge(slot, sp, ep);

    sp.setC(ep);
    ep.y += boxes[i].height;
    if (lights[slot].position.ref.x < ep.x) ComputeShadowVolumeForEdge(slot, sp, ep);

    sp.setC(ep);
    ep.x -= boxes[i].width;
    if (lights[slot].position.ref.y < ep.y) ComputeShadowVolumeForEdge(slot, sp, ep);

    sp.setC(ep);
    ep.y -= boxes[i].height;
    if (lights[slot].position.ref.x > ep.x) ComputeShadowVolumeForEdge(slot, sp, ep);

    lights[slot].shadows[lights[slot].shadowCount].vertices[0].set(boxes[i].x, boxes[i].y);
    lights[slot].shadows[lights[slot].shadowCount].vertices[1].set(boxes[i].x, boxes[i].y + boxes[i].height);
    lights[slot].shadows[lights[slot].shadowCount].vertices[2].set(boxes[i].x + boxes[i].width, boxes[i].y + boxes[i].height);
    lights[slot].shadows[lights[slot].shadowCount].vertices[3].set(boxes[i].x + boxes[i].width, boxes[i].y);
    lights[slot].shadowCount++;
  }

  lights[slot].valid = true;

  DrawLightMask(slot);

  return true;
}