// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_top_down_lights.c
// Run it: dart run shapes_top_down_lights.dart
import '../../base.dart';

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
  final rl = loadBaseRaylib();

  rl.CoreD.InitWindow(screenWidth, screenHeight, "shapes_top_down_lights");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  lights = .generate(MAX_LIGHTS, (i) => .new());

  final List<RectangleD> boxes = .generate(MAX_BOXES, (i) => switch (i) {
    0 => .rect(150, 80, 40, 40),
    1 => .rect(1200, 700, 40, 40),
    2 => .rect(200, 600, 40, 40),
    3 => .rect(1000, 50, 40, 40),
    4 => .rect(500, 350, 40, 40),
    _ => .rect(
      rl.CoreD.GetRandomValue(0, rl.CoreD.GetScreenWidth()),
      rl.CoreD.GetRandomValue(0, rl.CoreD.GetScreenHeight()),
      rl.CoreD.GetRandomValue(10, 100),
      rl.CoreD.GetRandomValue(10, 100)
    ),
  });

  final img = rl.CoreD.GenImageChecked(64, 64, 32, 32, .DARKBROWN, .DARKGRAY);
  final backgroundTexture = rl.CoreD.LoadTextureFromImage(img);
  rl.CoreD.UnloadImage(img);

  final lightMask = rl.CoreD.LoadRenderTexture(rl.CoreD.GetScreenWidth(), rl.CoreD.GetScreenHeight());

  SetupLight(rl, 0, 600, 400, 300);
  int nextLight = 1;

  bool showLines = false;

  while (!rl.CoreD.WindowShouldClose())
  {
    final mousePos = rl.CoreD.GetMousePosition();
    final w = rl.CoreD.GetScreenWidth(), h = rl.CoreD.GetScreenHeight();

    if (rl.CoreD.IsMouseButtonDown(.MOUSE_BUTTON_LEFT))
      MoveLight(0, mousePos.x, mousePos.y);

    if (rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_RIGHT) && (nextLight < MAX_LIGHTS))
    {
      SetupLight(rl, nextLight, mousePos.x, mousePos.y, 200);
      nextLight++;
    }

    if (rl.CoreD.IsKeyPressed(.KEY_F1)) showLines = !showLines;

    bool dirtyLights = false;
    for (int i = 0; i < MAX_LIGHTS; i++)
    {
      if (UpdateLight(rl, i, boxes)) dirtyLights = true;
    }

    if (dirtyLights)
    {
      rl.CoreD.BeginTextureMode(lightMask);

        rl.CoreD.ClearBackground(.BLACK);

        rl.RlglD.rlSetBlendFactors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN);
        rl.RlglD.rlSetBlendMode(.BLEND_CUSTOM);

        for (int i = 0; i < MAX_LIGHTS; i++)
        {
          if (lights[i].active) rl.CoreD.DrawTextureRec(
            lights[i].mask.texture,
            .rect(0, 0, w, -h),
            .vec2(0, 0),
            .WHITE,
          );
        }

        rl.RlglD.rlDrawRenderBatchActive();

        rl.RlglD.rlSetBlendMode(.BLEND_ALPHA);

      rl.CoreD.EndTextureMode();
    }
      
    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.BLACK);

      rl.CoreD.DrawTextureRec(
        backgroundTexture,
        .rect(0, 0, w, h),
        .vec2(0, 0),
        .WHITE,
      );
      
      rl.CoreD.DrawTextureRec(
        lightMask.texture,
        .rect(0, 0, w, -h),
        .vec2(0, 0),
        rl.CoreD.ColorAlpha(.WHITE, showLines ? 0.75 : 1.0),
      );

      for (int i = 0; i < MAX_LIGHTS; i++)
      {
        if (lights[i].active) rl.CoreD.DrawCircle(
          lights[i].position.x,
          lights[i].position.y,
          10, (i == 0) ? .YELLOW : .WHITE,
        );
      }

      if (showLines)
      {
        for (int s = 0; s < lights[0].shadowCount; s++)
        {
          rl.CoreD.DrawTriangleFan(lights[0].shadows[s].vertices, .DARKPURPLE);
        }

        for (int b = 0; b < boxes.length; b++)
        {
          if (rl.CoreD.CheckCollisionRecs(boxes[b], lights[0].bounds))
            rl.CoreD.DrawRectangleRec(boxes[b], .PURPLE);

          rl.CoreD.DrawRectangleLines(
            boxes[b].x, boxes[b].y,
            boxes[b].width, boxes[b].height,
            .DARKBLUE
          );
        }

        rl.CoreD.DrawText(
          "(F1) Hide Shadow Volumes",
          10, 50, 10, .GREEN
        );
      }
      else
      {
        rl.CoreD.DrawText(
          "(F1) Show Shadow Volumes",
          10, 50, 10, .GREEN
        );
      }

      rl.CoreD.DrawFPS(screenWidth - 80, 10);
      rl.CoreD.DrawText("Drag to move light #1", 10, 10, 10, .DARKGREEN);
      rl.CoreD.DrawText("Right click to add new light", 10, 30, 10, .DARKGREEN);

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadTexture(backgroundTexture);
  rl.CoreD.UnloadRenderTexture(lightMask);
  for (int i = 0; i < MAX_LIGHTS; i++)
  {
    if (lights[i].active) rl.CoreD.UnloadRenderTexture(lights[i].mask);
  }

  rl.CloseWindowAndDispose();
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

void DrawLightMask(Raylib rl, int slot)
{
  rl.CoreD.BeginTextureMode(lights[slot].mask);

    rl.CoreD.ClearBackground(.WHITE);

    rl.RlglD.rlSetBlendFactors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MIN);
    rl.RlglD.rlSetBlendMode(.BLEND_CUSTOM);

    if (lights[slot].valid) rl.CoreD.DrawCircleGradient(
      lights[slot].position.x, lights[slot].position.y,
      lights[slot].outerRadius,
      rl.CoreD.ColorAlpha(.WHITE, 0),
      .WHITE
    );
    
    rl.RlglD.rlDrawRenderBatchActive();

    rl.RlglD.rlSetBlendMode(.BLEND_ALPHA);
    rl.RlglD.rlSetBlendFactors(RLGL_SRC_ALPHA, RLGL_SRC_ALPHA, RLGL_MAX);
    rl.RlglD.rlSetBlendMode(.BLEND_CUSTOM);

    for (int i = 0; i < lights[slot].shadowCount; i++)
    {
      rl.CoreD.DrawTriangleFan(lights[slot].shadows[i].vertices, .WHITE);
    }

    rl.RlglD.rlDrawRenderBatchActive();
    
    rl.RlglD.rlSetBlendMode(.BLEND_ALPHA);

  rl.CoreD.EndTextureMode();
}

void SetupLight(Raylib rl, int slot, double x, double y, double radius)
{
  lights[slot].active = true;
  lights[slot].valid = false;
  lights[slot].mask = rl.CoreD.LoadRenderTexture(rl.CoreD.GetScreenWidth(), rl.CoreD.GetScreenHeight());
  lights[slot].outerRadius = radius;

  lights[slot].bounds.width = radius * 2;
  lights[slot].bounds.height = radius * 2;

  MoveLight(slot, x, y);

  DrawLightMask(rl, slot);
}

bool UpdateLight(Raylib rl, int slot, List<RectangleD> boxes)
{
  if (!lights[slot].active || !lights[slot].dirty) return false;

  lights[slot].dirty = false;
  lights[slot].shadowCount = 0;
  lights[slot].valid = false;

  for (int i = 0; i < boxes.length; i++)
  {
    if (rl.CoreD.CheckCollisionPointRec(lights[slot].position, boxes[i])) return false;

    if (!rl.CoreD.CheckCollisionRecs(lights[slot].bounds, boxes[i])) continue;

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

  DrawLightMask(rl, slot);

  return true;
}