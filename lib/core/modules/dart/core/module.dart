part of '../../../raylib_dartified.dart';

class RaylibCoreD extends RaylibCoreModuleBase<
  Raylib,
  
  // pointers
  Pointer<UnsignedChar>,

  // types
  AutomationEventListD,
  AutomationEventD,
  BoneInfoD,
  BoundingBoxD,
  Camera2DD,
  Camera3DD,
  ColorD,
  FilePathListD,
  FontD,
  GlyphInfoD,
  ImageD,
  MaterialD,
  MaterialMapD,
  MatrixD,
  MeshD,
  ModelD,
  ModelAnimationD,
  NPatchInfoD,
  QuaternionD,
  RayD,
  RayCollisionD,
  RectangleD,
  RenderTextureD,
  ShaderD,
  TextureD,
  TransformD,
  Vector2D,
  Vector3D,
  Vector4D,
  VrDeviceInfoD,
  VrStereoConfigD,

  // callbacks
  LoadFileDataCallbackD,
  SaveFileDataCallbackD,
  LoadFileTextCallbackD,
  SaveFileTextCallbackD
  
> {

  RaylibCoreD(super.rl);
  
  @override
  void dispose() {
    super.dispose();
    LoadFileDataCallbackD.disposeRegistry();
    SaveFileDataCallbackD.disposeRegistry();
    LoadFileTextCallbackD.disposeRegistry();
    SaveFileTextCallbackD.disposeRegistry();
  }

  @override
  void InitWindow(
    num width,
    num height,
    String title,
  ) => run(
    () => RaylibDebugLabels.InitWindow(width, height, title),
    () => rl.Core.InitWindow(
      width.toInt(),
      height.toInt(),
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  @override
  void CloseWindow() => run(
    () => RaylibDebugLabels.CloseWindow(),
    () => rl.Core.CloseWindow(),
  );

  @override
  bool WindowShouldClose() => run(
    () => RaylibDebugLabels.WindowShouldClose(),
    () => rl.Core.WindowShouldClose(),
  );

  @override
  bool IsWindowReady() => run(
    () => RaylibDebugLabels.IsWindowReady(),
    () => rl.Core.IsWindowReady(),
  );

  @override
  bool IsWindowFullscreen() => run(
    () => RaylibDebugLabels.IsWindowFullscreen(),
    () => rl.Core.IsWindowFullscreen(),
  );

  @override
  bool IsWindowHidden() => run(
    () => RaylibDebugLabels.IsWindowHidden(),
    () => rl.Core.IsWindowHidden(),
  );
    
  @override
  bool IsWindowMinimized() => run(
    () => RaylibDebugLabels.IsWindowMinimized(),
    () => rl.Core.IsWindowMinimized(),
  );
    
  @override
  bool IsWindowMaximized() => run(
    () => RaylibDebugLabels.IsWindowMaximized(),
    () => rl.Core.IsWindowMaximized(),
  );
    
  @override
  bool IsWindowFocused() => run(
    () => RaylibDebugLabels.IsWindowFocused(),
    () => rl.Core.IsWindowFocused(),
  );
    
  @override
  bool IsWindowResized() => run(
    () => RaylibDebugLabels.IsWindowResized(),
    () => rl.Core.IsWindowResized(),
  );
    
  @override
  bool IsWindowState(
    ConfigFlags flag,
  ) => run(
    () => RaylibDebugLabels.IsWindowState(flag),
    () => rl.Core.IsWindowState(flag.value),
  );
    
  @override
  void SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => RaylibDebugLabels.SetWindowState(flags),
    () => rl.Core.SetWindowState(rl.Utils.EnumsAsFlagsOr(flags)),
  );
    
  @override
  void ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => RaylibDebugLabels.ClearWindowState(flags),
    () => rl.Core.ClearWindowState(rl.Utils.EnumsAsFlagsOr(flags)),
  );
    
  @override
  void ToggleFullscreen() => run(
    () => RaylibDebugLabels.ToggleFullscreen(),
    () => rl.Core.ToggleFullscreen(),
  );
    
  @override
  void ToggleBorderlessWindowed() => run(
    () => RaylibDebugLabels.ToggleBorderlessWindowed(),
    () => rl.Core.ToggleBorderlessWindowed(),
  );
    
  @override
  void MaximizeWindow() => run(
    () => RaylibDebugLabels.MaximizeWindow(),
    () => rl.Core.MaximizeWindow(),
  );
    
  @override
  void MinimizeWindow() => run(
    () => RaylibDebugLabels.MinimizeWindow(),
    () => rl.Core.MinimizeWindow(),
  );
    
  @override
  void RestoreWindow() => run(
    () => RaylibDebugLabels.RestoreWindow(),
    () => rl.Core.RestoreWindow(),
  );
    
  @override
  void SetWindowIcon(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.SetWindowIcon(image),
    () => rl.Core.SetWindowIcon(
      rl.Temp.Image$.Ref1(image).ref,
    ),
  );
    
  @override
  void SetWindowIcons(
    List<ImageD> images,
  ) => run(
    () => RaylibDebugLabels.SetWindowIcons(images),
    () => rl.Core.SetWindowIcons(
      rl.Temp.Image$.Array(images),
      images.length,
    ),
  );
    
  @override
  void SetWindowTitle(
    String title,
  ) => run(
    () => RaylibDebugLabels.SetWindowTitle(title),
    () => rl.Core.SetWindowTitle(
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  @override
  void SetWindowPosition(
    num x,
    num y,
  ) => run(
    () => RaylibDebugLabels.SetWindowPosition(x, y),
    () => rl.Core.SetWindowPosition(
      x.toInt(),
      y.toInt(),
    ),
  );
    
  @override
  void SetWindowMonitor(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.SetWindowMonitor(monitor),
    () => rl.Core.SetWindowMonitor(monitor.toInt()),
  );
    
  @override
  void SetWindowMinSize(
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.SetWindowMinSize(width, height),
    () => rl.Core.SetWindowMinSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  void SetWindowMaxSize(
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.SetWindowMaxSize(width, height),
    () => rl.Core.SetWindowMaxSize(
      width.toInt(),
      height.toInt(),
    ),
  );
    
  @override
  void SetWindowSize(
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.SetWindowSize(width, height),
    () => rl.Core.SetWindowSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  void SetWindowOpacity(
    num opacity,
  ) => run(
    () => RaylibDebugLabels.SetWindowOpacity(opacity),
    () => rl.Core.SetWindowOpacity(opacity.toDouble()),
  );
    
  @override
  void SetWindowFocused() => run(
    () => RaylibDebugLabels.SetWindowFocused(),
    () => rl.Core.SetWindowFocused(),
  );

  @override
  int GetScreenWidth() => run(
    () => RaylibDebugLabels.GetScreenWidth(),
    () => rl.Core.GetScreenWidth(),
  );
    
  @override
  int GetScreenHeight() => run(
    () => RaylibDebugLabels.GetScreenHeight(),
    () => rl.Core.GetScreenHeight(),
  );
    
  @override
  int GetRenderWidth() => run(
    () => RaylibDebugLabels.GetRenderWidth(),
    () => rl.Core.GetRenderWidth(),
  );
    
  @override
  int GetRenderHeight() => run(
    () => RaylibDebugLabels.GetRenderHeight(),
    () => rl.Core.GetRenderHeight(),
  );
    
  @override
  int GetMonitorCount() => run(
    () => RaylibDebugLabels.GetMonitorCount(),
    () => rl.Core.GetMonitorCount(),
  );
    
  @override
  int GetCurrentMonitor() => run(
    () => RaylibDebugLabels.GetCurrentMonitor(),
    () => rl.Core.GetCurrentMonitor(),
  );
    
  @override
  Vector2D GetMonitorPosition(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorPosition(monitor),
    () => rl.Core.GetMonitorPosition(monitor.toInt()).toD(),
  );
    
  @override
  int GetMonitorWidth(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorWidth(monitor),
    () => rl.Core.GetMonitorWidth(monitor.toInt()),
  );
    
  @override
  int GetMonitorHeight(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorHeight(monitor),
    () => rl.Core.GetMonitorHeight(monitor.toInt()),
  );
    
  @override
  int GetMonitorPhysicalWidth(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorPhysicalWidth(monitor),
    () => rl.Core.GetMonitorPhysicalWidth(monitor.toInt()),
  );
    
  @override
  int GetMonitorPhysicalHeight(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorPhysicalHeight(monitor),
    () => rl.Core.GetMonitorPhysicalHeight(monitor.toInt()),
  );
    
  @override
  int GetMonitorRefreshRate(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorRefreshRate(monitor),
    () => rl.Core.GetMonitorRefreshRate(monitor.toInt()),
  );
    
  @override
  Vector2D GetWindowPosition() => run(
    () => RaylibDebugLabels.GetWindowPosition(),
    () => rl.Core.GetWindowPosition().toD(),
  );
    
  @override
  Vector2D GetWindowScaleDPI() => run(
    () => RaylibDebugLabels.GetWindowScaleDPI(),
    () => rl.Core.GetWindowScaleDPI().toD(),
  );
    
  @override
  String GetMonitorName(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorName(monitor),
    () => rl.Core.GetMonitorName(monitor.toInt()).toD,
  );
    
  @override
  void SetClipboardText(
    String text,
  ) => run(
    () => RaylibDebugLabels.SetClipboardText(text),
    () => rl.Core.SetClipboardText(
      rl.Temp.String$.ValueOrNull(text),
    ),
  );
    
  @override
  String GetClipboardText() => run(
    () => RaylibDebugLabels.GetClipboardText(),
    () => rl.Core.GetClipboardText().toD,
  );
    
  @override
  ImageD GetClipboardImage() => run(
    () => RaylibDebugLabels.GetClipboardImage(),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GetClipboardImage(),
      (_) => rl.Core.GetClipboardImage(),
    ),
  );
    
  @override
  void EnableEventWaiting() => run(
    () => RaylibDebugLabels.EnableEventWaiting(),
    () => rl.Core.EnableEventWaiting(),
  );
    
  @override
  void DisableEventWaiting() => run(
    () => RaylibDebugLabels.DisableEventWaiting(),
    () => rl.Core.DisableEventWaiting(),
  );
    
  @override
  void ShowCursor() => run(
    () => RaylibDebugLabels.ShowCursor(),
    () => rl.Core.ShowCursor(),
  );
    
  @override
  void HideCursor() => run(
    () => RaylibDebugLabels.HideCursor(),
    () => rl.Core.HideCursor(),
  );
    
  @override
  bool IsCursorHidden() => run(
    () => RaylibDebugLabels.IsCursorHidden(),
    () => rl.Core.IsCursorHidden(),
  );
    
  @override
  void EnableCursor() => run(
    () => RaylibDebugLabels.EnableCursor(),
    () => rl.Core.EnableCursor(),
  );
    
  @override
  void DisableCursor() => run(
    () => RaylibDebugLabels.DisableCursor(),
    () => rl.Core.DisableCursor(),
  );
    
  @override
  bool IsCursorOnScreen() => run(
    () => RaylibDebugLabels.IsCursorOnScreen(),
    () => rl.Core.IsCursorOnScreen(),
  );
    
  @override
  void ClearBackground(
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ClearBackground(color),
    () => rl.Core.ClearBackground(
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void BeginDrawing() => run(
    () => RaylibDebugLabels.BeginDrawing(),
    () => rl.Core.BeginDrawing(),
  );
    
  @override
  void EndDrawing() => run(
    () => RaylibDebugLabels.EndDrawing(),
    () => rl.Core.EndDrawing(),
  );
    
  @override
  void BeginMode2D(
    Camera2DD camera,
  ) => run(
    () => RaylibDebugLabels.BeginMode2D(camera),
    () => rl.Core.BeginMode2D(
      rl.Temp.Camera2D$.Ref1(camera).ref,
    ),
  );
    
  @override
  void EndMode2D() => run(
    () => RaylibDebugLabels.EndMode2D(),
    () => rl.Core.EndMode2D(),
  );
    
  @override
  void BeginMode3D(
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.BeginMode3D(camera),
    () => rl.Core.BeginMode3D(
      rl.Temp.Camera3D$.Ref1(camera).ref,
    ),
  );
    
  @override
  void EndMode3D() => run(
    () => RaylibDebugLabels.EndMode3D(),
    () => rl.Core.EndMode3D(),
  );
    
  @override
  void BeginTextureMode(
    RenderTextureD target,
  ) => run(
    () => RaylibDebugLabels.BeginTextureMode(target),
    () => rl.Core.BeginTextureMode(
      rl.Temp.RenderTexture$.Ref1(target).ref,
    ),
  );
    
  @override
  void EndTextureMode() => run(
    () => RaylibDebugLabels.EndTextureMode(),
    () => rl.Core.EndTextureMode(),
  );
    
  @override
  void BeginShaderMode(
    ShaderD shader,
  ) => run(
    () => RaylibDebugLabels.BeginShaderMode(shader),
    () => rl.Core.BeginShaderMode(
      rl.Temp.Shader$.Ref1(shader).ref,
    ),
  );
    
  @override
  void EndShaderMode() => run(
    () => RaylibDebugLabels.EndShaderMode(),
    () => rl.Core.EndShaderMode(),
  );
    
  @override
  void BeginBlendMode(
    BlendMode mode,
  ) => run(
    () => RaylibDebugLabels.BeginBlendMode(mode),
    () => rl.Core.BeginBlendMode(mode.value),
  );
    
  @override
  void EndBlendMode() => run(
    () => RaylibDebugLabels.EndBlendMode(),
    () => rl.Core.EndBlendMode(),
  );
    
  @override
  void BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.BeginScissorMode(x, y, width, height),
    () => rl.Core.BeginScissorMode(
      x.toInt(),
      y.toInt(),
      width.toInt(),
      height.toInt(),
    ),
  );
    
  @override
  void EndScissorMode() => run(
    () => RaylibDebugLabels.EndScissorMode(),
    () => rl.Core.EndScissorMode(),
  );
    
  // TODO: untested, no VR hardware
  @override
  void BeginVrStereoMode(
    VrStereoConfigD config,
  ) => run(
    () => RaylibDebugLabels.BeginVrStereoMode(config),
    () => rl.Core.BeginVrStereoMode(
      rl.Temp.VrStereoConfig$.Ref1(config).ref,
    ),
  );
    
  // TODO: untested, no VR hardware
  @override
  void EndVrStereoMode() => run(
    () => RaylibDebugLabels.EndVrStereoMode(),
    () => rl.Core.EndVrStereoMode(),
  );
    
  // TODO: untested, no VR hardware
  @override
  VrStereoConfigD LoadVrStereoConfig(
    VrDeviceInfoD device,
  ) => run(
    () => RaylibDebugLabels.LoadVrStereoConfig(device),
    () => rl.Temp.VrStereoConfig$.RefCapture(
      RaylibCaptureIds.LoadVrStereoConfig(device),
      (_) => rl.Core.LoadVrStereoConfig(
        rl.Temp.VrDeviceInfo$.Ref1(device).ref,
      ),
    ),
  );
    
  // TODO: untested, no VR hardware
  @override
  void UnloadVrStereoConfig(
    VrStereoConfigD config,
  ) => run(
    () => RaylibDebugLabels.UnloadVrStereoConfig(config),
    () => rl.Core.UnloadVrStereoConfig(
      config.getOriginalPointerAndDispose().ref,
    ),
  );
    
  @override
  ShaderD LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => run(
    () => RaylibDebugLabels.LoadShader(vsFileName, fsFileName),
    () => rl.Temp.Shader$.RefCapture(
      RaylibCaptureIds.LoadShader(vsFileName, fsFileName),
      (_) => rl.Core.LoadShader(
        rl.Temp.String$.ValueOrNull(vsFileName),
        rl.Temp.String$.ValueOrNull(fsFileName),
      ),
    ),
  );
    
  @override
  ShaderD LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => run(
    () => RaylibDebugLabels.LoadShaderFromMemory(vsCode, fsCode),
    () => rl.Temp.Shader$.RefCapture(
      RaylibCaptureIds.LoadShaderFromMemory(vsCode, fsCode),
      (_) => rl.Core.LoadShaderFromMemory(
        rl.Temp.String$.ValueOrNull(vsCode),
        rl.Temp.String$.ValueOrNull(fsCode),
      ),
    ),
  );
    
  @override
  bool IsShaderValid(
    ShaderD shader,
  ) => run(
    () => RaylibDebugLabels.IsShaderValid(shader),
    () => rl.Core.IsShaderValid(
      rl.Temp.Shader$.Ref1(shader).ref,
    ),
  );
    
  @override
  int GetShaderLocation(
    ShaderD shader,
    String uniformName,
  ) => run(
    () => RaylibDebugLabels.GetShaderLocation(shader, uniformName),
    () => rl.Core.GetShaderLocation(
      rl.Temp.Shader$.Ref1(shader).ref,
      rl.Temp.String$.ValueOrNull(uniformName),
    ),
  );
    
  @override
  int GetShaderLocationAttrib(
    ShaderD shader,
    String attribName,
  ) => run(
    () => RaylibDebugLabels.GetShaderLocationAttrib(shader, attribName),
    () => rl.Core.GetShaderLocationAttrib(
      rl.Temp.Shader$.Ref1(shader).ref,
      rl.Temp.String$.ValueOrNull(attribName),
    ),
  );

  @override
  void SetShaderValue(
    ShaderD shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
  ) => SetShaderValueV(
    shader,
    locIndex,
    value,
    uniformType,
    1,
  );

  @override
  void SetShaderValueV(
    ShaderD shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  ) => run(
    () => RaylibDebugLabels.SetShaderValueV(shader, locIndex, value, uniformType, count),
    () {
      final ptr = switch (uniformType) {
        .SHADER_UNIFORM_FLOAT ||
        .SHADER_UNIFORM_VEC2  ||
        .SHADER_UNIFORM_VEC3  ||
        .SHADER_UNIFORM_VEC4  => rl.Temp.Float32$.Array(value),
        
        .SHADER_UNIFORM_INT   ||
        .SHADER_UNIFORM_IVEC2 ||
        .SHADER_UNIFORM_IVEC3 ||
        .SHADER_UNIFORM_IVEC4 => rl.Temp.Int$.Array(value),
        
        .SHADER_UNIFORM_SAMPLER2D => rl.Temp.Int$.Array(value),
      };

      rl.Core.SetShaderValueV(
        rl.Temp.Shader$.Ref1(shader).ref,
        locIndex.toInt(),
        ptr.cast(),
        uniformType.value,
        count.toInt(),
      );
    },
  );
    
  @override
  void SetShaderValueMatrix(
    ShaderD shader,
    num locIndex,
    MatrixD mat,
  ) => run(
    () => RaylibDebugLabels.SetShaderValueMatrix(shader, locIndex, mat),
    () => rl.Core.SetShaderValueMatrix(
      rl.Temp.Shader$.Ref1(shader).ref,
      locIndex.toInt(),
      rl.Temp.Matrix$.Ref1(mat).ref,
    ),
  );
    
  @override
  void SetShaderValueTexture(
    ShaderD shader,
    num locIndex,
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.SetShaderValueTexture(shader, locIndex, texture),
    () => rl.Core.SetShaderValueTexture(
      rl.Temp.Shader$.Ref1(shader).ref,
      locIndex.toInt(),
      rl.Temp.Texture$.Ref1(texture).ref,
    ),
  );
    
  @override
  void UnloadShader(
    ShaderD shader,
  ) => run(
    () => RaylibDebugLabels.UnloadShader(shader),
    () => rl.Core.UnloadShader(
      shader.getOriginalPointerAndDispose().ref,
    ),
  );
    
  @override
  RayD GetScreenToWorldRay(
    Vector2D position,
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetScreenToWorldRay(position, camera),
    () => rl.Core.GetScreenToWorldRay(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Camera3D$.Ref1(camera).ref,
    ).toD(),
  );
    
  @override
  RayD GetScreenToWorldRayEx(
    Vector2D position,
    Camera3DD camera,
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.GetScreenToWorldRayEx(position, camera, width, height),
    () => rl.Core.GetScreenToWorldRayEx(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Camera3D$.Ref1(camera).ref,
      width.toInt(),
      height.toInt(),
    ).toD(),
  );

  @override
  Vector2D GetWorldToScreen(
    Vector3D position,
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetWorldToScreen(position, camera),
    () => rl.Core.GetWorldToScreen(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Camera3D$.Ref1(camera).ref,
    ).toD(),
  );

  @override
  Vector2D GetWorldToScreenEx(
    Vector3D position,
    Camera3DD camera,
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.GetWorldToScreenEx(position, camera, width, height),
    () => rl.Core.GetWorldToScreenEx(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Camera3D$.Ref1(camera).ref,
      width.toInt(),
      height.toInt(),
    ).toD(),
  );

  @override
  Vector2D GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => RaylibDebugLabels.GetWorldToScreen2D(position, camera),
    () => rl.Core.GetWorldToScreen2D(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Camera2D$.Ref1(camera).ref,
    ).toD(),
  );

  @override
  Vector2D GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => RaylibDebugLabels.GetScreenToWorld2D(position, camera),
    () => rl.Core.GetScreenToWorld2D(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Camera2D$.Ref1(camera).ref,
    ).toD(),
  );

  @override
  MatrixD GetCameraMatrix(
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetCameraMatrix(camera),
    () => rl.Core.GetCameraMatrix(
      rl.Temp.Camera3D$.Ref1(camera).ref,
    ).toD(),
  );

  @override
  MatrixD GetCameraMatrix2D(
    Camera2DD camera,
  ) => run(
    () => RaylibDebugLabels.GetCameraMatrix2D(camera),
    () => rl.Core.GetCameraMatrix2D(
      rl.Temp.Camera2D$.Ref1(camera).ref,
    ).toD(),
  );
    
  @override
  void SetTargetFPS(
    num fps,
  ) => run(
    () => RaylibDebugLabels.SetTargetFPS(fps),
    () => rl.Core.SetTargetFPS(fps.toInt()),
  );

  @override
  double GetFrameTime() => run(
    () => RaylibDebugLabels.GetFrameTime(),
    () => rl.Core.GetFrameTime(),
  );

  @override
  double GetTime() => run(
    () => RaylibDebugLabels.GetTime(),
    () => rl.Core.GetTime(),
  );

  @override
  int GetFPS() => run(
    () => RaylibDebugLabels.GetFPS(),
    () => rl.Core.GetFPS(),
  );

  @override
  void SwapScreenBuffer() => run(
    () => RaylibDebugLabels.SwapScreenBuffer(),
    () => rl.Core.SwapScreenBuffer(),
  );

  @override
  void PollInputEvents() => run(
    () => RaylibDebugLabels.PollInputEvents(),
    () => rl.Core.PollInputEvents(),
  );

  @override
  void WaitTime(
    num seconds,
  ) => run(
    () => RaylibDebugLabels.WaitTime(seconds),
    () => rl.Core.WaitTime(seconds.toDouble()),
  );

  @override
  void SetRandomSeed(
    num seed,
  ) => run(
    () => RaylibDebugLabels.SetRandomSeed(seed),
    () => rl.Core.SetRandomSeed(seed.toInt()),
  );

  @override
  int GetRandomValue(
    num min,
    num max,
  ) => run(
    () => RaylibDebugLabels.GetRandomValue(min, max),
    () => rl.Core.GetRandomValue(
      min.toInt(),
      max.toInt(),
    ),
  );
  
  @override
  void TakeScreenshot(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.TakeScreenshot(fileName),
    () => rl.Core.TakeScreenshot(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  void SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => RaylibDebugLabels.SetConfigFlags(flags),
    () => rl.Core.SetConfigFlags(rl.Utils.EnumsAsFlagsOr(flags)),
  );

  @override
  void OpenURL(
    String url,
  ) => run(
    () => RaylibDebugLabels.OpenURL(url),
    () => rl.Core.OpenURL(
      rl.Temp.String$.ValueOrNull(url),
    ),
  );

  @override
  void TraceLog(
    TraceLogLevel logLevel,
    String text,
  ) => run(
    () => RaylibDebugLabels.TraceLog(logLevel, text),
    () => rl.Core.TraceLog(
      logLevel.value,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => run(
    () => RaylibDebugLabels.SetTraceLogLevel(logLevel),
    () => rl.Core.SetTraceLogLevel(logLevel.value),
  );
    
  @override
  void SetLoadFileDataCallback(
    LoadFileDataCallbackD? callback
  ) => run(
    () => RaylibDebugLabels.SetLoadFileDataCallback(callback),
    () => rl.Core.SetLoadFileDataCallback(callback?.attach() ?? nullptr),
  );
    
  @override
  void SetSaveFileDataCallback(
    SaveFileDataCallbackD? callback
  ) => run(
    () => RaylibDebugLabels.SetSaveFileDataCallback(callback),
    () => rl.Core.SetSaveFileDataCallback(callback?.attach() ?? nullptr),
  );
    
  @override
  void SetLoadFileTextCallback(
    LoadFileTextCallbackD? callback
  ) => run(
    () => RaylibDebugLabels.SetLoadFileTextCallback(callback),
    () => rl.Core.SetLoadFileTextCallback(callback?.attach() ?? nullptr),
  );
    
  @override
  void SetSaveFileTextCallback(
    SaveFileTextCallbackD? callback
  ) => run(
    () => RaylibDebugLabels.SetSaveFileTextCallback(callback),
    () => rl.Core.SetSaveFileTextCallback(callback?.attach() ?? nullptr),
  );
    
  @override
  Uint8List LoadFileData(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadFileData(fileName),
    () {
      final fileSize = rl.Temp.Int$.Ref1();
      final data = rl.Core.LoadFileData(
        rl.Temp.String$.ValueOrNull(fileName),
        fileSize,
      );
      final listData = Uint8List.fromList(rl.Temp.UnsignedChar$.asView(data, fileSize.value));
      rl.Core.UnloadFileData(data);
      return listData;
    },
  );

  @override
  bool SaveFileData(
    String fileName,
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.SaveFileData(fileName, data),
    () => rl.Core.SaveFileData(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.Uint8$.Array(data).cast(),
      data.length,
    ),
  );

  @override
  bool ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportDataAsCode(data, fileName),
    () => rl.Core.ExportDataAsCode(
      rl.Temp.Uint8$.Array(data).cast(),
      data.length,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  String LoadFileText(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadFileText(fileName),
    () {
      final text = rl.Core.LoadFileText(
        rl.Temp.String$.ValueOrNull(fileName),
      );
      final fileText = text.toD;
      rl.Core.UnloadFileText(text);
      return fileText;
    },
  );

  @override
  bool SaveFileText(
    String fileName,
    String text,
  ) => run(
    () => RaylibDebugLabels.SaveFileText(fileName, text),
    () => rl.Core.SaveFileText(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(text),
    ),
  );
    
  @override
  bool FileExists(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.FileExists(fileName),
    () => rl.Core.FileExists(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  bool DirectoryExists(
    String dirPath,
  ) => run(
    () => RaylibDebugLabels.DirectoryExists(dirPath),
    () => rl.Core.DirectoryExists(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );

  @override
  bool IsFileExtension(
    String fileName,
    String ext,
  ) => run(
    () => RaylibDebugLabels.IsFileExtension(fileName, ext),
    () => rl.Core.IsFileExtension(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(ext),
    ),
  );

  @override
  int GetFileLength(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.GetFileLength(fileName),
    () => rl.Core.GetFileLength(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  String GetFileExtension(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.GetFileExtension(fileName),
    () => rl.Core.GetFileExtension(
      rl.Temp.String$.ValueOrNull(fileName),
    ).toD,
  );

  @override
  String GetFileName(
    String filePath,
  ) => run(
    () => RaylibDebugLabels.GetFileName(filePath),
    () => rl.Core.GetFileName(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toD,
  );

  @override
  String GetFileNameWithoutExt(
    String filePath,
  ) => run(
    () => RaylibDebugLabels.GetFileNameWithoutExt(filePath),
    () => rl.Core.GetFileNameWithoutExt(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toD,
  );

  @override
  String GetDirectoryPath(
    String filePath,
  ) => run(
    () => RaylibDebugLabels.GetDirectoryPath(filePath),
    () => rl.Core.GetDirectoryPath(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toD,
  );

  @override
  String GetPrevDirectoryPath(
    String dirPath,
  ) => run(
    () => RaylibDebugLabels.GetPrevDirectoryPath(dirPath),
    () => rl.Core.GetPrevDirectoryPath(
      rl.Temp.String$.ValueOrNull(dirPath),
    ).toD,
  );

  @override
  String GetWorkingDirectory() => run(
    () => RaylibDebugLabels.GetWorkingDirectory(),
    () => rl.Core.GetWorkingDirectory().toD,
  );

  @override
  String GetApplicationDirectory() => run(
    () => RaylibDebugLabels.GetApplicationDirectory(),
    () => rl.Core.GetApplicationDirectory().toD,
  );

  @override
  int MakeDirectory(
    String dirPath,
  ) => run(
    () => RaylibDebugLabels.MakeDirectory(dirPath),
    () => rl.Core.MakeDirectory(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );

  @override
  bool ChangeDirectory(
    String dir,
  ) => run(
    () => RaylibDebugLabels.ChangeDirectory(dir),
    () => rl.Core.ChangeDirectory(
      rl.Temp.String$.ValueOrNull(dir),
    ),
  );

  @override
  bool IsPathFile(
    String path,
  ) => run(
    () => RaylibDebugLabels.IsPathFile(path),
    () => rl.Core.IsPathFile(
      rl.Temp.String$.ValueOrNull(path),
    ),
  );

  @override
  bool IsFileNameValid(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.IsFileNameValid(fileName),
    () => rl.Core.IsFileNameValid(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  FilePathListD LoadDirectoryFiles(
    String dirPath,
  ) => run(
    () => RaylibDebugLabels.LoadDirectoryFiles(dirPath),
    () => rl.Temp.FilePathList$.RefCapture(
      RaylibCaptureIds.LoadDirectoryFiles(dirPath),
      (_) => rl.Core.LoadDirectoryFiles(
        rl.Temp.String$.ValueOrNull(dirPath),
      ),
    ),
  );
    
  @override
  FilePathListD LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => run(
    () => RaylibDebugLabels.LoadDirectoryFilesEx(basePath, filter, scanSubdirs),
    () => rl.Temp.FilePathList$.RefCapture(
      RaylibCaptureIds.LoadDirectoryFilesEx(basePath, filter, scanSubdirs),
      (_) => rl.Core.LoadDirectoryFilesEx(
        rl.Temp.String$.ValueOrNull(basePath),
        rl.Temp.String$.ValueOrNull(filter),
        scanSubdirs,
      ),
    ),
  );

  @override
  void UnloadDirectoryFiles(
    FilePathListD files,
  ) => run(
    () => RaylibDebugLabels.UnloadDirectoryFiles(files),
    () => rl.Core.UnloadDirectoryFiles(
      files.getOriginalPointerAndDispose().ref,
    ),
  );
    
  @override
  bool IsFileDropped() => run(
    () => RaylibDebugLabels.IsFileDropped(),
    () => rl.Core.IsFileDropped(),
  );
    
  @override
  FilePathListD LoadDroppedFiles() => run(
    () => RaylibDebugLabels.LoadDroppedFiles(),
    () => rl.Temp.FilePathList$.RefCapture(
      RaylibCaptureIds.LoadDroppedFiles(),
      (_) => rl.Core.LoadDroppedFiles(),
    ),
  );

  @override
  void UnloadDroppedFiles(
    FilePathListD files,
  ) => run(
    () => RaylibDebugLabels.UnloadDroppedFiles(files),
    () => rl.Core.UnloadDroppedFiles(
      files.getOriginalPointerAndDispose().ref,
    ),
  );

  @override
  int GetFileModTime(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.GetFileModTime(fileName),
    () => rl.Core.GetFileModTime(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  Uint8List CompressData(
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.CompressData(data),
    () {
      final compDataSize = rl.Temp.Int$.Ref1();
      final compData = rl.Core.CompressData(
        rl.Temp.Uint8$.Array(data).cast(),
        data.length,
        compDataSize,
      );
      final newData = rl.Temp.UnsignedChar$.asTypedList(compData, compDataSize.value);
      calloc.free(compData);
      return newData;
    },
  );

  @override
  Uint8List DecompressData(
    Uint8List compData,
  ) => run(
    () => RaylibDebugLabels.DecompressData(compData),
    () {
      final dataSize = rl.Temp.Int$.Ref1();
      final data = rl.Core.DecompressData(
        rl.Temp.Uint8$.Array(compData).cast(),
        compData.length,
        dataSize,
      );
      final newData = rl.Temp.UnsignedChar$.asTypedList(data, dataSize.value);
      calloc.free(data);
      return newData;
    },
  );

  @override
  Uint8List EncodeDataBase64(
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.EncodeDataBase64(data),
    () {
      final outputSize = rl.Temp.Int$.Ref1();
      final outputData = rl.Core.EncodeDataBase64(
        rl.Temp.Uint8$.Array(data).cast(),
        data.length,
        outputSize,
      );
      final newData = rl.Temp.Char$.asTypedList(outputData, outputSize.value);
      calloc.free(outputData);
      return .fromList(newData);
    },
  );

  @override
  Uint8List DecodeDataBase64(
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.DecodeDataBase64(data),
    () {
      final outputSize = rl.Temp.Int$.Ref1();
      final outputData = rl.Core.DecodeDataBase64(
        rl.Temp.Uint8$.Array(data).cast(),
        outputSize,
      );
      final newData = rl.Temp.UnsignedChar$.asTypedList(outputData, outputSize.value);
      calloc.free(outputData);
      return newData;
    },
  );

  @override
  int ComputeCRC32(
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.ComputeCRC32(data),
    () => rl.Core.ComputeCRC32(
      rl.Temp.Uint8$.Array(data).cast(),
      data.length,
    ),
  );

  @override
  Uint8List ComputeMD5(
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.ComputeMD5(data),
    () => .fromList(rl.Temp.UnsignedInt$.ToLEBytes(
      rl.Core.ComputeMD5(
        rl.Temp.Uint8$.Array(data).cast(),
        data.length,
      ),
      rl.Utils.md5Uint32HashLength,
    )),
  );

  @override
  Uint8List ComputeSHA1(
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.ComputeSHA1(data),
    () => .fromList(rl.Temp.UnsignedInt$.ToBEBytes(
      rl.Core.ComputeSHA1(
        rl.Temp.Uint8$.Array(data).cast(),
        data.length,
      ),
      rl.Utils.sha1Uint32HashLength,
    )),
  );
    
  @override
  AutomationEventListD LoadAutomationEventList(
    String? fileName,
  ) => run(
    () => RaylibDebugLabels.LoadAutomationEventList(fileName),
    () => rl.Temp.AutomationEventList$.RefCapture(
      RaylibCaptureIds.LoadAutomationEventList(fileName),
      (_) => rl.Core.LoadAutomationEventList(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );
    
  @override
  void UnloadAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => RaylibDebugLabels.UnloadAutomationEventList(list),
    () => rl.Core.UnloadAutomationEventList(
      list.getOriginalPointerAndDispose().ref,
    ),
  );
    
  @override
  bool ExportAutomationEventList(
    AutomationEventListD list,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportAutomationEventList(list, fileName),
    () => rl.Core.ExportAutomationEventList(
      rl.Temp.AutomationEventList$.Ref1(list).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  void SetAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => RaylibDebugLabels.SetAutomationEventList(list),
    () => rl.Core.SetAutomationEventList(
      rl.Temp.AutomationEventList$.Ref1(list),
    ),
  );
    
  @override
  void SetAutomationEventBaseFrame(
    int frame,
  ) => run(
    () => RaylibDebugLabels.SetAutomationEventBaseFrame(frame),
    () => rl.Core.SetAutomationEventBaseFrame(frame),
  );
    
  @override
  void StartAutomationEventRecording() => run(
    () => RaylibDebugLabels.StartAutomationEventRecording(),
    () => rl.Core.StartAutomationEventRecording(),
  );

  @override
  void StopAutomationEventRecording() => run(
    () => RaylibDebugLabels.StopAutomationEventRecording(),
    () => rl.Core.StopAutomationEventRecording(),
  );
    
  @override
  void PlayAutomationEvent(
    AutomationEventD event,
  ) => run(
    () => RaylibDebugLabels.PlayAutomationEvent(event),
    () => rl.Core.PlayAutomationEvent(
      rl.Temp.AutomationEvent$.Ref1(event).ref,
    ),
  );

  @override
  bool IsKeyPressed(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyPressed(key),
    () => rl.Core.IsKeyPressed(key.value),
  );

  @override
  bool IsKeyPressedRepeat(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyPressedRepeat(key),
    () => rl.Core.IsKeyPressedRepeat(key.value),
  );

  @override
  bool IsKeyDown(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyDown(key),
    () => rl.Core.IsKeyDown(key.value),
  );

  @override
  bool IsKeyReleased(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyReleased(key),
    () => rl.Core.IsKeyReleased(key.value),
  );

  @override
  bool IsKeyUp(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyUp(key),
    () => rl.Core.IsKeyUp(key.value),
  );

  @override
  int GetKeyPressed() => run(
    () => RaylibDebugLabels.GetKeyPressed(),
    () => rl.Core.GetKeyPressed(),
  );

  @override
  int GetCharPressed() => run(
    () => RaylibDebugLabels.GetCharPressed(),
    () => rl.Core.GetCharPressed(),
  );

  @override
  void SetExitKey(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.SetExitKey(key),
    () => rl.Core.SetExitKey(key.value),
  );

  @override
  bool IsGamepadAvailable(
    num gamepad,
  ) => run(
    () => RaylibDebugLabels.IsGamepadAvailable(gamepad),
    () => rl.Core.IsGamepadAvailable(gamepad.toInt()),
  );

  @override
  String GetGamepadName(
    num gamepad,
  ) => run(
    () => RaylibDebugLabels.GetGamepadName(gamepad),
    () => rl.Core.GetGamepadName(gamepad.toInt()).toD,
  );

  @override
  bool IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => RaylibDebugLabels.IsGamepadButtonPressed(gamepad, button),
    () => rl.Core.IsGamepadButtonPressed(
      gamepad.toInt(),
      button.value,
    ),
  );

  @override
  bool IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => RaylibDebugLabels.IsGamepadButtonDown(gamepad, button),
    () => rl.Core.IsGamepadButtonDown(
      gamepad.toInt(),
      button.value,
    ),
  );

  @override
  bool IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => RaylibDebugLabels.IsGamepadButtonReleased(gamepad, button),
    () => rl.Core.IsGamepadButtonReleased(
      gamepad.toInt(),
      button.value,
    ),
  );

  @override
  bool IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => RaylibDebugLabels.IsGamepadButtonUp(gamepad, button),
    () => rl.Core.IsGamepadButtonUp(
      gamepad.toInt(),
      button.value,
    ),
  );

  @override
  GamepadButton GetGamepadButtonPressed() => run(
    () => RaylibDebugLabels.GetGamepadButtonPressed(),
    () => .fromValue(rl.Core.GetGamepadButtonPressed()),
  );

  @override
  int GetGamepadAxisCount(
    num gamepad,
  ) => run(
    () => RaylibDebugLabels.GetGamepadAxisCount(gamepad),
    () => rl.Core.GetGamepadAxisCount(gamepad.toInt()),
  );

  @override
  double GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => run(
    () => RaylibDebugLabels.GetGamepadAxisMovement(gamepad, axis),
    () => rl.Core.GetGamepadAxisMovement(
      gamepad.toInt(),
      axis.value,
    ),
  );

  @override
  int SetGamepadMappings(
    String mappings,
  ) => run(
    () => RaylibDebugLabels.SetGamepadMappings(mappings),
    () => rl.Core.SetGamepadMappings(
      rl.Temp.String$.ValueOrNull(mappings),
    ),
  );
    
  @override
  void SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => run(
    () => RaylibDebugLabels.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration),
    () => rl.Core.SetGamepadVibration(
      gamepad.toInt(),
      leftMotor.toDouble(),
      rightMotor.toDouble(),
      duration.toDouble(),
    ),
  );

  @override
  bool IsMouseButtonPressed(
    MouseButton button,
  ) => run(
    () => RaylibDebugLabels.IsMouseButtonPressed(button),
    () => rl.Core.IsMouseButtonPressed(button.value),
  );

  @override
  bool IsMouseButtonDown(
    MouseButton button,
  ) => run(
    () => RaylibDebugLabels.IsMouseButtonDown(button),
    () => rl.Core.IsMouseButtonDown(button.value),
  );

  @override
  bool IsMouseButtonReleased(
    MouseButton button,
  ) => run(
    () => RaylibDebugLabels.IsMouseButtonReleased(button),
    () => rl.Core.IsMouseButtonReleased(button.value),
  );

  @override
  bool IsMouseButtonUp(
    MouseButton button,
  ) => run(
    () => RaylibDebugLabels.IsMouseButtonUp(button),
    () => rl.Core.IsMouseButtonUp(button.value),
  );

  @override
  int GetMouseX() => run(
    () => RaylibDebugLabels.GetMouseX(),
    () => rl.Core.GetMouseX(),
  );

  @override
  int GetMouseY() => run(
    () => RaylibDebugLabels.GetMouseY(),
    () => rl.Core.GetMouseY(),
  );

  @override
  Vector2D GetMousePosition() => run(
    () => RaylibDebugLabels.GetMousePosition(),
    () => rl.Core.GetMousePosition().toD(),
  );

  @override
  Vector2D GetMouseDelta() => run(
    () => RaylibDebugLabels.GetMouseDelta(),
    () => rl.Core.GetMouseDelta().toD(),
  );

  @override
  void SetMousePosition(
    num x,
    num y,
  ) => run(
    () => RaylibDebugLabels.SetMousePosition(x, y),
    () => rl.Core.SetMousePosition(
      x.toInt(),
      y.toInt(),
    ),
  );

  @override
  void SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => run(
    () => RaylibDebugLabels.SetMouseOffset(offsetX, offsetY),
    () => rl.Core.SetMouseOffset(
      offsetX.toInt(),
      offsetY.toInt(),
    ),
  );

  @override
  void SetMouseScale(
    num scaleX,
    num scaleY,
  ) => run(
    () => RaylibDebugLabels.SetMouseScale(scaleX, scaleY),
    () => rl.Core.SetMouseScale(
      scaleX.toDouble(),
      scaleY.toDouble(),
    ),
  );

  @override
  double GetMouseWheelMove() => run(
    () => RaylibDebugLabels.GetMouseWheelMove(),
    () => rl.Core.GetMouseWheelMove(),
  );

  @override
  Vector2D GetMouseWheelMoveV() => run(
    () => RaylibDebugLabels.GetMouseWheelMoveV(),
    () => rl.Core.GetMouseWheelMoveV().toD(),
  );

  @override
  void SetMouseCursor(
    MouseCursor cursor,
  ) => run(
    () => RaylibDebugLabels.SetMouseCursor(cursor),
    () => rl.Core.SetMouseCursor(cursor.value),
  );

  @override
  int GetTouchX() => run(
    () => RaylibDebugLabels.GetTouchX(),
    () => rl.Core.GetTouchX(),
  );

  @override
  int GetTouchY() => run(
    () => RaylibDebugLabels.GetTouchY(),
    () => rl.Core.GetTouchY(),
  );

  @override
  Vector2D GetTouchPosition(
    num index,
  ) => run(
    () => RaylibDebugLabels.GetTouchPosition(index),
    () => rl.Core.GetTouchPosition(index.toInt()).toD(),
  );

  @override
  int GetTouchPointId(
    num index,
  ) => run(
    () => RaylibDebugLabels.GetTouchPointId(index),
    () => rl.Core.GetTouchPointId(index.toInt()),
  );

  @override
  int GetTouchPointCount() => run(
    () => RaylibDebugLabels.GetTouchPointCount(),
    () => rl.Core.GetTouchPointCount(),
  );

  @override
  void SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => run(
    () => RaylibDebugLabels.SetGesturesEnabled(flags),
    () => rl.Core.SetGesturesEnabled(rl.Utils.EnumsAsFlagsOr(flags)),
  );

  @override
  bool IsGestureDetected(
    Gesture key,
  ) => run(
    () => RaylibDebugLabels.IsGestureDetected(key),
    () => rl.Core.IsGestureDetected(key.value),
  );

  @override
  Gesture GetGestureDetected() => run(
    () => RaylibDebugLabels.GetGestureDetected(),
    () => .fromValue(rl.Core.GetGestureDetected()),
  );

  @override
  double GetGestureHoldDuration() => run(
    () => RaylibDebugLabels.GetGestureHoldDuration(),
    () => rl.Core.GetGestureHoldDuration(),
  );

  @override
  Vector2D GetGestureDragVector() => run(
    () => RaylibDebugLabels.GetGestureDragVector(),
    () => rl.Core.GetGestureDragVector().toD(),
  );

  @override
  double GetGestureDragAngle() => run(
    () => RaylibDebugLabels.GetGestureDragAngle(),
    () => rl.Core.GetGestureDragAngle(),
  );

  @override
  Vector2D GetGesturePinchVector() => run(
    () => RaylibDebugLabels.GetGesturePinchVector(),
    () => rl.Core.GetGesturePinchVector().toD(),
  );

  @override
  double GetGesturePinchAngle() => run(
    () => RaylibDebugLabels.GetGesturePinchAngle(),
    () => rl.Core.GetGesturePinchAngle(),
  );
    
  @override
  void UpdateCamera(
    Camera3DD camera,
    CameraMode mode,
  ) => run(
    () => RaylibDebugLabels.UpdateCamera(camera, mode),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (p) => rl.Core.UpdateCamera(p, mode.value),
    ),
  );

  @override
  void UpdateCameraPro(
    Camera3DD camera,
    Vector3D movement,
    Vector3D rotation,
    num zoom,
  ) => run(
    () => RaylibDebugLabels.UpdateCameraPro(camera, movement, rotation, zoom),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (p) => rl.Core.UpdateCameraPro(
        p,
        rl.Temp.Vector3$.Ref1(movement).ref,
        rl.Temp.Vector3$.Ref2(rotation).ref,
        zoom.toDouble(),
      ),
    ),
  );

  @override
  void SetShapesTexture(
    TextureD texture,
    RectangleD source,
  ) => run(
    () => RaylibDebugLabels.SetShapesTexture(texture, source),
    () => rl.Core.SetShapesTexture(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Rectangle$.Ref1(source).ref,
    ),
  );

  @override
  TextureD GetShapesTexture() => run(
    () => RaylibDebugLabels.GetShapesTexture(),
    () => rl.Core.GetShapesTexture().toD(),
  );

  @override
  RectangleD GetShapesTextureRectangle() => run(
    () => RaylibDebugLabels.GetShapesTextureRectangle(),
    () => rl.Core.GetShapesTextureRectangle().toD(),
  );

  @override
  void DrawPixel(
    num posX,
    num posY,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPixel(posX, posY, color),
    () => rl.Core.DrawPixel(
      posX.toInt(),
      posY.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawPixelV(
    Vector2D position,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPixelV(position, color),
    () => rl.Core.DrawPixelV(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLine(startPosX, startPosY, endPosX, endPosY, color),
    () => rl.Core.DrawLine(
      startPosX.toInt(),
      startPosY.toInt(),
      endPosX.toInt(),
      endPosY.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLineV(startPos, endPos, color),
    () => rl.Core.DrawLineV(
      rl.Temp.Vector2$.Ref1(startPos).ref,
      rl.Temp.Vector2$.Ref2(endPos).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawLineEx(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLineEx(startPos, endPos, thick, color),
    () => rl.Core.DrawLineEx(
      rl.Temp.Vector2$.Ref1(startPos).ref,
      rl.Temp.Vector2$.Ref2(endPos).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawLineStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLineStrip(points, color),
    () => rl.Core.DrawLineStrip(
      rl.Temp.Vector2$.Array(points),
      points.length,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLineBezier(startPos, endPos, thick, color),
    () => rl.Core.DrawLineBezier(
      rl.Temp.Vector2$.Ref1(startPos).ref,
      rl.Temp.Vector2$.Ref2(endPos).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCircle(centerX, centerY, radius, color),
    () => rl.Core.DrawCircle(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawCircleSector(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCircleSector(center, radius, startAngle, endAngle, segments, color),
    () => rl.Core.DrawCircleSector(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawCircleSectorLines(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color),
    () => rl.Core.DrawCircleSectorLines(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawCircleGradient(
    num centerX,
    num centerY,
    num radius,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => RaylibDebugLabels.DrawCircleGradient(centerX, centerY, radius, inner, outer),
    () => rl.Core.DrawCircleGradient(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      rl.Temp.Color$.Ref1(inner).ref,
      rl.Temp.Color$.Ref2(outer).ref,
    ),
  );

  @override
  void DrawCircleV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCircleV(center, radius, color),
    () => rl.Core.DrawCircleV(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCircleLines(centerX, centerY, radius, color),
    () => rl.Core.DrawCircleLines(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawCircleLinesV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCircleLinesV(center, radius, color),
    () => rl.Core.DrawCircleLinesV(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawEllipse(centerX, centerY, radiusH, radiusV, color),
    () => rl.Core.DrawEllipse(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color),
    () => rl.Core.DrawEllipseLines(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRing(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color),
    () => rl.Core.DrawRing(
      rl.Temp.Vector2$.Ref1(center).ref,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRingLines(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color),
    () => rl.Core.DrawRingLines(
      rl.Temp.Vector2$.Ref1(center).ref,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangle(posX, posY, width, height, color),
    () => rl.Core.DrawRectangle(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleV(position, size, color),
    () => rl.Core.DrawRectangleV(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Vector2$.Ref2(size).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleRec(rec, color),
    () => rl.Core.DrawRectangleRec(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawRectanglePro(
    RectangleD rec,
    Vector2D origin,
    num rotation,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectanglePro(rec, origin, rotation, color),
    () => rl.Core.DrawRectanglePro(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      rl.Temp.Vector2$.Ref1(origin).ref,
      rotation.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorD top,
    ColorD bottom,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleGradientV(posX, posY, width, height, top, bottom),
    () => rl.Core.DrawRectangleGradientV(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      rl.Temp.Color$.Ref1(top).ref,
      rl.Temp.Color$.Ref2(bottom).ref,
    ),
  );

  @override
  void DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorD left,
    ColorD right,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleGradientH(posX, posY, width, height, left, right),
    () => rl.Core.DrawRectangleGradientH(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      rl.Temp.Color$.Ref1(left).ref,
      rl.Temp.Color$.Ref2(right).ref,
    ),
  );

  @override
  void DrawRectangleGradientEx(
    RectangleD rec,
    ColorD topLeft,
    ColorD bottomLeft,
    ColorD topRight,
    ColorD bottomRight,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight),
    () => rl.Core.DrawRectangleGradientEx(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      rl.Temp.Color$.Ref1(topLeft).ref,
      rl.Temp.Color$.Ref2(bottomLeft).ref,
      rl.Temp.Color$.Ref3(topRight).ref,
      rl.Temp.Color$.Ref4(bottomRight).ref,
    ),
  );

  @override
  void DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleLines(posX, posY, width, height, color),
    () => rl.Core.DrawRectangleLines(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRectangleLinesEx(
    RectangleD rec,
    num lineThick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleLinesEx(rec, lineThick, color),
    () => rl.Core.DrawRectangleLinesEx(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      lineThick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRectangleRounded(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleRounded(rec, roundness, segments, color),
    () => rl.Core.DrawRectangleRounded(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      roundness.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRectangleRoundedLines(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleRoundedLines(rec, roundness, segments, color),
    () => rl.Core.DrawRectangleRoundedLines(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      roundness.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawRectangleRoundedLinesEx(
    RectangleD rec,
    num roundness,
    num segments,
    num lineThick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color),
    () => rl.Core.DrawRectangleRoundedLinesEx(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      roundness.toDouble(),
      segments.toInt(),
      lineThick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawTriangle(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawTriangle(v1, v2, v3, color),
    () => rl.Core.DrawTriangle(
      rl.Temp.Vector2$.Ref1(v1).ref,
      rl.Temp.Vector2$.Ref2(v2).ref,
      rl.Temp.Vector2$.Ref3(v3).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawTriangleLines(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawTriangleLines(v1, v2, v3, color),
    () => rl.Core.DrawTriangleLines(
      rl.Temp.Vector2$.Ref1(v1).ref,
      rl.Temp.Vector2$.Ref2(v2).ref,
      rl.Temp.Vector2$.Ref3(v3).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawTriangleFan(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawTriangleFan(points, color),
    () => rl.Core.DrawTriangleFan(
      rl.Temp.Vector2$.Array(points),
      points.length,
      rl.Temp.Color$.Ref1(color).ref
    ),
  );

  @override
  void DrawTriangleStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawTriangleStrip(points, color),
    () => rl.Core.DrawTriangleStrip(
      rl.Temp.Vector2$.Array(points),
      points.length,
      rl.Temp.Color$.Ref1(color).ref
    ),
  );

  @override
  void DrawPoly(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPoly(center, sides, radius, rotation, color),
    () => rl.Core.DrawPoly(
      rl.Temp.Vector2$.Ref1(center).ref,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawPolyLines(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPolyLines(center, sides, radius, rotation, color),
    () => rl.Core.DrawPolyLines(
      rl.Temp.Vector2$.Ref1(center).ref,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawPolyLinesEx(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color),
    () => rl.Core.DrawPolyLinesEx(
      rl.Temp.Vector2$.Ref1(center).ref,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      lineThick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawSplineLinear(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineLinear(points, thick, color),
    () => rl.Core.DrawSplineLinear(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawSplineBasis(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineBasis(points, thick, color),
    () => rl.Core.DrawSplineBasis(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawSplineCatmullRom(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineCatmullRom(points, thick, color),
    () => rl.Core.DrawSplineCatmullRom(
      rl.Temp.Vector2$.Array(points), 
      points.length, 
      thick.toDouble(), 
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawSplineBezierQuadratic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineBezierQuadratic(points, thick, color),
    () => rl.Core.DrawSplineBezierQuadratic(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawSplineBezierCubic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineBezierCubic(points, thick, color),
    () => rl.Core.DrawSplineBezierCubic(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineSegmentLinear(p1, p2, thick, color),
    () => rl.Core.DrawSplineSegmentLinear(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color),
    () => rl.Core.DrawSplineSegmentBasis(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color),
    () => rl.Core.DrawSplineSegmentCatmullRom(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color),
    () => rl.Core.DrawSplineSegmentBezierQuadratic(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(c2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color),
    () => rl.Core.DrawSplineSegmentBezierCubic(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(c2).ref,
      rl.Temp.Vector2$.Ref3(c3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  Vector2D GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    num t,
  ) => run(
    () => RaylibDebugLabels.GetSplinePointLinear(startPos, endPos, t),
    () => rl.Core.GetSplinePointLinear(
      rl.Temp.Vector2$.Ref1(startPos).ref,
      rl.Temp.Vector2$.Ref2(endPos).ref,
      t.toDouble(),
    ).toD(),
  );

  @override
  Vector2D GetSplinePointBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => run(
    () => RaylibDebugLabels.GetSplinePointBasis(p1, p2, p3, p4, t),
    () => rl.Core.GetSplinePointBasis(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      t.toDouble(),
    ).toD(),
  );
    
  @override
  Vector2D GetSplinePointCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => run(
    () => RaylibDebugLabels.GetSplinePointCatmullRom(p1, p2, p3, p4, t),
    () => rl.Core.GetSplinePointCatmullRom(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      t.toDouble(),
    ).toD(),
  );

  @override
  Vector2D GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num t,
  ) => run(
    () => RaylibDebugLabels.GetSplinePointBezierQuad(p1, c2, p3, t),
    () => rl.Core.GetSplinePointBezierQuad(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(c2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      t.toDouble(),
    ).toD(),
  );

  @override
  Vector2D GetSplinePointBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num t,
  ) => run(
    () => RaylibDebugLabels.GetSplinePointBezierCubic(p1, c2, c3, p4, t),
    () => rl.Core.GetSplinePointBezierCubic(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(c2).ref,
      rl.Temp.Vector2$.Ref3(c3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      t.toDouble(),
    ).toD(),
  );

  @override
  bool CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionRecs(rec1, rec2),
    () => rl.Core.CheckCollisionRecs(
      rl.Temp.Rectangle$.Ref1(rec1).ref,
      rl.Temp.Rectangle$.Ref2(rec2).ref,
    ),
  );

  @override
  bool CheckCollisionCircles(
    Vector2D center1,
    num radius1,
    Vector2D center2,
    num radius2,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionCircles(center1, radius1, center2, radius2),
    () => rl.Core.CheckCollisionCircles(
      rl.Temp.Vector2$.Ref1(center1).ref,
      radius1.toDouble(),
      rl.Temp.Vector2$.Ref2(center2).ref,
      radius2.toDouble(),
    ),
  );

  @override
  bool CheckCollisionCircleRec(
    Vector2D center,
    num radius,
    RectangleD rec,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionCircleRec(center, radius, rec),
    () => rl.Core.CheckCollisionCircleRec(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Rectangle$.Ref1(rec).ref,
    ),
  );

  @override
  bool CheckCollisionCircleLine(
    Vector2D center,
    num radius,
    Vector2D p1,
    Vector2D p2,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionCircleLine(center, radius, p1, p2),
    () => rl.Core.CheckCollisionCircleLine(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Vector2$.Ref2(p1).ref,
      rl.Temp.Vector2$.Ref3(p2).ref,
    ),
  );

  @override
  bool CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionPointRec(point, rec),
    () => rl.Core.CheckCollisionPointRec(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Rectangle$.Ref1(rec).ref,
    ),
  );
    
  @override
  bool CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    num radius,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionPointCircle(point, center, radius),
    () => rl.Core.CheckCollisionPointCircle(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Vector2$.Ref2(center).ref,
      radius.toDouble(),
    ),
  );

  @override
  bool CheckCollisionPointTriangle(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionPointTriangle(point, p1, p2, p3),
    () => rl.Core.CheckCollisionPointTriangle(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Vector2$.Ref2(p1).ref,
      rl.Temp.Vector2$.Ref3(p2).ref,
      rl.Temp.Vector2$.Ref4(p3).ref,
    ),
  );

  @override
  bool CheckCollisionPointLine(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    num threshold,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionPointLine(point, p1, p2, threshold),
    () => rl.Core.CheckCollisionPointLine(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Vector2$.Ref2(p1).ref,
      rl.Temp.Vector2$.Ref3(p2).ref,
      threshold.toInt(),
    ),
  );

  @override
  bool CheckCollisionPointPoly(
    Vector2D point,
    List<Vector2D> points,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionPointPoly(point, points),
    () => rl.Core.CheckCollisionPointPoly(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Vector2$.Array(points),
      points.length,
    ),
  );

  @override
  (bool result, Vector2D collisionPoint) CheckCollisionLines(
    Vector2D startPos1,
    Vector2D endPos1,
    Vector2D startPos2,
    Vector2D endPos2,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2),
    () {
      final collisionPoint = rl.Temp.Vector2$.Ref5();
      final result = rl.Core.CheckCollisionLines(
        rl.Temp.Vector2$.Ref1(startPos1).ref,
        rl.Temp.Vector2$.Ref2(endPos1).ref,
        rl.Temp.Vector2$.Ref3(startPos2).ref,
        rl.Temp.Vector2$.Ref4(endPos2).ref,
        collisionPoint,
      );
      return (result, collisionPoint.ref.toD());
    },
  );

  @override
  RectangleD GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => RaylibDebugLabels.GetCollisionRec(rec1, rec2),
    () => rl.Core.GetCollisionRec(
      rl.Temp.Rectangle$.Ref1(rec1).ref,
      rl.Temp.Rectangle$.Ref2(rec2).ref,
    ).toD(),
  );

  @override
  ImageD LoadImage(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadImage(fileName),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.LoadImage(fileName),
      (_) => rl.Core.LoadImage(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );
    
  @override
  ImageD LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => run(
    () => RaylibDebugLabels.LoadImageRaw(fileName, width, height, format, headerSize),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.LoadImageRaw(fileName, width, height, format, headerSize),
      (_) => rl.Core.LoadImageRaw(
        rl.Temp.String$.ValueOrNull(fileName),
        width.toInt(),
        height.toInt(),
        format.value,
        headerSize.toInt(),
      ),
    ),
  );

  @override
  ImageD LoadImageAnim(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadImageAnim(fileName),
    () {
      final frames = rl.Temp.Int$.Ref1();
      final image = rl.Temp.Image$.RefCapture(
        RaylibCaptureIds.LoadImageAnim(fileName),
        (_) => rl.Core.LoadImageAnim(
          rl.Temp.String$.ValueOrNull(fileName),
          frames,
        ),
      );
      image.structUpdateFrameCount(frames.value);
      return image;
    },
  );

  @override
  ImageD LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => RaylibDebugLabels.LoadImageAnimFromMemory(fileType, fileData),
    () {
      final frames = rl.Temp.Int$.Ref1();
      final image = rl.Temp.Image$.RefCapture(
        RaylibCaptureIds.LoadImageAnimFromMemory(fileType, fileData),
        (_) => rl.Core.LoadImageAnimFromMemory(
          rl.Temp.String$.ValueOrNull(fileType),
          rl.Temp.UnsignedChar$.Array(fileData),
          fileData.length,
          frames,
        ),
      );
      image.structUpdateFrameCount(frames.value);
      return image;
    },
  );

  @override
  ImageD LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => RaylibDebugLabels.LoadImageFromMemory(fileType, fileData),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.LoadImageFromMemory(fileType, fileData),
      (_) => rl.Core.LoadImageFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
      )
    ),
  );

  @override
  ImageD LoadImageFromTexture(
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.LoadImageFromTexture(texture),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.LoadImageFromTexture(texture),
      (_) => rl.Core.LoadImageFromTexture(
        rl.Temp.Texture$.Ref1(texture).ref,
      ),
    ),
  );

  @override
  ImageD LoadImageFromScreen() => run(
    () => RaylibDebugLabels.LoadImageFromScreen(),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.LoadImageFromScreen(),
      (_) => rl.Core.LoadImageFromScreen(),
    ),
  );

  @override
  bool IsImageValid(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.IsImageValid(image),
    () => rl.Core.IsImageValid(
      rl.Temp.Image$.Ref1(image).ref,
    ),
  );

  @override
  void UnloadImage(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.UnloadImage(image),
    () => rl.Core.UnloadImage(
      rl.Temp.Image$.Ref1(image).ref,
    ),
  );

  @override
  bool ExportImage(
    ImageD image,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportImage(image, fileName),
    () => rl.Core.ExportImage(
      rl.Temp.Image$.Ref1(image).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  (Pointer<UnsignedChar> dataPtr, int dataSize) ExportImageToMemory(
    ImageD image,
    String fileType,
  ) => run(
    () => RaylibDebugLabels.ExportImageToMemory(image, fileType),
    () {
      final dataSize = rl.Temp.Int$.Ref1();
      final dataPtr = rl.Core.ExportImageToMemory(
        rl.Temp.Image$.Ref1(image).ref,
        rl.Temp.String$.ValueOrNull(fileType),
        dataSize,
      );
      return (dataPtr, dataSize.value);
    },
  );

  @override
  bool ExportImageAsCode(
    ImageD image,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportImageAsCode(image, fileName),
    () => rl.Core.ExportImageAsCode(
      rl.Temp.Image$.Ref1(image).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  ImageD GenImageColor(
    num width,
    num height,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.GenImageColor(width, height, color),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GenImageColor(width, height, color),
      (_) => rl.Core.GenImageColor(
        width.toInt(),
        height.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  ImageD GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorD start,
    ColorD end,
  ) => run(
    () => RaylibDebugLabels.GenImageGradientLinear(width, height, direction, start, end),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GenImageGradientLinear(width, height, direction, start, end),
      (_) => rl.Core.GenImageGradientLinear(
        width.toInt(),
        height.toInt(),
        direction.toInt(),
        rl.Temp.Color$.Ref1(start).ref,
        rl.Temp.Color$.Ref2(end).ref,
      ),
    ),
  );

  @override
  ImageD GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => RaylibDebugLabels.GenImageGradientRadial(width, height, density, inner, outer),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GenImageGradientRadial(width, height, density, inner, outer),
      (_) => rl.Core.GenImageGradientRadial(
        width.toInt(),
        height.toInt(),
        density.toDouble(),
        rl.Temp.Color$.Ref1(inner).ref,
        rl.Temp.Color$.Ref2(outer).ref,
      ),
    ),
  );

  @override
  ImageD GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => RaylibDebugLabels.GenImageGradientSquare(width, height, density, inner, outer),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GenImageGradientSquare(width, height, density, inner, outer),
      (_) => rl.Core.GenImageGradientSquare(
        width.toInt(),
        height.toInt(),
        density.toDouble(),
        rl.Temp.Color$.Ref1(inner).ref,
        rl.Temp.Color$.Ref2(outer).ref,
      ),
    ),
  );

  @override
  ImageD GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorD col1,
    ColorD col2,
  ) => run(
    () => RaylibDebugLabels.GenImageChecked(width, height, checksX, checksY, col1, col2),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GenImageChecked(width, height, checksX, checksY, col1, col2),
      (_) => rl.Core.GenImageChecked(
        width.toInt(),
        height.toInt(),
        checksX.toInt(),
        checksY.toInt(),
        rl.Temp.Color$.Ref1(col1).ref,
        rl.Temp.Color$.Ref2(col2).ref,
      ),
    ),
  );

  @override
  ImageD GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => run(
    () => RaylibDebugLabels.GenImageWhiteNoise(width, height, factor),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GenImageWhiteNoise(width, height, factor),
      (_) => rl.Core.GenImageWhiteNoise(
        width.toInt(),
        height.toInt(),
        factor.toDouble(),
      ),
    ),
  );

  @override
  ImageD GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => run(
    () => RaylibDebugLabels.GenImagePerlinNoise(width, height, offsetX, offsetY, scale),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GenImagePerlinNoise(width, height, offsetX, offsetY, scale),
      (_) => rl.Core.GenImagePerlinNoise(
        width.toInt(),
        height.toInt(),
        offsetX.toInt(),
        offsetY.toInt(),
        scale.toDouble(),
      ),
    ),
  );
    
  @override
  ImageD GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => run(
    () => RaylibDebugLabels.GenImageCellular(width, height, tileSize),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GenImageCellular(width, height, tileSize),
      (_) => rl.Core.GenImageCellular(
        width.toInt(),
        height.toInt(),
        tileSize.toInt(),
      ),
    ),
  );

  @override
  ImageD GenImageText(
    num width,
    num height,
    String text,
  ) => run(
    () => RaylibDebugLabels.GenImageText(width, height, text),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.GenImageText(width, height, text),
      (_) => rl.Core.GenImageText(
        width.toInt(),
        height.toInt(),
        rl.Temp.String$.ValueOrNull(text),
      ),
    ),
  );

  @override
  ImageD ImageCopy(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageCopy(image),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.ImageCopy(image),
      (_) => rl.Core.ImageCopy(
        rl.Temp.Image$.Ref1(image).ref,
      ),
    ),
  );

  @override
  ImageD ImageFromImage(
    ImageD image,
    RectangleD rec,
  ) => run(
    () => RaylibDebugLabels.ImageFromImage(image, rec),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.ImageFromImage(image, rec),
      (_) => rl.Core.ImageFromImage(
        rl.Temp.Image$.Ref1(image).ref,
        rl.Temp.Rectangle$.Ref1(rec).ref,
      ),
    ),
  );

  @override
  ImageD ImageFromChannel(
    ImageD image,
    num selectedChannel,
  ) => run(
    () => RaylibDebugLabels.ImageFromChannel(image, selectedChannel),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.ImageFromChannel(image, selectedChannel),
      (_) => rl.Core.ImageFromChannel(
        rl.Temp.Image$.Ref1(image).ref,
        selectedChannel.toInt(),
      ),
    ),
  );

  @override
  ImageD ImageText(
    String text,
    num fontSize,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageText(text, fontSize, color),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.ImageText(text, fontSize, color),
      (_) => rl.Core.ImageText(
        rl.Temp.String$.ValueOrNull(text),
        fontSize.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  ImageD ImageTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.ImageTextEx(font, text, fontSize, spacing, tint),
    () => rl.Temp.Image$.RefCapture(
      RaylibCaptureIds.ImageTextEx(font, text, fontSize, spacing, tint),
      (_) => rl.Core.ImageTextEx(
        rl.Temp.Font$.Ref1(font).ref,
        rl.Temp.String$.ValueOrNull(text),
        fontSize.toDouble(),
        spacing.toDouble(),
        rl.Temp.Color$.Ref1(tint).ref,
      ),
    ),
  );

  @override
  void ImageFormat(
    ImageD image,
    PixelFormat newFormat,
  ) => run(
    () => RaylibDebugLabels.ImageFormat(image, newFormat),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageFormat(
        p,
        newFormat.value,
      ),
    ),
  );
    
  @override
  void ImageToPOT(
    ImageD image,
    ColorD fill,
  ) => run(
    () => RaylibDebugLabels.ImageToPOT(image, fill),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageToPOT(
        p,
        rl.Temp.Color$.Ref1(fill).ref,
      ),
    ),
  );

  @override
  void ImageCrop(
    ImageD image,
    RectangleD crop,
  ) => run(
    () => RaylibDebugLabels.ImageCrop(image, crop),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageCrop(
        p,
        rl.Temp.Rectangle$.Ref1(crop).ref,
      ),
    ),
  );

  @override
  void ImageAlphaCrop(
    ImageD image,
    num threshold,
  ) => run(
    () => RaylibDebugLabels.ImageAlphaCrop(image, threshold),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageAlphaCrop(
        p,
        threshold.toDouble(),
      ),
    ),
  );

  @override
  void ImageAlphaClear(
    ImageD image,
    ColorD color,
    num threshold,
  ) => run(
    () => RaylibDebugLabels.ImageAlphaClear(image, color, threshold),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageAlphaClear(
        p,
        rl.Temp.Color$.Ref1(color).ref,
        threshold.toDouble(),
      ),
    ),
  );

  @override
  void ImageAlphaMask(
    ImageD image,
    ImageD alphaMask,
  ) => run(
    () => RaylibDebugLabels.ImageAlphaMask(image, alphaMask),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageAlphaMask(
        p,
        rl.Temp.Image$.Ref2(alphaMask).ref,
      ),
    ),
  );

  @override
  void ImageAlphaPremultiply(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageAlphaPremultiply(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageAlphaPremultiply(p),
    ),
  );

  @override
  void ImageBlurGaussian(
    ImageD image,
    num blurSize,
  ) => run(
    () => RaylibDebugLabels.ImageBlurGaussian(image, blurSize),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageBlurGaussian(
        p,
        blurSize.toInt(),
      ),
    ),
  );

  @override
  void ImageKernelConvolution(
    ImageD image,
    List<double> kernel,
  ) => run(
    () => RaylibDebugLabels.ImageKernelConvolution(image, kernel),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageKernelConvolution(
        p,
        rl.Temp.Float32$.Array(kernel),
        kernel.length,
      ),
    ),
  );

  @override
  void ImageResize(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => run(
    () => RaylibDebugLabels.ImageResize(image, newWidth, newHeight),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageResize(
        p,
        newWidth.toInt(),
        newHeight.toInt(),
      ),
    ),
  );

  @override
  void ImageResizeNN(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => run(
    () => RaylibDebugLabels.ImageResizeNN(image, newWidth, newHeight),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageResizeNN(
        p,
        newWidth.toInt(),
        newHeight.toInt(),
      ),
    ),
  );
    
  @override
  void ImageResizeCanvas(
    ImageD image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorD fill,
  ) => run(
    () => RaylibDebugLabels.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageResizeCanvas(
        p,
        newWidth.toInt(),
        newHeight.toInt(),
        offsetX.toInt(),
        offsetY.toInt(),
        rl.Temp.Color$.Ref1(fill).ref,
      ),
    ),
  );

  @override
  void ImageMipmaps(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageMipmaps(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageMipmaps(p),
    ),
  );

  @override
  void ImageDither(
    ImageD image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => run(
    () => RaylibDebugLabels.ImageDither(image, rBpp, gBpp, bBpp, aBpp),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageDither(
        p,
        rBpp.toInt(),
        gBpp.toInt(),
        bBpp.toInt(),
        aBpp.toInt(),
      ),
    ),
  );

  @override
  void ImageFlipVertical(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageFlipVertical(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageFlipVertical(p),
    ),
  );

  @override
  void ImageFlipHorizontal(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageFlipHorizontal(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageFlipHorizontal(p),
    ),
  );

  @override
  void ImageRotate(
    ImageD image,
    num degrees,
  ) => run(
    () => RaylibDebugLabels.ImageRotate(image, degrees),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageRotate(
        p,
        degrees.toInt(),
      ),
    ),
  );

  @override
  void ImageRotateCW(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageRotateCW(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageRotateCW(p),
    ),
  );

  @override
  void ImageRotateCCW(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageRotateCCW(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageRotateCCW(p),
    ),
  );
    
  @override
  void ImageColorTint(
    ImageD image,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageColorTint(image, color),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorTint(
        p,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageColorInvert(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageColorInvert(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorInvert(p),
    ),
  );

  @override
  void ImageColorGrayscale(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageColorGrayscale(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorGrayscale(p),
    ),
  );

  @override
  void ImageColorContrast(
    ImageD image,
    num contrast,
  ) => run(
    () => RaylibDebugLabels.ImageColorContrast(image, contrast),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorContrast(
        p,
        contrast.toDouble(),
      ),
    ),
  );

  @override
  void ImageColorBrightness(
    ImageD image,
    num brightness,
  ) => run(
    () => RaylibDebugLabels.ImageColorBrightness(image, brightness),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorBrightness(
        p,
        brightness.toInt(),
      ),
    ),
  );

  @override
  void ImageColorReplace(
    ImageD image,
    ColorD color,
    ColorD replace,
  ) => run(
    () => RaylibDebugLabels.ImageColorReplace(image, color, replace),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorReplace(
        p,
        rl.Temp.Color$.Ref1(color).ref,
        rl.Temp.Color$.Ref2(replace).ref,
      ),
    ),
  );

  @override
  List<ColorD> LoadImageColors(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.LoadImageColors(image),
    () {
      final colors = rl.Core.LoadImageColors(
        rl.Temp.Image$.Ref1(image).ref,
      );
      final count = image.width * image.height;
      try {
        return .generate(count, (i) => (colors + i).toD());
      } finally {
        rl.Core.UnloadImageColors(colors);
      }
    },
  );
    
  @override
  List<ColorD> LoadImagePalette(
    ImageD image,
    num maxPaletteSize,
  ) => run(
    () => RaylibDebugLabels.LoadImagePalette(image, maxPaletteSize),
    () {
      final colorCount = rl.Temp.Int$.Ref1();
      final colors = rl.Core.LoadImagePalette(
        rl.Temp.Image$.Ref1(image).ref,
        maxPaletteSize.toInt(),
        colorCount,
      );
      try {
        return .generate(colorCount.value, (i) => (colors + i).toD());
      } finally {
        rl.Core.UnloadImagePalette(colors);
      }
    },
  );

  @override
  RectangleD GetImageAlphaBorder(
    ImageD image,
    num threshold,
  ) => run(
    () => RaylibDebugLabels.GetImageAlphaBorder(image, threshold),
    () => rl.Core.GetImageAlphaBorder(
      rl.Temp.Image$.Ref1(image).ref,
      threshold.toDouble(),
    ).toD(),
  );

  @override
  ColorD GetImageColor(
    ImageD image,
    num x,
    num y,
  ) => run(
    () => RaylibDebugLabels.GetImageColor(image, x, y),
    () => rl.Core.GetImageColor(
      rl.Temp.Image$.Ref1(image).ref,
      x.toInt(),
      y.toInt(),
    ).toD(),
  );

  @override
  void ImageClearBackground(
    ImageD dst,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageClearBackground(dst, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageClearBackground(
        p,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawPixel(
    ImageD dst,
    num posX,
    num posY,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawPixel(dst, posX, posY, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawPixel(
        p,
        posX.toInt(),
        posY.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawPixelV(
    ImageD dst,
    Vector2D position,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawPixelV(dst, position, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawPixelV(
        p,
        rl.Temp.Vector2$.Ref1(position).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );
    
  @override
  void ImageDrawLine(
    ImageD dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawLine(
        p,
        startPosX.toInt(),
        startPosY.toInt(),
        endPosX.toInt(),
        endPosY.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawLineV(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawLineV(dst, start, end, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawLineV(
        p,
        rl.Temp.Vector2$.Ref1(start).ref,
        rl.Temp.Vector2$.Ref2(end).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawLineEx(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawLineEx(dst, start, end, thick, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawLineEx(
        p,
        rl.Temp.Vector2$.Ref1(start).ref,
        rl.Temp.Vector2$.Ref2(end).ref,
        thick.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawCircle(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawCircle(dst, centerX, centerY, radius, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawCircle(
        p,
        centerX.toInt(),
        centerY.toInt(),
        radius.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawCircleV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawCircleV(dst, center, radius, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawCircleV(
        p,
        rl.Temp.Vector2$.Ref1(center).ref,
        radius.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawCircleLines(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawCircleLines(dst, centerX, centerY, radius, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawCircleLines(
        p,
        centerX.toInt(),
        centerY.toInt(),
        radius.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawCircleLinesV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawCircleLinesV(dst, center, radius, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawCircleLinesV(
        p,
        rl.Temp.Vector2$.Ref1(center).ref,
        radius.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawRectangle(
    ImageD dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawRectangle(dst, posX, posY, width, height, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawRectangle(
        p,
        posX.toInt(),
        posY.toInt(),
        width.toInt(),
        height.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );
    
  @override
  void ImageDrawRectangleV(
    ImageD dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawRectangleV(dst, position, size, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawRectangleV(
        p,
        rl.Temp.Vector2$.Ref1(position).ref,
        rl.Temp.Vector2$.Ref2(size).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawRectangleRec(
    ImageD dst,
    RectangleD rec,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawRectangleRec(dst, rec, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawRectangleRec(
        p,
        rl.Temp.Rectangle$.Ref1(rec).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawRectangleLines(
    ImageD dst,
    RectangleD rec,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawRectangleLines(dst, rec, thick, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawRectangleLines(
        p,
        rl.Temp.Rectangle$.Ref1(rec).ref,
        thick.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawTriangle(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawTriangle(dst, v1, v2, v3, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawTriangle(
        p,
        rl.Temp.Vector2$.Ref1(v1).ref,
        rl.Temp.Vector2$.Ref2(v2).ref,
        rl.Temp.Vector2$.Ref3(v3).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawTriangleEx(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD c1,
    ColorD c2,
    ColorD c3,
  ) => run(
    () => RaylibDebugLabels.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawTriangleEx(
        p,
        rl.Temp.Vector2$.Ref1(v1).ref,
        rl.Temp.Vector2$.Ref2(v2).ref,
        rl.Temp.Vector2$.Ref3(v3).ref,
        rl.Temp.Color$.Ref1(c1).ref,
        rl.Temp.Color$.Ref2(c2).ref,
        rl.Temp.Color$.Ref3(c3).ref,
      ),
    ),
  );

  @override
  void ImageDrawTriangleLines(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawTriangleLines(dst, v1, v2, v3, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawTriangleLines(
        p,
        rl.Temp.Vector2$.Ref1(v1).ref,
        rl.Temp.Vector2$.Ref2(v2).ref,
        rl.Temp.Vector2$.Ref3(v3).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );
    
  @override
  void ImageDrawTriangleFan(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawTriangleFan(dst, points, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawTriangleFan(
        p,
        rl.Temp.Vector2$.Array(points),
        points.length,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawTriangleStrip(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawTriangleStrip(dst, points, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawTriangleStrip(
        p,
        rl.Temp.Vector2$.Array(points),
        points.length,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDraw(
    ImageD dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.ImageDraw(dst, src, srcRec, dstRec, tint),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDraw(
        p,
        rl.Temp.Image$.Ref2(src).ref,
        rl.Temp.Rectangle$.Ref1(srcRec).ref,
        rl.Temp.Rectangle$.Ref2(dstRec).ref,
        rl.Temp.Color$.Ref1(tint).ref,
      ),
    ),
  );

  @override
  void ImageDrawText(
    ImageD dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageDrawText(dst, text, posX, posY, fontSize, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawText(
        p,
        rl.Temp.String$.ValueOrNull(text),
        posX.toInt(),
        posY.toInt(),
        fontSize.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  @override
  void ImageDrawTextEx(
    ImageD dst,
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawTextEx(
        p,
        rl.Temp.Font$.Ref1(font).ref,
        rl.Temp.String$.ValueOrNull(text),
        rl.Temp.Vector2$.Ref1(position).ref,
        fontSize.toDouble(),
        spacing.toDouble(),
        rl.Temp.Color$.Ref1(tint).ref,
      ),
    ),
  );

  @override
  TextureD LoadTexture(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadTexture(fileName),
    () => rl.Temp.Texture$.RefCapture(
      RaylibCaptureIds.LoadTexture(fileName),
      (_) => rl.Core.LoadTexture(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );

  @override
  TextureD LoadTextureFromImage(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.LoadTextureFromImage(image),
    () => rl.Temp.Texture$.RefCapture(
      RaylibCaptureIds.LoadTextureFromImage(image),
      (_) => rl.Core.LoadTextureFromImage(
        rl.Temp.Image$.Ref1(image).ref,
      ),
    ),
  );

  @override
  TextureD LoadTextureCubemap(
    ImageD image,
    CubemapLayout layout,
  ) => run(
    () => RaylibDebugLabels.LoadTextureCubemap(image, layout),
    () => rl.Temp.Texture$.RefCapture(
      RaylibCaptureIds.LoadTextureCubemap(image, layout),
      (_) => rl.Core.LoadTextureCubemap(
        rl.Temp.Image$.Ref1(image).ref,
        layout.value,
      ),
    ),
  );

  @override
  RenderTextureD LoadRenderTexture(
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.LoadRenderTexture(width, height),
    () => rl.Temp.RenderTexture$.RefCapture(
      RaylibCaptureIds.LoadRenderTexture(width, height),
      (_) => rl.Core.LoadRenderTexture(
        width.toInt(),
        height.toInt(),
      ),
    ),
  );

  @override
  bool IsTextureValid(
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.IsTextureValid(texture),
    () => rl.Core.IsTextureValid(
      rl.Temp.Texture$.Ref1(texture).ref,
    ),
  );

  @override
  void UnloadTexture(
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.UnloadTexture(texture),
    () => rl.Core.UnloadTexture(
      texture.getOriginalPointerAndDispose().ref,
    ),
  );

  @override
  bool IsRenderTextureValid(
    RenderTextureD target,
  ) => run(
    () => RaylibDebugLabels.IsRenderTextureValid(target),
    () => rl.Core.IsRenderTextureValid(
      rl.Temp.RenderTexture$.Ref1(target).ref,
    ),
  );

  @override
  void UnloadRenderTexture(
    RenderTextureD target,
  ) => run(
    () => RaylibDebugLabels.UnloadRenderTexture(target),
    () => rl.Core.UnloadRenderTexture(
      rl.Temp.RenderTexture$.Ref1(target).ref,
    ),
  );

  @override
  void UpdateTexture(
    TextureD texture,
    Uint8List pixels,
  ) => run(
    () => RaylibDebugLabels.UpdateTexture(texture, pixels),
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.UpdateTexture(
        p.ref,
        rl.Temp.Uint8$.Array(pixels).cast(),
      ),
    ),
  );
    
  @override
  void UpdateTextureRec(
    TextureD texture,
    RectangleD rec,
    Uint8List pixels,
  ) => run(
    () => RaylibDebugLabels.UpdateTextureRec(texture, rec, pixels),
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.UpdateTextureRec(
        p.ref,
        rl.Temp.Rectangle$.Ref1(rec).ref,
        rl.Temp.Uint8$.Array(pixels).cast(),
      ),
    ),
  );

  @override
  void GenTextureMipmaps(
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.GenTextureMipmaps(texture),
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.GenTextureMipmaps(p),
    ),
  );

  @override
  void SetTextureFilter(
    TextureD texture,
    TextureFilter filter,
  ) => run(
    () => RaylibDebugLabels.SetTextureFilter(texture, filter),
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.SetTextureFilter(
        p.ref,
        filter.value,
      ),
    ),
  );

  @override
  void SetTextureWrap(
    TextureD texture,
    TextureWrap wrap,
  ) => run(
    () => RaylibDebugLabels.SetTextureWrap(texture, wrap),
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.SetTextureWrap(
        p.ref,
        wrap.value,
      ),
    ),
  );

  @override
  void DrawTexture(
    TextureD texture,
    num posX,
    num posY,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTexture(texture, posX, posY, tint),
    () => rl.Core.DrawTexture(
      rl.Temp.Texture$.Ref1(texture).ref,
      posX.toInt(),
      posY.toInt(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  @override
  void DrawTextureV(
    TextureD texture,
    Vector2D position,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTextureV(texture, position, tint),
    () => rl.Core.DrawTextureV(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  @override
  void DrawTextureEx(
    TextureD texture,
    Vector2D position,
    num rotation,
    num scale,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTextureEx(texture, position, rotation, scale, tint),
    () => rl.Core.DrawTextureEx(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Vector2$.Ref1(position).ref,
      rotation.toDouble(),
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  @override
  void DrawTextureRec(
    TextureD texture,
    RectangleD source,
    Vector2D position,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTextureRec(texture, source, position, tint),
    () => rl.Core.DrawTextureRec(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Rectangle$.Ref1(source).ref,
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  @override
  void DrawTexturePro(
    TextureD texture,
    RectangleD source,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTexturePro(texture, source, dest, origin, rotation, tint),
    () {
      rl.Core.DrawTexturePro(
        rl.Temp.Texture$.Ref1(texture).ref,
        rl.Temp.Rectangle$.Ref1(source).ref,
        rl.Temp.Rectangle$.Ref2(dest).ref,
        rl.Temp.Vector2$.Ref1(origin).ref,
        rotation.toDouble(),
        rl.Temp.Color$.Ref1(tint).ref,
      );
    },
  );

  @override
  void DrawTextureNPatch(
    TextureD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint),
    () => rl.Core.DrawTextureNPatch(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.NPatchInfo$.Ref1(nPatchInfo).ref,
      rl.Temp.Rectangle$.Ref1(dest).ref,
      rl.Temp.Vector2$.Ref1(origin).ref,
      rotation.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  @override
  bool ColorIsEqual(
    ColorD col1,
    ColorD col2,
  ) => run(
    () => RaylibDebugLabels.ColorIsEqual(col1, col2),
    () => rl.Core.ColorIsEqual(
      rl.Temp.Color$.Ref1(col1).ref,
      rl.Temp.Color$.Ref2(col2).ref,
    ),
  );

  @override
  ColorD Fade(
    ColorD color,
    num alpha,
  ) => run(
    () => RaylibDebugLabels.Fade(color, alpha),
    () => rl.Core.Fade(
      rl.Temp.Color$.Ref1(color).ref,
      alpha.toDouble(),
    ).toD(),
  );

  @override
  int ColorToInt(
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ColorToInt(color),
    () => rl.Core.ColorToInt(
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  Vector4D ColorNormalize(
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ColorNormalize(color),
    () => rl.Core.ColorNormalize(
      rl.Temp.Color$.Ref1(color).ref,
    ).toD(),
  );

  @override
  ColorD ColorFromNormalized(
    Vector4D normalized,
  ) => run(
    () => RaylibDebugLabels.ColorFromNormalized(normalized),
    () => rl.Core.ColorFromNormalized(
      rl.Temp.Vector4$.Ref1(normalized).ref,
    ).toD(),
  );

  @override
  Vector3D ColorToHSV(
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ColorToHSV(color),
    () => rl.Core.ColorToHSV(
      rl.Temp.Color$.Ref1(color).ref,
    ).toD(),
  );

  @override
  ColorD ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => run(
    () => RaylibDebugLabels.ColorFromHSV(hue, saturation, value),
    () => rl.Core.ColorFromHSV(
      hue.toDouble(),
      saturation.toDouble(),
      value.toDouble(),
    ).toD(),
  );

  @override
  ColorD ColorTint(
    ColorD color,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.ColorTint(color, tint),
    () => rl.Core.ColorTint(
      rl.Temp.Color$.Ref1(color).ref,
      rl.Temp.Color$.Ref2(tint).ref,
    ).toD(),
  );

  @override
  ColorD ColorBrightness(
    ColorD color,
    num factor,
  ) => run(
    () => RaylibDebugLabels.ColorBrightness(color, factor),
    () => rl.Core.ColorBrightness(
      rl.Temp.Color$.Ref1(color).ref,
      factor.toDouble(),
    ).toD(),
  );

  @override
  ColorD ColorContrast(
    ColorD color,
    num contrast,
  ) => run(
    () => RaylibDebugLabels.ColorContrast(color, contrast),
    () => rl.Core.ColorContrast(
      rl.Temp.Color$.Ref1(color).ref,
      contrast.toDouble(),
    ).toD(),
  );

  @override
  ColorD ColorAlpha(
    ColorD color,
    num alpha,
  ) => run(
    () => RaylibDebugLabels.ColorAlpha(color, alpha),
    () => rl.Core.ColorAlpha(
      rl.Temp.Color$.Ref1(color).ref,
      alpha.toDouble(),
    ).toD(),
  );

  @override
  ColorD ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.ColorAlphaBlend(dst, src, tint),
    () => rl.Core.ColorAlphaBlend(
      rl.Temp.Color$.Ref1(dst).ref,
      rl.Temp.Color$.Ref2(src).ref,
      rl.Temp.Color$.Ref3(tint).ref,
    ).toD(),
  );

  @override
  ColorD ColorLerp(
    ColorD color1,
    ColorD color2,
    num factor,
  ) => run(
    () => RaylibDebugLabels.ColorLerp(color1, color2, factor),
    () => rl.Core.ColorLerp(
      rl.Temp.Color$.Ref1(color1).ref,
      rl.Temp.Color$.Ref2(color2).ref,
      factor.toDouble(),
    ).toD(),
  );

  @override
  ColorD GetColor(
    num hexValue,
  ) => run(
    () => RaylibDebugLabels.GetColor(hexValue),
    () => rl.Core.GetColor(hexValue.toInt()).toD(),
  );

  @override
  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => run(
    () => RaylibDebugLabels.GetPixelDataSize(width, height, format),
    () => rl.Core.GetPixelDataSize(
      width.toInt(),
      height.toInt(),
      format.value,
    ),
  );

  @override
  FontD GetFontDefault() => run(
    () => RaylibDebugLabels.GetFontDefault(),
    () => rl.Temp.Font$.RefCapture(
      RaylibCaptureIds.GetFontDefault(),
      (_) => rl.Core.GetFontDefault(),
    ),
  );

  @override
  FontD LoadFont(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadFont(fileName),
    () => rl.Temp.Font$.RefCapture(
      RaylibCaptureIds.LoadFont(fileName),
      (_) => rl.Core.LoadFont(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );
    
  @override
  FontD LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codePointCount
    ]
  ) => run(
    () => RaylibDebugLabels.LoadFontEx(fileName, fontSize, codepoints),
    () => rl.Temp.Font$.RefCapture(
      RaylibCaptureIds.LoadFontEx(fileName, fontSize, codepoints),
      (_) => rl.Core.LoadFontEx(
        rl.Temp.String$.ValueOrNull(fileName),
        fontSize.toInt(),
        codepoints == null ? nullptr : rl.Temp.Int$.Array(codepoints),
        codePointCount?.toInt() ?? codepoints?.length ?? 0,
      ),
    ),
  );

  @override
  FontD LoadFontFromImage(
    ImageD image,
    ColorD key,
    num firstChar,
  ) => run(
    () => RaylibDebugLabels.LoadFontFromImage(image, key, firstChar),
    () => rl.Temp.Font$.RefCapture(
      RaylibCaptureIds.LoadFontFromImage(image, key, firstChar),
      (_) => rl.Core.LoadFontFromImage(
        rl.Temp.Image$.Ref1(image).ref,
        rl.Temp.Color$.Ref1(key).ref,
        firstChar.toInt(),
      ),
    ),
  );

  @override
  FontD LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => run(
    () => RaylibDebugLabels.LoadFontFromMemory(fileType, fileData, fontSize, codepoints),
    () => rl.Temp.Font$.RefCapture(
      RaylibCaptureIds.LoadFontFromMemory(fileType, fileData, fontSize, codepoints),
      (_) => rl.Core.LoadFontFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.Uint8$.Array(fileData).cast(),
        fileData.length,
        fontSize.toInt(),
        rl.Temp.Int$.Array(codepoints),
        codepoints.length,
      ),
    ),
  );

  @override
  bool IsFontValid(
    FontD font,
  ) => run(
    () => RaylibDebugLabels.IsFontValid(font),
    () => rl.Core.IsFontValid(
      rl.Temp.Font$.Ref1(font).ref,
    ),
  );

  // TODO: ON NEW RAYLIB RELEASE - add glyphCount, now it defaults to 95
  @override
  List<GlyphInfoD> LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) => run(
    () => RaylibDebugLabels.LoadFontData(fileData, fontSize, codepoints, codepointCount, type),
    () {
      // final glyphCount = _int1();
      final glyphs = rl.Core.LoadFontData(
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
        fontSize.toInt(),
        codepoints == null ? nullptr : rl.Temp.Int$.Array(codepoints),
        codepointCount?.toInt() ?? codepoints?.length ?? 0,
        type.value,
        // glyphCount,
      );
      final requestedCount = (codepointCount == null || codepointCount == 0) 
        // ? codepoints?.length ?? glyphCount.value 
        ? codepoints?.length ?? 95 
        : codepointCount.toInt();
      return .generate(requestedCount, (i) => (glyphs + i).toD());
    },
  );

  @override
  (ImageD image, List<RectangleD> glyphRecs) GenImageFontAtlas(
    List<GlyphInfoD> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => run(
    () => RaylibDebugLabels.GenImageFontAtlas(glyphs, fontSize, padding, packMethod),
    () {
      final recsPtr = rl.Temp.Ptr$Rectangle$.Raw();

      try {
        final image = rl.Temp.Image$.RefCapture(
          RaylibCaptureIds.GenImageFontAtlas(glyphs, fontSize, padding, packMethod),
          (_) => rl.Core.GenImageFontAtlas(
            glyphs.firstOrNull?.originalPointer ?? rl.Temp.GlyphInfo$.Array(glyphs),
            recsPtr,
            glyphs.length,
            fontSize.toInt(),
            padding.toInt(),
            packMethod.toInt(),
          ),
        );

        final recs = List.generate(glyphs.length,
          (i) => (recsPtr.value + i).ref.toD()
        );

        return (image, recs);
      } finally {
        calloc.free(recsPtr);
      }
    },
  );

  @override
  void UnloadFontData(
    List<GlyphInfoD> glyphs,
  ) => run(
    () => RaylibDebugLabels.UnloadFontData(glyphs),
    () => rl.Core.UnloadFontData(
      glyphs.firstOrNull?.originalPointer ?? rl.Temp.GlyphInfo$.Array(glyphs),
      glyphs.length,
    ),
  );
    
  @override
  void UnloadFont(
    FontD font,
  ) => run(
    () => RaylibDebugLabels.UnloadFont(font),
    () => rl.Core.UnloadFont(
      rl.Temp.Font$.Ref1(font).ref,
    ),
  );

  @override
  bool ExportFontAsCode(
    FontD font,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportFontAsCode(font, fileName),
    () => rl.Core.ExportFontAsCode(
      rl.Temp.Font$.Ref1(font).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  void DrawFPS(
    num posX,
    num posY,
  ) => run(
    () => RaylibDebugLabels.DrawFPS(posX, posY),
    () => rl.Core.DrawFPS(
      posX.toInt(),
      posY.toInt(),
    ),
  );

  @override
  void DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawText(text, posX, posY, fontSize, color),
    () => rl.Core.DrawText(
      rl.Temp.String$.ValueOrNull(text),
      posX.toInt(),
      posY.toInt(),
      fontSize.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawTextEx(
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTextEx(font, text, position, fontSize, spacing, tint),
    () => rl.Core.DrawTextEx(
      rl.Temp.Font$.Ref1(font).ref,
      rl.Temp.String$.ValueOrNull(text),
      rl.Temp.Vector2$.Ref1(position).ref,
      fontSize.toDouble(),
      spacing.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  @override
  void DrawTextPro(
    FontD font,
    String text,
    Vector2D position,
    Vector2D origin,
    num rotation,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint),
    () => rl.Core.DrawTextPro(
      rl.Temp.Font$.Ref1(font).ref,
      rl.Temp.String$.ValueOrNull(text),
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Vector2$.Ref2(origin).ref,
      rotation.toDouble(),
      fontSize.toDouble(),
      spacing.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  @override
  void DrawTextCodepoint(
    FontD font,
    num codepoint,
    Vector2D position,
    num fontSize,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTextCodepoint(font, codepoint, position, fontSize, tint),
    () => rl.Core.DrawTextCodepoint(
      rl.Temp.Font$.Ref1(font).ref,
      codepoint.toInt(),
      rl.Temp.Vector2$.Ref1(position).ref,
      fontSize.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  @override
  void DrawTextCodepoints(
    FontD font,
    Int32List codepoints,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTextCodepoints(font, codepoints, position, fontSize, spacing, tint),
    () => rl.Core.DrawTextCodepoints(
      rl.Temp.Font$.Ref1(font).ref,
      rl.Temp.Int$.Array(codepoints),
      codepoints.length,
      rl.Temp.Vector2$.Ref1(position).ref,
      fontSize.toDouble(),
      spacing.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  @override
  void SetTextLineSpacing(
    num spacing,
  ) => run(
    () => RaylibDebugLabels.SetTextLineSpacing(spacing),
    () => rl.Core.SetTextLineSpacing(spacing.toInt()),
  );

  @override
  int MeasureText(
    String text,
    num fontSize,
  ) => run(
    () => RaylibDebugLabels.MeasureText(text, fontSize),
    () => rl.Core.MeasureText(
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toInt(),
    ),
  );
    
  @override
  Vector2D MeasureTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
  ) => run(
    () => RaylibDebugLabels.MeasureTextEx(font, text, fontSize, spacing),
    () => rl.Core.MeasureTextEx(
      rl.Temp.Font$.Ref1(font).ref,
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
    ).toD(),
  );

  @override
  int GetGlyphIndex(
    FontD font,
    num codepoint,
  ) => run(
    () => RaylibDebugLabels.GetGlyphIndex(font, codepoint),
    () => rl.Core.GetGlyphIndex(
      rl.Temp.Font$.Ref1(font).ref,
      codepoint.toInt(),
    ),
  );

  @override
  GlyphInfoD GetGlyphInfo(
    FontD font,
    num codepoint,
  ) => run(
    () => RaylibDebugLabels.GetGlyphInfo(font, codepoint),
    () => rl.Core.GetGlyphInfo(
      rl.Temp.Font$.Ref1(font).ref,
      codepoint.toInt(),
    ).toD(),
  );

  @override
  RectangleD GetGlyphAtlasRec(
    FontD font,
    num codepoint,
  ) => run(
    () => RaylibDebugLabels.GetGlyphAtlasRec(font, codepoint),
    () => rl.Core.GetGlyphAtlasRec(
      rl.Temp.Font$.Ref1(font).ref,
      codepoint.toInt(),
    ).toD(),
  );
    
  @override
  String LoadUTF8(
    Int32List codepoints,
  ) => run(
    () => RaylibDebugLabels.LoadUTF8(codepoints),
    () {
      final utf8 = rl.Core.LoadUTF8(
        rl.Temp.Int$.Array(codepoints),
        codepoints.length,
      );
      try {
        return utf8.toD;
      } finally {
        rl.Core.UnloadUTF8(utf8);
      }
    },
  );

  @override
  Int32List LoadCodepoints(
    String text,
  ) => run(
    () => RaylibDebugLabels.LoadCodepoints(text),
    () {
      final count = rl.Temp.Int$.Ref1();
      final result = rl.Core.LoadCodepoints(
        rl.Temp.String$.ValueOrNull(text),
        count,
      );
      try {
        return .fromList(.generate(count.value, (i) => result[i]));
      } finally {
        rl.Core.UnloadCodepoints(result);
      }
    },
  );

  @override
  int GetCodepointCount(
    String text,
  ) => run(
    () => RaylibDebugLabels.GetCodepointCount(text),
    () => rl.Core.GetCodepointCount(
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  (int codepoint, int codepointSize) GetCodepoint(
    String text,
  ) => run(
    () => RaylibDebugLabels.GetCodepoint(text),
    () {
      final size = rl.Temp.Int$.Ref1();
      final codepoint = rl.Core.GetCodepoint(
        rl.Temp.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  @override
  (int codepoint, int codepointSize) GetCodepointNext(
    String text,
  ) => run(
    () => RaylibDebugLabels.GetCodepointNext(text),
    () {
      final size = rl.Temp.Int$.Ref1();
      final codepoint = rl.Core.GetCodepointNext(
        rl.Temp.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  @override
  (int codepoint, int codepointSize) GetCodepointPrevious(
    String text,
  ) => run(
    () => RaylibDebugLabels.GetCodepointPrevious(text),
    () {
      final size = rl.Temp.Int$.Ref1();
      final codepoint = rl.Core.GetCodepointPrevious(
        rl.Temp.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  @override
  (String text, int size) CodepointToUTF8(
    num codepoint,
  ) => run(
    () => RaylibDebugLabels.CodepointToUTF8(codepoint),
    () {
      final size = rl.Temp.Int$.Ref1();
      final text = rl.Core.CodepointToUTF8(
        codepoint.toInt(),
        size,
      );
      return (text.toD, size.value);
    },
  );
    
  @override
  void DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLine3D(startPos, endPos, color),
    () => rl.Core.DrawLine3D(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawPoint3D(
    Vector3D position,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPoint3D(position, color),
    () => rl.Core.DrawPoint3D(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCircle3D(
    Vector3D center,
    num radius,
    Vector3D rotationAxis,
    num rotationAngle,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color),
    () => rl.Core.DrawCircle3D(
      rl.Temp.Vector3$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Vector3$.Ref2(rotationAxis).ref,
      rotationAngle.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawTriangle3D(
    Vector3D v1,
    Vector3D v2,
    Vector3D v3,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawTriangle3D(v1, v2, v3, color),
    () => rl.Core.DrawTriangle3D(
      rl.Temp.Vector3$.Ref1(v1).ref,
      rl.Temp.Vector3$.Ref2(v2).ref,
      rl.Temp.Vector3$.Ref3(v3).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawTriangleStrip3D(
    List<Vector3D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawTriangleStrip3D(points, color),
    () => rl.Core.DrawTriangleStrip3D(
      rl.Temp.Vector3$.Array(points),
      points.length,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCube(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCube(position, width, height, length, color),
    () => rl.Core.DrawCube(
      rl.Temp.Vector3$.Ref1(position).ref,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCubeV(position, size, color),
    () => rl.Core.DrawCubeV(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(size).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCubeWires(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCubeWires(position, width, height, length, color),
    () => rl.Core.DrawCubeWires(
      rl.Temp.Vector3$.Ref1(position).ref,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCubeWiresV(position, size, color),
    () => rl.Core.DrawCubeWiresV(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(size).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawSphere(
    Vector3D centerPos,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSphere(centerPos, radius, color),
    () => rl.Core.DrawSphere(
      rl.Temp.Vector3$.Ref1(centerPos).ref,
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawSphereEx(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSphereEx(centerPos, radius, rings, slices, color),
    () => rl.Core.DrawSphereEx(
      rl.Temp.Vector3$.Ref1(centerPos).ref,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawSphereWires(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSphereWires(centerPos, radius, rings, slices, color),
    () => rl.Core.DrawSphereWires(
      rl.Temp.Vector3$.Ref1(centerPos).ref,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCylinder(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color),
    () => rl.Core.DrawCylinder(
      rl.Temp.Vector3$.Ref1(position).ref,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color),
    () => rl.Core.DrawCylinderEx(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCylinderWires(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color),
    () => rl.Core.DrawCylinderWires(
      rl.Temp.Vector3$.Ref1(position).ref,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color),
    () => rl.Core.DrawCylinderWiresEx(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCapsule(startPos, endPos, radius, slices, rings, color),
    () => rl.Core.DrawCapsule(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color),
    () => rl.Core.DrawCapsuleWires(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPlane(centerPos, size, color),
    () => rl.Core.DrawPlane(
      rl.Temp.Vector3$.Ref1(centerPos).ref,
      rl.Temp.Vector2$.Ref1(size).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawRay(
    RayD ray,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRay(ray, color),
    () => rl.Core.DrawRay(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  @override
  void DrawGrid(
    num slices,
    num spacing,
  ) => run(
    () => RaylibDebugLabels.DrawGrid(slices, spacing),
    () => rl.Core.DrawGrid(
      slices.toInt(),
      spacing.toDouble(),
    ),
  );
    
  @override
  ModelD LoadModel(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadModel(fileName),
    () => rl.Temp.Model$.RefCapture(
      RaylibCaptureIds.LoadModel(fileName),
      (_) => rl.Core.LoadModel(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );
    
  @override
  ModelD LoadModelFromMesh(
    MeshD mesh,
  ) => run(
    () => RaylibDebugLabels.LoadModelFromMesh(mesh),
    () => rl.Temp.Model$.RefCapture(
      RaylibCaptureIds.LoadModelFromMesh(mesh),
      (_) => rl.Core.LoadModelFromMesh(
        rl.Temp.Mesh$.Ref1(mesh).ref,
      ),
    ),
  );
    
  @override
  bool IsModelValid(
    ModelD model,
  ) => run(
    () => RaylibDebugLabels.IsModelValid(model),
    () => rl.Core.IsModelValid(
      rl.Temp.Model$.Ref1(model).ref,
    ),
  );
    
  @override
  void UnloadModel(
    ModelD model,
  ) => run(
    () => RaylibDebugLabels.UnloadModel(model),
    () => rl.Core.UnloadModel(
      model.getOriginalPointerAndDispose().ref,
    ),
  );
    
  @override
  BoundingBoxD GetModelBoundingBox(
    ModelD model,
  ) => run(
    () => RaylibDebugLabels.GetModelBoundingBox(model),
    () => rl.Core.GetModelBoundingBox(
      rl.Temp.Model$.Ref1(model).ref,
    ).toD(),
  );
    
  @override
  void DrawModel(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint
  ) => run(
    () => RaylibDebugLabels.DrawModel(model, position, scale, tint),
    () => rl.Core.DrawModel(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  @override
  void DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint),
    () => rl.Core.DrawModelEx(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(rotationAxis).ref,
      rotationAngle.toDouble(),
      rl.Temp.Vector3$.Ref3(scale).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  @override
  void DrawModelWires(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawModelWires(model, position, scale, tint),
    () => rl.Core.DrawModelWires(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  @override
  void DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint),
    () => rl.Core.DrawModelWiresEx(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(rotationAxis).ref,
      rotationAngle.toDouble(),
      rl.Temp.Vector3$.Ref3(scale).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  @override
  void DrawModelPoints(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawModelPoints(model, position, scale, tint),
    () => rl.Core.DrawModelPoints(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  @override
  void DrawModelPointsEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawModelPointsEx(model, position, rotationAxis, rotationAngle, scale, tint),
    () => rl.Core.DrawModelPointsEx(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(rotationAxis).ref,
      rotationAngle.toDouble(),
      rl.Temp.Vector3$.Ref3(scale).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  @override
  void DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawBoundingBox(box, color),
    () => rl.Core.DrawBoundingBox(
      rl.Temp.BoundingBox$.Ref1(box).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  @override
  void DrawBillboard(
    Camera3DD camera,
    TextureD texture,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawBillboard(camera, texture, position, scale, tint),
    () => rl.Core.DrawBillboard(
      rl.Temp.Camera3D$.Ref1(camera).ref,
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  @override
  void DrawBillboardRec(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector2D size,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawBillboardRec(camera, texture, source, position, size, tint),
    () => rl.Core.DrawBillboardRec(
      rl.Temp.Camera3D$.Ref1(camera).ref,
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Rectangle$.Ref1(source).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector2$.Ref1(size).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  @override
  void DrawBillboardPro(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector3D up,
    Vector2D size,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint),
    () => rl.Core.DrawBillboardPro(
      rl.Temp.Camera3D$.Ref1(camera).ref,
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Rectangle$.Ref1(source).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(up).ref,
      rl.Temp.Vector2$.Ref1(size).ref,
      rl.Temp.Vector2$.Ref2(origin).ref,
      rotation.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
  
  @override
  void UploadMesh(
    MeshD mesh,
    bool dynamic,
  ) => run(
    () => RaylibDebugLabels.UploadMesh(mesh, dynamic),
    () => rl.Temp.Mesh$.RefUpdate1(mesh,
      (p) => rl.Core.UploadMesh(p, dynamic),
    ),
  );
    
  @override
  void UpdateMeshBuffer(
    MeshD mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => run(
    () => RaylibDebugLabels.UpdateMeshBuffer(mesh, index, data, offset),
    () => rl.Core.UpdateMeshBuffer(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      index.toInt(),
      rl.Temp.TypedDataList$.Array(data).cast(),
      data.length,
      offset.toInt(),
    ),
  );
    
  @override
  void UnloadMesh(
    MeshD mesh,
  ) => run(
    () => RaylibDebugLabels.UnloadMesh(mesh),
    () => rl.Core.UnloadMesh(
      rl.Temp.Mesh$.Ref1(mesh).ref,
    ),
  );
    
  @override
  void DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  ) => run(
    () => RaylibDebugLabels.DrawMesh(mesh, material, transform),
    () => rl.Core.DrawMesh(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.Material$.Ref1(material).ref,
      rl.Temp.Matrix$.Ref1(transform).ref,
    ),
  );
    
  @override
  void DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    List<MatrixD> transforms,
  ) => run(
    () => RaylibDebugLabels.DrawMeshInstanced(mesh, material, transforms),
    () => rl.Core.DrawMeshInstanced(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.Material$.Ref1(material).ref,
      rl.Temp.Matrix$.Array(transforms),
      transforms.length,
    ),
  );
    
  @override
  BoundingBoxD GetMeshBoundingBox(
    MeshD mesh,
  ) => run(
    () => RaylibDebugLabels.GetMeshBoundingBox(mesh),
    () => rl.Core.GetMeshBoundingBox(
      rl.Temp.Mesh$.Ref1(mesh).ref,
    ).toD(),
  );
    
  @override
  void GenMeshTangents(
    MeshD mesh,
  ) => run(
    () => RaylibDebugLabels.GenMeshTangents(mesh),
    () => rl.Temp.Mesh$.RefUpdate1(mesh,
      (p) => rl.Core.GenMeshTangents(p),
    ),
  );
    
  @override
  bool ExportMesh(
    MeshD mesh,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportMesh(mesh, fileName),
    () => rl.Core.ExportMesh(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  bool ExportMeshAsCode(
    MeshD mesh,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportMeshAsCode(mesh, fileName),
    () => rl.Core.ExportMeshAsCode(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  MeshD GenMeshPoly(
    num sides,
    num radius,
  ) => run(
    () => RaylibDebugLabels.GenMeshPoly(sides, radius),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshPoly(sides, radius),
      (_) => rl.Core.GenMeshPoly(
        sides.toInt(),
        radius.toDouble(),
      ),
    ),
  );
    
  @override
  MeshD GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => run(
    () => RaylibDebugLabels.GenMeshPlane(width, length, resX, resZ),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshPlane(width, length, resX, resZ),
      (_) => rl.Core.GenMeshPlane(
        width.toDouble(),
        length.toDouble(),
        resX.toInt(),
        resZ.toInt(),
      ),
    ),
  );
    
  @override
  MeshD GenMeshCube(
    num width,
    num height,
    num length,
  ) => run(
    () => RaylibDebugLabels.GenMeshCube(width, height, length),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshCube(width, height, length),
      (_) => rl.Core.GenMeshCube(
        width.toDouble(),
        height.toDouble(),
        length.toDouble(),
      ),
    ),
  );
    
  @override
  MeshD GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => RaylibDebugLabels.GenMeshSphere(radius, rings, slices),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshSphere(radius, rings, slices),
      (_) => rl.Core.GenMeshSphere(
        radius.toDouble(),
        rings.toInt(),
        slices.toInt(),
      ),
    ),
  );
    
  @override
  MeshD GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => RaylibDebugLabels.GenMeshHemiSphere(radius, rings, slices),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshHemiSphere(radius, rings, slices),
      (_) => rl.Core.GenMeshHemiSphere(
        radius.toDouble(),
        rings.toInt(),
        slices.toInt(),
      ),
    ),
  );
    
  @override
  MeshD GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => run(
    () => RaylibDebugLabels.GenMeshCylinder(radius, height, slices),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshCylinder(radius, height, slices),
      (_) => rl.Core.GenMeshCylinder(
        radius.toDouble(),
        height.toDouble(),
        slices.toInt(),
      ),
    ),
  );
    
  @override
  MeshD GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => run(
    () => RaylibDebugLabels.GenMeshCone(radius, height, slices),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshCone(radius, height, slices),
      (_) => rl.Core.GenMeshCone(
        radius.toDouble(),
        height.toDouble(),
        slices.toInt(),
      ),
    ),
  );
    
  @override
  MeshD GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => run(
    () => RaylibDebugLabels.GenMeshTorus(radius, size, radSeg, sides),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshTorus(radius, size, radSeg, sides),
      (_) => rl.Core.GenMeshTorus(
        radius.toDouble(),
        size.toDouble(),
        radSeg.toInt(),
        sides.toInt(),
      ),
    ),
  );
    
  @override
  MeshD GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => run(
    () => RaylibDebugLabels.GenMeshKnot(radius, size, radSeg, sides),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshKnot(radius, size, radSeg, sides),
      (_) => rl.Core.GenMeshKnot(
        radius.toDouble(),
        size.toDouble(),
        radSeg.toInt(),
        sides.toInt(),
      ),
    ),
  );
    
  @override
  MeshD GenMeshHeightmap(
    ImageD heightmap,
    Vector3D size,
  ) => run(
    () => RaylibDebugLabels.GenMeshHeightmap(heightmap, size),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshHeightmap(heightmap, size),
      (_) => rl.Core.GenMeshHeightmap(
        rl.Temp.Image$.Ref1(heightmap).ref,
        rl.Temp.Vector3$.Ref1(size).ref,
      ),
    ),
  );
    
  @override
  MeshD GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  ) => run(
    () => RaylibDebugLabels.GenMeshCubicmap(cubicmap, cubeSize),
    () => rl.Temp.Mesh$.RefCapture(
      RaylibCaptureIds.GenMeshCubicmap(cubicmap, cubeSize),
      (_) => rl.Core.GenMeshCubicmap(
        rl.Temp.Image$.Ref1(cubicmap).ref,
        rl.Temp.Vector3$.Ref1(cubeSize).ref,
      ),
    ),
  );
    
  @override
  List<MaterialD> LoadMaterials(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadMaterials(fileName),
    () {
      final materialCount = rl.Temp.Int$.Ref1();
      final materials = rl.Core.LoadMaterials(
        rl.Temp.String$.ValueOrNull(fileName),
        materialCount,
      );
      return .generate(materialCount.value, (i) => (materials + i).toD());
    },
  );
    
  @override
  MaterialD LoadMaterialDefault() => run(
    () => RaylibDebugLabels.LoadMaterialDefault(),
    () => rl.Temp.Material$.RefCapture(
      RaylibCaptureIds.LoadMaterialDefault(),
      (_) => rl.Core.LoadMaterialDefault(),
    ),
  );
    
  @override
  bool IsMaterialValid(
    MaterialD material,
  ) => run(
    () => RaylibDebugLabels.IsMaterialValid(material),
    () => rl.Core.IsMaterialValid(
      rl.Temp.Material$.Ref1(material).ref,
    ),
  );
    
  @override
  void UnloadMaterial(
    MaterialD material,
  ) => run(
    () => RaylibDebugLabels.UnloadMaterial(material),
    () => rl.Core.UnloadMaterial(
      rl.Temp.Material$.Ref1(material).ref,
    ),
  );
    
  @override
  void SetMaterialTexture(
    MaterialD material,
    MaterialMapIndex mapType,
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.SetMaterialTexture(material, mapType, texture),
    () => material.maps[mapType.value].texture = texture,
  );
    
  @override
  void SetModelMeshMaterial(
    ModelD model,
    num meshId,
    num materialId,
  ) => run(
    () => RaylibDebugLabels.SetModelMeshMaterial(model, meshId, materialId),
    () {
      if (meshId >= model.meshes.length) {
        TraceLog(.LOG_WARNING, "MESH: Id greater than mesh count");
        return;
      }
      if (materialId >= model.materials.length) {
        TraceLog(.LOG_WARNING, "MATERIAL: Id greater than material count");
        return;
      }
      model.meshMaterial[meshId.toInt()] = materialId.toInt();
    },
  );
    
  @override
  List<ModelAnimationD> LoadModelAnimations(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadModelAnimations(fileName),
    () {
      final animCount = rl.Temp.Int$.Ref1();
      final anims = rl.Core.LoadModelAnimations(
        rl.Temp.String$.ValueOrNull(fileName),
        animCount,
      );
      return .generate(animCount.value, (i) => (anims + i).toD());
    },
  );
    
  @override
  void UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  ) => run(
    () => RaylibDebugLabels.UpdateModelAnimation(model, anim, frame),
    () => rl.Core.UpdateModelAnimation(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.ModelAnimation$.Ref1(anim).ref,
      frame.toInt(),
    ),
  );
    
  @override
  void UpdateModelAnimationBones(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  ) => run(
    () => RaylibDebugLabels.UpdateModelAnimationBones(model, anim, frame),
    () => rl.Temp.Model$.RefUpdate1(model,
      (pm) => rl.Temp.ModelAnimation$.RefUpdate1(anim,
        (pma) => rl.Core.UpdateModelAnimationBones(
          pm.ref,
          pma.ref,
          frame.toInt(),
        ),
      ),
    ),
  );
    
  @override
  void UnloadModelAnimation(
    ModelAnimationD anim,
  ) => run(
    () => RaylibDebugLabels.UnloadModelAnimation(anim),
    () => rl.Core.UnloadModelAnimation(
      rl.Temp.ModelAnimation$.Ref1(anim).ref,
    ),
  );
    
  @override
  void UnloadModelAnimations(
    List<ModelAnimationD> animations,
  ) => run(
    () => RaylibDebugLabels.UnloadModelAnimations(animations),
    () => animations.forEach(UnloadModelAnimation),
  );
    
  @override
  bool IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  ) => run(
    () => RaylibDebugLabels.IsModelAnimationValid(model, anim),
    () => rl.Core.IsModelAnimationValid(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.ModelAnimation$.Ref1(anim).ref,
    ),
  );
    
  @override
  bool CheckCollisionSpheres(
    Vector3D center1,
    num radius1,
    Vector3D center2,
    num radius2,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionSpheres(center1, radius1, center2, radius2),
    () => rl.Core.CheckCollisionSpheres(
      rl.Temp.Vector3$.Ref1(center1).ref,
      radius1.toDouble(),
      rl.Temp.Vector3$.Ref2(center2).ref,
      radius2.toDouble(),
    ),
  );
    
  @override
  bool CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionBoxes(box1, box2),
    () => rl.Core.CheckCollisionBoxes(
      rl.Temp.BoundingBox$.Ref1(box1).ref,
      rl.Temp.BoundingBox$.Ref2(box2).ref,
    ),
  );
    
  @override
  bool CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    num radius,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionBoxSphere(box, center, radius),
    () => rl.Core.CheckCollisionBoxSphere(
      rl.Temp.BoundingBox$.Ref1(box).ref,
      rl.Temp.Vector3$.Ref1(center).ref,
      radius.toDouble(),
    ),
  );
    
  @override
  RayCollisionD GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    num radius,
  ) => run(
    () => RaylibDebugLabels.GetRayCollisionSphere(ray, center, radius),
    () => rl.Core.GetRayCollisionSphere(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Vector3$.Ref1(center).ref,
      radius.toDouble(),
    ).toD(),
  );
    
  @override
  RayCollisionD GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  ) => run(
    () => RaylibDebugLabels.GetRayCollisionBox(ray, box),
    () => rl.Core.GetRayCollisionBox(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.BoundingBox$.Ref1(box).ref,
    ).toD(),
  );
    
  @override
  RayCollisionD GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  ) => run(
    () => RaylibDebugLabels.GetRayCollisionMesh(ray, mesh, transform),
    () => rl.Core.GetRayCollisionMesh(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.Matrix$.Ref1(transform).ref,
    ).toD(),
  );
    
  @override
  RayCollisionD GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  ) => run(
    () => RaylibDebugLabels.GetRayCollisionTriangle(ray, p1, p2, p3),
    () => rl.Core.GetRayCollisionTriangle(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Vector3$.Ref1(p1).ref,
      rl.Temp.Vector3$.Ref2(p2).ref,
      rl.Temp.Vector3$.Ref3(p3).ref,
    ).toD(),
  );
    
  @override
  RayCollisionD GetRayCollisionQuad(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
    Vector3D p4,
  ) => run(
    () => RaylibDebugLabels.GetRayCollisionQuad(ray, p1, p2, p3, p4),
    () => rl.Core.GetRayCollisionQuad(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Vector3$.Ref1(p1).ref,
      rl.Temp.Vector3$.Ref2(p2).ref,
      rl.Temp.Vector3$.Ref3(p3).ref,
      rl.Temp.Vector3$.Ref4(p4).ref,
    ).toD(),
  );
}
