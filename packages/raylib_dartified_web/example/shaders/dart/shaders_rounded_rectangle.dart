// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_rounded_rectangle.c
// WARNING: expects resources from the raylib source
import '../../base_dart.dart';

const String GLSL_VERSION = '300es';
const int screenWidth = 800;
const int screenHeight = 450;

class RoundedRectangle {
  Vector4 cornerRadius = .zero();
  double shadowRadius = 0;
  Vector2 shadowOffset = .zero();
  double shadowScale = 0;
  double borderThickness = 0;
  int rectangleLoc = 0;
  int radiusLoc = 0;
  int colorLoc = 0;
  int shadowRadiusLoc = 0;
  int shadowOffsetLoc = 0;
  int shadowScaleLoc = 0;
  int shadowColorLoc = 0;
  int borderThicknessLoc = 0;
  int borderColorLoc = 0;
}

void main() => Raylib((rl) {
  InitWindow(screenWidth, screenHeight, "shaders_rounded_rectangle");
  SetTargetFPS(60);

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/base.vs",
    "../resources/shaders/glsl$GLSL_VERSION/rounded_rectangle.fs"
  );

  final roundedRectangle = CreateRoundedRectangle(
    .vec4(5.0, 10.0, 15.0, 20.0),
    20.0,
    .vec2(0.0, -5.0),
    0.95,
    5.0,
    shader
  );

  // Update shader uniforms
  UpdateRoundedRectangle(roundedRectangle, shader);

  final Color rectangleColor = .BLUE;
  final Color shadowColor = .DARKBLUE;
  final Color borderColor = .SKYBLUE;

  rl.setMainLoop(() {
    BeginDrawing();

      ClearBackground(.RAYWHITE);

      // Draw rectangle box with rounded corners using shader
      Rectangle rec = .rect(50, 70, 110, 60);
      DrawRectangleLines(rec.x - 20, rec.y - 20, rec.width + 40, rec.height + 40, .DARKGRAY);
      DrawText("Rounded rectangle", rec.x - 20, rec.y - 35, 10, .DARKGRAY);

      // Flip Y axis to match shader coordinate system
      rec.y = screenHeight - rec.y - rec.height;
      SetShaderValue(shader, roundedRectangle.rectangleLoc, rec.toArray(), .SHADER_UNIFORM_VEC4);

      // Only rectangle color
      SetShaderValue(shader, roundedRectangle.colorLoc, ColorNormalize(rectangleColor).toArray(), .SHADER_UNIFORM_VEC4);
      SetShaderValue(shader, roundedRectangle.shadowColorLoc, [0.0, 0.0, 0.0, 0.0], .SHADER_UNIFORM_VEC4);
      SetShaderValue(shader, roundedRectangle.borderColorLoc, [0.0, 0.0, 0.0, 0.0], .SHADER_UNIFORM_VEC4);

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, .WHITE);
      EndShaderMode();

      // Draw rectangle shadow using shader
      rec = .rect(50, 200, 110, 60);
      DrawRectangleLines(rec.x - 20, rec.y - 20, rec.width + 40, rec.height + 40, .DARKGRAY);
      DrawText("Rounded rectangle shadow", rec.x - 20, rec.y - 35, 10, .DARKGRAY);

      rec.y = screenHeight - rec.y - rec.height;
      SetShaderValue(shader, roundedRectangle.rectangleLoc, rec.toArray(), .SHADER_UNIFORM_VEC4);

      // Only shadow color
      SetShaderValue(shader, roundedRectangle.colorLoc, [0.0, 0.0, 0.0, 0.0], .SHADER_UNIFORM_VEC4);
      SetShaderValue(shader, roundedRectangle.shadowColorLoc, ColorNormalize(shadowColor).toArray(), .SHADER_UNIFORM_VEC4);
      SetShaderValue(shader, roundedRectangle.borderColorLoc, [0.0, 0.0, 0.0, 0.0], .SHADER_UNIFORM_VEC4);

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, .WHITE);
      EndShaderMode();

      // Draw rectangle's border using shader
      rec = .rect(50, 330, 110, 60);
      DrawRectangleLines(rec.x - 20, rec.y - 20, rec.width + 40, rec.height + 40, .DARKGRAY);
      DrawText("Rounded rectangle border", rec.x - 20, rec.y - 35, 10, .DARKGRAY);

      rec.y = screenHeight - rec.y - rec.height;
      SetShaderValue(shader, roundedRectangle.rectangleLoc, rec.toArray(), .SHADER_UNIFORM_VEC4);

      // Only border color
      SetShaderValue(shader, roundedRectangle.colorLoc, [0.0, 0.0, 0.0, 0.0], .SHADER_UNIFORM_VEC4);
      SetShaderValue(shader, roundedRectangle.shadowColorLoc, [0.0, 0.0, 0.0, 0.0], .SHADER_UNIFORM_VEC4);
      SetShaderValue(shader, roundedRectangle.borderColorLoc, ColorNormalize(borderColor).toArray(), .SHADER_UNIFORM_VEC4);

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, .WHITE);
      EndShaderMode();

      // Draw one more rectangle with all three colors
      rec = .rect(240, 80, 500, 300);
      DrawRectangleLines(rec.x - 30, rec.y - 30, rec.width + 60, rec.height + 60, .DARKGRAY);
      DrawText("Rectangle with all three combined", rec.x - 30, rec.y - 45, 10, .DARKGRAY);

      rec.y = screenHeight - rec.y - rec.height;
      SetShaderValue(shader, roundedRectangle.rectangleLoc, rec.toArray(), .SHADER_UNIFORM_VEC4);

      // All three colors
      SetShaderValue(shader, roundedRectangle.colorLoc, ColorNormalize(rectangleColor).toArray(), .SHADER_UNIFORM_VEC4);
      SetShaderValue(shader, roundedRectangle.shadowColorLoc, ColorNormalize(shadowColor).toArray(), .SHADER_UNIFORM_VEC4);
      SetShaderValue(shader, roundedRectangle.borderColorLoc, ColorNormalize(borderColor).toArray(), .SHADER_UNIFORM_VEC4);

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, .WHITE);
      EndShaderMode();

      DrawText("(c) Rounded rectangle SDF by Iñigo Quilez. MIT License.", screenWidth - 300, screenHeight - 20, 10, .BLACK);

    EndDrawing();
  });
});

RoundedRectangle CreateRoundedRectangle(Vector4 cornerRadius, double shadowRadius, Vector2 shadowOffset, double shadowScale, double borderThickness, Shader shader)
{
  final RoundedRectangle rec = .new();
  rec.cornerRadius = cornerRadius;
  rec.shadowRadius = shadowRadius;
  rec.shadowOffset = shadowOffset;
  rec.shadowScale = shadowScale;
  rec.borderThickness = borderThickness;

  rec.rectangleLoc = GetShaderLocation(shader, "rectangle");
  rec.radiusLoc = GetShaderLocation(shader, "radius");
  rec.colorLoc = GetShaderLocation(shader, "color");
  rec.shadowRadiusLoc = GetShaderLocation(shader, "shadowRadius");
  rec.shadowOffsetLoc = GetShaderLocation(shader, "shadowOffset");
  rec.shadowScaleLoc = GetShaderLocation(shader, "shadowScale");
  rec.shadowColorLoc = GetShaderLocation(shader, "shadowColor");
  rec.borderThicknessLoc = GetShaderLocation(shader, "borderThickness");
  rec.borderColorLoc = GetShaderLocation(shader, "borderColor");

  UpdateRoundedRectangle(rec, shader);

  return rec;
}

void UpdateRoundedRectangle(RoundedRectangle rec, Shader shader)
{
  SetShaderValue(shader, rec.radiusLoc, rec.cornerRadius.toArray(), .SHADER_UNIFORM_VEC4);
  SetShaderValue(shader, rec.shadowRadiusLoc, [rec.shadowRadius], .SHADER_UNIFORM_FLOAT);
  SetShaderValue(shader, rec.shadowOffsetLoc, rec.shadowOffset.toArray(), .SHADER_UNIFORM_VEC2);
  SetShaderValue(shader, rec.shadowScaleLoc, [rec.shadowScale], .SHADER_UNIFORM_FLOAT);
  SetShaderValue(shader, rec.borderThicknessLoc, [rec.borderThickness], .SHADER_UNIFORM_FLOAT);
}
