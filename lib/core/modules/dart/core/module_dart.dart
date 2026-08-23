part of '../../../raylib_dartified.dart';

class RaylibCoreD extends RaylibCoreModule<Raylib> {

  RaylibCoreD(super.rl);

  @override
  void InitWindow(
    num width,
    num height,
    String title,
  ) => run(
    () => RaylibDebugLabels.InitWindow(width, height, title),
    () => rl.CoreFlat.InitWindow(
      width.toInt(),
      height.toInt(),
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  @override
  void CloseWindow() => run(
    () => RaylibDebugLabels.CloseWindow(),
    () => rl.CoreFlat.CloseWindow(),
  );

  @override
  bool WindowShouldClose() => run(
    () => RaylibDebugLabels.WindowShouldClose(),
    () => rl.CoreFlat.WindowShouldClose(),
  );

  @override
  bool IsWindowReady() => run(
    () => RaylibDebugLabels.IsWindowReady(),
    () => rl.CoreFlat.IsWindowReady(),
  );

  @override
  bool IsWindowFullscreen() => run(
    () => RaylibDebugLabels.IsWindowFullscreen(),
    () => rl.CoreFlat.IsWindowFullscreen(),
  );

  @override
  bool IsWindowHidden() => run(
    () => RaylibDebugLabels.IsWindowHidden(),
    () => rl.CoreFlat.IsWindowHidden(),
  );
    
  @override
  bool IsWindowMinimized() => run(
    () => RaylibDebugLabels.IsWindowMinimized(),
    () => rl.CoreFlat.IsWindowMinimized(),
  );
    
  @override
  bool IsWindowMaximized() => run(
    () => RaylibDebugLabels.IsWindowMaximized(),
    () => rl.CoreFlat.IsWindowMaximized(),
  );
    
  @override
  bool IsWindowFocused() => run(
    () => RaylibDebugLabels.IsWindowFocused(),
    () => rl.CoreFlat.IsWindowFocused(),
  );
    
  @override
  bool IsWindowResized() => run(
    () => RaylibDebugLabels.IsWindowResized(),
    () => rl.CoreFlat.IsWindowResized(),
  );
    
  @override
  bool IsWindowState(
    ConfigFlags flag,
  ) => run(
    () => RaylibDebugLabels.IsWindowState(flag),
    () => rl.CoreFlat.IsWindowState(
      flag.value,
    ),
  );
    
  @override
  void SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => RaylibDebugLabels.SetWindowState(flags),
    () => rl.CoreFlat.SetWindowState(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );
    
  @override
  void ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => RaylibDebugLabels.ClearWindowState(flags),
    () => rl.CoreFlat.ClearWindowState(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );
    
  @override
  void ToggleFullscreen() => run(
    () => RaylibDebugLabels.ToggleFullscreen(),
    () => rl.CoreFlat.ToggleFullscreen(),
  );
    
  @override
  void ToggleBorderlessWindowed() => run(
    () => RaylibDebugLabels.ToggleBorderlessWindowed(),
    () => rl.CoreFlat.ToggleBorderlessWindowed(),
  );
    
  @override
  void MaximizeWindow() => run(
    () => RaylibDebugLabels.MaximizeWindow(),
    () => rl.CoreFlat.MaximizeWindow(),
  );
    
  @override
  void MinimizeWindow() => run(
    () => RaylibDebugLabels.MinimizeWindow(),
    () => rl.CoreFlat.MinimizeWindow(),
  );
    
  @override
  void RestoreWindow() => run(
    () => RaylibDebugLabels.RestoreWindow(),
    () => rl.CoreFlat.RestoreWindow(),
  );
    
  @override
  void SetWindowIcon(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.SetWindowIcon(image),
    () => rl.CoreFlat.SetWindowIcon(
      image,
    ),
  );
    
  @override
  void SetWindowIcons(
    List<ImageD> images,
  ) => run(
    () => RaylibDebugLabels.SetWindowIcons(images),
    () => rl.CoreFlat.SetWindowIcons(
      rl.Temp.Image$.Array(images),
      images.length,
    ),
  );
    
  @override
  void SetWindowTitle(
    String title,
  ) => run(
    () => RaylibDebugLabels.SetWindowTitle(title),
    () => rl.CoreFlat.SetWindowTitle(
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  @override
  void SetWindowPosition(
    num x,
    num y,
  ) => run(
    () => RaylibDebugLabels.SetWindowPosition(x, y),
    () => rl.CoreFlat.SetWindowPosition(
      x.toInt(),
      y.toInt(),
    ),
  );
    
  @override
  void SetWindowMonitor(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.SetWindowMonitor(monitor),
    () => rl.CoreFlat.SetWindowMonitor(
      monitor.toInt(),
    ),
  );
    
  @override
  void SetWindowMinSize(
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.SetWindowMinSize(width, height),
    () => rl.CoreFlat.SetWindowMinSize(
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
    () => rl.CoreFlat.SetWindowMaxSize(
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
    () => rl.CoreFlat.SetWindowSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  void SetWindowOpacity(
    num opacity,
  ) => run(
    () => RaylibDebugLabels.SetWindowOpacity(opacity),
    () => rl.CoreFlat.SetWindowOpacity(
      opacity.toDouble(),
    ),
  );
    
  @override
  void SetWindowFocused() => run(
    () => RaylibDebugLabels.SetWindowFocused(),
    () => rl.CoreFlat.SetWindowFocused(),
  );

  @override
  int GetScreenWidth() => run(
    () => RaylibDebugLabels.GetScreenWidth(),
    () => rl.CoreFlat.GetScreenWidth(),
  );
    
  @override
  int GetScreenHeight() => run(
    () => RaylibDebugLabels.GetScreenHeight(),
    () => rl.CoreFlat.GetScreenHeight(),
  );
    
  @override
  int GetRenderWidth() => run(
    () => RaylibDebugLabels.GetRenderWidth(),
    () => rl.CoreFlat.GetRenderWidth(),
  );
    
  @override
  int GetRenderHeight() => run(
    () => RaylibDebugLabels.GetRenderHeight(),
    () => rl.CoreFlat.GetRenderHeight(),
  );
    
  @override
  int GetMonitorCount() => run(
    () => RaylibDebugLabels.GetMonitorCount(),
    () => rl.CoreFlat.GetMonitorCount(),
  );
    
  @override
  int GetCurrentMonitor() => run(
    () => RaylibDebugLabels.GetCurrentMonitor(),
    () => rl.CoreFlat.GetCurrentMonitor(),
  );
    
  @override
  Vector2D GetMonitorPosition(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorPosition(monitor),
    () => rl.CoreFlat.GetMonitorPosition(
      monitor.toInt(),
    ),
  );
    
  @override
  int GetMonitorWidth(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorWidth(monitor),
    () => rl.CoreFlat.GetMonitorWidth(
      monitor.toInt(),
    ),
  );
    
  @override
  int GetMonitorHeight(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorHeight(monitor),
    () => rl.CoreFlat.GetMonitorHeight(
      monitor.toInt(),
    ),
  );
    
  @override
  int GetMonitorPhysicalWidth(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorPhysicalWidth(monitor),
    () => rl.CoreFlat.GetMonitorPhysicalWidth(
      monitor.toInt(),
    ),
  );
    
  @override
  int GetMonitorPhysicalHeight(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorPhysicalHeight(monitor),
    () => rl.CoreFlat.GetMonitorPhysicalHeight(
      monitor.toInt(),
    ),
  );
    
  @override
  int GetMonitorRefreshRate(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorRefreshRate(monitor),
    () => rl.CoreFlat.GetMonitorRefreshRate(
      monitor.toInt(),
    ),
  );
    
  @override
  Vector2D GetWindowPosition() => run(
    () => RaylibDebugLabels.GetWindowPosition(),
    () => rl.CoreFlat.GetWindowPosition(),
  );
    
  @override
  Vector2D GetWindowScaleDPI() => run(
    () => RaylibDebugLabels.GetWindowScaleDPI(),
    () => rl.CoreFlat.GetWindowScaleDPI(),
  );
    
  @override
  String GetMonitorName(
    num monitor,
  ) => run(
    () => RaylibDebugLabels.GetMonitorName(monitor),
    () => rl.CoreFlat.GetMonitorName(
      monitor.toInt(),
    ).toDartString(),
  );
    
  @override
  void SetClipboardText(
    String text,
  ) => run(
    () => RaylibDebugLabels.SetClipboardText(text),
    () => rl.CoreFlat.SetClipboardText(
      rl.Temp.String$.ValueOrNull(text),
    ),
  );
    
  @override
  String GetClipboardText() => run(
    () => RaylibDebugLabels.GetClipboardText(),
    () => rl.CoreFlat.GetClipboardText().toDartString(),
  );
    
  @override
  ImageD GetClipboardImage() => run(
    () => RaylibDebugLabels.GetClipboardImage(),
    () => rl.CoreFlat.GetClipboardImage(),
  );
    
  @override
  void EnableEventWaiting() => run(
    () => RaylibDebugLabels.EnableEventWaiting(),
    () => rl.CoreFlat.EnableEventWaiting(),
  );
    
  @override
  void DisableEventWaiting() => run(
    () => RaylibDebugLabels.DisableEventWaiting(),
    () => rl.CoreFlat.DisableEventWaiting(),
  );
    
  @override
  void ShowCursor() => run(
    () => RaylibDebugLabels.ShowCursor(),
    () => rl.CoreFlat.ShowCursor(),
  );
    
  @override
  void HideCursor() => run(
    () => RaylibDebugLabels.HideCursor(),
    () => rl.CoreFlat.HideCursor(),
  );
    
  @override
  bool IsCursorHidden() => run(
    () => RaylibDebugLabels.IsCursorHidden(),
    () => rl.CoreFlat.IsCursorHidden(),
  );
    
  @override
  void EnableCursor() => run(
    () => RaylibDebugLabels.EnableCursor(),
    () => rl.CoreFlat.EnableCursor(),
  );
    
  @override
  void DisableCursor() => run(
    () => RaylibDebugLabels.DisableCursor(),
    () => rl.CoreFlat.DisableCursor(),
  );
    
  @override
  bool IsCursorOnScreen() => run(
    () => RaylibDebugLabels.IsCursorOnScreen(),
    () => rl.CoreFlat.IsCursorOnScreen(),
  );
    
  @override
  void ClearBackground(
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ClearBackground(color),
    () => rl.CoreFlat.ClearBackground(
      color,
    ),
  );
    
  @override
  void BeginDrawing() => run(
    () => RaylibDebugLabels.BeginDrawing(),
    () => rl.CoreFlat.BeginDrawing(),
  );
    
  @override
  void EndDrawing() => run(
    () => RaylibDebugLabels.EndDrawing(),
    () => rl.CoreFlat.EndDrawing(),
  );
    
  @override
  void BeginMode2D(
    Camera2DD camera,
  ) => run(
    () => RaylibDebugLabels.BeginMode2D(camera),
    () => rl.CoreFlat.BeginMode2D(
      camera,
    ),
  );
    
  @override
  void EndMode2D() => run(
    () => RaylibDebugLabels.EndMode2D(),
    () => rl.CoreFlat.EndMode2D(),
  );
    
  @override
  void BeginMode3D(
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.BeginMode3D(camera),
    () => rl.CoreFlat.BeginMode3D(
      camera,
    ),
  );
    
  @override
  void EndMode3D() => run(
    () => RaylibDebugLabels.EndMode3D(),
    () => rl.CoreFlat.EndMode3D(),
  );
    
  @override
  void BeginTextureMode(
    RenderTextureD target,
  ) => run(
    () => RaylibDebugLabels.BeginTextureMode(target),
    () => rl.CoreFlat.BeginTextureMode(
      target,
    ),
  );
    
  @override
  void EndTextureMode() => run(
    () => RaylibDebugLabels.EndTextureMode(),
    () => rl.CoreFlat.EndTextureMode(),
  );
    
  @override
  void BeginShaderMode(
    ShaderD shader,
  ) => run(
    () => RaylibDebugLabels.BeginShaderMode(shader),
    () => rl.CoreFlat.BeginShaderMode(
      shader,
    ),
  );
    
  @override
  void EndShaderMode() => run(
    () => RaylibDebugLabels.EndShaderMode(),
    () => rl.CoreFlat.EndShaderMode(),
  );
    
  @override
  void BeginBlendMode(
    BlendMode mode,
  ) => run(
    () => RaylibDebugLabels.BeginBlendMode(mode),
    () => rl.CoreFlat.BeginBlendMode(
      mode.value,
    ),
  );
    
  @override
  void EndBlendMode() => run(
    () => RaylibDebugLabels.EndBlendMode(),
    () => rl.CoreFlat.EndBlendMode(),
  );
    
  @override
  void BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.BeginScissorMode(x, y, width, height),
    () => rl.CoreFlat.BeginScissorMode(
      x.toInt(),
      y.toInt(),
      width.toInt(),
      height.toInt(),
    ),
  );
    
  @override
  void EndScissorMode() => run(
    () => RaylibDebugLabels.EndScissorMode(),
    () => rl.CoreFlat.EndScissorMode(),
  );
    
  @override
  void BeginVrStereoMode(
    VrStereoConfigD config,
  ) => run(
    () => RaylibDebugLabels.BeginVrStereoMode(config),
    () => rl.CoreFlat.BeginVrStereoMode(
      config,
    ),
  );
    
  @override
  void EndVrStereoMode() => run(
    () => RaylibDebugLabels.EndVrStereoMode(),
    () => rl.CoreFlat.EndVrStereoMode(),
  );
    
  @override
  VrStereoConfigD LoadVrStereoConfig(
    VrDeviceInfoD device,
  ) => run(
    () => RaylibDebugLabels.LoadVrStereoConfig(device),
    () => rl.CoreFlat.LoadVrStereoConfig(
      device,
    ),
  );
    
  @override
  void UnloadVrStereoConfig(
    VrStereoConfigD config,
  ) => run(
    () => RaylibDebugLabels.UnloadVrStereoConfig(config),
    () => rl.CoreFlat.UnloadVrStereoConfig(
      config,
    ),
  );
    
  @override
  ShaderD LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => run(
    () => RaylibDebugLabels.LoadShader(vsFileName, fsFileName),
    () => rl.CoreFlat.LoadShader(
      rl.Temp.String$.ValueOrNull(vsFileName),
      rl.Temp.String$.ValueOrNull(fsFileName),
    ),
  );
    
  @override
  ShaderD LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => run(
    () => RaylibDebugLabels.LoadShaderFromMemory(vsCode, fsCode),
    () => rl.CoreFlat.LoadShaderFromMemory(
      rl.Temp.String$.ValueOrNull(vsCode),
      rl.Temp.String$.ValueOrNull(fsCode),
    ),
  );
    
  @override
  bool IsShaderValid(
    ShaderD shader,
  ) => run(
    () => RaylibDebugLabels.IsShaderValid(shader),
    () => rl.CoreFlat.IsShaderValid(
      shader,
    ),
  );
    
  @override
  int GetShaderLocation(
    ShaderD shader,
    String uniformName,
  ) => run(
    () => RaylibDebugLabels.GetShaderLocation(shader, uniformName),
    () => rl.CoreFlat.GetShaderLocation(
      shader,
      rl.Temp.String$.ValueOrNull(uniformName),
    ),
  );
    
  @override
  int GetShaderLocationAttrib(
    ShaderD shader,
    String attribName,
  ) => run(
    () => RaylibDebugLabels.GetShaderLocationAttrib(shader, attribName),
    () => rl.CoreFlat.GetShaderLocationAttrib(
      shader,
      rl.Temp.String$.ValueOrNull(attribName),
    ),
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

        .SHADER_UNIFORM_UINT   ||
        .SHADER_UNIFORM_UIVEC2 ||
        .SHADER_UNIFORM_UIVEC3 ||
        .SHADER_UNIFORM_UIVEC4 => rl.Temp.UnsignedInt$.Array(value),
        
        .SHADER_UNIFORM_SAMPLER2D => rl.Temp.Int$.Array(value),
      };

      rl.CoreFlat.SetShaderValueV(
        shader,
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
    () => rl.CoreFlat.SetShaderValueMatrix(
      shader,
      locIndex.toInt(),
      mat,
    ),
  );
    
  @override
  void SetShaderValueTexture(
    ShaderD shader,
    num locIndex,
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.SetShaderValueTexture(shader, locIndex, texture),
    () => rl.CoreFlat.SetShaderValueTexture(
      shader,
      locIndex.toInt(),
      texture,
    ),
  );
    
  @override
  void UnloadShader(
    ShaderD shader,
  ) => run(
    () => RaylibDebugLabels.UnloadShader(shader),
    () => rl.CoreFlat.UnloadShader(
      shader,
    ),
  );
    
  @override
  RayD GetScreenToWorldRay(
    Vector2D position,
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetScreenToWorldRay(position, camera),
    () => rl.CoreFlat.GetScreenToWorldRay(
      position,
      camera,
    ),
  );
    
  @override
  RayD GetScreenToWorldRayEx(
    Vector2D position,
    Camera3DD camera,
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.GetScreenToWorldRayEx(position, camera, width, height),
    () => rl.CoreFlat.GetScreenToWorldRayEx(
      position,
      camera,
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  Vector2D GetWorldToScreen(
    Vector3D position,
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetWorldToScreen(position, camera),
    () => rl.CoreFlat.GetWorldToScreen(
      position,
      camera,
    ),
  );

  @override
  Vector2D GetWorldToScreenEx(
    Vector3D position,
    Camera3DD camera,
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.GetWorldToScreenEx(position, camera, width, height),
    () => rl.CoreFlat.GetWorldToScreenEx(
      position,
      camera,
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  Vector2D GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => RaylibDebugLabels.GetWorldToScreen2D(position, camera),
    () => rl.CoreFlat.GetWorldToScreen2D(
      position,
      camera,
    ),
  );

  @override
  Vector2D GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => RaylibDebugLabels.GetScreenToWorld2D(position, camera),
    () => rl.CoreFlat.GetScreenToWorld2D(
      position,
      camera,
    ),
  );

  @override
  MatrixD GetCameraMatrix(
    Camera3DD camera,
  ) => run(
    () => RaylibDebugLabels.GetCameraMatrix(camera),
    () => rl.CoreFlat.GetCameraMatrix(
      camera,
    ),
  );

  @override
  MatrixD GetCameraMatrix2D(
    Camera2DD camera,
  ) => run(
    () => RaylibDebugLabels.GetCameraMatrix2D(camera),
    () => rl.CoreFlat.GetCameraMatrix2D(
      camera,
    ),
  );
    
  @override
  void SetTargetFPS(
    num fps,
  ) => run(
    () => RaylibDebugLabels.SetTargetFPS(fps),
    () => rl.CoreFlat.SetTargetFPS(
      fps.toInt(),
    ),
  );

  @override
  double GetFrameTime() => run(
    () => RaylibDebugLabels.GetFrameTime(),
    () => rl.CoreFlat.GetFrameTime(),
  );

  @override
  double GetTime() => run(
    () => RaylibDebugLabels.GetTime(),
    () => rl.CoreFlat.GetTime(),
  );

  @override
  int GetFPS() => run(
    () => RaylibDebugLabels.GetFPS(),
    () => rl.CoreFlat.GetFPS(),
  );

  @override
  void SwapScreenBuffer() => run(
    () => RaylibDebugLabels.SwapScreenBuffer(),
    () => rl.CoreFlat.SwapScreenBuffer(),
  );

  @override
  void PollInputEvents() => run(
    () => RaylibDebugLabels.PollInputEvents(),
    () => rl.CoreFlat.PollInputEvents(),
  );

  @override
  void WaitTime(
    num seconds,
  ) => run(
    () => RaylibDebugLabels.WaitTime(seconds),
    () => rl.CoreFlat.WaitTime(
      seconds.toDouble(),
    ),
  );

  @override
  void SetRandomSeed(
    num seed,
  ) => run(
    () => RaylibDebugLabels.SetRandomSeed(seed),
    () => rl.CoreFlat.SetRandomSeed(
      seed.toInt(),
    ),
  );

  @override
  int GetRandomValue(
    num min,
    num max,
  ) => run(
    () => RaylibDebugLabels.GetRandomValue(min, max),
    () => rl.CoreFlat.GetRandomValue(
      min.toInt(),
      max.toInt(),
    ),
  );

  @override
  List<int> LoadRandomSequence(
    num count,
    num min,
    num max,
  ) => run(
    () => RaylibDebugLabels.LoadRandomSequence(count, min, max),
    () {
      final seq = rl.CoreFlat.LoadRandomSequence(
        count.toInt(),
        min.toInt(),
        max.toInt(),
      );
      final List<int> values = .generate(count.toInt(), (i) => seq[i]);
      rl.CoreFlat.UnloadRandomSequence(seq);
      return values;
    },
  );
  
  @override
  void TakeScreenshot(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.TakeScreenshot(fileName),
    () => rl.CoreFlat.TakeScreenshot(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  void SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => RaylibDebugLabels.SetConfigFlags(flags),
    () => rl.CoreFlat.SetConfigFlags(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );

  @override
  void OpenURL(
    String url,
  ) => run(
    () => RaylibDebugLabels.OpenURL(url),
    () => rl.CoreFlat.OpenURL(
      rl.Temp.String$.ValueOrNull(url),
    ),
  );

  @override
  void TraceLog(
    TraceLogLevel logLevel,
    String text, [
      List<Object?> args = const [],
    ]
  ) => run(
    () => RaylibDebugLabels.TraceLog(logLevel, text),
    () => rl.CoreFlat.TraceLog(
      logLevel.value,
      rl.Temp.String$.ValueOrNull(
        rl.Utils.Format(text, args)
      ),
    ),
  );

  @override
  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => run(
    () => RaylibDebugLabels.SetTraceLogLevel(logLevel),
    () => rl.CoreFlat.SetTraceLogLevel(
      logLevel.value,
    ),
  );

  @override
  void SetTraceLogCallback(
    TraceLogCallbackD? callback
  ) => run(
    () => RaylibDebugLabels.SetTraceLogCallback(callback),
    () => rl.CoreFlat.SetTraceLogCallback(
      callback?.attach() ?? MemoryPointer.nullptr.cast(),
    ),
  );
    
  @override
  void SetLoadFileDataCallback(
    LoadFileDataCallbackD? callback
  ) => run(
    () => RaylibDebugLabels.SetLoadFileDataCallback(callback),
    () => rl.CoreFlat.SetLoadFileDataCallback(
      callback?.attach() ?? MemoryPointer.nullptr.cast(),
    ),
  );
    
  @override
  void SetSaveFileDataCallback(
    SaveFileDataCallbackD? callback
  ) => run(
    () => RaylibDebugLabels.SetSaveFileDataCallback(callback),
    () => rl.CoreFlat.SetSaveFileDataCallback(
      callback?.attach() ?? MemoryPointer.nullptr.cast(),
    ),
  );
    
  @override
  void SetLoadFileTextCallback(
    LoadFileTextCallbackD? callback
  ) => run(
    () => RaylibDebugLabels.SetLoadFileTextCallback(callback),
    () => rl.CoreFlat.SetLoadFileTextCallback(
      callback?.attach() ?? MemoryPointer.nullptr.cast(),
    ),
  );
    
  @override
  void SetSaveFileTextCallback(
    SaveFileTextCallbackD? callback
  ) => run(
    () => RaylibDebugLabels.SetSaveFileTextCallback(callback),
    () => rl.CoreFlat.SetSaveFileTextCallback(
      callback?.attach() ?? MemoryPointer.nullptr.cast(),
    ),
  );
    
  @override
  Uint8List LoadFileData(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadFileData(fileName),
    () {
      final fileSize = rl.Temp.Int$.Ref1();
      final data = rl.CoreFlat.LoadFileData(
        rl.Temp.String$.ValueOrNull(fileName),
        fileSize,
      );
      final bytes = rl.Temp.UnsignedChar$.asView(data, fileSize.value);
      final listData = Uint8List.fromList(bytes);
      rl.CoreFlat.UnloadFileData(data);
      return listData;
    },
  );

  @override
  bool SaveFileData(
    String fileName,
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.SaveFileData(fileName, data),
    () => rl.CoreFlat.SaveFileData(
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
    () => rl.CoreFlat.ExportDataAsCode(
      rl.Temp.Uint8$.Array(data),
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
      final text = rl.CoreFlat.LoadFileText(
        rl.Temp.String$.ValueOrNull(fileName),
      );
      final fileText = text.toDartString();
      rl.CoreFlat.UnloadFileText(text);
      return fileText;
    },
  );

  @override
  bool SaveFileText(
    String fileName,
    String text,
  ) => run(
    () => RaylibDebugLabels.SaveFileText(fileName, text),
    () => rl.CoreFlat.SaveFileText(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  int FileRename(
    String fileName,
    String fileRename,
  ) => run(
    () => RaylibDebugLabels.FileRename(fileName, fileRename),
    () => rl.CoreFlat.FileRename(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(fileRename),
    ),
  );
  
  @override
  int FileRemove(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.FileRemove(fileName),
    () => rl.CoreFlat.FileRemove(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
  
  @override
  int FileCopy(
    String srcPath,
    String dstPath,
  ) => run(
    () => RaylibDebugLabels.FileCopy(srcPath, dstPath),
    () => rl.CoreFlat.FileCopy(
      rl.Temp.String$.ValueOrNull(srcPath),
      rl.Temp.String$.ValueOrNull(dstPath),
    ),
  );
  
  @override
  int FileMove(
    String srcPath,
    String dstPath,
  ) => run(
    () => RaylibDebugLabels.FileMove(srcPath, dstPath),
    () => rl.CoreFlat.FileMove(
      rl.Temp.String$.ValueOrNull(srcPath),
      rl.Temp.String$.ValueOrNull(dstPath),
    ),
  );
  
  @override
  int FileTextReplace(
    String fileName,
    String search,
    String replacement,
  ) => run(
    () => RaylibDebugLabels.FileTextReplace(fileName, search, replacement),
    () => rl.CoreFlat.FileTextReplace(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(search),
      rl.Temp.String$.ValueOrNull(replacement),
    ),
  );
  
  @override
  int FileTextFindIndex(
    String fileName,
    String search,
  ) => run(
    () => RaylibDebugLabels.FileTextFindIndex(fileName, search),
    () => rl.CoreFlat.FileTextFindIndex(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(search),
    ),
  );
    
  @override
  bool FileExists(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.FileExists(fileName),
    () => rl.CoreFlat.FileExists(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  bool DirectoryExists(
    String dirPath,
  ) => run(
    () => RaylibDebugLabels.DirectoryExists(dirPath),
    () => rl.CoreFlat.DirectoryExists(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );

  @override
  bool IsFileExtension(
    String fileName,
    String ext,
  ) => run(
    () => RaylibDebugLabels.IsFileExtension(fileName, ext),
    () => rl.CoreFlat.IsFileExtension(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(ext),
    ),
  );

  @override
  int GetFileLength(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.GetFileLength(fileName),
    () => rl.CoreFlat.GetFileLength(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  String GetFileExtension(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.GetFileExtension(fileName),
    () => rl.CoreFlat.GetFileExtension(
      rl.Temp.String$.ValueOrNull(fileName),
    ).toDartString(),
  );

  @override
  String GetFileName(
    String filePath,
  ) => run(
    () => RaylibDebugLabels.GetFileName(filePath),
    () => rl.CoreFlat.GetFileName(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  @override
  String GetFileNameWithoutExt(
    String filePath,
  ) => run(
    () => RaylibDebugLabels.GetFileNameWithoutExt(filePath),
    () => rl.CoreFlat.GetFileNameWithoutExt(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  @override
  int GetDirectoryFileCount(
    String dirPath, 
  ) => run(
    () => RaylibDebugLabels.GetDirectoryFileCount(dirPath),
    () => rl.CoreFlat.GetDirectoryFileCount(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );
  
  @override
  int GetDirectoryFileCountEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => run(
    () => RaylibDebugLabels.GetDirectoryFileCountEx(basePath, filter, scanSubdirs),
    () => rl.CoreFlat.GetDirectoryFileCountEx(
      rl.Temp.String$.ValueOrNull(basePath),
      rl.Temp.String$.ValueOrNull(filter),
      scanSubdirs,
    ),
  );

  @override
  String GetDirectoryPath(
    String filePath,
  ) => run(
    () => RaylibDebugLabels.GetDirectoryPath(filePath),
    () => rl.CoreFlat.GetDirectoryPath(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  @override
  String GetPrevDirectoryPath(
    String dirPath,
  ) => run(
    () => RaylibDebugLabels.GetPrevDirectoryPath(dirPath),
    () => rl.CoreFlat.GetPrevDirectoryPath(
      rl.Temp.String$.ValueOrNull(dirPath),
    ).toDartString(),
  );

  @override
  String GetWorkingDirectory() => run(
    () => RaylibDebugLabels.GetWorkingDirectory(),
    () => rl.CoreFlat.GetWorkingDirectory().toDartString(),
  );

  @override
  String GetApplicationDirectory() => run(
    () => RaylibDebugLabels.GetApplicationDirectory(),
    () => rl.CoreFlat.GetApplicationDirectory().toDartString(),
  );

  @override
  int MakeDirectory(
    String dirPath,
  ) => run(
    () => RaylibDebugLabels.MakeDirectory(dirPath),
    () => rl.CoreFlat.MakeDirectory(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );

  @override
  bool ChangeDirectory(
    String dir,
  ) => run(
    () => RaylibDebugLabels.ChangeDirectory(dir),
    () => rl.CoreFlat.ChangeDirectory(
      rl.Temp.String$.ValueOrNull(dir),
    ),
  );

  @override
  bool IsPathFile(
    String path,
  ) => run(
    () => RaylibDebugLabels.IsPathFile(path),
    () => rl.CoreFlat.IsPathFile(
      rl.Temp.String$.ValueOrNull(path),
    ),
  );

  @override
  bool IsFileNameValid(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.IsFileNameValid(fileName),
    () => rl.CoreFlat.IsFileNameValid(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  FilePathListD LoadDirectoryFiles(
    String dirPath,
  ) => run(
    () => RaylibDebugLabels.LoadDirectoryFiles(dirPath),
    () => rl.CoreFlat.LoadDirectoryFiles(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );
    
  @override
  FilePathListD LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => run(
    () => RaylibDebugLabels.LoadDirectoryFilesEx(basePath, filter, scanSubdirs),
    () => rl.CoreFlat.LoadDirectoryFilesEx(
      rl.Temp.String$.ValueOrNull(basePath),
      rl.Temp.String$.ValueOrNull(filter),
      scanSubdirs,
    ),
  );

  @override
  void UnloadDirectoryFiles(
    FilePathListD files,
  ) => run(
    () => RaylibDebugLabels.UnloadDirectoryFiles(files),
    () => rl.CoreFlat.UnloadDirectoryFiles(
      files,
    ),
  );
    
  @override
  bool IsFileDropped() => run(
    () => RaylibDebugLabels.IsFileDropped(),
    () => rl.CoreFlat.IsFileDropped(),
  );
    
  @override
  FilePathListD LoadDroppedFiles() => run(
    () => RaylibDebugLabels.LoadDroppedFiles(),
    () => rl.CoreFlat.LoadDroppedFiles(),
  );

  @override
  void UnloadDroppedFiles(
    FilePathListD files,
  ) => run(
    () => RaylibDebugLabels.UnloadDroppedFiles(files),
    () => rl.CoreFlat.UnloadDroppedFiles(
      files,
    ),
  );

  @override
  int GetFileModTime(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.GetFileModTime(fileName),
    () => rl.CoreFlat.GetFileModTime(
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
      final compData = rl.CoreFlat.CompressData(
        rl.Temp.Uint8$.Array(data),
        data.length,
        compDataSize,
      );
      final newData = rl.Temp.UnsignedChar$.asTypedList(compData, compDataSize.value);
      compData.free();
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
      final data = rl.CoreFlat.DecompressData(
        rl.Temp.Uint8$.Array(compData),
        compData.length,
        dataSize,
      );
      final newData = rl.Temp.UnsignedChar$.asTypedList(data, dataSize.value);
      data.free();
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
      final outputData = rl.CoreFlat.EncodeDataBase64(
        rl.Temp.Uint8$.Array(data),
        data.length,
        outputSize,
      );
      final newData = rl.Temp.Char$.asTypedList(outputData, outputSize.value);
      outputData.free();
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
      final outputData = rl.CoreFlat.DecodeDataBase64(
        rl.Temp.Int8$.Array(data),
        outputSize,
      );
      final newData = rl.Temp.UnsignedChar$.asTypedList(outputData, outputSize.value);
      outputData.free();
      return newData;
    },
  );

  @override
  int ComputeCRC32(
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.ComputeCRC32(data),
    () => rl.CoreFlat.ComputeCRC32(
      rl.Temp.Uint8$.Array(data),
      data.length,
    ),
  );

  @override
  Uint8List ComputeMD5(
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.ComputeMD5(data),
    () => .fromList(rl.Temp.UnsignedInt$.ToLEBytes(
      rl.CoreFlat.ComputeMD5(
        rl.Temp.Uint8$.Array(data),
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
      rl.CoreFlat.ComputeSHA1(
        rl.Temp.Uint8$.Array(data),
        data.length,
      ),
      rl.Utils.sha1Uint32HashLength,
    )),
  );

  @override
  Uint8List ComputeSHA256(
    Uint8List data,
  ) => run(
    () => RaylibDebugLabels.ComputeSHA256(data),
    () => .fromList(rl.Temp.UnsignedInt$.ToBEBytes(
      rl.CoreFlat.ComputeSHA256(
        rl.Temp.Uint8$.Array(data),
        data.length,
      ),
      rl.Utils.sha256Uint32HashLength,
    )),
  );
    
  @override
  AutomationEventListD LoadAutomationEventList(
    String? fileName,
  ) => run(
    () => RaylibDebugLabels.LoadAutomationEventList(fileName),
    () => rl.CoreFlat.LoadAutomationEventList(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  void UnloadAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => RaylibDebugLabels.UnloadAutomationEventList(list),
    () => rl.CoreFlat.UnloadAutomationEventList(
      list,
    ),
  );
    
  @override
  bool ExportAutomationEventList(
    AutomationEventListD list,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportAutomationEventList(list, fileName),
    () => rl.CoreFlat.ExportAutomationEventList(
      list,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  void SetAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => RaylibDebugLabels.SetAutomationEventList(list),
    () => rl.CoreFlat.SetAutomationEventList(
      rl.Temp.AutomationEventList$.Ref1(list),
    ),
  );
    
  @override
  void SetAutomationEventBaseFrame(
    int frame,
  ) => run(
    () => RaylibDebugLabels.SetAutomationEventBaseFrame(frame),
    () => rl.CoreFlat.SetAutomationEventBaseFrame(
      frame,
    ),
  );
    
  @override
  void StartAutomationEventRecording() => run(
    () => RaylibDebugLabels.StartAutomationEventRecording(),
    () => rl.CoreFlat.StartAutomationEventRecording(),
  );

  @override
  void StopAutomationEventRecording() => run(
    () => RaylibDebugLabels.StopAutomationEventRecording(),
    () => rl.CoreFlat.StopAutomationEventRecording(),
  );
    
  @override
  void PlayAutomationEvent(
    AutomationEventD event,
  ) => run(
    () => RaylibDebugLabels.PlayAutomationEvent(event),
    () => rl.CoreFlat.PlayAutomationEvent(
      event,
    ),
  );

  @override
  bool IsKeyPressed(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyPressed(key),
    () => rl.CoreFlat.IsKeyPressed(
      key.value,
    ),
  );

  @override
  bool IsKeyPressedRepeat(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyPressedRepeat(key),
    () => rl.CoreFlat.IsKeyPressedRepeat(
      key.value,
    ),
  );

  @override
  bool IsKeyDown(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyDown(key),
    () => rl.CoreFlat.IsKeyDown(
      key.value,
    ),
  );

  @override
  bool IsKeyReleased(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyReleased(key),
    () => rl.CoreFlat.IsKeyReleased(
      key.value,
    ),
  );

  @override
  bool IsKeyUp(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.IsKeyUp(key),
    () => rl.CoreFlat.IsKeyUp(
      key.value,
    ),
  );

  @override
  String GetKeyName(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.GetKeyName(key),
    () => rl.CoreFlat.GetKeyName(
      key.value,
    ).toDartString(),
  );

  @override
  int GetKeyPressed() => run(
    () => RaylibDebugLabels.GetKeyPressed(),
    () => rl.CoreFlat.GetKeyPressed(),
  );

  @override
  int GetCharPressed() => run(
    () => RaylibDebugLabels.GetCharPressed(),
    () => rl.CoreFlat.GetCharPressed(),
  );

  @override
  void SetExitKey(
    KeyboardKey key,
  ) => run(
    () => RaylibDebugLabels.SetExitKey(key),
    () => rl.CoreFlat.SetExitKey(
      key.value,
    ),
  );

  @override
  bool IsGamepadAvailable(
    num gamepad,
  ) => run(
    () => RaylibDebugLabels.IsGamepadAvailable(gamepad),
    () => rl.CoreFlat.IsGamepadAvailable(
      gamepad.toInt(),
    ),
  );

  @override
  String GetGamepadName(
    num gamepad,
  ) => run(
    () => RaylibDebugLabels.GetGamepadName(gamepad),
    () => rl.CoreFlat.GetGamepadName(
      gamepad.toInt(),
    ).toDartString(),
  );

  @override
  bool IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => RaylibDebugLabels.IsGamepadButtonPressed(gamepad, button),
    () => rl.CoreFlat.IsGamepadButtonPressed(
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
    () => rl.CoreFlat.IsGamepadButtonDown(
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
    () => rl.CoreFlat.IsGamepadButtonReleased(
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
    () => rl.CoreFlat.IsGamepadButtonUp(
      gamepad.toInt(),
      button.value,
    ),
  );

  @override
  GamepadButton GetGamepadButtonPressed() => run(
    () => RaylibDebugLabels.GetGamepadButtonPressed(),
    () => .fromValue(rl.CoreFlat.GetGamepadButtonPressed()),
  );

  @override
  int GetGamepadAxisCount(
    num gamepad,
  ) => run(
    () => RaylibDebugLabels.GetGamepadAxisCount(gamepad),
    () => rl.CoreFlat.GetGamepadAxisCount(
      gamepad.toInt(),
    ),
  );

  @override
  double GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => run(
    () => RaylibDebugLabels.GetGamepadAxisMovement(gamepad, axis),
    () => rl.CoreFlat.GetGamepadAxisMovement(
      gamepad.toInt(),
      axis.value,
    ),
  );

  @override
  int SetGamepadMappings(
    String mappings,
  ) => run(
    () => RaylibDebugLabels.SetGamepadMappings(mappings),
    () => rl.CoreFlat.SetGamepadMappings(
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
    () => rl.CoreFlat.SetGamepadVibration(
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
    () => rl.CoreFlat.IsMouseButtonPressed(
      button.value,
    ),
  );

  @override
  bool IsMouseButtonDown(
    MouseButton button,
  ) => run(
    () => RaylibDebugLabels.IsMouseButtonDown(button),
    () => rl.CoreFlat.IsMouseButtonDown(
      button.value,
    ),
  );

  @override
  bool IsMouseButtonReleased(
    MouseButton button,
  ) => run(
    () => RaylibDebugLabels.IsMouseButtonReleased(button),
    () => rl.CoreFlat.IsMouseButtonReleased(
      button.value,
    ),
  );

  @override
  bool IsMouseButtonUp(
    MouseButton button,
  ) => run(
    () => RaylibDebugLabels.IsMouseButtonUp(button),
    () => rl.CoreFlat.IsMouseButtonUp(
      button.value,
    ),
  );

  @override
  int GetMouseX() => run(
    () => RaylibDebugLabels.GetMouseX(),
    () => rl.CoreFlat.GetMouseX(),
  );

  @override
  int GetMouseY() => run(
    () => RaylibDebugLabels.GetMouseY(),
    () => rl.CoreFlat.GetMouseY(),
  );

  @override
  Vector2D GetMousePosition() => run(
    () => RaylibDebugLabels.GetMousePosition(),
    () => rl.CoreFlat.GetMousePosition(),
  );

  @override
  Vector2D GetMouseDelta() => run(
    () => RaylibDebugLabels.GetMouseDelta(),
    () => rl.CoreFlat.GetMouseDelta(),
  );

  @override
  void SetMousePosition(
    num x,
    num y,
  ) => run(
    () => RaylibDebugLabels.SetMousePosition(x, y),
    () => rl.CoreFlat.SetMousePosition(
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
    () => rl.CoreFlat.SetMouseOffset(
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
    () => rl.CoreFlat.SetMouseScale(
      scaleX.toDouble(),
      scaleY.toDouble(),
    ),
  );

  @override
  double GetMouseWheelMove() => run(
    () => RaylibDebugLabels.GetMouseWheelMove(),
    () => rl.CoreFlat.GetMouseWheelMove(),
  );

  @override
  Vector2D GetMouseWheelMoveV() => run(
    () => RaylibDebugLabels.GetMouseWheelMoveV(),
    () => rl.CoreFlat.GetMouseWheelMoveV(),
  );

  @override
  void SetMouseCursor(
    MouseCursor cursor,
  ) => run(
    () => RaylibDebugLabels.SetMouseCursor(cursor),
    () => rl.CoreFlat.SetMouseCursor(
      cursor.value,
    ),
  );

  @override
  int GetTouchX() => run(
    () => RaylibDebugLabels.GetTouchX(),
    () => rl.CoreFlat.GetTouchX(),
  );

  @override
  int GetTouchY() => run(
    () => RaylibDebugLabels.GetTouchY(),
    () => rl.CoreFlat.GetTouchY(),
  );

  @override
  Vector2D GetTouchPosition(
    num index,
  ) => run(
    () => RaylibDebugLabels.GetTouchPosition(index),
    () => rl.CoreFlat.GetTouchPosition(
      index.toInt(),
    ),
  );

  @override
  int GetTouchPointId(
    num index,
  ) => run(
    () => RaylibDebugLabels.GetTouchPointId(index),
    () => rl.CoreFlat.GetTouchPointId(
      index.toInt(),
    ),
  );

  @override
  int GetTouchPointCount() => run(
    () => RaylibDebugLabels.GetTouchPointCount(),
    () => rl.CoreFlat.GetTouchPointCount(),
  );

  @override
  void SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => run(
    () => RaylibDebugLabels.SetGesturesEnabled(flags),
    () => rl.CoreFlat.SetGesturesEnabled(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );

  @override
  bool IsGestureDetected(
    Gesture key,
  ) => run(
    () => RaylibDebugLabels.IsGestureDetected(key),
    () => rl.CoreFlat.IsGestureDetected(
      key.value,
    ),
  );

  @override
  Gesture GetGestureDetected() => run(
    () => RaylibDebugLabels.GetGestureDetected(),
    () => .fromValue(rl.CoreFlat.GetGestureDetected()),
  );

  @override
  double GetGestureHoldDuration() => run(
    () => RaylibDebugLabels.GetGestureHoldDuration(),
    () => rl.CoreFlat.GetGestureHoldDuration(),
  );

  @override
  Vector2D GetGestureDragVector() => run(
    () => RaylibDebugLabels.GetGestureDragVector(),
    () => rl.CoreFlat.GetGestureDragVector(),
  );

  @override
  double GetGestureDragAngle() => run(
    () => RaylibDebugLabels.GetGestureDragAngle(),
    () => rl.CoreFlat.GetGestureDragAngle(),
  );

  @override
  Vector2D GetGesturePinchVector() => run(
    () => RaylibDebugLabels.GetGesturePinchVector(),
    () => rl.CoreFlat.GetGesturePinchVector(),
  );

  @override
  double GetGesturePinchAngle() => run(
    () => RaylibDebugLabels.GetGesturePinchAngle(),
    () => rl.CoreFlat.GetGesturePinchAngle(),
  );

  @override
  void ProcessGestureEvent(
    GestureEventD event,
  ) => run(
    () => RaylibDebugLabels.ProcessGestureEvent(event),
    () => rl.CoreFlat.ProcessGestureEvent(
      event,
    ),
  );
  
  @override
  void UpdateGestures() => run(
    () => RaylibDebugLabels.UpdateGestures(),
    () => rl.CoreFlat.UpdateGestures(),
  );
    
  @override
  void UpdateCamera(
    Camera3DD camera,
    CameraMode mode,
  ) => run(
    () => RaylibDebugLabels.UpdateCamera(camera, mode),
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (p) => rl.CoreFlat.UpdateCamera(
        p,
        mode.value,
      ),
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
      (p) => rl.CoreFlat.UpdateCameraPro(
        p,
        movement,
        rotation,
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
    () => rl.CoreFlat.SetShapesTexture(
      texture,
      source,
    ),
  );

  @override
  TextureD GetShapesTexture() => run(
    () => RaylibDebugLabels.GetShapesTexture(),
    () => rl.CoreFlat.GetShapesTexture(),
  );

  @override
  RectangleD GetShapesTextureRectangle() => run(
    () => RaylibDebugLabels.GetShapesTextureRectangle(),
    () => rl.CoreFlat.GetShapesTextureRectangle(),
  );

  @override
  void DrawPixel(
    num posX,
    num posY,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPixel(posX, posY, color),
    () => rl.CoreFlat.DrawPixel(
      posX.toInt(),
      posY.toInt(),
      color,
    ),
  );

  @override
  void DrawPixelV(
    Vector2D position,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPixelV(position, color),
    () => rl.CoreFlat.DrawPixelV(
      position,
      color,
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
    () => rl.CoreFlat.DrawLine(
      startPosX.toInt(),
      startPosY.toInt(),
      endPosX.toInt(),
      endPosY.toInt(),
      color,
    ),
  );

  @override
  void DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLineV(startPos, endPos, color),
    () => rl.CoreFlat.DrawLineV(
      startPos,
      endPos,
      color,
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
    () => rl.CoreFlat.DrawLineEx(
      startPos,
      endPos,
      thick.toDouble(),
      color,
    ),
  );

  @override
  void DrawLineStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLineStrip(points, color),
    () => rl.CoreFlat.DrawLineStrip(
      rl.Temp.Vector2$.Array(points),
      points.length,
      color,
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
    () => rl.CoreFlat.DrawLineBezier(
      startPos,
      endPos,
      thick.toDouble(),
      color,
    ),
  );

  @override
  void DrawLineDashed(
    Vector2D startPos,
    Vector2D endPos,
    num dashSize,
    num spaceSize,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color),
    () => rl.CoreFlat.DrawLineDashed(
      startPos,
      endPos,
      dashSize.toInt(),
      spaceSize.toInt(),
      color,
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
    () => rl.CoreFlat.DrawCircle(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawCircleSector(
      center,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
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
    () => rl.CoreFlat.DrawCircleSectorLines(
      center,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  @override
  void DrawCircleGradient(
    Vector2D center,
    num radius,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => RaylibDebugLabels.DrawCircleGradient(center, radius, inner, outer),
    () => rl.CoreFlat.DrawCircleGradient(
      center,
      radius.toDouble(),
      inner,
      outer,
    ),
  );

  @override
  void DrawCircleV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCircleV(center, radius, color),
    () => rl.CoreFlat.DrawCircleV(
      center,
      radius.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawCircleLines(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      color,
    ),
  );

  @override
  void DrawCircleLinesV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCircleLinesV(center, radius, color),
    () => rl.CoreFlat.DrawCircleLinesV(
      center,
      radius.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawEllipse(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  @override
  void DrawEllipseV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawEllipseV(center, radiusH, radiusV, color),
    () => rl.CoreFlat.DrawEllipseV(
      center,
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawEllipseLines(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  @override
  void DrawEllipseLinesV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawEllipseLinesV(center, radiusH, radiusV, color),
    () => rl.CoreFlat.DrawEllipseLinesV(
      center,
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawRing(
      center,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
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
    () => rl.CoreFlat.DrawRingLines(
      center,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
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
    () => rl.CoreFlat.DrawRectangle(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  @override
  void DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleV(position, size, color),
    () => rl.CoreFlat.DrawRectangleV(
      position,
      size,
      color,
    ),
  );

  @override
  void DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleRec(rec, color),
    () => rl.CoreFlat.DrawRectangleRec(
      rec,
      color,
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
    () => rl.CoreFlat.DrawRectanglePro(
      rec,
      origin,
      rotation.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawRectangleGradientV(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      top,
      bottom,
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
    () => rl.CoreFlat.DrawRectangleGradientH(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      left,
      right,
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
    () => rl.CoreFlat.DrawRectangleGradientEx(
      rec,
      topLeft,
      bottomLeft,
      topRight,
      bottomRight,
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
    () => rl.CoreFlat.DrawRectangleLines(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  @override
  void DrawRectangleLinesEx(
    RectangleD rec,
    num lineThick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRectangleLinesEx(rec, lineThick, color),
    () => rl.CoreFlat.DrawRectangleLinesEx(
      rec,
      lineThick.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawRectangleRounded(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      color,
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
    () => rl.CoreFlat.DrawRectangleRoundedLines(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      color,
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
    () => rl.CoreFlat.DrawRectangleRoundedLinesEx(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      lineThick.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawTriangle(
      v1,
      v2,
      v3,
      color,
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
    () => rl.CoreFlat.DrawTriangleLines(
      v1,
      v2,
      v3,
      color,
    ),
  );

  @override
  void DrawTriangleFan(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawTriangleFan(points, color),
    () => rl.CoreFlat.DrawTriangleFan(
      rl.Temp.Vector2$.Array(points),
      points.length,
      color,
    ),
  );

  @override
  void DrawTriangleStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawTriangleStrip(points, color),
    () => rl.CoreFlat.DrawTriangleStrip(
      rl.Temp.Vector2$.Array(points),
      points.length,
      color,
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
    () => rl.CoreFlat.DrawPoly(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawPolyLines(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawPolyLinesEx(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      lineThick.toDouble(),
      color,
    ),
  );

  @override
  void DrawSplineLinear(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineLinear(points, thick, color),
    () => rl.CoreFlat.DrawSplineLinear(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  @override
  void DrawSplineBasis(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineBasis(points, thick, color),
    () => rl.CoreFlat.DrawSplineBasis(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  @override
  void DrawSplineCatmullRom(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineCatmullRom(points, thick, color),
    () => rl.CoreFlat.DrawSplineCatmullRom(
      rl.Temp.Vector2$.Array(points),
      points.length, 
      thick.toDouble(), 
      color,
    ),
  );

  @override
  void DrawSplineBezierQuadratic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineBezierQuadratic(points, thick, color),
    () => rl.CoreFlat.DrawSplineBezierQuadratic(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  @override
  void DrawSplineBezierCubic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSplineBezierCubic(points, thick, color),
    () => rl.CoreFlat.DrawSplineBezierCubic(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawSplineSegmentLinear(
      p1,
      p2,
      thick.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawSplineSegmentBasis(
      p1,
      p2,
      p3,
      p4,
      thick.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawSplineSegmentCatmullRom(
      p1,
      p2,
      p3,
      p4,
      thick.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawSplineSegmentBezierQuadratic(
      p1,
      c2,
      p3,
      thick.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawSplineSegmentBezierCubic(
      p1,
      c2,
      c3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  @override
  Vector2D GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    num t,
  ) => run(
    () => RaylibDebugLabels.GetSplinePointLinear(startPos, endPos, t),
    () => rl.CoreFlat.GetSplinePointLinear(
      startPos,
      endPos,
      t.toDouble(),
    ),
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
    () => rl.CoreFlat.GetSplinePointBasis(
      p1,
      p2,
      p3,
      p4,
      t.toDouble(),
    ),
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
    () => rl.CoreFlat.GetSplinePointCatmullRom(
      p1,
      p2,
      p3,
      p4,
      t.toDouble(),
    ),
  );

  @override
  Vector2D GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num t,
  ) => run(
    () => RaylibDebugLabels.GetSplinePointBezierQuad(p1, c2, p3, t),
    () => rl.CoreFlat.GetSplinePointBezierQuad(
      p1,
      c2,
      p3,
      t.toDouble(),
    ),
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
    () => rl.CoreFlat.GetSplinePointBezierCubic(
      p1,
      c2,
      c3,
      p4,
      t.toDouble(),
    ),
  );

  @override
  bool CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionRecs(rec1, rec2),
    () => rl.CoreFlat.CheckCollisionRecs(
      rec1,
      rec2,
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
    () => rl.CoreFlat.CheckCollisionCircles(
      center1,
      radius1.toDouble(),
      center2,
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
    () => rl.CoreFlat.CheckCollisionCircleRec(
      center,
      radius.toDouble(),
      rec,
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
    () => rl.CoreFlat.CheckCollisionCircleLine(
      center,
      radius.toDouble(),
      p1,
      p2,
    ),
  );

  @override
  bool CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionPointRec(point, rec),
    () => rl.CoreFlat.CheckCollisionPointRec(
      point,
      rec,
    ),
  );
    
  @override
  bool CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    num radius,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionPointCircle(point, center, radius),
    () => rl.CoreFlat.CheckCollisionPointCircle(
      point,
      center,
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
    () => rl.CoreFlat.CheckCollisionPointTriangle(
      point,
      p1,
      p2,
      p3,
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
    () => rl.CoreFlat.CheckCollisionPointLine(
      point,
      p1,
      p2,
      threshold.toInt(),
    ),
  );

  @override
  bool CheckCollisionPointPoly(
    Vector2D point,
    List<Vector2D> points,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionPointPoly(point, points),
    () => rl.CoreFlat.CheckCollisionPointPoly(
      point,
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
      final result = rl.CoreFlat.CheckCollisionLines(
        startPos1,
        endPos1,
        startPos2,
        endPos2,
        collisionPoint,
      );
      return (result, collisionPoint.ref);
    },
  );

  @override
  RectangleD GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => RaylibDebugLabels.GetCollisionRec(rec1, rec2),
    () => rl.CoreFlat.GetCollisionRec(
      rec1,
      rec2,
    ),
  );

  @override
  ImageD LoadImage(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadImage(fileName),
    () => rl.CoreFlat.LoadImage(
      rl.Temp.String$.ValueOrNull(fileName),
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
    () => rl.CoreFlat.LoadImageRaw(
      rl.Temp.String$.ValueOrNull(fileName),
      width.toInt(),
      height.toInt(),
      format.value,
      headerSize.toInt(),
    ),
  );

  @override
  ImageD LoadImageAnim(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadImageAnim(fileName),
    () {
      final frames = rl.Temp.Int$.Ref1();
      final image = rl.CoreFlat.LoadImageAnim(
        rl.Temp.String$.ValueOrNull(fileName),
        frames,
      );
      image.frameCount = frames.value;
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
      final image = rl.CoreFlat.LoadImageAnimFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
        frames,
      );
      image.frameCount = frames.value;
      return image;
    },
  );

  @override
  ImageD LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => RaylibDebugLabels.LoadImageFromMemory(fileType, fileData),
    () => rl.CoreFlat.LoadImageFromMemory(
      rl.Temp.String$.ValueOrNull(fileType),
      rl.Temp.UnsignedChar$.Array(fileData),
      fileData.length,
    ),
  );

  @override
  ImageD LoadImageFromTexture(
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.LoadImageFromTexture(texture),
    () => rl.CoreFlat.LoadImageFromTexture(
      texture,
    ),
  );

  @override
  ImageD LoadImageFromScreen() => run(
    () => RaylibDebugLabels.LoadImageFromScreen(),
    () => rl.CoreFlat.LoadImageFromScreen(),
  );

  @override
  bool IsImageValid(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.IsImageValid(image),
    () => rl.CoreFlat.IsImageValid(
      image,
    ),
  );

  @override
  void UnloadImage(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.UnloadImage(image),
    () => rl.CoreFlat.UnloadImage(
      image,
    ),
  );

  @override
  bool ExportImage(
    ImageD image,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportImage(image, fileName),
    () => rl.CoreFlat.ExportImage(
      image,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  (NativeMemoryPointer<RUint8> dataPtr, int dataSize) ExportImageToMemory(
    ImageD image,
    String fileType,
  ) => run(
    () => RaylibDebugLabels.ExportImageToMemory(image, fileType),
    () {
      final dataSize = rl.Temp.Int$.Ref1();
      final dataPtr = rl.CoreFlat.ExportImageToMemory(
        image,
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
    () => rl.CoreFlat.ExportImageAsCode(
      image,
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
    () => rl.CoreFlat.GenImageColor(
      width.toInt(),
      height.toInt(),
      color,
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
    () => rl.CoreFlat.GenImageGradientLinear(
      width.toInt(),
      height.toInt(),
      direction.toInt(),
      start,
      end,
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
    () => rl.CoreFlat.GenImageGradientRadial(
      width.toInt(),
      height.toInt(),
      density.toDouble(),
      inner,
      outer,
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
    () => rl.CoreFlat.GenImageGradientSquare(
      width.toInt(),
      height.toInt(),
      density.toDouble(),
      inner,
      outer,
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
    () => rl.CoreFlat.GenImageChecked(
      width.toInt(),
      height.toInt(),
      checksX.toInt(),
      checksY.toInt(),
      col1,
      col2,
    ),
  );

  @override
  ImageD GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => run(
    () => RaylibDebugLabels.GenImageWhiteNoise(width, height, factor),
    () => rl.CoreFlat.GenImageWhiteNoise(
      width.toInt(),
      height.toInt(),
      factor.toDouble(),
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
    () => rl.CoreFlat.GenImagePerlinNoise(
      width.toInt(),
      height.toInt(),
      offsetX.toInt(),
      offsetY.toInt(),
      scale.toDouble(),
    ),
  );
    
  @override
  ImageD GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => run(
    () => RaylibDebugLabels.GenImageCellular(width, height, tileSize),
    () => rl.CoreFlat.GenImageCellular(
      width.toInt(),
      height.toInt(),
      tileSize.toInt(),
    ),
  );

  @override
  ImageD GenImageText(
    num width,
    num height,
    String text,
  ) => run(
    () => RaylibDebugLabels.GenImageText(width, height, text),
    () => rl.CoreFlat.GenImageText(
      width.toInt(),
      height.toInt(),
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  @override
  ImageD ImageCopy(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageCopy(image),
    () => rl.CoreFlat.ImageCopy(
      image,
    ),
  );

  @override
  ImageD ImageFromImage(
    ImageD image,
    RectangleD rec,
  ) => run(
    () => RaylibDebugLabels.ImageFromImage(image, rec),
    () => rl.CoreFlat.ImageFromImage(
      image,
      rec,
    ),
  );

  @override
  ImageD ImageFromChannel(
    ImageD image,
    num selectedChannel,
  ) => run(
    () => RaylibDebugLabels.ImageFromChannel(image, selectedChannel),
    () => rl.CoreFlat.ImageFromChannel(
      image,
      selectedChannel.toInt(),
    ),
  );

  @override
  ImageD ImageText(
    String text,
    num fontSize,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageText(text, fontSize, color),
    () => rl.CoreFlat.ImageText(
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toInt(),
      color,
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
    () => rl.CoreFlat.ImageTextEx(
      font,
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  @override
  void ImageFormat(
    ImageD image,
    PixelFormat newFormat,
  ) => run(
    () => RaylibDebugLabels.ImageFormat(image, newFormat),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageFormat(
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
      (p) => rl.CoreFlat.ImageToPOT(
        p,
        fill,
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
      (p) => rl.CoreFlat.ImageCrop(
        p,
        crop,
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
      (p) => rl.CoreFlat.ImageAlphaCrop(
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
      (p) => rl.CoreFlat.ImageAlphaClear(
        p,
        color,
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
      (p) => rl.CoreFlat.ImageAlphaMask(
        p,
        alphaMask,
      ),
    ),
  );

  @override
  void ImageAlphaPremultiply(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageAlphaPremultiply(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageAlphaPremultiply(
        p,
      ),
    ),
  );

  @override
  void ImageBlurGaussian(
    ImageD image,
    num blurSize,
  ) => run(
    () => RaylibDebugLabels.ImageBlurGaussian(image, blurSize),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageBlurGaussian(
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
      (p) => rl.CoreFlat.ImageKernelConvolution(
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
      (p) => rl.CoreFlat.ImageResize(
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
      (p) => rl.CoreFlat.ImageResizeNN(
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
      (p) => rl.CoreFlat.ImageResizeCanvas(
        p,
        newWidth.toInt(),
        newHeight.toInt(),
        offsetX.toInt(),
        offsetY.toInt(),
        fill,
      ),
    ),
  );

  @override
  void ImageMipmaps(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageMipmaps(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageMipmaps(
        p,
      ),
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
      (p) => rl.CoreFlat.ImageDither(
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
      (p) => rl.CoreFlat.ImageFlipVertical(
        p,
      ),
    ),
  );

  @override
  void ImageFlipHorizontal(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageFlipHorizontal(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageFlipHorizontal(
        p,
      ),
    ),
  );

  @override
  void ImageRotate(
    ImageD image,
    num degrees,
  ) => run(
    () => RaylibDebugLabels.ImageRotate(image, degrees),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageRotate(
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
      (p) => rl.CoreFlat.ImageRotateCW(
        p,
      ),
    ),
  );

  @override
  void ImageRotateCCW(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageRotateCCW(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageRotateCCW(
        p,
      ),
    ),
  );
    
  @override
  void ImageColorTint(
    ImageD image,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageColorTint(image, color),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageColorTint(
        p,
        color,
      ),
    ),
  );

  @override
  void ImageColorInvert(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageColorInvert(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageColorInvert(
        p,
      ),
    ),
  );

  @override
  void ImageColorGrayscale(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.ImageColorGrayscale(image),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageColorGrayscale(
        p,
      ),
    ),
  );

  @override
  void ImageColorContrast(
    ImageD image,
    num contrast,
  ) => run(
    () => RaylibDebugLabels.ImageColorContrast(image, contrast),
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.CoreFlat.ImageColorContrast(
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
      (p) => rl.CoreFlat.ImageColorBrightness(
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
      (p) => rl.CoreFlat.ImageColorReplace(
        p,
        color,
        replace,
      ),
    ),
  );

  @override
  List<ColorD> LoadImageColors(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.LoadImageColors(image),
    () {
      final colors = rl.CoreFlat.LoadImageColors(
        image,
      );
      try {
        return colors.readArray(image.width * image.height);
      } finally {
        rl.CoreFlat.UnloadImageColors(colors);
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
      final colors = rl.CoreFlat.LoadImagePalette(
        image,
        maxPaletteSize.toInt(),
        colorCount,
      );
      try {
        return colors.readArray(colorCount.value);
      } finally {
        rl.CoreFlat.UnloadImagePalette(colors);
      }
    },
  );

  @override
  RectangleD GetImageAlphaBorder(
    ImageD image,
    num threshold,
  ) => run(
    () => RaylibDebugLabels.GetImageAlphaBorder(image, threshold),
    () => rl.CoreFlat.GetImageAlphaBorder(
      image,
      threshold.toDouble(),
    ),
  );

  @override
  ColorD GetImageColor(
    ImageD image,
    num x,
    num y,
  ) => run(
    () => RaylibDebugLabels.GetImageColor(image, x, y),
    () => rl.CoreFlat.GetImageColor(
      image,
      x.toInt(),
      y.toInt(),
    ),
  );

  @override
  void ImageClearBackground(
    ImageD dst,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ImageClearBackground(dst, color),
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.CoreFlat.ImageClearBackground(
        p,
        color,
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
      (p) => rl.CoreFlat.ImageDrawPixel(
        p,
        posX.toInt(),
        posY.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawPixelV(
        p,
        position,
        color,
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
      (p) => rl.CoreFlat.ImageDrawLine(
        p,
        startPosX.toInt(),
        startPosY.toInt(),
        endPosX.toInt(),
        endPosY.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawLineV(
        p,
        start,
        end,
        color,
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
      (p) => rl.CoreFlat.ImageDrawLineEx(
        p,
        start,
        end,
        thick.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawCircle(
        p,
        centerX.toInt(),
        centerY.toInt(),
        radius.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawCircleV(
        p,
        center,
        radius.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawCircleLines(
        p,
        centerX.toInt(),
        centerY.toInt(),
        radius.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawCircleLinesV(
        p,
        center,
        radius.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawRectangle(
        p,
        posX.toInt(),
        posY.toInt(),
        width.toInt(),
        height.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawRectangleV(
        p,
        position,
        size,
        color,
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
      (p) => rl.CoreFlat.ImageDrawRectangleRec(
        p,
        rec,
        color,
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
      (p) => rl.CoreFlat.ImageDrawRectangleLines(
        p,
        rec,
        thick.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawTriangle(
        p,
        v1,
        v2,
        v3,
        color,
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
      (p) => rl.CoreFlat.ImageDrawTriangleEx(
        p,
        v1,
        v2,
        v3,
        c1,
        c2,
        c3,
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
      (p) => rl.CoreFlat.ImageDrawTriangleLines(
        p,
        v1,
        v2,
        v3,
        color,
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
      (p) => rl.CoreFlat.ImageDrawTriangleFan(
        p,
        rl.Temp.Vector2$.Array(points),
        points.length,
        color,
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
      (p) => rl.CoreFlat.ImageDrawTriangleStrip(
        p,
        rl.Temp.Vector2$.Array(points),
        points.length,
        color,
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
      (p) => rl.CoreFlat.ImageDraw(
        p,
        src,
        srcRec,
        dstRec,
        tint,
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
      (p) => rl.CoreFlat.ImageDrawText(
        p,
        rl.Temp.String$.ValueOrNull(text),
        posX.toInt(),
        posY.toInt(),
        fontSize.toInt(),
        color,
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
      (p) => rl.CoreFlat.ImageDrawTextEx(
        p,
        font,
        rl.Temp.String$.ValueOrNull(text),
        position,
        fontSize.toDouble(),
        spacing.toDouble(),
        tint,
      ),
    ),
  );

  @override
  TextureD LoadTexture(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadTexture(fileName),
    () => rl.CoreFlat.LoadTexture(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  TextureD LoadTextureFromImage(
    ImageD image,
  ) => run(
    () => RaylibDebugLabels.LoadTextureFromImage(image),
    () => rl.CoreFlat.LoadTextureFromImage(
      image,
    ),
  );

  @override
  TextureD LoadTextureCubemap(
    ImageD image,
    CubemapLayout layout,
  ) => run(
    () => RaylibDebugLabels.LoadTextureCubemap(image, layout),
    () => rl.CoreFlat.LoadTextureCubemap(
      image,
      layout.value,
    ),
  );

  @override
  RenderTextureD LoadRenderTexture(
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.LoadRenderTexture(width, height),
    () => rl.CoreFlat.LoadRenderTexture(
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  bool IsTextureValid(
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.IsTextureValid(texture),
    () => rl.CoreFlat.IsTextureValid(
      texture,
    ),
  );

  @override
  void UnloadTexture(
    TextureD texture,
  ) => run(
    () => RaylibDebugLabels.UnloadTexture(texture),
    () {
      rl.CoreFlat.UnloadTexture(
        texture,
      );
      texture.structMarkDisposed();
    },
  );

  @override
  bool IsRenderTextureValid(
    RenderTextureD target,
  ) => run(
    () => RaylibDebugLabels.IsRenderTextureValid(target),
    () => rl.CoreFlat.IsRenderTextureValid(
      target,
    ),
  );

  @override
  void UnloadRenderTexture(
    RenderTextureD target,
  ) => run(
    () => RaylibDebugLabels.UnloadRenderTexture(target),
    () => rl.CoreFlat.UnloadRenderTexture(
      target,
    ),
  );

  @override
  void UpdateTexture(
    TextureD texture,
    Uint8List pixels,
  ) => run(
    () => RaylibDebugLabels.UpdateTexture(texture, pixels),
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (_) => rl.CoreFlat.UpdateTexture(
        texture,
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
      (_) => rl.CoreFlat.UpdateTextureRec(
        texture,
        rec,
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
      (p) => rl.CoreFlat.GenTextureMipmaps(
        p,
      ),
    ),
  );

  @override
  void SetTextureFilter(
    TextureD texture,
    TextureFilter filter,
  ) => run(
    () => RaylibDebugLabels.SetTextureFilter(texture, filter),
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (_) => rl.CoreFlat.SetTextureFilter(
        texture,
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
      (_) => rl.CoreFlat.SetTextureWrap(
        texture,
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
    () => rl.CoreFlat.DrawTexture(
      texture,
      posX.toInt(),
      posY.toInt(),
      tint,
    ),
  );

  @override
  void DrawTextureV(
    TextureD texture,
    Vector2D position,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.DrawTextureV(texture, position, tint),
    () => rl.CoreFlat.DrawTextureV(
      texture,
      position,
      tint,
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
    () => rl.CoreFlat.DrawTextureEx(
      texture,
      position,
      rotation.toDouble(),
      scale.toDouble(),
      tint,
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
    () => rl.CoreFlat.DrawTextureRec(
      texture,
      source,
      position,
      tint,
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
    () => rl.CoreFlat.DrawTexturePro(
      texture,
      source,
      dest,
      origin,
      rotation.toDouble(),
      tint,
    ),
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
    () => rl.CoreFlat.DrawTextureNPatch(
      texture,
      nPatchInfo,
      dest,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );

  @override
  bool ColorIsEqual(
    ColorD col1,
    ColorD col2,
  ) => run(
    () => RaylibDebugLabels.ColorIsEqual(col1, col2),
    () => rl.CoreFlat.ColorIsEqual(
      col1,
      col2,
    ),
  );

  @override
  ColorD Fade(
    ColorD color,
    num alpha,
  ) => run(
    () => RaylibDebugLabels.Fade(color, alpha),
    () => rl.CoreFlat.Fade(
      color,
      alpha.toDouble(),
    ),
  );

  @override
  int ColorToInt(
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ColorToInt(color),
    () => rl.CoreFlat.ColorToInt(
      color,
    ),
  );

  @override
  Vector4D ColorNormalize(
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ColorNormalize(color),
    () => rl.CoreFlat.ColorNormalize(
      color,
    ),
  );

  @override
  ColorD ColorFromNormalized(
    Vector4D normalized,
  ) => run(
    () => RaylibDebugLabels.ColorFromNormalized(normalized),
    () => rl.CoreFlat.ColorFromNormalized(
      normalized,
    ),
  );

  @override
  Vector3D ColorToHSV(
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.ColorToHSV(color),
    () => rl.CoreFlat.ColorToHSV(
      color,
    ),
  );

  @override
  ColorD ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => run(
    () => RaylibDebugLabels.ColorFromHSV(hue, saturation, value),
    () => rl.CoreFlat.ColorFromHSV(
      hue.toDouble(),
      saturation.toDouble(),
      value.toDouble(),
    ),
  );

  @override
  ColorD ColorTint(
    ColorD color,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.ColorTint(color, tint),
    () => rl.CoreFlat.ColorTint(
      color,
      tint,
    ),
  );

  @override
  ColorD ColorBrightness(
    ColorD color,
    num factor,
  ) => run(
    () => RaylibDebugLabels.ColorBrightness(color, factor),
    () => rl.CoreFlat.ColorBrightness(
      color,
      factor.toDouble(),
    ),
  );

  @override
  ColorD ColorContrast(
    ColorD color,
    num contrast,
  ) => run(
    () => RaylibDebugLabels.ColorContrast(color, contrast),
    () => rl.CoreFlat.ColorContrast(
      color,
      contrast.toDouble(),
    ),
  );

  @override
  ColorD ColorAlpha(
    ColorD color,
    num alpha,
  ) => run(
    () => RaylibDebugLabels.ColorAlpha(color, alpha),
    () => rl.CoreFlat.ColorAlpha(
      color,
      alpha.toDouble(),
    ),
  );

  @override
  ColorD ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  ) => run(
    () => RaylibDebugLabels.ColorAlphaBlend(dst, src, tint),
    () => rl.CoreFlat.ColorAlphaBlend(
      dst,
      src,
      tint,
    ),
  );

  @override
  ColorD ColorLerp(
    ColorD color1,
    ColorD color2,
    num factor,
  ) => run(
    () => RaylibDebugLabels.ColorLerp(color1, color2, factor),
    () => rl.CoreFlat.ColorLerp(
      color1,
      color2,
      factor.toDouble(),
    ),
  );

  @override
  ColorD GetColor(
    num hexValue,
  ) => run(
    () => RaylibDebugLabels.GetColor(hexValue),
    () => rl.CoreFlat.GetColor(
      hexValue.toInt(),
    ),
  );

  @override
  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => run(
    () => RaylibDebugLabels.GetPixelDataSize(width, height, format),
    () => rl.CoreFlat.GetPixelDataSize(
      width.toInt(),
      height.toInt(),
      format.value,
    ),
  );

  @override
  FontD GetFontDefault() => run(
    () => RaylibDebugLabels.GetFontDefault(),
    () => rl.CoreFlat.GetFontDefault(),
  );

  @override
  FontD LoadFont(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadFont(fileName),
    () => rl.CoreFlat.LoadFont(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  FontD LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codepointCount,
    ]
  ) => run(
    () => RaylibDebugLabels.LoadFontEx(fileName, fontSize, codepoints),
    () => rl.CoreFlat.LoadFontEx(
      rl.Temp.String$.ValueOrNull(fileName),
      fontSize.toInt(),
      (codepoints == null ? MemoryPointer.nullptr : rl.Temp.Int$.Array(codepoints)).cast(),
      codepointCount?.toInt() ?? codepoints?.length ?? 0,
    ),
  );

  @override
  FontD LoadFontFromImage(
    ImageD image,
    ColorD key,
    num firstChar,
  ) => run(
    () => RaylibDebugLabels.LoadFontFromImage(image, key, firstChar),
    () => rl.CoreFlat.LoadFontFromImage(
      image,
      key,
      firstChar.toInt(),
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
    () => rl.CoreFlat.LoadFontFromMemory(
      rl.Temp.String$.ValueOrNull(fileType),
      rl.Temp.Uint8$.Array(fileData),
      fileData.length,
      fontSize.toInt(),
      rl.Temp.Int$.Array(codepoints),
      codepoints.length,
    ),
  );

  @override
  bool IsFontValid(
    FontD font,
  ) => run(
    () => RaylibDebugLabels.IsFontValid(font),
    () => rl.CoreFlat.IsFontValid(
      font,
    ),
  );

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
      final glyphCount = rl.Temp.Int$.Ref1();
      final glyphs = rl.CoreFlat.LoadFontData(
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
        fontSize.toInt(),
        (codepoints == null ? MemoryPointer.nullptr : rl.Temp.Int$.Array(codepoints)).cast(),
        codepointCount?.toInt() ?? codepoints?.length ?? 0,
        type.value,
        glyphCount,
      );
      final requestedCount = (codepointCount == null || codepointCount == 0) 
        ? codepoints?.length ?? glyphCount.value 
        : codepointCount.toInt();
      return glyphs.readArray(requestedCount, owned: true);
    },
  );

  // TODO: test this
  @override
  (ImageD image, List<RectangleD> glyphRecs) GenImageFontAtlas(
    List<GlyphInfoD> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => run(
    () => RaylibDebugLabels.GenImageFontAtlas(glyphs, fontSize, padding, packMethod),
    () {
      final recsPtr = rl.Temp.Rectangle$.$.Raw();

      try {
        final image = rl.CoreFlat.GenImageFontAtlas(
          glyphs.firstOrNull?.op != null
            ? GlyphInfoD.pointer(glyphs.first.op)
            : rl.Temp.GlyphInfo$.Array(glyphs),
          recsPtr,
          glyphs.length,
          fontSize.toInt(),
          padding.toInt(),
          packMethod.toInt(),
        );

        final recs = RectangleD.pointer(recsPtr).readArray(glyphs.length);

        return (image, recs);
      } finally {
        recsPtr.free();
      }
    },
  );

  @override
  void UnloadFontData(
    List<GlyphInfoD> glyphs,
  ) => run(
    () => RaylibDebugLabels.UnloadFontData(glyphs),
    () => rl.CoreFlat.UnloadFontData(
      glyphs.firstOrNull?.op != null
        ? GlyphInfoD.pointer(glyphs.first.op)
        : rl.Temp.GlyphInfo$.Array(glyphs),
      glyphs.length,
    ),
  );
    
  @override
  void UnloadFont(
    FontD font,
  ) => run(
    () => RaylibDebugLabels.UnloadFont(font),
    () => rl.CoreFlat.UnloadFont(
      font,
    ),
  );

  @override
  bool ExportFontAsCode(
    FontD font,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportFontAsCode(font, fileName),
    () => rl.CoreFlat.ExportFontAsCode(
      font,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  @override
  void DrawFPS(
    num posX,
    num posY,
  ) => run(
    () => RaylibDebugLabels.DrawFPS(posX, posY),
    () => rl.CoreFlat.DrawFPS(
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
    () => rl.CoreFlat.DrawText(
      rl.Temp.String$.ValueOrNull(text),
      posX.toInt(),
      posY.toInt(),
      fontSize.toInt(),
      color,
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
    () => rl.CoreFlat.DrawTextEx(
      font,
      rl.Temp.String$.ValueOrNull(text),
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
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
    () => rl.CoreFlat.DrawTextPro(
      font,
      rl.Temp.String$.ValueOrNull(text),
      position,
      origin,
      rotation.toDouble(),
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
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
    () => rl.CoreFlat.DrawTextCodepoint(
      font,
      codepoint.toInt(),
      position,
      fontSize.toDouble(),
      tint,
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
    () => rl.CoreFlat.DrawTextCodepoints(
      font,
      rl.Temp.Int$.Array(codepoints),
      codepoints.length,
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  @override
  void SetTextLineSpacing(
    num spacing,
  ) => run(
    () => RaylibDebugLabels.SetTextLineSpacing(spacing),
    () => rl.CoreFlat.SetTextLineSpacing(
      spacing.toInt(),
    ),
  );

  @override
  int MeasureText(
    String text,
    num fontSize,
  ) => run(
    () => RaylibDebugLabels.MeasureText(text, fontSize),
    () => rl.CoreFlat.MeasureText(
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
    () => rl.CoreFlat.MeasureTextEx(
      font,
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
    ),
  );

  @override
  Vector2D MeasureTextCodepoints(
    FontD font,
    Int32List codepoints,
    num fontSize,
    num spacing,
  ) => run(
    () => RaylibDebugLabels.MeasureTextCodepoints(font, codepoints, fontSize, spacing),
    () => rl.CoreFlat.MeasureTextCodepoints(
      font,
      rl.Temp.Int$.Array(codepoints),
      codepoints.length,
      fontSize.toDouble(),
      spacing.toDouble(),
    ),
  );

  @override
  int GetGlyphIndex(
    FontD font,
    num codepoint,
  ) => run(
    () => RaylibDebugLabels.GetGlyphIndex(font, codepoint),
    () => rl.CoreFlat.GetGlyphIndex(
      font,
      codepoint.toInt(),
    ),
  );

  @override
  GlyphInfoD GetGlyphInfo(
    FontD font,
    num codepoint,
  ) => run(
    () => RaylibDebugLabels.GetGlyphInfo(font, codepoint),
    () => rl.CoreFlat.GetGlyphInfo(
      font,
      codepoint.toInt(),
    ),
  );

  @override
  RectangleD GetGlyphAtlasRec(
    FontD font,
    num codepoint,
  ) => run(
    () => RaylibDebugLabels.GetGlyphAtlasRec(font, codepoint),
    () => rl.CoreFlat.GetGlyphAtlasRec(
      font,
      codepoint.toInt(),
    ),
  );
    
  @override
  String LoadUTF8(
    Int32List codepoints,
  ) => run(
    () => RaylibDebugLabels.LoadUTF8(codepoints),
    () {
      final utf8 = rl.CoreFlat.LoadUTF8(
        rl.Temp.Int$.Array(codepoints),
        codepoints.length,
      );
      try {
        return utf8.toDartString();
      } finally {
        rl.CoreFlat.UnloadUTF8(utf8);
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
      final result = rl.CoreFlat.LoadCodepoints(
        rl.Temp.String$.ValueOrNull(text),
        count,
      );
      try {
        return .fromList(result.readArray(count.value));
      } finally {
        rl.CoreFlat.UnloadCodepoints(result);
      }
    },
  );

  @override
  int GetCodepointCount(
    String text,
  ) => run(
    () => RaylibDebugLabels.GetCodepointCount(text),
    () => rl.CoreFlat.GetCodepointCount(
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
      final codepoint = rl.CoreFlat.GetCodepoint(
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
      final codepoint = rl.CoreFlat.GetCodepointNext(
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
      final codepoint = rl.CoreFlat.GetCodepointPrevious(
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
      final text = rl.CoreFlat.CodepointToUTF8(
        codepoint.toInt(),
        size,
      );
      return (text.toDartString(), size.value);
    },
  );

  @override
  List<String> LoadTextLines(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextLength(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      final lineCountPtr = rl.Temp.Int$.Ref1();
      try {
        final linesPtr = rl.CoreFlat.LoadTextLines(
          textPtr,
          lineCountPtr,
        );
        final lines = linesPtr.readStringArray(lineCountPtr.value);
        rl.CoreFlat.UnloadTextLines(linesPtr, lineCountPtr.value);
        return lines;
      } finally {
        textPtr.free();
      }
    },
  );
  
  @override
  bool TextIsEqual(
    String text1,
    String text2,
  ) => run(
    () => RaylibDebugLabels.TextIsEqual(text1, text2),
    () {
      final text1Ptr = rl.Temp.String$.RawValue(text1);
      final text2Ptr = rl.Temp.String$.RawValue(text2);
      try {
        return rl.CoreFlat.TextIsEqual(
          text1Ptr,
          text2Ptr,
        );
      } finally {
        text1Ptr.free();
        text2Ptr.free();
      }
    },
  );

  @override
  int TextLength(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextLength(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextLength(
          textPtr,
        );
      } finally {
        textPtr.free();
      }
    },
  );

  @override
  String TextSubtext(
    String text,
    int position,
    int length,
  ) => run(
    () => RaylibDebugLabels.TextSubtext(text, position, length),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextSubtext(
          textPtr,
          position,
          length,
        ).toDartString();
      } finally {
        textPtr.free();
      }
    },
  );

  @override
  String TextRemoveSpaces(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextRemoveSpaces(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextRemoveSpaces(
          textPtr,
        ).toDartString();
      } finally {
        textPtr.free();
      }
    },
  );

  @override
  String GetTextBetween(
    String text,
    String begin,
    String end,
  ) => run(
    () => RaylibDebugLabels.GetTextBetween(text, begin, end),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      final beginPtr = rl.Temp.String$.RawValue(begin);
      final endPtr = rl.Temp.String$.RawValue(end);
      try {
        return rl.CoreFlat.GetTextBetween(
          textPtr,
          beginPtr,
          endPtr,
        ).toDartString();
      } finally {
        textPtr.free();
        beginPtr.free();
        endPtr.free();
      }
    },
  );

  @override
  String TextReplace(
    String text,
    String search,
    String replacement,
  ) => run(
    () => RaylibDebugLabels.TextReplace(text, search, replacement),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      final searchPtr = rl.Temp.String$.RawValue(search);
      final replacementPtr = rl.Temp.String$.RawValue(replacement);
      try {
        // NOTE: uses Alloc variant so we are not limited by the static buffer
        final resultPtr = rl.CoreFlat.TextReplaceAlloc(
          textPtr,
          searchPtr,
          replacementPtr,
        );
        final result = resultPtr.toDartString();
        resultPtr.free();
        return result;
      } finally {
        textPtr.free();
        searchPtr.free();
        replacementPtr.free();
      }
    },
  );

  @override
  String TextReplaceBetween(
    String text,
    String begin,
    String end,
    String replacement,
  ) => run(
    () => RaylibDebugLabels.TextReplaceBetween(text, begin, end, replacement),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      final beginPtr = rl.Temp.String$.RawValue(begin);
      final endPtr = rl.Temp.String$.RawValue(end);
      final replacementPtr = rl.Temp.String$.RawValue(replacement);
      try {
        // NOTE: uses Alloc variant so we are not limited by the static buffer
        final resultPtr = rl.CoreFlat.TextReplaceBetweenAlloc(
          textPtr,
          beginPtr,
          endPtr,
          replacementPtr,
        );
        final result = resultPtr.toDartString();
        resultPtr.free();
        return result;
      } finally {
        textPtr.free();
        beginPtr.free();
        endPtr.free();
        replacementPtr.free();
      }
    },
  );

  @override
  String TextInsert(
    String text,
    String insert,
    int position,
  ) => run(
    () => RaylibDebugLabels.TextInsert(text, insert, position),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      final insertPtr = rl.Temp.String$.RawValue(insert);
      try {
        // NOTE: uses Alloc variant so we are not limited by the static buffer
        final resultPtr = rl.CoreFlat.TextInsertAlloc(
          textPtr,
          insertPtr,
          position,
        );
        final result = resultPtr.toDartString();
        resultPtr.free();
        return result;
      } finally {
        textPtr.free();
        insertPtr.free();
      }
    },
  );

  // TODO: test this
  @override
  String TextJoin(
    List<String> textList,
    String delimiter,
  ) => run(
    () => RaylibDebugLabels.TextJoin(textList, delimiter),
    () {
      final textListPtr = rl.Temp.String$.RawPtr(textList.length);
      final delimiterPtr = rl.Temp.String$.RawValue(delimiter);

      try {
        for (final (i, text) in textList.indexed) {
          final innerStrPtr = rl.Temp.String$.RawValue(text);
          textListPtr.writePtr(innerStrPtr, i * RType.nativeWordSize);
        }

        return rl.CoreFlat.TextJoin(
          textListPtr,
          textList.length,
          delimiterPtr,
        ).toDartString();
      } finally {
        for (final (i, _) in textList.indexed) {
          textListPtr.readPtr(i * RType.nativeWordSize).free();
        }
        textListPtr.free();
        delimiterPtr.free();
      }
    },
  );

  @override
  List<String> TextSplit(
    String text,
    String delimiter,
  ) => run(
    () => RaylibDebugLabels.TextSplit(text, delimiter),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      final countPtr = rl.Temp.Int$.Ref1();
      try {
        final delimiterChar = delimiter.isEmpty ? 0 : delimiter.codeUnitAt(0);
        final partsPtr = rl.CoreFlat.TextSplit(
          textPtr,
          delimiterChar,
          countPtr,
        );
        return partsPtr.readStringArray(countPtr.value);
      } finally {
        textPtr.free();
      }
    },
  );

  @override
  String TextAppend(
    String text,
    String append,
  ) => run(
    () => RaylibDebugLabels.TextAppend(text, append),
    // NOTE: not calling rl.CoreFlat.TextAppend here. The native version writes into
    // `text`'s buffer at a caller-tracked position, assuming extra headroom beyond
    // its current length, a C-buffer contract that doesn't translate to immutable
    // Dart Strings and risks a real overflow if faked. Reimplemented directly instead.
    () => text + append,
  );

  @override
  int TextFindIndex(
    String text,
    String search,
  ) => run(
    () => RaylibDebugLabels.TextFindIndex(text, search),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      final searchPtr = rl.Temp.String$.RawValue(search);
      try {
        return rl.CoreFlat.TextFindIndex(
          textPtr,
          searchPtr,
        );
      } finally {
        textPtr.free();
        searchPtr.free();
      }
    },
  );

  @override
  String TextToUpper(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextToUpper(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextToUpper(
          textPtr,
        ).toDartString();
      } finally {
        textPtr.free();
      }
    },
  );
  
  @override
  String TextToLower(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextToLower(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextToLower(
          textPtr,
        ).toDartString();
      } finally {
        textPtr.free();
      }
    },
  );
  
  @override
  String TextToPascal(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextToPascal(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextToPascal(
          textPtr,
        ).toDartString();
      } finally {
        textPtr.free();
      }
    },
  );
  
  @override
  String TextToSnake(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextToSnake(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextToSnake(
          textPtr,
        ).toDartString();
      } finally {
        textPtr.free();
      }
    },
  );
  
  @override
  String TextToCamel(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextToCamel(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextToCamel(
          textPtr,
        ).toDartString();
      } finally {
        textPtr.free();
      }
    },
  );

  @override
  int TextToInteger(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextToInteger(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextToInteger(
          textPtr,
        );
      } finally {
        textPtr.free();
      }
    },
  );
  
  @override
  double TextToFloat(
    String text,
  ) => run(
    () => RaylibDebugLabels.TextToFloat(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      try {
        return rl.CoreFlat.TextToFloat(
          textPtr,
        );
      } finally {
        textPtr.free();
      }
    },
  );
    
  @override
  void DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawLine3D(startPos, endPos, color),
    () => rl.CoreFlat.DrawLine3D(
      startPos,
      endPos,
      color,
    ),
  );
    
  @override
  void DrawPoint3D(
    Vector3D position,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPoint3D(position, color),
    () => rl.CoreFlat.DrawPoint3D(
      position,
      color,
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
    () => rl.CoreFlat.DrawCircle3D(
      center,
      radius.toDouble(),
      rotationAxis,
      rotationAngle.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawTriangle3D(
      v1,
      v2,
      v3,
      color,
    ),
  );
    
  @override
  void DrawTriangleStrip3D(
    List<Vector3D> points,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawTriangleStrip3D(points, color),
    () => rl.CoreFlat.DrawTriangleStrip3D(
      rl.Temp.Vector3$.Array(points),
      points.length,
      color,
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
    () => rl.CoreFlat.DrawCube(
      position,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      color,
    ),
  );
    
  @override
  void DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCubeV(position, size, color),
    () => rl.CoreFlat.DrawCubeV(
      position,
      size,
      color,
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
    () => rl.CoreFlat.DrawCubeWires(
      position,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      color,
    ),
  );
    
  @override
  void DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawCubeWiresV(position, size, color),
    () => rl.CoreFlat.DrawCubeWiresV(
      position,
      size,
      color,
    ),
  );
    
  @override
  void DrawSphere(
    Vector3D centerPos,
    num radius,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawSphere(centerPos, radius, color),
    () => rl.CoreFlat.DrawSphere(
      centerPos,
      radius.toDouble(),
      color,
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
    () => rl.CoreFlat.DrawSphereEx(
      centerPos,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      color,
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
    () => rl.CoreFlat.DrawSphereWires(
      centerPos,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      color,
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
    () => rl.CoreFlat.DrawCylinder(
      position,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      color,
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
    () => rl.CoreFlat.DrawCylinderEx(
      startPos,
      endPos,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      color,
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
    () => rl.CoreFlat.DrawCylinderWires(
      position,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      color,
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
    () => rl.CoreFlat.DrawCylinderWiresEx(
      startPos,
      endPos,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      color,
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
    () => rl.CoreFlat.DrawCapsule(
      startPos,
      endPos,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      color,
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
    () => rl.CoreFlat.DrawCapsuleWires(
      startPos,
      endPos,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      color,
    ),
  );
    
  @override
  void DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawPlane(centerPos, size, color),
    () => rl.CoreFlat.DrawPlane(
      centerPos,
      size,
      color,
    ),
  );
    
  @override
  void DrawRay(
    RayD ray,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawRay(ray, color),
    () => rl.CoreFlat.DrawRay(
      ray,
      color,
    ),
  );
    
  @override
  void DrawGrid(
    num slices,
    num spacing,
  ) => run(
    () => RaylibDebugLabels.DrawGrid(slices, spacing),
    () => rl.CoreFlat.DrawGrid(
      slices.toInt(),
      spacing.toDouble(),
    ),
  );
    
  @override
  ModelD LoadModel(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadModel(fileName),
    () => rl.CoreFlat.LoadModel(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  ModelD LoadModelFromMesh(
    MeshD mesh,
  ) => run(
    () => RaylibDebugLabels.LoadModelFromMesh(mesh),
    () => rl.CoreFlat.LoadModelFromMesh(
      mesh,
    ),
  );
    
  @override
  bool IsModelValid(
    ModelD model,
  ) => run(
    () => RaylibDebugLabels.IsModelValid(model),
    () => rl.CoreFlat.IsModelValid(
      model,
    ),
  );
    
  @override
  void UnloadModel(
    ModelD model,
  ) => run(
    () => RaylibDebugLabels.UnloadModel(model),
    () => rl.CoreFlat.UnloadModel(
      model,
    ),
  );
    
  @override
  BoundingBoxD GetModelBoundingBox(
    ModelD model,
  ) => run(
    () => RaylibDebugLabels.GetModelBoundingBox(model),
    () => rl.CoreFlat.GetModelBoundingBox(
      model,
    ),
  );
    
  @override
  void DrawModel(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint
  ) => run(
    () => RaylibDebugLabels.DrawModel(model, position, scale, tint),
    () => rl.CoreFlat.DrawModel(
      model,
      position,
      scale.toDouble(),
      tint,
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
    () => rl.CoreFlat.DrawModelEx(
      model,
      position,
      rotationAxis,
      rotationAngle.toDouble(),
      scale,
      tint,
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
    () => rl.CoreFlat.DrawModelWires(
      model,
      position,
      scale.toDouble(),
      tint,
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
    () => rl.CoreFlat.DrawModelWiresEx(
      model,
      position,
      rotationAxis,
      rotationAngle.toDouble(),
      scale,
      tint,
    ),
  );
    
  @override
  void DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  ) => run(
    () => RaylibDebugLabels.DrawBoundingBox(box, color),
    () => rl.CoreFlat.DrawBoundingBox(
      box,
      color,
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
    () => rl.CoreFlat.DrawBillboard(
      camera,
      texture,
      position,
      scale.toDouble(),
      tint,
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
    () => rl.CoreFlat.DrawBillboardRec(
      camera,
      texture,
      source,
      position,
      size,
      tint,
    ),
  );

  @override
  @Deprecated(
    "Broken by a dart:ffi bug: the trailing Color argument gets corrupted "
    "(or crashes) once the preceding float-only args exceed the CPU's 8 "
    "float registers. Use DrawBillboard/DrawBillboardRec, or wait for the fix. "
    "See dart-lang/sdk#63976."
  )
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
    () => rl.CoreFlat.DrawBillboardPro(
      camera,
      texture,
      source,
      position,
      up,
      size,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );
  
  @override
  void UploadMesh(
    MeshD mesh,
    bool dynamic,
  ) => run(
    () => RaylibDebugLabels.UploadMesh(mesh, dynamic),
    () => rl.Temp.Mesh$.RefUpdate1(mesh,
      (p) => rl.CoreFlat.UploadMesh(
        p,
        dynamic,
      ),
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
    () => rl.CoreFlat.UpdateMeshBuffer(
      mesh,
      index.toInt(),
      rl.Temp.TypedDataList$.Array(data),
      data.length,
      offset.toInt(),
    ),
  );
    
  @override
  void UnloadMesh(
    MeshD mesh,
  ) => run(
    () => RaylibDebugLabels.UnloadMesh(mesh),
    () => rl.CoreFlat.UnloadMesh(
      mesh,
    ),
  );
    
  @override
  void DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  ) => run(
    () => RaylibDebugLabels.DrawMesh(mesh, material, transform),
    () => rl.CoreFlat.DrawMesh(
      mesh,
      material,
      transform,
    ),
  );
    
  @override
  void DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    List<MatrixD> transforms,
  ) => run(
    () => RaylibDebugLabels.DrawMeshInstanced(mesh, material, transforms),
    () => rl.CoreFlat.DrawMeshInstanced(
      mesh,
      material,
      rl.Temp.Matrix$.Array(transforms),
      transforms.length,
    ),
  );
    
  @override
  BoundingBoxD GetMeshBoundingBox(
    MeshD mesh,
  ) => run(
    () => RaylibDebugLabels.GetMeshBoundingBox(mesh),
    () => rl.CoreFlat.GetMeshBoundingBox(
      mesh,
    ),
  );
    
  @override
  void GenMeshTangents(
    MeshD mesh,
  ) => run(
    () => RaylibDebugLabels.GenMeshTangents(mesh),
    () => rl.Temp.Mesh$.RefUpdate1(mesh,
      (p) => rl.CoreFlat.GenMeshTangents(
        p,
      ),
    ),
  );
    
  @override
  bool ExportMesh(
    MeshD mesh,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportMesh(mesh, fileName),
    () => rl.CoreFlat.ExportMesh(
      mesh,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  bool ExportMeshAsCode(
    MeshD mesh,
    String fileName,
  ) => run(
    () => RaylibDebugLabels.ExportMeshAsCode(mesh, fileName),
    () => rl.CoreFlat.ExportMeshAsCode(
      mesh,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  @override
  MeshD GenMeshPoly(
    num sides,
    num radius,
  ) => run(
    () => RaylibDebugLabels.GenMeshPoly(sides, radius),
    () => rl.CoreFlat.GenMeshPoly(
      sides.toInt(),
      radius.toDouble(),
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
    () => rl.CoreFlat.GenMeshPlane(
      width.toDouble(),
      length.toDouble(),
      resX.toInt(),
      resZ.toInt(),
    ),
  );
    
  @override
  MeshD GenMeshCube(
    num width,
    num height,
    num length,
  ) => run(
    () => RaylibDebugLabels.GenMeshCube(width, height, length),
    () => rl.CoreFlat.GenMeshCube(
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
    ),
  );
    
  @override
  MeshD GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => RaylibDebugLabels.GenMeshSphere(radius, rings, slices),
    () => rl.CoreFlat.GenMeshSphere(
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
    ),
  );
    
  @override
  MeshD GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => RaylibDebugLabels.GenMeshHemiSphere(radius, rings, slices),
    () => rl.CoreFlat.GenMeshHemiSphere(
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
    ),
  );
    
  @override
  MeshD GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => run(
    () => RaylibDebugLabels.GenMeshCylinder(radius, height, slices),
    () => rl.CoreFlat.GenMeshCylinder(
      radius.toDouble(),
      height.toDouble(),
      slices.toInt(),
    ),
  );
    
  @override
  MeshD GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => run(
    () => RaylibDebugLabels.GenMeshCone(radius, height, slices),
    () => rl.CoreFlat.GenMeshCone(
      radius.toDouble(),
      height.toDouble(),
      slices.toInt(),
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
    () => rl.CoreFlat.GenMeshTorus(
      radius.toDouble(),
      size.toDouble(),
      radSeg.toInt(),
      sides.toInt(),
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
    () => rl.CoreFlat.GenMeshKnot(
      radius.toDouble(),
      size.toDouble(),
      radSeg.toInt(),
      sides.toInt(),
    ),
  );
    
  @override
  MeshD GenMeshHeightmap(
    ImageD heightmap,
    Vector3D size,
  ) => run(
    () => RaylibDebugLabels.GenMeshHeightmap(heightmap, size),
    () => rl.CoreFlat.GenMeshHeightmap(
      heightmap,
      size,
    ),
  );
    
  @override
  MeshD GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  ) => run(
    () => RaylibDebugLabels.GenMeshCubicmap(cubicmap, cubeSize),
    () => rl.CoreFlat.GenMeshCubicmap(
      cubicmap,
      cubeSize,
    ),
  );
    
  @override
  List<MaterialD> LoadMaterials(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadMaterials(fileName),
    () {
      final materialCount = rl.Temp.Int$.Ref1();
      final materials = rl.CoreFlat.LoadMaterials(
        rl.Temp.String$.ValueOrNull(fileName),
        materialCount,
      );
      return materials.readArray(materialCount.value);
    },
  );
    
  @override
  MaterialD LoadMaterialDefault() => run(
    () => RaylibDebugLabels.LoadMaterialDefault(),
    () => rl.CoreFlat.LoadMaterialDefault(),
  );
    
  @override
  bool IsMaterialValid(
    MaterialD material,
  ) => run(
    () => RaylibDebugLabels.IsMaterialValid(material),
    () => rl.CoreFlat.IsMaterialValid(
      material,
    ),
  );
    
  @override
  void UnloadMaterial(
    MaterialD material,
  ) => run(
    () => RaylibDebugLabels.UnloadMaterial(material),
    () => rl.CoreFlat.UnloadMaterial(
      material,
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
  LiveListPointerStruct<ModelAnimationD> LoadModelAnimations(
    String fileName,
  ) => run(
    () => RaylibDebugLabels.LoadModelAnimations(fileName),
    () {
      final animCount = rl.Temp.Int$.Ref1();
      final anims = rl.CoreFlat.LoadModelAnimations(
        rl.Temp.String$.ValueOrNull(fileName),
        animCount,
      );
      return .new(anims.readArray(animCount.value), anims);
    },
  );
    
  @override
  void UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  ) => run(
    () => RaylibDebugLabels.UpdateModelAnimation(model, anim, frame),
    () => rl.Temp.Model$.RefUpdate1(model,
      (_) => rl.Temp.ModelAnimation$.RefUpdate1(anim,
        (_) => rl.CoreFlat.UpdateModelAnimation(
          model,
          anim,
          frame.toDouble(),
        ),
      ),
    ),
  );
    
  @override
  void UpdateModelAnimationEx(
    ModelD model,
    ModelAnimationD animA,
    num frameA,
    ModelAnimationD animB,
    num frameB,
    num blend,
  ) => run(
    () => RaylibDebugLabels.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend),
    () => rl.CoreFlat.UpdateModelAnimationEx(
      model,
      animA,
      frameA.toDouble(),
      animB,
      frameB.toDouble(),
      blend.toDouble(),
    ),
  );
    
  @override
  void UnloadModelAnimations(
    LiveListPointerStruct<ModelAnimationD> animations,
  ) => run(
    () => RaylibDebugLabels.UnloadModelAnimations(animations),
    () => rl.CoreFlat.UnloadModelAnimations(
      ModelAnimationD.pointer(animations.ptr!),
      animations.length,
    ),
  );
    
  @override
  bool IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  ) => run(
    () => RaylibDebugLabels.IsModelAnimationValid(model, anim),
    () => rl.CoreFlat.IsModelAnimationValid(
      model,
      anim,
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
    () => rl.CoreFlat.CheckCollisionSpheres(
      center1,
      radius1.toDouble(),
      center2,
      radius2.toDouble(),
    ),
  );
    
  @override
  bool CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionBoxes(box1, box2),
    () => rl.CoreFlat.CheckCollisionBoxes(
      box1,
      box2,
    ),
  );
    
  @override
  bool CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    num radius,
  ) => run(
    () => RaylibDebugLabels.CheckCollisionBoxSphere(box, center, radius),
    () => rl.CoreFlat.CheckCollisionBoxSphere(
      box,
      center,
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
    () => rl.CoreFlat.GetRayCollisionSphere(
      ray,
      center,
      radius.toDouble(),
    ),
  );
    
  @override
  RayCollisionD GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  ) => run(
    () => RaylibDebugLabels.GetRayCollisionBox(ray, box),
    () => rl.CoreFlat.GetRayCollisionBox(
      ray,
      box,
    ),
  );
    
  @override
  RayCollisionD GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  ) => run(
    () => RaylibDebugLabels.GetRayCollisionMesh(ray, mesh, transform),
    () => rl.CoreFlat.GetRayCollisionMesh(
      ray,
      mesh,
      transform,
    ),
  );
    
  @override
  RayCollisionD GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  ) => run(
    () => RaylibDebugLabels.GetRayCollisionTriangle(ray, p1, p2, p3),
    () => rl.CoreFlat.GetRayCollisionTriangle(
      ray,
      p1,
      p2,
      p3,
    ),
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
    () => rl.CoreFlat.GetRayCollisionQuad(
      ray,
      p1,
      p2,
      p3,
      p4,
    ),
  );
}
