part of '../../raylib_dartified_base.dart';

/// Backend-agnostic Raylib Core module.
final class RaylibCoreDart<R extends RaylibBase> extends RaylibModule<R> {

  final _debugLabels = _RaylibCoreDartDebugLabels();

  RaylibCoreDart(super.rl);

  RaylibCoreFlat get _flat => rl.module();

  // //////////// //
  // CUSTOM STUFF //
  // //////////// //

  MouseButtonInfo GetMouseButtonInfo(MouseButton button) => .new(
    up: IsMouseButtonUp(button),
    down: IsMouseButtonDown(button),
    pressed: IsMouseButtonPressed(button),
    released: IsMouseButtonReleased(button),
  );

  MouseInfo GetMouseInfo() => .new(
    position: GetMousePosition(),
    delta: GetMouseDelta(),
    wheel: GetMouseWheelMoveV(),
    btnLeft: GetMouseButtonInfo(.MOUSE_BUTTON_LEFT),
    btnMiddle: GetMouseButtonInfo(.MOUSE_BUTTON_MIDDLE),
    btnRight: GetMouseButtonInfo(.MOUSE_BUTTON_RIGHT),
    btnSide: GetMouseButtonInfo(.MOUSE_BUTTON_SIDE),
    btnExtra: GetMouseButtonInfo(.MOUSE_BUTTON_EXTRA),
    btnForward: GetMouseButtonInfo(.MOUSE_BUTTON_FORWARD),
    btnBack: GetMouseButtonInfo(.MOUSE_BUTTON_BACK),
  );

  // ////// //
  // MODULE //
  // ////// //

  /// Initialize window and OpenGL context
  void InitWindow(
    num width,
    num height,
    String title,
  ) => debugRun(
    () => _debugLabels.InitWindow(width, height, title),
    () => _flat.InitWindow(
      width.toInt(),
      height.toInt(),
      String$.ValueOrNull(title),
    ),
  );

  /// Close window and unload OpenGL context
  void CloseWindow() => debugRun(
    () => _debugLabels.CloseWindow(),
    () => _flat.CloseWindow(),
  );

  /// Check if application should close ([KeyboardKey.KEY_ESCAPE] pressed or windows close icon clicked)
  bool WindowShouldClose() => debugRun(
    () => _debugLabels.WindowShouldClose(),
    () => _flat.WindowShouldClose(),
  );

  /// Check if window has been initialized successfully
  bool IsWindowReady() => debugRun(
    () => _debugLabels.IsWindowReady(),
    () => _flat.IsWindowReady(),
  );

  /// Check if window is currently fullscreen
  bool IsWindowFullscreen() => debugRun(
    () => _debugLabels.IsWindowFullscreen(),
    () => _flat.IsWindowFullscreen(),
  );

  /// Check if window is currently hidden
  bool IsWindowHidden() => debugRun(
    () => _debugLabels.IsWindowHidden(),
    () => _flat.IsWindowHidden(),
  );
    
  /// Check if window is currently minimized
  bool IsWindowMinimized() => debugRun(
    () => _debugLabels.IsWindowMinimized(),
    () => _flat.IsWindowMinimized(),
  );
    
  /// Check if window is currently maximized
  bool IsWindowMaximized() => debugRun(
    () => _debugLabels.IsWindowMaximized(),
    () => _flat.IsWindowMaximized(),
  );
    
  /// Check if window is currently focused
  bool IsWindowFocused() => debugRun(
    () => _debugLabels.IsWindowFocused(),
    () => _flat.IsWindowFocused(),
  );
    
  /// Check if window has been resized last frame
  bool IsWindowResized() => debugRun(
    () => _debugLabels.IsWindowResized(),
    () => _flat.IsWindowResized(),
  );
    
  /// Check if one specific window flag is enabled
  bool IsWindowState(
    ConfigFlags flag,
  ) => debugRun(
    () => _debugLabels.IsWindowState(flag),
    () => _flat.IsWindowState(
      flag.value,
    ),
  );
    
  /// Set window configuration state using flags
  void SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => debugRun(
    () => _debugLabels.SetWindowState(flags),
    () => _flat.SetWindowState(
      XUtils.EnumsAsFlagsOr(flags),
    ),
  );
    
  /// Clear window configuration state flags
  void ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => debugRun(
    () => _debugLabels.ClearWindowState(flags),
    () => _flat.ClearWindowState(
      XUtils.EnumsAsFlagsOr(flags),
    ),
  );
    
  /// Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
  void ToggleFullscreen() => debugRun(
    () => _debugLabels.ToggleFullscreen(),
    () => _flat.ToggleFullscreen(),
  );
    
  /// Toggle window state: borderless windowed, resizes window to match monitor resolution
  void ToggleBorderlessWindowed() => debugRun(
    () => _debugLabels.ToggleBorderlessWindowed(),
    () => _flat.ToggleBorderlessWindowed(),
  );
    
  /// Set window state: maximized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MaximizeWindow() => debugRun(
    () => _debugLabels.MaximizeWindow(),
    () => _flat.MaximizeWindow(),
  );
    
  /// Set window state: minimized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MinimizeWindow() => debugRun(
    () => _debugLabels.MinimizeWindow(),
    () => _flat.MinimizeWindow(),
  );
    
  /// Set window state: not minimized/maximized
  void RestoreWindow() => debugRun(
    () => _debugLabels.RestoreWindow(),
    () => _flat.RestoreWindow(),
  );
    
  /// Set icon for window (single image, RGBA 32bit)
  void SetWindowIcon(
    Image image,
  ) => debugRun(
    () => _debugLabels.SetWindowIcon(image),
    () => _flat.SetWindowIcon(
      image,
    ),
  );
    
  /// Set icon for window (multiple images, RGBA 32bit)
  void SetWindowIcons(
    List<Image> images,
  ) => debugRun(
    () => _debugLabels.SetWindowIcons(images),
    () => _flat.SetWindowIcons(
      Image$.Array(images),
      images.length,
    ),
  );
    
  /// Set title for window
  void SetWindowTitle(
    String title,
  ) => debugRun(
    () => _debugLabels.SetWindowTitle(title),
    () => _flat.SetWindowTitle(
      String$.ValueOrNull(title),
    ),
  );

  /// Set window position on screen
  void SetWindowPosition(
    num x,
    num y,
  ) => debugRun(
    () => _debugLabels.SetWindowPosition(x, y),
    () => _flat.SetWindowPosition(
      x.toInt(),
      y.toInt(),
    ),
  );
    
  /// Set monitor for the current window
  void SetWindowMonitor(
    num monitor,
  ) => debugRun(
    () => _debugLabels.SetWindowMonitor(monitor),
    () => _flat.SetWindowMonitor(
      monitor.toInt(),
    ),
  );
    
  /// Set window minimum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMinSize(
    num width,
    num height,
  ) => debugRun(
    () => _debugLabels.SetWindowMinSize(width, height),
    () => _flat.SetWindowMinSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Set window maximum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMaxSize(
    num width,
    num height,
  ) => debugRun(
    () => _debugLabels.SetWindowMaxSize(width, height),
    () => _flat.SetWindowMaxSize(
      width.toInt(),
      height.toInt(),
    ),
  );
    
  /// Set window dimensions
  void SetWindowSize(
    num width,
    num height,
  ) => debugRun(
    () => _debugLabels.SetWindowSize(width, height),
    () => _flat.SetWindowSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Set window opacity [0.0..1.0]
  void SetWindowOpacity(
    num opacity,
  ) => debugRun(
    () => _debugLabels.SetWindowOpacity(opacity),
    () => _flat.SetWindowOpacity(
      opacity.toDouble(),
    ),
  );
    
  /// Set window focused
  void SetWindowFocused() => debugRun(
    () => _debugLabels.SetWindowFocused(),
    () => _flat.SetWindowFocused(),
  );

  /// Get current screen width
  int GetScreenWidth() => debugRun(
    () => _debugLabels.GetScreenWidth(),
    () => _flat.GetScreenWidth(),
  );
    
  /// Get current screen height
  int GetScreenHeight() => debugRun(
    () => _debugLabels.GetScreenHeight(),
    () => _flat.GetScreenHeight(),
  );
    
  /// Get current render width (it considers HiDPI)
  int GetRenderWidth() => debugRun(
    () => _debugLabels.GetRenderWidth(),
    () => _flat.GetRenderWidth(),
  );
    
  /// Get current render height (it considers HiDPI)
  int GetRenderHeight() => debugRun(
    () => _debugLabels.GetRenderHeight(),
    () => _flat.GetRenderHeight(),
  );
    
  /// Get number of connected monitors
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorCount() => debugRun(
    () => _debugLabels.GetMonitorCount(),
    () => _flat.GetMonitorCount(),
  );
    
  /// Get current monitor where window is placed
  /// 
  /// **[!] Not implemented on WASM**
  int GetCurrentMonitor() => debugRun(
    () => _debugLabels.GetCurrentMonitor(),
    () => _flat.GetCurrentMonitor(),
  );
    
  /// Get specified monitor position
  /// 
  /// **[!] Not implemented on WASM**
  Vector2 GetMonitorPosition(
    num monitor,
  ) => debugRun(
    () => _debugLabels.GetMonitorPosition(monitor),
    () => _flat.GetMonitorPosition(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor width (current video mode used by monitor)
  int GetMonitorWidth(
    num monitor,
  ) => debugRun(
    () => _debugLabels.GetMonitorWidth(monitor),
    () => _flat.GetMonitorWidth(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor height (current video mode used by monitor)
  int GetMonitorHeight(
    num monitor,
  ) => debugRun(
    () => _debugLabels.GetMonitorHeight(monitor),
    () => _flat.GetMonitorHeight(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor physical width in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalWidth(
    num monitor,
  ) => debugRun(
    () => _debugLabels.GetMonitorPhysicalWidth(monitor),
    () => _flat.GetMonitorPhysicalWidth(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor physical height in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalHeight(
    num monitor,
  ) => debugRun(
    () => _debugLabels.GetMonitorPhysicalHeight(monitor),
    () => _flat.GetMonitorPhysicalHeight(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor refresh rate
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorRefreshRate(
    num monitor,
  ) => debugRun(
    () => _debugLabels.GetMonitorRefreshRate(monitor),
    () => _flat.GetMonitorRefreshRate(
      monitor.toInt(),
    ),
  );
    
  /// Get window position XY on monitor
  Vector2 GetWindowPosition() => debugRun(
    () => _debugLabels.GetWindowPosition(),
    () => _flat.GetWindowPosition(),
  );
    
  /// Get window scale DPI factor
  Vector2 GetWindowScaleDPI() => debugRun(
    () => _debugLabels.GetWindowScaleDPI(),
    () => _flat.GetWindowScaleDPI(),
  );
    
  /// Get the human-readable, UTF-8 encoded name of the specified monitor
  /// 
  /// **[!] Not implemented on WASM**
  String GetMonitorName(
    num monitor,
  ) => debugRun(
    () => _debugLabels.GetMonitorName(monitor),
    () => _flat.GetMonitorName(
      monitor.toInt(),
    ).toDartString(),
  );
    
  /// Set clipboard text content
  void SetClipboardText(
    String text,
  ) => debugRun(
    () => _debugLabels.SetClipboardText(text),
    () => _flat.SetClipboardText(
      String$.ValueOrNull(text),
    ),
  );
    
  /// Get clipboard text content
  String GetClipboardText() => debugRun(
    () => _debugLabels.GetClipboardText(),
    () => _flat.GetClipboardText().toDartString(),
  );
    
  /// Get clipboard image content
  Image GetClipboardImage() => debugRun(
    () => _debugLabels.GetClipboardImage(),
    () => _flat.GetClipboardImage(),
  );
    
  /// Enable waiting for events on EndDrawing(), no automatic event polling
  void EnableEventWaiting() => debugRun(
    () => _debugLabels.EnableEventWaiting(),
    () => _flat.EnableEventWaiting(),
  );
    
  /// Disable waiting for events on EndDrawing(), automatic events polling
  void DisableEventWaiting() => debugRun(
    () => _debugLabels.DisableEventWaiting(),
    () => _flat.DisableEventWaiting(),
  );
    
  /// Shows cursor
  void ShowCursor() => debugRun(
    () => _debugLabels.ShowCursor(),
    () => _flat.ShowCursor(),
  );
    
  /// Hides cursor
  void HideCursor() => debugRun(
    () => _debugLabels.HideCursor(),
    () => _flat.HideCursor(),
  );
    
  /// Check if cursor is not visible
  bool IsCursorHidden() => debugRun(
    () => _debugLabels.IsCursorHidden(),
    () => _flat.IsCursorHidden(),
  );
    
  /// Enables cursor (unlock cursor)
  void EnableCursor() => debugRun(
    () => _debugLabels.EnableCursor(),
    () => _flat.EnableCursor(),
  );
    
  /// Disables cursor (lock cursor)
  void DisableCursor() => debugRun(
    () => _debugLabels.DisableCursor(),
    () => _flat.DisableCursor(),
  );
    
  /// Check if cursor is on the screen
  bool IsCursorOnScreen() => debugRun(
    () => _debugLabels.IsCursorOnScreen(),
    () => _flat.IsCursorOnScreen(),
  );
    
  /// Set background color (framebuffer clear color)
  void ClearBackground(
    Color color,
  ) => debugRun(
    () => _debugLabels.ClearBackground(color),
    () => _flat.ClearBackground(
      color,
    ),
  );
    
  /// Setup canvas (framebuffer) to start drawing
  void BeginDrawing() => debugRun(
    () => _debugLabels.BeginDrawing(),
    () => _flat.BeginDrawing(),
  );
    
  /// End canvas drawing and swap buffers (double buffering)
  void EndDrawing() => debugRun(
    () => _debugLabels.EndDrawing(),
    () => _flat.EndDrawing(),
  );
    
  /// Begin 2D mode with custom camera (2D)
  void BeginMode2D(
    Camera2D camera,
  ) => debugRun(
    () => _debugLabels.BeginMode2D(camera),
    () => _flat.BeginMode2D(
      camera,
    ),
  );
    
  /// Ends 2D mode with custom camera
  void EndMode2D() => debugRun(
    () => _debugLabels.EndMode2D(),
    () => _flat.EndMode2D(),
  );
    
  /// Begin 3D mode with custom camera (3D)
  void BeginMode3D(
    Camera3D camera,
  ) => debugRun(
    () => _debugLabels.BeginMode3D(camera),
    () => _flat.BeginMode3D(
      camera,
    ),
  );
    
  /// Ends 3D mode and returns to default 2D orthographic mode
  void EndMode3D() => debugRun(
    () => _debugLabels.EndMode3D(),
    () => _flat.EndMode3D(),
  );
    
  /// Begin drawing to render texture
  void BeginTextureMode(
    RenderTexture target,
  ) => debugRun(
    () => _debugLabels.BeginTextureMode(target),
    () => _flat.BeginTextureMode(
      target,
    ),
  );
    
  /// Ends drawing to render texture
  void EndTextureMode() => debugRun(
    () => _debugLabels.EndTextureMode(),
    () => _flat.EndTextureMode(),
  );
    
  /// Begin custom shader drawing
  void BeginShaderMode(
    Shader shader,
  ) => debugRun(
    () => _debugLabels.BeginShaderMode(shader),
    () => _flat.BeginShaderMode(
      shader,
    ),
  );
    
  /// End custom shader drawing (use default shader)
  void EndShaderMode() => debugRun(
    () => _debugLabels.EndShaderMode(),
    () => _flat.EndShaderMode(),
  );
    
  /// Begin blending mode (alpha, additive, multiplied, subtract, custom)
  void BeginBlendMode(
    BlendMode mode,
  ) => debugRun(
    () => _debugLabels.BeginBlendMode(mode),
    () => _flat.BeginBlendMode(
      mode.value,
    ),
  );
    
  /// End blending mode (reset to default: alpha blending)
  void EndBlendMode() => debugRun(
    () => _debugLabels.EndBlendMode(),
    () => _flat.EndBlendMode(),
  );
    
  /// Begin scissor mode (define screen area for following drawing)
  void BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => debugRun(
    () => _debugLabels.BeginScissorMode(x, y, width, height),
    () => _flat.BeginScissorMode(
      x.toInt(),
      y.toInt(),
      width.toInt(),
      height.toInt(),
    ),
  );
    
  /// End scissor mode
  void EndScissorMode() => debugRun(
    () => _debugLabels.EndScissorMode(),
    () => _flat.EndScissorMode(),
  );
    
  /// Begin stereo rendering (requires VR simulator)
  void BeginVrStereoMode(
    VrStereoConfig config,
  ) => debugRun(
    () => _debugLabels.BeginVrStereoMode(config),
    () => _flat.BeginVrStereoMode(
      config,
    ),
  );
    
  /// End stereo rendering (requires VR simulator)
  void EndVrStereoMode() => debugRun(
    () => _debugLabels.EndVrStereoMode(),
    () => _flat.EndVrStereoMode(),
  );
    
  /// Load VR stereo config for VR simulator device parameters
  VrStereoConfig LoadVrStereoConfig(
    VrDeviceInfo device,
  ) => debugRun(
    () => _debugLabels.LoadVrStereoConfig(device),
    () => _flat.LoadVrStereoConfig(
      device,
    ),
  );
    
  /// Unload VR stereo config
  void UnloadVrStereoConfig(
    VrStereoConfig config,
  ) => debugRun(
    () => _debugLabels.UnloadVrStereoConfig(config),
    () => _flat.UnloadVrStereoConfig(
      config,
    ),
  );
    
  /// Load shader from files and bind default locations
  Shader LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => debugRun(
    () => _debugLabels.LoadShader(vsFileName, fsFileName),
    () => _flat.LoadShader(
      String$.ValueOrNull(vsFileName),
      String$.ValueOrNull(fsFileName),
    ),
  );
    
  /// Load shader from code strings and bind default locations
  Shader LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => debugRun(
    () => _debugLabels.LoadShaderFromMemory(vsCode, fsCode),
    () => _flat.LoadShaderFromMemory(
      String$.ValueOrNull(vsCode),
      String$.ValueOrNull(fsCode),
    ),
  );
    
  /// Check if a shader is valid (loaded on GPU)
  bool IsShaderValid(
    Shader shader,
  ) => debugRun(
    () => _debugLabels.IsShaderValid(shader),
    () => _flat.IsShaderValid(
      shader,
    ),
  );
    
  /// Get shader uniform location
  int GetShaderLocation(
    Shader shader,
    String uniformName,
  ) => debugRun(
    () => _debugLabels.GetShaderLocation(shader, uniformName),
    () => _flat.GetShaderLocation(
      shader,
      String$.ValueOrNull(uniformName),
    ),
  );
    
  /// Get shader attribute location
  int GetShaderLocationAttrib(
    Shader shader,
    String attribName,
  ) => debugRun(
    () => _debugLabels.GetShaderLocationAttrib(shader, attribName),
    () => _flat.GetShaderLocationAttrib(
      shader,
      String$.ValueOrNull(attribName),
    ),
  );

  /// Set shader uniform value
  @nonVirtual
  void SetShaderValue(
    Shader shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
  ) => SetShaderValueV(
    shader,
    locIndex,
    value,
    uniformType,
    1
  );

  /// Set shader uniform value vector
  void SetShaderValueV(
    Shader shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  ) => debugRun(
    () => _debugLabels.SetShaderValueV(shader, locIndex, value, uniformType, count),
    () {
      final ptr = switch (uniformType) {
        .SHADER_UNIFORM_FLOAT ||
        .SHADER_UNIFORM_VEC2  ||
        .SHADER_UNIFORM_VEC3  ||
        .SHADER_UNIFORM_VEC4  => Float32$.Array(value),
        
        .SHADER_UNIFORM_INT   ||
        .SHADER_UNIFORM_IVEC2 ||
        .SHADER_UNIFORM_IVEC3 ||
        .SHADER_UNIFORM_IVEC4 => Int$.Array(value),

        .SHADER_UNIFORM_UINT   ||
        .SHADER_UNIFORM_UIVEC2 ||
        .SHADER_UNIFORM_UIVEC3 ||
        .SHADER_UNIFORM_UIVEC4 => UnsignedInt$.Array(value),
        
        .SHADER_UNIFORM_SAMPLER2D => Int$.Array(value),
      };

      _flat.SetShaderValueV(
        shader,
        locIndex.toInt(),
        ptr.cast(),
        uniformType.value,
        count.toInt(),
      );
    },
  );
    
  /// Set shader uniform value (matrix 4x4)
  void SetShaderValueMatrix(
    Shader shader,
    num locIndex,
    Matrix mat,
  ) => debugRun(
    () => _debugLabels.SetShaderValueMatrix(shader, locIndex, mat),
    () => _flat.SetShaderValueMatrix(
      shader,
      locIndex.toInt(),
      mat,
    ),
  );
    
  /// Set shader uniform value for texture (sampler2d)
  void SetShaderValueTexture(
    Shader shader,
    num locIndex,
    Texture texture,
  ) => debugRun(
    () => _debugLabels.SetShaderValueTexture(shader, locIndex, texture),
    () => _flat.SetShaderValueTexture(
      shader,
      locIndex.toInt(),
      texture,
    ),
  );
    
  /// Unload shader from GPU memory (VRAM)
  void UnloadShader(
    Shader shader,
  ) => debugRun(
    () => _debugLabels.UnloadShader(shader),
    () => _flat.UnloadShader(
      shader,
    ),
  );
    
  /// Get a ray trace from screen position (i.e mouse)
  Ray GetScreenToWorldRay(
    Vector2 position,
    Camera3D camera,
  ) => debugRun(
    () => _debugLabels.GetScreenToWorldRay(position, camera),
    () => _flat.GetScreenToWorldRay(
      position,
      camera,
    ),
  );
    
  /// Get a ray trace from screen position (i.e mouse) in a viewport
  Ray GetScreenToWorldRayEx(
    Vector2 position,
    Camera3D camera,
    num width,
    num height,
  ) => debugRun(
    () => _debugLabels.GetScreenToWorldRayEx(position, camera, width, height),
    () => _flat.GetScreenToWorldRayEx(
      position,
      camera,
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Get the screen space position for a 3d world space position
  Vector2 GetWorldToScreen(
    Vector3 position,
    Camera3D camera,
  ) => debugRun(
    () => _debugLabels.GetWorldToScreen(position, camera),
    () => _flat.GetWorldToScreen(
      position,
      camera,
    ),
  );

  /// Get size position for a 3d world space position
  Vector2 GetWorldToScreenEx(
    Vector3 position,
    Camera3D camera,
    num width,
    num height,
  ) => debugRun(
    () => _debugLabels.GetWorldToScreenEx(position, camera, width, height),
    () => _flat.GetWorldToScreenEx(
      position,
      camera,
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Get the screen space position for a 2d camera world space position
  Vector2 GetWorldToScreen2D(
    Vector2 position,
    Camera2D camera,
  ) => debugRun(
    () => _debugLabels.GetWorldToScreen2D(position, camera),
    () => _flat.GetWorldToScreen2D(
      position,
      camera,
    ),
  );

  /// Get the world space position for a 2d camera screen space position
  Vector2 GetScreenToWorld2D(
    Vector2 position,
    Camera2D camera,
  ) => debugRun(
    () => _debugLabels.GetScreenToWorld2D(position, camera),
    () => _flat.GetScreenToWorld2D(
      position,
      camera,
    ),
  );

  /// Get camera transform matrix (view matrix)
  Matrix GetCameraMatrix(
    Camera3D camera,
  ) => debugRun(
    () => _debugLabels.GetCameraMatrix(camera),
    () => _flat.GetCameraMatrix(
      camera,
    ),
  );

  /// Get camera 2d transform matrix
  Matrix GetCameraMatrix2D(
    Camera2D camera,
  ) => debugRun(
    () => _debugLabels.GetCameraMatrix2D(camera),
    () => _flat.GetCameraMatrix2D(
      camera,
    ),
  );
    
  /// Set target FPS (maximum)
  void SetTargetFPS(
    num fps,
  ) => debugRun(
    () => _debugLabels.SetTargetFPS(fps),
    () => _flat.SetTargetFPS(
      fps.toInt(),
    ),
  );

  /// Get time in seconds for last frame drawn (delta time)
  double GetFrameTime() => debugRun(
    () => _debugLabels.GetFrameTime(),
    () => _flat.GetFrameTime(),
  );

  /// Get elapsed time in seconds since InitWindow()
  double GetTime() => debugRun(
    () => _debugLabels.GetTime(),
    () => _flat.GetTime(),
  );

  /// Get current FPS
  int GetFPS() => debugRun(
    () => _debugLabels.GetFPS(),
    () => _flat.GetFPS(),
  );

  /// Swap back buffer with front buffer (screen drawing)
  void SwapScreenBuffer() => debugRun(
    () => _debugLabels.SwapScreenBuffer(),
    () => _flat.SwapScreenBuffer(),
  );

  /// Register all input events
  void PollInputEvents() => debugRun(
    () => _debugLabels.PollInputEvents(),
    () => _flat.PollInputEvents(),
  );

  /// Wait for some time (halt program execution)
  void WaitTime(
    num seconds,
  ) => debugRun(
    () => _debugLabels.WaitTime(seconds),
    () => _flat.WaitTime(
      seconds.toDouble(),
    ),
  );

  /// Set the seed for the random number generator
  void SetRandomSeed(
    num seed,
  ) => debugRun(
    () => _debugLabels.SetRandomSeed(seed),
    () => _flat.SetRandomSeed(
      seed.toInt(),
    ),
  );

  /// Get a random value between min and max (both included)
  int GetRandomValue(
    num min,
    num max,
  ) => debugRun(
    () => _debugLabels.GetRandomValue(min, max),
    () => _flat.GetRandomValue(
      min.toInt(),
      max.toInt(),
    ),
  );

  /// Load random values sequence, no values repeated, min and max included
  List<int> LoadRandomSequence(
    num count,
    num min,
    num max,
  ) => debugRun(
    () => _debugLabels.LoadRandomSequence(count, min, max),
    () {
      final seq = _flat.LoadRandomSequence(
        count.toInt(),
        min.toInt(),
        max.toInt(),
      );
      final List<int> values = .generate(count.toInt(), (i) => seq[i]);
      _flat.UnloadRandomSequence(seq);
      return values;
    },
  );
  
  /// Takes a screenshot of current screen (filename extension defines format)
  void TakeScreenshot(
    String fileName,
  ) => debugRun(
    () => _debugLabels.TakeScreenshot(fileName),
    () => _flat.TakeScreenshot(
      String$.ValueOrNull(fileName),
    ),
  );

  /// Setup init configuration flags (view [ConfigFlags])
  void SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => debugRun(
    () => _debugLabels.SetConfigFlags(flags),
    () => _flat.SetConfigFlags(
      XUtils.EnumsAsFlagsOr(flags),
    ),
  );

  /// Open URL with default system browser (if available)
  void OpenURL(
    String url,
  ) => debugRun(
    () => _debugLabels.OpenURL(url),
    () => _flat.OpenURL(
      String$.ValueOrNull(url),
    ),
  );

  /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
  void TraceLog(
    TraceLogLevel logLevel,
    String text, [
      List<Object?> args = const [],
    ]
  ) => debugRun(
    () => _debugLabels.TraceLog(logLevel, text),
    () => _flat.TraceLog(
      logLevel.value,
      String$.ValueOrNull(
        XUtils.Format(text, args)
      ),
    ),
  );

  /// Set the current threshold (minimum) log level
  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => debugRun(
    () => _debugLabels.SetTraceLogLevel(logLevel),
    () => _flat.SetTraceLogLevel(
      logLevel.value,
    ),
  );

  /// Set custom trace log
  void SetTraceLogCallback(
    covariant TraceLogCallbackBase? callback,
  ) => debugRun(
    () => _debugLabels.SetTraceLogCallback(callback),
    () => _flat.SetTraceLogCallback(
      callback?.attach() ?? .nullptr(),
    ),
  );
    
  /// Set custom file binary data loader
  void SetLoadFileDataCallback(
    covariant LoadFileDataCallbackBase? callback,
  ) => debugRun(
    () => _debugLabels.SetLoadFileDataCallback(callback),
    () => _flat.SetLoadFileDataCallback(
      callback?.attach() ?? .nullptr(),
    ),
  );
    
  /// Set custom file binary data saver
  void SetSaveFileDataCallback(
    covariant SaveFileDataCallbackBase? callback,
  ) => debugRun(
    () => _debugLabels.SetSaveFileDataCallback(callback),
    () => _flat.SetSaveFileDataCallback(
      callback?.attach() ?? .nullptr(),
    ),
  );
    
  /// Set custom file text data loader
  void SetLoadFileTextCallback(
    covariant LoadFileTextCallbackBase? callback,
  ) => debugRun(
    () => _debugLabels.SetLoadFileTextCallback(callback),
    () => _flat.SetLoadFileTextCallback(
      callback?.attach() ?? .nullptr(),
    ),
  );
    
  /// Set custom file text data saver
  void SetSaveFileTextCallback(
    covariant SaveFileTextCallbackBase? callback,
  ) => debugRun(
    () => _debugLabels.SetSaveFileTextCallback(callback),
    () => _flat.SetSaveFileTextCallback(
      callback?.attach() ?? .nullptr(),
    ),
  );
    
  /// Load file data as byte array (read)
  Uint8List LoadFileData(
    String fileName,
  ) => debugRun(
    () => _debugLabels.LoadFileData(fileName),
    () {
      final fileSize = Int$.Ref1();
      final data = _flat.LoadFileData(
        String$.ValueOrNull(fileName),
        fileSize,
      );
      try {
        return UnsignedChar$.asTypedList(data, fileSize.value);
      } finally {
        _flat.UnloadFileData(data);
      }
    },
  );

  /// Save data to file from byte array (write), returns true on success
  bool SaveFileData(
    String fileName,
    Uint8List data,
  ) => debugRun(
    () => _debugLabels.SaveFileData(fileName, data),
    () => _flat.SaveFileData(
      String$.ValueOrNull(fileName),
      Uint8$.Array(data).cast(),
      data.length,
    ),
  );

  /// Export data to code (.h), returns true on success
  bool ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => debugRun(
    () => _debugLabels.ExportDataAsCode(data, fileName),
    () => _flat.ExportDataAsCode(
      Uint8$.Array(data),
      data.length,
      String$.ValueOrNull(fileName),
    ),
  );

  /// Load text data from file (read)
  String LoadFileText(
    String fileName,
  ) => debugRun(
    () => _debugLabels.LoadFileText(fileName),
    () {
      final text = _flat.LoadFileText(
        String$.ValueOrNull(fileName),
      );
      final fileText = text.toDartString();
      _flat.UnloadFileText(text);
      return fileText;
    },
  );

  /// Save text data to file (write), returns true on success
  bool SaveFileText(
    String fileName,
    String text,
  ) => debugRun(
    () => _debugLabels.SaveFileText(fileName, text),
    () => _flat.SaveFileText(
      String$.ValueOrNull(fileName),
      String$.ValueOrNull(text),
    ),
  );

  /// Rename file (if exists)
  int FileRename(
    String fileName,
    String fileRename,
  ) => debugRun(
    () => _debugLabels.FileRename(fileName, fileRename),
    () => _flat.FileRename(
      String$.ValueOrNull(fileName),
      String$.ValueOrNull(fileRename),
    ),
  );
  
  /// Remove file (if exists)
  int FileRemove(
    String fileName,
  ) => debugRun(
    () => _debugLabels.FileRemove(fileName),
    () => _flat.FileRemove(
      String$.ValueOrNull(fileName),
    ),
  );
  
  /// Copy file from one path to another, dstPath created if it doesn't exist
  int FileCopy(
    String srcPath,
    String dstPath,
  ) => debugRun(
    () => _debugLabels.FileCopy(srcPath, dstPath),
    () => _flat.FileCopy(
      String$.ValueOrNull(srcPath),
      String$.ValueOrNull(dstPath),
    ),
  );
  
  /// Move file from one directory to another, dstPath created if it doesn't exist
  int FileMove(
    String srcPath,
    String dstPath,
  ) => debugRun(
    () => _debugLabels.FileMove(srcPath, dstPath),
    () => _flat.FileMove(
      String$.ValueOrNull(srcPath),
      String$.ValueOrNull(dstPath),
    ),
  );
  
  /// Replace text in an existing file
  int FileTextReplace(
    String fileName,
    String search,
    String replacement,
  ) => debugRun(
    () => _debugLabels.FileTextReplace(fileName, search, replacement),
    () => _flat.FileTextReplace(
      String$.ValueOrNull(fileName),
      String$.ValueOrNull(search),
      String$.ValueOrNull(replacement),
    ),
  );
  
  /// Find text in existing file
  int FileTextFindIndex(
    String fileName,
    String search,
  ) => debugRun(
    () => _debugLabels.FileTextFindIndex(fileName, search),
    () => _flat.FileTextFindIndex(
      String$.ValueOrNull(fileName),
      String$.ValueOrNull(search),
    ),
  );
    
  /// Check if file exists
  bool FileExists(
    String fileName,
  ) => debugRun(
    () => _debugLabels.FileExists(fileName),
    () => _flat.FileExists(
      String$.ValueOrNull(fileName),
    ),
  );

  /// Check if a directory path exists
  bool DirectoryExists(
    String dirPath,
  ) => debugRun(
    () => _debugLabels.DirectoryExists(dirPath),
    () => _flat.DirectoryExists(
      String$.ValueOrNull(dirPath),
    ),
  );

  /// Check file extension (including point: .png, .wav)
  bool IsFileExtension(
    String fileName,
    String ext,
  ) => debugRun(
    () => _debugLabels.IsFileExtension(fileName, ext),
    () => _flat.IsFileExtension(
      String$.ValueOrNull(fileName),
      String$.ValueOrNull(ext),
    ),
  );

  /// Get file length in bytes
  int GetFileLength(
    String fileName,
  ) => debugRun(
    () => _debugLabels.GetFileLength(fileName),
    () => _flat.GetFileLength(
      String$.ValueOrNull(fileName),
    ),
  );

  /// Get extension for a filename (includes dot: '.png')
  String GetFileExtension(
    String fileName,
  ) => debugRun(
    () => _debugLabels.GetFileExtension(fileName),
    () => _flat.GetFileExtension(
      String$.ValueOrNull(fileName),
    ).toDartString(),
  );

  /// Get filename for a path string
  String GetFileName(
    String filePath,
  ) => debugRun(
    () => _debugLabels.GetFileName(filePath),
    () => _flat.GetFileName(
      String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  /// Get filename without extension
  String GetFileNameWithoutExt(
    String filePath,
  ) => debugRun(
    () => _debugLabels.GetFileNameWithoutExt(filePath),
    () => _flat.GetFileNameWithoutExt(
      String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  /// Get the file count in a directory
  int GetDirectoryFileCount(
    String dirPath, 
  ) => debugRun(
    () => _debugLabels.GetDirectoryFileCount(dirPath),
    () => _flat.GetDirectoryFileCount(
      String$.ValueOrNull(dirPath),
    ),
  );
  
  /// Get the file count in a directory with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  int GetDirectoryFileCountEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => debugRun(
    () => _debugLabels.GetDirectoryFileCountEx(basePath, filter, scanSubdirs),
    () => _flat.GetDirectoryFileCountEx(
      String$.ValueOrNull(basePath),
      String$.ValueOrNull(filter),
      scanSubdirs,
    ),
  );

  /// Get full path for a given fileName with path
  String GetDirectoryPath(
    String filePath,
  ) => debugRun(
    () => _debugLabels.GetDirectoryPath(filePath),
    () => _flat.GetDirectoryPath(
      String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  /// Get previous directory path for a given path
  String GetPrevDirectoryPath(
    String dirPath,
  ) => debugRun(
    () => _debugLabels.GetPrevDirectoryPath(dirPath),
    () => _flat.GetPrevDirectoryPath(
      String$.ValueOrNull(dirPath),
    ).toDartString(),
  );

  /// Get current working directory
  String GetWorkingDirectory() => debugRun(
    () => _debugLabels.GetWorkingDirectory(),
    () => _flat.GetWorkingDirectory().toDartString(),
  );

  /// Get the directory of the running application
  String GetApplicationDirectory() => debugRun(
    () => _debugLabels.GetApplicationDirectory(),
    () => _flat.GetApplicationDirectory().toDartString(),
  );

  /// Create directories (including full path requested), returns 0 on success
  int MakeDirectory(
    String dirPath,
  ) => debugRun(
    () => _debugLabels.MakeDirectory(dirPath),
    () => _flat.MakeDirectory(
      String$.ValueOrNull(dirPath),
    ),
  );

  /// Change working directory, return true on success
  bool ChangeDirectory(
    String dir,
  ) => debugRun(
    () => _debugLabels.ChangeDirectory(dir),
    () => _flat.ChangeDirectory(
      String$.ValueOrNull(dir),
    ),
  );

  /// Check if a given path is a file or a directory
  bool IsPathFile(
    String path,
  ) => debugRun(
    () => _debugLabels.IsPathFile(path),
    () => _flat.IsPathFile(
      String$.ValueOrNull(path),
    ),
  );

  /// Check if fileName is valid for the platform/OS
  bool IsFileNameValid(
    String fileName,
  ) => debugRun(
    () => _debugLabels.IsFileNameValid(fileName),
    () => _flat.IsFileNameValid(
      String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load directory filepaths
  FilePathList LoadDirectoryFiles(
    String dirPath,
  ) => debugRun(
    () => _debugLabels.LoadDirectoryFiles(dirPath),
    () => _flat.LoadDirectoryFiles(
      String$.ValueOrNull(dirPath),
    ),
  );
    
  /// Load directory filepaths with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  FilePathList LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => debugRun(
    () => _debugLabels.LoadDirectoryFilesEx(basePath, filter, scanSubdirs),
    () => _flat.LoadDirectoryFilesEx(
      String$.ValueOrNull(basePath),
      String$.ValueOrNull(filter),
      scanSubdirs,
    ),
  );

  /// Unload filepaths
  void UnloadDirectoryFiles(
    FilePathList files,
  ) => debugRun(
    () => _debugLabels.UnloadDirectoryFiles(files),
    () => _flat.UnloadDirectoryFiles(
      files,
    ),
  );
    
  /// Check if a file has been dropped into window
  bool IsFileDropped() => debugRun(
    () => _debugLabels.IsFileDropped(),
    () => _flat.IsFileDropped(),
  );
    
  /// Load dropped filepaths
  FilePathList LoadDroppedFiles() => debugRun(
    () => _debugLabels.LoadDroppedFiles(),
    () => _flat.LoadDroppedFiles(),
  );

  /// Unload dropped filepaths
  void UnloadDroppedFiles(
    FilePathList files,
  ) => debugRun(
    () => _debugLabels.UnloadDroppedFiles(files),
    () => _flat.UnloadDroppedFiles(
      files,
    ),
  );

  /// Get file modification time (last write time)
  int GetFileModTime(
    String fileName,
  ) => debugRun(
    () => _debugLabels.GetFileModTime(fileName),
    () => _flat.GetFileModTime(
      String$.ValueOrNull(fileName),
    ),
  );

  /// Compress data (DEFLATE algorithm)
  Uint8List CompressData(
    Uint8List data,
  ) => debugRun(
    () => _debugLabels.CompressData(data),
    () {
      final compDataSize = Int$.Ref1();
      final compData = _flat.CompressData(
        Uint8$.Array(data),
        data.length,
        compDataSize,
      );
      try {
        return UnsignedChar$.asTypedList(compData, compDataSize.value);
      } finally {
        compData.free();
      }
    },
  );

  /// Decompress data (DEFLATE algorithm)
  Uint8List DecompressData(
    Uint8List compData,
  ) => debugRun(
    () => _debugLabels.DecompressData(compData),
    () {
      final dataSize = Int$.Ref1();
      final data = _flat.DecompressData(
        Uint8$.Array(compData),
        compData.length,
        dataSize,
      );
      try {
        return UnsignedChar$.asTypedList(data, dataSize.value);
      } finally {
        data.free();
      }
    },
  );

  /// Encode data to Base64 string
  Uint8List EncodeDataBase64(
    Uint8List data,
  ) => debugRun(
    () => _debugLabels.EncodeDataBase64(data),
    () {
      final outputSize = Int$.Ref1();
      final outputData = _flat.EncodeDataBase64(
        Uint8$.Array(data),
        data.length,
        outputSize,
      );
      try {
        return UnsignedChar$.asTypedList(outputData, outputSize.value);
      } finally {
        outputData.free();
      }
    },
  );

  /// Decode Base64 string data
  Uint8List DecodeDataBase64(
    Uint8List data,
  ) => debugRun(
    () => _debugLabels.DecodeDataBase64(data),
    () {
      final outputSize = Int$.Ref1();
      final outputData = _flat.DecodeDataBase64(
        Int8$.Array(data),
        outputSize,
      );
      try {
        return UnsignedChar$.asTypedList(outputData, outputSize.value);
      } finally {
        outputData.free();
      }
    },
  );

  /// Compute CRC32 hash code
  int ComputeCRC32(
    Uint8List data,
  ) => debugRun(
    () => _debugLabels.ComputeCRC32(data),
    () => _flat.ComputeCRC32(
      Uint8$.Array(data),
      data.length,
    ),
  );

  /// Compute MD5 hash code
  Uint8List ComputeMD5(
    Uint8List data,
  ) => debugRun(
    () => _debugLabels.ComputeMD5(data),
    () => .fromList(UnsignedInt$.ToLEBytes(
      _flat.ComputeMD5(
        Uint8$.Array(data),
        data.length,
      ),
      4,
    )),
  );

  /// Compute SHA1 hash code
  Uint8List ComputeSHA1(
    Uint8List data,
  ) => debugRun(
    () => _debugLabels.ComputeSHA1(data),
    () => .fromList(UnsignedInt$.ToBEBytes(
      _flat.ComputeSHA1(
        Uint8$.Array(data),
        data.length,
      ),
      5,
    )),
  );

  /// Compute SHA256 hash code
  Uint8List ComputeSHA256(
    Uint8List data,
  ) => debugRun(
    () => _debugLabels.ComputeSHA256(data),
    () => .fromList(UnsignedInt$.ToBEBytes(
      _flat.ComputeSHA256(
        Uint8$.Array(data),
        data.length,
      ),
      8,
    )),
  );
    
  /// Load automation events list from file, NULL for empty list
  AutomationEventList LoadAutomationEventList(
    String? fileName,
  ) => debugRun(
    () => _debugLabels.LoadAutomationEventList(fileName),
    () => _flat.LoadAutomationEventList(
      String$.ValueOrNull(fileName),
    ),
  );
    
  /// Unload automation events list from file
  void UnloadAutomationEventList(
    AutomationEventList list,
  ) => debugRun(
    () => _debugLabels.UnloadAutomationEventList(list),
    () => _flat.UnloadAutomationEventList(
      list,
    ),
  );
    
  /// Export automation events list as text file
  bool ExportAutomationEventList(
    AutomationEventList list,
    String fileName,
  ) => debugRun(
    () => _debugLabels.ExportAutomationEventList(list, fileName),
    () => _flat.ExportAutomationEventList(
      list,
      String$.ValueOrNull(fileName),
    ),
  );
    
  /// Set automation event list to record to
  void SetAutomationEventList(
    AutomationEventList list,
  ) => debugRun(
    () => _debugLabels.SetAutomationEventList(list),
    () => _flat.SetAutomationEventList(
      AutomationEventList$.Ref1(list),
    ),
  );
    
  /// Set automation event internal base frame to start recording
  void SetAutomationEventBaseFrame(
    int frame,
  ) => debugRun(
    () => _debugLabels.SetAutomationEventBaseFrame(frame),
    () => _flat.SetAutomationEventBaseFrame(
      frame,
    ),
  );
    
  /// Start recording automation events (AutomationEventList must be set)
  void StartAutomationEventRecording() => debugRun(
    () => _debugLabels.StartAutomationEventRecording(),
    () => _flat.StartAutomationEventRecording(),
  );

  /// Stop recording automation events
  void StopAutomationEventRecording() => debugRun(
    () => _debugLabels.StopAutomationEventRecording(),
    () => _flat.StopAutomationEventRecording(),
  );
    
  /// Play a recorded automation event
  void PlayAutomationEvent(
    AutomationEvent event,
  ) => debugRun(
    () => _debugLabels.PlayAutomationEvent(event),
    () => _flat.PlayAutomationEvent(
      event,
    ),
  );

  /// Check if a key has been pressed once
  bool IsKeyPressed(
    KeyboardKey key,
  ) => debugRun(
    () => _debugLabels.IsKeyPressed(key),
    () => _flat.IsKeyPressed(
      key.value,
    ),
  );

  /// Check if a key has been pressed again
  bool IsKeyPressedRepeat(
    KeyboardKey key,
  ) => debugRun(
    () => _debugLabels.IsKeyPressedRepeat(key),
    () => _flat.IsKeyPressedRepeat(
      key.value,
    ),
  );

  /// Check if a key is being pressed
  bool IsKeyDown(
    KeyboardKey key,
  ) => debugRun(
    () => _debugLabels.IsKeyDown(key),
    () => _flat.IsKeyDown(
      key.value,
    ),
  );

  /// Check if a key has been released once
  bool IsKeyReleased(
    KeyboardKey key,
  ) => debugRun(
    () => _debugLabels.IsKeyReleased(key),
    () => _flat.IsKeyReleased(
      key.value,
    ),
  );

  /// Check if a key is NOT being pressed
  bool IsKeyUp(
    KeyboardKey key,
  ) => debugRun(
    () => _debugLabels.IsKeyUp(key),
    () => _flat.IsKeyUp(
      key.value,
    ),
  );

  /// Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
  /// 
  /// **[!] Not implemented on WASM**
  String GetKeyName(
    KeyboardKey key,
  ) => debugRun(
    () => _debugLabels.GetKeyName(key),
    () => _flat.GetKeyName(
      key.value,
    ).toDartString(),
  );

  /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
  int GetKeyPressed() => debugRun(
    () => _debugLabels.GetKeyPressed(),
    () => _flat.GetKeyPressed(),
  );

  /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
  int GetCharPressed() => debugRun(
    () => _debugLabels.GetCharPressed(),
    () => _flat.GetCharPressed(),
  );

  /// Set a custom key to exit program (default is ESC)
  void SetExitKey(
    KeyboardKey key,
  ) => debugRun(
    () => _debugLabels.SetExitKey(key),
    () => _flat.SetExitKey(
      key.value,
    ),
  );

  /// Check if a gamepad is available
  bool IsGamepadAvailable(
    num gamepad,
  ) => debugRun(
    () => _debugLabels.IsGamepadAvailable(gamepad),
    () => _flat.IsGamepadAvailable(
      gamepad.toInt(),
    ),
  );

  /// Get gamepad internal name id
  String GetGamepadName(
    num gamepad,
  ) => debugRun(
    () => _debugLabels.GetGamepadName(gamepad),
    () => _flat.GetGamepadName(
      gamepad.toInt(),
    ).toDartString(),
  );

  /// Check if a gamepad button has been pressed once
  bool IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => debugRun(
    () => _debugLabels.IsGamepadButtonPressed(gamepad, button),
    () => _flat.IsGamepadButtonPressed(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Check if a gamepad button is being pressed
  bool IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => debugRun(
    () => _debugLabels.IsGamepadButtonDown(gamepad, button),
    () => _flat.IsGamepadButtonDown(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Check if a gamepad button has been released once
  bool IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => debugRun(
    () => _debugLabels.IsGamepadButtonReleased(gamepad, button),
    () => _flat.IsGamepadButtonReleased(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Check if a gamepad button is NOT being pressed
  bool IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => debugRun(
    () => _debugLabels.IsGamepadButtonUp(gamepad, button),
    () => _flat.IsGamepadButtonUp(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Get the last gamepad button pressed
  GamepadButton GetGamepadButtonPressed() => debugRun(
    () => _debugLabels.GetGamepadButtonPressed(),
    () => .fromValue(_flat.GetGamepadButtonPressed()),
  );

  /// Get gamepad axis count for a gamepad
  int GetGamepadAxisCount(
    num gamepad,
  ) => debugRun(
    () => _debugLabels.GetGamepadAxisCount(gamepad),
    () => _flat.GetGamepadAxisCount(
      gamepad.toInt(),
    ),
  );

  /// Get axis movement value for a gamepad axis
  double GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => debugRun(
    () => _debugLabels.GetGamepadAxisMovement(gamepad, axis),
    () => _flat.GetGamepadAxisMovement(
      gamepad.toInt(),
      axis.value,
    ),
  );

  /// Set internal gamepad mappings (SDL_GameControllerDB)
  int SetGamepadMappings(
    String mappings,
  ) => debugRun(
    () => _debugLabels.SetGamepadMappings(mappings),
    () => _flat.SetGamepadMappings(
      String$.ValueOrNull(mappings),
    ),
  );
    
  /// Set gamepad vibration for both motors (duration in seconds)
  void SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => debugRun(
    () => _debugLabels.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration),
    () => _flat.SetGamepadVibration(
      gamepad.toInt(),
      leftMotor.toDouble(),
      rightMotor.toDouble(),
      duration.toDouble(),
    ),
  );

  /// Check if a mouse button has been pressed once
  bool IsMouseButtonPressed(
    MouseButton button,
  ) => debugRun(
    () => _debugLabels.IsMouseButtonPressed(button),
    () => _flat.IsMouseButtonPressed(
      button.value,
    ),
  );

  /// Check if a mouse button is being pressed
  bool IsMouseButtonDown(
    MouseButton button,
  ) => debugRun(
    () => _debugLabels.IsMouseButtonDown(button),
    () => _flat.IsMouseButtonDown(
      button.value,
    ),
  );

  /// Check if a mouse button has been released once
  bool IsMouseButtonReleased(
    MouseButton button,
  ) => debugRun(
    () => _debugLabels.IsMouseButtonReleased(button),
    () => _flat.IsMouseButtonReleased(
      button.value,
    ),
  );

  /// Check if a mouse button is NOT being pressed
  bool IsMouseButtonUp(
    MouseButton button,
  ) => debugRun(
    () => _debugLabels.IsMouseButtonUp(button),
    () => _flat.IsMouseButtonUp(
      button.value,
    ),
  );

  /// Get mouse position X
  int GetMouseX() => debugRun(
    () => _debugLabels.GetMouseX(),
    () => _flat.GetMouseX(),
  );

  /// Get mouse position Y
  int GetMouseY() => debugRun(
    () => _debugLabels.GetMouseY(),
    () => _flat.GetMouseY(),
  );

  /// Get mouse position XY
  Vector2 GetMousePosition() => debugRun(
    () => _debugLabels.GetMousePosition(),
    () => _flat.GetMousePosition(),
  );

  /// Get mouse delta between frames
  Vector2 GetMouseDelta() => debugRun(
    () => _debugLabels.GetMouseDelta(),
    () => _flat.GetMouseDelta(),
  );

  /// Set mouse position XY
  void SetMousePosition(
    num x,
    num y,
  ) => debugRun(
    () => _debugLabels.SetMousePosition(x, y),
    () => _flat.SetMousePosition(
      x.toInt(),
      y.toInt(),
    ),
  );

  /// Set mouse offset
  void SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => debugRun(
    () => _debugLabels.SetMouseOffset(offsetX, offsetY),
    () => _flat.SetMouseOffset(
      offsetX.toInt(),
      offsetY.toInt(),
    ),
  );

  /// Set mouse scaling
  void SetMouseScale(
    num scaleX,
    num scaleY,
  ) => debugRun(
    () => _debugLabels.SetMouseScale(scaleX, scaleY),
    () => _flat.SetMouseScale(
      scaleX.toDouble(),
      scaleY.toDouble(),
    ),
  );

  /// Get mouse wheel movement for X or Y, whichever is larger
  double GetMouseWheelMove() => debugRun(
    () => _debugLabels.GetMouseWheelMove(),
    () => _flat.GetMouseWheelMove(),
  );

  /// Get mouse wheel movement for both X and Y
  Vector2 GetMouseWheelMoveV() => debugRun(
    () => _debugLabels.GetMouseWheelMoveV(),
    () => _flat.GetMouseWheelMoveV(),
  );

  /// Set mouse cursor
  void SetMouseCursor(
    MouseCursor cursor,
  ) => debugRun(
    () => _debugLabels.SetMouseCursor(cursor),
    () => _flat.SetMouseCursor(
      cursor.value,
    ),
  );

  /// Get touch position X for touch point 0 (relative to screen size)
  int GetTouchX() => debugRun(
    () => _debugLabels.GetTouchX(),
    () => _flat.GetTouchX(),
  );

  /// Get touch position Y for touch point 0 (relative to screen size)
  int GetTouchY() => debugRun(
    () => _debugLabels.GetTouchY(),
    () => _flat.GetTouchY(),
  );

  /// Get touch position XY for a touch point index (relative to screen size)
  Vector2 GetTouchPosition(
    num index,
  ) => debugRun(
    () => _debugLabels.GetTouchPosition(index),
    () => _flat.GetTouchPosition(
      index.toInt(),
    ),
  );

  /// Get touch point identifier for given index
  int GetTouchPointId(
    num index,
  ) => debugRun(
    () => _debugLabels.GetTouchPointId(index),
    () => _flat.GetTouchPointId(
      index.toInt(),
    ),
  );

  /// Get number of touch points
  int GetTouchPointCount() => debugRun(
    () => _debugLabels.GetTouchPointCount(),
    () => _flat.GetTouchPointCount(),
  );

  /// Enable a set of gestures using flags [Gesture]
  void SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => debugRun(
    () => _debugLabels.SetGesturesEnabled(flags),
    () => _flat.SetGesturesEnabled(
      XUtils.EnumsAsFlagsOr(flags),
    ),
  );

  /// Check if a gesture have been detected
  bool IsGestureDetected(
    Gesture key,
  ) => debugRun(
    () => _debugLabels.IsGestureDetected(key),
    () => _flat.IsGestureDetected(
      key.value,
    ),
  );

  /// Get latest detected gesture
  Gesture GetGestureDetected() => debugRun(
    () => _debugLabels.GetGestureDetected(),
    () => .fromValue(_flat.GetGestureDetected()),
  );

  /// Get gesture hold time in seconds
  double GetGestureHoldDuration() => debugRun(
    () => _debugLabels.GetGestureHoldDuration(),
    () => _flat.GetGestureHoldDuration(),
  );

  /// Get gesture drag vector
  Vector2 GetGestureDragVector() => debugRun(
    () => _debugLabels.GetGestureDragVector(),
    () => _flat.GetGestureDragVector(),
  );

  /// Get gesture drag angle
  double GetGestureDragAngle() => debugRun(
    () => _debugLabels.GetGestureDragAngle(),
    () => _flat.GetGestureDragAngle(),
  );

  /// Get gesture pinch delta
  Vector2 GetGesturePinchVector() => debugRun(
    () => _debugLabels.GetGesturePinchVector(),
    () => _flat.GetGesturePinchVector(),
  );

  /// Get gesture pinch angle
  double GetGesturePinchAngle() => debugRun(
    () => _debugLabels.GetGesturePinchAngle(),
    () => _flat.GetGesturePinchAngle(),
  );

  /// Process gesture event and translate it into gestures
  void ProcessGestureEvent(
    GestureEvent event,
  ) => debugRun(
    () => _debugLabels.ProcessGestureEvent(event),
    () => _flat.ProcessGestureEvent(
      event,
    ),
  );
  
  /// Update gestures detected (must be called every frame)
  void UpdateGestures() => debugRun(
    () => _debugLabels.UpdateGestures(),
    () => _flat.UpdateGestures(),
  );
    
  /// Update camera position for selected mode
  void UpdateCamera(
    Camera3D camera,
    CameraMode mode,
  ) => debugRun(
    () => _debugLabels.UpdateCamera(camera, mode),
    () => _flat.UpdateCamera(
      Camera3D$.RefUnique(camera),
      mode.value,
    ),
  );

  /// Update camera movement/rotation
  void UpdateCameraPro(
    Camera3D camera,
    Vector3 movement,
    Vector3 rotation,
    num zoom,
  ) => debugRun(
    () => _debugLabels.UpdateCameraPro(camera, movement, rotation, zoom),
    () => _flat.UpdateCameraPro(
      Camera3D$.Ref1(camera),
      movement,
      rotation,
      zoom.toDouble(),
    ),
  );

  /// Set texture and rectangle to be used on shapes drawing
  void SetShapesTexture(
    Texture texture,
    Rectangle source,
  ) => debugRun(
    () => _debugLabels.SetShapesTexture(texture, source),
    () => _flat.SetShapesTexture(
      texture,
      source,
    ),
  );

  /// Get texture that is used for shapes drawing
  Texture GetShapesTexture() => debugRun(
    () => _debugLabels.GetShapesTexture(),
    () => _flat.GetShapesTexture(),
  );

  /// Get texture source rectangle that is used for shapes drawing
  Rectangle GetShapesTextureRectangle() => debugRun(
    () => _debugLabels.GetShapesTextureRectangle(),
    () => _flat.GetShapesTextureRectangle(),
  );

  /// Draw a pixel using geometry [Can be slow, use with care]
  void DrawPixel(
    num posX,
    num posY,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawPixel(posX, posY, color),
    () => _flat.DrawPixel(
      posX.toInt(),
      posY.toInt(),
      color,
    ),
  );

  /// Draw a pixel using geometry (Vector version) [Can be slow, use with care]
  void DrawPixelV(
    Vector2 position,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawPixelV(position, color),
    () => _flat.DrawPixelV(
      position,
      color,
    ),
  );
    
  /// Draw a line
  void DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawLine(startPosX, startPosY, endPosX, endPosY, color),
    () => _flat.DrawLine(
      startPosX.toInt(),
      startPosY.toInt(),
      endPosX.toInt(),
      endPosY.toInt(),
      color,
    ),
  );

  /// Draw a line (using gl lines)
  void DrawLineV(
    Vector2 startPos,
    Vector2 endPos,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawLineV(startPos, endPos, color),
    () => _flat.DrawLineV(
      startPos,
      endPos,
      color,
    ),
  );

  /// Draw a line (using triangles/quads)
  void DrawLineEx(
    Vector2 startPos,
    Vector2 endPos,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawLineEx(startPos, endPos, thick, color),
    () => _flat.DrawLineEx(
      startPos,
      endPos,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw lines sequence (using gl lines)
  void DrawLineStrip(
    List<Vector2> points,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawLineStrip(points, color),
    () => _flat.DrawLineStrip(
      Vector2$.Array(points),
      points.length,
      color,
    ),
  );

  /// Draw line segment cubic-bezier in-out interpolation
  void DrawLineBezier(
    Vector2 startPos,
    Vector2 endPos,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawLineBezier(startPos, endPos, thick, color),
    () => _flat.DrawLineBezier(
      startPos,
      endPos,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw a dashed line
  void DrawLineDashed(
    Vector2 startPos,
    Vector2 endPos,
    num dashSize,
    num spaceSize,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color),
    () => _flat.DrawLineDashed(
      startPos,
      endPos,
      dashSize.toInt(),
      spaceSize.toInt(),
      color,
    ),
  );

  /// Draw a color-filled circle
  void DrawCircle(
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCircle(centerX, centerY, radius, color),
    () => _flat.DrawCircle(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      color,
    ),
  );

  /// Draw a piece of a circle
  void DrawCircleSector(
    Vector2 center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCircleSector(center, radius, startAngle, endAngle, segments, color),
    () => _flat.DrawCircleSector(
      center,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw circle sector outline
  void DrawCircleSectorLines(
    Vector2 center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color),
    () => _flat.DrawCircleSectorLines(
      center,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw a gradient-filled circle
  void DrawCircleGradient(
    Vector2 center,
    num radius,
    Color inner,
    Color outer,
  ) => debugRun(
    () => _debugLabels.DrawCircleGradient(center, radius, inner, outer),
    () => _flat.DrawCircleGradient(
      center,
      radius.toDouble(),
      inner,
      outer,
    ),
  );

  /// Draw a color-filled circle (Vector version)
  void DrawCircleV(
    Vector2 center,
    num radius,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCircleV(center, radius, color),
    () => _flat.DrawCircleV(
      center,
      radius.toDouble(),
      color,
    ),
  );

  /// Draw circle outline
  void DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCircleLines(centerX, centerY, radius, color),
    () => _flat.DrawCircleLines(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      color,
    ),
  );

  /// Draw circle outline (Vector version)
  void DrawCircleLinesV(
    Vector2 center,
    num radius,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCircleLinesV(center, radius, color),
    () => _flat.DrawCircleLinesV(
      center,
      radius.toDouble(),
      color,
    ),
  );
    
  /// Draw ellipse
  void DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawEllipse(centerX, centerY, radiusH, radiusV, color),
    () => _flat.DrawEllipse(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ellipse (Vector version)
  void DrawEllipseV(
    Vector2 center,
    num radiusH,
    num radiusV,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawEllipseV(center, radiusH, radiusV, color),
    () => _flat.DrawEllipseV(
      center,
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ellipse outline
  void DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color),
    () => _flat.DrawEllipseLines(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ellipse outline (Vector version)
  void DrawEllipseLinesV(
    Vector2 center,
    num radiusH,
    num radiusV,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawEllipseLinesV(center, radiusH, radiusV, color),
    () => _flat.DrawEllipseLinesV(
      center,
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ring
  void DrawRing(
    Vector2 center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color),
    () => _flat.DrawRing(
      center,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw ring outline
  void DrawRingLines(
    Vector2 center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color),
    () => _flat.DrawRingLines(
      center,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw a color-filled rectangle
  void DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRectangle(posX, posY, width, height, color),
    () => _flat.DrawRectangle(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  /// Draw a color-filled rectangle (Vector version)
  void DrawRectangleV(
    Vector2 position,
    Vector2 size,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRectangleV(position, size, color),
    () => _flat.DrawRectangleV(
      position,
      size,
      color,
    ),
  );

  /// Draw a color-filled rectangle
  void DrawRectangleRec(
    Rectangle rec,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRectangleRec(rec, color),
    () => _flat.DrawRectangleRec(
      rec,
      color,
    ),
  );
    
  /// Draw a color-filled rectangle with pro parameters
  void DrawRectanglePro(
    Rectangle rec,
    Vector2 origin,
    num rotation,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRectanglePro(rec, origin, rotation, color),
    () => _flat.DrawRectanglePro(
      rec,
      origin,
      rotation.toDouble(),
      color,
    ),
  );

  /// Draw a vertical-gradient-filled rectangle
  void DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    Color top,
    Color bottom,
  ) => debugRun(
    () => _debugLabels.DrawRectangleGradientV(posX, posY, width, height, top, bottom),
    () => _flat.DrawRectangleGradientV(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      top,
      bottom,
    ),
  );

  /// Draw a horizontal-gradient-filled rectangle
  void DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    Color left,
    Color right,
  ) => debugRun(
    () => _debugLabels.DrawRectangleGradientH(posX, posY, width, height, left, right),
    () => _flat.DrawRectangleGradientH(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      left,
      right,
    ),
  );

  /// Draw a gradient-filled rectangle with custom vertex colors
  void DrawRectangleGradientEx(
    Rectangle rec,
    Color topLeft,
    Color bottomLeft,
    Color topRight,
    Color bottomRight,
  ) => debugRun(
    () => _debugLabels.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight),
    () => _flat.DrawRectangleGradientEx(
      rec,
      topLeft,
      bottomLeft,
      topRight,
      bottomRight,
    ),
  );

  /// Draw rectangle outline
  void DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRectangleLines(posX, posY, width, height, color),
    () => _flat.DrawRectangleLines(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  /// Draw rectangle outline with extended parameters
  void DrawRectangleLinesEx(
    Rectangle rec,
    num lineThick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRectangleLinesEx(rec, lineThick, color),
    () => _flat.DrawRectangleLinesEx(
      rec,
      lineThick.toDouble(),
      color,
    ),
  );

  /// Draw rectangle with rounded edges
  void DrawRectangleRounded(
    Rectangle rec,
    num roundness,
    num segments,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRectangleRounded(rec, roundness, segments, color),
    () => _flat.DrawRectangleRounded(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw rectangle lines with rounded edges
  void DrawRectangleRoundedLines(
    Rectangle rec,
    num roundness,
    num segments,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRectangleRoundedLines(rec, roundness, segments, color),
    () => _flat.DrawRectangleRoundedLines(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw rectangle with rounded edges outline
  void DrawRectangleRoundedLinesEx(
    Rectangle rec,
    num roundness,
    num segments,
    num lineThick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color),
    () => _flat.DrawRectangleRoundedLinesEx(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      lineThick.toDouble(),
      color,
    ),
  );
    
  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawTriangle(v1, v2, v3, color),
    () => _flat.DrawTriangle(
      v1,
      v2,
      v3,
      color,
    ),
  );

  /// Draw triangle outline (vertex in counter-clockwise order!)
  void DrawTriangleLines(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawTriangleLines(v1, v2, v3, color),
    () => _flat.DrawTriangleLines(
      v1,
      v2,
      v3,
      color,
    ),
  );

  /// Draw a triangle fan defined by points (first vertex is the center)
  void DrawTriangleFan(
    List<Vector2> points,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawTriangleFan(points, color),
    () => _flat.DrawTriangleFan(
      Vector2$.Array(points),
      points.length,
      color,
    ),
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip(
    List<Vector2> points,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawTriangleStrip(points, color),
    () => _flat.DrawTriangleStrip(
      Vector2$.Array(points),
      points.length,
      color,
    ),
  );

  /// Draw a regular polygon (Vector version)
  void DrawPoly(
    Vector2 center,
    num sides,
    num radius,
    num rotation,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawPoly(center, sides, radius, rotation, color),
    () => _flat.DrawPoly(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      color,
    ),
  );

  /// Draw a polygon outline of n sides
  void DrawPolyLines(
    Vector2 center,
    num sides,
    num radius,
    num rotation,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawPolyLines(center, sides, radius, rotation, color),
    () => _flat.DrawPolyLines(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      color,
    ),
  );

  /// Draw a polygon outline of n sides with extended parameters
  void DrawPolyLinesEx(
    Vector2 center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color),
    () => _flat.DrawPolyLinesEx(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      lineThick.toDouble(),
      color,
    ),
  );

  /// Draw spline: Linear, minimum 2 points
  void DrawSplineLinear(
    List<Vector2> points,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineLinear(points, thick, color),
    () => _flat.DrawSplineLinear(
      Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline: B-Spline, minimum 4 points
  void DrawSplineBasis(
    List<Vector2> points,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineBasis(points, thick, color),
    () => _flat.DrawSplineBasis(
      Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline: Catmull-Rom, minimum 4 points
  void DrawSplineCatmullRom(
    List<Vector2> points,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineCatmullRom(points, thick, color),
    () => _flat.DrawSplineCatmullRom(
      Vector2$.Array(points),
      points.length, 
      thick.toDouble(), 
      color,
    ),
  );

  /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
  void DrawSplineBezierQuadratic(
    List<Vector2> points,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineBezierQuadratic(points, thick, color),
    () => _flat.DrawSplineBezierQuadratic(
      Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
  void DrawSplineBezierCubic(
    List<Vector2> points,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineBezierCubic(points, thick, color),
    () => _flat.DrawSplineBezierCubic(
      Vector2$.Array(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );
    
  /// Draw spline segment: Linear, 2 points
  void DrawSplineSegmentLinear(
    Vector2 p1,
    Vector2 p2,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineSegmentLinear(p1, p2, thick, color),
    () => _flat.DrawSplineSegmentLinear(
      p1,
      p2,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: B-Spline, 4 points
  void DrawSplineSegmentBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color),
    () => _flat.DrawSplineSegmentBasis(
      p1,
      p2,
      p3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: Catmull-Rom, 4 points
  void DrawSplineSegmentCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color),
    () => _flat.DrawSplineSegmentCatmullRom(
      p1,
      p2,
      p3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
  void DrawSplineSegmentBezierQuadratic(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color),
    () => _flat.DrawSplineSegmentBezierQuadratic(
      p1,
      c2,
      p3,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
  void DrawSplineSegmentBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color),
    () => _flat.DrawSplineSegmentBezierCubic(
      p1,
      c2,
      c3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  /// Get (evaluate) spline point: Linear
  Vector2 GetSplinePointLinear(
    Vector2 startPos,
    Vector2 endPos,
    num t,
  ) => debugRun(
    () => _debugLabels.GetSplinePointLinear(startPos, endPos, t),
    () => _flat.GetSplinePointLinear(
      startPos,
      endPos,
      t.toDouble(),
    ),
  );

  /// Get (evaluate) spline point: B-Spline
  Vector2 GetSplinePointBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num t,
  ) => debugRun(
    () => _debugLabels.GetSplinePointBasis(p1, p2, p3, p4, t),
    () => _flat.GetSplinePointBasis(
      p1,
      p2,
      p3,
      p4,
      t.toDouble(),
    ),
  );
    
  /// Get (evaluate) spline point: Catmull-Rom
  Vector2 GetSplinePointCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num t,
  ) => debugRun(
    () => _debugLabels.GetSplinePointCatmullRom(p1, p2, p3, p4, t),
    () => _flat.GetSplinePointCatmullRom(
      p1,
      p2,
      p3,
      p4,
      t.toDouble(),
    ),
  );

  /// Get (evaluate) spline point: Quadratic Bezier
  Vector2 GetSplinePointBezierQuad(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    num t,
  ) => debugRun(
    () => _debugLabels.GetSplinePointBezierQuad(p1, c2, p3, t),
    () => _flat.GetSplinePointBezierQuad(
      p1,
      c2,
      p3,
      t.toDouble(),
    ),
  );

  /// Get (evaluate) spline point: Cubic Bezier
  Vector2 GetSplinePointBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    num t,
  ) => debugRun(
    () => _debugLabels.GetSplinePointBezierCubic(p1, c2, c3, p4, t),
    () => _flat.GetSplinePointBezierCubic(
      p1,
      c2,
      c3,
      p4,
      t.toDouble(),
    ),
  );

  /// Check collision between two rectangles
  bool CheckCollisionRecs(
    Rectangle rec1,
    Rectangle rec2,
  ) => debugRun(
    () => _debugLabels.CheckCollisionRecs(rec1, rec2),
    () => _flat.CheckCollisionRecs(
      rec1,
      rec2,
    ),
  );

  /// Check collision between two circles
  bool CheckCollisionCircles(
    Vector2 center1,
    num radius1,
    Vector2 center2,
    num radius2,
  ) => debugRun(
    () => _debugLabels.CheckCollisionCircles(center1, radius1, center2, radius2),
    () => _flat.CheckCollisionCircles(
      center1,
      radius1.toDouble(),
      center2,
      radius2.toDouble(),
    ),
  );

  /// Check collision between circle and rectangle
  bool CheckCollisionCircleRec(
    Vector2 center,
    num radius,
    Rectangle rec,
  ) => debugRun(
    () => _debugLabels.CheckCollisionCircleRec(center, radius, rec),
    () => _flat.CheckCollisionCircleRec(
      center,
      radius.toDouble(),
      rec,
    ),
  );

  /// Check if circle collides with a line created betweeen two points [p1] and [p2]
  bool CheckCollisionCircleLine(
    Vector2 center,
    num radius,
    Vector2 p1,
    Vector2 p2,
  ) => debugRun(
    () => _debugLabels.CheckCollisionCircleLine(center, radius, p1, p2),
    () => _flat.CheckCollisionCircleLine(
      center,
      radius.toDouble(),
      p1,
      p2,
    ),
  );

  /// Check if point is inside rectangle
  bool CheckCollisionPointRec(
    Vector2 point,
    Rectangle rec,
  ) => debugRun(
    () => _debugLabels.CheckCollisionPointRec(point, rec),
    () => _flat.CheckCollisionPointRec(
      point,
      rec,
    ),
  );
    
  /// Check if point is inside circle
  bool CheckCollisionPointCircle(
    Vector2 point,
    Vector2 center,
    num radius,
  ) => debugRun(
    () => _debugLabels.CheckCollisionPointCircle(point, center, radius),
    () => _flat.CheckCollisionPointCircle(
      point,
      center,
      radius.toDouble(),
    ),
  );

  /// Check if point is inside a triangle
  bool CheckCollisionPointTriangle(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
  ) => debugRun(
    () => _debugLabels.CheckCollisionPointTriangle(point, p1, p2, p3),
    () => _flat.CheckCollisionPointTriangle(
      point,
      p1,
      p2,
      p3,
    ),
  );

  /// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
  bool CheckCollisionPointLine(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    num threshold,
  ) => debugRun(
    () => _debugLabels.CheckCollisionPointLine(point, p1, p2, threshold),
    () => _flat.CheckCollisionPointLine(
      point,
      p1,
      p2,
      threshold.toInt(),
    ),
  );

  /// Check if point is within a polygon described by array of vertices
  bool CheckCollisionPointPoly(
    Vector2 point,
    List<Vector2> points,
  ) => debugRun(
    () => _debugLabels.CheckCollisionPointPoly(point, points),
    () => _flat.CheckCollisionPointPoly(
      point,
      Vector2$.Array(points),
      points.length,
    ),
  );

  /// Check the collision between two lines defined by two points each, returns collision point by reference
  (bool result, Vector2 collisionPoint) CheckCollisionLines(
    Vector2 startPos1,
    Vector2 endPos1,
    Vector2 startPos2,
    Vector2 endPos2,
  ) => debugRun(
    () => _debugLabels.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2),
    () {
      final collisionPoint = Vector2$.Ref5();
      final result = _flat.CheckCollisionLines(
        startPos1,
        endPos1,
        startPos2,
        endPos2,
        collisionPoint,
      );
      return (result, collisionPoint.ref);
    },
  );

  /// Get collision rectangle for two rectangles collision
  Rectangle GetCollisionRec(
    Rectangle rec1,
    Rectangle rec2,
  ) => debugRun(
    () => _debugLabels.GetCollisionRec(rec1, rec2),
    () => _flat.GetCollisionRec(
      rec1,
      rec2,
    ),
  );

  /// Load image from file into CPU memory (RAM)
  Image LoadImage(
    String fileName,
  ) => debugRun(
    () => _debugLabels.LoadImage(fileName),
    () => _flat.LoadImage(
      String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load image from RAW file data
  Image LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => debugRun(
    () => _debugLabels.LoadImageRaw(fileName, width, height, format, headerSize),
    () => _flat.LoadImageRaw(
      String$.ValueOrNull(fileName),
      width.toInt(),
      height.toInt(),
      format.value,
      headerSize.toInt(),
    ),
  );

  /// Load image sequence from file (frames appended to image.data)
  Image LoadImageAnim(
    String fileName,
  ) => debugRun(
    () => _debugLabels.LoadImageAnim(fileName),
    () {
      final frames = Int$.Ref1();
      final image = _flat.LoadImageAnim(
        String$.ValueOrNull(fileName),
        frames,
      );
      image.frameCount = frames.value;
      return image;
    },
  );

  /// Load image sequence from memory buffer
  Image LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => debugRun(
    () => _debugLabels.LoadImageAnimFromMemory(fileType, fileData),
    () {
      final frames = Int$.Ref1();
      final image = _flat.LoadImageAnimFromMemory(
        String$.ValueOrNull(fileType),
        UnsignedChar$.Array(fileData),
        fileData.length,
        frames,
      );
      image.frameCount = frames.value;
      return image;
    },
  );

  /// Load image from memory buffer, fileType refers to extension: i.e. '.png'
  Image LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => debugRun(
    () => _debugLabels.LoadImageFromMemory(fileType, fileData),
    () => _flat.LoadImageFromMemory(
      String$.ValueOrNull(fileType),
      UnsignedChar$.Array(fileData),
      fileData.length,
    ),
  );

  /// Load image from GPU texture data
  Image LoadImageFromTexture(
    Texture texture,
  ) => debugRun(
    () => _debugLabels.LoadImageFromTexture(texture),
    () => _flat.LoadImageFromTexture(
      texture,
    ),
  );

  /// Load image from screen buffer and (screenshot)
  Image LoadImageFromScreen() => debugRun(
    () => _debugLabels.LoadImageFromScreen(),
    () => _flat.LoadImageFromScreen(),
  );

  /// Check if an image is valid (data and parameters)
  bool IsImageValid(
    Image image,
  ) => debugRun(
    () => _debugLabels.IsImageValid(image),
    () => _flat.IsImageValid(
      image,
    ),
  );

  /// Unload image from CPU memory (RAM)
  void UnloadImage(
    Image image,
  ) => debugRun(
    () => _debugLabels.UnloadImage(image),
    () => _flat.UnloadImage(
      image,
    ),
  );

  /// Export image data to file, returns true on success
  bool ExportImage(
    Image image,
    String fileName,
  ) => debugRun(
    () => _debugLabels.ExportImage(image, fileName),
    () => _flat.ExportImage(
      image,
      String$.ValueOrNull(fileName),
    ),
  );
    
  /// Export image to memory buffer
  (XPtr<XUint8> dataPtr, int dataSize) ExportImageToMemory(
    Image image,
    String fileType,
  ) => debugRun(
    () => _debugLabels.ExportImageToMemory(image, fileType),
    () {
      final dataSize = Int$.Ref1();
      final dataPtr = _flat.ExportImageToMemory(
        image,
        String$.ValueOrNull(fileType),
        dataSize,
      );
      return (dataPtr, dataSize.value);
    },
  );

  /// Export image as code file defining an array of bytes, returns true on success
  bool ExportImageAsCode(
    Image image,
    String fileName,
  ) => debugRun(
    () => _debugLabels.ExportImageAsCode(image, fileName),
    () => _flat.ExportImageAsCode(
      image,
      String$.ValueOrNull(fileName),
    ),
  );

  /// Generate image: plain color
  Image GenImageColor(
    num width,
    num height,
    Color color,
  ) => debugRun(
    () => _debugLabels.GenImageColor(width, height, color),
    () => _flat.GenImageColor(
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  /// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
  Image GenImageGradientLinear(
    num width,
    num height,
    num direction,
    Color start,
    Color end,
  ) => debugRun(
    () => _debugLabels.GenImageGradientLinear(width, height, direction, start, end),
    () => _flat.GenImageGradientLinear(
      width.toInt(),
      height.toInt(),
      direction.toInt(),
      start,
      end,
    ),
  );

  /// Generate image: radial gradient
  Image GenImageGradientRadial(
    num width,
    num height,
    num density,
    Color inner,
    Color outer,
  ) => debugRun(
    () => _debugLabels.GenImageGradientRadial(width, height, density, inner, outer),
    () => _flat.GenImageGradientRadial(
      width.toInt(),
      height.toInt(),
      density.toDouble(),
      inner,
      outer,
    ),
  );

  /// Generate image: square gradient
  Image GenImageGradientSquare(
    num width,
    num height,
    num density,
    Color inner,
    Color outer,
  ) => debugRun(
    () => _debugLabels.GenImageGradientSquare(width, height, density, inner, outer),
    () => _flat.GenImageGradientSquare(
      width.toInt(),
      height.toInt(),
      density.toDouble(),
      inner,
      outer,
    ),
  );

  /// Generate image: checked
  Image GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    Color col1,
    Color col2,
  ) => debugRun(
    () => _debugLabels.GenImageChecked(width, height, checksX, checksY, col1, col2),
    () => _flat.GenImageChecked(
      width.toInt(),
      height.toInt(),
      checksX.toInt(),
      checksY.toInt(),
      col1,
      col2,
    ),
  );

  /// Generate image: white noise
  Image GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => debugRun(
    () => _debugLabels.GenImageWhiteNoise(width, height, factor),
    () => _flat.GenImageWhiteNoise(
      width.toInt(),
      height.toInt(),
      factor.toDouble(),
    ),
  );

  /// Generate image: perlin noise
  Image GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => debugRun(
    () => _debugLabels.GenImagePerlinNoise(width, height, offsetX, offsetY, scale),
    () => _flat.GenImagePerlinNoise(
      width.toInt(),
      height.toInt(),
      offsetX.toInt(),
      offsetY.toInt(),
      scale.toDouble(),
    ),
  );
    
  /// Generate image: cellular algorithm, bigger tileSize means bigger cells
  Image GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => debugRun(
    () => _debugLabels.GenImageCellular(width, height, tileSize),
    () => _flat.GenImageCellular(
      width.toInt(),
      height.toInt(),
      tileSize.toInt(),
    ),
  );

  /// Generate image: grayscale image from text data
  Image GenImageText(
    num width,
    num height,
    String text,
  ) => debugRun(
    () => _debugLabels.GenImageText(width, height, text),
    () => _flat.GenImageText(
      width.toInt(),
      height.toInt(),
      String$.ValueOrNull(text),
    ),
  );

  /// Create an image duplicate (useful for transformations)
  Image ImageCopy(
    Image image,
  ) => debugRun(
    () => _debugLabels.ImageCopy(image),
    () => _flat.ImageCopy(
      image,
    ),
  );

  /// Create an image from another image piece
  Image ImageFromImage(
    Image image,
    Rectangle rec,
  ) => debugRun(
    () => _debugLabels.ImageFromImage(image, rec),
    () => _flat.ImageFromImage(
      image,
      rec,
    ),
  );

  /// Create an image from a selected channel of another image (GRAYSCALE)
  Image ImageFromChannel(
    Image image,
    num selectedChannel,
  ) => debugRun(
    () => _debugLabels.ImageFromChannel(image, selectedChannel),
    () => _flat.ImageFromChannel(
      image,
      selectedChannel.toInt(),
    ),
  );

  /// Create an image from text (default font)
  Image ImageText(
    String text,
    num fontSize,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageText(text, fontSize, color),
    () => _flat.ImageText(
      String$.ValueOrNull(text),
      fontSize.toInt(),
      color,
    ),
  );

  /// Create an image from text (custom sprite font)
  Image ImageTextEx(
    Font font,
    String text,
    num fontSize,
    num spacing,
    Color tint,
  ) => debugRun(
    () => _debugLabels.ImageTextEx(font, text, fontSize, spacing, tint),
    () => _flat.ImageTextEx(
      font,
      String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Convert image data to desired format
  void ImageFormat(
    Image image,
    PixelFormat newFormat,
  ) => debugRun(
    () => _debugLabels.ImageFormat(image, newFormat),
    () => _flat.ImageFormat(
      Image$.Ref1(image),
      newFormat.value,
    ),
  );
    
  /// Convert image to POT (power-of-two)
  void ImageToPOT(
    Image image,
    Color fill,
  ) => debugRun(
    () => _debugLabels.ImageToPOT(image, fill),
    () => _flat.ImageToPOT(
      Image$.Ref1(image),
      fill,
    ),
  );

  /// Crop an image to a defined rectangle
  void ImageCrop(
    Image image,
    Rectangle crop,
  ) => debugRun(
    () => _debugLabels.ImageCrop(image, crop),
    () => _flat.ImageCrop(
      Image$.Ref1(image),
      crop,
    ),
  );

  /// Crop image depending on alpha value
  void ImageAlphaCrop(
    Image image,
    num threshold,
  ) => debugRun(
    () => _debugLabels.ImageAlphaCrop(image, threshold),
    () => _flat.ImageAlphaCrop(
      Image$.Ref1(image),
      threshold.toDouble(),
    ),
  );

  /// Clear alpha channel to desired color
  void ImageAlphaClear(
    Image image,
    Color color,
    num threshold,
  ) => debugRun(
    () => _debugLabels.ImageAlphaClear(image, color, threshold),
    () => _flat.ImageAlphaClear(
      Image$.Ref1(image),
      color,
      threshold.toDouble(),
    ),
  );

  /// Apply alpha mask to image
  void ImageAlphaMask(
    Image image,
    Image alphaMask,
  ) => debugRun(
    () => _debugLabels.ImageAlphaMask(image, alphaMask),
    () => _flat.ImageAlphaMask(
      Image$.Ref1(image),
      alphaMask,
    ),
  );

  /// Premultiply alpha channel
  void ImageAlphaPremultiply(
    Image image,
  ) => debugRun(
    () => _debugLabels.ImageAlphaPremultiply(image),
    () => _flat.ImageAlphaPremultiply(
      Image$.Ref1(image),
    ),
  );

  /// Apply Gaussian blur using a box blur approximation
  void ImageBlurGaussian(
    Image image,
    num blurSize,
  ) => debugRun(
    () => _debugLabels.ImageBlurGaussian(image, blurSize),
    () => _flat.ImageBlurGaussian(
      Image$.Ref1(image),
      blurSize.toInt(),
    ),
  );

  /// Apply custom square convolution kernel to image
  void ImageKernelConvolution(
    Image image,
    List<double> kernel,
  ) => debugRun(
    () => _debugLabels.ImageKernelConvolution(image, kernel),
    () => _flat.ImageKernelConvolution(
      Image$.Ref1(image),
      Float32$.Array(kernel),
      kernel.length,
    ),
  );

  /// Resize image (Bicubic scaling algorithm)
  void ImageResize(
    Image image,
    num newWidth,
    num newHeight,
  ) => debugRun(
    () => _debugLabels.ImageResize(image, newWidth, newHeight),
    () => _flat.ImageResize(
      Image$.Ref1(image),
      newWidth.toInt(),
      newHeight.toInt(),
    ),
  );

  /// Resize image (Nearest-Neighbor scaling algorithm)
  void ImageResizeNN(
    Image image,
    num newWidth,
    num newHeight,
  ) => debugRun(
    () => _debugLabels.ImageResizeNN(image, newWidth, newHeight),
    () => _flat.ImageResizeNN(
      Image$.Ref1(image),
      newWidth.toInt(),
      newHeight.toInt(),
    ),
  );
    
  /// Resize canvas and fill with color
  void ImageResizeCanvas(
    Image image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    Color fill,
  ) => debugRun(
    () => _debugLabels.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill),
    () => _flat.ImageResizeCanvas(
      Image$.Ref1(image),
      newWidth.toInt(),
      newHeight.toInt(),
      offsetX.toInt(),
      offsetY.toInt(),
      fill,
    ),
  );

  /// Compute all mipmap levels for a provided image
  void ImageMipmaps(
    Image image,
  ) => debugRun(
    () => _debugLabels.ImageMipmaps(image),
    () => _flat.ImageMipmaps(
      Image$.Ref1(image),
    ),
  );

  /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  void ImageDither(
    Image image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => debugRun(
    () => _debugLabels.ImageDither(image, rBpp, gBpp, bBpp, aBpp),
    () => _flat.ImageDither(
      Image$.Ref1(image),
      rBpp.toInt(),
      gBpp.toInt(),
      bBpp.toInt(),
      aBpp.toInt(),
    ),
  );

  /// Flip image vertically
  void ImageFlipVertical(
    Image image,
  ) => debugRun(
    () => _debugLabels.ImageFlipVertical(image),
    () => _flat.ImageFlipVertical(
      Image$.Ref1(image),
    ),
  );

  /// Flip image horizontally
  void ImageFlipHorizontal(
    Image image,
  ) => debugRun(
    () => _debugLabels.ImageFlipHorizontal(image),
    () => _flat.ImageFlipHorizontal(
      Image$.Ref1(image),
    ),
  );

  /// Rotate image by input angle in degrees (-359 to 359)
  void ImageRotate(
    Image image,
    num degrees,
  ) => debugRun(
    () => _debugLabels.ImageRotate(image, degrees),
    () => _flat.ImageRotate(
      Image$.Ref1(image),
      degrees.toInt(),
    ),
  );

  /// Rotate image clockwise 90deg
  void ImageRotateCW(
    Image image,
  ) => debugRun(
    () => _debugLabels.ImageRotateCW(image),
    () => _flat.ImageRotateCW(
      Image$.Ref1(image),
    ),
  );

  /// Rotate image counter-clockwise 90deg
  void ImageRotateCCW(
    Image image,
  ) => debugRun(
    () => _debugLabels.ImageRotateCCW(image),
    () => _flat.ImageRotateCCW(
      Image$.Ref1(image),
    ),
  );
    
  /// Modify image color: tint
  void ImageColorTint(
    Image image,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageColorTint(image, color),
    () => _flat.ImageColorTint(
      Image$.Ref1(image),
      color,
    ),
  );

  /// Modify image color: invert
  void ImageColorInvert(
    Image image,
  ) => debugRun(
    () => _debugLabels.ImageColorInvert(image),
    () => _flat.ImageColorInvert(
      Image$.Ref1(image),
    ),
  );

  /// Modify image color: grayscale
  void ImageColorGrayscale(
    Image image,
  ) => debugRun(
    () => _debugLabels.ImageColorGrayscale(image),
    () => _flat.ImageColorGrayscale(
      Image$.Ref1(image),
    ),
  );

  /// Modify image color: contrast (-100 to 100)
  void ImageColorContrast(
    Image image,
    num contrast,
  ) => debugRun(
    () => _debugLabels.ImageColorContrast(image, contrast),
    () => _flat.ImageColorContrast(
      Image$.Ref1(image),
      contrast.toDouble(),
    ),
  );

  /// Modify image color: brightness (-255 to 255)
  void ImageColorBrightness(
    Image image,
    num brightness,
  ) => debugRun(
    () => _debugLabels.ImageColorBrightness(image, brightness),
    () => _flat.ImageColorBrightness(
      Image$.Ref1(image),
      brightness.toInt(),
    ),
  );

  /// Modify image color: replace color
  void ImageColorReplace(
    Image image,
    Color color,
    Color replace,
  ) => debugRun(
    () => _debugLabels.ImageColorReplace(image, color, replace),
    () => _flat.ImageColorReplace(
      Image$.Ref1(image),
      color,
      replace,
    ),
  );

  /// Load color data from image as a Color array (RGBA - 32bit)
  List<Color> LoadImageColors(
    Image image,
  ) => debugRun(
    () => _debugLabels.LoadImageColors(image),
    () {
      final colors = _flat.LoadImageColors(
        image,
      );
      try {
        return colors.readArray(image.width * image.height, view: false);
      } finally {
        _flat.UnloadImageColors(colors);
      }
    },
  );
    
  /// Load colors palette from image as a Color array (RGBA - 32bit)
  List<Color> LoadImagePalette(
    Image image,
    num maxPaletteSize,
  ) => debugRun(
    () => _debugLabels.LoadImagePalette(image, maxPaletteSize),
    () {
      final colorCount = Int$.Ref1();
      final colors = _flat.LoadImagePalette(
        image,
        maxPaletteSize.toInt(),
        colorCount,
      );
      try {
        return colors.readArray(colorCount.value, view: false);
      } finally {
        _flat.UnloadImagePalette(colors);
      }
    },
  );

  /// Get image alpha border rectangle
  Rectangle GetImageAlphaBorder(
    Image image,
    num threshold,
  ) => debugRun(
    () => _debugLabels.GetImageAlphaBorder(image, threshold),
    () => _flat.GetImageAlphaBorder(
      image,
      threshold.toDouble(),
    ),
  );

  /// Get image pixel color at (x, y) position
  Color GetImageColor(
    Image image,
    num x,
    num y,
  ) => debugRun(
    () => _debugLabels.GetImageColor(image, x, y),
    () => _flat.GetImageColor(
      image,
      x.toInt(),
      y.toInt(),
    ),
  );

  /// Clear image background with given color
  void ImageClearBackground(
    Image dst,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageClearBackground(dst, color),
    () => _flat.ImageClearBackground(
      Image$.Ref1(dst),
      color,
    ),
  );

  /// Draw pixel within an image
  void ImageDrawPixel(
    Image dst,
    num posX,
    num posY,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawPixel(dst, posX, posY, color),
    () => _flat.ImageDrawPixel(
      Image$.Ref1(dst),
      posX.toInt(),
      posY.toInt(),
      color,
    ),
  );

  /// Draw pixel within an image (Vector version)
  void ImageDrawPixelV(
    Image dst,
    Vector2 position,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawPixelV(dst, position, color),
    () => _flat.ImageDrawPixelV(
      Image$.Ref1(dst),
      position,
      color,
    ),
  );
    
  /// Draw line within an image
  void ImageDrawLine(
    Image dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color),
    () => _flat.ImageDrawLine(
      Image$.Ref1(dst),
      startPosX.toInt(),
      startPosY.toInt(),
      endPosX.toInt(),
      endPosY.toInt(),
      color,
    ),
  );

  /// Draw line within an image (Vector version)
  void ImageDrawLineV(
    Image dst,
    Vector2 start,
    Vector2 end,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawLineV(dst, start, end, color),
    () => _flat.ImageDrawLineV(
      Image$.Ref1(dst),
      start,
      end,
      color,
    ),
  );

  /// Draw a line defining thickness within an image
  void ImageDrawLineEx(
    Image dst,
    Vector2 start,
    Vector2 end,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawLineEx(dst, start, end, thick, color),
    () => _flat.ImageDrawLineEx(
      Image$.Ref1(dst),
      start,
      end,
      thick.toInt(),
      color,
    ),
  );

  /// Draw a filled circle within an image
  void ImageDrawCircle(
    Image dst,
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawCircle(dst, centerX, centerY, radius, color),
    () => _flat.ImageDrawCircle(
      Image$.Ref1(dst),
      centerX.toInt(),
      centerY.toInt(),
      radius.toInt(),
      color,
    ),
  );

  /// Draw a filled circle within an image (Vector version)
  void ImageDrawCircleV(
    Image dst,
    Vector2 center,
    num radius,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawCircleV(dst, center, radius, color),
    () => _flat.ImageDrawCircleV(
      Image$.Ref1(dst),
      center,
      radius.toInt(),
      color,
    ),
  );

  /// Draw circle outline within an image
  void ImageDrawCircleLines(
    Image dst,
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawCircleLines(dst, centerX, centerY, radius, color),
    () => _flat.ImageDrawCircleLines(
      Image$.Ref1(dst),
      centerX.toInt(),
      centerY.toInt(),
      radius.toInt(),
      color,
    ),
  );

  /// Draw circle outline within an image (Vector version)
  void ImageDrawCircleLinesV(
    Image dst,
    Vector2 center,
    num radius,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawCircleLinesV(dst, center, radius, color),
    () => _flat.ImageDrawCircleLinesV(
      Image$.Ref1(dst),
      center,
      radius.toInt(),
      color,
    ),
  );

  /// Draw rectangle within an image
  void ImageDrawRectangle(
    Image dst,
    num posX,
    num posY,
    num width,
    num height,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawRectangle(dst, posX, posY, width, height, color),
    () => _flat.ImageDrawRectangle(
      Image$.Ref1(dst),
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );
    
  /// Draw rectangle within an image (Vector version)
  void ImageDrawRectangleV(
    Image dst,
    Vector2 position,
    Vector2 size,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawRectangleV(dst, position, size, color),
    () => _flat.ImageDrawRectangleV(
      Image$.Ref1(dst),
      position,
      size,
      color,
    ),
  );

  /// Draw rectangle within an image
  void ImageDrawRectangleRec(
    Image dst,
    Rectangle rec,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawRectangleRec(dst, rec, color),
    () => _flat.ImageDrawRectangleRec(
      Image$.Ref1(dst),
      rec,
      color,
    ),
  );

  /// Draw rectangle lines within an image
  void ImageDrawRectangleLines(
    Image dst,
    Rectangle rec,
    num thick,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawRectangleLines(dst, rec, thick, color),
    () => _flat.ImageDrawRectangleLines(
      Image$.Ref1(dst),
      rec,
      thick.toInt(),
      color,
    ),
  );

  /// Draw triangle within an image
  void ImageDrawTriangle(
    Image dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawTriangle(dst, v1, v2, v3, color),
    () => _flat.ImageDrawTriangle(
      Image$.Ref1(dst),
      v1,
      v2,
      v3,
      color,
    ),
  );

  /// Draw triangle with interpolated colors within an image
  void ImageDrawTriangleEx(
    Image dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color c1,
    Color c2,
    Color c3,
  ) => debugRun(
    () => _debugLabels.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3),
    () => _flat.ImageDrawTriangleEx(
      Image$.Ref1(dst),
      v1,
      v2,
      v3,
      c1,
      c2,
      c3,
    ),
  );

  /// Draw triangle outline within an image
  void ImageDrawTriangleLines(
    Image dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawTriangleLines(dst, v1, v2, v3, color),
    () => _flat.ImageDrawTriangleLines(
      Image$.Ref1(dst),
      v1,
      v2,
      v3,
      color,
    ),
  );
    
  /// Draw a triangle fan defined by points within an image (first vertex is the center)
  void ImageDrawTriangleFan(
    Image dst,
    List<Vector2> points,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawTriangleFan(dst, points, color),
    () => _flat.ImageDrawTriangleFan(
      Image$.Ref1(dst),
      Vector2$.Array(points),
      points.length,
      color,
    ),
  );

  /// Draw a triangle strip defined by points within an image
  void ImageDrawTriangleStrip(
    Image dst,
    List<Vector2> points,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawTriangleStrip(dst, points, color),
    () => _flat.ImageDrawTriangleStrip(
      Image$.Ref1(dst),
      Vector2$.Array(points),
      points.length,
      color,
    ),
  );

  /// Draw a source image within a destination image (tint applied to source)
  void ImageDraw(
    Image dst,
    Image src,
    Rectangle srcRec,
    Rectangle dstRec,
    Color tint,
  ) => debugRun(
    () => _debugLabels.ImageDraw(dst, src, srcRec, dstRec, tint),
    () => _flat.ImageDraw(
      Image$.Ref1(dst),
      src,
      srcRec,
      dstRec,
      tint,
    ),
  );

  /// Draw text (using default font) within an image (destination)
  void ImageDrawText(
    Image dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    Color color,
  ) => debugRun(
    () => _debugLabels.ImageDrawText(dst, text, posX, posY, fontSize, color),
    () => _flat.ImageDrawText(
      Image$.Ref1(dst),
      String$.ValueOrNull(text),
      posX.toInt(),
      posY.toInt(),
      fontSize.toInt(),
      color,
    ),
  );

  /// Draw text (custom sprite font) within an image (destination)
  void ImageDrawTextEx(
    Image dst,
    Font font,
    String text,
    Vector2 position,
    num fontSize,
    num spacing,
    Color tint,
  ) => debugRun(
    () => _debugLabels.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint),
    () => _flat.ImageDrawTextEx(
      Image$.Ref1(dst),
      font,
      String$.ValueOrNull(text),
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Load texture from file into GPU memory (VRAM)
  Texture LoadTexture(
    String fileName,
  ) => debugRun(
    () => _debugLabels.LoadTexture(fileName),
    () => _flat.LoadTexture(
      String$.ValueOrNull(fileName),
    ),
  );

  /// Load texture from image data
  Texture LoadTextureFromImage(
    Image image,
  ) => debugRun(
    () => _debugLabels.LoadTextureFromImage(image),
    () => _flat.LoadTextureFromImage(
      image,
    ),
  );

  /// Load cubemap from image, multiple image cubemap layouts supported
  Texture LoadTextureCubemap(
    Image image,
    CubemapLayout layout,
  ) => debugRun(
    () => _debugLabels.LoadTextureCubemap(image, layout),
    () => _flat.LoadTextureCubemap(
      image,
      layout.value,
    ),
  );

  /// Load texture for rendering (framebuffer)
  RenderTexture LoadRenderTexture(
    num width,
    num height,
  ) => debugRun(
    () => _debugLabels.LoadRenderTexture(width, height),
    () => _flat.LoadRenderTexture(
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Check if a texture is valid (loaded in GPU)
  bool IsTextureValid(
    Texture texture,
  ) => debugRun(
    () => _debugLabels.IsTextureValid(texture),
    () => _flat.IsTextureValid(
      texture,
    ),
  );

  /// Unload texture from GPU memory (VRAM)
  void UnloadTexture(
    Texture texture,
  ) => debugRun(
    () => _debugLabels.UnloadTexture(texture),
    () {
      _flat.UnloadTexture(
        texture,
      );
      texture.structDispose();
    },
  );

  /// Check if a render texture is valid (loaded in GPU)
  bool IsRenderTextureValid(
    RenderTexture target,
  ) => debugRun(
    () => _debugLabels.IsRenderTextureValid(target),
    () => _flat.IsRenderTextureValid(
      target,
    ),
  );

  /// Unload render texture from GPU memory (VRAM)
  void UnloadRenderTexture(
    RenderTexture target,
  ) => debugRun(
    () => _debugLabels.UnloadRenderTexture(target),
    () => _flat.UnloadRenderTexture(
      target,
    ),
  );

  /// Update GPU texture with new data
  void UpdateTexture(
    Texture texture,
    Uint8List pixels,
  ) => debugRun(
    () => _debugLabels.UpdateTexture(texture, pixels),
    () => _flat.UpdateTexture(
      texture,
      Uint8$.Array(pixels).cast(),
    ),
  );
    
  /// Update GPU texture rectangle with new data
  void UpdateTextureRec(
    Texture texture,
    Rectangle rec,
    Uint8List pixels,
  ) => debugRun(
    () => _debugLabels.UpdateTextureRec(texture, rec, pixels),
    () => _flat.UpdateTextureRec(
      texture,
      rec,
      Uint8$.Array(pixels).cast(),
    ),
  );

  /// Generate GPU mipmaps for a texture
  void GenTextureMipmaps(
    Texture texture,
  ) => debugRun(
    () => _debugLabels.GenTextureMipmaps(texture),
    () => _flat.GenTextureMipmaps(
      Texture$.Ref1(texture),
    ),
  );

  /// Set texture scaling filter mode
  void SetTextureFilter(
    Texture texture,
    TextureFilter filter,
  ) => debugRun(
    () => _debugLabels.SetTextureFilter(texture, filter),
    () => _flat.SetTextureFilter(
      texture,
      filter.value,
    ),
  );

  /// Set texture wrapping mode
  void SetTextureWrap(
    Texture texture,
    TextureWrap wrap,
  ) => debugRun(
    () => _debugLabels.SetTextureWrap(texture, wrap),
    () => _flat.SetTextureWrap(
      texture,
      wrap.value,
    ),
  );

  /// Draw a Texture2D
  void DrawTexture(
    Texture texture,
    num posX,
    num posY,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTexture(texture, posX, posY, tint),
    () => _flat.DrawTexture(
      texture,
      posX.toInt(),
      posY.toInt(),
      tint,
    ),
  );

  /// Draw a Texture2D with position defined as Vector2
  void DrawTextureV(
    Texture texture,
    Vector2 position,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTextureV(texture, position, tint),
    () => _flat.DrawTextureV(
      texture,
      position,
      tint,
    ),
  );
    
  /// Draw a Texture2D with extended parameters
  void DrawTextureEx(
    Texture texture,
    Vector2 position,
    num rotation,
    num scale,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTextureEx(texture, position, rotation, scale, tint),
    () => _flat.DrawTextureEx(
      texture,
      position,
      rotation.toDouble(),
      scale.toDouble(),
      tint,
    ),
  );

  /// Draw a part of a texture defined by a rectangle
  void DrawTextureRec(
    Texture texture,
    Rectangle source,
    Vector2 position,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTextureRec(texture, source, position, tint),
    () => _flat.DrawTextureRec(
      texture,
      source,
      position,
      tint,
    ),
  );

  /// Draw a part of a texture defined by a rectangle with 'pro' parameters
  void DrawTexturePro(
    Texture texture,
    Rectangle source,
    Rectangle dest,
    Vector2 origin,
    num rotation,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTexturePro(texture, source, dest, origin, rotation, tint),
    () => _flat.DrawTexturePro(
      texture,
      source,
      dest,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );

  /// Draws a texture (or part of it) that stretches or shrinks nicely
  void DrawTextureNPatch(
    Texture texture,
    NPatchInfo nPatchInfo,
    Rectangle dest,
    Vector2 origin,
    num rotation,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint),
    () => _flat.DrawTextureNPatch(
      texture,
      nPatchInfo,
      dest,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );

  /// Check if two colors are equal
  bool ColorIsEqual(
    Color col1,
    Color col2,
  ) => debugRun(
    () => _debugLabels.ColorIsEqual(col1, col2),
    () => _flat.ColorIsEqual(
      col1,
      col2,
    ),
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  Color Fade(
    Color color,
    num alpha,
  ) => debugRun(
    () => _debugLabels.Fade(color, alpha),
    () => _flat.Fade(
      color,
      alpha.toDouble(),
    ),
  );

  /// Get hexadecimal value for a Color (0xRRGGBBAA)
  int ColorToInt(
    Color color,
  ) => debugRun(
    () => _debugLabels.ColorToInt(color),
    () => _flat.ColorToInt(
      color,
    ),
  );

  /// Get Color normalized as float [0..1]
  Vector4 ColorNormalize(
    Color color,
  ) => debugRun(
    () => _debugLabels.ColorNormalize(color),
    () => _flat.ColorNormalize(
      color,
    ),
  );

  /// Get Color from normalized values [0..1]
  Color ColorFromNormalized(
    Vector4 normalized,
  ) => debugRun(
    () => _debugLabels.ColorFromNormalized(normalized),
    () => _flat.ColorFromNormalized(
      normalized,
    ),
  );

  /// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
  Vector3 ColorToHSV(
    Color color,
  ) => debugRun(
    () => _debugLabels.ColorToHSV(color),
    () => _flat.ColorToHSV(
      color,
    ),
  );

  /// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
  Color ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => debugRun(
    () => _debugLabels.ColorFromHSV(hue, saturation, value),
    () => _flat.ColorFromHSV(
      hue.toDouble(),
      saturation.toDouble(),
      value.toDouble(),
    ),
  );

  /// Get color multiplied with another color
  Color ColorTint(
    Color color,
    Color tint,
  ) => debugRun(
    () => _debugLabels.ColorTint(color, tint),
    () => _flat.ColorTint(
      color,
      tint,
    ),
  );

  /// Get color with brightness correction, brightness factor goes from -1.0 to 1.0
  Color ColorBrightness(
    Color color,
    num factor,
  ) => debugRun(
    () => _debugLabels.ColorBrightness(color, factor),
    () => _flat.ColorBrightness(
      color,
      factor.toDouble(),
    ),
  );

  /// Get color with contrast correction, contrast values between -1.0 and 1.0
  Color ColorContrast(
    Color color,
    num contrast,
  ) => debugRun(
    () => _debugLabels.ColorContrast(color, contrast),
    () => _flat.ColorContrast(
      color,
      contrast.toDouble(),
    ),
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  Color ColorAlpha(
    Color color,
    num alpha,
  ) => debugRun(
    () => _debugLabels.ColorAlpha(color, alpha),
    () => _flat.ColorAlpha(
      color,
      alpha.toDouble(),
    ),
  );

  /// Get src alpha-blended into dst color with tint
  Color ColorAlphaBlend(
    Color dst,
    Color src,
    Color tint,
  ) => debugRun(
    () => _debugLabels.ColorAlphaBlend(dst, src, tint),
    () => _flat.ColorAlphaBlend(
      dst,
      src,
      tint,
    ),
  );

  /// Get color lerp interpolation between two colors, factor [0.0..1.0]
  Color ColorLerp(
    Color color1,
    Color color2,
    num factor,
  ) => debugRun(
    () => _debugLabels.ColorLerp(color1, color2, factor),
    () => _flat.ColorLerp(
      color1,
      color2,
      factor.toDouble(),
    ),
  );

  /// Get Color structure from hexadecimal value
  Color GetColor(
    num hexValue,
  ) => debugRun(
    () => _debugLabels.GetColor(hexValue),
    () => _flat.GetColor(
      hexValue.toInt(),
    ),
  );

  /// Get pixel data size in bytes for certain format
  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => debugRun(
    () => _debugLabels.GetPixelDataSize(width, height, format),
    () => _flat.GetPixelDataSize(
      width.toInt(),
      height.toInt(),
      format.value,
    ),
  );

  /// Get the default Font
  Font GetFontDefault() => debugRun(
    () => _debugLabels.GetFontDefault(),
    () => _flat.GetFontDefault(),
  );

  /// Load font from file into GPU memory (VRAM)
  Font LoadFont(
    String fileName,
  ) => debugRun(
    () => _debugLabels.LoadFont(fileName),
    () => _flat.LoadFont(
      String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
  Font LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codepointCount,
    ]
  ) => debugRun(
    () => _debugLabels.LoadFontEx(fileName, fontSize, codepoints),
    () => _flat.LoadFontEx(
      String$.ValueOrNull(fileName),
      fontSize.toInt(),
      codepoints == null ? .nullptr() : Int$.Array(codepoints).cast(),
      codepointCount?.toInt() ?? codepoints?.length ?? 0,
    ),
  );

  /// Load font from Image (XNA style)
  Font LoadFontFromImage(
    Image image,
    Color key,
    num firstChar,
  ) => debugRun(
    () => _debugLabels.LoadFontFromImage(image, key, firstChar),
    () => _flat.LoadFontFromImage(
      image,
      key,
      firstChar.toInt(),
    ),
  );

  /// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  Font LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => debugRun(
    () => _debugLabels.LoadFontFromMemory(fileType, fileData, fontSize, codepoints),
    () => _flat.LoadFontFromMemory(
      String$.ValueOrNull(fileType),
      Uint8$.Array(fileData),
      fileData.length,
      fontSize.toInt(),
      Int$.Array(codepoints),
      codepoints.length,
    ),
  );

  /// Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
  bool IsFontValid(
    Font font,
  ) => debugRun(
    () => _debugLabels.IsFontValid(font),
    () => _flat.IsFontValid(
      font,
    ),
  );

  /// Load font data for further use
  List<GlyphInfo> LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) => debugRun(
    () => _debugLabels.LoadFontData(fileData, fontSize, codepoints, codepointCount, type),
    () {
      final glyphCount = Int$.Ref1();
      final glyphs = _flat.LoadFontData(
        UnsignedChar$.Array(fileData),
        fileData.length,
        fontSize.toInt(),
        codepoints == null ? .nullptr() : Int$.Array(codepoints).cast(),
        codepointCount?.toInt() ?? codepoints?.length ?? 0,
        type.value,
        glyphCount,
      );
      final requestedCount = (codepointCount == null || codepointCount == 0) 
        ? codepoints?.length ?? glyphCount.value 
        : codepointCount.toInt();
      return glyphs.readArray(requestedCount);
    },
  );

  /// Generate image font atlas using chars info
  (Image image, List<Rectangle> glyphRecs) GenImageFontAtlas(
    List<GlyphInfo> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => debugRun(
    () => _debugLabels.GenImageFontAtlas(glyphs, fontSize, padding, packMethod),
    () {
      final recsPtr = Rectangle$.$.Raw();

      try {
        final image = _flat.GenImageFontAtlas(
          glyphs.first.getOp(),
          recsPtr,
          glyphs.length,
          fontSize.toInt(),
          padding.toInt(),
          packMethod.toInt(),
        );

        final innerPtr = recsPtr.readPtr();
        final recs = Rectangle.struct.ptr(innerPtr).readArray(glyphs.length);

        return (image, recs);
      } finally {
        recsPtr.free();
      }
    },
  );

  /// Unload font chars info data (RAM)
  void UnloadFontData(
    List<GlyphInfo> glyphs,
  ) => debugRun(
    () => _debugLabels.UnloadFontData(glyphs),
    () => _flat.UnloadFontData(
      glyphs.first.getOp(),
      glyphs.length,
    ),
  );
    
  /// Unload font from GPU memory (VRAM)
  void UnloadFont(
    Font font,
  ) => debugRun(
    () => _debugLabels.UnloadFont(font),
    () => _flat.UnloadFont(
      font,
    ),
  );

  /// Export font as code file, returns true on success
  bool ExportFontAsCode(
    Font font,
    String fileName,
  ) => debugRun(
    () => _debugLabels.ExportFontAsCode(font, fileName),
    () => _flat.ExportFontAsCode(
      font,
      String$.ValueOrNull(fileName),
    ),
  );

  /// Draw current FPS
  void DrawFPS(
    num posX,
    num posY,
  ) => debugRun(
    () => _debugLabels.DrawFPS(posX, posY),
    () => _flat.DrawFPS(
      posX.toInt(),
      posY.toInt(),
    ),
  );

  /// Draw text (using default font)
  void DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawText(text, posX, posY, fontSize, color),
    () => _flat.DrawText(
      String$.ValueOrNull(text),
      posX.toInt(),
      posY.toInt(),
      fontSize.toInt(),
      color,
    ),
  );

  /// Draw text using font and additional parameters
  void DrawTextEx(
    Font font,
    String text,
    Vector2 position,
    num fontSize,
    num spacing,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTextEx(font, text, position, fontSize, spacing, tint),
    () => _flat.DrawTextEx(
      font,
      String$.ValueOrNull(text),
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Draw text using Font and pro parameters (rotation)
  void DrawTextPro(
    Font font,
    String text,
    Vector2 position,
    Vector2 origin,
    num rotation,
    num fontSize,
    num spacing,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint),
    () => _flat.DrawTextPro(
      font,
      String$.ValueOrNull(text),
      position,
      origin,
      rotation.toDouble(),
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );
    
  /// Draw one character (codepoint)
  void DrawTextCodepoint(
    Font font,
    num codepoint,
    Vector2 position,
    num fontSize,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTextCodepoint(font, codepoint, position, fontSize, tint),
    () => _flat.DrawTextCodepoint(
      font,
      codepoint.toInt(),
      position,
      fontSize.toDouble(),
      tint,
    ),
  );

  /// Draw multiple character (codepoint)
  void DrawTextCodepoints(
    Font font,
    Int32List codepoints,
    Vector2 position,
    num fontSize,
    num spacing,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawTextCodepoints(font, codepoints, position, fontSize, spacing, tint),
    () => _flat.DrawTextCodepoints(
      font,
      Int$.Array(codepoints),
      codepoints.length,
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Set vertical line spacing when drawing with line-breaks
  void SetTextLineSpacing(
    num spacing,
  ) => debugRun(
    () => _debugLabels.SetTextLineSpacing(spacing),
    () => _flat.SetTextLineSpacing(
      spacing.toInt(),
    ),
  );

  /// Measure string width for default font
  int MeasureText(
    String text,
    num fontSize,
  ) => debugRun(
    () => _debugLabels.MeasureText(text, fontSize),
    () => _flat.MeasureText(
      String$.ValueOrNull(text),
      fontSize.toInt(),
    ),
  );
    
  /// Measure string size for Font
  Vector2 MeasureTextEx(
    Font font,
    String text,
    num fontSize,
    num spacing,
  ) => debugRun(
    () => _debugLabels.MeasureTextEx(font, text, fontSize, spacing),
    () => _flat.MeasureTextEx(
      font,
      String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
    ),
  );

  /// Measure string size for an existing array of codepoints for Font
  Vector2 MeasureTextCodepoints(
    Font font,
    Int32List codepoints,
    num fontSize,
    num spacing,
  ) => debugRun(
    () => _debugLabels.MeasureTextCodepoints(font, codepoints, fontSize, spacing),
    () => _flat.MeasureTextCodepoints(
      font,
      Int$.Array(codepoints),
      codepoints.length,
      fontSize.toDouble(),
      spacing.toDouble(),
    ),
  );

  /// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  int GetGlyphIndex(
    Font font,
    num codepoint,
  ) => debugRun(
    () => _debugLabels.GetGlyphIndex(font, codepoint),
    () => _flat.GetGlyphIndex(
      font,
      codepoint.toInt(),
    ),
  );

  /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  GlyphInfo GetGlyphInfo(
    Font font,
    num codepoint,
  ) => debugRun(
    () => _debugLabels.GetGlyphInfo(font, codepoint),
    () => _flat.GetGlyphInfo(
      font,
      codepoint.toInt(),
    ),
  );

  /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  Rectangle GetGlyphAtlasRec(
    Font font,
    num codepoint,
  ) => debugRun(
    () => _debugLabels.GetGlyphAtlasRec(font, codepoint),
    () => _flat.GetGlyphAtlasRec(
      font,
      codepoint.toInt(),
    ),
  );
    
  /// Load UTF-8 text encoded from codepoints array
  String LoadUTF8(
    Int32List codepoints,
  ) => debugRun(
    () => _debugLabels.LoadUTF8(codepoints),
    () {
      final utf8 = _flat.LoadUTF8(
        Int$.Array(codepoints),
        codepoints.length,
      );
      try {
        return utf8.toDartString();
      } finally {
        _flat.UnloadUTF8(utf8);
      }
    },
  );

  /// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
  Int32List LoadCodepoints(
    String text,
  ) => debugRun(
    () => _debugLabels.LoadCodepoints(text),
    () {
      final count = Int$.Ref1();
      final result = _flat.LoadCodepoints(
        String$.ValueOrNull(text),
        count,
      );
      try {
        return result.asCopy(count.value);
      } finally {
        _flat.UnloadCodepoints(result);
      }
    },
  );

  /// Get total number of codepoints in a UTF-8 encoded string
  int GetCodepointCount(
    String text,
  ) => debugRun(
    () => _debugLabels.GetCodepointCount(text),
    () => _flat.GetCodepointCount(
      String$.ValueOrNull(text),
    ),
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepoint(
    String text,
  ) => debugRun(
    () => _debugLabels.GetCodepoint(text),
    () {
      final size = Int$.Ref1();
      final codepoint = _flat.GetCodepoint(
        String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointNext(
    String text,
  ) => debugRun(
    () => _debugLabels.GetCodepointNext(text),
    () {
      final size = Int$.Ref1();
      final codepoint = _flat.GetCodepointNext(
        String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  /// Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointPrevious(
    String text,
  ) => debugRun(
    () => _debugLabels.GetCodepointPrevious(text),
    () {
      final size = Int$.Ref1();
      final codepoint = _flat.GetCodepointPrevious(
        String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  /// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
  (String text, int size) CodepointToUTF8(
    num codepoint,
  ) => debugRun(
    () => _debugLabels.CodepointToUTF8(codepoint),
    () {
      final size = Int$.Ref1();
      final text = _flat.CodepointToUTF8(
        codepoint.toInt(),
        size,
      );
      return (text.toDartString(), size.value);
    },
  );

  /// Load text as separate lines ('\n')
  List<String> LoadTextLines(
    String text,
  ) => debugRun(
    () => _debugLabels.LoadTextLines(text),
    () {
      final textPtr = String$.RawValue(text);
      final lineCountPtr = Int$.Ref1();
      try {
        final linesPtr = _flat.LoadTextLines(
          textPtr,
          lineCountPtr,
        );
        final lines = linesPtr.readStringArray(lineCountPtr.value);
        _flat.UnloadTextLines(linesPtr, lineCountPtr.value);
        return lines;
      } finally {
        textPtr.free();
      }
    },
  );
  
  /// Check if two text string are equal
  /// 
  /// **NOT** calling original Raylib function.
  bool TextIsEqual(
    String text1,
    String text2,
  ) => debugRun(
    () => _debugLabels.TextIsEqual(text1, text2),
    () => text1 == text2,
  );

  /// Get text length
  /// 
  /// **NOT** calling original Raylib function.
  int TextLength(
    String text,
  ) => debugRun(
    () => _debugLabels.TextLength(text),
    () => text.length,
  );

  /// Text formatting with variables (sprintf() style)
  /// 
  /// **NOT** calling original Raylib function.
  String TextFormat(
    String text, [
      List<Object?> args = const [],
    ]
  ) => debugRun(
    () => _debugLabels.TextFormat(text, args),
    () => XUtils.Format(text, args),
  );

  /// Get a piece of a text string
  /// 
  /// **NOT** calling original Raylib function.
  String TextSubtext(
    String text,
    int position,
    int length,
  ) => debugRun(
    () => _debugLabels.TextSubtext(text, position, length),
    () {
      if (position < 0 || position >= text.length) return '';
      final end = (position + length).clamp(position, text.length);
      return text.substring(position, end);
    },
  );

  /// Remove text spaces, concat words
  /// 
  /// **NOT** calling original Raylib function.
  String TextRemoveSpaces(
    String text,
  ) => debugRun(
    () => _debugLabels.TextRemoveSpaces(text),
    () => text.replaceAll(' ', ''),
  );

  /// Get text between two strings
  /// 
  /// **NOT** calling original Raylib function.
  String GetTextBetween(
    String text,
    String begin,
    String end,
  ) => debugRun(
    () => _debugLabels.GetTextBetween(text, begin, end),
    () {
      final startIdx = text.indexOf(begin);
      if (startIdx == -1) return '';
      final contentStart = startIdx + begin.length;
      final endIdx = text.indexOf(end, contentStart);
      if (endIdx == -1) return '';
      return text.substring(contentStart, endIdx);
    },
  );

  /// Replace text string with new string
  /// 
  /// **NOT** calling original Raylib function.
  String TextReplace(
    String text,
    String search,
    String replacement,
  ) => debugRun(
    () => _debugLabels.TextReplace(text, search, replacement),
    () => search.isEmpty ? text : text.replaceAll(search, replacement),
  );

  /// Replace text between two specific strings
  String TextReplaceBetween(
    String text,
    String begin,
    String end,
    String replacement,
  ) => debugRun(
    () => _debugLabels.TextReplaceBetween(text, begin, end, replacement),
    () {
      final startIdx = text.indexOf(begin);
      if (startIdx == -1) return text;
      final contentStart = startIdx + begin.length;
      final endIdx = text.indexOf(end, contentStart);
      if (endIdx == -1) return text;
      return text.substring(0, contentStart) + replacement + text.substring(endIdx);
    },
  );

  /// Insert text in a defined byte position
  String TextInsert(
    String text,
    String insert,
    int position,
  ) => debugRun(
    () => _debugLabels.TextInsert(text, insert, position),
    () {
      final pos = position.clamp(0, text.length);
      return text.substring(0, pos) + insert + text.substring(pos);
    },
  );

  /// Join text strings with delimiter ([delimiter] is expected to be length of 1)
  String TextJoin(
    List<String> textList,
    String delimiter,
  ) => debugRun(
    () => _debugLabels.TextJoin(textList, delimiter),
    () {
      assert(delimiter.length > 1);
      return textList.join(delimiter);
    },
  );

  /// Split text into multiple strings
  List<String> TextSplit(
    String text,
    String delimiter,
  ) => debugRun(
    () => _debugLabels.TextSplit(text, delimiter),
    () => delimiter.isEmpty ? [text] : text.split(delimiter),
  );

  /// Append text at specific position and move cursor
  String TextAppend(
    String text,
    String append,
  ) => debugRun(
    () => _debugLabels.TextAppend(text, append),
    () => text + append,
  );

  /// Find first text occurrence within a string, -1 if not found
  int TextFindIndex(
    String text,
    String search,
  ) => debugRun(
    () => _debugLabels.TextFindIndex(text, search),
    () => text.indexOf(search),
  );

  /// Get upper case version of provided string
  String TextToUpper(
    String text,
  ) => debugRun(
    () => _debugLabels.TextToUpper(text),
    () => text.toUpperCase(),
  );
  
  /// Get lower case version of provided string
  String TextToLower(
    String text,
  ) => debugRun(
    () => _debugLabels.TextToLower(text),
    () => text.toLowerCase(),
  );
  
  /// Get Pascal case notation version of provided string
  String TextToPascal(
    String text,
  ) => debugRun(
    () => _debugLabels.TextToPascal(text),
    () => XUtils.TextSplitWords(text)
      .map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase())
      .join(),
  );
  
  /// Get Snake case notation version of provided string
  String TextToSnake(
    String text,
  ) => debugRun(
    () => _debugLabels.TextToSnake(text),
    () => XUtils.TextSplitWords(text).map((w) => w.toLowerCase()).join('_'),
  );
  
  /// Get Camel case notation version of provided string
  String TextToCamel(
    String text,
  ) => debugRun(
    () => _debugLabels.TextToCamel(text),
    () {
      final words = XUtils.TextSplitWords(text);
      if (words.isEmpty) return '';
      final first = words.first.toLowerCase();
      final rest = words.skip(1).map(
        (w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase(),
      );
      return first + rest.join();
    },
  );

  /// Get integer value from text
  int TextToInteger(
    String text,
  ) => debugRun(
    () => _debugLabels.TextToInteger(text),
    () => int.tryParse(text.trim()) ?? 0,
  );
  
  /// Get float value from text
  double TextToFloat(
    String text,
  ) => debugRun(
    () => _debugLabels.TextToFloat(text),
    () => double.tryParse(text.trim()) ?? 0,
  );
    
  /// Draw a line in 3D world space
  void DrawLine3D(
    Vector3 startPos,
    Vector3 endPos,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawLine3D(startPos, endPos, color),
    () => _flat.DrawLine3D(
      startPos,
      endPos,
      color,
    ),
  );
    
  /// Draw a point in 3D space, actually a small line
  void DrawPoint3D(
    Vector3 position,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawPoint3D(position, color),
    () => _flat.DrawPoint3D(
      position,
      color,
    ),
  );
    
  /// Draw a circle in 3D world space
  void DrawCircle3D(
    Vector3 center,
    num radius,
    Vector3 rotationAxis,
    num rotationAngle,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color),
    () => _flat.DrawCircle3D(
      center,
      radius.toDouble(),
      rotationAxis,
      rotationAngle.toDouble(),
      color,
    ),
  );
    
  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle3D(
    Vector3 v1,
    Vector3 v2,
    Vector3 v3,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawTriangle3D(v1, v2, v3, color),
    () => _flat.DrawTriangle3D(
      v1,
      v2,
      v3,
      color,
    ),
  );
    
  /// Draw a triangle strip defined by points
  void DrawTriangleStrip3D(
    List<Vector3> points,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawTriangleStrip3D(points, color),
    () => _flat.DrawTriangleStrip3D(
      Vector3$.Array(points),
      points.length,
      color,
    ),
  );
    
  /// Draw cube
  void DrawCube(
    Vector3 position,
    num width,
    num height,
    num length,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCube(position, width, height, length, color),
    () => _flat.DrawCube(
      position,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      color,
    ),
  );
    
  /// Draw cube (Vector version)
  void DrawCubeV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCubeV(position, size, color),
    () => _flat.DrawCubeV(
      position,
      size,
      color,
    ),
  );
    
  /// Draw cube wires
  void DrawCubeWires(
    Vector3 position,
    num width,
    num height,
    num length,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCubeWires(position, width, height, length, color),
    () => _flat.DrawCubeWires(
      position,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      color,
    ),
  );
    
  /// Draw cube wires (Vector version)
  void DrawCubeWiresV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCubeWiresV(position, size, color),
    () => _flat.DrawCubeWiresV(
      position,
      size,
      color,
    ),
  );
    
  /// Draw sphere
  void DrawSphere(
    Vector3 centerPos,
    num radius,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSphere(centerPos, radius, color),
    () => _flat.DrawSphere(
      centerPos,
      radius.toDouble(),
      color,
    ),
  );
    
  /// Draw sphere with extended parameters
  void DrawSphereEx(
    Vector3 centerPos,
    num radius,
    num rings,
    num slices,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSphereEx(centerPos, radius, rings, slices, color),
    () => _flat.DrawSphereEx(
      centerPos,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw sphere wires
  void DrawSphereWires(
    Vector3 centerPos,
    num radius,
    num rings,
    num slices,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawSphereWires(centerPos, radius, rings, slices, color),
    () => _flat.DrawSphereWires(
      centerPos,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder/cone
  void DrawCylinder(
    Vector3 position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color),
    () => _flat.DrawCylinder(
      position,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder with base at startPos and top at endPos
  void DrawCylinderEx(
    Vector3 startPos,
    Vector3 endPos,
    num startRadius,
    num endRadius,
    num sides,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color),
    () => _flat.DrawCylinderEx(
      startPos,
      endPos,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder/cone wires
  void DrawCylinderWires(
    Vector3 position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color),
    () => _flat.DrawCylinderWires(
      position,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder wires with base at startPos and top at endPos
  void DrawCylinderWiresEx(
    Vector3 startPos,
    Vector3 endPos,
    num startRadius,
    num endRadius,
    num sides,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color),
    () => _flat.DrawCylinderWiresEx(
      startPos,
      endPos,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      color,
    ),
  );
    
  /// Draw a capsule with the center of its sphere caps at startPos and endPos
  void DrawCapsule(
    Vector3 startPos,
    Vector3 endPos,
    num radius,
    num slices,
    num rings,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCapsule(startPos, endPos, radius, slices, rings, color),
    () => _flat.DrawCapsule(
      startPos,
      endPos,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      color,
    ),
  );
    
  /// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  void DrawCapsuleWires(
    Vector3 startPos,
    Vector3 endPos,
    num radius,
    num slices,
    num rings,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color),
    () => _flat.DrawCapsuleWires(
      startPos,
      endPos,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      color,
    ),
  );
    
  /// Draw a plane XZ
  void DrawPlane(
    Vector3 centerPos,
    Vector2 size,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawPlane(centerPos, size, color),
    () => _flat.DrawPlane(
      centerPos,
      size,
      color,
    ),
  );
    
  /// Draw a ray line
  void DrawRay(
    Ray ray,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawRay(ray, color),
    () => _flat.DrawRay(
      ray,
      color,
    ),
  );
    
  /// Draw a grid (centered at (0, 0, 0))
  void DrawGrid(
    num slices,
    num spacing,
  ) => debugRun(
    () => _debugLabels.DrawGrid(slices, spacing),
    () => _flat.DrawGrid(
      slices.toInt(),
      spacing.toDouble(),
    ),
  );
    
  /// Load model from files (meshes and materials)
  Model LoadModel(
    String fileName,
  ) => debugRun(
    () => _debugLabels.LoadModel(fileName),
    () => _flat.LoadModel(
      String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load model from generated mesh (default material)
  Model LoadModelFromMesh(
    Mesh mesh,
  ) => debugRun(
    () => _debugLabels.LoadModelFromMesh(mesh),
    () => _flat.LoadModelFromMesh(
      mesh,
    ),
  );
    
  /// Check if a model is valid (loaded in GPU, VAO/VBOs)
  bool IsModelValid(
    Model model,
  ) => debugRun(
    () => _debugLabels.IsModelValid(model),
    () => _flat.IsModelValid(
      model,
    ),
  );
    
  /// Unload model (including meshes) from memory (RAM and/or VRAM)
  void UnloadModel(
    Model model,
  ) => debugRun(
    () => _debugLabels.UnloadModel(model),
    () => _flat.UnloadModel(
      model,
    ),
  );
    
  /// Compute model bounding box limits (considers all meshes)
  BoundingBox GetModelBoundingBox(
    Model model,
  ) => debugRun(
    () => _debugLabels.GetModelBoundingBox(model),
    () => _flat.GetModelBoundingBox(
      model,
    ),
  );
    
  /// Draw a model (with texture if set)
  void DrawModel(
    Model model,
    Vector3 position,
    num scale,
    Color tint
  ) => debugRun(
    () => _debugLabels.DrawModel(model, position, scale, tint),
    () => _flat.DrawModel(
      model,
      position,
      scale.toDouble(),
      tint,
    ),
  );
    
  /// Draw a model with extended parameters
  void DrawModelEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    num rotationAngle,
    Vector3 scale,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint),
    () => _flat.DrawModelEx(
      model,
      position,
      rotationAxis,
      rotationAngle.toDouble(),
      scale,
      tint,
    ),
  );
    
  /// Draw a model wires (with texture if set)
  void DrawModelWires(
    Model model,
    Vector3 position,
    num scale,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawModelWires(model, position, scale, tint),
    () => _flat.DrawModelWires(
      model,
      position,
      scale.toDouble(),
      tint,
    ),
  );
    
  /// Draw a model wires (with texture if set) with extended parameters
  void DrawModelWiresEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    num rotationAngle,
    Vector3 scale,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint),
    () => _flat.DrawModelWiresEx(
      model,
      position,
      rotationAxis,
      rotationAngle.toDouble(),
      scale,
      tint,
    ),
  );
    
  /// Draw bounding box (wires)
  void DrawBoundingBox(
    BoundingBox box,
    Color color,
  ) => debugRun(
    () => _debugLabels.DrawBoundingBox(box, color),
    () => _flat.DrawBoundingBox(
      box,
      color,
    ),
  );

  /// Draw a billboard texture
  void DrawBillboard(
    Camera3D camera,
    Texture texture,
    Vector3 position,
    num scale,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawBillboard(camera, texture, position, scale, tint),
    () => _flat.DrawBillboard(
      camera,
      texture,
      position,
      scale.toDouble(),
      tint,
    ),
  );

  /// Draw a billboard texture defined by source
  void DrawBillboardRec(
    Camera3D camera,
    Texture texture,
    Rectangle source,
    Vector3 position,
    Vector2 size,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawBillboardRec(camera, texture, source, position, size, tint),
    () => _flat.DrawBillboardRec(
      camera,
      texture,
      source,
      position,
      size,
      tint,
    ),
  );

  /// Draw a billboard texture defined by source and rotation
  @Deprecated(
    "Broken by a dart:ffi bug: the trailing Color argument gets corrupted "
    "(or crashes) once the preceding float-only args exceed the CPU's 8 "
    "float registers. Use DrawBillboard/DrawBillboardRec, or wait for the fix. "
    "See dart-lang/sdk#63976."
  )
  void DrawBillboardPro(
    Camera3D camera,
    Texture texture,
    Rectangle source,
    Vector3 position,
    Vector3 up,
    Vector2 size,
    Vector2 origin,
    num rotation,
    Color tint,
  ) => debugRun(
    () => _debugLabels.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint),
    () => _flat.DrawBillboardPro(
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
  
  /// Upload mesh vertex data in GPU and provide VAO/VBO ids
  void UploadMesh(
    Mesh mesh,
    bool dynamic,
  ) => debugRun(
    () => _debugLabels.UploadMesh(mesh, dynamic),
    () => _flat.UploadMesh(
      Mesh$.Ref1(mesh),
      dynamic,
    ),
  );
    
  /// Update mesh vertex data in GPU for a specific buffer index
  void UpdateMeshBuffer(
    Mesh mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => debugRun(
    () => _debugLabels.UpdateMeshBuffer(mesh, index, data, offset),
    () => _flat.UpdateMeshBuffer(
      mesh,
      index.toInt(),
      TypedDataList$.Array(data),
      data.length,
      offset.toInt(),
    ),
  );
    
  /// Unload mesh data from CPU and GPU
  void UnloadMesh(
    Mesh mesh,
  ) => debugRun(
    () => _debugLabels.UnloadMesh(mesh),
    () => _flat.UnloadMesh(
      mesh,
    ),
  );
    
  /// Draw a 3d mesh with material and transform
  void DrawMesh(
    Mesh mesh,
    Material material,
    Matrix transform,
  ) => debugRun(
    () => _debugLabels.DrawMesh(mesh, material, transform),
    () => _flat.DrawMesh(
      mesh,
      material,
      transform,
    ),
  );
    
  /// Draw multiple mesh instances with material and different transforms
  void DrawMeshInstanced(
    Mesh mesh,
    Material material,
    List<Matrix> transforms,
  ) => debugRun(
    () => _debugLabels.DrawMeshInstanced(mesh, material, transforms),
    () => _flat.DrawMeshInstanced(
      mesh,
      material,
      Matrix$.Array(transforms),
      transforms.length,
    ),
  );
    
  /// Compute mesh bounding box limits
  BoundingBox GetMeshBoundingBox(
    Mesh mesh,
  ) => debugRun(
    () => _debugLabels.GetMeshBoundingBox(mesh),
    () => _flat.GetMeshBoundingBox(
      mesh,
    ),
  );
    
  /// Compute mesh tangents
  void GenMeshTangents(
    Mesh mesh,
  ) => debugRun(
    () => _debugLabels.GenMeshTangents(mesh),
    () => _flat.GenMeshTangents(
      Mesh$.Ref1(mesh),
    ),
  );
    
  /// Export mesh data to file, returns true on success
  bool ExportMesh(
    Mesh mesh,
    String fileName,
  ) => debugRun(
    () => _debugLabels.ExportMesh(mesh, fileName),
    () => _flat.ExportMesh(
      mesh,
      String$.ValueOrNull(fileName),
    ),
  );
    
  /// Export mesh as code file (.h) defining multiple arrays of vertex attributes
  bool ExportMeshAsCode(
    Mesh mesh,
    String fileName,
  ) => debugRun(
    () => _debugLabels.ExportMeshAsCode(mesh, fileName),
    () => _flat.ExportMeshAsCode(
      mesh,
      String$.ValueOrNull(fileName),
    ),
  );
    
  /// Generate polygonal mesh
  Mesh GenMeshPoly(
    num sides,
    num radius,
  ) => debugRun(
    () => _debugLabels.GenMeshPoly(sides, radius),
    () => _flat.GenMeshPoly(
      sides.toInt(),
      radius.toDouble(),
    ),
  );
    
  /// Generate plane mesh (with subdivisions)
  Mesh GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => debugRun(
    () => _debugLabels.GenMeshPlane(width, length, resX, resZ),
    () => _flat.GenMeshPlane(
      width.toDouble(),
      length.toDouble(),
      resX.toInt(),
      resZ.toInt(),
    ),
  );
    
  /// Generate cuboid mesh
  Mesh GenMeshCube(
    num width,
    num height,
    num length,
  ) => debugRun(
    () => _debugLabels.GenMeshCube(width, height, length),
    () => _flat.GenMeshCube(
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
    ),
  );
    
  /// Generate sphere mesh (standard sphere)
  Mesh GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => debugRun(
    () => _debugLabels.GenMeshSphere(radius, rings, slices),
    () => _flat.GenMeshSphere(
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
    ),
  );
    
  /// Generate half-sphere mesh (no bottom cap)
  Mesh GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => debugRun(
    () => _debugLabels.GenMeshHemiSphere(radius, rings, slices),
    () => _flat.GenMeshHemiSphere(
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
    ),
  );
    
  /// Generate cylinder mesh
  Mesh GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => debugRun(
    () => _debugLabels.GenMeshCylinder(radius, height, slices),
    () => _flat.GenMeshCylinder(
      radius.toDouble(),
      height.toDouble(),
      slices.toInt(),
    ),
  );
    
  /// Generate cone/pyramid mesh
  Mesh GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => debugRun(
    () => _debugLabels.GenMeshCone(radius, height, slices),
    () => _flat.GenMeshCone(
      radius.toDouble(),
      height.toDouble(),
      slices.toInt(),
    ),
  );
    
  /// Generate torus mesh
  Mesh GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => debugRun(
    () => _debugLabels.GenMeshTorus(radius, size, radSeg, sides),
    () => _flat.GenMeshTorus(
      radius.toDouble(),
      size.toDouble(),
      radSeg.toInt(),
      sides.toInt(),
    ),
  );
    
  /// Generate trefoil knot mesh
  Mesh GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => debugRun(
    () => _debugLabels.GenMeshKnot(radius, size, radSeg, sides),
    () => _flat.GenMeshKnot(
      radius.toDouble(),
      size.toDouble(),
      radSeg.toInt(),
      sides.toInt(),
    ),
  );
    
  /// Generate heightmap mesh from image data
  Mesh GenMeshHeightmap(
    Image heightmap,
    Vector3 size,
  ) => debugRun(
    () => _debugLabels.GenMeshHeightmap(heightmap, size),
    () => _flat.GenMeshHeightmap(
      heightmap,
      size,
    ),
  );
    
  /// Generate cubes-based map mesh from image data
  Mesh GenMeshCubicmap(
    Image cubicmap,
    Vector3 cubeSize,
  ) => debugRun(
    () => _debugLabels.GenMeshCubicmap(cubicmap, cubeSize),
    () => _flat.GenMeshCubicmap(
      cubicmap,
      cubeSize,
    ),
  );
    
  /// Load materials from model file
  List<Material> LoadMaterials(
    String fileName,
  ) => debugRun(
    () => _debugLabels.LoadMaterials(fileName),
    () {
      final materialCount = Int$.Ref1();
      final materials = _flat.LoadMaterials(
        String$.ValueOrNull(fileName),
        materialCount,
      );
      return materials.readArray(materialCount.value);
    },
  );
    
  /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  Material LoadMaterialDefault() => debugRun(
    () => _debugLabels.LoadMaterialDefault(),
    () => _flat.LoadMaterialDefault(),
  );
    
  /// Check if a material is valid (shader assigned, map textures loaded in GPU)
  bool IsMaterialValid(
    Material material,
  ) => debugRun(
    () => _debugLabels.IsMaterialValid(material),
    () => _flat.IsMaterialValid(
      material,
    ),
  );
    
  /// Unload material from GPU memory (VRAM)
  void UnloadMaterial(
    Material material,
  ) => debugRun(
    () => _debugLabels.UnloadMaterial(material),
    () => _flat.UnloadMaterial(
      material,
    ),
  );
    
  /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
  void SetMaterialTexture(
    Material material,
    MaterialMapIndex mapType,
    Texture texture,
  ) => debugRun(
    () => _debugLabels.SetMaterialTexture(material, mapType, texture),
    () => material.maps[mapType.value].texture = texture,
  );
    
  /// Set material for a mesh
  void SetModelMeshMaterial(
    Model model,
    num meshId,
    num materialId,
  ) => debugRun(
    () => _debugLabels.SetModelMeshMaterial(model, meshId, materialId),
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
    
  /// Load model animations from file
  List<ModelAnimation> LoadModelAnimations(
    String fileName,
  ) => debugRun(
    () => _debugLabels.LoadModelAnimations(fileName),
    () {
      final animCount = Int$.Ref1();
      final anims = _flat.LoadModelAnimations(
        String$.ValueOrNull(fileName),
        animCount,
      );
      return anims.readArray(animCount.value);
    },
  );
    
  /// Update model animation pose (CPU)
  void UpdateModelAnimation(
    Model model,
    ModelAnimation anim,
    num frame,
  ) => debugRun(
    () => _debugLabels.UpdateModelAnimation(model, anim, frame),
    () => _flat.UpdateModelAnimation(
      model,
      anim,
      frame.toDouble(),
    ),
  );
    
  /// Update model animation data (vertex buffers / bone matrices) for a specific pose,
  /// defined by two different animations at specific frames blended together
  void UpdateModelAnimationEx(
    Model model,
    ModelAnimation animA,
    num frameA,
    ModelAnimation animB,
    num frameB,
    num blend,
  ) => debugRun(
    () => _debugLabels.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend),
    () => _flat.UpdateModelAnimationEx(
      model,
      animA,
      frameA.toDouble(),
      animB,
      frameB.toDouble(),
      blend.toDouble(),
    ),
  );
    
  /// Unload animation array data
  void UnloadModelAnimations(
    List<ModelAnimation> animations,
  ) => debugRun(
    () => _debugLabels.UnloadModelAnimations(animations),
    () => _flat.UnloadModelAnimations(
      animations.first.getOp(),
      animations.length,
    ),
  );
    
  /// Check model animation skeleton match
  bool IsModelAnimationValid(
    Model model,
    ModelAnimation anim,
  ) => debugRun(
    () => _debugLabels.IsModelAnimationValid(model, anim),
    () => _flat.IsModelAnimationValid(
      model,
      anim,
    ),
  );
    
  /// Check collision between two spheres
  bool CheckCollisionSpheres(
    Vector3 center1,
    num radius1,
    Vector3 center2,
    num radius2,
  ) => debugRun(
    () => _debugLabels.CheckCollisionSpheres(center1, radius1, center2, radius2),
    () => _flat.CheckCollisionSpheres(
      center1,
      radius1.toDouble(),
      center2,
      radius2.toDouble(),
    ),
  );
    
  /// Check collision between two bounding boxes
  bool CheckCollisionBoxes(
    BoundingBox box1,
    BoundingBox box2,
  ) => debugRun(
    () => _debugLabels.CheckCollisionBoxes(box1, box2),
    () => _flat.CheckCollisionBoxes(
      box1,
      box2,
    ),
  );
    
  /// Check collision between box and sphere
  bool CheckCollisionBoxSphere(
    BoundingBox box,
    Vector3 center,
    num radius,
  ) => debugRun(
    () => _debugLabels.CheckCollisionBoxSphere(box, center, radius),
    () => _flat.CheckCollisionBoxSphere(
      box,
      center,
      radius.toDouble(),
    ),
  );
    
  /// Get collision info between ray and sphere
  RayCollision GetRayCollisionSphere(
    Ray ray,
    Vector3 center,
    num radius,
  ) => debugRun(
    () => _debugLabels.GetRayCollisionSphere(ray, center, radius),
    () => _flat.GetRayCollisionSphere(
      ray,
      center,
      radius.toDouble(),
    ),
  );
    
  /// Get collision info between ray and box
  RayCollision GetRayCollisionBox(
    Ray ray,
    BoundingBox box,
  ) => debugRun(
    () => _debugLabels.GetRayCollisionBox(ray, box),
    () => _flat.GetRayCollisionBox(
      ray,
      box,
    ),
  );
    
  /// Get collision info between ray and mesh
  RayCollision GetRayCollisionMesh(
    Ray ray,
    Mesh mesh,
    Matrix transform,
  ) => debugRun(
    () => _debugLabels.GetRayCollisionMesh(ray, mesh, transform),
    () => _flat.GetRayCollisionMesh(
      ray,
      mesh,
      transform,
    ),
  );
    
  /// Get collision info between ray and triangle
  RayCollision GetRayCollisionTriangle(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
  ) => debugRun(
    () => _debugLabels.GetRayCollisionTriangle(ray, p1, p2, p3),
    () => _flat.GetRayCollisionTriangle(
      ray,
      p1,
      p2,
      p3,
    ),
  );
    
  /// Get collision info between ray and quad
  RayCollision GetRayCollisionQuad(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
    Vector3 p4,
  ) => debugRun(
    () => _debugLabels.GetRayCollisionQuad(ray, p1, p2, p3, p4),
    () => _flat.GetRayCollisionQuad(
      ray,
      p1,
      p2,
      p3,
      p4,
    ),
  );
}
