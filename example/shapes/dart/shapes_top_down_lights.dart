// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_top_down_lights.c
// Run it: dart run shapes_top_down_lights.dart
import '../../base_dart.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int RLGL_SRC_ALPHA = 0x0302;
const int RLGL_MIN = 0x8007;
const int RLGL_MAX = 0x8008;
const int MAX_BOXES = 20;
const int MAX_SHADOWS = MAX_BOXES*3;
const int MAX_LIGHTS = 16;

class ShadowGeometry {
  List<Vector2D> vertices;

  ShadowGeometry({
    List<Vector2D>? vertices,
  }) : 
    vertices = vertices ?? .generate(4, (k) => .zero());
}

class LightInfo {
  bool active;
  bool dirty;
  bool valid;

  Vector2D position;
  RenderTextureD mask;
  double outerRadius;
  RectangleD bounds;

  List<ShadowGeometry> shadows;
  int shadowCount;

  LightInfo({
    this.active = false,
    this.dirty = false,
    this.valid = false,
    Vector2D? position,
    RenderTextureD? mask,
    this.outerRadius = 0,
    RectangleD? bounds,
    List<ShadowGeometry>? shadows,
    this.shadowCount = 0,
  }) :
    position = position ?? .zero(),
    mask = mask ?? .zero(),
    bounds = bounds ?? .zero(),
    shadows = shadows ?? .generate(MAX_SHADOWS, (_) => .new());
}

late List<LightInfo> lights;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_top_down_lights");
  SetTargetFPS(60);

  lights = .generate(MAX_LIGHTS, (i) => .new());

  final List<RectangleD> boxes = .generate(MAX_BOXES, (i) => switch (i) {
    0 => .rect(150, 80, 40, 40),
    1 => .rect(1200, 700, 40, 40),
    2 => .rect(200, 600, 40, 40),
    3 => .rect(1000, 50, 40, 40),
    4 => .rect(500, 350, 40, 40),
    _ => .rect(
      GetRandomValue(0, GetScreenWidth()),
      GetRandomValue(0, GetScreenHeight()),
      GetRandomValue(10, 100),
      GetRandomValue(10, 100)
    ),
  });

  final img = GenImageChecked(64, 64, 32, 32, .DARKBROWN, .DARKGRAY);
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

    if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT))
      MoveLight(0, mousePos.x, mousePos.y);

    if (IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT) && (nextLight < MAX_LIGHTS))
    {
      SetupLight(nextLight, mousePos.x, mousePos.y, 200);
      nextLight++;
    }

    if (IsKeyPressed(.KEY_F1)) showLines = !showLines;

    bool dirtyLights = false;
    for (int i = 0; i < MAX_LIGHTS; i++)
    {
      if (UpdateLight(i, boxes)) dirtyLights = true;
    }

    if (dirtyLights)
    {
      BeginTextureMode(lightMask);

        ClearBackground(.BLACK);

        rlSetBlendFactors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN);
        rlSetBlendMode(.BLEND_CUSTOM);

        for (int i = 0; i < MAX_LIGHTS; i++)
        {
          if (lights[i].active) DrawTextureRec(
            lights[i].mask.texture,
            .rect(0, 0, w, -h),
            .vec2(0, 0),
            .WHITE,
          );
        }

        rlDrawRenderBatchActive();

        rlSetBlendMode(.BLEND_ALPHA);

      EndTextureMode();
    }
      
    BeginDrawing();

      ClearBackground(.BLACK);

      DrawTextureRec(
        backgroundTexture,
        .rect(0, 0, w, h),
        .vec2(0, 0),
        .WHITE,
      );
      
      DrawTextureRec(
        lightMask.texture,
        .rect(0, 0, w, -h),
        .vec2(0, 0),
        ColorAlpha(.WHITE, showLines ? 0.75 : 1.0),
      );

      for (int i = 0; i < MAX_LIGHTS; i++)
      {
        if (lights[i].active) DrawCircle(
          lights[i].position.x,
          lights[i].position.y,
          10, (i == 0) ? .YELLOW : .WHITE,
        );
      }

      if (showLines)
      {
        for (int s = 0; s < lights[0].shadowCount; s++)
        {
          DrawTriangleFan(lights[0].shadows[s].vertices, .DARKPURPLE);
        }

        for (int b = 0; b < boxes.length; b++)
        {
          if (CheckCollisionRecs(boxes[b], lights[0].bounds))
            DrawRectangleRec(boxes[b], .PURPLE);

          DrawRectangleLines(
            boxes[b].x, boxes[b].y,
            boxes[b].width, boxes[b].height,
            .DARKBLUE
          );
        }

        DrawText(
          "(F1) Hide Shadow Volumes",
          10, 50, 10, .GREEN
        );
      }
      else
      {
        DrawText(
          "(F1) Show Shadow Volumes",
          10, 50, 10, .GREEN
        );
      }

      DrawFPS(screenWidth - 80, 10);
      DrawText("Drag to move light #1", 10, 10, 10, .DARKGREEN);
      DrawText("Right click to add new light", 10, 30, 10, .DARKGREEN);

    EndDrawing();
  }

  UnloadTexture(backgroundTexture);
  UnloadRenderTexture(lightMask);
  for (int i = 0; i < MAX_LIGHTS; i++)
  {
    if (lights[i].active) UnloadRenderTexture(lights[i].mask);
  }

  CloseWindowAndDispose();
}

void MoveLight(int slot, double x, double y)
{
  lights[slot].dirty = true;
  lights[slot].position.x = x; 
  lights[slot].position.y = y;

  lights[slot].bounds.x = x - lights[slot].outerRadius;
  lights[slot].bounds.y = y - lights[slot].outerRadius;
}

void ComputeShadowVolumeForEdge(int slot, Vector2D sp, Vector2D ep)
{
  if (lights[slot].shadowCount >= MAX_SHADOWS) return;

  double extension = lights[slot].outerRadius*2;

  Vector2D spVector = sp.sub(lights[slot].position).normalize();
  Vector2D spProjection = sp.add(spVector.scale(extension));

  Vector2D epVector = ep.sub(lights[slot].position).normalize();
  Vector2D epProjection = ep.add(epVector.scale(extension));

  lights[slot].shadows[lights[slot].shadowCount].vertices[0] = sp.copy();
  lights[slot].shadows[lights[slot].shadowCount].vertices[1] = ep.copy();
  lights[slot].shadows[lights[slot].shadowCount].vertices[2] = epProjection.copy();
  lights[slot].shadows[lights[slot].shadowCount].vertices[3] = spProjection.copy();

  lights[slot].shadowCount++;
}

void DrawLightMask(int slot)
{
  BeginTextureMode(lights[slot].mask);

    ClearBackground(.WHITE);

    rlSetBlendFactors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN);
    rlSetBlendMode(.BLEND_CUSTOM);

    if (lights[slot].valid) DrawCircleGradient(
      .vec2(lights[slot].position.x, lights[slot].position.y),
      lights[slot].outerRadius,
      ColorAlpha(.WHITE, 0),
      .WHITE
    );
    
    rlDrawRenderBatchActive();

    rlSetBlendMode(.BLEND_ALPHA);
    rlSetBlendFactors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MAX);
    rlSetBlendMode(.BLEND_CUSTOM);

    for (int i = 0; i < lights[slot].shadowCount; i++)
    {
      DrawTriangleFan(lights[slot].shadows[i].vertices, .WHITE);
    }

    rlDrawRenderBatchActive();
    
    rlSetBlendMode(.BLEND_ALPHA);

  EndTextureMode();
}

void SetupLight(int slot, double x, double y, double radius)
{
  lights[slot].active = true;
  lights[slot].valid = false;
  lights[slot].mask = LoadRenderTexture(GetScreenWidth(), GetScreenHeight());
  lights[slot].outerRadius = radius;

  lights[slot].bounds.width = radius * 2;
  lights[slot].bounds.height = radius * 2;

  MoveLight(slot, x, y);

  DrawLightMask(slot);
}

bool UpdateLight(int slot, List<RectangleD> boxes)
{
  if (!lights[slot].active || !lights[slot].dirty) return false;

  lights[slot].dirty = false;
  lights[slot].shadowCount = 0;
  lights[slot].valid = false;

  for (int i = 0; i < boxes.length; i++)
  {
    if (CheckCollisionPointRec(lights[slot].position, boxes[i])) return false;

    if (!CheckCollisionRecs(lights[slot].bounds, boxes[i])) continue;

    Vector2D sp = .vec2(boxes[i].x, boxes[i].y);
    Vector2D ep = .vec2(boxes[i].x + boxes[i].width, boxes[i].y);

    if (lights[slot].position.y > ep.y) ComputeShadowVolumeForEdge(slot, sp, ep);

    sp = ep.copy();
    ep.y += boxes[i].height;
    if (lights[slot].position.x < ep.x) ComputeShadowVolumeForEdge(slot, sp, ep);

    sp = ep.copy();
    ep.x -= boxes[i].width;
    if (lights[slot].position.y < ep.y) ComputeShadowVolumeForEdge(slot, sp, ep);

    sp = ep.copy();
    ep.y -= boxes[i].height;
    if (lights[slot].position.x > ep.x) ComputeShadowVolumeForEdge(slot, sp, ep);

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