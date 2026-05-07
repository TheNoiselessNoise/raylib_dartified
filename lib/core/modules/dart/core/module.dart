part of '../../../raylib.dart';

class RaylibCoreD extends RaylibModule {
  RaylibCoreD(super.lib);
  
  @override
  void dispose() {
    super.dispose();
    LoadFileDataCallbackD.disposeRegistry();
    SaveFileDataCallbackD.disposeRegistry();
    LoadFileTextCallbackD.disposeRegistry();
    SaveFileTextCallbackD.disposeRegistry();
  }

  void InitWindow(
    num width,
    num height,
    String title,
  ) => run(
    () => 'InitWindow($width, $height, $title)',
    () => rl.Core.InitWindow(
      width.toInt(),
      height.toInt(),
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  void CloseWindow() => run(
    () => 'CloseWindow()',
    () => rl.Core.CloseWindow(),
  );

  bool WindowShouldClose() => run(
    () => 'WindowShouldClose()',
    () => rl.Core.WindowShouldClose(),
  );

  bool IsWindowReady() => run(
    () => 'IsWindowReady()',
    () => rl.Core.IsWindowReady(),
  );

  bool IsWindowFullscreen() => run(
    () => 'IsWindowFullscreen()',
    () => rl.Core.IsWindowFullscreen(),
  );

  bool IsWindowHidden() => run(
    () => 'IsWindowHidden()',
    () => rl.Core.IsWindowHidden(),
  );
    
  bool IsWindowMinimized() => run(
    () => 'IsWindowMinimized()',
    () => rl.Core.IsWindowMinimized(),
  );
    
  bool IsWindowMaximized() => run(
    () => 'IsWindowMaximized()',
    () => rl.Core.IsWindowMaximized(),
  );
    
  bool IsWindowFocused() => run(
    () => 'IsWindowFocused()',
    () => rl.Core.IsWindowFocused(),
  );
    
  bool IsWindowResized() => run(
    () => 'IsWindowResized()',
    () => rl.Core.IsWindowResized(),
  );
    
  bool IsWindowState(
    ConfigFlags flag,
  ) => run(
    () => 'IsWindowState(${flag.name})',
    () => rl.Core.IsWindowState(flag.value),
  );
    
  void SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => 'SetWindowState(${flags.map((e) => e.name).join(' | ')})',
    () => rl.Core.SetWindowState(flags.or),
  );
    
  void ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => 'ClearWindowState(${flags.map((e) => e.name).join(' | ')})',
    () => rl.Core.ClearWindowState(flags.or),
  );
    
  void ToggleFullscreen() => run(
    () => 'ToggleFullscreen()',
    () => rl.Core.ToggleFullscreen(),
  );
    
  void ToggleBorderlessWindowed() => run(
    () => 'ToggleBorderlessWindowed()',
    () => rl.Core.ToggleBorderlessWindowed(),
  );
    
  void MaximizeWindow() => run(
    () => 'MaximizeWindow()',
    () => rl.Core.MaximizeWindow(),
  );
    
  void MinimizeWindow() => run(
    () => 'MinimizeWindow()',
    () => rl.Core.MinimizeWindow(),
  );
    
  void RestoreWindow() => run(
    () => 'RestoreWindow()',
    () => rl.Core.RestoreWindow(),
  );
    
  void SetWindowIcon(
    ImageD image,
  ) => run(
    () => 'SetWindowIcon($image)',
    () => rl.Core.SetWindowIcon(
      rl.Temp.Image$.Ref1(image).ref,
    ),
  );
    
  void SetWindowIcons(
    List<ImageD> images,
  ) => run(
    () => 'SetWindowIcons(${images.map((i) => i.internalId).join(', ')})',
    () => rl.Core.SetWindowIcons(
      rl.Temp.Image$.Array(images),
      images.length,
    ),
  );
    
  void SetWindowTitle(
    String title,
  ) => run(
    () => 'SetWindowTitle($title)',
    () => rl.Core.SetWindowTitle(
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  void SetWindowPosition(
    num x,
    num y,
  ) => run(
    () => 'SetWindowPosition($x, $y)',
    () => rl.Core.SetWindowPosition(
      x.toInt(),
      y.toInt(),
    ),
  );
    
  void SetWindowMonitor(
    num monitor,
  ) => run(
    () => 'SetWindowMonitor($monitor)',
    () => rl.Core.SetWindowMonitor(monitor.toInt()),
  );
    
  void SetWindowMinSize(
    num width,
    num height,
  ) => run(
    () => 'SetWindowMinSize($width, $height)',
    () => rl.Core.SetWindowMinSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  void SetWindowMaxSize(
    num width,
    num height,
  ) => run(
    () => 'SetWindowMaxSize($width, $height)',
    () => rl.Core.SetWindowMaxSize(
      width.toInt(),
      height.toInt(),
    ),
  );
    
  void SetWindowSize(
    num width,
    num height,
  ) => run(
    () => 'SetWindowSize($width, $height)',
    () => rl.Core.SetWindowSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  void SetWindowOpacity(
    num opacity,
  ) => run(
    () => 'SetWindowOpacity($opacity)',
    () => rl.Core.SetWindowOpacity(opacity.toDouble()),
  );
    
  void SetWindowFocused() => run(
    () => 'SetWindowFocused()',
    () => rl.Core.SetWindowFocused(),
  );

  int GetScreenWidth() => run(
    () => 'GetScreenWidth()',
    () => rl.Core.GetScreenWidth(),
  );
    
  int GetScreenHeight() => run(
    () => 'GetScreenHeight()',
    () => rl.Core.GetScreenHeight(),
  );
    
  int GetRenderWidth() => run(
    () => 'GetRenderWidth()',
    () => rl.Core.GetRenderWidth(),
  );
    
  int GetRenderHeight() => run(
    () => 'GetRenderHeight()',
    () => rl.Core.GetRenderHeight(),
  );
    
  int GetMonitorCount() => run(
    () => 'GetMonitorCount()',
    () => rl.Core.GetMonitorCount(),
  );
    
  int GetCurrentMonitor() => run(
    () => 'GetCurrentMonitor()',
    () => rl.Core.GetCurrentMonitor(),
  );
    
  Vector2D GetMonitorPosition(
    num monitor,
  ) => run(
    () => 'GetMonitorPosition($monitor)',
    () => rl.Core.GetMonitorPosition(monitor.toInt()).toD(),
  );
    
  int GetMonitorWidth(
    num monitor,
  ) => run(
    () => 'GetMonitorWidth($monitor)',
    () => rl.Core.GetMonitorWidth(monitor.toInt()),
  );
    
  int GetMonitorHeight(
    num monitor,
  ) => run(
    () => 'GetMonitorHeight($monitor)',
    () => rl.Core.GetMonitorHeight(monitor.toInt()),
  );
    
  int GetMonitorPhysicalWidth(
    num monitor,
  ) => run(
    () => 'GetMonitorPhysicalWidth($monitor)',
    () => rl.Core.GetMonitorPhysicalWidth(monitor.toInt()),
  );
    
  int GetMonitorPhysicalHeight(
    num monitor,
  ) => run(
    () => 'GetMonitorPhysicalHeight($monitor)',
    () => rl.Core.GetMonitorPhysicalHeight(monitor.toInt()),
  );
    
  int GetMonitorRefreshRate(
    num monitor,
  ) => run(
    () => 'GetMonitorRefreshRate($monitor)',
    () => rl.Core.GetMonitorRefreshRate(monitor.toInt()),
  );
    
  Vector2D GetWindowPosition() => run(
    () => 'GetWindowPosition()',
    () => rl.Core.GetWindowPosition().toD(),
  );
    
  Vector2D GetWindowScaleDPI() => run(
    () => 'GetWindowScaleDPI()',
    () => rl.Core.GetWindowScaleDPI().toD(),
  );
    
  String GetMonitorName(
    num monitor,
  ) => run(
    () => 'GetMonitorName($monitor)',
    () => rl.Core.GetMonitorName(monitor.toInt()).toD,
  );
    
  void SetClipboardText(
    String text,
  ) => run(
    () => 'SetClipboardText($text)',
    () => rl.Core.SetClipboardText(
      rl.Temp.String$.ValueOrNull(text),
    ),
  );
    
  String GetClipboardText() => run(
    () => 'GetClipboardText()',
    () => rl.Core.GetClipboardText().toD,
  );
    
  ImageD GetClipboardImage() => run(
    () => 'GetClipboardImage()',
    () => rl.Temp.Image$.RefCapture(
      'GetClipboardImage',
      rl.Core.GetClipboardImage(),
    ),
  );
    
  void EnableEventWaiting() => run(
    () => 'EnableEventWaiting()',
    () => rl.Core.EnableEventWaiting(),
  );
    
  void DisableEventWaiting() => run(
    () => 'DisableEventWaiting()',
    () => rl.Core.DisableEventWaiting(),
  );
    
  void ShowCursor() => run(
    () => 'ShowCursor()',
    () => rl.Core.ShowCursor(),
  );
    
  void HideCursor() => run(
    () => 'HideCursor()',
    () => rl.Core.HideCursor(),
  );
    
  bool IsCursorHidden() => run(
    () => 'IsCursorHidden()',
    () => rl.Core.IsCursorHidden(),
  );
    
  void EnableCursor() => run(
    () => 'EnableCursor()',
    () => rl.Core.EnableCursor(),
  );
    
  void DisableCursor() => run(
    () => 'DisableCursor()',
    () => rl.Core.DisableCursor(),
  );
    
  bool IsCursorOnScreen() => run(
    () => 'IsCursorOnScreen()',
    () => rl.Core.IsCursorOnScreen(),
  );
    
  void ClearBackground(
    ColorD color,
  ) => run(
    () => 'ClearBackground($color)',
    () => rl.Core.ClearBackground(
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void BeginDrawing() => run(
    () => 'BeginDrawing()',
    () => rl.Core.BeginDrawing(),
  );
    
  void EndDrawing() => run(
    () => 'EndDrawing()',
    () => rl.Core.EndDrawing(),
  );
    
  void BeginMode2D(
    Camera2DD camera,
  ) => run(
    () => 'BeginMode2D($camera)',
    () => rl.Core.BeginMode2D(
      rl.Temp.Camera2D$.Ref1(camera).ref,
    ),
  );
    
  void EndMode2D() => run(
    () => 'EndMode2D()',
    () => rl.Core.EndMode2D(),
  );
    
  void BeginMode3D(
    Camera3DD camera,
  ) => run(
    () => 'BeginMode3D($camera)',
    () => rl.Core.BeginMode3D(
      rl.Temp.Camera3D$.Ref1(camera).ref,
    ),
  );
    
  void EndMode3D() => run(
    () => 'EndMode3D()',
    () => rl.Core.EndMode3D(),
  );
    
  void BeginTextureMode(
    RenderTexture2DD target,
  ) => run(
    () => 'BeginTextureMode($target)',
    () => rl.Core.BeginTextureMode(
      rl.Temp.RenderTexture$.Ref1(target).ref,
    ),
  );
    
  void EndTextureMode() => run(
    () => 'EndTextureMode()',
    () => rl.Core.EndTextureMode(),
  );
    
  void BeginShaderMode(
    ShaderD shader,
  ) => run(
    () => 'BeginShaderMode($shader)',
    () => rl.Core.BeginShaderMode(
      rl.Temp.Shader$.Ref1(shader).ref,
    ),
  );
    
  void EndShaderMode() => run(
    () => 'EndShaderMode()',
    () => rl.Core.EndShaderMode(),
  );
    
  void BeginBlendMode(
    BlendMode mode,
  ) => run(
    () => 'BeginBlendMode($mode)',
    () => rl.Core.BeginBlendMode(mode.value),
  );
    
  void EndBlendMode() => run(
    () => 'EndBlendMode()',
    () => rl.Core.EndBlendMode(),
  );
    
  void BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => run(
    () => 'BeginScissorMode($x, $y, $width, $height)',
    () => rl.Core.BeginScissorMode(
      x.toInt(),
      y.toInt(),
      width.toInt(),
      height.toInt(),
    ),
  );
    
  void EndScissorMode() => run(
    () => 'EndScissorMode()',
    () => rl.Core.EndScissorMode(),
  );
    
  // TODO: untested, no VR hardware
  void BeginVrStereoMode(
    VrStereoConfigD config,
  ) => run(
    () => 'BeginVrStereoMode($config)',
    () => rl.Core.BeginVrStereoMode(
      rl.Temp.VrStereoConfig$.Ref1(config).ref,
    ),
  );
    
  // TODO: untested, no VR hardware
  void EndVrStereoMode() => run(
    () => 'EndVrStereoMode()',
    () => rl.Core.EndVrStereoMode(),
  );
    
  // TODO: untested, no VR hardware
  VrStereoConfigD LoadVrStereoConfig(
    VrDeviceInfoD device,
  ) => run(
    () => 'LoadVrStereoConfig($device)',
    () => rl.Temp.VrStereoConfig$.RefCapture(
      'LoadVrStereoConfig_${device.internalId}',
      rl.Core.LoadVrStereoConfig(
        rl.Temp.VrDeviceInfo$.Ref1(device).ref,
      ),
    ),
  );
    
  // TODO: untested, no VR hardware
  void UnloadVrStereoConfig(
    VrStereoConfigD config,
  ) => run(
    () => 'UnloadVrStereoConfig($config)',
    () => rl.Core.UnloadVrStereoConfig(config.getOriginalPointerAndDispose().ref),
  );
    
  ShaderD LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => run(
    () => 'LoadShader($vsFileName, $fsFileName)',
    () => rl.Temp.Shader$.RefCapture(
      'LoadShader_${vsFileName ?? 'default'}_${fsFileName ?? 'default'}',
      rl.Core.LoadShader(
        rl.Temp.String$.ValueOrNull(vsFileName),
        rl.Temp.String$.ValueOrNull(fsFileName),
      ),
    ),
  );
    
  ShaderD LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => run(
    () => 'LoadShaderFromMemory($vsCode, $fsCode)',
    () => rl.Temp.Shader$.RefCapture(
      'LoadShaderFromMemory',
      rl.Core.LoadShaderFromMemory(
        rl.Temp.String$.ValueOrNull(vsCode),
        rl.Temp.String$.ValueOrNull(fsCode),
      ),
    ),
  );
    
  bool IsShaderValid(
    ShaderD shader,
  ) => run(
    () => 'IsShaderValid($shader)',
    () => rl.Core.IsShaderValid(
      rl.Temp.Shader$.Ref1(shader).ref,
    ),
  );
    
  int GetShaderLocation(
    ShaderD shader,
    String uniformName,
  ) => run(
    () => 'GetShaderLocation($shader, $uniformName)',
    () => rl.Core.GetShaderLocation(
      rl.Temp.Shader$.Ref1(shader).ref,
      rl.Temp.String$.ValueOrNull(uniformName),
    ),
  );
    
  int GetShaderLocationAttrib(
    ShaderD shader,
    String attribName,
  ) => run(
    () => 'GetShaderLocationAttrib($shader, $attribName)',
    () => rl.Core.GetShaderLocationAttrib(
      rl.Temp.Shader$.Ref1(shader).ref,
      rl.Temp.String$.ValueOrNull(attribName),
    ),
  );
  
  @DoNotValidate()
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

  void SetShaderValueV(
    ShaderD shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  ) => run(
    () => 'SetShaderValueV($shader, $locIndex, $value, ${uniformType.name}, $count)',
    () {
      final ptr = switch (uniformType) {
        .SHADER_UNIFORM_FLOAT ||
        .SHADER_UNIFORM_VEC2  ||
        .SHADER_UNIFORM_VEC3  ||
        .SHADER_UNIFORM_VEC4  => rl.Temp.Float$.Array(value, key: 'SetShaderValueV_Float'),
        
        .SHADER_UNIFORM_INT   ||
        .SHADER_UNIFORM_IVEC2 ||
        .SHADER_UNIFORM_IVEC3 ||
        .SHADER_UNIFORM_IVEC4 => rl.Temp.Int$.Array(value, key: 'SetShaderValueV_Int'),
        
        .SHADER_UNIFORM_SAMPLER2D => rl.Temp.Int$.Array(value, key: 'SetShaderValueV_Int'),
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
    
  void SetShaderValueMatrix(
    ShaderD shader,
    num locIndex,
    MatrixD mat,
  ) => run(
    () => 'SetShaderValueMatrix($shader, $locIndex, $mat)',
    () => rl.Core.SetShaderValueMatrix(
      rl.Temp.Shader$.Ref1(shader).ref,
      locIndex.toInt(),
      rl.Temp.Matrix$.Ref1(mat).ref,
    ),
  );
    
  void SetShaderValueTexture(
    ShaderD shader,
    num locIndex,
    Texture2DD texture,
  ) => run(
    () => 'SetShaderValueTexture($shader, $locIndex, $texture)',
    () => rl.Core.SetShaderValueTexture(
      rl.Temp.Shader$.Ref1(shader).ref,
      locIndex.toInt(),
      rl.Temp.Texture$.Ref1(texture).ref,
    ),
  );
    
  void UnloadShader(
    ShaderD shader,
  ) => run(
    () => 'UnloadShader($shader)',
    () => rl.Core.UnloadShader(shader.getOriginalPointerAndDispose().ref),
  );
    
  RayD GetScreenToWorldRay(
    Vector2D position,
    CameraD camera,
  ) => run(
    () => 'GetScreenToWorldRay($position, $camera)',
    () => rl.Core.GetScreenToWorldRay(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Camera3D$.Ref1(camera).ref,
    ).toD(),
  );
    
  RayD GetScreenToWorldRayEx(
    Vector2D position,
    CameraD camera,
    num width,
    num height,
  ) => run(
    () => 'GetScreenToWorldRayEx($position, $camera, $width, $height)',
    () => rl.Core.GetScreenToWorldRayEx(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Camera3D$.Ref1(camera).ref,
      width.toInt(),
      height.toInt(),
    ).toD(),
  );

  Vector2D GetWorldToScreen(
    Vector3D position,
    CameraD camera,
  ) => run(
    () => 'GetWorldToScreen($position, $camera)',
    () => rl.Core.GetWorldToScreen(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Camera3D$.Ref1(camera).ref,
    ).toD(),
  );

  Vector2D GetWorldToScreenEx(
    Vector3D position,
    CameraD camera,
    num width,
    num height,
  ) => run(
    () => 'GetWorldToScreenEx($position, $camera, $width, $height)',
    () => rl.Core.GetWorldToScreenEx(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Camera3D$.Ref1(camera).ref,
      width.toInt(),
      height.toInt(),
    ).toD(),
  );

  Vector2D GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => 'GetWorldToScreen2D($position, $camera)',
    () => rl.Core.GetWorldToScreen2D(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Camera2D$.Ref1(camera).ref,
    ).toD(),
  );

  Vector2D GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => 'GetScreenToWorld2D($position, $camera)',
    () => rl.Core.GetScreenToWorld2D(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Camera2D$.Ref1(camera).ref,
    ).toD(),
  );

  MatrixD GetCameraMatrix(
    CameraD camera,
  ) => run(
    () => 'GetCameraMatrix($camera)',
    () => rl.Core.GetCameraMatrix(
      rl.Temp.Camera3D$.Ref1(camera).ref,
    ).toD(),
  );

  MatrixD GetCameraMatrix2D(
    Camera2DD camera,
  ) => run(
    () => 'GetCameraMatrix2D($camera)',
    () => rl.Core.GetCameraMatrix2D(
      rl.Temp.Camera2D$.Ref1(camera).ref,
    ).toD(),
  );
    
  void SetTargetFPS(
    num fps,
  ) => run(
    () => 'SetTargetFPS($fps)',
    () => rl.Core.SetTargetFPS(fps.toInt()),
  );

  double GetFrameTime() => run(
    () => 'GetFrameTime()',
    () => rl.Core.GetFrameTime(),
  );

  double GetTime() => run(
    () => 'GetTime()',
    () => rl.Core.GetTime(),
  );

  int GetFPS() => run(
    () => 'GetFPS()',
    () => rl.Core.GetFPS(),
  );

  void SwapScreenBuffer() => run(
    () => 'SwapScreenBuffer()',
    () => rl.Core.SwapScreenBuffer(),
  );

  void PollInputEvents() => run(
    () => 'PollInputEvents()',
    () => rl.Core.PollInputEvents(),
  );

  void WaitTime(
    num seconds,
  ) => run(
    () => 'WaitTime($seconds)',
    () => rl.Core.WaitTime(seconds.toDouble()),
  );

  void SetRandomSeed(
    num seed,
  ) => run(
    () => 'SetRandomSeed($seed)',
    () => rl.Core.SetRandomSeed(seed.toInt()),
  );

  int GetRandomValue(
    num min,
    num max,
  ) => run(
    () => 'GetRandomValue($min, $max)',
    () => rl.Core.GetRandomValue(min.toInt(), max.toInt()),
  );
  
  List<int> LoadRandomSequence(
    int count,
    int min,
    int max,
    [int? seed]
  ) => run(
    () => 'LoadRandomSequence($count, $min, $max, seed: $seed)',
    () {
      final random = Random(seed);
      return .generate(count, (_) => min + random.nextInt(max - min + 1));
    },
  );
    
  void TakeScreenshot(
    String fileName,
  ) => run(
    () => 'TakeScreenshot($fileName)',
    () => rl.Core.TakeScreenshot(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  void SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => 'SetConfigFlags(${flags.map((e) => e.name).join(' | ')})',
    () => rl.Core.SetConfigFlags(flags.or),
  );

  void OpenURL(
    String url,
  ) => run(
    () => 'OpenURL($url)',
    () => rl.Core.OpenURL(
      rl.Temp.String$.ValueOrNull(url),
    ),
  );

  void TraceLog(
    TraceLogLevel logLevel,
    String text,
  ) => run(
    () => 'TraceLog(${logLevel.name}, $text)',
    () => rl.Core.TraceLog(
      logLevel.value,
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => run(
    () => 'SetTraceLogLevel(${logLevel.name})',
    () => rl.Core.SetTraceLogLevel(logLevel.value),
  );
    
  void SetLoadFileDataCallback(
    LoadFileDataCallbackD? callback
  ) => run(
    () => 'SetLoadFileDataCallback($callback)',
    () => rl.Core.SetLoadFileDataCallback(callback?.attach() ?? nullptr),
  );
    
  void SetSaveFileDataCallback(
    SaveFileDataCallbackD? callback
  ) => run(
    () => 'SetSaveFileDataCallback($callback)',
    () => rl.Core.SetSaveFileDataCallback(callback?.attach() ?? nullptr),
  );
    
  void SetLoadFileTextCallback(
    LoadFileTextCallbackD? callback
  ) => run(
    () => 'SetLoadFileTextCallback($callback)',
    () => rl.Core.SetLoadFileTextCallback(callback?.attach() ?? nullptr),
  );
    
  void SetSaveFileTextCallback(
    SaveFileTextCallbackD? callback
  ) => run(
    () => 'SetSaveFileTextCallback($callback)',
    () => rl.Core.SetSaveFileTextCallback(callback?.attach() ?? nullptr),
  );
    
  List<int> LoadFileData(
    String fileName,
  ) => run(
    () => 'LoadFileData($fileName)',
    () {
      final fileSize = rl.Temp.Int$.Ref1();
      final data = rl.Core.LoadFileData(
        rl.Temp.String$.ValueOrNull(fileName),
        fileSize,
      );
      final listData = rl.Temp.UnsignedChar$.asDartList(data, fileSize.value);
      rl.Core.UnloadFileData(data);
      return listData.cast();
    },
  );

  bool SaveFileData(
    String fileName,
    List<int> data,
  ) => run(
    () => 'SaveFileData($fileName, data: ${data.length})',
    () => rl.Core.SaveFileData(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.Uint8$.Array(data).cast(),
      data.length,
    ),
  );

  bool ExportDataAsCode(
    List<int> data,
    String fileName,
  ) => run(
    () => 'ExportDataAsCode(data: ${data.length}, $fileName)',
    () => rl.Core.ExportDataAsCode(
      rl.Temp.Uint8$.Array(data).cast(),
      data.length,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  String LoadFileText(
    String fileName,
  ) => run(
    () => 'LoadFileText($fileName)',
    () {
      final text = rl.Core.LoadFileText(
        rl.Temp.String$.ValueOrNull(fileName),
      );
      final fileText = text.toD;
      rl.Core.UnloadFileText(text);
      return fileText;
    },
  );

  bool SaveFileText(
    String fileName,
    String text,
  ) => run(
    () => 'SaveFileText($fileName, $text)',
    () => rl.Core.SaveFileText(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(text),
    ),
  );
    
  bool FileExists(
    String fileName,
  ) => run(
    () => 'FileExists($fileName)',
    () => rl.Core.FileExists(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  bool DirectoryExists(
    String dirPath,
  ) => run(
    () => 'DirectoryExists($dirPath)',
    () => rl.Core.DirectoryExists(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );

  bool IsFileExtension(
    String fileName,
    String ext,
  ) => run(
    () => 'IsFileExtension($fileName, $ext)',
    () => rl.Core.IsFileExtension(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(ext),
    ),
  );

  int GetFileLength(
    String fileName,
  ) => run(
    () => 'GetFileLength($fileName)',
    () => rl.Core.GetFileLength(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  String GetFileExtension(
    String fileName,
  ) => run(
    () => 'GetFileExtension($fileName)',
    () => rl.Core.GetFileExtension(
      rl.Temp.String$.ValueOrNull(fileName),
    ).toD,
  );

  String GetFileName(
    String filePath,
  ) => run(
    () => 'GetFileName($filePath)',
    () => rl.Core.GetFileName(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toD,
  );

  String GetFileNameWithoutExt(
    String filePath,
  ) => run(
    () => 'GetFileNameWithoutExt($filePath)',
    () => rl.Core.GetFileNameWithoutExt(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toD,
  );

  String GetDirectoryPath(
    String filePath,
  ) => run(
    () => 'GetDirectoryPath($filePath)',
    () => rl.Core.GetDirectoryPath(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toD,
  );

  String GetPrevDirectoryPath(
    String dirPath,
  ) => run(
    () => 'GetPrevDirectoryPath($dirPath)',
    () => rl.Core.GetPrevDirectoryPath(
      rl.Temp.String$.ValueOrNull(dirPath),
    ).toD,
  );

  String GetWorkingDirectory() => run(
    () => 'GetWorkingDirectory()',
    () => rl.Core.GetWorkingDirectory().toD,
  );

  String GetApplicationDirectory() => run(
    () => 'GetApplicationDirectory()',
    () => rl.Core.GetApplicationDirectory().toD,
  );

  int MakeDirectory(
    String dirPath,
  ) => run(
    () => 'MakeDirectory($dirPath)',
    () => rl.Core.MakeDirectory(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );

  bool ChangeDirectory(
    String dir,
  ) => run(
    () => 'ChangeDirectory($dir)',
    () => rl.Core.ChangeDirectory(
      rl.Temp.String$.ValueOrNull(dir),
    ),
  );

  bool IsPathFile(
    String path,
  ) => run(
    () => 'IsPathFile($path)',
    () => rl.Core.IsPathFile(
      rl.Temp.String$.ValueOrNull(path),
    ),
  );

  bool IsFileNameValid(
    String fileName,
  ) => run(
    () => 'IsFileNameValid($fileName)',
    () => rl.Core.IsFileNameValid(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  FilePathListD LoadDirectoryFiles(
    String dirPath,
  ) => run(
    () => 'LoadDirectoryFiles($dirPath)',
    () => rl.Temp.FilePathList$.RefCapture(
      'LoadDirectoryFiles_$dirPath',
      rl.Core.LoadDirectoryFiles(
        rl.Temp.String$.ValueOrNull(dirPath),
      ),
    ),
  );
    
  FilePathListD LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => run(
    () => 'LoadDirectoryFilesEx($basePath, $filter, $scanSubdirs)',
    () => rl.Temp.FilePathList$.RefCapture(
      'LoadDirectoryFilesEx_$basePath',
      rl.Core.LoadDirectoryFilesEx(
        rl.Temp.String$.ValueOrNull(basePath),
        rl.Temp.String$.ValueOrNull(filter),
        scanSubdirs,
      ),
    ),
  );
    
  bool IsFileDropped() => run(
    () => 'IsFileDropped()',
    () => rl.Core.IsFileDropped(),
  );
    
  FilePathListD LoadDroppedFiles() => run(
    () => 'LoadDroppedFiles()',
    () => rl.Temp.FilePathList$.RefCapture(
      'LoadDroppedFiles',
      rl.Core.LoadDroppedFiles(),
    ),
  );

  void UnloadDroppedFiles(
    FilePathListD files,
  ) => run(
    () => 'UnloadDroppedFiles($files)',
    () => rl.Core.UnloadDroppedFiles(files.getOriginalPointerAndDispose().ref),
  );

  int GetFileModTime(
    String fileName,
  ) => run(
    () => 'GetFileModTime($fileName)',
    () => rl.Core.GetFileModTime(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  List<int> CompressData(
    List<int> data,
  ) => run(
    () => 'CompressData(data: ${data.length})',
    () {
      final compDataSize = rl.Temp.Int$.Ref1();
      final compData = rl.Core.CompressData(
        rl.Temp.Uint8$.Array(data).cast(),
        data.length,
        compDataSize,
      );
      return rl.Temp.UnsignedChar$.asDartList(compData, compDataSize.value).cast();
    },
  );

  List<int> DecompressData(
    List<int> compData,
  ) => run(
    () => 'DecompressData(compData: ${compData.length})',
    () {
      final dataSize = rl.Temp.Int$.Ref1();
      final data = rl.Core.DecompressData(
        rl.Temp.Uint8$.Array(compData).cast(),
        compData.length,
        dataSize,
      );
      return rl.Temp.UnsignedChar$.asDartList(data, dataSize.value).cast();
    },
  );

  List<int> EncodeDataBase64(
    List<int> data,
  ) => run(
    () => 'EncodeDataBase64(data: ${data.length})',
    () {
      final outputSize = rl.Temp.Int$.Ref1();
      final outputData = rl.Core.EncodeDataBase64(
        rl.Temp.Uint8$.Array(data).cast(),
        data.length,
        outputSize,
      );
      return rl.Temp.Char$.asDartList(outputData, outputSize.value).cast();
    },
  );

  List<int> DecodeDataBase64(
    List<int> data,
  ) => run(
    () => 'DecodeDataBase64(data: ${data.length})',
    () {
      final outputSize = rl.Temp.Int$.Ref1();
      final outputData = rl.Core.DecodeDataBase64(
        rl.Temp.Uint8$.Array(data).cast(),
        outputSize
      );
      return rl.Temp.UnsignedChar$.asDartList(outputData, outputSize.value).cast();
    },
  );

  int ComputeCRC32(
    List<int> data,
  ) => run(
    () => 'ComputeCRC32(data: ${data.length})',
    () => rl.Core.ComputeCRC32(
      rl.Temp.Uint8$.Array(data).cast(),
      data.length
    ),
  );

  List<int> ComputeMD5(
    List<int> data,
  ) => run(
    () => 'ComputeMD5(data: ${data.length})',
    () {
      const int hashLength = 4; 

      final md5 = rl.Core.ComputeMD5(
        rl.Temp.Uint8$.Array(data).cast(),
        data.length
      );

      return rl.Temp.UnsignedInt$.ToLEBytes(md5, hashLength);
    },
  );

  List<int> ComputeSHA1(
    List<int> data,
  ) => run(
    () => 'ComputeSHA1(data: ${data.length})',
    () {
      const int hashLength = 5; 

      final sha1 = rl.Core.ComputeSHA1(
        rl.Temp.Uint8$.Array(data).cast(),
        data.length
      );

      return rl.Temp.UnsignedInt$.ToBEBytes(sha1, hashLength);
    },
  );
    
  AutomationEventListD LoadAutomationEventList(
    String? fileName,
  ) => run(
    () => 'LoadAutomationEventList($fileName)',
    () => rl.Temp.AutomationEventList$.RefCapture(
      'LoadAutomationEventList_$fileName',
      rl.Core.LoadAutomationEventList(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );
    
  void UnloadAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => 'UnloadAutomationEventList($list)',
    () => rl.Core.UnloadAutomationEventList(list.getOriginalPointerAndDispose().ref),
  );
    
  bool ExportAutomationEventList(
    AutomationEventListD list,
    String fileName,
  ) => run(
    () => 'ExportAutomationEventList($list, $fileName)',
    () => rl.Core.ExportAutomationEventList(
      rl.Temp.AutomationEventList$.Ref1(list).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  void SetAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => 'SetAutomationEventList($list)',
    () => rl.Core.SetAutomationEventList(
      rl.Temp.AutomationEventList$.Ref1(list),
    ),
  );
    
  void SetAutomationEventBaseFrame(
    int frame,
  ) => run(
    () => 'SetAutomationEventBaseFrame($frame)',
    () => rl.Core.SetAutomationEventBaseFrame(frame),
  );
    
  void StartAutomationEventRecording() => run(
    () => 'StartAutomationEventRecording()',
    () => rl.Core.StartAutomationEventRecording(),
  );

  void StopAutomationEventRecording() => run(
    () => 'StopAutomationEventRecording()',
    () => rl.Core.StopAutomationEventRecording(),
  );
    
  void PlayAutomationEvent(
    AutomationEventD event,
  ) => run(
    () => 'PlayAutomationEvent($event)',
    () => rl.Core.PlayAutomationEvent(
      rl.Temp.AutomationEvent$.Ref1(event).ref,
    ),
  );

  bool IsKeyPressed(
    KeyboardKey key,
  ) => run(
    () => 'IsKeyPressed(${key.name})',
    () => rl.Core.IsKeyPressed(key.value),
  );

  bool IsKeyPressedRepeat(
    KeyboardKey key,
  ) => run(
    () => 'IsKeyPressedRepeat(${key.name})',
    () => rl.Core.IsKeyPressedRepeat(key.value),
  );

  bool IsKeyDown(
    KeyboardKey key,
  ) => run(
    () => 'IsKeyDown(${key.name})',
    () => rl.Core.IsKeyDown(key.value),
  );

  bool IsKeyReleased(
    KeyboardKey key,
  ) => run(
    () => 'IsKeyReleased(${key.name})',
    () => rl.Core.IsKeyReleased(key.value),
  );

  bool IsKeyUp(
    KeyboardKey key,
  ) => run(
    () => 'IsKeyUp(${key.name})',
    () => rl.Core.IsKeyUp(key.value),
  );

  int GetKeyPressed() => run(
    () => 'GetKeyPressed()',
    () => rl.Core.GetKeyPressed(),
  );

  int GetCharPressed() => run(
    () => 'GetCharPressed()',
    () => rl.Core.GetCharPressed(),
  );

  void SetExitKey(
    KeyboardKey key,
  ) => run(
    () => 'SetExitKey(${key.name})',
    () => rl.Core.SetExitKey(key.value),
  );

  bool IsGamepadAvailable(
    num gamepad,
  ) => run(
    () => 'IsGamepadAvailable($gamepad)',
    () => rl.Core.IsGamepadAvailable(gamepad.toInt()),
  );

  String GetGamepadName(
    num gamepad,
  ) => run(
    () => 'GetGamepadName($gamepad)',
    () => rl.Core.GetGamepadName(gamepad.toInt()).toD,
  );

  bool IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => 'IsGamepadButtonPressed($gamepad, ${button.name})',
    () => rl.Core.IsGamepadButtonPressed(
      gamepad.toInt(),
      button.value,
    ),
  );

  bool IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => 'IsGamepadButtonDown($gamepad, ${button.name})',
    () => rl.Core.IsGamepadButtonDown(
      gamepad.toInt(),
      button.value,
    ),
  );

  bool IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => 'IsGamepadButtonReleased($gamepad, ${button.name})',
    () => rl.Core.IsGamepadButtonReleased(
      gamepad.toInt(),
      button.value,
    ),
  );

  bool IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => 'IsGamepadButtonUp($gamepad, ${button.name})',
    () => rl.Core.IsGamepadButtonUp(
      gamepad.toInt(),
      button.value,
    ),
  );

  GamepadButton GetGamepadButtonPressed() => run(
    () => 'GetGamepadButtonPressed()',
    () => GamepadButton.fromValue(rl.Core.GetGamepadButtonPressed()),
  );

  int GetGamepadAxisCount(
    num gamepad,
  ) => run(
    () => 'GetGamepadAxisCount($gamepad)',
    () => rl.Core.GetGamepadAxisCount(gamepad.toInt()),
  );

  double GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => run(
    () => 'GetGamepadAxisMovement($gamepad, $axis)',
    () => rl.Core.GetGamepadAxisMovement(
      gamepad.toInt(),
      axis.value,
    ),
  );

  int SetGamepadMappings(
    String mappings,
  ) => run(
    () => 'SetGamepadMappings($mappings)',
    () => rl.Core.SetGamepadMappings(
      rl.Temp.String$.ValueOrNull(mappings),
    ),
  );
    
  void SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => run(
    () => 'SetGamepadVibration($gamepad, $leftMotor, $rightMotor, $duration)',
    () => rl.Core.SetGamepadVibration(
      gamepad.toInt(),
      leftMotor.toDouble(),
      rightMotor.toDouble(),
      duration.toDouble(),
    ),
  );

  bool IsMouseButtonPressed(
    MouseButton button,
  ) => run(
    () => 'IsMouseButtonPressed(${button.name})',
    () => rl.Core.IsMouseButtonPressed(button.value),
  );

  bool IsMouseButtonDown(
    MouseButton button,
  ) => run(
    () => 'IsMouseButtonDown(${button.name})',
    () => rl.Core.IsMouseButtonDown(button.value),
  );

  bool IsMouseButtonReleased(
    MouseButton button,
  ) => run(
    () => 'IsMouseButtonReleased(${button.name})',
    () => rl.Core.IsMouseButtonReleased(button.value),
  );

  bool IsMouseButtonUp(
    MouseButton button,
  ) => run(
    () => 'IsMouseButtonUp(${button.name})',
    () => rl.Core.IsMouseButtonUp(button.value),
  );

  int GetMouseX() => run(
    () => 'GetMouseX()',
    () => rl.Core.GetMouseX(),
  );

  int GetMouseY() => run(
    () => 'GetMouseY()',
    () => rl.Core.GetMouseY(),
  );

  Vector2D GetMousePosition() => run(
    () => 'GetMousePosition()',
    () => rl.Core.GetMousePosition().toD(),
  );

  Vector2D GetMouseDelta() => run(
    () => 'GetMouseDelta()',
    () => rl.Core.GetMouseDelta().toD(),
  );

  void SetMousePosition(
    num x,
    num y,
  ) => run(
    () => 'SetMousePosition($x, $y)',
    () => rl.Core.SetMousePosition(
      x.toInt(),
      y.toInt(),
    ),
  );

  void SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => run(
    () => 'SetMouseOffset($offsetX, $offsetY)',
    () => rl.Core.SetMouseOffset(
      offsetX.toInt(),
      offsetY.toInt(),
    ),
  );

  void SetMouseScale(
    num scaleX,
    num scaleY,
  ) => run(
    () => 'SetMouseScale($scaleX, $scaleY)',
    () => rl.Core.SetMouseScale(
      scaleX.toDouble(),
      scaleY.toDouble(),
    ),
  );

  double GetMouseWheelMove() => run(
    () => 'GetMouseWheelMove()',
    () => rl.Core.GetMouseWheelMove(),
  );

  Vector2D GetMouseWheelMoveV() => run(
    () => 'GetMouseWheelMoveV()',
    () => rl.Core.GetMouseWheelMoveV().toD(),
  );

  void SetMouseCursor(
    MouseCursor cursor,
  ) => run(
    () => 'SetMouseCursor(${cursor.name})',
    () => rl.Core.SetMouseCursor(cursor.value),
  );

  int GetTouchX() => run(
    () => 'GetTouchX()',
    () => rl.Core.GetTouchX(),
  );

  int GetTouchY() => run(
    () => 'GetTouchY()',
    () => rl.Core.GetTouchY(),
  );

  Vector2D GetTouchPosition(
    num index,
  ) => run(
    () => 'GetTouchPosition($index)',
    () => rl.Core.GetTouchPosition(index.toInt()).toD(),
  );

  int GetTouchPointId(
    num index,
  ) => run(
    () => 'GetTouchPointId($index)',
    () => rl.Core.GetTouchPointId(index.toInt()),
  );

  int GetTouchPointCount() => run(
    () => 'GetTouchPointCount()',
    () => rl.Core.GetTouchPointCount(),
  );

  void SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => run(
    () => 'SetGesturesEnabled($flags)',
    () => rl.Core.SetGesturesEnabled(flags.or),
  );

  bool IsGestureDetected(
    Gesture gesture,
  ) => run(
    () => 'IsGestureDetected($gesture)',
    () => rl.Core.IsGestureDetected(gesture.value),
  );

  Gesture GetGestureDetected() => run(
    () => 'GetGestureDetected()',
    () => Gesture.fromValue(rl.Core.GetGestureDetected()),
  );

  double GetGestureHoldDuration() => run(
    () => 'GetGestureHoldDuration()',
    () => rl.Core.GetGestureHoldDuration(),
  );

  Vector2D GetGestureDragVector() => run(
    () => 'GetGestureDragVector()',
    () => rl.Core.GetGestureDragVector().toD(),
  );

  double GetGestureDragAngle() => run(
    () => 'GetGestureDragAngle()',
    () => rl.Core.GetGestureDragAngle(),
  );

  Vector2D GetGesturePinchVector() => run(
    () => 'GetGesturePinchVector()',
    () => rl.Core.GetGesturePinchVector().toD(),
  );

  double GetGesturePinchAngle() => run(
    () => 'GetGesturePinchAngle()',
    () => rl.Core.GetGesturePinchAngle(),
  );
    
  void UpdateCamera(
    CameraD camera,
    CameraMode mode,
  ) => run(
    () => 'UpdateCamera($camera, $mode)',
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (p) => rl.Core.UpdateCamera(p, mode.value),
    ),
  );

  void UpdateCameraPro(
    CameraD camera,
    Vector3D movement,
    Vector3D rotation,
    num zoom,
  ) => run(
    () => 'UpdateCameraPro($camera, $movement, $rotation, $zoom)',
    () => rl.Temp.Camera3D$.RefUpdate1(camera,
      (p) => rl.Core.UpdateCameraPro(
        p,
        rl.Temp.Vector3$.Ref1(movement).ref,
        rl.Temp.Vector3$.Ref2(rotation).ref,
        zoom.toDouble(),
      ),
    ),
  );

  void SetShapesTexture(
    Texture2DD texture,
    RectangleD source,
  ) => run(
    () => 'SetShapesTexture($texture, $source)',
    () => rl.Core.SetShapesTexture(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Rectangle$.Ref1(source).ref,
    ),
  );

  Texture2DD GetShapesTexture() => run(
    () => 'GetShapesTexture()',
    () => rl.Core.GetShapesTexture().toD(),
  );

  RectangleD GetShapesTextureRectangle() => run(
    () => 'GetShapesTextureRectangle()',
    () => rl.Core.GetShapesTextureRectangle().toD(),
  );

  void DrawPixel(
    num posX,
    num posY,
    ColorD color,
  ) => run(
    () => 'DrawPixel($posX, $posY, $color)',
    () => rl.Core.DrawPixel(
      posX.toInt(),
      posY.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawPixelV(
    Vector2D position,
    ColorD color,
  ) => run(
    () => 'DrawPixelV($position, $color)',
    () => rl.Core.DrawPixelV(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => run(
    () => 'DrawLine($startPosX, $startPosY, $endPosX, $endPosY, $color)',
    () => rl.Core.DrawLine(
      startPosX.toInt(),
      startPosY.toInt(),
      endPosX.toInt(),
      endPosY.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  ) => run(
    () => 'DrawLineV($startPos, $endPos, $color)',
    () => rl.Core.DrawLineV(
      rl.Temp.Vector2$.Ref1(startPos).ref,
      rl.Temp.Vector2$.Ref2(endPos).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawLineEx(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawLineEx($startPos, $endPos, $thick, $color)',
    () => rl.Core.DrawLineEx(
      rl.Temp.Vector2$.Ref1(startPos).ref,
      rl.Temp.Vector2$.Ref2(endPos).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawLineStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => 'DrawLineStrip(points: ${points.length}, $color)',
    () => rl.Core.DrawLineStrip(
      rl.Temp.Vector2$.Array(points),
      points.length,
      rl.Temp.Color$.Ref1(color).ref
    ),
  );

  void DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawLineBezier($startPos, $endPos, $thick, $color)',
    () => rl.Core.DrawLineBezier(
      rl.Temp.Vector2$.Ref1(startPos).ref,
      rl.Temp.Vector2$.Ref2(endPos).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => 'DrawCircle($centerX, $centerY, $radius, $color)',
    () => rl.Core.DrawCircle(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawCircleSector(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => 'DrawCircleSector($center, $radius, $startAngle, $endAngle, $segments, $color)',
    () => rl.Core.DrawCircleSector(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawCircleSectorLines(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => 'DrawCircleSectorLines($center, $radius, $startAngle, $endAngle, $segments, $color)',
    () => rl.Core.DrawCircleSectorLines(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawCircleGradient(
    num centerX,
    num centerY,
    num radius,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => 'DrawCircleGradient($centerX, $centerY, $radius, $inner, $outer)',
    () => rl.Core.DrawCircleGradient(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      rl.Temp.Color$.Ref1(inner).ref,
      rl.Temp.Color$.Ref2(outer).ref,
    ),
  );

  void DrawCircleV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => 'DrawCircleV($center, $radius, $color)',
    () => rl.Core.DrawCircleV(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => 'DrawCircleLines($centerX, $centerY, $radius, $color)',
    () => rl.Core.DrawCircleLines(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawCircleLinesV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => 'DrawCircleLinesV($center, $radius, $color)',
    () => rl.Core.DrawCircleLinesV(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => 'DrawEllipse($centerX, $centerY, $radiusH, $radiusV, $color)',
    () => rl.Core.DrawEllipse(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => 'DrawEllipseLines($centerX, $centerY, $radiusH, $radiusV, $color)',
    () => rl.Core.DrawEllipseLines(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawRing(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => 'DrawRing($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)',
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

  void DrawRingLines(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => 'DrawRingLines($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)',
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

  void DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => 'DrawRectangle($posX, $posY, $width, $height, $color)',
    () => rl.Core.DrawRectangle(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => run(
    () => 'DrawRectangleV($position, $size, $color)',
    () => rl.Core.DrawRectangleV(
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Vector2$.Ref2(size).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  ) => run(
    () => 'DrawRectangleRec($rec, $color)',
    () => rl.Core.DrawRectangleRec(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawRectanglePro(
    RectangleD rec,
    Vector2D origin,
    num rotation,
    ColorD color,
  ) => run(
    () => 'DrawRectanglePro($rec, $origin, $rotation, $color)',
    () => rl.Core.DrawRectanglePro(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      rl.Temp.Vector2$.Ref1(origin).ref,
      rotation.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorD top,
    ColorD bottom,
  ) => run(
    () => 'DrawRectangleGradientV($posX, $posY, $width, $height, $top, $bottom)',
    () => rl.Core.DrawRectangleGradientV(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      rl.Temp.Color$.Ref1(top).ref,
      rl.Temp.Color$.Ref2(bottom).ref,
    ),
  );

  void DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorD left,
    ColorD right,
  ) => run(
    () => 'DrawRectangleGradientH($posX, $posY, $width, $height, $left, $right)',
    () => rl.Core.DrawRectangleGradientH(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      rl.Temp.Color$.Ref1(left).ref,
      rl.Temp.Color$.Ref2(right).ref,
    ),
  );

  void DrawRectangleGradientEx(
    RectangleD rec,
    ColorD topLeft,
    ColorD bottomLeft,
    ColorD topRight,
    ColorD bottomRight,
  ) => run(
    () => 'DrawRectangleGradientEx($rec, $topLeft, $bottomLeft, $topRight, $bottomRight)',
    () => rl.Core.DrawRectangleGradientEx(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      rl.Temp.Color$.Ref1(topLeft).ref,
      rl.Temp.Color$.Ref2(bottomLeft).ref,
      rl.Temp.Color$.Ref3(topRight).ref,
      rl.Temp.Color$.Ref4(bottomRight).ref,
    ),
  );

  void DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => 'DrawRectangleLines($posX, $posY, $width, $height, $color)',
    () => rl.Core.DrawRectangleLines(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawRectangleLinesEx(
    RectangleD rec,
    num lineThick,
    ColorD color,
  ) => run(
    () => 'DrawRectangleLinesEx($rec, $lineThick, $color)',
    () => rl.Core.DrawRectangleLinesEx(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      lineThick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawRectangleRounded(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => run(
    () => 'DrawRectangleRounded($rec, $roundness, $segments, $color)',
    () => rl.Core.DrawRectangleRounded(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      roundness.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawRectangleRoundedLines(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => run(
    () => 'DrawRectangleRoundedLines($rec, $roundness, $segments, $color)',
    () => rl.Core.DrawRectangleRoundedLines(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      roundness.toDouble(),
      segments.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawRectangleRoundedLinesEx(
    RectangleD rec,
    num roundness,
    num segments,
    num lineThick,
    ColorD color,
  ) => run(
    () => 'DrawRectangleRoundedLinesEx($rec, $roundness, $segments, $lineThick, $color)',
    () => rl.Core.DrawRectangleRoundedLinesEx(
      rl.Temp.Rectangle$.Ref1(rec).ref,
      roundness.toDouble(),
      segments.toInt(),
      lineThick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawTriangle(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => 'DrawTriangle($v1, $v2, $v3, $color)',
    () => rl.Core.DrawTriangle(
      rl.Temp.Vector2$.Ref1(v1).ref,
      rl.Temp.Vector2$.Ref2(v2).ref,
      rl.Temp.Vector2$.Ref3(v3).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawTriangleLines(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => 'DrawTriangleLines($v1, $v2, $v3, $color)',
    () => rl.Core.DrawTriangleLines(
      rl.Temp.Vector2$.Ref1(v1).ref,
      rl.Temp.Vector2$.Ref2(v2).ref,
      rl.Temp.Vector2$.Ref3(v3).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawTriangleFan(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => 'DrawTriangleFan(points: ${points.length}, $color)',
    () => rl.Core.DrawTriangleFan(
      rl.Temp.Vector2$.Array(points),
      points.length,
      rl.Temp.Color$.Ref1(color).ref
    ),
  );

  void DrawTriangleStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => 'DrawTriangleStrip(points: ${points.length}, $color)',
    () => rl.Core.DrawTriangleStrip(
      rl.Temp.Vector2$.Array(points),
      points.length,
      rl.Temp.Color$.Ref1(color).ref
    ),
  );

  void DrawPoly(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => run(
    () => 'DrawPoly($center, $sides, $radius, $rotation, $color)',
    () => rl.Core.DrawPoly(
      rl.Temp.Vector2$.Ref1(center).ref,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawPolyLines(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => run(
    () => 'DrawPolyLines($center, $sides, $radius, $rotation, $color)',
    () => rl.Core.DrawPolyLines(
      rl.Temp.Vector2$.Ref1(center).ref,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawPolyLinesEx(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorD color,
  ) => run(
    () => 'DrawPolyLinesEx($center, $sides, $radius, $rotation, $lineThick, $color)',
    () => rl.Core.DrawPolyLinesEx(
      rl.Temp.Vector2$.Ref1(center).ref,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      lineThick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawSplineLinear(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineLinear(points: ${points.length}, $thick, $color)',
    () => rl.Core.DrawSplineLinear(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawSplineBasis(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineBasis(points: ${points.length}, $thick, $color)',
    () => rl.Core.DrawSplineBasis(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawSplineCatmullRom(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineCatmullRom(points: ${points.length}, $thick, $color)',
    () => rl.Core.DrawSplineCatmullRom(
      rl.Temp.Vector2$.Array(points), 
      points.length, 
      thick.toDouble(), 
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawSplineBezierQuadratic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineBezierQuadratic(points: ${points.length}, $thick, $color)',
    () => rl.Core.DrawSplineBezierQuadratic(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawSplineBezierCubic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineBezierCubic(points: ${points.length}, $thick, $color)',
    () => rl.Core.DrawSplineBezierCubic(
      rl.Temp.Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineSegmentLinear($p1, $p2, $thick, $color)',
    () => rl.Core.DrawSplineSegmentLinear(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineSegmentBasis($p1, $p2, $p3, $p4, $thick, $color)',
    () => rl.Core.DrawSplineSegmentBasis(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineSegmentCatmullRom($p1, $p2, $p3, $p4, $thick, $color)',
    () => rl.Core.DrawSplineSegmentCatmullRom(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineSegmentBezierQuadratic($p1, $c2, $p3, $thick, $color)',
    () => rl.Core.DrawSplineSegmentBezierQuadratic(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(c2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => 'DrawSplineSegmentBezierCubic($p1, $c2, $c3, $p4, $thick, $color)',
    () => rl.Core.DrawSplineSegmentBezierCubic(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(c2).ref,
      rl.Temp.Vector2$.Ref3(c3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      thick.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  Vector2D GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    num t,
  ) => run(
    () => 'GetSplinePointLinear($startPos, $endPos, $t)',
    () => rl.Core.GetSplinePointLinear(
      rl.Temp.Vector2$.Ref1(startPos).ref,
      rl.Temp.Vector2$.Ref2(endPos).ref,
      t.toDouble(),
    ).toD(),
  );

  Vector2D GetSplinePointBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => run(
    () => 'GetSplinePointBasis($p1, $p2, $p3, $p4, $t)',
    () => rl.Core.GetSplinePointBasis(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      t.toDouble(),
    ).toD(),
  );
    
  Vector2D GetSplinePointCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => run(
    () => 'GetSplinePointCatmullRom($p1, $p2, $p3, $p4, $t)',
    () => rl.Core.GetSplinePointCatmullRom(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(p2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      t.toDouble(),
    ).toD(),
  );

  Vector2D GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num t,
  ) => run(
    () => 'GetSplinePointBezierQuad($p1, $c2, $p3, $t)',
    () => rl.Core.GetSplinePointBezierQuad(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(c2).ref,
      rl.Temp.Vector2$.Ref3(p3).ref,
      t.toDouble(),
    ).toD(),
  );

  Vector2D GetSplinePointBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num t,
  ) => run(
    () => 'GetSplinePointBezierCubic($p1, $c2, $c3, $p4, $t)',
    () => rl.Core.GetSplinePointBezierCubic(
      rl.Temp.Vector2$.Ref1(p1).ref,
      rl.Temp.Vector2$.Ref2(c2).ref,
      rl.Temp.Vector2$.Ref3(c3).ref,
      rl.Temp.Vector2$.Ref4(p4).ref,
      t.toDouble(),
    ).toD(),
  );

  bool CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => 'CheckCollisionRecs($rec1, $rec2)',
    () => rl.Core.CheckCollisionRecs(
      rl.Temp.Rectangle$.Ref1(rec1).ref,
      rl.Temp.Rectangle$.Ref2(rec2).ref,
    ),
  );

  bool CheckCollisionCircles(
    Vector2D center1,
    num radius1,
    Vector2D center2,
    num radius2,
  ) => run(
    () => 'CheckCollisionCircles($center1, $radius1, $center2, $radius2)',
    () => rl.Core.CheckCollisionCircles(
      rl.Temp.Vector2$.Ref1(center1).ref,
      radius1.toDouble(),
      rl.Temp.Vector2$.Ref2(center2).ref,
      radius2.toDouble(),
    ),
  );

  bool CheckCollisionCircleRec(
    Vector2D center,
    num radius,
    RectangleD rec,
  ) => run(
    () => 'CheckCollisionCircleRec($center, $radius, $rec)',
    () => rl.Core.CheckCollisionCircleRec(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Rectangle$.Ref1(rec).ref,
    ),
  );

  bool CheckCollisionCircleLine(
    Vector2D center,
    num radius,
    Vector2D p1,
    Vector2D p2,
  ) => run(
    () => 'CheckCollisionCircleLine($center, $radius, $p1, $p2)',
    () => rl.Core.CheckCollisionCircleLine(
      rl.Temp.Vector2$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Vector2$.Ref2(p1).ref,
      rl.Temp.Vector2$.Ref3(p2).ref,
    ),
  );

  bool CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  ) => run(
    () => 'CheckCollisionPointRec($point, $rec)',
    () => rl.Core.CheckCollisionPointRec(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Rectangle$.Ref1(rec).ref,
    ),
  );
    
  bool CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    num radius,
  ) => run(
    () => 'CheckCollisionPointCircle($point, $center, $radius)',
    () => rl.Core.CheckCollisionPointCircle(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Vector2$.Ref2(center).ref,
      radius.toDouble(),
    ),
  );

  bool CheckCollisionPointTriangle(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
  ) => run(
    () => 'CheckCollisionPointTriangle($point, $p1, $p2, $p3)',
    () => rl.Core.CheckCollisionPointTriangle(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Vector2$.Ref2(p1).ref,
      rl.Temp.Vector2$.Ref3(p2).ref,
      rl.Temp.Vector2$.Ref4(p3).ref,
    ),
  );

  bool CheckCollisionPointLine(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    num threshold,
  ) => run(
    () => 'CheckCollisionPointLine($point, $p1, $p2, $threshold)',
    () => rl.Core.CheckCollisionPointLine(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Vector2$.Ref2(p1).ref,
      rl.Temp.Vector2$.Ref3(p2).ref,
      threshold.toInt(),
    ),
  );

  bool CheckCollisionPointPoly(
    Vector2D point,
    List<Vector2D> points,
  ) => run(
    () => 'CheckCollisionPointPoly($point, points: ${points.length})',
    () => rl.Core.CheckCollisionPointPoly(
      rl.Temp.Vector2$.Ref1(point).ref,
      rl.Temp.Vector2$.Array(points),
      points.length,
    ),
  );

  (bool result, Vector2D collisionPoint) CheckCollisionLines(
    Vector2D startPos1,
    Vector2D endPos1,
    Vector2D startPos2,
    Vector2D endPos2,
  ) => run(
    () => 'CheckCollisionLines($startPos1, $endPos1, $startPos2, $endPos2)',
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

  RectangleD GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => 'GetCollisionRec($rec1, $rec2)',
    () => rl.Core.GetCollisionRec(
      rl.Temp.Rectangle$.Ref1(rec1).ref,
      rl.Temp.Rectangle$.Ref2(rec2).ref,
    ).toD(),
  );

  ImageD LoadImage(
    String fileName,
  ) => run(
    () => 'LoadImage($fileName)',
    () => rl.Temp.Image$.RefCapture(
      'LoadImage_$fileName',
      rl.Core.LoadImage(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );
    
  ImageD LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => run(
    () => 'LoadImageRaw($fileName, $width, $height, ${format.name}, $headerSize)',
    () => rl.Temp.Image$.RefCapture(
      'LoadImageRaw_${fileName}_${width}_${height}_${format.name}',
      rl.Core.LoadImageRaw(
        rl.Temp.String$.ValueOrNull(fileName),
        width.toInt(),
        height.toInt(),
        format.value,
        headerSize.toInt(),
      ),
    ),
  );

  (ImageD image, int frameCount) LoadImageAnim(
    String fileName,
  ) => run(
    () => 'LoadImageAnim($fileName)',
    () {
      final frames = rl.Temp.Int$.Ref1();
      final image = rl.Temp.Image$.RefCapture(
        'LoadImageAnim_$fileName',
        rl.Core.LoadImageAnim(
          rl.Temp.String$.ValueOrNull(fileName),
          frames,
        ),
      );
      image._updateFrameCount(frames.value);
      return (image, frames.value);
    },
  );

  (ImageD image, int frameCount) LoadImageAnimFromMemory(
    String fileType,
    List<int> fileData,
  ) => run(
    () => 'LoadImageAnimFromMemory($fileType, fileData: ${fileData.length})',
    () {
      final frames = rl.Temp.Int$.Ref1();
      final image = rl.Temp.Image$.RefCapture(
        'LoadImageAnimFromMemory_$fileType',
        rl.Core.LoadImageAnimFromMemory(
          rl.Temp.String$.ValueOrNull(fileType),
          rl.Temp.UnsignedChar$.Array(fileData),
          fileData.length,
          frames,
        ),
      );
      return (image, frames.value);
    },
  );

  ImageD LoadImageFromMemory(
    String fileType,
    List<int> fileData,
  ) => run(
    () => 'LoadImageFromMemory($fileType, fileData: ${fileData.length})',
    () => rl.Temp.Image$.RefCapture(
      'LoadImageFromMemory_${fileType}_${fileData.length}',
      rl.Core.LoadImageFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
      )
    ),
  );

  ImageD LoadImageFromTexture(
    Texture2DD texture,
  ) => run(
    () => 'LoadImageFromTexture($texture)',
    () => rl.Temp.Image$.RefCapture(
      'LoadImageFromTexture_${texture.id}_${texture.width}_${texture.height}',
      rl.Core.LoadImageFromTexture(
        rl.Temp.Texture$.Ref1(texture).ref,
      ),
    ),
  );

  ImageD LoadImageFromScreen() => run(
    () => 'LoadImageFromScreen()',
    () => rl.Temp.Image$.RefCapture(
      'LoadImageFromScreen',
      rl.Core.LoadImageFromScreen(),
    ),
  );

  bool IsImageValid(
    ImageD image,
  ) => run(
    () => 'IsImageValid($image)',
    () => rl.Core.IsImageValid(
      rl.Temp.Image$.Ref1(image).ref,
    ),
  );

  void UnloadImage(
    ImageD image,
  ) => run(
    () => 'UnloadImage($image)',
    () => rl.Core.UnloadImage(
      rl.Temp.Image$.Ref1(image).ref,
    ),
  );

  bool ExportImage(
    ImageD image,
    String fileName,
  ) => run(
    () => 'ExportImage($image, $fileName)',
    () => rl.Core.ExportImage(
      rl.Temp.Image$.Ref1(image).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  List<int> ExportImageToMemory(
    ImageD image,
    String fileType,
  ) => run(
    () => 'ExportImageToMemory($image, $fileType)',
    () {
      final fileSize = rl.Temp.Int$.Ref1();
      final data = rl.Core.ExportImageToMemory(
        rl.Temp.Image$.Ref1(image).ref,
        rl.Temp.String$.ValueOrNull(fileType),
        fileSize,
      );
      return rl.Temp.UnsignedChar$.asDartList(data, fileSize.value).cast();
    },
  );

  bool ExportImageAsCode(
    ImageD image,
    String fileName,
  ) => run(
    () => 'ExportImageAsCode($image, $fileName)',
    () => rl.Core.ExportImageAsCode(
      rl.Temp.Image$.Ref1(image).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  ImageD GenImageColor(
    num width,
    num height,
    ColorD color,
  ) => run(
    () => 'GenImageColor($width, $height, $color)',
    () => rl.Temp.Image$.RefCapture(
      'GenImageColor_${width}_$height',
      rl.Core.GenImageColor(
        width.toInt(),
        height.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  ImageD GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorD start,
    ColorD end,
  ) => run(
    () => 'GenImageGradientLinear($width, $height, $direction, $start, $end)',
    () => rl.Temp.Image$.RefCapture(
      'GenImageGradientLinear_${width}_$height',
      rl.Core.GenImageGradientLinear(
        width.toInt(),
        height.toInt(),
        direction.toInt(),
        rl.Temp.Color$.Ref1(start).ref,
        rl.Temp.Color$.Ref2(end).ref,
      ),
    ),
  );

  ImageD GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => 'GenImageGradientRadial($width, $height, $density, $inner, $outer)',
    () => rl.Temp.Image$.RefCapture(
      'GenImageGradientRadial_${width}_$height',
      rl.Core.GenImageGradientRadial(
        width.toInt(),
        height.toInt(),
        density.toDouble(),
        rl.Temp.Color$.Ref1(inner).ref,
        rl.Temp.Color$.Ref2(outer).ref,
      ),
    ),
  );

  ImageD GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => 'GenImageGradientSquare($width, $height, $density, $inner, $outer)',
    () => rl.Temp.Image$.RefCapture(
      'GenImageGradientSquare_${width}_$height',
      rl.Core.GenImageGradientSquare(
        width.toInt(),
        height.toInt(),
        density.toDouble(),
        rl.Temp.Color$.Ref1(inner).ref,
        rl.Temp.Color$.Ref2(outer).ref,
      ),
    ),
  );

  ImageD GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorD col1,
    ColorD col2,
  ) => run(
    () => 'GenImageChecked($width, $height, $checksX, $checksY, $col1, $col2)',
    () => rl.Temp.Image$.RefCapture(
      'GenImageChecked_${width}_$height',
      rl.Core.GenImageChecked(
        width.toInt(),
        height.toInt(),
        checksX.toInt(),
        checksY.toInt(),
        rl.Temp.Color$.Ref1(col1).ref,
        rl.Temp.Color$.Ref2(col2).ref,
      ),
    ),
  );

  ImageD GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => run(
    () => 'GenImageWhiteNoise($width, $height, $factor)',
    () => rl.Temp.Image$.RefCapture(
      'GenImageWhiteNoise_${width}_$height',
      rl.Core.GenImageWhiteNoise(
        width.toInt(),
        height.toInt(),
        factor.toDouble(),
      ),
    ),
  );

  ImageD GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => run(
    () => 'GenImagePerlinNoise($width, $height, $offsetX, $offsetY, $scale)',
    () => rl.Temp.Image$.RefCapture(
      'GenImagePerlinNoise_${width}_$height',
      rl.Core.GenImagePerlinNoise(
        width.toInt(),
        height.toInt(),
        offsetX.toInt(),
        offsetY.toInt(),
        scale.toDouble(),
      ),
    ),
  );
    
  ImageD GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => run(
    () => 'GenImageCellular($width, $height, $tileSize)',
    () => rl.Temp.Image$.RefCapture(
      'GenImageCellular_${width}_$height',
      rl.Core.GenImageCellular(
        width.toInt(),
        height.toInt(),
        tileSize.toInt(),
      ),
    ),
  );

  ImageD GenImageText(
    num width,
    num height,
    String text,
  ) => run(
    () => 'GenImageText($width, $height, $text)',
    () => rl.Temp.Image$.RefCapture(
      'GenImageText_${width}_$height',
      rl.Core.GenImageText(
        width.toInt(),
        height.toInt(),
        rl.Temp.String$.ValueOrNull(text),
      ),
    ),
  );

  ImageD ImageCopy(
    ImageD image,
  ) => run(
    () => 'ImageCopy($image)',
    () => rl.Temp.Image$.RefCapture(
      'ImageCopy_${image.internalId}',
      rl.Core.ImageCopy(
        rl.Temp.Image$.Ref1(image).ref,
      ),
    ),
  );

  ImageD ImageFromImage(
    ImageD image,
    RectangleD rec,
  ) => run(
    () => 'ImageFromImage($image, $rec)',
    () => rl.Temp.Image$.RefCapture(
      'ImageFromImage_${image.internalId}',
      rl.Core.ImageFromImage(
        rl.Temp.Image$.Ref1(image).ref,
        rl.Temp.Rectangle$.Ref1(rec).ref,
      ),
    ),
  );

  ImageD ImageFromChannel(
    ImageD image,
    num selectedChannel,
  ) => run(
    () => 'ImageFromChannel($image, $selectedChannel)',
    () => rl.Temp.Image$.RefCapture(
      'ImageFromChannel_${image.internalId}',
      rl.Core.ImageFromChannel(
        rl.Temp.Image$.Ref1(image).ref,
        selectedChannel.toInt(),
      ),
    ),
  );

  ImageD ImageText(
    String text,
    num fontSize,
    ColorD color,
  ) => run(
    () => 'ImageText($text, $fontSize, $color)',
    () => rl.Temp.Image$.RefCapture(
      'ImageText_$fontSize',
      rl.Core.ImageText(
        rl.Temp.String$.ValueOrNull(text),
        fontSize.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  ImageD ImageTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => 'ImageTextEx($font, $text, $fontSize, $spacing, $tint)',
    () => rl.Temp.Image$.RefCapture(
      'ImageTextEx_${font.internalId}',
      rl.Core.ImageTextEx(
        rl.Temp.Font$.Ref1(font).ref,
        rl.Temp.String$.ValueOrNull(text),
        fontSize.toDouble(),
        spacing.toDouble(),
        rl.Temp.Color$.Ref1(tint).ref,
      ),
    ),
  );

  void ImageFormat(
    ImageD image,
    PixelFormat newFormat,
  ) => run(
    () => 'ImageFormat($image, ${newFormat.name})',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageFormat(
        p,
        newFormat.value,
      ),
    ),
  );
    
  void ImageToPOT(
    ImageD image,
    ColorD fill,
  ) => run(
    () => 'ImageToPOT($image, $fill)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageToPOT(
        p,
        rl.Temp.Color$.Ref1(fill).ref,
      ),
    ),
  );

  void ImageCrop(
    ImageD image,
    RectangleD crop,
  ) => run(
    () => 'ImageCrop($image, $crop)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageCrop(
        p,
        rl.Temp.Rectangle$.Ref1(crop).ref,
      ),
    ),
  );

  void ImageAlphaCrop(
    ImageD image,
    num threshold,
  ) => run(
    () => 'ImageAlphaCrop($image, $threshold)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageAlphaCrop(
        p,
        threshold.toDouble(),
      ),
    ),
  );

  void ImageAlphaClear(
    ImageD image,
    ColorD color,
    num threshold,
  ) => run(
    () => 'ImageAlphaClear($image, $color, $threshold)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageAlphaClear(
        p,
        rl.Temp.Color$.Ref1(color).ref,
        threshold.toDouble(),
      ),
    ),
  );

  void ImageAlphaMask(
    ImageD image,
    ImageD alphaMask,
  ) => run(
    () => 'ImageAlphaMask($image, $alphaMask)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageAlphaMask(
        p,
        rl.Temp.Image$.Ref2(alphaMask).ref,
      ),
    ),
  );

  void ImageAlphaPremultiply(
    ImageD image,
  ) => run(
    () => 'ImageAlphaPremultiply($image)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageAlphaPremultiply(p),
    ),
  );

  void ImageBlurGaussian(
    ImageD image,
    num blurSize,
  ) => run(
    () => 'ImageBlurGaussian($image, $blurSize)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageBlurGaussian(
        p,
        blurSize.toInt(),
      ),
    ),
  );

  void ImageKernelConvolution(
    ImageD image,
    List<double> kernel,
  ) => run(
    () => 'ImageKernelConvolution($image, kernel: ${kernel.length})',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageKernelConvolution(
        p,
        rl.Temp.Float$.Array(kernel),
        kernel.length,
      ),
    ),
  );

  void ImageResize(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => run(
    () => 'ImageResize($image, $newWidth, $newHeight)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageResize(
        p,
        newWidth.toInt(),
        newHeight.toInt(),
      ),
    ),
  );

  void ImageResizeNN(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => run(
    () => 'ImageResizeNN($image, $newWidth, $newHeight)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageResizeNN(
        p,
        newWidth.toInt(),
        newHeight.toInt(),
      ),
    ),
  );
    
  void ImageResizeCanvas(
    ImageD image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorD fill,
  ) => run(
    () => 'ImageResizeCanvas($image, $newWidth, $newHeight, $offsetX, $offsetY, $fill)',
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

  void ImageMipmaps(
    ImageD image,
  ) => run(
    () => 'ImageMipmaps($image)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageMipmaps(p),
    ),
  );

  void ImageDither(
    ImageD image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => run(
    () => 'ImageDither($image, $rBpp, $gBpp, $bBpp, $aBpp)',
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

  void ImageFlipVertical(
    ImageD image,
  ) => run(
    () => 'ImageFlipVertical($image)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageFlipVertical(p),
    ),
  );

  void ImageFlipHorizontal(
    ImageD image,
  ) => run(
    () => 'ImageFlipHorizontal($image)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageFlipHorizontal(p),
    ),
  );

  void ImageRotate(
    ImageD image,
    num degrees,
  ) => run(
    () => 'ImageRotate($image, $degrees)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageRotate(
        p,
        degrees.toInt(),
      ),
    ),
  );

  void ImageRotateCW(
    ImageD image,
  ) => run(
    () => 'ImageRotateCW($image)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageRotateCW(p),
    ),
  );

  void ImageRotateCCW(
    ImageD image,
  ) => run(
    () => 'ImageRotateCCW($image)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageRotateCCW(p),
    ),
  );
    
  void ImageColorTint(
    ImageD image,
    ColorD color,
  ) => run(
    () => 'ImageColorTint($image, $color)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorTint(
        p,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageColorInvert(
    ImageD image,
  ) => run(
    () => 'ImageColorInvert($image)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorInvert(p),
    ),
  );

  void ImageColorGrayscale(
    ImageD image,
  ) => run(
    () => 'ImageColorGrayscale($image)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorGrayscale(p),
    ),
  );

  void ImageColorContrast(
    ImageD image,
    num contrast,
  ) => run(
    () => 'ImageColorContrast($image, $contrast)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorContrast(
        p,
        contrast.toDouble(),
      ),
    ),
  );

  void ImageColorBrightness(
    ImageD image,
    num brightness,
  ) => run(
    () => 'ImageColorBrightness($image, $brightness)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorBrightness(
        p,
        brightness.toInt(),
      ),
    ),
  );

  void ImageColorReplace(
    ImageD image,
    ColorD color,
    ColorD replace,
  ) => run(
    () => 'ImageColorReplace($image, $color, $replace)',
    () => rl.Temp.Image$.RefUpdate1(image,
      (p) => rl.Core.ImageColorReplace(
        p,
        rl.Temp.Color$.Ref1(color).ref,
        rl.Temp.Color$.Ref2(replace).ref,
      ),
    ),
  );

  List<ColorD> LoadImageColors(
    ImageD image,
  ) => run(
    () => 'LoadImageColors($image)',
    () {
      final colors = rl.Core.LoadImageColors(
        rl.Temp.Image$.Ref1(image).ref,
      );
      final count = image.width * image.height;
      try {
        return List.generate(count, (i) => colors[i].toD());
      } finally {
        rl.Core.UnloadImageColors(colors);
      }
    },
  );
    
  List<ColorD> LoadImagePalette(
    ImageD image,
    num maxPaletteSize,
  ) => run(
    () => 'LoadImagePalette($image, $maxPaletteSize)',
    () {
      final colorCount = rl.Temp.Int$.Ref1();
      final colors = rl.Core.LoadImagePalette(
        rl.Temp.Image$.Ref1(image).ref,
        maxPaletteSize.toInt(),
        colorCount,
      );
      try {
        return List.generate(colorCount.value, (i) => colors[i].toD());
      } finally {
        rl.Core.UnloadImagePalette(colors);
      }
    },
  );

  RectangleD GetImageAlphaBorder(
    ImageD image,
    num threshold,
  ) => run(
    () => 'GetImageAlphaBorder($image, $threshold)',
    () => rl.Core.GetImageAlphaBorder(
      rl.Temp.Image$.Ref1(image).ref,
      threshold.toDouble(),
    ).toD(),
  );

  ColorD GetImageColor(
    ImageD image,
    num x,
    num y,
  ) => run(
    () => 'GetImageColor($image, $x, $y)',
    () => rl.Core.GetImageColor(
      rl.Temp.Image$.Ref1(image).ref,
      x.toInt(),
      y.toInt(),
    ).toD(),
  );

  void ImageClearBackground(
    ImageD dst,
    ColorD color,
  ) => run(
    () => 'ImageClearBackground($dst, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageClearBackground(
        p,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDrawPixel(
    ImageD dst,
    num posX,
    num posY,
    ColorD color,
  ) => run(
    () => 'ImageDrawPixel($dst, $posX, $posY, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawPixel(
        p,
        posX.toInt(),
        posY.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDrawPixelV(
    ImageD dst,
    Vector2D position,
    ColorD color,
  ) => run(
    () => 'ImageDrawPixelV($dst, $position, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawPixelV(
        p,
        rl.Temp.Vector2$.Ref1(position).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );
    
  void ImageDrawLine(
    ImageD dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => run(
    () => 'ImageDrawLine($dst, $startPosX, $startPosY, $endPosX, $endPosY, $color)',
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

  void ImageDrawLineV(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  ) => run(
    () => 'ImageDrawLineV($dst, $start, $end, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawLineV(
        p,
        rl.Temp.Vector2$.Ref1(start).ref,
        rl.Temp.Vector2$.Ref2(end).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDrawLineEx(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    num thick,
    ColorD color,
  ) => run(
    () => 'ImageDrawLineEx($dst, $start, $end, $thick, $color)',
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

  void ImageDrawCircle(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => 'ImageDrawCircle($dst, $centerX, $centerY, $radius, $color)',
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

  void ImageDrawCircleV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => 'ImageDrawCircleV($dst, $center, $radius, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawCircleV(
        p,
        rl.Temp.Vector2$.Ref1(center).ref,
        radius.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDrawCircleLines(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => 'ImageDrawCircleLines($dst, $centerX, $centerY, $radius, $color)',
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

  void ImageDrawCircleLinesV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => 'ImageDrawCircleLinesV($dst, $center, $radius, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawCircleLinesV(
        p,
        rl.Temp.Vector2$.Ref1(center).ref,
        radius.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDrawRectangle(
    ImageD dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => 'ImageDrawRectangle($dst, $posX, $posY, $width, $height, $color)',
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
    
  void ImageDrawRectangleV(
    ImageD dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => run(
    () => 'ImageDrawRectangleV($dst, $position, $size, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawRectangleV(
        p,
        rl.Temp.Vector2$.Ref1(position).ref,
        rl.Temp.Vector2$.Ref2(size).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDrawRectangleRec(
    ImageD dst,
    RectangleD rec,
    ColorD color,
  ) => run(
    () => 'ImageDrawRectangleRec($dst, $rec, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawRectangleRec(
        p,
        rl.Temp.Rectangle$.Ref1(rec).ref,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDrawRectangleLines(
    ImageD dst,
    RectangleD rec,
    num thick,
    ColorD color,
  ) => run(
    () => 'ImageDrawRectangleLines($dst, $rec, $thick, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawRectangleLines(
        p,
        rl.Temp.Rectangle$.Ref1(rec).ref,
        thick.toInt(),
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDrawTriangle(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => 'ImageDrawTriangle($dst, $v1, $v2, $v3, $color)',
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

  void ImageDrawTriangleEx(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD c1,
    ColorD c2,
    ColorD c3,
  ) => run(
    () => 'ImageDrawTriangleEx($dst, $v1, $v2, $v3, $c1, $c2, $c3)',
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

  void ImageDrawTriangleLines(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => 'ImageDrawTriangleLines($dst, $v1, $v2, $v3, $color)',
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
    
  void ImageDrawTriangleFan(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => 'ImageDrawTriangleFan($dst, points: ${points.length}, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawTriangleFan(
        p,
        rl.Temp.Vector2$.Array(points),
        points.length,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDrawTriangleStrip(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => 'ImageDrawTriangleStrip($dst, points: ${points.length}, $color)',
    () => rl.Temp.Image$.RefUpdate1(dst,
      (p) => rl.Core.ImageDrawTriangleStrip(
        p,
        rl.Temp.Vector2$.Array(points),
        points.length,
        rl.Temp.Color$.Ref1(color).ref,
      ),
    ),
  );

  void ImageDraw(
    ImageD dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  ) => run(
    () => 'ImageDraw($dst, $src, $srcRec, $dstRec, $tint)',
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

  void ImageDrawText(
    ImageD dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => run(
    () => 'ImageDrawText($dst, $text, $posX, $posY, $fontSize, $color)',
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

  void ImageDrawTextEx(
    ImageD dst,
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => 'ImageDrawTextEx($dst, $font, $text, $position, $fontSize, $spacing, $tint)',
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

  Texture2DD LoadTexture(
    String fileName,
  ) => run(
    () => 'LoadTexture($fileName)',
    () => rl.Temp.Texture$.RefCapture(
      'LoadTexture_$fileName',
      rl.Core.LoadTexture(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );

  Texture2DD LoadTextureFromImage(
    ImageD image,
  ) => run(
    () => 'LoadTextureFromImage($image)',
    () => rl.Temp.Texture$.RefCapture(
      'LoadTextureFromImage_${image.internalId}',
      rl.Core.LoadTextureFromImage(
        rl.Temp.Image$.Ref1(image).ref,
      ),
    ),
  );

  TextureCubemapD LoadTextureCubemap(
    ImageD image,
    CubemapLayout layout,
  ) => run(
    () => 'LoadTextureCubemap($image, $layout)',
    () => rl.Temp.Texture$.RefCapture(
      'LoadTextureCubemap_${image.internalId}',
      rl.Core.LoadTextureCubemap(
        rl.Temp.Image$.Ref1(image).ref,
        layout.value,
      ),
    ),
  );

  RenderTexture2DD LoadRenderTexture(
    num width,
    num height,
  ) => run(
    () => 'LoadRenderTexture($width, $height)',
    () => rl.Temp.RenderTexture$.RefCapture(
      'LoadRenderTexture_${width}_$height',
      rl.Core.LoadRenderTexture(
        width.toInt(),
        height.toInt(),
      ),
    ),
  );

  bool IsTextureValid(
    Texture2DD texture,
  ) => run(
    () => 'IsTextureValid($texture)',
    () => rl.Core.IsTextureValid(
      rl.Temp.Texture$.Ref1(texture).ref,
    ),
  );

  void UnloadTexture(
    Texture2DD texture,
  ) => run(
    () => 'UnloadTexture($texture)',
    () => rl.Core.UnloadTexture(texture.getOriginalPointerAndDispose().ref),
  );

  bool IsRenderTextureValid(
    RenderTexture2DD target,
  ) => run(
    () => 'IsRenderTextureValid($target)',
    () => rl.Core.IsRenderTextureValid(
      rl.Temp.RenderTexture$.Ref1(target).ref,
    ),
  );

  void UnloadRenderTexture(
    RenderTexture2DD target,
  ) => run(
    () => 'UnloadRenderTexture($target)',
    () => rl.Core.UnloadRenderTexture(
      rl.Temp.RenderTexture$.Ref1(target).ref,
    ),
  );

  void UpdateTexture(
    Texture2DD texture,
    List<int> pixels,
  ) => run(
    () => 'UpdateTexture($texture, pixels: ${pixels.length})',
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.UpdateTexture(
        p.ref,
        rl.Temp.Uint8$.Array(pixels).cast(),
      ),
    ),
  );
    
  void UpdateTextureRec(
    Texture2DD texture,
    RectangleD rec,
    List<int> pixels,
  ) => run(
    () => 'UpdateTextureRec($texture, $rec, pixels: ${pixels.length})',
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.UpdateTextureRec(
        p.ref,
        rl.Temp.Rectangle$.Ref1(rec).ref,
        rl.Temp.Uint8$.Array(pixels).cast(),
      ),
    ),
  );

  void GenTextureMipmaps(
    Texture2DD texture,
  ) => run(
    () => 'GenTextureMipmaps($texture)',
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.GenTextureMipmaps(p),
    ),
  );

  void SetTextureFilter(
    Texture2DD texture,
    TextureFilter filter,
  ) => run(
    () => 'SetTextureFilter($texture, $filter)',
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.SetTextureFilter(
        p.ref,
        filter.value,
      ),
    ),
  );

  void SetTextureWrap(
    Texture2DD texture,
    TextureWrap wrap,
  ) => run(
    () => 'SetTextureWrap($texture, $wrap)',
    () => rl.Temp.Texture$.RefUpdate1(texture,
      (p) => rl.Core.SetTextureWrap(
        p.ref,
        wrap.value,
      ),
    ),
  );

  void DrawTexture(
    Texture2DD texture,
    num posX,
    num posY,
    ColorD tint,
  ) => run(
    () => 'DrawTexture($texture, $posX, $posY, $tint)',
    () => rl.Core.DrawTexture(
      rl.Temp.Texture$.Ref1(texture).ref,
      posX.toInt(),
      posY.toInt(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  void DrawTextureV(
    Texture2DD texture,
    Vector2D position,
    ColorD tint,
  ) => run(
    () => 'DrawTextureV($texture, $position, $tint)',
    () => rl.Core.DrawTextureV(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  void DrawTextureEx(
    Texture2DD texture,
    Vector2D position,
    num rotation,
    num scale,
    ColorD tint,
  ) => run(
    () => 'DrawTextureEx($texture, $position, $rotation, $scale, $tint)',
    () => rl.Core.DrawTextureEx(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Vector2$.Ref1(position).ref,
      rotation.toDouble(),
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  void DrawTextureRec(
    Texture2DD texture,
    RectangleD source,
    Vector2D position,
    ColorD tint,
  ) => run(
    () => 'DrawTextureRec($texture, $source, $position, $tint)',
    () => rl.Core.DrawTextureRec(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Rectangle$.Ref1(source).ref,
      rl.Temp.Vector2$.Ref1(position).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  void DrawTexturePro(
    Texture2DD texture,
    RectangleD source,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => 'DrawTexturePro($texture, $source, $dest, $origin, $rotation, $tint)',
    () {
      if (identical(source, dest)) throw StateError("You cant blah blah blah");
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

  void DrawTextureNPatch(
    Texture2DD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => 'DrawTextureNPatch($texture, $nPatchInfo, $dest, $origin, $rotation, $tint)',
    () => rl.Core.DrawTextureNPatch(
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.NPatchInfo$.Ref1(nPatchInfo).ref,
      rl.Temp.Rectangle$.Ref1(dest).ref,
      rl.Temp.Vector2$.Ref1(origin).ref,
      rotation.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  bool ColorIsEqual(
    ColorD col1,
    ColorD col2,
  ) => run(
    () => 'ColorIsEqual($col1, $col2)',
    () => rl.Core.ColorIsEqual(
      rl.Temp.Color$.Ref1(col1).ref,
      rl.Temp.Color$.Ref2(col2).ref,
    ),
  );

  ColorD Fade(
    ColorD color,
    num alpha,
  ) => run(
    () => 'Fade($color, $alpha)',
    () => rl.Core.Fade(
      rl.Temp.Color$.Ref1(color).ref,
      alpha.toDouble(),
    ).toD(),
  );

  int ColorToInt(
    ColorD color,
  ) => run(
    () => 'ColorToInt($color)',
    () => rl.Core.ColorToInt(
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  Vector4D ColorNormalize(
    ColorD color,
  ) => run(
    () => 'ColorNormalize($color)',
    () => rl.Core.ColorNormalize(
      rl.Temp.Color$.Ref1(color).ref,
    ).toD(),
  );

  ColorD ColorFromNormalized(
    Vector4D normalized,
  ) => run(
    () => 'ColorFromNormalized($normalized)',
    () => rl.Core.ColorFromNormalized(
      rl.Temp.Vector4$.Ref1(normalized).ref,
    ).toD(),
  );

  Vector3D ColorToHSV(
    ColorD color,
  ) => run(
    () => 'ColorToHSV($color)',
    () => rl.Core.ColorToHSV(
      rl.Temp.Color$.Ref1(color).ref,
    ).toD(),
  );

  ColorD ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => run(
    () => 'ColorFromHSV($hue, $saturation, $value)',
    () => rl.Core.ColorFromHSV(
      hue.toDouble(),
      saturation.toDouble(),
      value.toDouble(),
    ).toD(),
  );

  ColorD ColorTint(
    ColorD color,
    ColorD tint,
  ) => run(
    () => 'ColorTint($color, $tint)',
    () => rl.Core.ColorTint(
      rl.Temp.Color$.Ref1(color).ref,
      rl.Temp.Color$.Ref2(tint).ref,
    ).toD(),
  );

  ColorD ColorBrightness(
    ColorD color,
    num factor,
  ) => run(
    () => 'ColorBrightness($color, $factor)',
    () => rl.Core.ColorBrightness(
      rl.Temp.Color$.Ref1(color).ref,
      factor.toDouble(),
    ).toD(),
  );

  ColorD ColorContrast(
    ColorD color,
    num contrast,
  ) => run(
    () => 'ColorContrast($color, $contrast)',
    () => rl.Core.ColorContrast(
      rl.Temp.Color$.Ref1(color).ref,
      contrast.toDouble(),
    ).toD(),
  );

  ColorD ColorAlpha(
    ColorD color,
    num alpha,
  ) => run(
    () => 'ColorAlpha($color, $alpha)',
    () => rl.Core.ColorAlpha(
      rl.Temp.Color$.Ref1(color).ref,
      alpha.toDouble(),
    ).toD(),
  );

  ColorD ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  ) => run(
    () => 'ColorAlphaBlend($dst, $src, $tint)',
    () => rl.Core.ColorAlphaBlend(
      rl.Temp.Color$.Ref1(dst).ref,
      rl.Temp.Color$.Ref2(src).ref,
      rl.Temp.Color$.Ref3(tint).ref,
    ).toD(),
  );

  ColorD ColorLerp(
    ColorD color1,
    ColorD color2,
    num factor,
  ) => run(
    () => 'ColorLerp($color1, $color2, $factor)',
    () => rl.Core.ColorLerp(
      rl.Temp.Color$.Ref1(color1).ref,
      rl.Temp.Color$.Ref2(color2).ref,
      factor.toDouble(),
    ).toD(),
  );

  ColorD GetColor(
    num hexValue,
  ) => run(
    () => 'GetColor($hexValue)',
    () => rl.Core.GetColor(hexValue.toInt()).toD(),
  );

  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => run(
    () => 'GetPixelDataSize($width, $height, $format)',
    () => rl.Core.GetPixelDataSize(
      width.toInt(),
      height.toInt(),
      format.value,
    ),
  );

  FontD GetFontDefault() => run(
    () => 'GetFontDefault()',
    () => rl.Temp.Font$.RefCapture(
      'GetFontDefault',
      rl.Core.GetFontDefault(),
    ),
  );

  FontD LoadFont(
    String fileName,
  ) => run(
    () => 'LoadFont($fileName)',
    () => rl.Temp.Font$.RefCapture(
      'LoadFont_$fileName',
      rl.Core.LoadFont(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );
    
  FontD LoadFontEx(
    String fileName,
    num fontSize, [
      List<int>? codepoints,
      num? codePointCount
    ]
  ) => run(
    () => 'LoadFontEx($fileName, $fontSize, codepoints: ${codepoints?.length})',
    () => rl.Temp.Font$.RefCapture(
      'LoadFontEx_${fileName}_$fontSize',
      rl.Core.LoadFontEx(
        rl.Temp.String$.ValueOrNull(fileName),
        fontSize.toInt(),
        codepoints == null ? nullptr : rl.Temp.Int$.Array(codepoints),
        codePointCount?.toInt() ?? codepoints?.length ?? 0,
      ),
    ),
  );

  FontD LoadFontFromImage(
    ImageD image,
    ColorD key,
    num firstChar,
  ) => run(
    () => 'LoadFontFromImage($image, $key, $firstChar)',
    () => rl.Temp.Font$.RefCapture(
      'LoadFontFromImage_${image.internalId}',
      rl.Core.LoadFontFromImage(
        rl.Temp.Image$.Ref1(image).ref,
        rl.Temp.Color$.Ref1(key).ref,
        firstChar.toInt(),
      ),
    ),
  );

  FontD LoadFontFromMemory(
    String fileType,
    List<int> fileData,
    num fontSize,
    List<int> codepoints,
  ) => run(
    () => 'LoadFontFromMemory($fileType, fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints.length})',
    () => rl.Temp.Font$.RefCapture(
      'LoadFontFromMemory_${fileType}_${fileData.length}_${fontSize}_${codepoints.length}',
      rl.Core.LoadFontFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.Uint8$.Array(fileData).cast(),
        fileData.length,
        fontSize.toInt(),
        rl.Temp.Int$.Array(codepoints),
        codepoints.length,
      ),
    ),
  );

  bool IsFontValid(
    FontD font,
  ) => run(
    () => 'IsFontValid($font)',
    () => rl.Core.IsFontValid(
      rl.Temp.Font$.Ref1(font).ref,
    ),
  );

  // TODO: ON NEW RAYLIB RELEASE - add glyphCount, now it defaults to 95
  List<GlyphInfoD> LoadFontData(
    List<int> fileData,
    num fontSize,
    List<int>? codepoints,
    num? codepointCount,
    FontType type,
  ) => run(
    () => 'LoadFontData(fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints?.length}, $type)',
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
      return List.generate(requestedCount, (i) => (glyphs + i).toD());
    },
  );

  (ImageD image, List<RectangleD> glyphRecs) GenImageFontAtlas(
    List<GlyphInfoD> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => run(
    () => 'GenImageFontAtlas(glyphs: ${glyphs.length}, $fontSize, $padding, $packMethod)',
    () {
      final recsPtr = rl.Temp.Ptr$Rectangle$.Raw();

      try {
        final image = rl.Temp.Image$.RefCapture(
          'GenImageFontAtlas_${glyphs.length}_${fontSize}_$padding',
          rl.Core.GenImageFontAtlas(
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

  void UnloadFontData(
    List<GlyphInfoD> glyphs,
  ) => run(
    () => 'UnloadFontData(glyphs: ${glyphs.length})',
    () => rl.Core.UnloadFontData(
      glyphs.firstOrNull?.originalPointer ?? rl.Temp.GlyphInfo$.Array(glyphs),
      glyphs.length,
    ),
  );
    
  void UnloadFont(
    FontD font,
  ) => run(
    () => 'UnloadFont($font)',
    () => rl.Core.UnloadFont(
      rl.Temp.Font$.Ref1(font).ref,
    ),
  );

  bool ExportFontAsCode(
    FontD font,
    String fileName,
  ) => run(
    () => 'ExportFontAsCode($font, $fileName)',
    () => rl.Core.ExportFontAsCode(
      rl.Temp.Font$.Ref1(font).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  void DrawFPS(
    num posX,
    num posY,
  ) => run(
    () => 'DrawFPS($posX, $posY)',
    () => rl.Core.DrawFPS(
      posX.toInt(),
      posY.toInt(),
    ),
  );

  void DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => run(
    () => 'DrawText($text, $posX, $posY, $fontSize, $color)',
    () => rl.Core.DrawText(
      rl.Temp.String$.ValueOrNull(text),
      posX.toInt(),
      posY.toInt(),
      fontSize.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawTextEx(
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => 'DrawTextEx($font, $text, $position, $fontSize, $spacing, $tint)',
    () => rl.Core.DrawTextEx(
      rl.Temp.Font$.Ref1(font).ref,
      rl.Temp.String$.ValueOrNull(text),
      rl.Temp.Vector2$.Ref1(position).ref,
      fontSize.toDouble(),
      spacing.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

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
    () => 'DrawTextPro($font, $text, $position, $origin, $rotation, $fontSize, $spacing, $tint)',
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
    
  void DrawTextCodepoint(
    FontD font,
    num codepoint,
    Vector2D position,
    num fontSize,
    ColorD tint,
  ) => run(
    () => 'DrawTextCodepoint($font, $codepoint, $position, $fontSize, $tint)',
    () => rl.Core.DrawTextCodepoint(
      rl.Temp.Font$.Ref1(font).ref,
      codepoint.toInt(),
      rl.Temp.Vector2$.Ref1(position).ref,
      fontSize.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  void DrawTextCodepoints(
    FontD font,
    List<int> codepoints,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => 'DrawTextCodepoints($font, codepoints: ${codepoints.length}, $position, $fontSize, $spacing, $tint)',
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

  void SetTextLineSpacing(
    num spacing,
  ) => run(
    () => 'SetTextLineSpacing($spacing)',
    () => rl.Core.SetTextLineSpacing(spacing.toInt()),
  );

  int MeasureText(
    String text,
    num fontSize,
  ) => run(
    () => 'MeasureText($text, $fontSize)',
    () => rl.Core.MeasureText(
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toInt(),
    ),
  );
    
  Vector2D MeasureTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
  ) => run(
    () => 'MeasureTextEx($font, $text, $fontSize, $spacing)',
    () => rl.Core.MeasureTextEx(
      rl.Temp.Font$.Ref1(font).ref,
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
    ).toD(),
  );

  // NOTE: REALLY HEAVY, example `text_draw_3d`, syncing the font for each character
  //       So we skip the sync, possible undefined behavior may happen?
  int GetGlyphIndex(
    FontD font,
    num codepoint,
  ) => run(
    () => 'GetGlyphIndex($font, $codepoint)',
    () => disableSync(() => rl.Core.GetGlyphIndex(
        rl.Temp.Font$.Ref1(font).ref,
        codepoint.toInt(),
      ),
    ),
  );

  GlyphInfoD GetGlyphInfo(
    FontD font,
    num codepoint,
  ) => run(
    () => 'GetGlyphInfo($font, $codepoint)',
    () => rl.Core.GetGlyphInfo(
      rl.Temp.Font$.Ref1(font).ref,
      codepoint.toInt(),
    ).toD(),
  );

  RectangleD GetGlyphAtlasRec(
    FontD font,
    num codepoint,
  ) => run(
    () => 'GetGlyphAtlasRec($font, $codepoint)',
    () => rl.Core.GetGlyphAtlasRec(
      rl.Temp.Font$.Ref1(font).ref,
      codepoint.toInt(),
    ).toD(),
  );
    
  String LoadUTF8(
    List<int> codepoints,
  ) => run(
    () => 'LoadUTF8(codepoints: ${codepoints.length})',
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

  List<int> LoadCodepoints(
    String text,
  ) => run(
    () => 'LoadCodepoints($text)',
    () {
      final count = rl.Temp.Int$.Ref1();
      final result = rl.Core.LoadCodepoints(
        rl.Temp.String$.ValueOrNull(text),
        count,
      );
      try {
        return List.generate(count.value, (i) => result[i]);
      } finally {
        rl.Core.UnloadCodepoints(result);
      }
    },
  );

  int GetCodepointCount(
    String text,
  ) => run(
    () => 'GetCodepointCount($text)',
    () => rl.Core.GetCodepointCount(
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  (int codepoint, int codepointSize) GetCodepoint(
    String text,
  ) => run(
    () => 'GetCodepoint($text)',
    () {
      final size = rl.Temp.Int$.Ref1();
      final codepoint = rl.Core.GetCodepoint(
        rl.Temp.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  (int codepoint, int codepointSize) GetCodepointNext(
    String text,
  ) => run(
    () => 'GetCodepointNext($text)',
    () {
      final size = rl.Temp.Int$.Ref1();
      final codepoint = rl.Core.GetCodepointNext(
        rl.Temp.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  (int codepoint, int codepointSize) GetCodepointPrevious(
    String text,
  ) => run(
    () => 'GetCodepointPrevious($text)',
    () {
      final size = rl.Temp.Int$.Ref1();
      final codepoint = rl.Core.GetCodepointPrevious(
        rl.Temp.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  (String text, int size) CodepointToUTF8(
    num codepoint,
  ) => run(
    () => 'CodepointToUTF8($codepoint)',
    () {
      final size = rl.Temp.Int$.Ref1();
      final text = rl.Core.CodepointToUTF8(
        codepoint.toInt(),
        size,
      );
      return (text.toD, size.value);
    },
  );
    
  void DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  ) => run(
    () => 'DrawLine3D($startPos, $endPos, $color)',
    () => rl.Core.DrawLine3D(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawPoint3D(
    Vector3D position,
    ColorD color,
  ) => run(
    () => 'DrawPoint3D($position, $color)',
    () => rl.Core.DrawPoint3D(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCircle3D(
    Vector3D center,
    num radius,
    Vector3D rotationAxis,
    num rotationAngle,
    ColorD color,
  ) => run(
    () => 'DrawCircle3D($center, $radius, $rotationAxis, $rotationAngle, $color)',
    () => rl.Core.DrawCircle3D(
      rl.Temp.Vector3$.Ref1(center).ref,
      radius.toDouble(),
      rl.Temp.Vector3$.Ref2(rotationAxis).ref,
      rotationAngle.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawTriangle3D(
    Vector3D v1,
    Vector3D v2,
    Vector3D v3,
    ColorD color,
  ) => run(
    () => 'DrawTriangle3D($v1, $v2, $v3, $color)',
    () => rl.Core.DrawTriangle3D(
      rl.Temp.Vector3$.Ref1(v1).ref,
      rl.Temp.Vector3$.Ref2(v2).ref,
      rl.Temp.Vector3$.Ref3(v3).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawTriangleStrip3D(
    List<Vector3D> points,
    ColorD color,
  ) => run(
    () => 'DrawTriangleStrip3D(points: ${points.length}, $color)',
    () => rl.Core.DrawTriangleStrip3D(
      rl.Temp.Vector3$.Array(points),
      points.length,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCube(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => run(
    () => 'DrawCube($position, $width, $height, $length, $color)',
    () => rl.Core.DrawCube(
      rl.Temp.Vector3$.Ref1(position).ref,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => 'DrawCubeV($position, $size, $color)',
    () => rl.Core.DrawCubeV(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(size).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCubeWires(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => run(
    () => 'DrawCubeWires($position, $width, $height, $length, $color)',
    () => rl.Core.DrawCubeWires(
      rl.Temp.Vector3$.Ref1(position).ref,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => 'DrawCubeWiresV($position, $size, $color)',
    () => rl.Core.DrawCubeWiresV(
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(size).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawSphere(
    Vector3D centerPos,
    num radius,
    ColorD color,
  ) => run(
    () => 'DrawSphere($centerPos, $radius, $color)',
    () => rl.Core.DrawSphere(
      rl.Temp.Vector3$.Ref1(centerPos).ref,
      radius.toDouble(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawSphereEx(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => run(
    () => 'DrawSphereEx($centerPos, $radius, $rings, $slices, $color)',
    () => rl.Core.DrawSphereEx(
      rl.Temp.Vector3$.Ref1(centerPos).ref,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawSphereWires(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => run(
    () => 'DrawSphereWires($centerPos, $radius, $rings, $slices, $color)',
    () => rl.Core.DrawSphereWires(
      rl.Temp.Vector3$.Ref1(centerPos).ref,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCylinder(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => run(
    () => 'DrawCylinder($position, $radiusTop, $radiusBottom, $height, $slices, $color)',
    () => rl.Core.DrawCylinder(
      rl.Temp.Vector3$.Ref1(position).ref,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => run(
    () => 'DrawCylinderEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)',
    () => rl.Core.DrawCylinderEx(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCylinderWires(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => run(
    () => 'DrawCylinderWires($position, $radiusTop, $radiusBottom, $height, $slices, $color)',
    () => rl.Core.DrawCylinderWires(
      rl.Temp.Vector3$.Ref1(position).ref,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => run(
    () => 'DrawCylinderWiresEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)',
    () => rl.Core.DrawCylinderWiresEx(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => run(
    () => 'DrawCapsule($startPos, $endPos, $radius, $slices, $rings, $color)',
    () => rl.Core.DrawCapsule(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => run(
    () => 'DrawCapsuleWires($startPos, $endPos, $radius, $slices, $rings, $color)',
    () => rl.Core.DrawCapsuleWires(
      rl.Temp.Vector3$.Ref1(startPos).ref,
      rl.Temp.Vector3$.Ref2(endPos).ref,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  ) => run(
    () => 'DrawPlane($centerPos, $size, $color)',
    () => rl.Core.DrawPlane(
      rl.Temp.Vector3$.Ref1(centerPos).ref,
      rl.Temp.Vector2$.Ref1(size).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawRay(
    RayD ray,
    ColorD color,
  ) => run(
    () => 'DrawRay($ray, $color)',
    () => rl.Core.DrawRay(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );
    
  void DrawGrid(
    num slices,
    num spacing,
  ) => run(
    () => 'DrawGrid($slices, $spacing)',
    () => rl.Core.DrawGrid(
      slices.toInt(),
      spacing.toDouble(),
    ),
  );
    
  ModelD LoadModel(
    String fileName,
  ) => run(
    () => 'LoadModel($fileName)',
    () => rl.Temp.Model$.RefCapture(
      'LoadModel_$fileName',
      rl.Core.LoadModel(
        rl.Temp.String$.ValueOrNull(fileName),
      ),
    ),
  );
    
  ModelD LoadModelFromMesh(
    MeshD mesh,
  ) => run(
    () => 'LoadModelFromMesh($mesh)',
    () => rl.Temp.Model$.RefCapture(
      'LoadModelFromMesh_${mesh.internalId}',
      rl.Core.LoadModelFromMesh(
        rl.Temp.Mesh$.Ref1(mesh).ref,
      ),
    ),
  );
    
  bool IsModelValid(
    ModelD model,
  ) => run(
    () => 'IsModelValid($model)',
    () => rl.Core.IsModelValid(
      rl.Temp.Model$.Ref1(model).ref,
    ),
  );
    
  void UnloadModel(
    ModelD model,
  ) => run(
    () => 'UnloadModel($model)',
    () => rl.Core.UnloadModel(model.getOriginalPointerAndDispose().ref),
    // () => rl.Core.UnloadModel(_model1(model).ref),
  );
    
  BoundingBoxD GetModelBoundingBox(
    ModelD model,
  ) => run(
    () => 'GetModelBoundingBox($model)',
    () => rl.Core.GetModelBoundingBox(
      rl.Temp.Model$.Ref1(model).ref,
    ).toD(),
  );
    
  void DrawModel(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint
  ) => run(
    () => 'DrawModel($model, $position, $scale, $tint)',
    () => rl.Core.DrawModel(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  void DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => 'DrawModelEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)',
    () => rl.Core.DrawModelEx(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(rotationAxis).ref,
      rotationAngle.toDouble(),
      rl.Temp.Vector3$.Ref3(scale).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  void DrawModelWires(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => 'DrawModelWires($model, $position, $scale, $tint)',
    () => rl.Core.DrawModelWires(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  void DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => 'DrawModelWiresEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)',
    () => rl.Core.DrawModelWiresEx(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(rotationAxis).ref,
      rotationAngle.toDouble(),
      rl.Temp.Vector3$.Ref3(scale).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  void DrawModelPoints(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => 'DrawModelPoints($model, $position, $scale, $tint)',
    () => rl.Core.DrawModelPoints(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  void DrawModelPointsEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => 'DrawModelPointsEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)',
    () => rl.Core.DrawModelPointsEx(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector3$.Ref2(rotationAxis).ref,
      rotationAngle.toDouble(),
      rl.Temp.Vector3$.Ref3(scale).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );
    
  void DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  ) => run(
    () => 'DrawBoundingBox($box, $color)',
    () => rl.Core.DrawBoundingBox(
      rl.Temp.BoundingBox$.Ref1(box).ref,
      rl.Temp.Color$.Ref1(color).ref,
    ),
  );

  void DrawBillboard(
    CameraD camera,
    Texture2DD texture,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => 'DrawBillboard($camera, $texture, $position, $scale, $tint)',
    () => rl.Core.DrawBillboard(
      rl.Temp.Camera3D$.Ref1(camera).ref,
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      scale.toDouble(),
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  void DrawBillboardRec(
    CameraD camera,
    Texture2DD texture,
    RectangleD source,
    Vector3D position,
    Vector2D size,
    ColorD tint,
  ) => run(
    () => 'DrawBillboardRec($camera, $texture, $source, $position, $size, $tint)',
    () => rl.Core.DrawBillboardRec(
      rl.Temp.Camera3D$.Ref1(camera).ref,
      rl.Temp.Texture$.Ref1(texture).ref,
      rl.Temp.Rectangle$.Ref1(source).ref,
      rl.Temp.Vector3$.Ref1(position).ref,
      rl.Temp.Vector2$.Ref1(size).ref,
      rl.Temp.Color$.Ref1(tint).ref,
    ),
  );

  void DrawBillboardPro(
    CameraD camera,
    Texture2DD texture,
    RectangleD source,
    Vector3D position,
    Vector3D up,
    Vector2D size,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => 'DrawBillboardPro($camera, $texture, $source, $position, $up, $size, $origin, $rotation, $tint)',
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
  
  void UploadMesh(
    MeshD mesh,
    bool dynamic,
  ) => run(
    () => 'UploadMesh($mesh, $dynamic)',
    () => rl.Temp.Mesh$.RefUpdate1(mesh,
      (p) => rl.Core.UploadMesh(p, dynamic),
    ),
  );
    
  void UpdateMeshBuffer(
    MeshD mesh,
    num index,
    List<int> data,
    num offset,
  ) => run(
    () => 'UpdateMeshBuffer($mesh, $index, data: ${data.length}, $offset)',
    () => rl.Core.UpdateMeshBuffer(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      index.toInt(),
      rl.Temp.Int$.Array(data).cast(),
      data.length,
      offset.toInt(),
    ),
  );
    
  void UnloadMesh(
    MeshD mesh,
  ) => run(
    () => 'UnloadMesh($mesh)',
    () => rl.Core.UnloadMesh(
      rl.Temp.Mesh$.Ref1(mesh).ref,
    ),
  );
    
  void DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  ) => run(
    () => 'DrawMesh($mesh, $material, transform: $transform)',
    () => rl.Core.DrawMesh(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.Material$.Ref1(material).ref,
      rl.Temp.Matrix$.Ref1(transform).ref,
    ),
  );
    
  void DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    List<MatrixD> transforms,
  ) => run(
    () => 'DrawMeshInstanced($mesh, $material, transforms: ${transforms.length})',
    () => rl.Core.DrawMeshInstanced(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.Material$.Ref1(material).ref,
      rl.Temp.Matrix$.Array(transforms),
      transforms.length,
    ),
  );
    
  BoundingBoxD GetMeshBoundingBox(
    MeshD mesh,
  ) => run(
    () => 'GetMeshBoundingBox($mesh)',
    () => rl.Core.GetMeshBoundingBox(
      rl.Temp.Mesh$.Ref1(mesh).ref,
    ).toD(),
  );
    
  void GenMeshTangents(
    MeshD mesh,
  ) => run(
    () => 'GenMeshTangents($mesh)',
    () => rl.Temp.Mesh$.RefUpdate1(mesh,
      (p) => rl.Core.GenMeshTangents(p),
    ),
  );
    
  bool ExportMesh(
    MeshD mesh,
    String fileName,
  ) => run(
    () => 'ExportMesh($mesh, $fileName)',
    () => rl.Core.ExportMesh(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  bool ExportMeshAsCode(
    MeshD mesh,
    String fileName,
  ) => run(
    () => 'ExportMeshAsCode($mesh, $fileName)',
    () => rl.Core.ExportMeshAsCode(
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  MeshD GenMeshPoly(
    num sides,
    num radius,
  ) => run(
    () => 'GenMeshPoly($sides, $radius)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshPoly_${sides}_${radius.toDouble()}',
      rl.Core.GenMeshPoly(
        sides.toInt(),
        radius.toDouble(),
      ),
    ),
  );
    
  MeshD GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => run(
    () => 'GenMeshPlane($width, $length, $resX, $resZ)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshPlane_${width.toDouble()}_${length.toDouble()}',
      rl.Core.GenMeshPlane(
        width.toDouble(),
        length.toDouble(),
        resX.toInt(),
        resZ.toInt(),
      ),
    ),
  );
    
  MeshD GenMeshCube(
    num width,
    num height,
    num length,
  ) => run(
    () => 'GenMeshCube($width, $height, $length)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshCube_${width.toDouble()}_${height.toDouble()}_${length.toDouble()}',
      rl.Core.GenMeshCube(
        width.toDouble(),
        height.toDouble(),
        length.toDouble(),
      ),
    ),
  );
    
  MeshD GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => 'GenMeshSphere($radius, $rings, $slices)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshSphere_${radius.toDouble()}_${rings}_$slices',
      rl.Core.GenMeshSphere(
        radius.toDouble(),
        rings.toInt(),
        slices.toInt(),
      ),
    ),
  );
    
  MeshD GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => 'GenMeshHemiSphere($radius, $rings, $slices)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshHemiSphere_${radius.toDouble()}_${rings}_$slices',
      rl.Core.GenMeshHemiSphere(
        radius.toDouble(),
        rings.toInt(),
        slices.toInt(),
      ),
    ),
  );
    
  MeshD GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => run(
    () => 'GenMeshCylinder($radius, $height, $slices)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshCylinder_${radius.toDouble()}_${height.toDouble()}_$slices',
      rl.Core.GenMeshCylinder(
        radius.toDouble(),
        height.toDouble(),
        slices.toInt(),
      ),
    ),
  );
    
  MeshD GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => run(
    () => 'GenMeshCone($radius, $height, $slices)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshCone_${radius.toDouble()}_${height.toDouble()}_$slices',
      rl.Core.GenMeshCone(
        radius.toDouble(),
        height.toDouble(),
        slices.toInt(),
      ),
    ),
  );
    
  MeshD GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => run(
    () => 'GenMeshTorus($radius, $size, $radSeg, $sides)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshTorus_${radius.toDouble()}_${size.toDouble()}_${radSeg}_$sides',
      rl.Core.GenMeshTorus(
        radius.toDouble(),
        size.toDouble(),
        radSeg.toInt(),
        sides.toInt(),
      ),
    ),
  );
    
  MeshD GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => run(
    () => 'GenMeshKnot($radius, $size, $radSeg, $sides)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshKnot_${radius.toDouble()}_${size.toDouble()}_${radSeg}_$sides',
      rl.Core.GenMeshKnot(
        radius.toDouble(),
        size.toDouble(),
        radSeg.toInt(),
        sides.toInt(),
      ),
    ),
  );
    
  MeshD GenMeshHeightmap(
    ImageD heightmap,
    Vector3D size,
  ) => run(
    () => 'GenMeshHeightmap($heightmap, $size)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshHeightmap_${heightmap.internalId}',
      rl.Core.GenMeshHeightmap(
        rl.Temp.Image$.Ref1(heightmap).ref,
        rl.Temp.Vector3$.Ref1(size).ref,
      ),
    ),
  );
    
  MeshD GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  ) => run(
    () => 'GenMeshCubicmap($cubicmap, $cubeSize)',
    () => rl.Temp.Mesh$.RefCapture(
      'GenMeshCubicmap_${cubicmap.internalId}',
      rl.Core.GenMeshCubicmap(
        rl.Temp.Image$.Ref1(cubicmap).ref,
        rl.Temp.Vector3$.Ref1(cubeSize).ref,
      ),
    ),
  );
    
  List<MaterialD> LoadMaterials(
    String fileName,
  ) => run(
    () => 'LoadMaterials($fileName)',
    () {
      final materialCount = rl.Temp.Int$.Ref1();
      final materials = rl.Core.LoadMaterials(
        rl.Temp.String$.ValueOrNull(fileName),
        materialCount,
      );
      return List.generate(materialCount.value, (i) => materials[i].toD());
    },
  );
    
  MaterialD LoadMaterialDefault() => run(
    () => 'LoadMaterialDefault()',
    () => rl.Temp.Material$.RefCapture(
      'LoadMaterialDefault',
      rl.Core.LoadMaterialDefault(),
    ),
  );
    
  bool IsMaterialValid(
    MaterialD material,
  ) => run(
    () => 'IsMaterialValid($material)',
    () => rl.Core.IsMaterialValid(
      rl.Temp.Material$.Ref1(material).ref,
    ),
  );
    
  void UnloadMaterial(
    MaterialD material,
  ) => run(
    () => 'UnloadMaterial($material)',
    // () => rl.Core.UnloadMaterial(material.getOriginalPointerAndDispose().ref),
    () => rl.Core.UnloadMaterial(
      rl.Temp.Material$.Ref1(material).ref,
    ),
  );
    
  void SetMaterialTexture(
    MaterialD material,
    MaterialMapIndex mapType,
    Texture2DD texture,
  ) => run(
    () => 'SetMaterialTexture($material, ${mapType.name}, $texture)',
    () => material.maps[mapType.value].texture = texture,
  );
    
  void SetModelMeshMaterial(
    ModelD model,
    num meshId,
    num materialId,
  ) => run(
    () => 'SetModelMeshMaterial($model, $meshId, $materialId)',
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
    
  List<ModelAnimationD> LoadModelAnimations(
    String fileName,
  ) => run(
    () => 'LoadModelAnimations($fileName)',
    () {
      final animCount = rl.Temp.Int$.Ref1();
      final anims = rl.Core.LoadModelAnimations(
        rl.Temp.String$.ValueOrNull(fileName),
        animCount,
      );
      return List.generate(animCount.value, (i) => (anims + i).toD());
    },
  );
    
  void UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  ) => run(
    () => 'UpdateModelAnimation($model, $anim, $frame)',
    () => rl.Temp.Model$.RefUpdate1(model,
      (pm) => rl.Temp.ModelAnimation$.RefUpdate1(anim,
        (pma) => rl.Core.UpdateModelAnimation(
          pm.ref,
          pma.ref,
          frame.toInt(),
        ),
      ),
    ),
  );
    
  void UpdateModelAnimationBones(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  ) => run(
    () => 'UpdateModelAnimationBones($model, $anim, $frame)',
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
    
  void UnloadModelAnimation(
    ModelAnimationD anim,
  ) => run(
    () => 'UnloadModelAnimation($anim)',
    () => rl.Core.UnloadModelAnimation(
      rl.Temp.ModelAnimation$.Ref1(anim).ref,
    ),
  );
    
  void UnloadModelAnimations(
    List<ModelAnimationD> animations,
  ) => run(
    () => 'UnloadModelAnimations(animations: ${animations.length})',
    () => animations.forEach(UnloadModelAnimation),
  );
    
  bool IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  ) => run(
    () => 'IsModelAnimationValid($model, $anim)',
    () => rl.Core.IsModelAnimationValid(
      rl.Temp.Model$.Ref1(model).ref,
      rl.Temp.ModelAnimation$.Ref1(anim).ref,
    ),
  );
    
  bool CheckCollisionSpheres(
    Vector3D center1,
    num radius1,
    Vector3D center2,
    num radius2,
  ) => run(
    () => 'CheckCollisionSpheres($center1, $radius1, $center2, $radius2)',
    () => rl.Core.CheckCollisionSpheres(
      rl.Temp.Vector3$.Ref1(center1).ref,
      radius1.toDouble(),
      rl.Temp.Vector3$.Ref2(center2).ref,
      radius2.toDouble(),
    ),
  );
    
  bool CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  ) => run(
    () => 'CheckCollisionBoxes($box1, $box2)',
    () => rl.Core.CheckCollisionBoxes(
      rl.Temp.BoundingBox$.Ref1(box1).ref,
      rl.Temp.BoundingBox$.Ref2(box2).ref,
    ),
  );
    
  bool CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    num radius,
  ) => run(
    () => 'CheckCollisionBoxSphere($box, $center, $radius)',
    () => rl.Core.CheckCollisionBoxSphere(
      rl.Temp.BoundingBox$.Ref1(box).ref,
      rl.Temp.Vector3$.Ref1(center).ref,
      radius.toDouble(),
    ),
  );
    
  RayCollisionD GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    num radius,
  ) => run(
    () => 'GetRayCollisionSphere($ray, $center, $radius)',
    () => rl.Core.GetRayCollisionSphere(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Vector3$.Ref1(center).ref,
      radius.toDouble(),
    ).toD(),
  );
    
  RayCollisionD GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  ) => run(
    () => 'GetRayCollisionBox($ray, $box)',
    () => rl.Core.GetRayCollisionBox(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.BoundingBox$.Ref1(box).ref,
    ).toD(),
  );
    
  RayCollisionD GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  ) => run(
    () => 'GetRayCollisionMesh($ray, $mesh, $transform)',
    () => rl.Core.GetRayCollisionMesh(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Mesh$.Ref1(mesh).ref,
      rl.Temp.Matrix$.Ref1(transform).ref,
    ).toD(),
  );
    
  RayCollisionD GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  ) => run(
    () => 'GetRayCollisionTriangle($ray, $p1, $p2, $p3)',
    () => rl.Core.GetRayCollisionTriangle(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Vector3$.Ref1(p1).ref,
      rl.Temp.Vector3$.Ref2(p2).ref,
      rl.Temp.Vector3$.Ref3(p3).ref,
    ).toD(),
  );
    
  RayCollisionD GetRayCollisionQuad(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
    Vector3D p4,
  ) => run(
    () => 'GetRayCollisionQuad($ray, $p1, $p2, $p3, $p4)',
    () => rl.Core.GetRayCollisionQuad(
      rl.Temp.Ray$.Ref1(ray).ref,
      rl.Temp.Vector3$.Ref1(p1).ref,
      rl.Temp.Vector3$.Ref2(p2).ref,
      rl.Temp.Vector3$.Ref3(p3).ref,
      rl.Temp.Vector3$.Ref4(p4).ref,
    ).toD(),
  );
}
