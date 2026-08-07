// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shaders/shaders_rounded_rectangle.c
// Run it: dart run shaders_rounded_rectangle.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

final class RoundedRectangle extends Struct {
  external Vector4C cornerRadius;
  @Float() external double shadowRadius;
  external Vector2C shadowOffset;
  @Float() external double shadowScale;
  @Float() external double borderThickness;
  @Int() external int rectangleLoc;
  @Int() external int radiusLoc;
  @Int() external int colorLoc;
  @Int() external int shadowRadiusLoc;
  @Int() external int shadowOffsetLoc;
  @Int() external int shadowScaleLoc;
  @Int() external int shadowColorLoc;
  @Int() external int borderThicknessLoc;
  @Int() external int borderColorLoc;
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shaders_rounded_rectangle".toC);
  SetTargetFPS(60);

  final shader = LoadShader(
    "../resources/shaders/glsl$GLSL_VERSION/base.vs".toC,
    "../resources/shaders/glsl$GLSL_VERSION/rounded_rectangle.fs".toC
  );

  final roundedRectangle = CreateRoundedRectangle(
    Vector4$.$1.set(5.0, 10.0, 15.0, 20.0),
    20.0,
    Vector2$.$1.set(0.0, -5.0),
    0.95,
    5.0,
    shader
  );

  // Update shader uniforms
  UpdateRoundedRectangle(roundedRectangle, shader);

  final rectangleColor = BLUE;
  final shadowColor = DARKBLUE;
  final borderColor = SKYBLUE;

  while (!WindowShouldClose())
  {
    BeginDrawing();

      ClearBackground(RAYWHITE);

      // Draw rectangle box with rounded corners using shader
      var rec = Rectangle$.$1.set(50, 70, 110, 60);
      DrawRectangleLines((rec.x - 20).toInt(), (rec.y - 20).toInt(), (rec.width + 40).toInt(), (rec.height + 40).toInt(), DARKGRAY);
      DrawText("Rounded rectangle".toC, (rec.x - 20).toInt(), (rec.y - 35).toInt(), 10, DARKGRAY);

      // Flip Y axis to match shader coordinate system
      rec.y = screenHeight - rec.y - rec.height;
      SetShaderValue(
        shader, roundedRectangle.ref.rectangleLoc,
        Float32$.Array([rec.x, rec.y, rec.width, rec.height]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );

      // Only rectangle color
      SetShaderValue(
        shader, roundedRectangle.ref.colorLoc,
        Float32$.Array([rectangleColor.r/255.0, rectangleColor.g/255.0, rectangleColor.b/255.0, rectangleColor.a/255.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );
      SetShaderValue(
        shader, roundedRectangle.ref.shadowColorLoc,
        Float32$.Array([0.0, 0.0, 0.0, 0.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );
      SetShaderValue(
        shader, roundedRectangle.ref.borderColorLoc,
        Float32$.Array([0.0, 0.0, 0.0, 0.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, WHITE);
      EndShaderMode();

      // Draw rectangle shadow using shader
      rec = Rectangle$.$1.set(50, 200, 110, 60);
      DrawRectangleLines((rec.x - 20).toInt(), (rec.y - 20).toInt(), (rec.width + 40).toInt(), (rec.height + 40).toInt(), DARKGRAY);
      DrawText("Rounded rectangle shadow".toC, (rec.x - 20).toInt(), (rec.y - 35).toInt(), 10, DARKGRAY);

      rec.y = screenHeight - rec.y - rec.height;
      SetShaderValue(
        shader, roundedRectangle.ref.rectangleLoc,
        Float32$.Array([rec.x, rec.y, rec.width, rec.height]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );

      // Only shadow color
      SetShaderValue(
        shader, roundedRectangle.ref.colorLoc,
        Float32$.Array([0.0, 0.0, 0.0, 0.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );
      SetShaderValue(
        shader, roundedRectangle.ref.shadowColorLoc,
        Float32$.Array([shadowColor.r/255.0, shadowColor.g/255.0, shadowColor.b/255.0, shadowColor.a/255.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );
      SetShaderValue(
        shader, roundedRectangle.ref.borderColorLoc,
        Float32$.Array([0.0, 0.0, 0.0, 0.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, WHITE);
      EndShaderMode();

      // Draw rectangle's border using shader
      rec = Rectangle$.$1.set(50, 330, 110, 60);
      DrawRectangleLines((rec.x - 20).toInt(), (rec.y - 20).toInt(), (rec.width + 40).toInt(), (rec.height + 40).toInt(), DARKGRAY);
      DrawText("Rounded rectangle border".toC, (rec.x - 20).toInt(), (rec.y - 35).toInt(), 10, DARKGRAY);

      rec.y = screenHeight - rec.y - rec.height;
      SetShaderValue(
        shader, roundedRectangle.ref.rectangleLoc,
        Float32$.Array([rec.x, rec.y, rec.width, rec.height]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );

      // Only border color
      SetShaderValue(
        shader, roundedRectangle.ref.colorLoc,
        Float32$.Array([0.0, 0.0, 0.0, 0.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );
      SetShaderValue(
        shader, roundedRectangle.ref.shadowColorLoc,
        Float32$.Array([0.0, 0.0, 0.0, 0.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );
      SetShaderValue(
        shader, roundedRectangle.ref.borderColorLoc,
        Float32$.Array([borderColor.r/255.0, borderColor.g/255.0, borderColor.b/255.0, borderColor.a/255.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, WHITE);
      EndShaderMode();

      // Draw one more rectangle with all three colors
      rec = Rectangle$.$1.set(240, 80, 500, 300);
      DrawRectangleLines((rec.x - 30).toInt(), (rec.y - 30).toInt(), (rec.width + 60).toInt(), (rec.height + 60).toInt(), DARKGRAY);
      DrawText("Rectangle with all three combined".toC, (rec.x - 30).toInt(), (rec.y - 45).toInt(), 10, DARKGRAY);

      rec.y = screenHeight - rec.y - rec.height;
      SetShaderValue(
        shader, roundedRectangle.ref.rectangleLoc,
        Float32$.Array([rec.x, rec.y, rec.width, rec.height]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );

      // All three colors
      SetShaderValue(
        shader, roundedRectangle.ref.colorLoc,
        Float32$.Array([rectangleColor.r/255.0, rectangleColor.g/255.0, rectangleColor.b/255.0, rectangleColor.a/255.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );
      SetShaderValue(
        shader, roundedRectangle.ref.shadowColorLoc,
        Float32$.Array([shadowColor.r/255.0, shadowColor.g/255.0, shadowColor.b/255.0, shadowColor.a/255.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );
      SetShaderValue(
        shader, roundedRectangle.ref.borderColorLoc,
        Float32$.Array([borderColor.r/255.0, borderColor.g/255.0, borderColor.b/255.0, borderColor.a/255.0]).cast(),
        ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
      );

      BeginShaderMode(shader);
        DrawRectangle(0, 0, screenWidth, screenHeight, WHITE);
      EndShaderMode();

      DrawText("(c) Rounded rectangle SDF by Iñigo Quilez. MIT License.".toC, screenWidth - 300, screenHeight - 20, 10, BLACK);

    EndDrawing();
  }

  UnloadShader(shader);
  
  CloseWindowAndDispose();
}

Pointer<RoundedRectangle> CreateRoundedRectangle(Vector4C cornerRadius, double shadowRadius, Vector2C shadowOffset, double shadowScale, double borderThickness, ShaderC shader)
{
  final rec = calloc<RoundedRectangle>();
  rec.ref.cornerRadius = cornerRadius;
  rec.ref.shadowRadius = shadowRadius;
  rec.ref.shadowOffset = shadowOffset;
  rec.ref.shadowScale = shadowScale;
  rec.ref.borderThickness = borderThickness;

  rec.ref.rectangleLoc = GetShaderLocation(shader, "rectangle".toC);
  rec.ref.radiusLoc = GetShaderLocation(shader, "radius".toC);
  rec.ref.colorLoc = GetShaderLocation(shader, "color".toC);
  rec.ref.shadowRadiusLoc = GetShaderLocation(shader, "shadowRadius".toC);
  rec.ref.shadowOffsetLoc = GetShaderLocation(shader, "shadowOffset".toC);
  rec.ref.shadowScaleLoc = GetShaderLocation(shader, "shadowScale".toC);
  rec.ref.shadowColorLoc = GetShaderLocation(shader, "shadowColor".toC);
  rec.ref.borderThicknessLoc = GetShaderLocation(shader, "borderThickness".toC);
  rec.ref.borderColorLoc = GetShaderLocation(shader, "borderColor".toC);

  UpdateRoundedRectangle(rec, shader);

  return rec;
}

void UpdateRoundedRectangle(Pointer<RoundedRectangle> rec, ShaderC shader)
{
  SetShaderValue(
    shader, rec.ref.radiusLoc,
    Float32$.Array([
      rec.ref.cornerRadius.x,
      rec.ref.cornerRadius.y,
      rec.ref.cornerRadius.z,
      rec.ref.cornerRadius.w
    ]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC4.value
  );
  SetShaderValue(
    shader, rec.ref.shadowRadiusLoc,
    Float32$.Value(rec.ref.shadowRadius).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
  );
  SetShaderValue(
    shader, rec.ref.shadowOffsetLoc,
    Float32$.Array([
      rec.ref.shadowOffset.x,
      rec.ref.shadowOffset.y,
    ]).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
  );
  SetShaderValue(
    shader, rec.ref.shadowScaleLoc,
    Float32$.Value(rec.ref.shadowScale).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
  );
  SetShaderValue(
    shader, rec.ref.borderThicknessLoc,
    Float32$.Value(rec.ref.borderThickness).cast(),
    ShaderUniformDataType.SHADER_UNIFORM_FLOAT.value
  );
}
