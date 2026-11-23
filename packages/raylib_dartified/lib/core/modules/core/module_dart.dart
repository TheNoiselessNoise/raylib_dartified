part of '../../raylib_dartified.dart';

/// Backend-agnostic Raylib Core module.
final class RaylibCoreDart extends XPackageModule<Raylib> {

  RaylibCoreDart(super.pkg);

  RaylibCoreFlat get _flat => pkg.module();

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
  ) => _flat.InitWindow(
    width.toInt(),
    height.toInt(),
    String$.ValueOrNull(title),
  );

  /// Close window and unload OpenGL context
  void CloseWindow() => _flat.CloseWindow();

  /// Check if application should close ([KeyboardKey.KEY_ESCAPE] pressed or windows close icon clicked)
  bool WindowShouldClose() => _flat.WindowShouldClose();

  /// Check if window has been initialized successfully
  bool IsWindowReady() => _flat.IsWindowReady();

  /// Check if window is currently fullscreen
  bool IsWindowFullscreen() => _flat.IsWindowFullscreen();

  /// Check if window is currently hidden
  bool IsWindowHidden() => _flat.IsWindowHidden();
    
  /// Check if window is currently minimized
  bool IsWindowMinimized() => _flat.IsWindowMinimized();
    
  /// Check if window is currently maximized
  bool IsWindowMaximized() => _flat.IsWindowMaximized();
    
  /// Check if window is currently focused
  bool IsWindowFocused() => _flat.IsWindowFocused();
    
  /// Check if window has been resized last frame
  bool IsWindowResized() => _flat.IsWindowResized();
    
  /// Check if one specific window flag is enabled
  bool IsWindowState(
    ConfigFlags flag,
  ) => _flat.IsWindowState(
    flag.value,
  );
    
  /// Set window configuration state using flags
  void SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => _flat.SetWindowState(
    XEnumUtils.FlagsOr(flags),
  );
    
  /// Clear window configuration state flags
  void ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => _flat.ClearWindowState(
    XEnumUtils.FlagsOr(flags),
  );
    
  /// Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
  void ToggleFullscreen() => _flat.ToggleFullscreen();
    
  /// Toggle window state: borderless windowed, resizes window to match monitor resolution
  void ToggleBorderlessWindowed() => _flat.ToggleBorderlessWindowed();
    
  /// Set window state: maximized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MaximizeWindow() => _flat.MaximizeWindow();
    
  /// Set window state: minimized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MinimizeWindow() => _flat.MinimizeWindow();
    
  /// Set window state: not minimized/maximized
  void RestoreWindow() => _flat.RestoreWindow();
    
  /// Set icon for window (single image, RGBA 32bit)
  void SetWindowIcon(
    Image image,
  ) => _flat.SetWindowIcon(
    image,
  );
    
  /// Set icon for window (multiple images, RGBA 32bit)
  void SetWindowIcons(
    List<Image> images,
  ) => _flat.SetWindowIcons(
    Image$.Array(images),
    images.length,
  );
    
  /// Set title for window
  void SetWindowTitle(
    String title,
  ) => _flat.SetWindowTitle(
    String$.ValueOrNull(title),
  );

  /// Set window position on screen
  void SetWindowPosition(
    num x,
    num y,
  ) => _flat.SetWindowPosition(
    x.toInt(),
    y.toInt(),
  );
    
  /// Set monitor for the current window
  void SetWindowMonitor(
    num monitor,
  ) => _flat.SetWindowMonitor(
    monitor.toInt(),
  );
    
  /// Set window minimum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMinSize(
    num width,
    num height,
  ) => _flat.SetWindowMinSize(
    width.toInt(),
    height.toInt(),
  );

  /// Set window maximum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMaxSize(
    num width,
    num height,
  ) => _flat.SetWindowMaxSize(
    width.toInt(),
    height.toInt(),
  );
    
  /// Set window dimensions
  void SetWindowSize(
    num width,
    num height,
  ) => _flat.SetWindowSize(
    width.toInt(),
    height.toInt(),
  );

  /// Set window opacity [0.0..1.0]
  void SetWindowOpacity(
    num opacity,
  ) => _flat.SetWindowOpacity(
    opacity.toDouble(),
  );
    
  /// Set window focused
  void SetWindowFocused() => _flat.SetWindowFocused();

  /// Get current screen width
  int GetScreenWidth() => _flat.GetScreenWidth();
    
  /// Get current screen height
  int GetScreenHeight() => _flat.GetScreenHeight();
    
  /// Get current render width (it considers HiDPI)
  int GetRenderWidth() => _flat.GetRenderWidth();
    
  /// Get current render height (it considers HiDPI)
  int GetRenderHeight() => _flat.GetRenderHeight();
    
  /// Get number of connected monitors
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorCount() => _flat.GetMonitorCount();
    
  /// Get current monitor where window is placed
  /// 
  /// **[!] Not implemented on WASM**
  int GetCurrentMonitor() => _flat.GetCurrentMonitor();
    
  /// Get specified monitor position
  /// 
  /// **[!] Not implemented on WASM**
  Vector2 GetMonitorPosition(
    num monitor,
  ) => _flat.GetMonitorPosition(
    monitor.toInt(),
  );
    
  /// Get specified monitor width (current video mode used by monitor)
  int GetMonitorWidth(
    num monitor,
  ) => _flat.GetMonitorWidth(
    monitor.toInt(),
  );
    
  /// Get specified monitor height (current video mode used by monitor)
  int GetMonitorHeight(
    num monitor,
  ) => _flat.GetMonitorHeight(
    monitor.toInt(),
  );
    
  /// Get specified monitor physical width in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalWidth(
    num monitor,
  ) => _flat.GetMonitorPhysicalWidth(
    monitor.toInt(),
  );
    
  /// Get specified monitor physical height in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalHeight(
    num monitor,
  ) => _flat.GetMonitorPhysicalHeight(
    monitor.toInt(),
  );
    
  /// Get specified monitor refresh rate
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorRefreshRate(
    num monitor,
  ) => _flat.GetMonitorRefreshRate(
    monitor.toInt(),
  );
    
  /// Get window position XY on monitor
  Vector2 GetWindowPosition() => _flat.GetWindowPosition();
    
  /// Get window scale DPI factor
  Vector2 GetWindowScaleDPI() => _flat.GetWindowScaleDPI();
    
  /// Get the human-readable, UTF-8 encoded name of the specified monitor
  /// 
  /// **[!] Not implemented on WASM**
  String GetMonitorName(
    num monitor,
  ) => _flat.GetMonitorName(
    monitor.toInt(),
  ).toDartString();
    
  /// Set clipboard text content
  void SetClipboardText(
    String text,
  ) => _flat.SetClipboardText(
    String$.ValueOrNull(text),
  );
    
  /// Get clipboard text content
  String GetClipboardText() => _flat.GetClipboardText().toDartString();
    
  /// Get clipboard image content
  Image GetClipboardImage() => _flat.GetClipboardImage();
    
  /// Enable waiting for events on EndDrawing(), no automatic event polling
  void EnableEventWaiting() => _flat.EnableEventWaiting();
    
  /// Disable waiting for events on EndDrawing(), automatic events polling
  void DisableEventWaiting() => _flat.DisableEventWaiting();
    
  /// Shows cursor
  void ShowCursor() => _flat.ShowCursor();
    
  /// Hides cursor
  void HideCursor() => _flat.HideCursor();
    
  /// Check if cursor is not visible
  bool IsCursorHidden() => _flat.IsCursorHidden();
    
  /// Enables cursor (unlock cursor)
  void EnableCursor() => _flat.EnableCursor();
    
  /// Disables cursor (lock cursor)
  void DisableCursor() => _flat.DisableCursor();
    
  /// Check if cursor is on the screen
  bool IsCursorOnScreen() => _flat.IsCursorOnScreen();
    
  /// Set background color (framebuffer clear color)
  void ClearBackground(
    Color color,
  ) => _flat.ClearBackground(
    color,
  );
    
  /// Setup canvas (framebuffer) to start drawing
  void BeginDrawing() => _flat.BeginDrawing();
    
  /// End canvas drawing and swap buffers (double buffering)
  void EndDrawing() => _flat.EndDrawing();
    
  /// Begin 2D mode with custom camera (2D)
  void BeginMode2D(
    Camera2D camera,
  ) => _flat.BeginMode2D(
    camera,
  );
    
  /// Ends 2D mode with custom camera
  void EndMode2D() => _flat.EndMode2D();
    
  /// Begin 3D mode with custom camera (3D)
  void BeginMode3D(
    Camera3D camera,
  ) => _flat.BeginMode3D(
    camera,
  );
    
  /// Ends 3D mode and returns to default 2D orthographic mode
  void EndMode3D() => _flat.EndMode3D();
    
  /// Begin drawing to render texture
  void BeginTextureMode(
    RenderTexture target,
  ) => _flat.BeginTextureMode(
    target,
  );
    
  /// Ends drawing to render texture
  void EndTextureMode() => _flat.EndTextureMode();
    
  /// Begin custom shader drawing
  void BeginShaderMode(
    Shader shader,
  ) => _flat.BeginShaderMode(
    shader,
  );
    
  /// End custom shader drawing (use default shader)
  void EndShaderMode() => _flat.EndShaderMode();
    
  /// Begin blending mode (alpha, additive, multiplied, subtract, custom)
  void BeginBlendMode(
    BlendMode mode,
  ) => _flat.BeginBlendMode(
    mode.value,
  );
    
  /// End blending mode (reset to default: alpha blending)
  void EndBlendMode() => _flat.EndBlendMode();
    
  /// Begin scissor mode (define screen area for following drawing)
  void BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => _flat.BeginScissorMode(
    x.toInt(),
    y.toInt(),
    width.toInt(),
    height.toInt(),
  );
    
  /// End scissor mode
  void EndScissorMode() => _flat.EndScissorMode();
    
  /// Begin stereo rendering (requires VR simulator)
  void BeginVrStereoMode(
    VrStereoConfig config,
  ) => _flat.BeginVrStereoMode(
    config,
  );
    
  /// End stereo rendering (requires VR simulator)
  void EndVrStereoMode() => _flat.EndVrStereoMode();
    
  /// Load VR stereo config for VR simulator device parameters
  VrStereoConfig LoadVrStereoConfig(
    VrDeviceInfo device,
  ) => _flat.LoadVrStereoConfig(
    device,
  );
    
  /// Unload VR stereo config
  void UnloadVrStereoConfig(
    VrStereoConfig config,
  ) => _flat.UnloadVrStereoConfig(
    config,
  );
    
  /// Load shader from files and bind default locations
  Shader LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => _flat.LoadShader(
    String$.ValueOrNull(vsFileName),
    String$.ValueOrNull(fsFileName),
  );
    
  /// Load shader from code strings and bind default locations
  Shader LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => _flat.LoadShaderFromMemory(
    String$.ValueOrNull(vsCode),
    String$.ValueOrNull(fsCode),
  );
    
  /// Check if a shader is valid (loaded on GPU)
  bool IsShaderValid(
    Shader shader,
  ) => _flat.IsShaderValid(
    shader,
  );
    
  /// Get shader uniform location
  int GetShaderLocation(
    Shader shader,
    String uniformName,
  ) => _flat.GetShaderLocation(
    shader,
    String$.ValueOrNull(uniformName),
  );
    
  /// Get shader attribute location
  int GetShaderLocationAttrib(
    Shader shader,
    String attribName,
  ) => _flat.GetShaderLocationAttrib(
    shader,
    String$.ValueOrNull(attribName),
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
  ) {
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
  }
    
  /// Set shader uniform value (matrix 4x4)
  void SetShaderValueMatrix(
    Shader shader,
    num locIndex,
    Matrix mat,
  ) => _flat.SetShaderValueMatrix(
    shader,
    locIndex.toInt(),
    mat,
  );
    
  /// Set shader uniform value for texture (sampler2d)
  void SetShaderValueTexture(
    Shader shader,
    num locIndex,
    Texture texture,
  ) => _flat.SetShaderValueTexture(
    shader,
    locIndex.toInt(),
    texture,
  );
    
  /// Unload shader from GPU memory (VRAM)
  void UnloadShader(
    Shader shader,
  ) => _flat.UnloadShader(
    shader,
  );
    
  /// Get a ray trace from screen position (i.e mouse)
  Ray GetScreenToWorldRay(
    Vector2 position,
    Camera3D camera,
  ) => _flat.GetScreenToWorldRay(
    position,
    camera,
  );
    
  /// Get a ray trace from screen position (i.e mouse) in a viewport
  Ray GetScreenToWorldRayEx(
    Vector2 position,
    Camera3D camera,
    num width,
    num height,
  ) => _flat.GetScreenToWorldRayEx(
    position,
    camera,
    width.toInt(),
    height.toInt(),
  );

  /// Get the screen space position for a 3d world space position
  Vector2 GetWorldToScreen(
    Vector3 position,
    Camera3D camera,
  ) => _flat.GetWorldToScreen(
    position,
    camera,
  );

  /// Get size position for a 3d world space position
  Vector2 GetWorldToScreenEx(
    Vector3 position,
    Camera3D camera,
    num width,
    num height,
  ) => _flat.GetWorldToScreenEx(
    position,
    camera,
    width.toInt(),
    height.toInt(),
  );

  /// Get the screen space position for a 2d camera world space position
  Vector2 GetWorldToScreen2D(
    Vector2 position,
    Camera2D camera,
  ) => _flat.GetWorldToScreen2D(
    position,
    camera,
  );

  /// Get the world space position for a 2d camera screen space position
  Vector2 GetScreenToWorld2D(
    Vector2 position,
    Camera2D camera,
  ) => _flat.GetScreenToWorld2D(
    position,
    camera,
  );

  /// Get camera transform matrix (view matrix)
  Matrix GetCameraMatrix(
    Camera3D camera,
  ) => _flat.GetCameraMatrix(
    camera,
  );

  /// Get camera 2d transform matrix
  Matrix GetCameraMatrix2D(
    Camera2D camera,
  ) => _flat.GetCameraMatrix2D(
    camera,
  );
    
  /// Set target FPS (maximum)
  void SetTargetFPS(
    num fps,
  ) => _flat.SetTargetFPS(
    fps.toInt(),
  );

  /// Get time in seconds for last frame drawn (delta time)
  double GetFrameTime() => _flat.GetFrameTime();

  /// Get elapsed time in seconds since InitWindow()
  double GetTime() => _flat.GetTime();

  /// Get current FPS
  int GetFPS() => _flat.GetFPS();

  /// Swap back buffer with front buffer (screen drawing)
  void SwapScreenBuffer() => _flat.SwapScreenBuffer();

  /// Register all input events
  void PollInputEvents() => _flat.PollInputEvents();

  /// Wait for some time (halt program execution)
  void WaitTime(
    num seconds,
  ) => _flat.WaitTime(
    seconds.toDouble(),
  );

  /// Set the seed for the random number generator
  void SetRandomSeed(
    num seed,
  ) => _flat.SetRandomSeed(
    seed.toInt(),
  );

  /// Get a random value between min and max (both included)
  int GetRandomValue(
    num min,
    num max,
  ) => _flat.GetRandomValue(
    min.toInt(),
    max.toInt(),
  );

  /// Load random values sequence, no values repeated, min and max included
  List<int> LoadRandomSequence(
    num count,
    num min,
    num max,
  ) {
    final seq = _flat.LoadRandomSequence(
      count.toInt(),
      min.toInt(),
      max.toInt(),
    );
    final List<int> values = .generate(count.toInt(), (i) => seq[i]);
    _flat.UnloadRandomSequence(seq);
    return values;
  }
  
  /// Takes a screenshot of current screen (filename extension defines format)
  void TakeScreenshot(
    String fileName,
  ) => _flat.TakeScreenshot(
    String$.ValueOrNull(fileName),
  );

  /// Setup init configuration flags (view [ConfigFlags])
  void SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => _flat.SetConfigFlags(
    XEnumUtils.FlagsOr(flags),
  );

  /// Open URL with default system browser (if available)
  void OpenURL(
    String url,
  ) => _flat.OpenURL(
    String$.ValueOrNull(url),
  );

  /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
  void TraceLog(
    TraceLogLevel logLevel,
    String text, [
      List<Object?> args = const [],
    ]
  ) => _flat.TraceLog(
    logLevel.value,
    String$.ValueOrNull(
      XPrint.Format(text, args)
    ),
  );

  /// Set the current threshold (minimum) log level
  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => _flat.SetTraceLogLevel(
    logLevel.value,
  );

  /// Set custom trace log
  void SetTraceLogCallback(
    covariant TraceLogCallbackBase? callback,
  ) => _flat.SetTraceLogCallback(
    callback?.attach() ?? .nullptr(),
  );
    
  /// Set custom file binary data loader
  void SetLoadFileDataCallback(
    covariant LoadFileDataCallbackBase? callback,
  ) => _flat.SetLoadFileDataCallback(
    callback?.attach() ?? .nullptr(),
  );
    
  /// Set custom file binary data saver
  void SetSaveFileDataCallback(
    covariant SaveFileDataCallbackBase? callback,
  ) => _flat.SetSaveFileDataCallback(
    callback?.attach() ?? .nullptr(),
  );
    
  /// Set custom file text data loader
  void SetLoadFileTextCallback(
    covariant LoadFileTextCallbackBase? callback,
  ) => _flat.SetLoadFileTextCallback(
    callback?.attach() ?? .nullptr(),
  );
    
  /// Set custom file text data saver
  void SetSaveFileTextCallback(
    covariant SaveFileTextCallbackBase? callback,
  ) => _flat.SetSaveFileTextCallback(
    callback?.attach() ?? .nullptr(),
  );
    
  /// Load file data as byte array (read)
  Uint8List LoadFileData(
    String fileName,
  ) {
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
  }

  /// Save data to file from byte array (write), returns true on success
  bool SaveFileData(
    String fileName,
    Uint8List data,
  ) => _flat.SaveFileData(
    String$.ValueOrNull(fileName),
    Uint8$.Array(data).cast(),
    data.length,
  );

  /// Export data to code (.h), returns true on success
  bool ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => _flat.ExportDataAsCode(
    Uint8$.Array(data),
    data.length,
    String$.ValueOrNull(fileName),
  );

  /// Load text data from file (read)
  String LoadFileText(
    String fileName,
  ) {
    final text = _flat.LoadFileText(
      String$.ValueOrNull(fileName),
    );
    final fileText = text.toDartString();
    _flat.UnloadFileText(text);
    return fileText;
  }

  /// Save text data to file (write), returns true on success
  bool SaveFileText(
    String fileName,
    String text,
  ) => _flat.SaveFileText(
    String$.ValueOrNull(fileName),
    String$.ValueOrNull(text),
  );

  /// Rename file (if exists)
  int FileRename(
    String fileName,
    String fileRename,
  ) => _flat.FileRename(
    String$.ValueOrNull(fileName),
    String$.ValueOrNull(fileRename),
  );
  
  /// Remove file (if exists)
  int FileRemove(
    String fileName,
  ) => _flat.FileRemove(
    String$.ValueOrNull(fileName),
  );
  
  /// Copy file from one path to another, dstPath created if it doesn't exist
  int FileCopy(
    String srcPath,
    String dstPath,
  ) => _flat.FileCopy(
    String$.ValueOrNull(srcPath),
    String$.ValueOrNull(dstPath),
  );
  
  /// Move file from one directory to another, dstPath created if it doesn't exist
  int FileMove(
    String srcPath,
    String dstPath,
  ) => _flat.FileMove(
    String$.ValueOrNull(srcPath),
    String$.ValueOrNull(dstPath),
  );
  
  /// Replace text in an existing file
  int FileTextReplace(
    String fileName,
    String search,
    String replacement,
  ) => _flat.FileTextReplace(
    String$.ValueOrNull(fileName),
    String$.ValueOrNull(search),
    String$.ValueOrNull(replacement),
  );
  
  /// Find text in existing file
  int FileTextFindIndex(
    String fileName,
    String search,
  ) => _flat.FileTextFindIndex(
    String$.ValueOrNull(fileName),
    String$.ValueOrNull(search),
  );
    
  /// Check if file exists
  bool FileExists(
    String fileName,
  ) => _flat.FileExists(
    String$.ValueOrNull(fileName),
  );

  /// Check if a directory path exists
  bool DirectoryExists(
    String dirPath,
  ) => _flat.DirectoryExists(
    String$.ValueOrNull(dirPath),
  );

  /// Check file extension (including point: .png, .wav)
  bool IsFileExtension(
    String fileName,
    String ext,
  ) => _flat.IsFileExtension(
    String$.ValueOrNull(fileName),
    String$.ValueOrNull(ext),
  );

  /// Get file length in bytes
  int GetFileLength(
    String fileName,
  ) => _flat.GetFileLength(
    String$.ValueOrNull(fileName),
  );

  /// Get extension for a filename (includes dot: '.png')
  String GetFileExtension(
    String fileName,
  ) => _flat.GetFileExtension(
    String$.ValueOrNull(fileName),
  ).toDartString();

  /// Get filename for a path string
  String GetFileName(
    String filePath,
  ) => _flat.GetFileName(
    String$.ValueOrNull(filePath),
  ).toDartString();

  /// Get filename without extension
  String GetFileNameWithoutExt(
    String filePath,
  ) => _flat.GetFileNameWithoutExt(
    String$.ValueOrNull(filePath),
  ).toDartString();

  /// Get the file count in a directory
  int GetDirectoryFileCount(
    String dirPath, 
  ) => _flat.GetDirectoryFileCount(
    String$.ValueOrNull(dirPath),
  );
  
  /// Get the file count in a directory with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  int GetDirectoryFileCountEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => _flat.GetDirectoryFileCountEx(
    String$.ValueOrNull(basePath),
    String$.ValueOrNull(filter),
    scanSubdirs,
  );

  /// Get full path for a given fileName with path
  String GetDirectoryPath(
    String filePath,
  ) => _flat.GetDirectoryPath(
    String$.ValueOrNull(filePath),
  ).toDartString();

  /// Get previous directory path for a given path
  String GetPrevDirectoryPath(
    String dirPath,
  ) => _flat.GetPrevDirectoryPath(
    String$.ValueOrNull(dirPath),
  ).toDartString();

  /// Get current working directory
  String GetWorkingDirectory() => _flat.GetWorkingDirectory().toDartString();

  /// Get the directory of the running application
  String GetApplicationDirectory() => _flat.GetApplicationDirectory().toDartString();

  /// Create directories (including full path requested), returns 0 on success
  int MakeDirectory(
    String dirPath,
  ) => _flat.MakeDirectory(
    String$.ValueOrNull(dirPath),
  );

  /// Change working directory, return true on success
  bool ChangeDirectory(
    String dir,
  ) => _flat.ChangeDirectory(
    String$.ValueOrNull(dir),
  );

  /// Check if a given path is a file or a directory
  bool IsPathFile(
    String path,
  ) => _flat.IsPathFile(
    String$.ValueOrNull(path),
  );

  /// Check if fileName is valid for the platform/OS
  bool IsFileNameValid(
    String fileName,
  ) => _flat.IsFileNameValid(
    String$.ValueOrNull(fileName),
  );
    
  /// Load directory filepaths
  FilePathList LoadDirectoryFiles(
    String dirPath,
  ) => _flat.LoadDirectoryFiles(
    String$.ValueOrNull(dirPath),
  );
    
  /// Load directory filepaths with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  FilePathList LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => _flat.LoadDirectoryFilesEx(
    String$.ValueOrNull(basePath),
    String$.ValueOrNull(filter),
    scanSubdirs,
  );

  /// Unload filepaths
  void UnloadDirectoryFiles(
    FilePathList files,
  ) => _flat.UnloadDirectoryFiles(
    files,
  );
    
  /// Check if a file has been dropped into window
  bool IsFileDropped() => _flat.IsFileDropped();
    
  /// Load dropped filepaths
  FilePathList LoadDroppedFiles() => _flat.LoadDroppedFiles();

  /// Unload dropped filepaths
  void UnloadDroppedFiles(
    FilePathList files,
  ) => _flat.UnloadDroppedFiles(
    files,
  );

  /// Get file modification time (last write time)
  int GetFileModTime(
    String fileName,
  ) => _flat.GetFileModTime(
    String$.ValueOrNull(fileName),
  );

  /// Compress data (DEFLATE algorithm)
  Uint8List CompressData(
    Uint8List data,
  ) {
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
  }

  /// Decompress data (DEFLATE algorithm)
  Uint8List DecompressData(
    Uint8List compData,
  ) {
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
  }

  /// Encode data to Base64 string
  Uint8List EncodeDataBase64(
    Uint8List data,
  ) {
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
  }

  /// Decode Base64 string data
  Uint8List DecodeDataBase64(
    Uint8List data,
  ) {
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
  }

  /// Compute CRC32 hash code
  int ComputeCRC32(
    Uint8List data,
  ) => _flat.ComputeCRC32(
    Uint8$.Array(data),
    data.length,
  );

  /// Compute MD5 hash code
  Uint8List ComputeMD5(
    Uint8List data,
  ) => .fromList(UnsignedInt$.ToLEBytes(
    _flat.ComputeMD5(
      Uint8$.Array(data),
      data.length,
    ),
    4,
  ));

  /// Compute SHA1 hash code
  Uint8List ComputeSHA1(
    Uint8List data,
  ) => .fromList(UnsignedInt$.ToBEBytes(
    _flat.ComputeSHA1(
      Uint8$.Array(data),
      data.length,
    ),
    5,
  ));

  /// Compute SHA256 hash code
  Uint8List ComputeSHA256(
    Uint8List data,
  ) => .fromList(UnsignedInt$.ToBEBytes(
    _flat.ComputeSHA256(
      Uint8$.Array(data),
      data.length,
    ),
    8,
  ));
    
  /// Load automation events list from file, NULL for empty list
  AutomationEventList LoadAutomationEventList(
    String? fileName,
  ) => _flat.LoadAutomationEventList(
    String$.ValueOrNull(fileName),
  );
    
  /// Unload automation events list from file
  void UnloadAutomationEventList(
    AutomationEventList list,
  ) => _flat.UnloadAutomationEventList(
    list,
  );
    
  /// Export automation events list as text file
  bool ExportAutomationEventList(
    AutomationEventList list,
    String fileName,
  ) => _flat.ExportAutomationEventList(
    list,
    String$.ValueOrNull(fileName),
  );
    
  /// Set automation event list to record to
  void SetAutomationEventList(
    AutomationEventList list,
  ) => _flat.SetAutomationEventList(
    AutomationEventList$.Ref1(list),
  );
    
  /// Set automation event internal base frame to start recording
  void SetAutomationEventBaseFrame(
    int frame,
  ) => _flat.SetAutomationEventBaseFrame(
    frame,
  );
    
  /// Start recording automation events (AutomationEventList must be set)
  void StartAutomationEventRecording() => _flat.StartAutomationEventRecording();

  /// Stop recording automation events
  void StopAutomationEventRecording() => _flat.StopAutomationEventRecording();
    
  /// Play a recorded automation event
  void PlayAutomationEvent(
    AutomationEvent event,
  ) => _flat.PlayAutomationEvent(
    event,
  );

  /// Check if a key has been pressed once
  bool IsKeyPressed(
    KeyboardKey key,
  ) => _flat.IsKeyPressed(
    key.value,
  );

  /// Check if a key has been pressed again
  bool IsKeyPressedRepeat(
    KeyboardKey key,
  ) => _flat.IsKeyPressedRepeat(
    key.value,
  );

  /// Check if a key is being pressed
  bool IsKeyDown(
    KeyboardKey key,
  ) => _flat.IsKeyDown(
    key.value,
  );

  /// Check if a key has been released once
  bool IsKeyReleased(
    KeyboardKey key,
  ) => _flat.IsKeyReleased(
    key.value,
  );

  /// Check if a key is NOT being pressed
  bool IsKeyUp(
    KeyboardKey key,
  ) => _flat.IsKeyUp(
    key.value,
  );

  /// Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
  /// 
  /// **[!] Not implemented on WASM**
  String GetKeyName(
    KeyboardKey key,
  ) => _flat.GetKeyName(
    key.value,
  ).toDartString();

  /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
  int GetKeyPressed() => _flat.GetKeyPressed();

  /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
  int GetCharPressed() => _flat.GetCharPressed();

  /// Set a custom key to exit program (default is ESC)
  void SetExitKey(
    KeyboardKey key,
  ) => _flat.SetExitKey(
    key.value,
  );

  /// Check if a gamepad is available
  bool IsGamepadAvailable(
    num gamepad,
  ) => _flat.IsGamepadAvailable(
    gamepad.toInt(),
  );

  /// Get gamepad internal name id
  String GetGamepadName(
    num gamepad,
  ) => _flat.GetGamepadName(
    gamepad.toInt(),
  ).toDartString();

  /// Check if a gamepad button has been pressed once
  bool IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => _flat.IsGamepadButtonPressed(
    gamepad.toInt(),
    button.value,
  );

  /// Check if a gamepad button is being pressed
  bool IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => _flat.IsGamepadButtonDown(
    gamepad.toInt(),
    button.value,
  );

  /// Check if a gamepad button has been released once
  bool IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => _flat.IsGamepadButtonReleased(
    gamepad.toInt(),
    button.value,
  );

  /// Check if a gamepad button is NOT being pressed
  bool IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => _flat.IsGamepadButtonUp(
    gamepad.toInt(),
    button.value,
  );

  /// Get the last gamepad button pressed
  GamepadButton GetGamepadButtonPressed() => .fromValue(_flat.GetGamepadButtonPressed());

  /// Get gamepad axis count for a gamepad
  int GetGamepadAxisCount(
    num gamepad,
  ) => _flat.GetGamepadAxisCount(
    gamepad.toInt(),
  );

  /// Get axis movement value for a gamepad axis
  double GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => _flat.GetGamepadAxisMovement(
    gamepad.toInt(),
    axis.value,
  );

  /// Set internal gamepad mappings (SDL_GameControllerDB)
  int SetGamepadMappings(
    String mappings,
  ) => _flat.SetGamepadMappings(
    String$.ValueOrNull(mappings),
  );
    
  /// Set gamepad vibration for both motors (duration in seconds)
  void SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => _flat.SetGamepadVibration(
    gamepad.toInt(),
    leftMotor.toDouble(),
    rightMotor.toDouble(),
    duration.toDouble(),
  );

  /// Check if a mouse button has been pressed once
  bool IsMouseButtonPressed(
    MouseButton button,
  ) => _flat.IsMouseButtonPressed(
    button.value,
  );

  /// Check if a mouse button is being pressed
  bool IsMouseButtonDown(
    MouseButton button,
  ) => _flat.IsMouseButtonDown(
    button.value,
  );

  /// Check if a mouse button has been released once
  bool IsMouseButtonReleased(
    MouseButton button,
  ) => _flat.IsMouseButtonReleased(
    button.value,
  );

  /// Check if a mouse button is NOT being pressed
  bool IsMouseButtonUp(
    MouseButton button,
  ) => _flat.IsMouseButtonUp(
    button.value,
  );

  /// Get mouse position X
  int GetMouseX() => _flat.GetMouseX();

  /// Get mouse position Y
  int GetMouseY() => _flat.GetMouseY();

  /// Get mouse position XY
  Vector2 GetMousePosition() => _flat.GetMousePosition();

  /// Get mouse delta between frames
  Vector2 GetMouseDelta() => _flat.GetMouseDelta();

  /// Set mouse position XY
  void SetMousePosition(
    num x,
    num y,
  ) => _flat.SetMousePosition(
    x.toInt(),
    y.toInt(),
  );

  /// Set mouse offset
  void SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => _flat.SetMouseOffset(
    offsetX.toInt(),
    offsetY.toInt(),
  );

  /// Set mouse scaling
  void SetMouseScale(
    num scaleX,
    num scaleY,
  ) => _flat.SetMouseScale(
    scaleX.toDouble(),
    scaleY.toDouble(),
  );

  /// Get mouse wheel movement for X or Y, whichever is larger
  double GetMouseWheelMove() => _flat.GetMouseWheelMove();

  /// Get mouse wheel movement for both X and Y
  Vector2 GetMouseWheelMoveV() => _flat.GetMouseWheelMoveV();

  /// Set mouse cursor
  void SetMouseCursor(
    MouseCursor cursor,
  ) => _flat.SetMouseCursor(
    cursor.value,
  );

  /// Get touch position X for touch point 0 (relative to screen size)
  int GetTouchX() => _flat.GetTouchX();

  /// Get touch position Y for touch point 0 (relative to screen size)
  int GetTouchY() => _flat.GetTouchY();

  /// Get touch position XY for a touch point index (relative to screen size)
  Vector2 GetTouchPosition(
    num index,
  ) => _flat.GetTouchPosition(
    index.toInt(),
  );

  /// Get touch point identifier for given index
  int GetTouchPointId(
    num index,
  ) => _flat.GetTouchPointId(
    index.toInt(),
  );

  /// Get number of touch points
  int GetTouchPointCount() => _flat.GetTouchPointCount();

  /// Enable a set of gestures using flags [Gesture]
  void SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => _flat.SetGesturesEnabled(
    XEnumUtils.FlagsOr(flags),
  );

  /// Check if a gesture have been detected
  bool IsGestureDetected(
    Gesture key,
  ) => _flat.IsGestureDetected(
    key.value,
  );

  /// Get latest detected gesture
  Gesture GetGestureDetected() => .fromValue(_flat.GetGestureDetected());

  /// Get gesture hold time in seconds
  double GetGestureHoldDuration() => _flat.GetGestureHoldDuration();

  /// Get gesture drag vector
  Vector2 GetGestureDragVector() => _flat.GetGestureDragVector();

  /// Get gesture drag angle
  double GetGestureDragAngle() => _flat.GetGestureDragAngle();

  /// Get gesture pinch delta
  Vector2 GetGesturePinchVector() => _flat.GetGesturePinchVector();

  /// Get gesture pinch angle
  double GetGesturePinchAngle() => _flat.GetGesturePinchAngle();

  /// Process gesture event and translate it into gestures
  void ProcessGestureEvent(
    GestureEvent event,
  ) => _flat.ProcessGestureEvent(
    event,
  );
  
  /// Update gestures detected (must be called every frame)
  void UpdateGestures() => _flat.UpdateGestures();
    
  /// Update camera position for selected mode
  void UpdateCamera(
    Camera3D camera,
    CameraMode mode,
  ) => _flat.UpdateCamera(
    Camera3D$.RefUnique(camera),
    mode.value,
  );

  /// Update camera movement/rotation
  void UpdateCameraPro(
    Camera3D camera,
    Vector3 movement,
    Vector3 rotation,
    num zoom,
  ) => _flat.UpdateCameraPro(
    Camera3D$.Ref1(camera),
    movement,
    rotation,
    zoom.toDouble(),
  );

  /// Set texture and rectangle to be used on shapes drawing
  void SetShapesTexture(
    Texture texture,
    Rectangle source,
  ) => _flat.SetShapesTexture(
    texture,
    source,
  );

  /// Get texture that is used for shapes drawing
  Texture GetShapesTexture() => _flat.GetShapesTexture();

  /// Get texture source rectangle that is used for shapes drawing
  Rectangle GetShapesTextureRectangle() => _flat.GetShapesTextureRectangle();

  /// Draw a pixel using geometry [Can be slow, use with care]
  void DrawPixel(
    num posX,
    num posY,
    Color color,
  ) => _flat.DrawPixel(
    posX.toInt(),
    posY.toInt(),
    color,
  );

  /// Draw a pixel using geometry (Vector version) [Can be slow, use with care]
  void DrawPixelV(
    Vector2 position,
    Color color,
  ) => _flat.DrawPixelV(
    position,
    color,
  );
    
  /// Draw a line
  void DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    Color color,
  ) => _flat.DrawLine(
    startPosX.toInt(),
    startPosY.toInt(),
    endPosX.toInt(),
    endPosY.toInt(),
    color,
  );

  /// Draw a line (using gl lines)
  void DrawLineV(
    Vector2 startPos,
    Vector2 endPos,
    Color color,
  ) => _flat.DrawLineV(
    startPos,
    endPos,
    color,
  );

  /// Draw a line (using triangles/quads)
  void DrawLineEx(
    Vector2 startPos,
    Vector2 endPos,
    num thick,
    Color color,
  ) => _flat.DrawLineEx(
    startPos,
    endPos,
    thick.toDouble(),
    color,
  );

  /// Draw lines sequence (using gl lines)
  void DrawLineStrip(
    List<Vector2> points,
    Color color,
  ) => _flat.DrawLineStrip(
    Vector2$.Array(points),
    points.length,
    color,
  );

  /// Draw line segment cubic-bezier in-out interpolation
  void DrawLineBezier(
    Vector2 startPos,
    Vector2 endPos,
    num thick,
    Color color,
  ) => _flat.DrawLineBezier(
    startPos,
    endPos,
    thick.toDouble(),
    color,
  );

  /// Draw a dashed line
  void DrawLineDashed(
    Vector2 startPos,
    Vector2 endPos,
    num dashSize,
    num spaceSize,
    Color color,
  ) => _flat.DrawLineDashed(
    startPos,
    endPos,
    dashSize.toInt(),
    spaceSize.toInt(),
    color,
  );

  /// Draw a color-filled circle
  void DrawCircle(
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => _flat.DrawCircle(
    centerX.toInt(),
    centerY.toInt(),
    radius.toDouble(),
    color,
  );

  /// Draw a piece of a circle
  void DrawCircleSector(
    Vector2 center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => _flat.DrawCircleSector(
    center,
    radius.toDouble(),
    startAngle.toDouble(),
    endAngle.toDouble(),
    segments.toInt(),
    color,
  );

  /// Draw circle sector outline
  void DrawCircleSectorLines(
    Vector2 center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => _flat.DrawCircleSectorLines(
    center,
    radius.toDouble(),
    startAngle.toDouble(),
    endAngle.toDouble(),
    segments.toInt(),
    color,
  );

  /// Draw a gradient-filled circle
  void DrawCircleGradient(
    Vector2 center,
    num radius,
    Color inner,
    Color outer,
  ) => _flat.DrawCircleGradient(
    center,
    radius.toDouble(),
    inner,
    outer,
  );

  /// Draw a color-filled circle (Vector version)
  void DrawCircleV(
    Vector2 center,
    num radius,
    Color color,
  ) => _flat.DrawCircleV(
    center,
    radius.toDouble(),
    color,
  );

  /// Draw circle outline
  void DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => _flat.DrawCircleLines(
    centerX.toInt(),
    centerY.toInt(),
    radius.toDouble(),
    color,
  );

  /// Draw circle outline (Vector version)
  void DrawCircleLinesV(
    Vector2 center,
    num radius,
    Color color,
  ) => _flat.DrawCircleLinesV(
    center,
    radius.toDouble(),
    color,
  );
    
  /// Draw ellipse
  void DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    Color color,
  ) => _flat.DrawEllipse(
    centerX.toInt(),
    centerY.toInt(),
    radiusH.toDouble(),
    radiusV.toDouble(),
    color,
  );

  /// Draw ellipse (Vector version)
  void DrawEllipseV(
    Vector2 center,
    num radiusH,
    num radiusV,
    Color color,
  ) => _flat.DrawEllipseV(
    center,
    radiusH.toDouble(),
    radiusV.toDouble(),
    color,
  );

  /// Draw ellipse outline
  void DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    Color color,
  ) => _flat.DrawEllipseLines(
    centerX.toInt(),
    centerY.toInt(),
    radiusH.toDouble(),
    radiusV.toDouble(),
    color,
  );

  /// Draw ellipse outline (Vector version)
  void DrawEllipseLinesV(
    Vector2 center,
    num radiusH,
    num radiusV,
    Color color,
  ) => _flat.DrawEllipseLinesV(
    center,
    radiusH.toDouble(),
    radiusV.toDouble(),
    color,
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
  ) => _flat.DrawRing(
    center,
    innerRadius.toDouble(),
    outerRadius.toDouble(),
    startAngle.toDouble(),
    endAngle.toDouble(),
    segments.toInt(),
    color,
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
  ) => _flat.DrawRingLines(
    center,
    innerRadius.toDouble(),
    outerRadius.toDouble(),
    startAngle.toDouble(),
    endAngle.toDouble(),
    segments.toInt(),
    color,
  );

  /// Draw a color-filled rectangle
  void DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    Color color,
  ) => _flat.DrawRectangle(
    posX.toInt(),
    posY.toInt(),
    width.toInt(),
    height.toInt(),
    color,
  );

  /// Draw a color-filled rectangle (Vector version)
  void DrawRectangleV(
    Vector2 position,
    Vector2 size,
    Color color,
  ) => _flat.DrawRectangleV(
    position,
    size,
    color,
  );

  /// Draw a color-filled rectangle
  void DrawRectangleRec(
    Rectangle rec,
    Color color,
  ) => _flat.DrawRectangleRec(
    rec,
    color,
  );
    
  /// Draw a color-filled rectangle with pro parameters
  void DrawRectanglePro(
    Rectangle rec,
    Vector2 origin,
    num rotation,
    Color color,
  ) => _flat.DrawRectanglePro(
    rec,
    origin,
    rotation.toDouble(),
    color,
  );

  /// Draw a vertical-gradient-filled rectangle
  void DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    Color top,
    Color bottom,
  ) => _flat.DrawRectangleGradientV(
    posX.toInt(),
    posY.toInt(),
    width.toInt(),
    height.toInt(),
    top,
    bottom,
  );

  /// Draw a horizontal-gradient-filled rectangle
  void DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    Color left,
    Color right,
  ) => _flat.DrawRectangleGradientH(
    posX.toInt(),
    posY.toInt(),
    width.toInt(),
    height.toInt(),
    left,
    right,
  );

  /// Draw a gradient-filled rectangle with custom vertex colors
  void DrawRectangleGradientEx(
    Rectangle rec,
    Color topLeft,
    Color bottomLeft,
    Color topRight,
    Color bottomRight,
  ) => _flat.DrawRectangleGradientEx(
    rec,
    topLeft,
    bottomLeft,
    topRight,
    bottomRight,
  );

  /// Draw rectangle outline
  void DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    Color color,
  ) => _flat.DrawRectangleLines(
    posX.toInt(),
    posY.toInt(),
    width.toInt(),
    height.toInt(),
    color,
  );

  /// Draw rectangle outline with extended parameters
  void DrawRectangleLinesEx(
    Rectangle rec,
    num lineThick,
    Color color,
  ) => _flat.DrawRectangleLinesEx(
    rec,
    lineThick.toDouble(),
    color,
  );

  /// Draw rectangle with rounded edges
  void DrawRectangleRounded(
    Rectangle rec,
    num roundness,
    num segments,
    Color color,
  ) => _flat.DrawRectangleRounded(
    rec,
    roundness.toDouble(),
    segments.toInt(),
    color,
  );

  /// Draw rectangle lines with rounded edges
  void DrawRectangleRoundedLines(
    Rectangle rec,
    num roundness,
    num segments,
    Color color,
  ) => _flat.DrawRectangleRoundedLines(
    rec,
    roundness.toDouble(),
    segments.toInt(),
    color,
  );

  /// Draw rectangle with rounded edges outline
  void DrawRectangleRoundedLinesEx(
    Rectangle rec,
    num roundness,
    num segments,
    num lineThick,
    Color color,
  ) => _flat.DrawRectangleRoundedLinesEx(
    rec,
    roundness.toDouble(),
    segments.toInt(),
    lineThick.toDouble(),
    color,
  );
    
  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _flat.DrawTriangle(
    v1,
    v2,
    v3,
    color,
  );

  /// Draw triangle outline (vertex in counter-clockwise order!)
  void DrawTriangleLines(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _flat.DrawTriangleLines(
    v1,
    v2,
    v3,
    color,
  );

  /// Draw a triangle fan defined by points (first vertex is the center)
  void DrawTriangleFan(
    List<Vector2> points,
    Color color,
  ) => _flat.DrawTriangleFan(
    Vector2$.Array(points),
    points.length,
    color,
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip(
    List<Vector2> points,
    Color color,
  ) => _flat.DrawTriangleStrip(
    Vector2$.Array(points),
    points.length,
    color,
  );

  /// Draw a regular polygon (Vector version)
  void DrawPoly(
    Vector2 center,
    num sides,
    num radius,
    num rotation,
    Color color,
  ) => _flat.DrawPoly(
    center,
    sides.toInt(),
    radius.toDouble(),
    rotation.toDouble(),
    color,
  );

  /// Draw a polygon outline of n sides
  void DrawPolyLines(
    Vector2 center,
    num sides,
    num radius,
    num rotation,
    Color color,
  ) => _flat.DrawPolyLines(
    center,
    sides.toInt(),
    radius.toDouble(),
    rotation.toDouble(),
    color,
  );

  /// Draw a polygon outline of n sides with extended parameters
  void DrawPolyLinesEx(
    Vector2 center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    Color color,
  ) => _flat.DrawPolyLinesEx(
    center,
    sides.toInt(),
    radius.toDouble(),
    rotation.toDouble(),
    lineThick.toDouble(),
    color,
  );

  /// Draw spline: Linear, minimum 2 points
  void DrawSplineLinear(
    List<Vector2> points,
    num thick,
    Color color,
  ) => _flat.DrawSplineLinear(
    Vector2$.Array(points),
    points.length,
    thick.toDouble(),
    color,
  );

  /// Draw spline: B-Spline, minimum 4 points
  void DrawSplineBasis(
    List<Vector2> points,
    num thick,
    Color color,
  ) => _flat.DrawSplineBasis(
    Vector2$.Array(points),
    points.length,
    thick.toDouble(),
    color,
  );

  /// Draw spline: Catmull-Rom, minimum 4 points
  void DrawSplineCatmullRom(
    List<Vector2> points,
    num thick,
    Color color,
  ) => _flat.DrawSplineCatmullRom(
    Vector2$.Array(points),
    points.length, 
    thick.toDouble(), 
    color,
  );

  /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
  void DrawSplineBezierQuadratic(
    List<Vector2> points,
    num thick,
    Color color,
  ) => _flat.DrawSplineBezierQuadratic(
    Vector2$.Array(points),
    points.length,
    thick.toDouble(),
    color,
  );

  /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
  void DrawSplineBezierCubic(
    List<Vector2> points,
    num thick,
    Color color,
  ) => _flat.DrawSplineBezierCubic(
    Vector2$.Array(points),
    points.length,
    thick.toDouble(),
    color,
  );
    
  /// Draw spline segment: Linear, 2 points
  void DrawSplineSegmentLinear(
    Vector2 p1,
    Vector2 p2,
    num thick,
    Color color,
  ) => _flat.DrawSplineSegmentLinear(
    p1,
    p2,
    thick.toDouble(),
    color,
  );

  /// Draw spline segment: B-Spline, 4 points
  void DrawSplineSegmentBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num thick,
    Color color,
  ) => _flat.DrawSplineSegmentBasis(
    p1,
    p2,
    p3,
    p4,
    thick.toDouble(),
    color,
  );

  /// Draw spline segment: Catmull-Rom, 4 points
  void DrawSplineSegmentCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num thick,
    Color color,
  ) => _flat.DrawSplineSegmentCatmullRom(
    p1,
    p2,
    p3,
    p4,
    thick.toDouble(),
    color,
  );

  /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
  void DrawSplineSegmentBezierQuadratic(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    num thick,
    Color color,
  ) => _flat.DrawSplineSegmentBezierQuadratic(
    p1,
    c2,
    p3,
    thick.toDouble(),
    color,
  );

  /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
  void DrawSplineSegmentBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    num thick,
    Color color,
  ) => _flat.DrawSplineSegmentBezierCubic(
    p1,
    c2,
    c3,
    p4,
    thick.toDouble(),
    color,
  );

  /// Get (evaluate) spline point: Linear
  Vector2 GetSplinePointLinear(
    Vector2 startPos,
    Vector2 endPos,
    num t,
  ) => _flat.GetSplinePointLinear(
    startPos,
    endPos,
    t.toDouble(),
  );

  /// Get (evaluate) spline point: B-Spline
  Vector2 GetSplinePointBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num t,
  ) => _flat.GetSplinePointBasis(
    p1,
    p2,
    p3,
    p4,
    t.toDouble(),
  );
    
  /// Get (evaluate) spline point: Catmull-Rom
  Vector2 GetSplinePointCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num t,
  ) => _flat.GetSplinePointCatmullRom(
    p1,
    p2,
    p3,
    p4,
    t.toDouble(),
  );

  /// Get (evaluate) spline point: Quadratic Bezier
  Vector2 GetSplinePointBezierQuad(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    num t,
  ) => _flat.GetSplinePointBezierQuad(
    p1,
    c2,
    p3,
    t.toDouble(),
  );

  /// Get (evaluate) spline point: Cubic Bezier
  Vector2 GetSplinePointBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    num t,
  ) => _flat.GetSplinePointBezierCubic(
    p1,
    c2,
    c3,
    p4,
    t.toDouble(),
  );

  /// Check collision between two rectangles
  bool CheckCollisionRecs(
    Rectangle rec1,
    Rectangle rec2,
  ) => _flat.CheckCollisionRecs(
    rec1,
    rec2,
  );

  /// Check collision between two circles
  bool CheckCollisionCircles(
    Vector2 center1,
    num radius1,
    Vector2 center2,
    num radius2,
  ) => _flat.CheckCollisionCircles(
    center1,
    radius1.toDouble(),
    center2,
    radius2.toDouble(),
  );

  /// Check collision between circle and rectangle
  bool CheckCollisionCircleRec(
    Vector2 center,
    num radius,
    Rectangle rec,
  ) => _flat.CheckCollisionCircleRec(
    center,
    radius.toDouble(),
    rec,
  );

  /// Check if circle collides with a line created betweeen two points [p1] and [p2]
  bool CheckCollisionCircleLine(
    Vector2 center,
    num radius,
    Vector2 p1,
    Vector2 p2,
  ) => _flat.CheckCollisionCircleLine(
    center,
    radius.toDouble(),
    p1,
    p2,
  );

  /// Check if point is inside rectangle
  bool CheckCollisionPointRec(
    Vector2 point,
    Rectangle rec,
  ) => _flat.CheckCollisionPointRec(
    point,
    rec,
  );
    
  /// Check if point is inside circle
  bool CheckCollisionPointCircle(
    Vector2 point,
    Vector2 center,
    num radius,
  ) => _flat.CheckCollisionPointCircle(
    point,
    center,
    radius.toDouble(),
  );

  /// Check if point is inside a triangle
  bool CheckCollisionPointTriangle(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
  ) => _flat.CheckCollisionPointTriangle(
    point,
    p1,
    p2,
    p3,
  );

  /// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
  bool CheckCollisionPointLine(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    num threshold,
  ) => _flat.CheckCollisionPointLine(
    point,
    p1,
    p2,
    threshold.toInt(),
  );

  /// Check if point is within a polygon described by array of vertices
  bool CheckCollisionPointPoly(
    Vector2 point,
    List<Vector2> points,
  ) => _flat.CheckCollisionPointPoly(
    point,
    Vector2$.Array(points),
    points.length,
  );

  /// Check the collision between two lines defined by two points each, returns collision point by reference
  (bool result, Vector2 collisionPoint) CheckCollisionLines(
    Vector2 startPos1,
    Vector2 endPos1,
    Vector2 startPos2,
    Vector2 endPos2,
  ) {
    final collisionPoint = Vector2$.Ref5();
    final result = _flat.CheckCollisionLines(
      startPos1,
      endPos1,
      startPos2,
      endPos2,
      collisionPoint,
    );
    return (result, collisionPoint.ref);
  }

  /// Get collision rectangle for two rectangles collision
  Rectangle GetCollisionRec(
    Rectangle rec1,
    Rectangle rec2,
  ) => _flat.GetCollisionRec(
    rec1,
    rec2,
  );

  /// Load image from file into CPU memory (RAM)
  Image LoadImage(
    String fileName,
  ) => _flat.LoadImage(
    String$.ValueOrNull(fileName),
  );
    
  /// Load image from RAW file data
  Image LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => _flat.LoadImageRaw(
    String$.ValueOrNull(fileName),
    width.toInt(),
    height.toInt(),
    format.value,
    headerSize.toInt(),
  );

  /// Load image sequence from file (frames appended to image.data)
  Image LoadImageAnim(
    String fileName,
  ) {
    final frames = Int$.Ref1();
    final image = _flat.LoadImageAnim(
      String$.ValueOrNull(fileName),
      frames,
    );
    image.frameCount = frames.value;
    return image;
  }

  /// Load image sequence from memory buffer
  Image LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) {
    final frames = Int$.Ref1();
    final image = _flat.LoadImageAnimFromMemory(
      String$.ValueOrNull(fileType),
      UnsignedChar$.Array(fileData),
      fileData.length,
      frames,
    );
    image.frameCount = frames.value;
    return image;
  }

  /// Load image from memory buffer, fileType refers to extension: i.e. '.png'
  Image LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => _flat.LoadImageFromMemory(
    String$.ValueOrNull(fileType),
    UnsignedChar$.Array(fileData),
    fileData.length,
  );

  /// Load image from GPU texture data
  Image LoadImageFromTexture(
    Texture texture,
  ) => _flat.LoadImageFromTexture(
    texture,
  );

  /// Load image from screen buffer and (screenshot)
  Image LoadImageFromScreen() => _flat.LoadImageFromScreen();

  /// Check if an image is valid (data and parameters)
  bool IsImageValid(
    Image image,
  ) => _flat.IsImageValid(
    image,
  );

  /// Unload image from CPU memory (RAM)
  void UnloadImage(
    Image image,
  ) => _flat.UnloadImage(
    image,
  );

  /// Export image data to file, returns true on success
  bool ExportImage(
    Image image,
    String fileName,
  ) => _flat.ExportImage(
    image,
    String$.ValueOrNull(fileName),
  );
    
  /// Export image to memory buffer
  (XPtr<XUint8> dataPtr, int dataSize) ExportImageToMemory(
    Image image,
    String fileType,
  ) {
    final dataSize = Int$.Ref1();
    final dataPtr = _flat.ExportImageToMemory(
      image,
      String$.ValueOrNull(fileType),
      dataSize,
    );
    return (dataPtr, dataSize.value);
  }

  /// Export image as code file defining an array of bytes, returns true on success
  bool ExportImageAsCode(
    Image image,
    String fileName,
  ) => _flat.ExportImageAsCode(
    image,
    String$.ValueOrNull(fileName),
  );

  /// Generate image: plain color
  Image GenImageColor(
    num width,
    num height,
    Color color,
  ) => _flat.GenImageColor(
    width.toInt(),
    height.toInt(),
    color,
  );

  /// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
  Image GenImageGradientLinear(
    num width,
    num height,
    num direction,
    Color start,
    Color end,
  ) => _flat.GenImageGradientLinear(
    width.toInt(),
    height.toInt(),
    direction.toInt(),
    start,
    end,
  );

  /// Generate image: radial gradient
  Image GenImageGradientRadial(
    num width,
    num height,
    num density,
    Color inner,
    Color outer,
  ) => _flat.GenImageGradientRadial(
    width.toInt(),
    height.toInt(),
    density.toDouble(),
    inner,
    outer,
  );

  /// Generate image: square gradient
  Image GenImageGradientSquare(
    num width,
    num height,
    num density,
    Color inner,
    Color outer,
  ) => _flat.GenImageGradientSquare(
    width.toInt(),
    height.toInt(),
    density.toDouble(),
    inner,
    outer,
  );

  /// Generate image: checked
  Image GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    Color col1,
    Color col2,
  ) => _flat.GenImageChecked(
    width.toInt(),
    height.toInt(),
    checksX.toInt(),
    checksY.toInt(),
    col1,
    col2,
  );

  /// Generate image: white noise
  Image GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => _flat.GenImageWhiteNoise(
    width.toInt(),
    height.toInt(),
    factor.toDouble(),
  );

  /// Generate image: perlin noise
  Image GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => _flat.GenImagePerlinNoise(
    width.toInt(),
    height.toInt(),
    offsetX.toInt(),
    offsetY.toInt(),
    scale.toDouble(),
  );
    
  /// Generate image: cellular algorithm, bigger tileSize means bigger cells
  Image GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => _flat.GenImageCellular(
    width.toInt(),
    height.toInt(),
    tileSize.toInt(),
  );

  /// Generate image: grayscale image from text data
  Image GenImageText(
    num width,
    num height,
    String text,
  ) => _flat.GenImageText(
    width.toInt(),
    height.toInt(),
    String$.ValueOrNull(text),
  );

  /// Create an image duplicate (useful for transformations)
  Image ImageCopy(
    Image image,
  ) => _flat.ImageCopy(
    image,
  );

  /// Create an image from another image piece
  Image ImageFromImage(
    Image image,
    Rectangle rec,
  ) => _flat.ImageFromImage(
    image,
    rec,
  );

  /// Create an image from a selected channel of another image (GRAYSCALE)
  Image ImageFromChannel(
    Image image,
    num selectedChannel,
  ) => _flat.ImageFromChannel(
    image,
    selectedChannel.toInt(),
  );

  /// Create an image from text (default font)
  Image ImageText(
    String text,
    num fontSize,
    Color color,
  ) => _flat.ImageText(
    String$.ValueOrNull(text),
    fontSize.toInt(),
    color,
  );

  /// Create an image from text (custom sprite font)
  Image ImageTextEx(
    Font font,
    String text,
    num fontSize,
    num spacing,
    Color tint,
  ) => _flat.ImageTextEx(
    font,
    String$.ValueOrNull(text),
    fontSize.toDouble(),
    spacing.toDouble(),
    tint,
  );

  /// Convert image data to desired format
  void ImageFormat(
    Image image,
    PixelFormat newFormat,
  ) => _flat.ImageFormat(
    Image$.Ref1(image),
    newFormat.value,
  );
    
  /// Convert image to POT (power-of-two)
  void ImageToPOT(
    Image image,
    Color fill,
  ) => _flat.ImageToPOT(
    Image$.Ref1(image),
    fill,
  );

  /// Crop an image to a defined rectangle
  void ImageCrop(
    Image image,
    Rectangle crop,
  ) => _flat.ImageCrop(
    Image$.Ref1(image),
    crop,
  );

  /// Crop image depending on alpha value
  void ImageAlphaCrop(
    Image image,
    num threshold,
  ) => _flat.ImageAlphaCrop(
    Image$.Ref1(image),
    threshold.toDouble(),
  );

  /// Clear alpha channel to desired color
  void ImageAlphaClear(
    Image image,
    Color color,
    num threshold,
  ) => _flat.ImageAlphaClear(
    Image$.Ref1(image),
    color,
    threshold.toDouble(),
  );

  /// Apply alpha mask to image
  void ImageAlphaMask(
    Image image,
    Image alphaMask,
  ) => _flat.ImageAlphaMask(
    Image$.Ref1(image),
    alphaMask,
  );

  /// Premultiply alpha channel
  void ImageAlphaPremultiply(
    Image image,
  ) => _flat.ImageAlphaPremultiply(
    Image$.Ref1(image),
  );

  /// Apply Gaussian blur using a box blur approximation
  void ImageBlurGaussian(
    Image image,
    num blurSize,
  ) => _flat.ImageBlurGaussian(
    Image$.Ref1(image),
    blurSize.toInt(),
  );

  /// Apply custom square convolution kernel to image
  void ImageKernelConvolution(
    Image image,
    List<double> kernel,
  ) => _flat.ImageKernelConvolution(
    Image$.Ref1(image),
    Float32$.Array(kernel),
    kernel.length,
  );

  /// Resize image (Bicubic scaling algorithm)
  void ImageResize(
    Image image,
    num newWidth,
    num newHeight,
  ) => _flat.ImageResize(
    Image$.Ref1(image),
    newWidth.toInt(),
    newHeight.toInt(),
  );

  /// Resize image (Nearest-Neighbor scaling algorithm)
  void ImageResizeNN(
    Image image,
    num newWidth,
    num newHeight,
  ) => _flat.ImageResizeNN(
    Image$.Ref1(image),
    newWidth.toInt(),
    newHeight.toInt(),
  );
    
  /// Resize canvas and fill with color
  void ImageResizeCanvas(
    Image image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    Color fill,
  ) => _flat.ImageResizeCanvas(
    Image$.Ref1(image),
    newWidth.toInt(),
    newHeight.toInt(),
    offsetX.toInt(),
    offsetY.toInt(),
    fill,
  );

  /// Compute all mipmap levels for a provided image
  void ImageMipmaps(
    Image image,
  ) => _flat.ImageMipmaps(
    Image$.Ref1(image),
  );

  /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  void ImageDither(
    Image image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => _flat.ImageDither(
    Image$.Ref1(image),
    rBpp.toInt(),
    gBpp.toInt(),
    bBpp.toInt(),
    aBpp.toInt(),
  );

  /// Flip image vertically
  void ImageFlipVertical(
    Image image,
  ) => _flat.ImageFlipVertical(
    Image$.Ref1(image),
  );

  /// Flip image horizontally
  void ImageFlipHorizontal(
    Image image,
  ) => _flat.ImageFlipHorizontal(
    Image$.Ref1(image),
  );

  /// Rotate image by input angle in degrees (-359 to 359)
  void ImageRotate(
    Image image,
    num degrees,
  ) => _flat.ImageRotate(
    Image$.Ref1(image),
    degrees.toInt(),
  );

  /// Rotate image clockwise 90deg
  void ImageRotateCW(
    Image image,
  ) => _flat.ImageRotateCW(
    Image$.Ref1(image),
  );

  /// Rotate image counter-clockwise 90deg
  void ImageRotateCCW(
    Image image,
  ) => _flat.ImageRotateCCW(
    Image$.Ref1(image),
  );
    
  /// Modify image color: tint
  void ImageColorTint(
    Image image,
    Color color,
  ) => _flat.ImageColorTint(
    Image$.Ref1(image),
    color,
  );

  /// Modify image color: invert
  void ImageColorInvert(
    Image image,
  ) => _flat.ImageColorInvert(
    Image$.Ref1(image),
  );

  /// Modify image color: grayscale
  void ImageColorGrayscale(
    Image image,
  ) => _flat.ImageColorGrayscale(
    Image$.Ref1(image),
  );

  /// Modify image color: contrast (-100 to 100)
  void ImageColorContrast(
    Image image,
    num contrast,
  ) => _flat.ImageColorContrast(
    Image$.Ref1(image),
    contrast.toDouble(),
  );

  /// Modify image color: brightness (-255 to 255)
  void ImageColorBrightness(
    Image image,
    num brightness,
  ) => _flat.ImageColorBrightness(
    Image$.Ref1(image),
    brightness.toInt(),
  );

  /// Modify image color: replace color
  void ImageColorReplace(
    Image image,
    Color color,
    Color replace,
  ) => _flat.ImageColorReplace(
    Image$.Ref1(image),
    color,
    replace,
  );

  /// Load color data from image as a Color array (RGBA - 32bit)
  List<Color> LoadImageColors(
    Image image,
  ) {
    final colors = _flat.LoadImageColors(
      image,
    );
    try {
      return colors.readArray(image.width * image.height, view: false);
    } finally {
      _flat.UnloadImageColors(colors);
    }
  }
    
  /// Load colors palette from image as a Color array (RGBA - 32bit)
  List<Color> LoadImagePalette(
    Image image,
    num maxPaletteSize,
  ) {
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
  }

  /// Get image alpha border rectangle
  Rectangle GetImageAlphaBorder(
    Image image,
    num threshold,
  ) => _flat.GetImageAlphaBorder(
    image,
    threshold.toDouble(),
  );

  /// Get image pixel color at (x, y) position
  Color GetImageColor(
    Image image,
    num x,
    num y,
  ) => _flat.GetImageColor(
    image,
    x.toInt(),
    y.toInt(),
  );

  /// Clear image background with given color
  void ImageClearBackground(
    Image dst,
    Color color,
  ) => _flat.ImageClearBackground(
    Image$.Ref1(dst),
    color,
  );

  /// Draw pixel within an image
  void ImageDrawPixel(
    Image dst,
    num posX,
    num posY,
    Color color,
  ) => _flat.ImageDrawPixel(
    Image$.Ref1(dst),
    posX.toInt(),
    posY.toInt(),
    color,
  );

  /// Draw pixel within an image (Vector version)
  void ImageDrawPixelV(
    Image dst,
    Vector2 position,
    Color color,
  ) => _flat.ImageDrawPixelV(
    Image$.Ref1(dst),
    position,
    color,
  );
    
  /// Draw line within an image
  void ImageDrawLine(
    Image dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    Color color,
  ) => _flat.ImageDrawLine(
    Image$.Ref1(dst),
    startPosX.toInt(),
    startPosY.toInt(),
    endPosX.toInt(),
    endPosY.toInt(),
    color,
  );

  /// Draw line within an image (Vector version)
  void ImageDrawLineV(
    Image dst,
    Vector2 start,
    Vector2 end,
    Color color,
  ) => _flat.ImageDrawLineV(
    Image$.Ref1(dst),
    start,
    end,
    color,
  );

  /// Draw a line defining thickness within an image
  void ImageDrawLineEx(
    Image dst,
    Vector2 start,
    Vector2 end,
    num thick,
    Color color,
  ) => _flat.ImageDrawLineEx(
    Image$.Ref1(dst),
    start,
    end,
    thick.toInt(),
    color,
  );

  /// Draw a filled circle within an image
  void ImageDrawCircle(
    Image dst,
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => _flat.ImageDrawCircle(
    Image$.Ref1(dst),
    centerX.toInt(),
    centerY.toInt(),
    radius.toInt(),
    color,
  );

  /// Draw a filled circle within an image (Vector version)
  void ImageDrawCircleV(
    Image dst,
    Vector2 center,
    num radius,
    Color color,
  ) => _flat.ImageDrawCircleV(
    Image$.Ref1(dst),
    center,
    radius.toInt(),
    color,
  );

  /// Draw circle outline within an image
  void ImageDrawCircleLines(
    Image dst,
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => _flat.ImageDrawCircleLines(
    Image$.Ref1(dst),
    centerX.toInt(),
    centerY.toInt(),
    radius.toInt(),
    color,
  );

  /// Draw circle outline within an image (Vector version)
  void ImageDrawCircleLinesV(
    Image dst,
    Vector2 center,
    num radius,
    Color color,
  ) => _flat.ImageDrawCircleLinesV(
    Image$.Ref1(dst),
    center,
    radius.toInt(),
    color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangle(
    Image dst,
    num posX,
    num posY,
    num width,
    num height,
    Color color,
  ) => _flat.ImageDrawRectangle(
    Image$.Ref1(dst),
    posX.toInt(),
    posY.toInt(),
    width.toInt(),
    height.toInt(),
    color,
  );
    
  /// Draw rectangle within an image (Vector version)
  void ImageDrawRectangleV(
    Image dst,
    Vector2 position,
    Vector2 size,
    Color color,
  ) => _flat.ImageDrawRectangleV(
    Image$.Ref1(dst),
    position,
    size,
    color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangleRec(
    Image dst,
    Rectangle rec,
    Color color,
  ) => _flat.ImageDrawRectangleRec(
    Image$.Ref1(dst),
    rec,
    color,
  );

  /// Draw rectangle lines within an image
  void ImageDrawRectangleLines(
    Image dst,
    Rectangle rec,
    num thick,
    Color color,
  ) => _flat.ImageDrawRectangleLines(
    Image$.Ref1(dst),
    rec,
    thick.toInt(),
    color,
  );

  /// Draw triangle within an image
  void ImageDrawTriangle(
    Image dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _flat.ImageDrawTriangle(
    Image$.Ref1(dst),
    v1,
    v2,
    v3,
    color,
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
  ) => _flat.ImageDrawTriangleEx(
    Image$.Ref1(dst),
    v1,
    v2,
    v3,
    c1,
    c2,
    c3,
  );

  /// Draw triangle outline within an image
  void ImageDrawTriangleLines(
    Image dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _flat.ImageDrawTriangleLines(
    Image$.Ref1(dst),
    v1,
    v2,
    v3,
    color,
  );
    
  /// Draw a triangle fan defined by points within an image (first vertex is the center)
  void ImageDrawTriangleFan(
    Image dst,
    List<Vector2> points,
    Color color,
  ) => _flat.ImageDrawTriangleFan(
    Image$.Ref1(dst),
    Vector2$.Array(points),
    points.length,
    color,
  );

  /// Draw a triangle strip defined by points within an image
  void ImageDrawTriangleStrip(
    Image dst,
    List<Vector2> points,
    Color color,
  ) => _flat.ImageDrawTriangleStrip(
    Image$.Ref1(dst),
    Vector2$.Array(points),
    points.length,
    color,
  );

  /// Draw a source image within a destination image (tint applied to source)
  void ImageDraw(
    Image dst,
    Image src,
    Rectangle srcRec,
    Rectangle dstRec,
    Color tint,
  ) => _flat.ImageDraw(
    Image$.Ref1(dst),
    src,
    srcRec,
    dstRec,
    tint,
  );

  /// Draw text (using default font) within an image (destination)
  void ImageDrawText(
    Image dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    Color color,
  ) => _flat.ImageDrawText(
    Image$.Ref1(dst),
    String$.ValueOrNull(text),
    posX.toInt(),
    posY.toInt(),
    fontSize.toInt(),
    color,
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
  ) => _flat.ImageDrawTextEx(
    Image$.Ref1(dst),
    font,
    String$.ValueOrNull(text),
    position,
    fontSize.toDouble(),
    spacing.toDouble(),
    tint,
  );

  /// Load texture from file into GPU memory (VRAM)
  Texture LoadTexture(
    String fileName,
  ) => _flat.LoadTexture(
    String$.ValueOrNull(fileName),
  );

  /// Load texture from image data
  Texture LoadTextureFromImage(
    Image image,
  ) => _flat.LoadTextureFromImage(
    image,
  );

  /// Load cubemap from image, multiple image cubemap layouts supported
  Texture LoadTextureCubemap(
    Image image,
    CubemapLayout layout,
  ) => _flat.LoadTextureCubemap(
    image,
    layout.value,
  );

  /// Load texture for rendering (framebuffer)
  RenderTexture LoadRenderTexture(
    num width,
    num height,
  ) => _flat.LoadRenderTexture(
    width.toInt(),
    height.toInt(),
  );

  /// Check if a texture is valid (loaded in GPU)
  bool IsTextureValid(
    Texture texture,
  ) => _flat.IsTextureValid(
    texture,
  );

  /// Unload texture from GPU memory (VRAM)
  void UnloadTexture(
    Texture texture,
  ) {
    _flat.UnloadTexture(
      texture,
    );
    texture.structDispose();
  }

  /// Check if a render texture is valid (loaded in GPU)
  bool IsRenderTextureValid(
    RenderTexture target,
  ) => _flat.IsRenderTextureValid(
    target,
  );

  /// Unload render texture from GPU memory (VRAM)
  void UnloadRenderTexture(
    RenderTexture target,
  ) => _flat.UnloadRenderTexture(
    target,
  );

  /// Update GPU texture with new data
  void UpdateTexture(
    Texture texture,
    Uint8List pixels,
  ) => _flat.UpdateTexture(
    texture,
    Uint8$.Array(pixels).cast(),
  );
    
  /// Update GPU texture rectangle with new data
  void UpdateTextureRec(
    Texture texture,
    Rectangle rec,
    Uint8List pixels,
  ) => _flat.UpdateTextureRec(
    texture,
    rec,
    Uint8$.Array(pixels).cast(),
  );

  /// Generate GPU mipmaps for a texture
  void GenTextureMipmaps(
    Texture texture,
  ) => _flat.GenTextureMipmaps(
    Texture$.Ref1(texture),
  );

  /// Set texture scaling filter mode
  void SetTextureFilter(
    Texture texture,
    TextureFilter filter,
  ) => _flat.SetTextureFilter(
    texture,
    filter.value,
  );

  /// Set texture wrapping mode
  void SetTextureWrap(
    Texture texture,
    TextureWrap wrap,
  ) => _flat.SetTextureWrap(
    texture,
    wrap.value,
  );

  /// Draw a Texture2D
  void DrawTexture(
    Texture texture,
    num posX,
    num posY,
    Color tint,
  ) => _flat.DrawTexture(
    texture,
    posX.toInt(),
    posY.toInt(),
    tint,
  );

  /// Draw a Texture2D with position defined as Vector2
  void DrawTextureV(
    Texture texture,
    Vector2 position,
    Color tint,
  ) => _flat.DrawTextureV(
    texture,
    position,
    tint,
  );
    
  /// Draw a Texture2D with extended parameters
  void DrawTextureEx(
    Texture texture,
    Vector2 position,
    num rotation,
    num scale,
    Color tint,
  ) => _flat.DrawTextureEx(
    texture,
    position,
    rotation.toDouble(),
    scale.toDouble(),
    tint,
  );

  /// Draw a part of a texture defined by a rectangle
  void DrawTextureRec(
    Texture texture,
    Rectangle source,
    Vector2 position,
    Color tint,
  ) => _flat.DrawTextureRec(
    texture,
    source,
    position,
    tint,
  );

  /// Draw a part of a texture defined by a rectangle with 'pro' parameters
  void DrawTexturePro(
    Texture texture,
    Rectangle source,
    Rectangle dest,
    Vector2 origin,
    num rotation,
    Color tint,
  ) => _flat.DrawTexturePro(
    texture,
    source,
    dest,
    origin,
    rotation.toDouble(),
    tint,
  );

  /// Draws a texture (or part of it) that stretches or shrinks nicely
  void DrawTextureNPatch(
    Texture texture,
    NPatchInfo nPatchInfo,
    Rectangle dest,
    Vector2 origin,
    num rotation,
    Color tint,
  ) => _flat.DrawTextureNPatch(
    texture,
    nPatchInfo,
    dest,
    origin,
    rotation.toDouble(),
    tint,
  );

  /// Check if two colors are equal
  bool ColorIsEqual(
    Color col1,
    Color col2,
  ) => _flat.ColorIsEqual(
    col1,
    col2,
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  Color Fade(
    Color color,
    num alpha,
  ) => _flat.Fade(
    color,
    alpha.toDouble(),
  );

  /// Get hexadecimal value for a Color (0xRRGGBBAA)
  int ColorToInt(
    Color color,
  ) => _flat.ColorToInt(
    color,
  );

  /// Get Color normalized as float [0..1]
  Vector4 ColorNormalize(
    Color color,
  ) => _flat.ColorNormalize(
    color,
  );

  /// Get Color from normalized values [0..1]
  Color ColorFromNormalized(
    Vector4 normalized,
  ) => _flat.ColorFromNormalized(
    normalized,
  );

  /// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
  Vector3 ColorToHSV(
    Color color,
  ) => _flat.ColorToHSV(
    color,
  );

  /// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
  Color ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => _flat.ColorFromHSV(
    hue.toDouble(),
    saturation.toDouble(),
    value.toDouble(),
  );

  /// Get color multiplied with another color
  Color ColorTint(
    Color color,
    Color tint,
  ) => _flat.ColorTint(
    color,
    tint,
  );

  /// Get color with brightness correction, brightness factor goes from -1.0 to 1.0
  Color ColorBrightness(
    Color color,
    num factor,
  ) => _flat.ColorBrightness(
    color,
    factor.toDouble(),
  );

  /// Get color with contrast correction, contrast values between -1.0 and 1.0
  Color ColorContrast(
    Color color,
    num contrast,
  ) => _flat.ColorContrast(
    color,
    contrast.toDouble(),
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  Color ColorAlpha(
    Color color,
    num alpha,
  ) => _flat.ColorAlpha(
    color,
    alpha.toDouble(),
  );

  /// Get src alpha-blended into dst color with tint
  Color ColorAlphaBlend(
    Color dst,
    Color src,
    Color tint,
  ) => _flat.ColorAlphaBlend(
    dst,
    src,
    tint,
  );

  /// Get color lerp interpolation between two colors, factor [0.0..1.0]
  Color ColorLerp(
    Color color1,
    Color color2,
    num factor,
  ) => _flat.ColorLerp(
    color1,
    color2,
    factor.toDouble(),
  );

  /// Get Color structure from hexadecimal value
  Color GetColor(
    num hexValue,
  ) => _flat.GetColor(
    hexValue.toInt(),
  );

  /// Get pixel data size in bytes for certain format
  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => _flat.GetPixelDataSize(
    width.toInt(),
    height.toInt(),
    format.value,
  );

  /// Get the default Font
  Font GetFontDefault() => _flat.GetFontDefault();

  /// Load font from file into GPU memory (VRAM)
  Font LoadFont(
    String fileName,
  ) => _flat.LoadFont(
    String$.ValueOrNull(fileName),
  );
    
  /// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
  Font LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codepointCount,
    ]
  ) => _flat.LoadFontEx(
    String$.ValueOrNull(fileName),
    fontSize.toInt(),
    codepoints == null ? .nullptr() : Int$.Array(codepoints).cast(),
    codepointCount?.toInt() ?? codepoints?.length ?? 0,
  );

  /// Load font from Image (XNA style)
  Font LoadFontFromImage(
    Image image,
    Color key,
    num firstChar,
  ) => _flat.LoadFontFromImage(
    image,
    key,
    firstChar.toInt(),
  );

  /// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  Font LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => _flat.LoadFontFromMemory(
    String$.ValueOrNull(fileType),
    Uint8$.Array(fileData),
    fileData.length,
    fontSize.toInt(),
    Int$.Array(codepoints),
    codepoints.length,
  );

  /// Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
  bool IsFontValid(
    Font font,
  ) => _flat.IsFontValid(
    font,
  );

  /// Load font data for further use
  List<GlyphInfo> LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) {
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
  }

  /// Generate image font atlas using chars info
  (Image image, List<Rectangle> glyphRecs) GenImageFontAtlas(
    List<GlyphInfo> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) {
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
  }

  /// Unload font chars info data (RAM)
  void UnloadFontData(
    List<GlyphInfo> glyphs,
  ) => _flat.UnloadFontData(
    glyphs.first.getOp(),
    glyphs.length,
  );
    
  /// Unload font from GPU memory (VRAM)
  void UnloadFont(
    Font font,
  ) => _flat.UnloadFont(
    font,
  );

  /// Export font as code file, returns true on success
  bool ExportFontAsCode(
    Font font,
    String fileName,
  ) => _flat.ExportFontAsCode(
    font,
    String$.ValueOrNull(fileName),
  );

  /// Draw current FPS
  void DrawFPS(
    num posX,
    num posY,
  ) => _flat.DrawFPS(
    posX.toInt(),
    posY.toInt(),
  );

  /// Draw text (using default font)
  void DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    Color color,
  ) => _flat.DrawText(
    String$.ValueOrNull(text),
    posX.toInt(),
    posY.toInt(),
    fontSize.toInt(),
    color,
  );

  /// Draw text using font and additional parameters
  void DrawTextEx(
    Font font,
    String text,
    Vector2 position,
    num fontSize,
    num spacing,
    Color tint,
  ) => _flat.DrawTextEx(
    font,
    String$.ValueOrNull(text),
    position,
    fontSize.toDouble(),
    spacing.toDouble(),
    tint,
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
  ) => _flat.DrawTextPro(
    font,
    String$.ValueOrNull(text),
    position,
    origin,
    rotation.toDouble(),
    fontSize.toDouble(),
    spacing.toDouble(),
    tint,
  );
    
  /// Draw one character (codepoint)
  void DrawTextCodepoint(
    Font font,
    num codepoint,
    Vector2 position,
    num fontSize,
    Color tint,
  ) => _flat.DrawTextCodepoint(
    font,
    codepoint.toInt(),
    position,
    fontSize.toDouble(),
    tint,
  );

  /// Draw multiple character (codepoint)
  void DrawTextCodepoints(
    Font font,
    Int32List codepoints,
    Vector2 position,
    num fontSize,
    num spacing,
    Color tint,
  ) => _flat.DrawTextCodepoints(
    font,
    Int$.Array(codepoints),
    codepoints.length,
    position,
    fontSize.toDouble(),
    spacing.toDouble(),
    tint,
  );

  /// Set vertical line spacing when drawing with line-breaks
  void SetTextLineSpacing(
    num spacing,
  ) => _flat.SetTextLineSpacing(
    spacing.toInt(),
  );

  /// Measure string width for default font
  int MeasureText(
    String text,
    num fontSize,
  ) => _flat.MeasureText(
    String$.ValueOrNull(text),
    fontSize.toInt(),
  );
    
  /// Measure string size for Font
  Vector2 MeasureTextEx(
    Font font,
    String text,
    num fontSize,
    num spacing,
  ) => _flat.MeasureTextEx(
    font,
    String$.ValueOrNull(text),
    fontSize.toDouble(),
    spacing.toDouble(),
  );

  /// Measure string size for an existing array of codepoints for Font
  Vector2 MeasureTextCodepoints(
    Font font,
    Int32List codepoints,
    num fontSize,
    num spacing,
  ) => _flat.MeasureTextCodepoints(
    font,
    Int$.Array(codepoints),
    codepoints.length,
    fontSize.toDouble(),
    spacing.toDouble(),
  );

  /// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  int GetGlyphIndex(
    Font font,
    num codepoint,
  ) => _flat.GetGlyphIndex(
    font,
    codepoint.toInt(),
  );

  /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  GlyphInfo GetGlyphInfo(
    Font font,
    num codepoint,
  ) => _flat.GetGlyphInfo(
    font,
    codepoint.toInt(),
  );

  /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  Rectangle GetGlyphAtlasRec(
    Font font,
    num codepoint,
  ) => _flat.GetGlyphAtlasRec(
    font,
    codepoint.toInt(),
  );
    
  /// Load UTF-8 text encoded from codepoints array
  String LoadUTF8(
    Int32List codepoints,
  ) {
    final utf8 = _flat.LoadUTF8(
      Int$.Array(codepoints),
      codepoints.length,
    );
    try {
      return utf8.toDartString();
    } finally {
      _flat.UnloadUTF8(utf8);
    }
  }

  /// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
  Int32List LoadCodepoints(
    String text,
  ) {
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
  }

  /// Get total number of codepoints in a UTF-8 encoded string
  int GetCodepointCount(
    String text,
  ) => _flat.GetCodepointCount(
    String$.ValueOrNull(text),
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepoint(
    String text,
  ) {
    final size = Int$.Ref1();
    final codepoint = _flat.GetCodepoint(
      String$.ValueOrNull(text),
      size,
    );
    return (codepoint, size.value);
  }

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointNext(
    String text,
  ) {
    final size = Int$.Ref1();
    final codepoint = _flat.GetCodepointNext(
      String$.ValueOrNull(text),
      size,
    );
    return (codepoint, size.value);
  }

  /// Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointPrevious(
    String text,
  ) {
    final size = Int$.Ref1();
    final codepoint = _flat.GetCodepointPrevious(
      String$.ValueOrNull(text),
      size,
    );
    return (codepoint, size.value);
  }

  /// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
  (String text, int size) CodepointToUTF8(
    num codepoint,
  ) {
    final size = Int$.Ref1();
    final text = _flat.CodepointToUTF8(
      codepoint.toInt(),
      size,
    );
    return (text.toDartString(), size.value);
  }

  /// Load text as separate lines ('\n')
  List<String> LoadTextLines(
    String text,
  ) {
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
  }
  
  /// Check if two text string are equal
  /// 
  /// **NOT** calling original Raylib function.
  bool TextIsEqual(
    String text1,
    String text2,
  ) => text1 == text2;

  /// Get text length
  /// 
  /// **NOT** calling original Raylib function.
  int TextLength(
    String text,
  ) => text.length;

  /// Text formatting with variables (sprintf() style)
  /// 
  /// **NOT** calling original Raylib function.
  String TextFormat(
    String text, [
      List<Object?> args = const [],
    ]
  ) => XPrint.Format(text, args);

  /// Get a piece of a text string
  /// 
  /// **NOT** calling original Raylib function.
  String TextSubtext(
    String text,
    int position,
    int length,
  ) {
    if (position < 0 || position >= text.length) return '';
    final end = (position + length).clamp(position, text.length);
    return text.substring(position, end);
  }

  /// Remove text spaces, concat words
  /// 
  /// **NOT** calling original Raylib function.
  String TextRemoveSpaces(
    String text,
  ) => text.replaceAll(' ', '');

  /// Get text between two strings
  /// 
  /// **NOT** calling original Raylib function.
  String GetTextBetween(
    String text,
    String begin,
    String end,
  ) {
    final startIdx = text.indexOf(begin);
    if (startIdx == -1) return '';
    final contentStart = startIdx + begin.length;
    final endIdx = text.indexOf(end, contentStart);
    if (endIdx == -1) return '';
    return text.substring(contentStart, endIdx);
  }

  /// Replace text string with new string
  /// 
  /// **NOT** calling original Raylib function.
  String TextReplace(
    String text,
    String search,
    String replacement,
  ) => search.isEmpty ? text : text.replaceAll(search, replacement);

  /// Replace text between two specific strings
  String TextReplaceBetween(
    String text,
    String begin,
    String end,
    String replacement,
  ) {
    final startIdx = text.indexOf(begin);
    if (startIdx == -1) return text;
    final contentStart = startIdx + begin.length;
    final endIdx = text.indexOf(end, contentStart);
    if (endIdx == -1) return text;
    return text.substring(0, contentStart) + replacement + text.substring(endIdx);
  }

  /// Insert text in a defined byte position
  String TextInsert(
    String text,
    String insert,
    int position,
  ) {
    final pos = position.clamp(0, text.length);
    return text.substring(0, pos) + insert + text.substring(pos);
  }

  /// Join text strings with delimiter ([delimiter] is expected to be length of 1)
  String TextJoin(
    List<String> textList,
    String delimiter,
  ) {
    assert(delimiter.length > 1);
    return textList.join(delimiter);
  }

  /// Split text into multiple strings
  List<String> TextSplit(
    String text,
    String delimiter,
  ) => delimiter.isEmpty ? [text] : text.split(delimiter);

  /// Append text at specific position and move cursor
  String TextAppend(
    String text,
    String append,
  ) => text + append;

  /// Find first text occurrence within a string, -1 if not found
  int TextFindIndex(
    String text,
    String search,
  ) => text.indexOf(search);

  /// Get upper case version of provided string
  String TextToUpper(
    String text,
  ) => text.toUpperCase();
  
  /// Get lower case version of provided string
  String TextToLower(
    String text,
  ) => text.toLowerCase();
  
  /// Get Pascal case notation version of provided string
  String TextToPascal(
    String text,
  ) => XUtils.TextSplitWords(text)
    .map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase())
    .join();
  
  /// Get Snake case notation version of provided string
  String TextToSnake(
    String text,
  ) => XUtils.TextSplitWords(text)
    .map((w) => w.toLowerCase())
    .join('_');
  
  /// Get Camel case notation version of provided string
  String TextToCamel(
    String text,
  ) {
    final words = XUtils.TextSplitWords(text);
    if (words.isEmpty) return '';
    final first = words.first.toLowerCase();
    final rest = words.skip(1).map(
      (w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase(),
    );
    return first + rest.join();
  }

  /// Get integer value from text
  int TextToInteger(
    String text,
  ) => int.tryParse(text.trim()) ?? 0;
  
  /// Get float value from text
  double TextToFloat(
    String text,
  ) => double.tryParse(text.trim()) ?? 0;
    
  /// Draw a line in 3D world space
  void DrawLine3D(
    Vector3 startPos,
    Vector3 endPos,
    Color color,
  ) => _flat.DrawLine3D(
    startPos,
    endPos,
    color,
  );
    
  /// Draw a point in 3D space, actually a small line
  void DrawPoint3D(
    Vector3 position,
    Color color,
  ) => _flat.DrawPoint3D(
    position,
    color,
  );
    
  /// Draw a circle in 3D world space
  void DrawCircle3D(
    Vector3 center,
    num radius,
    Vector3 rotationAxis,
    num rotationAngle,
    Color color,
  ) => _flat.DrawCircle3D(
    center,
    radius.toDouble(),
    rotationAxis,
    rotationAngle.toDouble(),
    color,
  );
    
  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle3D(
    Vector3 v1,
    Vector3 v2,
    Vector3 v3,
    Color color,
  ) => _flat.DrawTriangle3D(
    v1,
    v2,
    v3,
    color,
  );
    
  /// Draw a triangle strip defined by points
  void DrawTriangleStrip3D(
    List<Vector3> points,
    Color color,
  ) => _flat.DrawTriangleStrip3D(
    Vector3$.Array(points),
    points.length,
    color,
  );
    
  /// Draw cube
  void DrawCube(
    Vector3 position,
    num width,
    num height,
    num length,
    Color color,
  ) => _flat.DrawCube(
    position,
    width.toDouble(),
    height.toDouble(),
    length.toDouble(),
    color,
  );
    
  /// Draw cube (Vector version)
  void DrawCubeV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => _flat.DrawCubeV(
    position,
    size,
    color,
  );
    
  /// Draw cube wires
  void DrawCubeWires(
    Vector3 position,
    num width,
    num height,
    num length,
    Color color,
  ) => _flat.DrawCubeWires(
    position,
    width.toDouble(),
    height.toDouble(),
    length.toDouble(),
    color,
  );
    
  /// Draw cube wires (Vector version)
  void DrawCubeWiresV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => _flat.DrawCubeWiresV(
    position,
    size,
    color,
  );
    
  /// Draw sphere
  void DrawSphere(
    Vector3 centerPos,
    num radius,
    Color color,
  ) => _flat.DrawSphere(
    centerPos,
    radius.toDouble(),
    color,
  );
    
  /// Draw sphere with extended parameters
  void DrawSphereEx(
    Vector3 centerPos,
    num radius,
    num rings,
    num slices,
    Color color,
  ) => _flat.DrawSphereEx(
    centerPos,
    radius.toDouble(),
    rings.toInt(),
    slices.toInt(),
    color,
  );
    
  /// Draw sphere wires
  void DrawSphereWires(
    Vector3 centerPos,
    num radius,
    num rings,
    num slices,
    Color color,
  ) => _flat.DrawSphereWires(
    centerPos,
    radius.toDouble(),
    rings.toInt(),
    slices.toInt(),
    color,
  );
    
  /// Draw a cylinder/cone
  void DrawCylinder(
    Vector3 position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    Color color,
  ) => _flat.DrawCylinder(
    position,
    radiusTop.toDouble(),
    radiusBottom.toDouble(),
    height.toDouble(),
    slices.toInt(),
    color,
  );
    
  /// Draw a cylinder with base at startPos and top at endPos
  void DrawCylinderEx(
    Vector3 startPos,
    Vector3 endPos,
    num startRadius,
    num endRadius,
    num sides,
    Color color,
  ) => _flat.DrawCylinderEx(
    startPos,
    endPos,
    startRadius.toDouble(),
    endRadius.toDouble(),
    sides.toInt(),
    color,
  );
    
  /// Draw a cylinder/cone wires
  void DrawCylinderWires(
    Vector3 position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    Color color,
  ) => _flat.DrawCylinderWires(
    position,
    radiusTop.toDouble(),
    radiusBottom.toDouble(),
    height.toDouble(),
    slices.toInt(),
    color,
  );
    
  /// Draw a cylinder wires with base at startPos and top at endPos
  void DrawCylinderWiresEx(
    Vector3 startPos,
    Vector3 endPos,
    num startRadius,
    num endRadius,
    num sides,
    Color color,
  ) => _flat.DrawCylinderWiresEx(
    startPos,
    endPos,
    startRadius.toDouble(),
    endRadius.toDouble(),
    sides.toInt(),
    color,
  );
    
  /// Draw a capsule with the center of its sphere caps at startPos and endPos
  void DrawCapsule(
    Vector3 startPos,
    Vector3 endPos,
    num radius,
    num slices,
    num rings,
    Color color,
  ) => _flat.DrawCapsule(
    startPos,
    endPos,
    radius.toDouble(),
    slices.toInt(),
    rings.toInt(),
    color,
  );
    
  /// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  void DrawCapsuleWires(
    Vector3 startPos,
    Vector3 endPos,
    num radius,
    num slices,
    num rings,
    Color color,
  ) => _flat.DrawCapsuleWires(
    startPos,
    endPos,
    radius.toDouble(),
    slices.toInt(),
    rings.toInt(),
    color,
  );
    
  /// Draw a plane XZ
  void DrawPlane(
    Vector3 centerPos,
    Vector2 size,
    Color color,
  ) => _flat.DrawPlane(
    centerPos,
    size,
    color,
  );
    
  /// Draw a ray line
  void DrawRay(
    Ray ray,
    Color color,
  ) => _flat.DrawRay(
    ray,
    color,
  );
    
  /// Draw a grid (centered at (0, 0, 0))
  void DrawGrid(
    num slices,
    num spacing,
  ) => _flat.DrawGrid(
    slices.toInt(),
    spacing.toDouble(),
  );
    
  /// Load model from files (meshes and materials)
  Model LoadModel(
    String fileName,
  ) => _flat.LoadModel(
    String$.ValueOrNull(fileName),
  );
    
  /// Load model from generated mesh (default material)
  Model LoadModelFromMesh(
    Mesh mesh,
  ) => _flat.LoadModelFromMesh(
    mesh,
  );
    
  /// Check if a model is valid (loaded in GPU, VAO/VBOs)
  bool IsModelValid(
    Model model,
  ) => _flat.IsModelValid(
    model,
  );
    
  /// Unload model (including meshes) from memory (RAM and/or VRAM)
  void UnloadModel(
    Model model,
  ) => _flat.UnloadModel(
    model,
  );
    
  /// Compute model bounding box limits (considers all meshes)
  BoundingBox GetModelBoundingBox(
    Model model,
  ) => _flat.GetModelBoundingBox(
    model,
  );
    
  /// Draw a model (with texture if set)
  void DrawModel(
    Model model,
    Vector3 position,
    num scale,
    Color tint
  ) => _flat.DrawModel(
    model,
    position,
    scale.toDouble(),
    tint,
  );
    
  /// Draw a model with extended parameters
  void DrawModelEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    num rotationAngle,
    Vector3 scale,
    Color tint,
  ) => _flat.DrawModelEx(
    model,
    position,
    rotationAxis,
    rotationAngle.toDouble(),
    scale,
    tint,
  );
    
  /// Draw a model wires (with texture if set)
  void DrawModelWires(
    Model model,
    Vector3 position,
    num scale,
    Color tint,
  ) => _flat.DrawModelWires(
    model,
    position,
    scale.toDouble(),
    tint,
  );
    
  /// Draw a model wires (with texture if set) with extended parameters
  void DrawModelWiresEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    num rotationAngle,
    Vector3 scale,
    Color tint,
  ) => _flat.DrawModelWiresEx(
    model,
    position,
    rotationAxis,
    rotationAngle.toDouble(),
    scale,
    tint,
  );
    
  /// Draw bounding box (wires)
  void DrawBoundingBox(
    BoundingBox box,
    Color color,
  ) => _flat.DrawBoundingBox(
    box,
    color,
  );

  /// Draw a billboard texture
  void DrawBillboard(
    Camera3D camera,
    Texture texture,
    Vector3 position,
    num scale,
    Color tint,
  ) => _flat.DrawBillboard(
    camera,
    texture,
    position,
    scale.toDouble(),
    tint,
  );

  /// Draw a billboard texture defined by source
  void DrawBillboardRec(
    Camera3D camera,
    Texture texture,
    Rectangle source,
    Vector3 position,
    Vector2 size,
    Color tint,
  ) => _flat.DrawBillboardRec(
    camera,
    texture,
    source,
    position,
    size,
    tint,
  );

  /// Draw a billboard texture defined by source and rotation
  @Deprecated(
    "On Dart < 3.14.0, the trailing Color argument is corrupted (or crashes) "
    "once the preceding float-only args exceed the 8 float registers "
    "(dart-lang/sdk#63976). Fixed in Dart 3.14.0; ignore on newer SDKs, "
    "otherwise use DrawBillboard."
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
  ) => _flat.DrawBillboardPro(
    camera,
    texture,
    source,
    position,
    up,
    size,
    origin,
    rotation.toDouble(),
    tint,
  );
  
  /// Upload mesh vertex data in GPU and provide VAO/VBO ids
  void UploadMesh(
    Mesh mesh,
    bool dynamic,
  ) => _flat.UploadMesh(
    Mesh$.Ref1(mesh),
    dynamic,
  );
    
  /// Update mesh vertex data in GPU for a specific buffer index
  void UpdateMeshBuffer(
    Mesh mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => _flat.UpdateMeshBuffer(
    mesh,
    index.toInt(),
    TypedDataList$.Array(data),
    data.length,
    offset.toInt(),
  );
    
  /// Unload mesh data from CPU and GPU
  void UnloadMesh(
    Mesh mesh,
  ) => _flat.UnloadMesh(
    mesh,
  );
    
  /// Draw a 3d mesh with material and transform
  void DrawMesh(
    Mesh mesh,
    Material material,
    Matrix transform,
  ) => _flat.DrawMesh(
    mesh,
    material,
    transform,
  );
    
  /// Draw multiple mesh instances with material and different transforms
  void DrawMeshInstanced(
    Mesh mesh,
    Material material,
    List<Matrix> transforms,
  ) => _flat.DrawMeshInstanced(
    mesh,
    material,
    Matrix$.Array(transforms),
    transforms.length,
  );
    
  /// Compute mesh bounding box limits
  BoundingBox GetMeshBoundingBox(
    Mesh mesh,
  ) => _flat.GetMeshBoundingBox(
    mesh,
  );
    
  /// Compute mesh tangents
  void GenMeshTangents(
    Mesh mesh,
  ) => _flat.GenMeshTangents(
    Mesh$.Ref1(mesh),
  );
    
  /// Export mesh data to file, returns true on success
  bool ExportMesh(
    Mesh mesh,
    String fileName,
  ) => _flat.ExportMesh(
    mesh,
    String$.ValueOrNull(fileName),
  );
    
  /// Export mesh as code file (.h) defining multiple arrays of vertex attributes
  bool ExportMeshAsCode(
    Mesh mesh,
    String fileName,
  ) => _flat.ExportMeshAsCode(
    mesh,
    String$.ValueOrNull(fileName),
  );
    
  /// Generate polygonal mesh
  Mesh GenMeshPoly(
    num sides,
    num radius,
  ) => _flat.GenMeshPoly(
    sides.toInt(),
    radius.toDouble(),
  );
    
  /// Generate plane mesh (with subdivisions)
  Mesh GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => _flat.GenMeshPlane(
    width.toDouble(),
    length.toDouble(),
    resX.toInt(),
    resZ.toInt(),
  );
    
  /// Generate cuboid mesh
  Mesh GenMeshCube(
    num width,
    num height,
    num length,
  ) => _flat.GenMeshCube(
    width.toDouble(),
    height.toDouble(),
    length.toDouble(),
  );
    
  /// Generate sphere mesh (standard sphere)
  Mesh GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => _flat.GenMeshSphere(
    radius.toDouble(),
    rings.toInt(),
    slices.toInt(),
  );
    
  /// Generate half-sphere mesh (no bottom cap)
  Mesh GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => _flat.GenMeshHemiSphere(
    radius.toDouble(),
    rings.toInt(),
    slices.toInt(),
  );
    
  /// Generate cylinder mesh
  Mesh GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => _flat.GenMeshCylinder(
    radius.toDouble(),
    height.toDouble(),
    slices.toInt(),
  );
    
  /// Generate cone/pyramid mesh
  Mesh GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => _flat.GenMeshCone(
    radius.toDouble(),
    height.toDouble(),
    slices.toInt(),
  );
    
  /// Generate torus mesh
  Mesh GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => _flat.GenMeshTorus(
    radius.toDouble(),
    size.toDouble(),
    radSeg.toInt(),
    sides.toInt(),
  );
    
  /// Generate trefoil knot mesh
  Mesh GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => _flat.GenMeshKnot(
    radius.toDouble(),
    size.toDouble(),
    radSeg.toInt(),
    sides.toInt(),
  );
    
  /// Generate heightmap mesh from image data
  Mesh GenMeshHeightmap(
    Image heightmap,
    Vector3 size,
  ) => _flat.GenMeshHeightmap(
    heightmap,
    size,
  );
    
  /// Generate cubes-based map mesh from image data
  Mesh GenMeshCubicmap(
    Image cubicmap,
    Vector3 cubeSize,
  ) => _flat.GenMeshCubicmap(
    cubicmap,
    cubeSize,
  );
    
  /// Load materials from model file
  List<Material> LoadMaterials(
    String fileName,
  ) {
    final materialCount = Int$.Ref1();
    final materials = _flat.LoadMaterials(
      String$.ValueOrNull(fileName),
      materialCount,
    );
    return materials.readArray(materialCount.value);
  }
    
  /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  Material LoadMaterialDefault() => _flat.LoadMaterialDefault();
    
  /// Check if a material is valid (shader assigned, map textures loaded in GPU)
  bool IsMaterialValid(
    Material material,
  ) => _flat.IsMaterialValid(
    material,
  );
    
  /// Unload material from GPU memory (VRAM)
  void UnloadMaterial(
    Material material,
  ) => _flat.UnloadMaterial(
    material,
  );
    
  /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
  void SetMaterialTexture(
    Material material,
    MaterialMapIndex mapType,
    Texture texture,
  ) => material.maps[mapType.value].texture = texture;
    
  /// Set material for a mesh
  void SetModelMeshMaterial(
    Model model,
    num meshId,
    num materialId,
  ) {
    if (meshId >= model.meshes.length) {
      TraceLog(.LOG_WARNING, "MESH: Id greater than mesh count");
      return;
    }
    if (materialId >= model.materials.length) {
      TraceLog(.LOG_WARNING, "MATERIAL: Id greater than material count");
      return;
    }
    model.meshMaterial[meshId.toInt()] = materialId.toInt();
  }
    
  /// Load model animations from file
  List<ModelAnimation> LoadModelAnimations(
    String fileName,
  ) {
    final animCount = Int$.Ref1();
    final anims = _flat.LoadModelAnimations(
      String$.ValueOrNull(fileName),
      animCount,
    );
    return anims.readArray(animCount.value);
  }
    
  /// Update model animation pose (CPU)
  void UpdateModelAnimation(
    Model model,
    ModelAnimation anim,
    num frame,
  ) => _flat.UpdateModelAnimation(
    model,
    anim,
    frame.toDouble(),
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
  ) => _flat.UpdateModelAnimationEx(
    model,
    animA,
    frameA.toDouble(),
    animB,
    frameB.toDouble(),
    blend.toDouble(),
  );
    
  /// Unload animation array data
  void UnloadModelAnimations(
    List<ModelAnimation> animations,
  ) => _flat.UnloadModelAnimations(
    animations.first.getOp(),
    animations.length,
  );
    
  /// Check model animation skeleton match
  bool IsModelAnimationValid(
    Model model,
    ModelAnimation anim,
  ) => _flat.IsModelAnimationValid(
    model,
    anim,
  );
    
  /// Check collision between two spheres
  bool CheckCollisionSpheres(
    Vector3 center1,
    num radius1,
    Vector3 center2,
    num radius2,
  ) => _flat.CheckCollisionSpheres(
    center1,
    radius1.toDouble(),
    center2,
    radius2.toDouble(),
  );
    
  /// Check collision between two bounding boxes
  bool CheckCollisionBoxes(
    BoundingBox box1,
    BoundingBox box2,
  ) => _flat.CheckCollisionBoxes(
    box1,
    box2,
  );
    
  /// Check collision between box and sphere
  bool CheckCollisionBoxSphere(
    BoundingBox box,
    Vector3 center,
    num radius,
  ) => _flat.CheckCollisionBoxSphere(
    box,
    center,
    radius.toDouble(),
  );
    
  /// Get collision info between ray and sphere
  RayCollision GetRayCollisionSphere(
    Ray ray,
    Vector3 center,
    num radius,
  ) => _flat.GetRayCollisionSphere(
    ray,
    center,
    radius.toDouble(),
  );
    
  /// Get collision info between ray and box
  RayCollision GetRayCollisionBox(
    Ray ray,
    BoundingBox box,
  ) => _flat.GetRayCollisionBox(
    ray,
    box,
  );
    
  /// Get collision info between ray and mesh
  RayCollision GetRayCollisionMesh(
    Ray ray,
    Mesh mesh,
    Matrix transform,
  ) => _flat.GetRayCollisionMesh(
    ray,
    mesh,
    transform,
  );
    
  /// Get collision info between ray and triangle
  RayCollision GetRayCollisionTriangle(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
  ) => _flat.GetRayCollisionTriangle(
    ray,
    p1,
    p2,
    p3,
  );
    
  /// Get collision info between ray and quad
  RayCollision GetRayCollisionQuad(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
    Vector3 p4,
  ) => _flat.GetRayCollisionQuad(
    ray,
    p1,
    p2,
    p3,
    p4,
  );
}
