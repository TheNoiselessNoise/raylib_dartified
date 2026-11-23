part of '../../raylib_dartified.dart';

/// Backend-agnostic contract for the Raylib Core module.
///
/// Concrete platform implementations extend this to provide
/// the full API surface across different backends.
abstract class RaylibCoreFlat extends XPackageModule<Raylib> {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibCoreDartCaptureIds();

  RaylibCoreFlat(super.pkg);

  @override
  @nonVirtual
  void onDispose() {
    TraceLogCallbackBase.disposeRegistry();
    LoadFileDataCallbackBase.disposeRegistry();
    SaveFileDataCallbackBase.disposeRegistry();
    LoadFileTextCallbackBase.disposeRegistry();
    SaveFileTextCallbackBase.disposeRegistry();
  }

  /// Initialize window and OpenGL context
  void InitWindow(
    int width,
    int height,
    XPtr<XChar> title,
  );

  /// Close window and unload OpenGL context
  void CloseWindow();

  /// Check if application should close ([KeyboardKey.KEY_ESCAPE] pressed or windows close icon clicked)
  bool WindowShouldClose();

  /// Check if window has been initialized successfully
  bool IsWindowReady();

  /// Check if window is currently fullscreen
  bool IsWindowFullscreen();

  /// Check if window is currently hidden
  bool IsWindowHidden();

  /// Check if window is currently minimized
  bool IsWindowMinimized();

  /// Check if window is currently maximized
  bool IsWindowMaximized();

  /// Check if window is currently focused
  bool IsWindowFocused();

  /// Check if window has been resized last frame
  bool IsWindowResized();

  /// Check if one specific window flag is enabled
  bool IsWindowState(
    int flag,
  );

  /// Set window configuration state using flags
  void SetWindowState(
    int flags,
  );

  /// Clear window configuration state flags
  void ClearWindowState(
    int flags,
  );

  /// Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
  void ToggleFullscreen();

  /// Toggle window state: borderless windowed, resizes window to match monitor resolution
  void ToggleBorderlessWindowed();

  /// Set window state: maximized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MaximizeWindow();

  /// Set window state: minimized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MinimizeWindow();

  /// Set window state: not minimized/maximized
  void RestoreWindow();

  /// Set icon for window (single image, RGBA 32bit)
  void SetWindowIcon(
    Image image,
  );

  /// Set icon for window (multiple images, RGBA 32bit)
  void SetWindowIcons(
    XStructPtr<Image> images,
    int count,
  );

  /// Set title for window
  void SetWindowTitle(
    XPtr<XChar> title,
  );

  /// Set window position on screen
  void SetWindowPosition(
    int x,
    int y,
  );

  /// Set monitor for the current window
  void SetWindowMonitor(
    int monitor,
  );

  /// Set window minimum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMinSize(
    int width,
    int height,
  );

  /// Set window maximum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMaxSize(
    int width,
    int height,
  );

  /// Set window dimensions
  void SetWindowSize(
    int width,
    int height,
  );

  /// Set window opacity [0.0..1.0]
  void SetWindowOpacity(
    double opacity,
  );

  /// Set window focused
  void SetWindowFocused();

  /// Get native window handle
  XPtr<XVoid> GetWindowHandle();

  /// Get current screen width
  int GetScreenWidth();

  /// Get current screen height
  int GetScreenHeight();

  /// Get current render width (it considers HiDPI)
  int GetRenderWidth();

  /// Get current render height (it considers HiDPI)
  int GetRenderHeight();

  /// Get number of connected monitors
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorCount();

  /// Get current monitor where window is placed
  /// 
  /// **[!] Not implemented on WASM**
  int GetCurrentMonitor();

  /// Get specified monitor position
  /// 
  /// **[!] Not implemented on WASM**
  Vector2 GetMonitorPosition(
    int monitor,
  );

  /// Get specified monitor width (current video mode used by monitor)
  int GetMonitorWidth(
    int monitor,
  );

  /// Get specified monitor height (current video mode used by monitor)
  int GetMonitorHeight(
    int monitor,
  );

  /// Get specified monitor physical width in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalWidth(
    int monitor,
  );

  /// Get specified monitor physical height in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalHeight(
    int monitor,
  );

  /// Get specified monitor refresh rate
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorRefreshRate(
    int monitor,
  );

  /// Get window position XY on monitor
  Vector2 GetWindowPosition();

  /// Get window scale DPI factor
  Vector2 GetWindowScaleDPI();

  /// Get the human-readable, UTF-8 encoded name of the specified monitor
  /// 
  /// **[!] Not implemented on WASM**
  XPtr<XChar> GetMonitorName(
    int monitor,
  );

  /// Set clipboard text content
  void SetClipboardText(
    XPtr<XChar> text,
  );

  /// Get clipboard text content
  XPtr<XChar> GetClipboardText();

  /// Get clipboard image content
  Image GetClipboardImage();

  /// Enable waiting for events on EndDrawing(), no automatic event polling
  void EnableEventWaiting();

  /// Disable waiting for events on EndDrawing(), automatic events polling
  void DisableEventWaiting();

  /// Shows cursor
  void ShowCursor();

  /// Hides cursor
  void HideCursor();

  /// Check if cursor is not visible
  bool IsCursorHidden();

  /// Enables cursor (unlock cursor)
  void EnableCursor();

  /// Disables cursor (lock cursor)
  void DisableCursor();

  /// Check if cursor is on the screen
  bool IsCursorOnScreen();

  /// Set background color (framebuffer clear color)
  void ClearBackground(
    Color color,
  );

  /// Setup canvas (framebuffer) to start drawing
  void BeginDrawing();

  /// End canvas drawing and swap buffers (double buffering)
  void EndDrawing();

  /// Begin 2D mode with custom camera (2D)
  void BeginMode2D(
    Camera2D camera,
  );

  /// Ends 2D mode with custom camera
  void EndMode2D();

  /// Begin 3D mode with custom camera (3D)
  void BeginMode3D(
    Camera3D camera,
  );

  /// Ends 3D mode and returns to default 2D orthographic mode
  void EndMode3D();

  /// Begin drawing to render texture
  void BeginTextureMode(
    RenderTexture target,
  );

  /// Ends drawing to render texture
  void EndTextureMode();

  /// Begin custom shader drawing
  void BeginShaderMode(
    Shader shader,
  );

  /// End custom shader drawing (use default shader)
  void EndShaderMode();

  /// Begin blending mode (alpha, additive, multiplied, subtract, custom)
  void BeginBlendMode(
    int mode,
  );

  /// End blending mode (reset to default: alpha blending)
  void EndBlendMode();

  /// Begin scissor mode (define screen area for following drawing)
  void BeginScissorMode(
    int x,
    int y,
    int width,
    int height,
  );

  /// End scissor mode
  void EndScissorMode();

  /// Begin stereo rendering (requires VR simulator)
  void BeginVrStereoMode(
    VrStereoConfig config,
  );

  /// End stereo rendering (requires VR simulator)
  void EndVrStereoMode();

  /// Load VR stereo config for VR simulator device parameters
  VrStereoConfig LoadVrStereoConfig(
    VrDeviceInfo device,
  );

  /// Unload VR stereo config
  void UnloadVrStereoConfig(
    VrStereoConfig config,
  );

  /// Load shader from files and bind default locations
  Shader LoadShader(
    XPtr<XChar> vsFileName,
    XPtr<XChar> fsFileName,
  );

  /// Load shader from code strings and bind default locations
  Shader LoadShaderFromMemory(
    XPtr<XChar> vsCode,
    XPtr<XChar> fsCode,
  );

  /// Check if a shader is valid (loaded on GPU)
  bool IsShaderValid(
    Shader shader,
  );

  /// Get shader uniform location
  int GetShaderLocation(
    Shader shader,
    XPtr<XChar> uniformName,
  );

  /// Get shader attribute location
  int GetShaderLocationAttrib(
    Shader shader,
    XPtr<XChar> attribName,
  );

  /// Set shader uniform value
  @nonVirtual
  void SetShaderValue(
    Shader shader,
    int locIndex,
    XPtr<XVoid> value,
    int uniformType,
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
    int locIndex,
    XPtr<XVoid> value,
    int uniformType,
    int count,
  );

  /// Set shader uniform value (matrix 4x4)
  void SetShaderValueMatrix(
    Shader shader,
    int locIndex,
    Matrix mat,
  );

  /// Set shader uniform value for texture (sampler2d)
  void SetShaderValueTexture(
    Shader shader,
    int locIndex,
    Texture texture,
  );

  /// Unload shader from GPU memory (VRAM)
  void UnloadShader(
    Shader shader,
  );

  /// Get a ray trace from screen position (i.e mouse)
  Ray GetScreenToWorldRay(
    Vector2 position,
    Camera3D camera,
  );

  /// Get a ray trace from screen position (i.e mouse) in a viewport
  Ray GetScreenToWorldRayEx(
    Vector2 position,
    Camera3D camera,
    int width,
    int height,
  );

  /// Get the screen space position for a 3d world space position
  Vector2 GetWorldToScreen(
    Vector3 position,
    Camera3D camera,
  );

  /// Get size position for a 3d world space position
  Vector2 GetWorldToScreenEx(
    Vector3 position,
    Camera3D camera,
    int width,
    int height,
  );

  /// Get the screen space position for a 2d camera world space position
  Vector2 GetWorldToScreen2D(
    Vector2 position,
    Camera2D camera,
  );

  /// Get the world space position for a 2d camera screen space position
  Vector2 GetScreenToWorld2D(
    Vector2 position,
    Camera2D camera,
  );

  /// Get camera transform matrix (view matrix)
  Matrix GetCameraMatrix(
    Camera3D camera,
  );

  /// Get camera 2d transform matrix
  Matrix GetCameraMatrix2D(
    Camera2D camera,
  );

  /// Set target FPS (maximum)
  void SetTargetFPS(
    int fps,
  );

  /// Get time in seconds for last frame drawn (delta time)
  double GetFrameTime();

  /// Get elapsed time in seconds since InitWindow()
  double GetTime();

  /// Get current FPS
  int GetFPS();

  /// Swap back buffer with front buffer (screen drawing)
  void SwapScreenBuffer();

  /// Register all input events
  void PollInputEvents();

  /// Wait for some time (halt program execution)
  void WaitTime(
    double seconds,
  );

  /// Set the seed for the random number generator
  void SetRandomSeed(
    int seed,
  );

  /// Get a random value between min and max (both included)
  int GetRandomValue(
    int min,
    int max,
  );

  /// Load random values sequence, no values repeated, min and max included
  XPtr<XInt> LoadRandomSequence(
    int count,
    int min,
    int max,
  );

  /// Unload random values sequence
  void UnloadRandomSequence(
    XPtr<XInt> sequence,
  );

  /// Takes a screenshot of current screen (filename extension defines format)
  void TakeScreenshot(
    XPtr<XChar> fileName,
  );

  /// Setup init configuration flags (view [ConfigFlags])
  void SetConfigFlags(
    int flags,
  );

  /// Open URL with default system browser (if available)
  void OpenURL(
    XPtr<XChar> url,
  );

  /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
  void TraceLog(
    int logLevel,
    XPtr<XChar> text,
    // NOTE: missing va_list argument
  );

  /// Set the current threshold (minimum) log level
  void SetTraceLogLevel(
    int logLevel,
  );

  /// Set custom trace log
  void SetTraceLogCallback(
    XPtr<XFunction<TraceLogCallbackBase>> callback,
  );

  /// Set custom file binary data loader
  void SetLoadFileDataCallback(
    XPtr<XFunction<LoadFileDataCallbackBase>> callback,
  );

  /// Set custom file binary data saver
  void SetSaveFileDataCallback(
    XPtr<XFunction<SaveFileDataCallbackBase>> callback,
  );

  /// Set custom file text data loader
  void SetLoadFileTextCallback(
    XPtr<XFunction<LoadFileTextCallbackBase>> callback,
  );

  /// Set custom file text data saver
  void SetSaveFileTextCallback(
    XPtr<XFunction<SaveFileTextCallbackBase>> callback,
  );

  /// Load file data as byte array (read)
  XPtr<XUnsignedChar> LoadFileData(
    XPtr<XChar> fileName,
    XPtr<XInt> dataSize,
  );

  /// Unload file data allocated by LoadFileData()
  void UnloadFileData(
    XPtr<XUnsignedChar> data,
  );

  /// Save data to file from byte array (write), returns true on success
  bool SaveFileData(
    XPtr<XChar> fileName,
    XPtr<XVoid> data,
    int dataSize,
  );

  /// Export data to code (.h), returns true on success
  bool ExportDataAsCode(
    XPtr<XUnsignedChar> data,
    int dataSize,
    XPtr<XChar> fileName,
  );

  /// Load text data from file (read)
  XPtr<XChar> LoadFileText(
    XPtr<XChar> fileName,
  );

  /// Unload file text data allocated by LoadFileText()
  void UnloadFileText(
    XPtr<XChar> text,
  );

  /// Save text data to file (write), returns true on success
  bool SaveFileText(
    XPtr<XChar> fileName,
    XPtr<XChar> text,
  );
    
  /// Rename file (if exists)
  int FileRename(
    XPtr<XChar> fileName,
    XPtr<XChar> fileRename,
  );

  /// Remove file (if exists)
  int FileRemove(
    XPtr<XChar> fileName,
  );

  /// Copy file from one path to another, dstPath created if it doesn't exist
  int FileCopy(
    XPtr<XChar> srcPath,
    XPtr<XChar> dstPath,
  );

  /// Move file from one directory to another, dstPath created if it doesn't exist
  int FileMove(
    XPtr<XChar> srcPath,
    XPtr<XChar> dstPath,
  );

  /// Replace text in an existing file
  int FileTextReplace(
    XPtr<XChar> fileName,
    XPtr<XChar> search,
    XPtr<XChar> replacement,
  );

  /// Find text in existing file
  int FileTextFindIndex(
    XPtr<XChar> fileName,
    XPtr<XChar> search,
  );

  /// Check if file exists
  bool FileExists(
    XPtr<XChar> fileName,
  );

  /// Check if a directory path exists
  bool DirectoryExists(
    XPtr<XChar> dirPath,
  );

  /// Check file extension (including point: .png, .wav)
  bool IsFileExtension(
    XPtr<XChar> fileName,
    XPtr<XChar> ext,
  );

  /// Get file length in bytes
  int GetFileLength(
    XPtr<XChar> fileName,
  );

  /// Get extension for a filename (includes dot: '.png')
  XPtr<XChar> GetFileExtension(
    XPtr<XChar> fileName,
  );

  /// Get filename for a path string
  XPtr<XChar> GetFileName(
    XPtr<XChar> filePath,
  );

  /// Get filename without extension
  XPtr<XChar> GetFileNameWithoutExt(
    XPtr<XChar> filePath,
  );

  /// Get the file count in a directory
  int GetDirectoryFileCount(
    XPtr<XChar> dirPath,
  );

  /// Get the file count in a directory with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  int GetDirectoryFileCountEx(
    XPtr<XChar> basePath,
    XPtr<XChar> filter,
    bool scanSubdirs,
  );

  /// Get full path for a given fileName with path
  XPtr<XChar> GetDirectoryPath(
    XPtr<XChar> filePath,
  );

  /// Get previous directory path for a given path
  XPtr<XChar> GetPrevDirectoryPath(
    XPtr<XChar> dirPath,
  );

  /// Get current working directory
  XPtr<XChar> GetWorkingDirectory();

  /// Get the directory of the running application
  XPtr<XChar> GetApplicationDirectory();

  /// Create directories (including full path requested), returns 0 on success
  int MakeDirectory(
    XPtr<XChar> dirPath,
  );

  /// Change working directory, return true on success
  bool ChangeDirectory(
    XPtr<XChar> dir,
  );

  /// Check if a given path is a file or a directory
  bool IsPathFile(
    XPtr<XChar> path,
  );

  /// Check if fileName is valid for the platform/OS
  bool IsFileNameValid(
    XPtr<XChar> fileName,
  );

  /// Load directory filepaths
  FilePathList LoadDirectoryFiles(
    XPtr<XChar> dirPath,
  );

  /// Load directory filepaths with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  FilePathList LoadDirectoryFilesEx(
    XPtr<XChar> basePath,
    XPtr<XChar> filter,
    bool scanSubdirs,
  );

  /// Unload filepaths
  void UnloadDirectoryFiles(
    FilePathList files,
  );

  /// Check if a file has been dropped into window
  bool IsFileDropped();

  /// Load dropped filepaths
  FilePathList LoadDroppedFiles();

  /// Unload dropped filepaths
  void UnloadDroppedFiles(
    FilePathList files,
  );

  /// Get file modification time (last write time)
  int GetFileModTime(
    XPtr<XChar> fileName,
  );

  /// Compress data (DEFLATE algorithm)
  XPtr<XUnsignedChar> CompressData(
    XPtr<XUnsignedChar> data,
    int dataSize,
    XPtr<XInt> compDataSize,
  );

  /// Decompress data (DEFLATE algorithm)
  XPtr<XUnsignedChar> DecompressData(
    XPtr<XUnsignedChar> compData,
    int compDataSize,
    XPtr<XInt> dataSize,
  );

  /// Encode data to Base64 string
  XPtr<XChar> EncodeDataBase64(
    XPtr<XUnsignedChar> data,
    int dataSize,
    XPtr<XInt> outputSize,
  );

  /// Decode Base64 string data
  XPtr<XUnsignedChar> DecodeDataBase64(
    XPtr<XChar> data,
    XPtr<XInt> outputSize,
  );

  /// Compute CRC32 hash code
  int ComputeCRC32(
    XPtr<XUnsignedChar> data,
    int dataSize,
  );

  /// Compute MD5 hash code
  XPtr<XUnsignedInt> ComputeMD5(
    XPtr<XUnsignedChar> data,
    int dataSize,
  );

  /// Compute SHA1 hash code
  XPtr<XUnsignedInt> ComputeSHA1(
    XPtr<XUnsignedChar> data,
    int dataSize,
  );

  /// Compute SHA256 hash code
  XPtr<XUnsignedInt> ComputeSHA256(
    XPtr<XUnsignedChar> data,
    int dataSize,
  );

  /// Load automation events list from file, NULL for empty list
  AutomationEventList LoadAutomationEventList(
    XPtr<XChar> fileName,
  );

  /// Unload automation events list from file
  void UnloadAutomationEventList(
    AutomationEventList list,
  );

  /// Export automation events list as text file
  bool ExportAutomationEventList(
    AutomationEventList list,
    XPtr<XChar> fileName,
  );

  /// Set automation event list to record to
  void SetAutomationEventList(
    XStructPtr<AutomationEventList> list,
  );

  /// Set automation event internal base frame to start recording
  void SetAutomationEventBaseFrame(
    int frame,
  );

  /// Start recording automation events (AutomationEventList must be set)
  void StartAutomationEventRecording();

  /// Stop recording automation events
  void StopAutomationEventRecording();

  /// Play a recorded automation event
  void PlayAutomationEvent(
    AutomationEvent event,
  );

  /// Check if a key has been pressed once
  bool IsKeyPressed(
    int key,
  );

  /// Check if a key has been pressed again
  bool IsKeyPressedRepeat(
    int key,
  );

  /// Check if a key is being pressed
  bool IsKeyDown(
    int key,
  );

  /// Check if a key has been released once
  bool IsKeyReleased(
    int key,
  );

  /// Check if a key is NOT being pressed
  bool IsKeyUp(
    int key,
  );

  /// Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
  /// 
  /// **[!] Not implemented on WASM**
  XPtr<XChar> GetKeyName(
    int key,
  );

  /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
  int GetKeyPressed();

  /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
  int GetCharPressed();

  /// Set a custom key to exit program (default is ESC)
  void SetExitKey(
    int key,
  );

  /// Check if a gamepad is available
  bool IsGamepadAvailable(
    int gamepad,
  );

  /// Get gamepad internal name id
  XPtr<XChar> GetGamepadName(
    int gamepad,
  );

  /// Check if a gamepad button has been pressed once
  bool IsGamepadButtonPressed(
    int gamepad,
    int button,
  );

  /// Check if a gamepad button is being pressed
  bool IsGamepadButtonDown(
    int gamepad,
    int button,
  );

  /// Check if a gamepad button has been released once
  bool IsGamepadButtonReleased(
    int gamepad,
    int button,
  );

  /// Check if a gamepad button is NOT being pressed
  bool IsGamepadButtonUp(
    int gamepad,
    int button,
  );

  /// Get the last gamepad button pressed
  int GetGamepadButtonPressed();

  /// Get gamepad axis count for a gamepad
  int GetGamepadAxisCount(
    int gamepad,
  );

  /// Get axis movement value for a gamepad axis
  double GetGamepadAxisMovement(
    int gamepad,
    int axis,
  );

  /// Set internal gamepad mappings (SDL_GameControllerDB)
  int SetGamepadMappings(
    XPtr<XChar> mappings,
  );

  /// Set gamepad vibration for both motors (duration in seconds)
  void SetGamepadVibration(
    int gamepad,
    double leftMotor,
    double rightMotor,
    double duration,
  );

  /// Check if a mouse button has been pressed once
  bool IsMouseButtonPressed(
    int button,
  );

  /// Check if a mouse button is being pressed
  bool IsMouseButtonDown(
    int button,
  );

  /// Check if a mouse button has been released once
  bool IsMouseButtonReleased(
    int button,
  );

  /// Check if a mouse button is NOT being pressed
  bool IsMouseButtonUp(
    int button,
  );

  /// Get mouse position X
  int GetMouseX();

  /// Get mouse position Y
  int GetMouseY();

  /// Get mouse position XY
  Vector2 GetMousePosition();

  /// Get mouse delta between frames
  Vector2 GetMouseDelta();

  /// Set mouse position XY
  void SetMousePosition(
    int x,
    int y,
  );

  /// Set mouse offset
  void SetMouseOffset(
    int offsetX,
    int offsetY,
  );

  /// Set mouse scaling
  void SetMouseScale(
    double scaleX,
    double scaleY,
  );

  /// Get mouse wheel movement for X or Y, whichever is larger
  double GetMouseWheelMove();

  /// Get mouse wheel movement for both X and Y
  Vector2 GetMouseWheelMoveV();

  /// Set mouse cursor
  void SetMouseCursor(
    int cursor,
  );

  /// Get touch position X for touch point 0 (relative to screen size)
  int GetTouchX();

  /// Get touch position Y for touch point 0 (relative to screen size)
  int GetTouchY();

  /// Get touch position XY for a touch point index (relative to screen size)
  Vector2 GetTouchPosition(
    int index,
  );

  /// Get touch point identifier for given index
  int GetTouchPointId(
    int index,
  );

  /// Get number of touch points
  int GetTouchPointCount();

  /// Enable a set of gestures using flags [Gesture]
  void SetGesturesEnabled(
    int flags,
  );

  /// Check if a gesture have been detected
  bool IsGestureDetected(
    int gesture,
  );

  /// Get latest detected gesture
  int GetGestureDetected();

  /// Get gesture hold time in seconds
  double GetGestureHoldDuration();

  /// Get gesture drag vector
  Vector2 GetGestureDragVector();

  /// Get gesture drag angle
  double GetGestureDragAngle();

  /// Get gesture pinch delta
  Vector2 GetGesturePinchVector();

  /// Get gesture pinch angle
  double GetGesturePinchAngle();

  /// Process gesture event and translate it into gestures
  void ProcessGestureEvent(
    GestureEvent event,
  );

  /// Update gestures detected (must be called every frame)
  void UpdateGestures();

  /// Update camera position for selected mode
  void UpdateCamera(
    XStructPtr<Camera3D> camera,
    int mode,
  );

  /// Update camera movement/rotation
  void UpdateCameraPro(
    XStructPtr<Camera3D> camera,
    Vector3 movement,
    Vector3 rotation,
    double zoom,
  );

  /// Set texture and rectangle to be used on shapes drawing
  void SetShapesTexture(
    Texture texture,
    Rectangle source,
  );

  /// Get texture that is used for shapes drawing
  Texture GetShapesTexture();

  /// Get texture source rectangle that is used for shapes drawing
  Rectangle GetShapesTextureRectangle();

  /// Draw a pixel using geometry [Can be slow, use with care]
  void DrawPixel(
    int posX,
    int posY,
    Color color,
  );

  /// Draw a pixel using geometry (Vector version) [Can be slow, use with care]
  void DrawPixelV(
    Vector2 position,
    Color color,
  );

  /// Draw a line
  void DrawLine(
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    Color color,
  );

  /// Draw a line (using gl lines)
  void DrawLineV(
    Vector2 startPos,
    Vector2 endPos,
    Color color,
  );

  /// Draw a line (using triangles/quads)
  void DrawLineEx(
    Vector2 startPos,
    Vector2 endPos,
    double thick,
    Color color,
  );

  /// Draw lines sequence (using gl lines)
  void DrawLineStrip(
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  );

  /// Draw line segment cubic-bezier in-out interpolation
  void DrawLineBezier(
    Vector2 startPos,
    Vector2 endPos,
    double thick,
    Color color,
  );

  /// Draw a dashed line
  void DrawLineDashed(
    Vector2 startPos,
    Vector2 endPos,
    int dashSize,
    int spaceSize,
    Color color,
  );

  /// Draw a color-filled circle
  void DrawCircle(
    int centerX,
    int centerY,
    double radius,
    Color color,
  );

  /// Draw a piece of a circle
  void DrawCircleSector(
    Vector2 center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  );

  /// Draw circle sector outline
  void DrawCircleSectorLines(
    Vector2 center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  );

  /// Draw a gradient-filled circle
  void DrawCircleGradient(
    Vector2 center,
    double radius,
    Color inner,
    Color outer,
  );

  /// Draw a color-filled circle (Vector version)
  void DrawCircleV(
    Vector2 center,
    double radius,
    Color color,
  );

  /// Draw circle outline
  void DrawCircleLines(
    int centerX,
    int centerY,
    double radius,
    Color color,
  );

  /// Draw circle outline (Vector version)
  void DrawCircleLinesV(
    Vector2 center,
    double radius,
    Color color,
  );

  /// Draw ellipse
  void DrawEllipse(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    Color color,
  );

  /// Draw ellipse (Vector version)
  void DrawEllipseV(
    Vector2 center,
    double radiusH,
    double radiusV,
    Color color,
  );

  /// Draw ellipse outline
  void DrawEllipseLines(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    Color color,
  );

  /// Draw ellipse outline (Vector version)
  void DrawEllipseLinesV(
    Vector2 center,
    double radiusH,
    double radiusV,
    Color color,
  );

  /// Draw ring
  void DrawRing(
    Vector2 center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  );

  /// Draw ring outline
  void DrawRingLines(
    Vector2 center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  );

  /// Draw a color-filled rectangle
  void DrawRectangle(
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  );

  /// Draw a color-filled rectangle (Vector version)
  void DrawRectangleV(
    Vector2 position,
    Vector2 size,
    Color color,
  );

  /// Draw a color-filled rectangle
  void DrawRectangleRec(
    Rectangle rec,
    Color color,
  );

  /// Draw a color-filled rectangle with pro parameters
  void DrawRectanglePro(
    Rectangle rec,
    Vector2 origin,
    double rotation,
    Color color,
  );

  /// Draw a vertical-gradient-filled rectangle
  void DrawRectangleGradientV(
    int posX,
    int posY,
    int width,
    int height,
    Color top,
    Color bottom,
  );

  /// Draw a horizontal-gradient-filled rectangle
  void DrawRectangleGradientH(
    int posX,
    int posY,
    int width,
    int height,
    Color left,
    Color right,
  );

  /// Draw a gradient-filled rectangle with custom vertex colors
  void DrawRectangleGradientEx(
    Rectangle rec,
    Color topLeft,
    Color bottomLeft,
    Color topRight,
    Color bottomRight,
  );

  /// Draw rectangle outline
  void DrawRectangleLines(
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  );

  /// Draw rectangle outline with extended parameters
  void DrawRectangleLinesEx(
    Rectangle rec,
    double lineThick,
    Color color,
  );

  /// Draw rectangle with rounded edges
  void DrawRectangleRounded(
    Rectangle rec,
    double roundness,
    int segments,
    Color color,
  );

  /// Draw rectangle lines with rounded edges
  void DrawRectangleRoundedLines(
    Rectangle rec,
    double roundness,
    int segments,
    Color color,
  );

  /// Draw rectangle with rounded edges outline
  void DrawRectangleRoundedLinesEx(
    Rectangle rec,
    double roundness,
    int segments,
    double lineThick,
    Color color,
  );

  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  );

  /// Draw triangle outline (vertex in counter-clockwise order!)
  void DrawTriangleLines(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  );

  /// Draw a triangle fan defined by points (first vertex is the center)
  void DrawTriangleFan(
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip(
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  );

  /// Draw a regular polygon (Vector version)
  void DrawPoly(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    Color color,
  );

  /// Draw a polygon outline of n sides
  void DrawPolyLines(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    Color color,
  );

  /// Draw a polygon outline of n sides with extended parameters
  void DrawPolyLinesEx(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    double lineThick,
    Color color,
  );

  /// Draw spline: Linear, minimum 2 points
  void DrawSplineLinear(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  );

  /// Draw spline: B-Spline, minimum 4 points
  void DrawSplineBasis(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  );

  /// Draw spline: Catmull-Rom, minimum 4 points
  void DrawSplineCatmullRom(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  );

  /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
  void DrawSplineBezierQuadratic(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  );

  /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
  void DrawSplineBezierCubic(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  );

  /// Draw spline segment: Linear, 2 points
  void DrawSplineSegmentLinear(
    Vector2 p1,
    Vector2 p2,
    double thick,
    Color color,
  );

  /// Draw spline segment: B-Spline, 4 points
  void DrawSplineSegmentBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double thick,
    Color color,
  );

  /// Draw spline segment: Catmull-Rom, 4 points
  void DrawSplineSegmentCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double thick,
    Color color,
  );

  /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
  void DrawSplineSegmentBezierQuadratic(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    double thick,
    Color color,
  );

  /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
  void DrawSplineSegmentBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    double thick,
    Color color,
  );

  /// Get (evaluate) spline point: Linear
  Vector2 GetSplinePointLinear(
    Vector2 startPos,
    Vector2 endPos,
    double t,
  );

  /// Get (evaluate) spline point: B-Spline
  Vector2 GetSplinePointBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double t,
  );

  /// Get (evaluate) spline point: Catmull-Rom
  Vector2 GetSplinePointCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double t,
  );

  /// Get (evaluate) spline point: Quadratic Bezier
  Vector2 GetSplinePointBezierQuad(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    double t,
  );

  /// Get (evaluate) spline point: Cubic Bezier
  Vector2 GetSplinePointBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    double t,
  );

  /// Check collision between two rectangles
  bool CheckCollisionRecs(
    Rectangle rec1,
    Rectangle rec2,
  );

  /// Check collision between two circles
  bool CheckCollisionCircles(
    Vector2 center1,
    double radius1,
    Vector2 center2,
    double radius2,
  );

  /// Check collision between circle and rectangle
  bool CheckCollisionCircleRec(
    Vector2 center,
    double radius,
    Rectangle rec,
  );

  /// Check if circle collides with a line created betweeen two points [p1] and [p2]
  bool CheckCollisionCircleLine(
    Vector2 center,
    double radius,
    Vector2 p1,
    Vector2 p2,
  );

  /// Check if point is inside rectangle
  bool CheckCollisionPointRec(
    Vector2 point,
    Rectangle rec,
  );

  /// Check if point is inside circle
  bool CheckCollisionPointCircle(
    Vector2 point,
    Vector2 center,
    double radius,
  );

  /// Check if point is inside a triangle
  bool CheckCollisionPointTriangle(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
  );

  /// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
  bool CheckCollisionPointLine(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    int threshold,
  );

  /// Check if point is within a polygon described by array of vertices
  bool CheckCollisionPointPoly(
    Vector2 point,
    XStructPtr<Vector2> points,
    int pointCount,
  );

  /// Check the collision between two lines defined by two points each, returns collision point by reference
  bool CheckCollisionLines(
    Vector2 startPos1,
    Vector2 endPos1,
    Vector2 startPos2,
    Vector2 endPos2,
    XStructPtr<Vector2> collisionPoint,
  );

  /// Get collision rectangle for two rectangles collision
  Rectangle GetCollisionRec(
    Rectangle rec1,
    Rectangle rec2,
  );

  /// Load image from file into CPU memory (RAM)
  Image LoadImage(
    XPtr<XChar> fileName,
  );

  /// Load image from RAW file data
  Image LoadImageRaw(
    XPtr<XChar> fileName,
    int width,
    int height,
    int format,
    int headerSize,
  );

  /// Load image sequence from file (frames appended to image.data)
  Image LoadImageAnim(
    XPtr<XChar> fileName,
    XPtr<XInt> frames,
  );

  /// Load image sequence from memory buffer
  Image LoadImageAnimFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    XPtr<XInt> frames,
  );

  /// Load image from memory buffer, fileType refers to extension: i.e. '.png'
  Image LoadImageFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
  );

  /// Load image from GPU texture data
  Image LoadImageFromTexture(
    Texture texture,
  );

  /// Load image from screen buffer and (screenshot)
  Image LoadImageFromScreen();

  /// Check if an image is valid (data and parameters)
  bool IsImageValid(
    Image image,
  );

  /// Unload image from CPU memory (RAM)
  void UnloadImage(
    Image image,
  );

  /// Export image data to file, returns true on success
  bool ExportImage(
    Image image,
    XPtr<XChar> fileName,
  );

  /// Export image to memory buffer
  XPtr<XUint8> ExportImageToMemory(
    Image image,
    XPtr<XChar> fileType,
    XPtr<XInt> fileSize,
  );

  /// Export image as code file defining an array of bytes, returns true on success
  bool ExportImageAsCode(
    Image image,
    XPtr<XChar> fileName,
  );

  /// Generate image: plain color
  Image GenImageColor(
    int width,
    int height,
    Color color,
  );

  /// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
  Image GenImageGradientLinear(
    int width,
    int height,
    int direction,
    Color start,
    Color end,
  );

  /// Generate image: radial gradient
  Image GenImageGradientRadial(
    int width,
    int height,
    double density,
    Color inner,
    Color outer,
  );

  /// Generate image: square gradient
  Image GenImageGradientSquare(
    int width,
    int height,
    double density,
    Color inner,
    Color outer,
  );

  /// Generate image: checked
  Image GenImageChecked(
    int width,
    int height,
    int checksX,
    int checksY,
    Color col1,
    Color col2,
  );

  /// Generate image: white noise
  Image GenImageWhiteNoise(
    int width,
    int height,
    double factor,
  );

  /// Generate image: perlin noise
  Image GenImagePerlinNoise(
    int width,
    int height,
    int offsetX,
    int offsetY,
    double scale,
  );

  /// Generate image: cellular algorithm, bigger tileSize means bigger cells
  Image GenImageCellular(
    int width,
    int height,
    int tileSize,
  );

  /// Generate image: grayscale image from text data
  Image GenImageText(
    int width,
    int height,
    XPtr<XChar> text,
  );

  /// Create an image duplicate (useful for transformations)
  Image ImageCopy(
    Image image,
  );

  /// Create an image from another image piece
  Image ImageFromImage(
    Image image,
    Rectangle rec,
  );

  /// Create an image from a selected channel of another image (GRAYSCALE)
  Image ImageFromChannel(
    Image image,
    int selectedChannel,
  );

  /// Create an image from text (default font)
  Image ImageText(
    XPtr<XChar> text,
    int fontSize,
    Color color,
  );

  /// Create an image from text (custom sprite font)
  Image ImageTextEx(
    Font font,
    XPtr<XChar> text,
    double fontSize,
    double spacing,
    Color tint,
  );

  /// Convert image data to desired format
  void ImageFormat(
    XStructPtr<Image> image,
    int newFormat,
  );

  /// Convert image to POT (power-of-two)
  void ImageToPOT(
    XStructPtr<Image> image,
    Color fill,
  );

  /// Crop an image to a defined rectangle
  void ImageCrop(
    XStructPtr<Image> image,
    Rectangle crop,
  );

  /// Crop image depending on alpha value
  void ImageAlphaCrop(
    XStructPtr<Image> image,
    double threshold,
  );

  /// Clear alpha channel to desired color
  void ImageAlphaClear(
    XStructPtr<Image> image,
    Color color,
    double threshold,
  );

  /// Apply alpha mask to image
  void ImageAlphaMask(
    XStructPtr<Image> image,
    Image alphaMask,
  );

  /// Premultiply alpha channel
  void ImageAlphaPremultiply(
    XStructPtr<Image> image,
  );

  /// Apply Gaussian blur using a box blur approximation
  void ImageBlurGaussian(
    XStructPtr<Image> image,
    int blurSize,
  );

  /// Apply custom square convolution kernel to image
  void ImageKernelConvolution(
    XStructPtr<Image> image,
    XPtr<XFloat> kernel,
    int kernelSize,
  );

  /// Resize image (Bicubic scaling algorithm)
  void ImageResize(
    XStructPtr<Image> image,
    int newWidth,
    int newHeight,
  );

  /// Resize image (Nearest-Neighbor scaling algorithm)
  void ImageResizeNN(
    XStructPtr<Image> image,
    int newWidth,
    int newHeight,
  );

  /// Resize canvas and fill with color
  void ImageResizeCanvas(
    XStructPtr<Image> image,
    int newWidth,
    int newHeight,
    int offsetX,
    int offsetY,
    Color fill,
  );

  /// Compute all mipmap levels for a provided image
  void ImageMipmaps(
    XStructPtr<Image> image,
  );

  /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  void ImageDither(
    XStructPtr<Image> image,
    int rBpp,
    int gBpp,
    int bBpp,
    int aBpp,
  );

  /// Flip image vertically
  void ImageFlipVertical(
    XStructPtr<Image> image,
  );

  /// Flip image horizontally
  void ImageFlipHorizontal(
    XStructPtr<Image> image,
  );

  /// Rotate image by input angle in degrees (-359 to 359)
  void ImageRotate(
    XStructPtr<Image> image,
    int degrees,
  );

  /// Rotate image clockwise 90deg
  void ImageRotateCW(
    XStructPtr<Image> image,
  );

  /// Rotate image counter-clockwise 90deg
  void ImageRotateCCW(
    XStructPtr<Image> image,
  );

  /// Modify image color: tint
  void ImageColorTint(
    XStructPtr<Image> image,
    Color color,
  );

  /// Modify image color: invert
  void ImageColorInvert(
    XStructPtr<Image> image,
  );

  /// Modify image color: grayscale
  void ImageColorGrayscale(
    XStructPtr<Image> image,
  );

  /// Modify image color: contrast (-100 to 100)
  void ImageColorContrast(
    XStructPtr<Image> image,
    double contrast,
  );

  /// Modify image color: brightness (-255 to 255)
  void ImageColorBrightness(
    XStructPtr<Image> image,
    int brightness,
  );

  /// Modify image color: replace color
  void ImageColorReplace(
    XStructPtr<Image> image,
    Color color,
    Color replace,
  );

  /// Load color data from image as a Color array (RGBA - 32bit)
  XStructPtr<Color> LoadImageColors(
    Image image,
  );

  /// Load colors palette from image as a Color array (RGBA - 32bit)
  XStructPtr<Color> LoadImagePalette(
    Image image,
    int maxPaletteSize,
    XPtr<XInt> colorCount,
  );

  /// Unload color data loaded with LoadImageColors()
  void UnloadImageColors(
    XStructPtr<Color> colors,
  );

  /// Unload colors palette loaded with LoadImagePalette()
  void UnloadImagePalette(
    XStructPtr<Color> colors,
  );

  /// Get image alpha border rectangle
  Rectangle GetImageAlphaBorder(
    Image image,
    double threshold,
  );

  /// Get image pixel color at (x, y) position
  Color GetImageColor(
    Image image,
    int x,
    int y,
  );

  /// Clear image background with given color
  void ImageClearBackground(
    XStructPtr<Image> dst,
    Color color,
  );

  /// Draw pixel within an image
  void ImageDrawPixel(
    XStructPtr<Image> dst,
    int posX,
    int posY,
    Color color,
  );

  /// Draw pixel within an image (Vector version)
  void ImageDrawPixelV(
    XStructPtr<Image> dst,
    Vector2 position,
    Color color,
  );

  /// Draw line within an image
  void ImageDrawLine(
    XStructPtr<Image> dst,
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    Color color,
  );

  /// Draw line within an image (Vector version)
  void ImageDrawLineV(
    XStructPtr<Image> dst,
    Vector2 start,
    Vector2 end,
    Color color,
  );

  /// Draw a line defining thickness within an image
  void ImageDrawLineEx(
    XStructPtr<Image> dst,
    Vector2 start,
    Vector2 end,
    int thick,
    Color color,
  );

  /// Draw a filled circle within an image
  void ImageDrawCircle(
    XStructPtr<Image> dst,
    int centerX,
    int centerY,
    int radius,
    Color color,
  );

  /// Draw a filled circle within an image (Vector version)
  void ImageDrawCircleV(
    XStructPtr<Image> dst,
    Vector2 center,
    int radius,
    Color color,
  );

  /// Draw circle outline within an image
  void ImageDrawCircleLines(
    XStructPtr<Image> dst,
    int centerX,
    int centerY,
    int radius,
    Color color,
  );

  /// Draw circle outline within an image (Vector version)
  void ImageDrawCircleLinesV(
    XStructPtr<Image> dst,
    Vector2 center,
    int radius,
    Color color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangle(
    XStructPtr<Image> dst,
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  );

  /// Draw rectangle within an image (Vector version)
  void ImageDrawRectangleV(
    XStructPtr<Image> dst,
    Vector2 position,
    Vector2 size,
    Color color,
  );

  /// Draw rectangle within an image
  void ImageDrawRectangleRec(
    XStructPtr<Image> dst,
    Rectangle rec,
    Color color,
  );

  /// Draw rectangle lines within an image
  void ImageDrawRectangleLines(
    XStructPtr<Image> dst,
    Rectangle rec,
    int thick,
    Color color,
  );

  /// Draw triangle within an image
  void ImageDrawTriangle(
    XStructPtr<Image> dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  );

  /// Draw triangle with interpolated colors within an image
  void ImageDrawTriangleEx(
    XStructPtr<Image> dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color c1,
    Color c2,
    Color c3,
  );

  /// Draw triangle outline within an image
  void ImageDrawTriangleLines(
    XStructPtr<Image> dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  );

  /// Draw a triangle fan defined by points within an image (first vertex is the center)
  void ImageDrawTriangleFan(
    XStructPtr<Image> dst,
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  );

  /// Draw a triangle strip defined by points within an image
  void ImageDrawTriangleStrip(
    XStructPtr<Image> dst,
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  );

  /// Draw a source image within a destination image (tint applied to source)
  void ImageDraw(
    XStructPtr<Image> dst,
    Image src,
    Rectangle srcRec,
    Rectangle dstRec,
    Color tint,
  );

  /// Draw text (using default font) within an image (destination)
  void ImageDrawText(
    XStructPtr<Image> dst,
    XPtr<XChar> text,
    int posX,
    int posY,
    int fontSize,
    Color color,
  );

  /// Draw text (custom sprite font) within an image (destination)
  void ImageDrawTextEx(
    XStructPtr<Image> dst,
    Font font,
    XPtr<XChar> text,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  );

  /// Load texture from file into GPU memory (VRAM)
  Texture LoadTexture(
    XPtr<XChar> fileName,
  );

  /// Load texture from image data
  Texture LoadTextureFromImage(
    Image image,
  );

  /// Load cubemap from image, multiple image cubemap layouts supported
  Texture LoadTextureCubemap(
    Image image,
    int layout,
  );

  /// Load texture for rendering (framebuffer)
  RenderTexture LoadRenderTexture(
    int width,
    int height,
  );

  /// Check if a texture is valid (loaded in GPU)
  bool IsTextureValid(
    Texture texture,
  );

  /// Unload texture from GPU memory (VRAM)
  void UnloadTexture(
    Texture texture,
  );

  /// Check if a render texture is valid (loaded in GPU)
  bool IsRenderTextureValid(
    RenderTexture target,
  );

  /// Unload render texture from GPU memory (VRAM)
  void UnloadRenderTexture(
    RenderTexture target,
  );

  /// Update GPU texture with new data
  void UpdateTexture(
    Texture texture,
    XPtr<XVoid> pixels,
  );

  /// Update GPU texture rectangle with new data
  void UpdateTextureRec(
    Texture texture,
    Rectangle rec,
    XPtr<XVoid> pixels,
  );

  /// Generate GPU mipmaps for a texture
  void GenTextureMipmaps(
    XStructPtr<Texture> texture,
  );

  /// Set texture scaling filter mode
  void SetTextureFilter(
    Texture texture,
    int filter,
  );

  /// Set texture wrapping mode
  void SetTextureWrap(
    Texture texture,
    int wrap,
  );

  /// Draw a Texture2D
  void DrawTexture(
    Texture texture,
    int posX,
    int posY,
    Color tint,
  );

  /// Draw a Texture2D with position defined as Vector2
  void DrawTextureV(
    Texture texture,
    Vector2 position,
    Color tint,
  );

  /// Draw a Texture2D with extended parameters
  void DrawTextureEx(
    Texture texture,
    Vector2 position,
    double rotation,
    double scale,
    Color tint,
  );

  /// Draw a part of a texture defined by a rectangle
  void DrawTextureRec(
    Texture texture,
    Rectangle source,
    Vector2 position,
    Color tint,
  );

  /// Draw a part of a texture defined by a rectangle with 'pro' parameters
  void DrawTexturePro(
    Texture texture,
    Rectangle source,
    Rectangle dest,
    Vector2 origin,
    double rotation,
    Color tint,
  );

  /// Draws a texture (or part of it) that stretches or shrinks nicely
  void DrawTextureNPatch(
    Texture texture,
    NPatchInfo nPatchInfo,
    Rectangle dest,
    Vector2 origin,
    double rotation,
    Color tint,
  );

  /// Check if two colors are equal
  bool ColorIsEqual(
    Color col1,
    Color col2,
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  Color Fade(
    Color color,
    double alpha,
  );

  /// Get hexadecimal value for a Color (0xRRGGBBAA)
  int ColorToInt(
    Color color,
  );

  /// Get Color normalized as float [0..1]
  Vector4 ColorNormalize(
    Color color,
  );

  /// Get Color from normalized values [0..1]
  Color ColorFromNormalized(
    Vector4 normalized,
  );

  /// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
  Vector3 ColorToHSV(
    Color color,
  );

  /// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
  Color ColorFromHSV(
    double hue,
    double saturation,
    double value,
  );

  /// Get color multiplied with another color
  Color ColorTint(
    Color color,
    Color tint,
  );

  /// Get color with brightness correction, brightness factor goes from -1.0 to 1.0
  Color ColorBrightness(
    Color color,
    double factor,
  );

  /// Get color with contrast correction, contrast values between -1.0 and 1.0
  Color ColorContrast(
    Color color,
    double contrast,
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  Color ColorAlpha(
    Color color,
    double alpha,
  );

  /// Get src alpha-blended into dst color with tint
  Color ColorAlphaBlend(
    Color dst,
    Color src,
    Color tint,
  );

  /// Get color lerp interpolation between two colors, factor [0.0..1.0]
  Color ColorLerp(
    Color color1,
    Color color2,
    double factor,
  );

  /// Get Color structure from hexadecimal value
  Color GetColor(
    int hexValue,
  );

  /// Get Color from a source pixel pointer of certain format
  Color GetPixelColor(
    XPtr<XVoid> srcPtr,
    int format,
  );

  /// Set color formatted into destination pixel pointer
  void SetPixelColor(
    XPtr<XVoid> dstPtr,
    Color color,
    int format,
  );

  /// Get pixel data size in bytes for certain format
  int GetPixelDataSize(
    int width,
    int height,
    int format,
  );

  /// Get the default Font
  Font GetFontDefault();

  /// Load font from file into GPU memory (VRAM)
  Font LoadFont(
    XPtr<XChar> fileName,
  );

  /// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
  Font LoadFontEx(
    XPtr<XChar> fileName,
    int fontSize,
    XPtr<XInt> codepoints,
    int codepointCount,
  );

  /// Load font from Image (XNA style)
  Font LoadFontFromImage(
    Image image,
    Color key,
    int firstChar,
  );

  /// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  Font LoadFontFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    int fontSize,
    XPtr<XInt> codepoints,
    int codepointCount,
  );

  /// Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
  bool IsFontValid(
    Font font,
  );

  /// Load font data for further use
  XStructPtr<GlyphInfo> LoadFontData(
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    int fontSize,
    XPtr<XInt> codepoints,
    int codepointCount,
    int type,
    XPtr<XInt> glyphCount,
  );

  /// Generate image font atlas using chars info
  Image GenImageFontAtlas(
    XStructPtr<GlyphInfo> glyphs,
    XPtr<XPtrType<XStructType>> glyphRecs, // RectangleD
    int glyphCount,
    int fontSize,
    int padding,
    int packMethod,
  );

  /// Unload font chars info data (RAM)
  void UnloadFontData(
    XStructPtr<GlyphInfo> glyphs,
    int glyphCount,
  );

  /// Unload font from GPU memory (VRAM)
  void UnloadFont(
    Font font,
  );

  /// Export font as code file, returns true on success
  bool ExportFontAsCode(
    Font font,
    XPtr<XChar> fileName,
  );

  /// Draw current FPS
  void DrawFPS(
    int posX,
    int posY,
  );

  /// Draw text (using default font)
  void DrawText(
    XPtr<XChar> text,
    int posX,
    int posY,
    int fontSize,
    Color color,
  );

  /// Draw text using font and additional parameters
  void DrawTextEx(
    Font font,
    XPtr<XChar> text,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  );

  /// Draw text using Font and pro parameters (rotation)
  void DrawTextPro(
    Font font,
    XPtr<XChar> text,
    Vector2 position,
    Vector2 origin,
    double rotation,
    double fontSize,
    double spacing,
    Color tint,
  );

  /// Draw one character (codepoint)
  void DrawTextCodepoint(
    Font font,
    int codepoint,
    Vector2 position,
    double fontSize,
    Color tint,
  );

  /// Draw multiple character (codepoint)
  void DrawTextCodepoints(
    Font font,
    XPtr<XInt> codepoints,
    int codepointCount,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  );

  /// Set vertical line spacing when drawing with line-breaks
  void SetTextLineSpacing(
    int spacing,
  );

  /// Measure string width for default font
  int MeasureText(
    XPtr<XChar> text,
    int fontSize,
  );

  /// Measure string size for Font
  Vector2 MeasureTextEx(
    Font font,
    XPtr<XChar> text,
    double fontSize,
    double spacing,
  );

  /// Measure string size for an existing array of codepoints for Font
  Vector2 MeasureTextCodepoints(
    Font font,
    XPtr<XInt> codepoints,
    int length,
    double fontSize,
    double spacing,
  );

  /// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  int GetGlyphIndex(
    Font font,
    int codepoint,
  );

  /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  GlyphInfo GetGlyphInfo(
    Font font,
    int codepoint,
  );

  /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  Rectangle GetGlyphAtlasRec(
    Font font,
    int codepoint,
  );

  /// Load UTF-8 text encoded from codepoints array
  XPtr<XChar> LoadUTF8(
    XPtr<XInt> codepoints,
    int length,
  );

  /// Unload UTF-8 text encoded from codepoints array
  void UnloadUTF8(
    XPtr<XChar> text,
  );

  /// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
  XPtr<XInt> LoadCodepoints(
    XPtr<XChar> text,
    XPtr<XInt> count,
  );

  /// Unload codepoints data from memory
  void UnloadCodepoints(
    XPtr<XInt> codepoints,
  );

  /// Get total number of codepoints in a UTF-8 encoded string
  int GetCodepointCount(
    XPtr<XChar> text,
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  int GetCodepoint(
    XPtr<XChar> text,
    XPtr<XInt> codepointSize,
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  int GetCodepointNext(
    XPtr<XChar> text,
    XPtr<XInt> codepointSize,
  );

  /// Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  int GetCodepointPrevious(
    XPtr<XChar> text,
    XPtr<XInt> codepointSize,
  );

  /// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
  XPtr<XChar> CodepointToUTF8(
    int codepoint,
    XPtr<XInt> utf8Size,
  );

  /// Load text as separate lines ('\n')
  XPtr<XPtrType<XChar>> LoadTextLines(
    XPtr<XChar> text,
    XPtr<XInt> count,
  );

  /// Unload text lines
  void UnloadTextLines(
    XPtr<XPtrType<XChar>> text,
    int lineCount,
  );

  /// Copy one string to another, returns bytes copied
  int TextCopy(
    XPtr<XChar> dst,
    XPtr<XChar> src,
  );

  /// Check if two text string are equal
  bool TextIsEqual(
    XPtr<XChar> text1,
    XPtr<XChar> text2,
  );

  /// Get text length
  int TextLength(
    XPtr<XChar> text,
  );

  /// Text formatting with variables (sprintf() style)
  @nonVirtual
  @Deprecated('va_list is not supported')
  XPtr<XChar> TextFormat(
    XPtr<XChar> text,
  ) => text;

  /// Get a piece of a text string
  XPtr<XChar> TextSubtext(
    XPtr<XChar> text,
    int position,
    int length,
  );

  /// Remove text spaces, concat words
  XPtr<XChar> TextRemoveSpaces(
    XPtr<XChar> text,
  );

  /// Get text between two strings
  XPtr<XChar> GetTextBetween(
    XPtr<XChar> text,
    XPtr<XChar> begin,
    XPtr<XChar> end,
  );

  /// Replace text string with new string
  XPtr<XChar> TextReplace(
    XPtr<XChar> text,
    XPtr<XChar> replace,
    XPtr<XChar> by,
  );

  /// Replace text string with new string, memory must be freed
  XPtr<XChar> TextReplaceAlloc(
    XPtr<XChar> text,
    XPtr<XChar> replace,
    XPtr<XChar> by,
  );

  /// Replace text between two specific strings
  XPtr<XChar> TextReplaceBetween(
    XPtr<XChar> text,
    XPtr<XChar> begin,
    XPtr<XChar> end,
    XPtr<XChar> replacement,
  );

  /// Replace text between two specific strings, memory must be freed
  XPtr<XChar> TextReplaceBetweenAlloc(
    XPtr<XChar> text,
    XPtr<XChar> begin,
    XPtr<XChar> end,
    XPtr<XChar> replacement,
  );

  /// Insert text in a defined byte position
  XPtr<XChar> TextInsert(
    XPtr<XChar> text,
    XPtr<XChar> insert,
    int position,
  );

  /// Insert text in a defined byte position, memory must be freed
  XPtr<XChar> TextInsertAlloc(
    XPtr<XChar> text,
    XPtr<XChar> insert,
    int position,
  );

  /// Join text strings with delimiter ([delimiter] is expected to be length of 1)
  XPtr<XChar> TextJoin(
    XPtr<XPtrType<XChar>> textList,
    int count,
    XPtr<XChar> delimiter,
  );

  /// Split text into multiple strings
  XPtr<XPtrType<XChar>> TextSplit(
    XPtr<XChar> text,
    int delimiter,
    XPtr<XInt> count,
  );

  /// Append text at specific position and move cursor
  void TextAppend(
    XPtr<XChar> text,
    XPtr<XChar> append,
    XPtr<XInt> position,
  );

  /// Find first text occurrence within a string, -1 if not found
  int TextFindIndex(
    XPtr<XChar> text,
    XPtr<XChar> find,
  );

  /// Get upper case version of provided string
  XPtr<XChar> TextToUpper(
    XPtr<XChar> text,
  );

  /// Get lower case version of provided string
  XPtr<XChar> TextToLower(
    XPtr<XChar> text,
  );

  /// Get Pascal case notation version of provided string
  XPtr<XChar> TextToPascal(
    XPtr<XChar> text,
  );

  /// Get Snake case notation version of provided string
  XPtr<XChar> TextToSnake(
    XPtr<XChar> text,
  );

  /// Get Camel case notation version of provided string
  XPtr<XChar> TextToCamel(
    XPtr<XChar> text,
  );

  /// Get integer value from text
  int TextToInteger(
    XPtr<XChar> text,
  );

  /// Get float value from text
  double TextToFloat(
    XPtr<XChar> text,
  );

  /// Draw a line in 3D world space
  void DrawLine3D(
    Vector3 startPos,
    Vector3 endPos,
    Color color,
  );

  /// Draw a point in 3D space, actually a small line
  void DrawPoint3D(
    Vector3 position,
    Color color,
  );

  /// Draw a circle in 3D world space
  void DrawCircle3D(
    Vector3 center,
    double radius,
    Vector3 rotationAxis,
    double rotationAngle,
    Color color,
  );

  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle3D(
    Vector3 v1,
    Vector3 v2,
    Vector3 v3,
    Color color,
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip3D(
    XStructPtr<Vector3> points,
    int pointCount,
    Color color,
  );

  /// Draw cube
  void DrawCube(
    Vector3 position,
    double width,
    double height,
    double length,
    Color color,
  );

  /// Draw cube (Vector version)
  void DrawCubeV(
    Vector3 position,
    Vector3 size,
    Color color,
  );

  /// Draw cube wires
  void DrawCubeWires(
    Vector3 position,
    double width,
    double height,
    double length,
    Color color,
  );

  /// Draw cube wires (Vector version)
  void DrawCubeWiresV(
    Vector3 position,
    Vector3 size,
    Color color,
  );

  /// Draw sphere
  void DrawSphere(
    Vector3 centerPos,
    double radius,
    Color color,
  );

  /// Draw sphere with extended parameters
  void DrawSphereEx(
    Vector3 centerPos,
    double radius,
    int rings,
    int slices,
    Color color,
  );

  /// Draw sphere wires
  void DrawSphereWires(
    Vector3 centerPos,
    double radius,
    int rings,
    int slices,
    Color color,
  );

  /// Draw a cylinder/cone
  void DrawCylinder(
    Vector3 position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    Color color,
  );

  /// Draw a cylinder with base at startPos and top at endPos
  void DrawCylinderEx(
    Vector3 startPos,
    Vector3 endPos,
    double startRadius,
    double endRadius,
    int sides,
    Color color,
  );

  /// Draw a cylinder/cone wires
  void DrawCylinderWires(
    Vector3 position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    Color color,
  );

  /// Draw a cylinder wires with base at startPos and top at endPos
  void DrawCylinderWiresEx(
    Vector3 startPos,
    Vector3 endPos,
    double startRadius,
    double endRadius,
    int sides,
    Color color,
  );

  /// Draw a capsule with the center of its sphere caps at startPos and endPos
  void DrawCapsule(
    Vector3 startPos,
    Vector3 endPos,
    double radius,
    int slices,
    int rings,
    Color color,
  );

  /// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  void DrawCapsuleWires(
    Vector3 startPos,
    Vector3 endPos,
    double radius,
    int slices,
    int rings,
    Color color,
  );

  /// Draw a plane XZ
  void DrawPlane(
    Vector3 centerPos,
    Vector2 size,
    Color color,
  );

  /// Draw a ray line
  void DrawRay(
    Ray ray,
    Color color,
  );

  /// Draw a grid (centered at (0, 0, 0))
  void DrawGrid(
    int slices,
    double spacing,
  );

  /// Load model from files (meshes and materials)
  Model LoadModel(
    XPtr<XChar> fileName,
  );

  /// Load model from generated mesh (default material)
  Model LoadModelFromMesh(
    Mesh mesh,
  );

  /// Check if a model is valid (loaded in GPU, VAO/VBOs)
  bool IsModelValid(
    Model model,
  );

  /// Unload model (including meshes) from memory (RAM and/or VRAM)
  void UnloadModel(
    Model model,
  );

  /// Compute model bounding box limits (considers all meshes)
  BoundingBox GetModelBoundingBox(
    Model model,
  );

  /// Draw a model (with texture if set)
  void DrawModel(
    Model model,
    Vector3 position,
    double scale,
    Color tint,
  );

  /// Draw a model with extended parameters
  void DrawModelEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    double rotationAngle,
    Vector3 scale,
    Color tint,
  );

  /// Draw a model wires (with texture if set)
  void DrawModelWires(
    Model model,
    Vector3 position,
    double scale,
    Color tint,
  );

  /// Draw a model wires (with texture if set) with extended parameters
  void DrawModelWiresEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    double rotationAngle,
    Vector3 scale,
    Color tint,
  );

  /// Draw bounding box (wires)
  void DrawBoundingBox(
    BoundingBox box,
    Color color,
  );

  /// Draw a billboard texture
  void DrawBillboard(
    Camera3D camera,
    Texture texture,
    Vector3 position,
    double scale,
    Color tint,
  );

  /// Draw a billboard texture defined by source
  void DrawBillboardRec(
    Camera3D camera,
    Texture texture,
    Rectangle source,
    Vector3 position,
    Vector2 size,
    Color tint,
  );

  /// Draw a billboard texture defined by source and rotation
  void DrawBillboardPro(
    Camera3D camera,
    Texture texture,
    Rectangle source,
    Vector3 position,
    Vector3 up,
    Vector2 size,
    Vector2 origin,
    double rotation,
    Color tint,
  );

  /// Upload mesh vertex data in GPU and provide VAO/VBO ids
  void UploadMesh(
    XStructPtr<Mesh> mesh,
    bool dynamic,
  );

  /// Update mesh vertex data in GPU for a specific buffer index
  void UpdateMeshBuffer(
    Mesh mesh,
    int index,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  );

  /// Unload mesh data from CPU and GPU
  void UnloadMesh(
    Mesh mesh,
  );

  /// Draw a 3d mesh with material and transform
  void DrawMesh(
    Mesh mesh,
    Material material,
    Matrix transform,
  );

  /// Draw multiple mesh instances with material and different transforms
  void DrawMeshInstanced(
    Mesh mesh,
    Material material,
    XStructPtr<Matrix> transforms,
    int instances,
  );

  /// Compute mesh bounding box limits
  BoundingBox GetMeshBoundingBox(
    Mesh mesh,
  );

  /// Compute mesh tangents
  void GenMeshTangents(
    XStructPtr<Mesh> mesh,
  );

  /// Export mesh data to file, returns true on success
  bool ExportMesh(
    Mesh mesh,
    XPtr<XChar> fileName,
  );

  /// Export mesh as code file (.h) defining multiple arrays of vertex attributes
  bool ExportMeshAsCode(
    Mesh mesh,
    XPtr<XChar> fileName,
  );

  /// Generate polygonal mesh
  Mesh GenMeshPoly(
    int sides,
    double radius,
  );

  /// Generate plane mesh (with subdivisions)
  Mesh GenMeshPlane(
    double width,
    double length,
    int resX,
    int resZ,
  );

  /// Generate cuboid mesh
  Mesh GenMeshCube(
    double width,
    double height,
    double length,
  );

  /// Generate sphere mesh (standard sphere)
  Mesh GenMeshSphere(
    double radius,
    int rings,
    int slices,
  );

  /// Generate half-sphere mesh (no bottom cap)
  Mesh GenMeshHemiSphere(
    double radius,
    int rings,
    int slices,
  );

  /// Generate cylinder mesh
  Mesh GenMeshCylinder(
    double radius,
    double height,
    int slices,
  );

  /// Generate cone/pyramid mesh
  Mesh GenMeshCone(
    double radius,
    double height,
    int slices,
  );

  /// Generate torus mesh
  Mesh GenMeshTorus(
    double radius,
    double size,
    int radSeg,
    int sides,
  );

  /// Generate trefoil knot mesh
  Mesh GenMeshKnot(
    double radius,
    double size,
    int radSeg,
    int sides,
  );

  /// Generate heightmap mesh from image data
  Mesh GenMeshHeightmap(
    Image heightmap,
    Vector3 size,
  );

  /// Generate cubes-based map mesh from image data
  Mesh GenMeshCubicmap(
    Image cubicmap,
    Vector3 cubeSize,
  );

  /// Load materials from model file
  XStructPtr<Material> LoadMaterials(
    XPtr<XChar> fileName,
    XPtr<XInt> materialCount,
  );

  /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  Material LoadMaterialDefault();

  /// Check if a material is valid (shader assigned, map textures loaded in GPU)
  bool IsMaterialValid(
    Material material,
  );

  /// Unload material from GPU memory (VRAM)
  void UnloadMaterial(
    Material material,
  );

  /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
  void SetMaterialTexture(
    XStructPtr<Material> material,
    int mapType,
    Texture texture,
  );

  /// Set material for a mesh
  void SetModelMeshMaterial(
    XStructPtr<Model> model,
    int meshId,
    int materialId,
  );

  /// Load model animations from file
  XStructPtr<ModelAnimation> LoadModelAnimations(
    XPtr<XChar> fileName,
    XPtr<XInt> animCount,
  );

  /// Update model animation pose (CPU)
  void UpdateModelAnimation(
    Model model,
    ModelAnimation anim,
    double frame,
  );

  /// Update model animation data (vertex buffers / bone matrices) for a specific pose,
  /// defined by two different animations at specific frames blended together
  void UpdateModelAnimationEx(
    Model model,
    ModelAnimation animA,
    double frameA,
    ModelAnimation animB,
    double frameB,
    double blend,
  );

  /// Unload animation array data
  void UnloadModelAnimations(
    XStructPtr<ModelAnimation> animations,
    int animCount,
  );

  /// Check model animation skeleton match
  bool IsModelAnimationValid(
    Model model,
    ModelAnimation anim,
  );

  /// Check collision between two spheres
  bool CheckCollisionSpheres(
    Vector3 center1,
    double radius1,
    Vector3 center2,
    double radius2,
  );

  /// Check collision between two bounding boxes
  bool CheckCollisionBoxes(
    BoundingBox box1,
    BoundingBox box2,
  );

  /// Check collision between box and sphere
  bool CheckCollisionBoxSphere(
    BoundingBox box,
    Vector3 center,
    double radius,
  );

  /// Get collision info between ray and sphere
  RayCollision GetRayCollisionSphere(
    Ray ray,
    Vector3 center,
    double radius,
  );

  /// Get collision info between ray and box
  RayCollision GetRayCollisionBox(
    Ray ray,
    BoundingBox box,
  );

  /// Get collision info between ray and mesh
  RayCollision GetRayCollisionMesh(
    Ray ray,
    Mesh mesh,
    Matrix transform,
  );

  /// Get collision info between ray and triangle
  RayCollision GetRayCollisionTriangle(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
  );

  /// Get collision info between ray and quad
  RayCollision GetRayCollisionQuad(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
    Vector3 p4,
  );
}
