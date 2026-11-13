part of '../../../raylib_dartified.dart';

class RaylibCore extends RaylibModule<Raylib> {
  RaylibCore(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  /// Initialize window and OpenGL context
  void InitWindow(int width, int height, Pointer<Char> title)
    => _InitWindow(width, height, title);
  late final _InitWindowPtr = _lookup<NativeFunction<Void Function(Int, Int, Pointer<Char>)>>('InitWindow');
  late final _InitWindow = _InitWindowPtr.asFunction<void Function(int, int, Pointer<Char>)>();

  /// Close window and unload OpenGL context
  void CloseWindow()
    => _CloseWindow();
  late final _CloseWindowPtr = _lookup<NativeFunction<Void Function()>>('CloseWindow');
  late final _CloseWindow = _CloseWindowPtr.asFunction<void Function()>();

  /// Check if application should close ([KeyboardKey.KEY_ESCAPE] pressed or windows close icon clicked)
  bool WindowShouldClose()
    => _WindowShouldClose();
  late final _WindowShouldClosePtr = _lookup<NativeFunction<Bool Function()>>('WindowShouldClose');
  late final _WindowShouldClose = _WindowShouldClosePtr.asFunction<bool Function()>();

  /// Check if window has been initialized successfully
  bool IsWindowReady()
    => _IsWindowReady();
  late final _IsWindowReadyPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowReady');
  late final _IsWindowReady = _IsWindowReadyPtr.asFunction<bool Function()>();

  /// Check if window is currently fullscreen
  bool IsWindowFullscreen()
    => _IsWindowFullscreen();
  late final _IsWindowFullscreenPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowFullscreen');
  late final _IsWindowFullscreen = _IsWindowFullscreenPtr.asFunction<bool Function()>();

  /// Check if window is currently hidden
  bool IsWindowHidden()
    => _IsWindowHidden();
  late final _IsWindowHiddenPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowHidden');
  late final _IsWindowHidden = _IsWindowHiddenPtr.asFunction<bool Function()>();

  /// Check if window is currently minimized
  bool IsWindowMinimized()
    => _IsWindowMinimized();
  late final _IsWindowMinimizedPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowMinimized');
  late final _IsWindowMinimized = _IsWindowMinimizedPtr.asFunction<bool Function()>();

  /// Check if window is currently maximized
  bool IsWindowMaximized()
    => _IsWindowMaximized();
  late final _IsWindowMaximizedPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowMaximized');
  late final _IsWindowMaximized = _IsWindowMaximizedPtr.asFunction<bool Function()>();

  /// Check if window is currently focused
  bool IsWindowFocused()
    => _IsWindowFocused();
  late final _IsWindowFocusedPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowFocused');
  late final _IsWindowFocused = _IsWindowFocusedPtr.asFunction<bool Function()>();

  /// Check if window has been resized last frame
  bool IsWindowResized()
    => _IsWindowResized();
  late final _IsWindowResizedPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowResized');
  late final _IsWindowResized = _IsWindowResizedPtr.asFunction<bool Function()>();

  /// Check if one specific window flag is enabled
  bool IsWindowState(int flag)
    => _IsWindowState(flag);
  late final _IsWindowStatePtr = _lookup<NativeFunction<Bool Function(UnsignedInt)>>('IsWindowState');
  late final _IsWindowState = _IsWindowStatePtr.asFunction<bool Function(int)>();

  /// Set window configuration state using flags
  void SetWindowState(int flags)
    => _SetWindowState(flags);
  late final _SetWindowStatePtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('SetWindowState');
  late final _SetWindowState = _SetWindowStatePtr.asFunction<void Function(int)>();

  /// Clear window configuration state flags
  void ClearWindowState(int flags)
    => _ClearWindowState(flags);
  late final _ClearWindowStatePtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('ClearWindowState');
  late final _ClearWindowState = _ClearWindowStatePtr.asFunction<void Function(int)>();

  /// Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
  void ToggleFullscreen()
    => _ToggleFullscreen();
  late final _ToggleFullscreenPtr = _lookup<NativeFunction<Void Function()>>('ToggleFullscreen');
  late final _ToggleFullscreen = _ToggleFullscreenPtr.asFunction<void Function()>();

  /// Toggle window state: borderless windowed, resizes window to match monitor resolution
  void ToggleBorderlessWindowed()
    => _ToggleBorderlessWindowed();
  late final _ToggleBorderlessWindowedPtr = _lookup<NativeFunction<Void Function()>>('ToggleBorderlessWindowed');
  late final _ToggleBorderlessWindowed = _ToggleBorderlessWindowedPtr.asFunction<void Function()>();

  /// Set window state: maximized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MaximizeWindow()
    => _MaximizeWindow();
  late final _MaximizeWindowPtr = _lookup<NativeFunction<Void Function()>>('MaximizeWindow');
  late final _MaximizeWindow = _MaximizeWindowPtr.asFunction<void Function()>();

  /// Set window state: minimized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MinimizeWindow()
    => _MinimizeWindow();
  late final _MinimizeWindowPtr = _lookup<NativeFunction<Void Function()>>('MinimizeWindow');
  late final _MinimizeWindow = _MinimizeWindowPtr.asFunction<void Function()>();

  /// Set window state: not minimized/maximized
  void RestoreWindow()
    => _RestoreWindow();
  late final _RestoreWindowPtr = _lookup<NativeFunction<Void Function()>>('RestoreWindow');
  late final _RestoreWindow = _RestoreWindowPtr.asFunction<void Function()>();

  /// Set icon for window (single image, RGBA 32bit)
  void SetWindowIcon(ImageC image)
    => _SetWindowIcon(image);
  late final _SetWindowIconPtr = _lookup<NativeFunction<Void Function(ImageC)>>('SetWindowIcon');
  late final _SetWindowIcon = _SetWindowIconPtr.asFunction<void Function(ImageC)>();

  /// Set icon for window (multiple images, RGBA 32bit)
  void SetWindowIcons(Pointer<ImageC> images, int count)
    => _SetWindowIcons(images, count);
  late final _SetWindowIconsPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('SetWindowIcons');
  late final _SetWindowIcons = _SetWindowIconsPtr.asFunction<void Function(Pointer<ImageC>, int)>();

  /// Set title for window
  void SetWindowTitle(Pointer<Char> title)
    => _SetWindowTitle(title);
  late final _SetWindowTitlePtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('SetWindowTitle');
  late final _SetWindowTitle = _SetWindowTitlePtr.asFunction<void Function(Pointer<Char>)>();

  /// Set window position on screen
  void SetWindowPosition(int x, int y)
    => _SetWindowPosition(x, y);
  late final _SetWindowPositionPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetWindowPosition');
  late final _SetWindowPosition = _SetWindowPositionPtr.asFunction<void Function(int, int)>();

  /// Set monitor for the current window
  void SetWindowMonitor(int monitor)
    => _SetWindowMonitor(monitor);
  late final _SetWindowMonitorPtr = _lookup<NativeFunction<Void Function(Int)>>('SetWindowMonitor');
  late final _SetWindowMonitor = _SetWindowMonitorPtr.asFunction<void Function(int)>();

  /// Set window minimum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMinSize(int width, int height)
    => _SetWindowMinSize(width, height);
  late final _SetWindowMinSizePtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetWindowMinSize');
  late final _SetWindowMinSize = _SetWindowMinSizePtr.asFunction<void Function(int, int)>();

  /// Set window maximum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMaxSize(int width, int height)
    => _SetWindowMaxSize(width, height);
  late final _SetWindowMaxSizePtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetWindowMaxSize');
  late final _SetWindowMaxSize = _SetWindowMaxSizePtr.asFunction<void Function(int, int)>();

  /// Set window dimensions
  void SetWindowSize(int width, int height)
    => _SetWindowSize(width, height);
  late final _SetWindowSizePtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetWindowSize');
  late final _SetWindowSize = _SetWindowSizePtr.asFunction<void Function(int, int)>();

  /// Set window opacity [0.0..1.0]
  void SetWindowOpacity(double opacity)
    => _SetWindowOpacity(opacity);
  late final _SetWindowOpacityPtr = _lookup<NativeFunction<Void Function(Float)>>('SetWindowOpacity');
  late final _SetWindowOpacity = _SetWindowOpacityPtr.asFunction<void Function(double)>();

  /// Set window focused
  void SetWindowFocused()
    => _SetWindowFocused();
  late final _SetWindowFocusedPtr = _lookup<NativeFunction<Void Function()>>('SetWindowFocused');
  late final _SetWindowFocused = _SetWindowFocusedPtr.asFunction<void Function()>();

  /// Get native window handle
  Pointer<Void> GetWindowHandle()
    => _GetWindowHandle();
  late final _GetWindowHandlePtr = _lookup<NativeFunction<Pointer<Void> Function()>>('GetWindowHandle');
  late final _GetWindowHandle = _GetWindowHandlePtr.asFunction<Pointer<Void> Function()>();

  /// Get current screen width
  int GetScreenWidth()
    => _GetScreenWidth();
  late final _GetScreenWidthPtr = _lookup<NativeFunction<Int Function()>>('GetScreenWidth');
  late final _GetScreenWidth = _GetScreenWidthPtr.asFunction<int Function()>();

  /// Get current screen height
  int GetScreenHeight()
    => _GetScreenHeight();
  late final _GetScreenHeightPtr = _lookup<NativeFunction<Int Function()>>('GetScreenHeight');
  late final _GetScreenHeight = _GetScreenHeightPtr.asFunction<int Function()>();

  /// Get current render width (it considers HiDPI)
  int GetRenderWidth()
    => _GetRenderWidth();
  late final _GetRenderWidthPtr = _lookup<NativeFunction<Int Function()>>('GetRenderWidth');
  late final _GetRenderWidth = _GetRenderWidthPtr.asFunction<int Function()>();

  /// Get current render height (it considers HiDPI)
  int GetRenderHeight()
    => _GetRenderHeight();
  late final _GetRenderHeightPtr = _lookup<NativeFunction<Int Function()>>('GetRenderHeight');
  late final _GetRenderHeight = _GetRenderHeightPtr.asFunction<int Function()>();
  
  /// Get number of connected monitors
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorCount()
    => _GetMonitorCount();
  late final _GetMonitorCountPtr = _lookup<NativeFunction<Int Function()>>('GetMonitorCount');
  late final _GetMonitorCount = _GetMonitorCountPtr.asFunction<int Function()>();

  /// Get current monitor where window is placed
  /// 
  /// **[!] Not implemented on WASM**
  int GetCurrentMonitor()
    => _GetCurrentMonitor();
  late final _GetCurrentMonitorPtr = _lookup<NativeFunction<Int Function()>>('GetCurrentMonitor');
  late final _GetCurrentMonitor = _GetCurrentMonitorPtr.asFunction<int Function()>();

  /// Get specified monitor position
  /// 
  /// **[!] Not implemented on WASM**
  Vector2C GetMonitorPosition(int monitor)
    => _GetMonitorPosition(monitor);
  late final _GetMonitorPositionPtr = _lookup<NativeFunction<Vector2C Function(Int)>>('GetMonitorPosition');
  late final _GetMonitorPosition = _GetMonitorPositionPtr.asFunction<Vector2C Function(int)>();

  /// Get specified monitor width (current video mode used by monitor)
  int GetMonitorWidth(int monitor)
    => _GetMonitorWidth(monitor);
  late final _GetMonitorWidthPtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorWidth');
  late final _GetMonitorWidth = _GetMonitorWidthPtr.asFunction<int Function(int)>();

  /// Get specified monitor height (current video mode used by monitor)
  int GetMonitorHeight(int monitor)
    => _GetMonitorHeight(monitor);
  late final _GetMonitorHeightPtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorHeight');
  late final _GetMonitorHeight = _GetMonitorHeightPtr.asFunction<int Function(int)>();

  /// Get specified monitor physical width in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalWidth(int monitor)
    => _GetMonitorPhysicalWidth(monitor);
  late final _GetMonitorPhysicalWidthPtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorPhysicalWidth');
  late final _GetMonitorPhysicalWidth = _GetMonitorPhysicalWidthPtr.asFunction<int Function(int)>();

  /// Get specified monitor physical height in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalHeight(int monitor)
    => _GetMonitorPhysicalHeight(monitor);
  late final _GetMonitorPhysicalHeightPtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorPhysicalHeight');
  late final _GetMonitorPhysicalHeight = _GetMonitorPhysicalHeightPtr.asFunction<int Function(int)>();

  /// Get specified monitor refresh rate
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorRefreshRate(int monitor)
    => _GetMonitorRefreshRate(monitor);
  late final _GetMonitorRefreshRatePtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorRefreshRate');
  late final _GetMonitorRefreshRate = _GetMonitorRefreshRatePtr.asFunction<int Function(int)>();

  /// Get window position XY on monitor
  Vector2C GetWindowPosition()
    => _GetWindowPosition();
  late final _GetWindowPositionPtr = _lookup<NativeFunction<Vector2C Function()>>('GetWindowPosition');
  late final _GetWindowPosition = _GetWindowPositionPtr.asFunction<Vector2C Function()>();

  /// Get window scale DPI factor
  Vector2C GetWindowScaleDPI()
    => _GetWindowScaleDPI();
  late final _GetWindowScaleDPIPtr = _lookup<NativeFunction<Vector2C Function()>>('GetWindowScaleDPI');
  late final _GetWindowScaleDPI = _GetWindowScaleDPIPtr.asFunction<Vector2C Function()>();

  /// Get the human-readable, UTF-8 encoded name of the specified monitor
  /// 
  /// **[!] Not implemented on WASM**
  Pointer<Char> GetMonitorName(int monitor)
    => _GetMonitorName(monitor);
  late final _GetMonitorNamePtr = _lookup<NativeFunction<Pointer<Char> Function(Int)>>('GetMonitorName');
  late final _GetMonitorName = _GetMonitorNamePtr.asFunction<Pointer<Char> Function(int)>();

  /// Set clipboard text content
  void SetClipboardText(Pointer<Char> text)
    => _SetClipboardText(text);
  late final _SetClipboardTextPtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('SetClipboardText');
  late final _SetClipboardText = _SetClipboardTextPtr.asFunction<void Function(Pointer<Char>)>();

  /// Get clipboard text content
  Pointer<Char> GetClipboardText()
    => _GetClipboardText();
  late final _GetClipboardTextPtr = _lookup<NativeFunction<Pointer<Char> Function()>>('GetClipboardText');
  late final _GetClipboardText = _GetClipboardTextPtr.asFunction<Pointer<Char> Function()>();

  /// Get clipboard image content
  ImageC GetClipboardImage()
    => _GetClipboardImage();
  late final _GetClipboardImagePtr = _lookup<NativeFunction<ImageC Function()>>('GetClipboardImage');
  late final _GetClipboardImage = _GetClipboardImagePtr.asFunction<ImageC Function()>();

  /// Enable waiting for events on EndDrawing(), no automatic event polling
  void EnableEventWaiting()
    => _EnableEventWaiting();
  late final _EnableEventWaitingPtr = _lookup<NativeFunction<Void Function()>>('EnableEventWaiting');
  late final _EnableEventWaiting = _EnableEventWaitingPtr.asFunction<void Function()>();

  /// Disable waiting for events on EndDrawing(), automatic events polling
  void DisableEventWaiting()
    => _DisableEventWaiting();
  late final _DisableEventWaitingPtr = _lookup<NativeFunction<Void Function()>>('DisableEventWaiting');
  late final _DisableEventWaiting = _DisableEventWaitingPtr.asFunction<void Function()>();

  /// Shows cursor
  void ShowCursor()
    => _ShowCursor();
  late final _ShowCursorPtr = _lookup<NativeFunction<Void Function()>>('ShowCursor');
  late final _ShowCursor = _ShowCursorPtr.asFunction<void Function()>();

  /// Hides cursor
  void HideCursor()
    => _HideCursor();
  late final _HideCursorPtr = _lookup<NativeFunction<Void Function()>>('HideCursor');
  late final _HideCursor = _HideCursorPtr.asFunction<void Function()>();

  /// Check if cursor is not visible
  bool IsCursorHidden()
    => _IsCursorHidden();
  late final _IsCursorHiddenPtr = _lookup<NativeFunction<Bool Function()>>('IsCursorHidden');
  late final _IsCursorHidden = _IsCursorHiddenPtr.asFunction<bool Function()>();

  /// Enables cursor (unlock cursor)
  void EnableCursor()
    => _EnableCursor();
  late final _EnableCursorPtr = _lookup<NativeFunction<Void Function()>>('EnableCursor');
  late final _EnableCursor = _EnableCursorPtr.asFunction<void Function()>();

  /// Disables cursor (lock cursor)
  void DisableCursor()
    => _DisableCursor();
  late final _DisableCursorPtr = _lookup<NativeFunction<Void Function()>>('DisableCursor');
  late final _DisableCursor = _DisableCursorPtr.asFunction<void Function()>();

  /// Check if cursor is on the screen
  bool IsCursorOnScreen()
    => _IsCursorOnScreen();
  late final _IsCursorOnScreenPtr = _lookup<NativeFunction<Bool Function()>>('IsCursorOnScreen');
  late final _IsCursorOnScreen = _IsCursorOnScreenPtr.asFunction<bool Function()>();

  /// Set background color (framebuffer clear color)
  void ClearBackground(ColorC color)
    => _ClearBackground(color);
  late final _ClearBackgroundPtr = _lookup<NativeFunction<Void Function(ColorC)>>('ClearBackground');
  late final _ClearBackground = _ClearBackgroundPtr.asFunction<void Function(ColorC)>();

  /// Setup canvas (framebuffer) to start drawing
  void BeginDrawing()
    => _BeginDrawing();
  late final _BeginDrawingPtr = _lookup<NativeFunction<Void Function()>>('BeginDrawing');
  late final _BeginDrawing = _BeginDrawingPtr.asFunction<void Function()>();

  /// End canvas drawing and swap buffers (double buffering)
  void EndDrawing()
    => _EndDrawing();
  late final _EndDrawingPtr = _lookup<NativeFunction<Void Function()>>('EndDrawing');
  late final _EndDrawing = _EndDrawingPtr.asFunction<void Function()>();

  /// Begin 2D mode with custom camera (2D)
  void BeginMode2D(Camera2DC camera)
    => _BeginMode2D(camera);
  late final _BeginMode2DPtr = _lookup<NativeFunction<Void Function(Camera2DC)>>('BeginMode2D');
  late final _BeginMode2D = _BeginMode2DPtr.asFunction<void Function(Camera2DC)>();

  /// Ends 2D mode with custom camera
  void EndMode2D()
    => _EndMode2D();
  late final _EndMode2DPtr = _lookup<NativeFunction<Void Function()>>('EndMode2D');
  late final _EndMode2D = _EndMode2DPtr.asFunction<void Function()>();

  /// Begin 3D mode with custom camera (3D)
  void BeginMode3D(Camera3DC camera)
    => _BeginMode3D(camera);
  late final _BeginMode3DPtr = _lookup<NativeFunction<Void Function(Camera3DC)>>('BeginMode3D');
  late final _BeginMode3D = _BeginMode3DPtr.asFunction<void Function(Camera3DC)>();

  /// Ends 3D mode and returns to default 2D orthographic mode
  void EndMode3D()
    => _EndMode3D();
  late final _EndMode3DPtr = _lookup<NativeFunction<Void Function()>>('EndMode3D');
  late final _EndMode3D = _EndMode3DPtr.asFunction<void Function()>();

  /// Begin drawing to render texture
  void BeginTextureMode(RenderTextureC target)
    => _BeginTextureMode(target);
  late final _BeginTextureModePtr = _lookup<NativeFunction<Void Function(RenderTextureC)>>('BeginTextureMode');
  late final _BeginTextureMode = _BeginTextureModePtr.asFunction<void Function(RenderTextureC)>();

  /// Ends drawing to render texture
  void EndTextureMode()
    => _EndTextureMode();
  late final _EndTextureModePtr = _lookup<NativeFunction<Void Function()>>('EndTextureMode');
  late final _EndTextureMode = _EndTextureModePtr.asFunction<void Function()>();

  /// Begin custom shader drawing
  void BeginShaderMode(ShaderC shader)
    => _BeginShaderMode(shader);
  late final _BeginShaderModePtr = _lookup<NativeFunction<Void Function(ShaderC)>>('BeginShaderMode');
  late final _BeginShaderMode = _BeginShaderModePtr.asFunction<void Function(ShaderC)>();

  /// End custom shader drawing (use default shader)
  void EndShaderMode()
    => _EndShaderMode();
  late final _EndShaderModePtr = _lookup<NativeFunction<Void Function()>>('EndShaderMode');
  late final _EndShaderMode = _EndShaderModePtr.asFunction<void Function()>();

  /// Begin blending mode (alpha, additive, multiplied, subtract, custom)
  void BeginBlendMode(int mode)
    => _BeginBlendMode(mode);
  late final _BeginBlendModePtr = _lookup<NativeFunction<Void Function(Int)>>('BeginBlendMode');
  late final _BeginBlendMode = _BeginBlendModePtr.asFunction<void Function(int)>();

  /// End blending mode (reset to default: alpha blending)
  void EndBlendMode()
    => _EndBlendMode();
  late final _EndBlendModePtr = _lookup<NativeFunction<Void Function()>>('EndBlendMode');
  late final _EndBlendMode = _EndBlendModePtr.asFunction<void Function()>();

  /// Begin scissor mode (define screen area for following drawing)
  void BeginScissorMode(int x, int y, int width, int height)
    => _BeginScissorMode(x, y, width, height);
  late final _BeginScissorModePtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int)>>('BeginScissorMode');
  late final _BeginScissorMode = _BeginScissorModePtr.asFunction<void Function(int, int, int, int)>();

  /// End scissor mode
  void EndScissorMode()
    => _EndScissorMode();
  late final _EndScissorModePtr = _lookup<NativeFunction<Void Function()>>('EndScissorMode');
  late final _EndScissorMode = _EndScissorModePtr.asFunction<void Function()>();

  /// Begin stereo rendering (requires VR simulator)
  void BeginVrStereoMode(VrStereoConfigC config)
    => _BeginVrStereoMode(config);
  late final _BeginVrStereoModePtr = _lookup<NativeFunction<Void Function(VrStereoConfigC)>>('BeginVrStereoMode');
  late final _BeginVrStereoMode = _BeginVrStereoModePtr.asFunction<void Function(VrStereoConfigC)>();

  /// End stereo rendering (requires VR simulator)
  void EndVrStereoMode()
    => _EndVrStereoMode();
  late final _EndVrStereoModePtr = _lookup<NativeFunction<Void Function()>>('EndVrStereoMode');
  late final _EndVrStereoMode = _EndVrStereoModePtr.asFunction<void Function()>();

  /// Load VR stereo config for VR simulator device parameters
  VrStereoConfigC LoadVrStereoConfig(VrDeviceInfoC device)
    => _LoadVrStereoConfig(device);
  late final _LoadVrStereoConfigPtr = _lookup<NativeFunction<VrStereoConfigC Function(VrDeviceInfoC)>>('LoadVrStereoConfig');
  late final _LoadVrStereoConfig = _LoadVrStereoConfigPtr.asFunction<VrStereoConfigC Function(VrDeviceInfoC)>();

  /// Unload VR stereo config
  void UnloadVrStereoConfig(VrStereoConfigC config)
    => _UnloadVrStereoConfig(config);
  late final _UnloadVrStereoConfigPtr = _lookup<NativeFunction<Void Function(VrStereoConfigC)>>('UnloadVrStereoConfig');
  late final _UnloadVrStereoConfig = _UnloadVrStereoConfigPtr.asFunction<void Function(VrStereoConfigC)>();

  /// Load shader from files and bind default locations
  ShaderC LoadShader(Pointer<Char> vsFileName, Pointer<Char> fsFileName)
    => _LoadShader(vsFileName, fsFileName);
  late final _LoadShaderPtr = _lookup<NativeFunction<ShaderC Function(Pointer<Char>, Pointer<Char>)>>('LoadShader');
  late final _LoadShader = _LoadShaderPtr.asFunction<ShaderC Function(Pointer<Char>, Pointer<Char>)>();

  /// Load shader from code strings and bind default locations
  ShaderC LoadShaderFromMemory(Pointer<Char> vsCode, Pointer<Char> fsCode)
    => _LoadShaderFromMemory(vsCode, fsCode);
  late final _LoadShaderFromMemoryPtr = _lookup<NativeFunction<ShaderC Function(Pointer<Char>, Pointer<Char>)>>('LoadShaderFromMemory');
  late final _LoadShaderFromMemory = _LoadShaderFromMemoryPtr.asFunction<ShaderC Function(Pointer<Char>, Pointer<Char>)>();

  /// Check if a shader is valid (loaded on GPU)
  bool IsShaderValid(ShaderC shader)
    => _IsShaderValid(shader);
  late final _IsShaderValidPtr = _lookup<NativeFunction<Bool Function(ShaderC)>>('IsShaderValid');
  late final _IsShaderValid = _IsShaderValidPtr.asFunction<bool Function(ShaderC)>();

  /// Get shader uniform location
  int GetShaderLocation(ShaderC shader, Pointer<Char> uniformName)
    => _GetShaderLocation(shader, uniformName);
  late final _GetShaderLocationPtr = _lookup<NativeFunction<Int Function(ShaderC, Pointer<Char>)>>('GetShaderLocation');
  late final _GetShaderLocation = _GetShaderLocationPtr.asFunction<int Function(ShaderC, Pointer<Char>)>();

  /// Get shader attribute location
  int GetShaderLocationAttrib(ShaderC shader, Pointer<Char> attribName)
    => _GetShaderLocationAttrib(shader, attribName);
  late final _GetShaderLocationAttribPtr = _lookup<NativeFunction<Int Function(ShaderC, Pointer<Char>)>>('GetShaderLocationAttrib');
  late final _GetShaderLocationAttrib = _GetShaderLocationAttribPtr.asFunction<int Function(ShaderC, Pointer<Char>)>();

  /// Set shader uniform value
  void SetShaderValue(ShaderC shader, int locIndex, Pointer<Void> value, int uniformType)
    => _SetShaderValue(shader, locIndex, value, uniformType);
  late final _SetShaderValuePtr = _lookup<NativeFunction<Void Function(ShaderC, Int, Pointer<Void>, Int)>>('SetShaderValue');
  late final _SetShaderValue = _SetShaderValuePtr.asFunction<void Function(ShaderC, int, Pointer<Void>, int)>();

  /// Set shader uniform value vector
  void SetShaderValueV(ShaderC shader, int locIndex, Pointer<Void> value, int uniformType, int count)
    => _SetShaderValueV(shader, locIndex, value, uniformType, count);
  late final _SetShaderValueVPtr = _lookup<NativeFunction<Void Function(ShaderC, Int, Pointer<Void>, Int, Int)>>('SetShaderValueV');
  late final _SetShaderValueV = _SetShaderValueVPtr.asFunction<void Function(ShaderC, int, Pointer<Void>, int, int)>();

  /// Set shader uniform value (matrix 4x4)
  void SetShaderValueMatrix(ShaderC shader, int locIndex, MatrixC mat)
    => _SetShaderValueMatrix(shader, locIndex, mat);
  late final _SetShaderValueMatrixPtr = _lookup<NativeFunction<Void Function(ShaderC, Int, MatrixC)>>('SetShaderValueMatrix');
  late final _SetShaderValueMatrix = _SetShaderValueMatrixPtr.asFunction<void Function(ShaderC, int, MatrixC)>();

  /// Set shader uniform value for texture (sampler2d)
  void SetShaderValueTexture(ShaderC shader, int locIndex, TextureC texture)
    => _SetShaderValueTexture(shader, locIndex, texture);
  late final _SetShaderValueTexturePtr = _lookup<NativeFunction<Void Function(ShaderC, Int, TextureC)>>('SetShaderValueTexture');
  late final _SetShaderValueTexture = _SetShaderValueTexturePtr.asFunction<void Function(ShaderC, int, TextureC)>();

  /// Unload shader from GPU memory (VRAM)
  void UnloadShader(ShaderC shader)
    => _UnloadShader(shader);
  late final _UnloadShaderPtr = _lookup<NativeFunction<Void Function(ShaderC)>>('UnloadShader');
  late final _UnloadShader = _UnloadShaderPtr.asFunction<void Function(ShaderC)>();

  /// Get a ray trace from screen position (i.e mouse)
  RayC GetScreenToWorldRay(Vector2C position, Camera3DC camera)
    => _GetScreenToWorldRay(position, camera);
  late final _GetScreenToWorldRayPtr = _lookup<NativeFunction<RayC Function(Vector2C, Camera3DC)>>('GetScreenToWorldRay');
  late final _GetScreenToWorldRay = _GetScreenToWorldRayPtr.asFunction<RayC Function(Vector2C, Camera3DC)>();

  /// Get a ray trace from screen position (i.e mouse) in a viewport
  RayC GetScreenToWorldRayEx(Vector2C position, Camera3DC camera, int width, int height)
    => _GetScreenToWorldRayEx(position, camera, width, height);
  late final _GetScreenToWorldRayExPtr = _lookup<NativeFunction<RayC Function(Vector2C, Camera3DC, Int, Int)>>('GetScreenToWorldRayEx');
  late final _GetScreenToWorldRayEx = _GetScreenToWorldRayExPtr.asFunction<RayC Function(Vector2C, Camera3DC, int, int)>();

  /// Get the screen space position for a 3d world space position
  Vector2C GetWorldToScreen(Vector3C position, Camera3DC camera)
    => _GetWorldToScreen(position, camera);
  late final _GetWorldToScreenPtr = _lookup<NativeFunction<Vector2C Function(Vector3C, Camera3DC)>>('GetWorldToScreen');
  late final _GetWorldToScreen = _GetWorldToScreenPtr.asFunction<Vector2C Function(Vector3C, Camera3DC)>();

  /// Get size position for a 3d world space position
  Vector2C GetWorldToScreenEx(Vector3C position, Camera3DC camera, int width, int height)
    => _GetWorldToScreenEx(position, camera, width, height);
  late final _GetWorldToScreenExPtr = _lookup<NativeFunction<Vector2C Function(Vector3C, Camera3DC, Int, Int)>>('GetWorldToScreenEx');
  late final _GetWorldToScreenEx = _GetWorldToScreenExPtr.asFunction<Vector2C Function(Vector3C, Camera3DC, int, int)>();

  /// Get the screen space position for a 2d camera world space position
  Vector2C GetWorldToScreen2D(Vector2C position, Camera2DC camera)
    => _GetWorldToScreen2D(position, camera);
  late final _GetWorldToScreen2DPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Camera2DC)>>('GetWorldToScreen2D');
  late final _GetWorldToScreen2D = _GetWorldToScreen2DPtr.asFunction<Vector2C Function(Vector2C, Camera2DC)>();

  /// Get the world space position for a 2d camera screen space position
  Vector2C GetScreenToWorld2D(Vector2C position, Camera2DC camera)
    => _GetScreenToWorld2D(position, camera);
  late final _GetScreenToWorld2DPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Camera2DC)>>('GetScreenToWorld2D');
  late final _GetScreenToWorld2D = _GetScreenToWorld2DPtr.asFunction<Vector2C Function(Vector2C, Camera2DC)>();

  /// Get camera transform matrix (view matrix)
  MatrixC GetCameraMatrix(Camera3DC camera)
    => _GetCameraMatrix(camera);
  late final _GetCameraMatrixPtr = _lookup<NativeFunction<MatrixC Function(Camera3DC)>>('GetCameraMatrix');
  late final _GetCameraMatrix = _GetCameraMatrixPtr.asFunction<MatrixC Function(Camera3DC)>();

  /// Get camera 2d transform matrix
  MatrixC GetCameraMatrix2D(Camera2DC camera)
    => _GetCameraMatrix2D(camera);
  late final _GetCameraMatrix2DPtr = _lookup<NativeFunction<MatrixC Function(Camera2DC)>>('GetCameraMatrix2D');
  late final _GetCameraMatrix2D = _GetCameraMatrix2DPtr.asFunction<MatrixC Function(Camera2DC)>();

  /// Set target FPS (maximum)
  void SetTargetFPS(int fps)
    => _SetTargetFPS(fps);
  late final _SetTargetFPSPtr = _lookup<NativeFunction<Void Function(Int)>>('SetTargetFPS');
  late final _SetTargetFPS = _SetTargetFPSPtr.asFunction<void Function(int)>();

  /// Get time in seconds for last frame drawn (delta time)
  double GetFrameTime()
    => _GetFrameTime();
  late final _GetFrameTimePtr = _lookup<NativeFunction<Float Function()>>('GetFrameTime');
  late final _GetFrameTime = _GetFrameTimePtr.asFunction<double Function()>();

  /// Get elapsed time in seconds since InitWindow()
  double GetTime()
    => _GetTime();
  late final _GetTimePtr = _lookup<NativeFunction<Double Function()>>('GetTime');
  late final _GetTime = _GetTimePtr.asFunction<double Function()>();

  /// Get current FPS
  int GetFPS()
    => _GetFPS();
  late final _GetFPSPtr = _lookup<NativeFunction<Int Function()>>('GetFPS');
  late final _GetFPS = _GetFPSPtr.asFunction<int Function()>();

  /// Swap back buffer with front buffer (screen drawing)
  void SwapScreenBuffer()
    => _SwapScreenBuffer();
  late final _SwapScreenBufferPtr = _lookup<NativeFunction<Void Function()>>('SwapScreenBuffer');
  late final _SwapScreenBuffer = _SwapScreenBufferPtr.asFunction<void Function()>();

  /// Register all input events
  void PollInputEvents()
    => _PollInputEvents();
  late final _PollInputEventsPtr = _lookup<NativeFunction<Void Function()>>('PollInputEvents');
  late final _PollInputEvents = _PollInputEventsPtr.asFunction<void Function()>();

  /// Wait for some time (halt program execution)
  void WaitTime(double seconds)
    => _WaitTime(seconds);
  late final _WaitTimePtr = _lookup<NativeFunction<Void Function(Double)>>('WaitTime');
  late final _WaitTime = _WaitTimePtr.asFunction<void Function(double)>();

  /// Set the seed for the random number generator
  void SetRandomSeed(int seed)
    => _SetRandomSeed(seed);
  late final _SetRandomSeedPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('SetRandomSeed');
  late final _SetRandomSeed = _SetRandomSeedPtr.asFunction<void Function(int)>();

  /// Get a random value between min and max (both included)
  int GetRandomValue(int min, int max)
    => _GetRandomValue(min, max);
  late final _GetRandomValuePtr = _lookup<NativeFunction<Int Function(Int, Int)>>('GetRandomValue');
  late final _GetRandomValue = _GetRandomValuePtr.asFunction<int Function(int, int)>();

  /// Load random values sequence, no values repeated, min and max included
  Pointer<Int> LoadRandomSequence(int count, int min, int max)
    => _LoadRandomSequence(count, min, max);
  late final _LoadRandomSequencePtr = _lookup<NativeFunction<Pointer<Int> Function(UnsignedInt, Int, Int)>>('LoadRandomSequence');
  late final _LoadRandomSequence = _LoadRandomSequencePtr.asFunction<Pointer<Int> Function(int, int, int)>();

  /// Unload random values sequence
  void UnloadRandomSequence(Pointer<Int> sequence)
    => _UnloadRandomSequence(sequence);
  late final _UnloadRandomSequencePtr = _lookup<NativeFunction<Void Function(Pointer<Int>)>>('UnloadRandomSequence');
  late final _UnloadRandomSequence = _UnloadRandomSequencePtr.asFunction<void Function(Pointer<Int>)>();

  /// Takes a screenshot of current screen (filename extension defines format)
  void TakeScreenshot(Pointer<Char> fileName)
    => _TakeScreenshot(fileName);
  late final _TakeScreenshotPtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('TakeScreenshot');
  late final _TakeScreenshot = _TakeScreenshotPtr.asFunction<void Function(Pointer<Char>)>();

  /// Setup init configuration flags (view [ConfigFlags])
  void SetConfigFlags(int flags)
    => _SetConfigFlags(flags);
  late final _SetConfigFlagsPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('SetConfigFlags');
  late final _SetConfigFlags = _SetConfigFlagsPtr.asFunction<void Function(int)>();

  /// Open URL with default system browser (if available)
  void OpenURL(Pointer<Char> url)
    => _OpenURL(url);
  late final _OpenURLPtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('OpenURL');
  late final _OpenURL = _OpenURLPtr.asFunction<void Function(Pointer<Char>)>();

  /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
  void TraceLog(int logLevel, Pointer<Char> text)
    => _TraceLog(logLevel, text);
  late final _TraceLogPtr = _lookup<NativeFunction<Void Function(Int, Pointer<Char>)>>('TraceLog');
  late final _TraceLog = _TraceLogPtr.asFunction<void Function(int, Pointer<Char>)>();

  /// Set the current threshold (minimum) log level
  void SetTraceLogLevel(int logLevel)
    => _SetTraceLogLevel(logLevel);
  late final _SetTraceLogLevelPtr = _lookup<NativeFunction<Void Function(Int)>>('SetTraceLogLevel');
  late final _SetTraceLogLevel = _SetTraceLogLevelPtr.asFunction<void Function(int)>();

  /// Set custom trace log
  void SetTraceLogCallback(TraceLogCallbackC callback)
    => _SetTraceLogCallback(callback);
  late final _SetTraceLogCallbackPtr = _lookup<NativeFunction<Void Function(TraceLogCallbackC)>>('SetTraceLogCallback');
  late final _SetTraceLogCallback = _SetTraceLogCallbackPtr.asFunction<void Function(TraceLogCallbackC)>();

  /// Set custom file binary data loader
  void SetLoadFileDataCallback(LoadFileDataCallbackC callback)
    => _SetLoadFileDataCallback(callback);
  late final _SetLoadFileDataCallbackPtr = _lookup<NativeFunction<Void Function(LoadFileDataCallbackC)>>('SetLoadFileDataCallback');
  late final _SetLoadFileDataCallback = _SetLoadFileDataCallbackPtr.asFunction<void Function(LoadFileDataCallbackC)>();

  /// Set custom file binary data saver
  void SetSaveFileDataCallback(SaveFileDataCallbackC callback)
    => _SetSaveFileDataCallback(callback);
  late final _SetSaveFileDataCallbackPtr = _lookup<NativeFunction<Void Function(SaveFileDataCallbackC)>>('SetSaveFileDataCallback');
  late final _SetSaveFileDataCallback = _SetSaveFileDataCallbackPtr.asFunction<void Function(SaveFileDataCallbackC)>();

  /// Set custom file text data loader
  void SetLoadFileTextCallback(LoadFileTextCallbackC callback)
    => _SetLoadFileTextCallback(callback);
  late final _SetLoadFileTextCallbackPtr = _lookup<NativeFunction<Void Function(LoadFileTextCallbackC)>>('SetLoadFileTextCallback');
  late final _SetLoadFileTextCallback = _SetLoadFileTextCallbackPtr.asFunction<void Function(LoadFileTextCallbackC)>();

  /// Set custom file text data saver
  void SetSaveFileTextCallback(SaveFileTextCallbackC callback)
    => _SetSaveFileTextCallback(callback);
  late final _SetSaveFileTextCallbackPtr = _lookup<NativeFunction<Void Function(SaveFileTextCallbackC)>>('SetSaveFileTextCallback');
  late final _SetSaveFileTextCallback = _SetSaveFileTextCallbackPtr.asFunction<void Function(SaveFileTextCallbackC)>();

  /// Load file data as byte array (read)
  Pointer<UnsignedChar> LoadFileData(Pointer<Char> fileName, Pointer<Int> dataSize)
    => _LoadFileData(fileName, dataSize);
  late final _LoadFileDataPtr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(Pointer<Char>, Pointer<Int>)>>('LoadFileData');
  late final _LoadFileData = _LoadFileDataPtr.asFunction<Pointer<UnsignedChar> Function(Pointer<Char>, Pointer<Int>)>();

  /// Unload file data allocated by LoadFileData()
  void UnloadFileData(Pointer<UnsignedChar> data)
    => _UnloadFileData(data);
  late final _UnloadFileDataPtr = _lookup<NativeFunction<Void Function(Pointer<UnsignedChar>)>>('UnloadFileData');
  late final _UnloadFileData = _UnloadFileDataPtr.asFunction<void Function(Pointer<UnsignedChar>)>();

  /// Save data to file from byte array (write), returns true on success
  bool SaveFileData(Pointer<Char> fileName, Pointer<Void> data, int dataSize)
    => _SaveFileData(fileName, data, dataSize);
  late final _SaveFileDataPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>, Pointer<Void>, Int)>>('SaveFileData');
  late final _SaveFileData = _SaveFileDataPtr.asFunction<bool Function(Pointer<Char>, Pointer<Void>, int)>();

  /// Export data to code (.h), returns true on success
  bool ExportDataAsCode(Pointer<UnsignedChar> data, int dataSize, Pointer<Char> fileName)
    => _ExportDataAsCode(data, dataSize, fileName);
  late final _ExportDataAsCodePtr = _lookup<NativeFunction<Bool Function(Pointer<UnsignedChar>, Int, Pointer<Char>)>>('ExportDataAsCode');
  late final _ExportDataAsCode = _ExportDataAsCodePtr.asFunction<bool Function(Pointer<UnsignedChar>, int, Pointer<Char>)>();

  /// Load text data from file (read)
  Pointer<Char> LoadFileText(Pointer<Char> fileName)
    => _LoadFileText(fileName);
  late final _LoadFileTextPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('LoadFileText');
  late final _LoadFileText = _LoadFileTextPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Unload file text data allocated by LoadFileText()
  void UnloadFileText(Pointer<Char> text)
    => _UnloadFileText(text);
  late final _UnloadFileTextPtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('UnloadFileText');
  late final _UnloadFileText = _UnloadFileTextPtr.asFunction<void Function(Pointer<Char>)>();

  /// Save text data to file (write), returns true on success
  bool SaveFileText(Pointer<Char> fileName, Pointer<Char> text)
    => _SaveFileText(fileName, text);
  late final _SaveFileTextPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>, Pointer<Char>)>>('SaveFileText');
  late final _SaveFileText = _SaveFileTextPtr.asFunction<bool Function(Pointer<Char>, Pointer<Char>)>();
    
  /// Rename file (if exists)
  int FileRename(Pointer<Char> fileName, Pointer<Char> fileRename)
    => _FileRename(fileName, fileRename);
  late final _FileRenamePtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('FileRename');
  late final _FileRename = _FileRenamePtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  /// Remove file (if exists)
  int FileRemove(Pointer<Char> fileName)
    => _FileRemove(fileName);
  late final _FileRemovePtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('FileRemove');
  late final _FileRemove = _FileRemovePtr.asFunction<int Function(Pointer<Char>)>();

  /// Copy file from one path to another, dstPath created if it doesn't exist
  int FileCopy(Pointer<Char> srcPath, Pointer<Char> dstPath)
    => _FileCopy(srcPath, dstPath);
  late final _FileCopyPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('FileCopy');
  late final _FileCopy = _FileCopyPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  /// Move file from one directory to another, dstPath created if it doesn't exist
  int FileMove(Pointer<Char> srcPath, Pointer<Char> dstPath)
    => _FileMove(srcPath, dstPath);
  late final _FileMovePtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('FileMove');
  late final _FileMove = _FileMovePtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  /// Replace text in an existing file
  int FileTextReplace(Pointer<Char> fileName, Pointer<Char> search, Pointer<Char> replacement)
    => _FileTextReplace(fileName, search, replacement);
  late final _FileTextReplacePtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('FileTextReplace');
  late final _FileTextReplace = _FileTextReplacePtr.asFunction<int Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  /// Find text in existing file
  int FileTextFindIndex(Pointer<Char> fileName, Pointer<Char> search)
    => _FileTextFindIndex(fileName, search);
  late final _FileTextFindIndexPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('FileTextFindIndex');
  late final _FileTextFindIndex = _FileTextFindIndexPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  /// Check if file exists
  bool FileExists(Pointer<Char> fileName)
    => _FileExists(fileName);
  late final _FileExistsPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('FileExists');
  late final _FileExists = _FileExistsPtr.asFunction<bool Function(Pointer<Char>)>();

  /// Check if a directory path exists
  bool DirectoryExists(Pointer<Char> dirPath)
    => _DirectoryExists(dirPath);
  late final _DirectoryExistsPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('DirectoryExists');
  late final _DirectoryExists = _DirectoryExistsPtr.asFunction<bool Function(Pointer<Char>)>();

  /// Check file extension (including point: .png, .wav)
  bool IsFileExtension(Pointer<Char> fileName, Pointer<Char> ext)
    => _IsFileExtension(fileName, ext);
  late final _IsFileExtensionPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>, Pointer<Char>)>>('IsFileExtension');
  late final _IsFileExtension = _IsFileExtensionPtr.asFunction<bool Function(Pointer<Char>, Pointer<Char>)>();

  /// Get file length in bytes
  int GetFileLength(Pointer<Char> fileName)
    => _GetFileLength(fileName);
  late final _GetFileLengthPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('GetFileLength');
  late final _GetFileLength = _GetFileLengthPtr.asFunction<int Function(Pointer<Char>)>();

  /// Get extension for a filename (includes dot: '.png')
  Pointer<Char> GetFileExtension(Pointer<Char> fileName)
    => _GetFileExtension(fileName);
  late final _GetFileExtensionPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetFileExtension');
  late final _GetFileExtension = _GetFileExtensionPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get filename for a path string
  Pointer<Char> GetFileName(Pointer<Char> filePath)
    => _GetFileName(filePath);
  late final _GetFileNamePtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetFileName');
  late final _GetFileName = _GetFileNamePtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get filename without extension
  Pointer<Char> GetFileNameWithoutExt(Pointer<Char> filePath)
    => _GetFileNameWithoutExt(filePath);
  late final _GetFileNameWithoutExtPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetFileNameWithoutExt');
  late final _GetFileNameWithoutExt = _GetFileNameWithoutExtPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get the file count in a directory
  int GetDirectoryFileCount(Pointer<Char> dirPath)
    => _GetDirectoryFileCount(dirPath);
  late final _GetDirectoryFileCountPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Char>)>>('GetDirectoryFileCount');
  late final _GetDirectoryFileCount = _GetDirectoryFileCountPtr.asFunction<int Function(Pointer<Char>)>();

  /// Get the file count in a directory with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  int GetDirectoryFileCountEx(Pointer<Char> basePath, Pointer<Char> filter, bool scanSubdirs)
    => _GetDirectoryFileCountEx(basePath, filter, scanSubdirs);
  late final _GetDirectoryFileCountExPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Char>, Pointer<Char>, Bool)>>('GetDirectoryFileCountEx');
  late final _GetDirectoryFileCountEx = _GetDirectoryFileCountExPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>, bool)>();

  /// Get full path for a given fileName with path
  Pointer<Char> GetDirectoryPath(Pointer<Char> filePath)
    => _GetDirectoryPath(filePath);
  late final _GetDirectoryPathPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetDirectoryPath');
  late final _GetDirectoryPath = _GetDirectoryPathPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get previous directory path for a given path
  Pointer<Char> GetPrevDirectoryPath(Pointer<Char> dirPath)
    => _GetPrevDirectoryPath(dirPath);
  late final _GetPrevDirectoryPathPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetPrevDirectoryPath');
  late final _GetPrevDirectoryPath = _GetPrevDirectoryPathPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get current working directory
  Pointer<Char> GetWorkingDirectory()
    => _GetWorkingDirectory();
  late final _GetWorkingDirectoryPtr = _lookup<NativeFunction<Pointer<Char> Function()>>('GetWorkingDirectory');
  late final _GetWorkingDirectory = _GetWorkingDirectoryPtr.asFunction<Pointer<Char> Function()>();

  /// Get the directory of the running application
  Pointer<Char> GetApplicationDirectory()
    => _GetApplicationDirectory();
  late final _GetApplicationDirectoryPtr = _lookup<NativeFunction<Pointer<Char> Function()>>('GetApplicationDirectory');
  late final _GetApplicationDirectory = _GetApplicationDirectoryPtr.asFunction<Pointer<Char> Function()>();

  /// Create directories (including full path requested), returns 0 on success
  int MakeDirectory(Pointer<Char> dirPath)
    => _MakeDirectory(dirPath);
  late final _MakeDirectoryPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('MakeDirectory');
  late final _MakeDirectory = _MakeDirectoryPtr.asFunction<int Function(Pointer<Char>)>();

  /// Change working directory, return true on success
  bool ChangeDirectory(Pointer<Char> dir)
    => _ChangeDirectory(dir);
  late final _ChangeDirectoryPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('ChangeDirectory');
  late final _ChangeDirectory = _ChangeDirectoryPtr.asFunction<bool Function(Pointer<Char>)>();

  /// Check if a given path is a file or a directory
  bool IsPathFile(Pointer<Char> path)
    => _IsPathFile(path);
  late final _IsPathFilePtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('IsPathFile');
  late final _IsPathFile = _IsPathFilePtr.asFunction<bool Function(Pointer<Char>)>();

  /// Check if fileName is valid for the platform/OS
  bool IsFileNameValid(Pointer<Char> fileName)
    => _IsFileNameValid(fileName);
  late final _IsFileNameValidPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('IsFileNameValid');
  late final _IsFileNameValid = _IsFileNameValidPtr.asFunction<bool Function(Pointer<Char>)>();

  /// Load directory filepaths
  FilePathListC LoadDirectoryFiles(Pointer<Char> dirPath)
    => _LoadDirectoryFiles(dirPath);
  late final _LoadDirectoryFilesPtr = _lookup<NativeFunction<FilePathListC Function(Pointer<Char>)>>('LoadDirectoryFiles');
  late final _LoadDirectoryFiles = _LoadDirectoryFilesPtr.asFunction<FilePathListC Function(Pointer<Char>)>();

  /// Load directory filepaths with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  FilePathListC LoadDirectoryFilesEx(Pointer<Char> basePath, Pointer<Char> filter, bool scanSubdirs)
    => _LoadDirectoryFilesEx(basePath, filter, scanSubdirs);
  late final _LoadDirectoryFilesExPtr = _lookup<NativeFunction<FilePathListC Function(Pointer<Char>, Pointer<Char>, Bool)>>('LoadDirectoryFilesEx');
  late final _LoadDirectoryFilesEx = _LoadDirectoryFilesExPtr.asFunction<FilePathListC Function(Pointer<Char>, Pointer<Char>, bool)>();

  /// Unload filepaths
  void UnloadDirectoryFiles(FilePathListC files)
    => _UnloadDirectoryFiles(files);
  late final _UnloadDirectoryFilesPtr = _lookup<NativeFunction<Void Function(FilePathListC)>>('UnloadDirectoryFiles');
  late final _UnloadDirectoryFiles = _UnloadDirectoryFilesPtr.asFunction<void Function(FilePathListC)>();

  /// Check if a file has been dropped into window
  bool IsFileDropped()
    => _IsFileDropped();
  late final _IsFileDroppedPtr = _lookup<NativeFunction<Bool Function()>>('IsFileDropped');
  late final _IsFileDropped = _IsFileDroppedPtr.asFunction<bool Function()>();

  /// Load dropped filepaths
  FilePathListC LoadDroppedFiles()
    => _LoadDroppedFiles();
  late final _LoadDroppedFilesPtr = _lookup<NativeFunction<FilePathListC Function()>>('LoadDroppedFiles');
  late final _LoadDroppedFiles = _LoadDroppedFilesPtr.asFunction<FilePathListC Function()>();

  /// Unload dropped filepaths
  void UnloadDroppedFiles(FilePathListC files)
    => _UnloadDroppedFiles(files);
  late final _UnloadDroppedFilesPtr = _lookup<NativeFunction<Void Function(FilePathListC)>>('UnloadDroppedFiles');
  late final _UnloadDroppedFiles = _UnloadDroppedFilesPtr.asFunction<void Function(FilePathListC)>();

  /// Get file modification time (last write time)
  int GetFileModTime(Pointer<Char> fileName)
    => _GetFileModTime(fileName);
  late final _GetFileModTimePtr = _lookup<NativeFunction<Long Function(Pointer<Char>)>>('GetFileModTime');
  late final _GetFileModTime = _GetFileModTimePtr.asFunction<int Function(Pointer<Char>)>();

  /// Compress data (DEFLATE algorithm)
  Pointer<UnsignedChar> CompressData(Pointer<UnsignedChar> data, int dataSize, Pointer<Int> compDataSize)
    => _CompressData(data, dataSize, compDataSize);
  late final _CompressDataPtr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(Pointer<UnsignedChar>, Int, Pointer<Int>)>>('CompressData');
  late final _CompressData = _CompressDataPtr.asFunction<Pointer<UnsignedChar> Function(Pointer<UnsignedChar>, int, Pointer<Int>)>();

  /// Decompress data (DEFLATE algorithm)
  Pointer<UnsignedChar> DecompressData(Pointer<UnsignedChar> compData, int compDataSize, Pointer<Int> dataSize)
    => _DecompressData(compData, compDataSize, dataSize);
  late final _DecompressDataPtr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(Pointer<UnsignedChar>, Int, Pointer<Int>)>>('DecompressData');
  late final _DecompressData = _DecompressDataPtr.asFunction<Pointer<UnsignedChar> Function(Pointer<UnsignedChar>, int, Pointer<Int>)>();

  /// Encode data to Base64 string
  Pointer<Char> EncodeDataBase64(Pointer<UnsignedChar> data, int dataSize, Pointer<Int> outputSize)
    => _EncodeDataBase64(data, dataSize, outputSize);
  late final _EncodeDataBase64Ptr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<UnsignedChar>, Int, Pointer<Int>)>>('EncodeDataBase64');
  late final _EncodeDataBase64 = _EncodeDataBase64Ptr.asFunction<Pointer<Char> Function(Pointer<UnsignedChar>, int, Pointer<Int>)>();

  /// Decode Base64 string data
  Pointer<UnsignedChar> DecodeDataBase64(Pointer<Char> data, Pointer<Int> outputSize)
    => _DecodeDataBase64(data, outputSize);
  late final _DecodeDataBase64Ptr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(Pointer<Char>, Pointer<Int>)>>('DecodeDataBase64');
  late final _DecodeDataBase64 = _DecodeDataBase64Ptr.asFunction<Pointer<UnsignedChar> Function(Pointer<Char>, Pointer<Int>)>();

  /// Compute CRC32 hash code
  int ComputeCRC32(Pointer<UnsignedChar> data, int dataSize)
    => _ComputeCRC32(data, dataSize);
  late final _ComputeCRC32Ptr = _lookup<NativeFunction<UnsignedInt Function(Pointer<UnsignedChar>, Int)>>('ComputeCRC32');
  late final _ComputeCRC32 = _ComputeCRC32Ptr.asFunction<int Function(Pointer<UnsignedChar>, int)>();

  /// Compute MD5 hash code
  Pointer<UnsignedInt> ComputeMD5(Pointer<UnsignedChar> data, int dataSize)
    => _ComputeMD5(data, dataSize);
  late final _ComputeMD5Ptr = _lookup<NativeFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, Int)>>('ComputeMD5');
  late final _ComputeMD5 = _ComputeMD5Ptr.asFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, int)>();

  /// Compute SHA1 hash code
  Pointer<UnsignedInt> ComputeSHA1(Pointer<UnsignedChar> data, int dataSize)
    => _ComputeSHA1(data, dataSize);
  late final _ComputeSHA1Ptr = _lookup<NativeFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, Int)>>('ComputeSHA1');
  late final _ComputeSHA1 = _ComputeSHA1Ptr.asFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, int)>();

  /// Compute SHA256 hash code
  Pointer<UnsignedInt> ComputeSHA256(Pointer<UnsignedChar> data, int dataSize)
    => _ComputeSHA256(data, dataSize);
  late final _ComputeSHA256Ptr = _lookup<NativeFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, Int)>>('ComputeSHA256');
  late final _ComputeSHA256 = _ComputeSHA256Ptr.asFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, int)>();

  /// Load automation events list from file, NULL for empty list
  AutomationEventListC LoadAutomationEventList(Pointer<Char> fileName)
    => _LoadAutomationEventList(fileName);
  late final _LoadAutomationEventListPtr = _lookup<NativeFunction<AutomationEventListC Function(Pointer<Char>)>>('LoadAutomationEventList');
  late final _LoadAutomationEventList = _LoadAutomationEventListPtr.asFunction<AutomationEventListC Function(Pointer<Char>)>();

  /// Unload automation events list from file
  void UnloadAutomationEventList(AutomationEventListC list)
    => _UnloadAutomationEventList(list);
  late final _UnloadAutomationEventListPtr = _lookup<NativeFunction<Void Function(AutomationEventListC)>>('UnloadAutomationEventList');
  late final _UnloadAutomationEventList = _UnloadAutomationEventListPtr.asFunction<void Function(AutomationEventListC)>();

  /// Export automation events list as text file
  bool ExportAutomationEventList(AutomationEventListC list, Pointer<Char> fileName)
    => _ExportAutomationEventList(list, fileName);
  late final _ExportAutomationEventListPtr = _lookup<NativeFunction<Bool Function(AutomationEventListC, Pointer<Char>)>>('ExportAutomationEventList');
  late final _ExportAutomationEventList = _ExportAutomationEventListPtr.asFunction<bool Function(AutomationEventListC, Pointer<Char>)>();

  /// Set automation event list to record to
  void SetAutomationEventList(Pointer<AutomationEventListC> list)
    => _SetAutomationEventList(list);
  late final _SetAutomationEventListPtr = _lookup<NativeFunction<Void Function(Pointer<AutomationEventListC>)>>('SetAutomationEventList');
  late final _SetAutomationEventList = _SetAutomationEventListPtr.asFunction<void Function(Pointer<AutomationEventListC>)>();

  /// Set automation event internal base frame to start recording
  void SetAutomationEventBaseFrame(int frame)
    => _SetAutomationEventBaseFrame(frame);
  late final _SetAutomationEventBaseFramePtr = _lookup<NativeFunction<Void Function(Int)>>('SetAutomationEventBaseFrame');
  late final _SetAutomationEventBaseFrame = _SetAutomationEventBaseFramePtr.asFunction<void Function(int)>();

  /// Start recording automation events (AutomationEventList must be set)
  void StartAutomationEventRecording()
    => _StartAutomationEventRecording();
  late final _StartAutomationEventRecordingPtr = _lookup<NativeFunction<Void Function()>>('StartAutomationEventRecording');
  late final _StartAutomationEventRecording = _StartAutomationEventRecordingPtr.asFunction<void Function()>();

  /// Stop recording automation events
  void StopAutomationEventRecording()
    => _StopAutomationEventRecording();
  late final _StopAutomationEventRecordingPtr = _lookup<NativeFunction<Void Function()>>('StopAutomationEventRecording');
  late final _StopAutomationEventRecording = _StopAutomationEventRecordingPtr.asFunction<void Function()>();

  /// Play a recorded automation event
  void PlayAutomationEvent(AutomationEventC event)
    => _PlayAutomationEvent(event);
  late final _PlayAutomationEventPtr = _lookup<NativeFunction<Void Function(AutomationEventC)>>('PlayAutomationEvent');
  late final _PlayAutomationEvent = _PlayAutomationEventPtr.asFunction<void Function(AutomationEventC)>();

  /// Check if a key has been pressed once
  bool IsKeyPressed(int key)
    => _IsKeyPressed(key);
  late final _IsKeyPressedPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyPressed');
  late final _IsKeyPressed = _IsKeyPressedPtr.asFunction<bool Function(int)>();

  /// Check if a key has been pressed again
  bool IsKeyPressedRepeat(int key)
    => _IsKeyPressedRepeat(key);
  late final _IsKeyPressedRepeatPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyPressedRepeat');
  late final _IsKeyPressedRepeat = _IsKeyPressedRepeatPtr.asFunction<bool Function(int)>();

  /// Check if a key is being pressed
  bool IsKeyDown(int key)
    => _IsKeyDown(key);
  late final _IsKeyDownPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyDown');
  late final _IsKeyDown = _IsKeyDownPtr.asFunction<bool Function(int)>();

  /// Check if a key has been released once
  bool IsKeyReleased(int key)
    => _IsKeyReleased(key);
  late final _IsKeyReleasedPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyReleased');
  late final _IsKeyReleased = _IsKeyReleasedPtr.asFunction<bool Function(int)>();

  /// Check if a key is NOT being pressed
  bool IsKeyUp(int key)
    => _IsKeyUp(key);
  late final _IsKeyUpPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyUp');
  late final _IsKeyUp = _IsKeyUpPtr.asFunction<bool Function(int)>();

  /// Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
  /// 
  /// **[!] Not implemented on WASM**
  Pointer<Char> GetKeyName(int key)
    => _GetKeyName(key);
  late final _GetKeyNamePtr = _lookup<NativeFunction<Pointer<Char> Function(Int)>>('GetKeyName');
  late final _GetKeyName = _GetKeyNamePtr.asFunction<Pointer<Char> Function(int)>();

  /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
  int GetKeyPressed()
    => _GetKeyPressed();
  late final _GetKeyPressedPtr = _lookup<NativeFunction<Int Function()>>('GetKeyPressed');
  late final _GetKeyPressed = _GetKeyPressedPtr.asFunction<int Function()>();

  /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
  int GetCharPressed()
    => _GetCharPressed();
  late final _GetCharPressedPtr = _lookup<NativeFunction<Int Function()>>('GetCharPressed');
  late final _GetCharPressed = _GetCharPressedPtr.asFunction<int Function()>();

  /// Set a custom key to exit program (default is ESC)
  void SetExitKey(int key)
    => _SetExitKey(key);
  late final _SetExitKeyPtr = _lookup<NativeFunction<Void Function(Int)>>('SetExitKey');
  late final _SetExitKey = _SetExitKeyPtr.asFunction<void Function(int)>();

  /// Check if a gamepad is available
  bool IsGamepadAvailable(int gamepad)
    => _IsGamepadAvailable(gamepad);
  late final _IsGamepadAvailablePtr = _lookup<NativeFunction<Bool Function(Int)>>('IsGamepadAvailable');
  late final _IsGamepadAvailable = _IsGamepadAvailablePtr.asFunction<bool Function(int)>();

  /// Get gamepad internal name id
  Pointer<Char> GetGamepadName(int gamepad)
    => _GetGamepadName(gamepad);
  late final _GetGamepadNamePtr = _lookup<NativeFunction<Pointer<Char> Function(Int)>>('GetGamepadName');
  late final _GetGamepadName = _GetGamepadNamePtr.asFunction<Pointer<Char> Function(int)>();

  /// Check if a gamepad button has been pressed once
  bool IsGamepadButtonPressed(int gamepad, int button)
    => _IsGamepadButtonPressed(gamepad, button);
  late final _IsGamepadButtonPressedPtr = _lookup<NativeFunction<Bool Function(Int, Int)>>('IsGamepadButtonPressed');
  late final _IsGamepadButtonPressed = _IsGamepadButtonPressedPtr.asFunction<bool Function(int, int)>();

  /// Check if a gamepad button is being pressed
  bool IsGamepadButtonDown(int gamepad, int button)
    => _IsGamepadButtonDown(gamepad, button);
  late final _IsGamepadButtonDownPtr = _lookup<NativeFunction<Bool Function(Int, Int)>>('IsGamepadButtonDown');
  late final _IsGamepadButtonDown = _IsGamepadButtonDownPtr.asFunction<bool Function(int, int)>();

  /// Check if a gamepad button has been released once
  bool IsGamepadButtonReleased(int gamepad, int button)
    => _IsGamepadButtonReleased(gamepad, button);
  late final _IsGamepadButtonReleasedPtr = _lookup<NativeFunction<Bool Function(Int, Int)>>('IsGamepadButtonReleased');
  late final _IsGamepadButtonReleased = _IsGamepadButtonReleasedPtr.asFunction<bool Function(int, int)>();

  /// Check if a gamepad button is NOT being pressed
  bool IsGamepadButtonUp(int gamepad, int button)
    => _IsGamepadButtonUp(gamepad, button);
  late final _IsGamepadButtonUpPtr = _lookup<NativeFunction<Bool Function(Int, Int)>>('IsGamepadButtonUp');
  late final _IsGamepadButtonUp = _IsGamepadButtonUpPtr.asFunction<bool Function(int, int)>();

  /// Get the last gamepad button pressed
  int GetGamepadButtonPressed()
    => _GetGamepadButtonPressed();
  late final _GetGamepadButtonPressedPtr = _lookup<NativeFunction<Int Function()>>('GetGamepadButtonPressed');
  late final _GetGamepadButtonPressed = _GetGamepadButtonPressedPtr.asFunction<int Function()>();

  /// Get gamepad axis count for a gamepad
  int GetGamepadAxisCount(int gamepad)
    => _GetGamepadAxisCount(gamepad);
  late final _GetGamepadAxisCountPtr = _lookup<NativeFunction<Int Function(Int)>>('GetGamepadAxisCount');
  late final _GetGamepadAxisCount = _GetGamepadAxisCountPtr.asFunction<int Function(int)>();

  /// Get axis movement value for a gamepad axis
  double GetGamepadAxisMovement(int gamepad, int axis)
    => _GetGamepadAxisMovement(gamepad, axis);
  late final _GetGamepadAxisMovementPtr = _lookup<NativeFunction<Float Function(Int, Int)>>('GetGamepadAxisMovement');
  late final _GetGamepadAxisMovement = _GetGamepadAxisMovementPtr.asFunction<double Function(int, int)>();

  /// Set internal gamepad mappings (SDL_GameControllerDB)
  int SetGamepadMappings(Pointer<Char> mappings)
    => _SetGamepadMappings(mappings);
  late final _SetGamepadMappingsPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('SetGamepadMappings');
  late final _SetGamepadMappings = _SetGamepadMappingsPtr.asFunction<int Function(Pointer<Char>)>();

  /// Set gamepad vibration for both motors (duration in seconds)
  void SetGamepadVibration(int gamepad, double leftMotor, double rightMotor, double duration)
    => _SetGamepadVibration(gamepad, leftMotor, rightMotor, duration);
  late final _SetGamepadVibrationPtr = _lookup<NativeFunction<Void Function(Int, Float, Float, Float)>>('SetGamepadVibration');
  late final _SetGamepadVibration = _SetGamepadVibrationPtr.asFunction<void Function(int, double, double, double)>();

  /// Check if a mouse button has been pressed once
  bool IsMouseButtonPressed(int button)
    => _IsMouseButtonPressed(button);
  late final _IsMouseButtonPressedPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsMouseButtonPressed');
  late final _IsMouseButtonPressed = _IsMouseButtonPressedPtr.asFunction<bool Function(int)>();

  /// Check if a mouse button is being pressed
  bool IsMouseButtonDown(int button)
    => _IsMouseButtonDown(button);
  late final _IsMouseButtonDownPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsMouseButtonDown');
  late final _IsMouseButtonDown = _IsMouseButtonDownPtr.asFunction<bool Function(int)>();

  /// Check if a mouse button has been released once
  bool IsMouseButtonReleased(int button)
    => _IsMouseButtonReleased(button);
  late final _IsMouseButtonReleasedPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsMouseButtonReleased');
  late final _IsMouseButtonReleased = _IsMouseButtonReleasedPtr.asFunction<bool Function(int)>();

  /// Check if a mouse button is NOT being pressed
  bool IsMouseButtonUp(int button)
    => _IsMouseButtonUp(button);
  late final _IsMouseButtonUpPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsMouseButtonUp');
  late final _IsMouseButtonUp = _IsMouseButtonUpPtr.asFunction<bool Function(int)>();

  /// Get mouse position X
  int GetMouseX()
    => _GetMouseX();
  late final _GetMouseXPtr = _lookup<NativeFunction<Int Function()>>('GetMouseX');
  late final _GetMouseX = _GetMouseXPtr.asFunction<int Function()>();

  /// Get mouse position Y
  int GetMouseY()
    => _GetMouseY();
  late final _GetMouseYPtr = _lookup<NativeFunction<Int Function()>>('GetMouseY');
  late final _GetMouseY = _GetMouseYPtr.asFunction<int Function()>();

  /// Get mouse position XY
  Vector2C GetMousePosition()
    => _GetMousePosition();
  late final _GetMousePositionPtr = _lookup<NativeFunction<Vector2C Function()>>('GetMousePosition');
  late final _GetMousePosition = _GetMousePositionPtr.asFunction<Vector2C Function()>();

  /// Get mouse delta between frames
  Vector2C GetMouseDelta()
    => _GetMouseDelta();
  late final _GetMouseDeltaPtr = _lookup<NativeFunction<Vector2C Function()>>('GetMouseDelta');
  late final _GetMouseDelta = _GetMouseDeltaPtr.asFunction<Vector2C Function()>();

  /// Set mouse position XY
  void SetMousePosition(int x, int y)
    => _SetMousePosition(x, y);
  late final _SetMousePositionPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetMousePosition');
  late final _SetMousePosition = _SetMousePositionPtr.asFunction<void Function(int, int)>();

  /// Set mouse offset
  void SetMouseOffset(int offsetX, int offsetY)
    => _SetMouseOffset(offsetX, offsetY);
  late final _SetMouseOffsetPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetMouseOffset');
  late final _SetMouseOffset = _SetMouseOffsetPtr.asFunction<void Function(int, int)>();

  /// Set mouse scaling
  void SetMouseScale(double scaleX, double scaleY)
    => _SetMouseScale(scaleX, scaleY);
  late final _SetMouseScalePtr = _lookup<NativeFunction<Void Function(Float, Float)>>('SetMouseScale');
  late final _SetMouseScale = _SetMouseScalePtr.asFunction<void Function(double, double)>();

  /// Get mouse wheel movement for X or Y, whichever is larger
  double GetMouseWheelMove()
    => _GetMouseWheelMove();
  late final _GetMouseWheelMovePtr = _lookup<NativeFunction<Float Function()>>('GetMouseWheelMove');
  late final _GetMouseWheelMove = _GetMouseWheelMovePtr.asFunction<double Function()>();

  /// Get mouse wheel movement for both X and Y
  Vector2C GetMouseWheelMoveV()
    => _GetMouseWheelMoveV();
  late final _GetMouseWheelMoveVPtr = _lookup<NativeFunction<Vector2C Function()>>('GetMouseWheelMoveV');
  late final _GetMouseWheelMoveV = _GetMouseWheelMoveVPtr.asFunction<Vector2C Function()>();

  /// Set mouse cursor
  void SetMouseCursor(int cursor)
    => _SetMouseCursor(cursor);
  late final _SetMouseCursorPtr = _lookup<NativeFunction<Void Function(Int)>>('SetMouseCursor');
  late final _SetMouseCursor = _SetMouseCursorPtr.asFunction<void Function(int)>();

  /// Get touch position X for touch point 0 (relative to screen size)
  int GetTouchX()
    => _GetTouchX();
  late final _GetTouchXPtr = _lookup<NativeFunction<Int Function()>>('GetTouchX');
  late final _GetTouchX = _GetTouchXPtr.asFunction<int Function()>();

  /// Get touch position Y for touch point 0 (relative to screen size)
  int GetTouchY()
    => _GetTouchY();
  late final _GetTouchYPtr = _lookup<NativeFunction<Int Function()>>('GetTouchY');
  late final _GetTouchY = _GetTouchYPtr.asFunction<int Function()>();

  /// Get touch position XY for a touch point index (relative to screen size)
  Vector2C GetTouchPosition(int index)
    => _GetTouchPosition(index);
  late final _GetTouchPositionPtr = _lookup<NativeFunction<Vector2C Function(Int)>>('GetTouchPosition');
  late final _GetTouchPosition = _GetTouchPositionPtr.asFunction<Vector2C Function(int)>();

  /// Get touch point identifier for given index
  int GetTouchPointId(int index)
    => _GetTouchPointId(index);
  late final _GetTouchPointIdPtr = _lookup<NativeFunction<Int Function(Int)>>('GetTouchPointId');
  late final _GetTouchPointId = _GetTouchPointIdPtr.asFunction<int Function(int)>();

  /// Get number of touch points
  int GetTouchPointCount()
    => _GetTouchPointCount();
  late final _GetTouchPointCountPtr = _lookup<NativeFunction<Int Function()>>('GetTouchPointCount');
  late final _GetTouchPointCount = _GetTouchPointCountPtr.asFunction<int Function()>();

  /// Enable a set of gestures using flags [Gesture]
  void SetGesturesEnabled(int flags)
    => _SetGesturesEnabled(flags);
  late final _SetGesturesEnabledPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('SetGesturesEnabled');
  late final _SetGesturesEnabled = _SetGesturesEnabledPtr.asFunction<void Function(int)>();

  /// Check if a gesture have been detected
  bool IsGestureDetected(int gesture)
    => _IsGestureDetected(gesture);
  late final _IsGestureDetectedPtr = _lookup<NativeFunction<Bool Function(UnsignedInt)>>('IsGestureDetected');
  late final _IsGestureDetected = _IsGestureDetectedPtr.asFunction<bool Function(int)>();

  /// Get latest detected gesture
  int GetGestureDetected()
    => _GetGestureDetected();
  late final _GetGestureDetectedPtr = _lookup<NativeFunction<Int Function()>>('GetGestureDetected');
  late final _GetGestureDetected = _GetGestureDetectedPtr.asFunction<int Function()>();

  /// Get gesture hold time in seconds
  double GetGestureHoldDuration()
    => _GetGestureHoldDuration();
  late final _GetGestureHoldDurationPtr = _lookup<NativeFunction<Float Function()>>('GetGestureHoldDuration');
  late final _GetGestureHoldDuration = _GetGestureHoldDurationPtr.asFunction<double Function()>();

  /// Get gesture drag vector
  Vector2C GetGestureDragVector()
    => _GetGestureDragVector();
  late final _GetGestureDragVectorPtr = _lookup<NativeFunction<Vector2C Function()>>('GetGestureDragVector');
  late final _GetGestureDragVector = _GetGestureDragVectorPtr.asFunction<Vector2C Function()>();

  /// Get gesture drag angle
  double GetGestureDragAngle()
    => _GetGestureDragAngle();
  late final _GetGestureDragAnglePtr = _lookup<NativeFunction<Float Function()>>('GetGestureDragAngle');
  late final _GetGestureDragAngle = _GetGestureDragAnglePtr.asFunction<double Function()>();

  /// Get gesture pinch delta
  Vector2C GetGesturePinchVector()
    => _GetGesturePinchVector();
  late final _GetGesturePinchVectorPtr = _lookup<NativeFunction<Vector2C Function()>>('GetGesturePinchVector');
  late final _GetGesturePinchVector = _GetGesturePinchVectorPtr.asFunction<Vector2C Function()>();

  /// Get gesture pinch angle
  double GetGesturePinchAngle()
    => _GetGesturePinchAngle();
  late final _GetGesturePinchAnglePtr = _lookup<NativeFunction<Float Function()>>('GetGesturePinchAngle');
  late final _GetGesturePinchAngle = _GetGesturePinchAnglePtr.asFunction<double Function()>();

  /// Process gesture event and translate it into gestures
  void ProcessGestureEvent(GestureEventC event)
    => _ProcessGestureEvent(event);
  late final _ProcessGestureEventPtr = _lookup<NativeFunction<Void Function(GestureEventC)>>('ProcessGestureEvent');
  late final _ProcessGestureEvent = _ProcessGestureEventPtr.asFunction<void Function(GestureEventC)>();

  /// Update gestures detected (must be called every frame)
  void UpdateGestures()
    => _UpdateGestures();
  late final _UpdateGesturesPtr = _lookup<NativeFunction<Void Function()>>('UpdateGestures');
  late final _UpdateGestures = _UpdateGesturesPtr.asFunction<void Function()>();

  /// Update camera position for selected mode
  void UpdateCamera(Pointer<Camera3DC> camera, int mode)
    => _UpdateCamera(camera, mode);
  late final _UpdateCameraPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Int)>>('UpdateCamera');
  late final _UpdateCamera = _UpdateCameraPtr.asFunction<void Function(Pointer<Camera3DC>, int)>();

  /// Update camera movement/rotation
  void UpdateCameraPro(Pointer<Camera3DC> camera, Vector3C movement, Vector3C rotation, double zoom)
    => _UpdateCameraPro(camera, movement, rotation, zoom);
  late final _UpdateCameraProPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Vector3C, Vector3C, Float)>>('UpdateCameraPro');
  late final _UpdateCameraPro = _UpdateCameraProPtr.asFunction<void Function(Pointer<Camera3DC>, Vector3C, Vector3C, double)>();

  /// Set texture and rectangle to be used on shapes drawing
  void SetShapesTexture(TextureC texture, RectangleC source)
    => _SetShapesTexture(texture, source);
  late final _SetShapesTexturePtr = _lookup<NativeFunction<Void Function(TextureC, RectangleC)>>('SetShapesTexture');
  late final _SetShapesTexture = _SetShapesTexturePtr.asFunction<void Function(TextureC, RectangleC)>();

  /// Get texture that is used for shapes drawing
  TextureC GetShapesTexture()
    => _GetShapesTexture();
  late final _GetShapesTexturePtr = _lookup<NativeFunction<TextureC Function()>>('GetShapesTexture');
  late final _GetShapesTexture = _GetShapesTexturePtr.asFunction<TextureC Function()>();

  /// Get texture source rectangle that is used for shapes drawing
  RectangleC GetShapesTextureRectangle()
    => _GetShapesTextureRectangle();
  late final _GetShapesTextureRectanglePtr = _lookup<NativeFunction<RectangleC Function()>>('GetShapesTextureRectangle');
  late final _GetShapesTextureRectangle = _GetShapesTextureRectanglePtr.asFunction<RectangleC Function()>();

  /// Draw a pixel using geometry [Can be slow, use with care]
  void DrawPixel(int posX, int posY, ColorC color)
    => _DrawPixel(posX, posY, color);
  late final _DrawPixelPtr = _lookup<NativeFunction<Void Function(Int, Int, ColorC)>>('DrawPixel');
  late final _DrawPixel = _DrawPixelPtr.asFunction<void Function(int, int, ColorC)>();

  /// Draw a pixel using geometry (Vector version) [Can be slow, use with care]
  void DrawPixelV(Vector2C position, ColorC color)
    => _DrawPixelV(position, color);
  late final _DrawPixelVPtr = _lookup<NativeFunction<Void Function(Vector2C, ColorC)>>('DrawPixelV');
  late final _DrawPixelV = _DrawPixelVPtr.asFunction<void Function(Vector2C, ColorC)>();

  /// Draw a line
  void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, ColorC color)
    => _DrawLine(startPosX, startPosY, endPosX, endPosY, color);
  late final _DrawLinePtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC)>>('DrawLine');
  late final _DrawLine = _DrawLinePtr.asFunction<void Function(int, int, int, int, ColorC)>();

  /// Draw a line (using gl lines)
  void DrawLineV(Vector2C startPos, Vector2C endPos, ColorC color)
    => _DrawLineV(startPos, endPos, color);
  late final _DrawLineVPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, ColorC)>>('DrawLineV');
  late final _DrawLineV = _DrawLineVPtr.asFunction<void Function(Vector2C, Vector2C, ColorC)>();

  /// Draw a line (using triangles/quads)
  void DrawLineEx(Vector2C startPos, Vector2C endPos, double thick, ColorC color)
    => _DrawLineEx(startPos, endPos, thick, color);
  late final _DrawLineExPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Float, ColorC)>>('DrawLineEx');
  late final _DrawLineEx = _DrawLineExPtr.asFunction<void Function(Vector2C, Vector2C, double, ColorC)>();

  /// Draw lines sequence (using gl lines)
  void DrawLineStrip(Pointer<Vector2C> points, int pointCount, ColorC color)
    => _DrawLineStrip(points, pointCount, color);
  late final _DrawLineStripPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, ColorC)>>('DrawLineStrip');
  late final _DrawLineStrip = _DrawLineStripPtr.asFunction<void Function(Pointer<Vector2C>, int, ColorC)>();

  /// Draw line segment cubic-bezier in-out interpolation
  void DrawLineBezier(Vector2C startPos, Vector2C endPos, double thick, ColorC color)
    => _DrawLineBezier(startPos, endPos, thick, color);
  late final _DrawLineBezierPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Float, ColorC)>>('DrawLineBezier');
  late final _DrawLineBezier = _DrawLineBezierPtr.asFunction<void Function(Vector2C, Vector2C, double, ColorC)>();

  /// Draw a dashed line
  void DrawLineDashed(Vector2C startPos, Vector2C endPos, int dashSize, int spaceSize, ColorC color)
    => _DrawLineDashed(startPos, endPos, dashSize, spaceSize, color);
  late final _DrawLineDashedPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Int, Int, ColorC)>>('DrawLineDashed');
  late final _DrawLineDashed = _DrawLineDashedPtr.asFunction<void Function(Vector2C, Vector2C, int, int, ColorC)>();

  /// Draw a color-filled circle
  void DrawCircle(int centerX, int centerY, double radius, ColorC color)
    => _DrawCircle(centerX, centerY, radius, color);
  late final _DrawCirclePtr = _lookup<NativeFunction<Void Function(Int, Int, Float, ColorC)>>('DrawCircle');
  late final _DrawCircle = _DrawCirclePtr.asFunction<void Function(int, int, double, ColorC)>();

  /// Draw a piece of a circle
  void DrawCircleSector(Vector2C center, double radius, double startAngle, double endAngle, int segments, ColorC color)
    => _DrawCircleSector(center, radius, startAngle, endAngle, segments, color);
  late final _DrawCircleSectorPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, Float, Int, ColorC)>>('DrawCircleSector');
  late final _DrawCircleSector = _DrawCircleSectorPtr.asFunction<void Function(Vector2C, double, double, double, int, ColorC)>();

  /// Draw circle sector outline
  void DrawCircleSectorLines(Vector2C center, double radius, double startAngle, double endAngle, int segments, ColorC color)
    => _DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color);
  late final _DrawCircleSectorLinesPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, Float, Int, ColorC)>>('DrawCircleSectorLines');
  late final _DrawCircleSectorLines = _DrawCircleSectorLinesPtr.asFunction<void Function(Vector2C, double, double, double, int, ColorC)>();

  /// Draw a gradient-filled circle
  void DrawCircleGradient(Vector2C center, double radius, ColorC inner, ColorC outer)
    => _DrawCircleGradient(center, radius, inner, outer);
  late final _DrawCircleGradientPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, ColorC, ColorC)>>('DrawCircleGradient');
  late final _DrawCircleGradient = _DrawCircleGradientPtr.asFunction<void Function(Vector2C, double, ColorC, ColorC)>();

  /// Draw a color-filled circle (Vector version)
  void DrawCircleV(Vector2C center, double radius, ColorC color)
    => _DrawCircleV(center, radius, color);
  late final _DrawCircleVPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, ColorC)>>('DrawCircleV');
  late final _DrawCircleV = _DrawCircleVPtr.asFunction<void Function(Vector2C, double, ColorC)>();

  /// Draw circle outline
  void DrawCircleLines(int centerX, int centerY, double radius, ColorC color)
    => _DrawCircleLines(centerX, centerY, radius, color);
  late final _DrawCircleLinesPtr = _lookup<NativeFunction<Void Function(Int, Int, Float, ColorC)>>('DrawCircleLines');
  late final _DrawCircleLines = _DrawCircleLinesPtr.asFunction<void Function(int, int, double, ColorC)>();

  /// Draw circle outline (Vector version)
  void DrawCircleLinesV(Vector2C center, double radius, ColorC color)
    => _DrawCircleLinesV(center, radius, color);
  late final _DrawCircleLinesVPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, ColorC)>>('DrawCircleLinesV');
  late final _DrawCircleLinesV = _DrawCircleLinesVPtr.asFunction<void Function(Vector2C, double, ColorC)>();

  /// Draw ellipse
  void DrawEllipse(int centerX, int centerY, double radiusH, double radiusV, ColorC color)
    => _DrawEllipse(centerX, centerY, radiusH, radiusV, color);
  late final _DrawEllipsePtr = _lookup<NativeFunction<Void Function(Int, Int, Float, Float, ColorC)>>('DrawEllipse');
  late final _DrawEllipse = _DrawEllipsePtr.asFunction<void Function(int, int, double, double, ColorC)>();

  /// Draw ellipse (Vector version)
  void DrawEllipseV(Vector2C center, double radiusH, double radiusV, ColorC color)
    => _DrawEllipseV(center, radiusH, radiusV, color);
  late final _DrawEllipseVPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, ColorC)>>('DrawEllipseV');
  late final _DrawEllipseV = _DrawEllipseVPtr.asFunction<void Function(Vector2C, double, double, ColorC)>();

  /// Draw ellipse outline
  void DrawEllipseLines(int centerX, int centerY, double radiusH, double radiusV, ColorC color)
    => _DrawEllipseLines(centerX, centerY, radiusH, radiusV, color);
  late final _DrawEllipseLinesPtr = _lookup<NativeFunction<Void Function(Int, Int, Float, Float, ColorC)>>('DrawEllipseLines');
  late final _DrawEllipseLines = _DrawEllipseLinesPtr.asFunction<void Function(int, int, double, double, ColorC)>();

  /// Draw ellipse outline (Vector version)
  void DrawEllipseLinesV(Vector2C center, double radiusH, double radiusV, ColorC color)
    => _DrawEllipseLinesV(center, radiusH, radiusV, color);
  late final _DrawEllipseLinesVPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, ColorC)>>('DrawEllipseLinesV');
  late final _DrawEllipseLinesV = _DrawEllipseLinesVPtr.asFunction<void Function(Vector2C, double, double, ColorC)>();

  /// Draw ring
  void DrawRing(Vector2C center, double innerRadius, double outerRadius, double startAngle, double endAngle, int segments, ColorC color)
    => _DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);
  late final _DrawRingPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, Float, Float, Int, ColorC)>>('DrawRing');
  late final _DrawRing = _DrawRingPtr.asFunction<void Function(Vector2C, double, double, double, double, int, ColorC)>();

  /// Draw ring outline
  void DrawRingLines(Vector2C center, double innerRadius, double outerRadius, double startAngle, double endAngle, int segments, ColorC color)
    => _DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);
  late final _DrawRingLinesPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, Float, Float, Int, ColorC)>>('DrawRingLines');
  late final _DrawRingLines = _DrawRingLinesPtr.asFunction<void Function(Vector2C, double, double, double, double, int, ColorC)>();

  /// Draw a color-filled rectangle
  void DrawRectangle(int posX, int posY, int width, int height, ColorC color)
    => _DrawRectangle(posX, posY, width, height, color);
  late final _DrawRectanglePtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC)>>('DrawRectangle');
  late final _DrawRectangle = _DrawRectanglePtr.asFunction<void Function(int, int, int, int, ColorC)>();

  /// Draw a color-filled rectangle (Vector version)
  void DrawRectangleV(Vector2C position, Vector2C size, ColorC color)
    => _DrawRectangleV(position, size, color);
  late final _DrawRectangleVPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, ColorC)>>('DrawRectangleV');
  late final _DrawRectangleV = _DrawRectangleVPtr.asFunction<void Function(Vector2C, Vector2C, ColorC)>();

  /// Draw a color-filled rectangle
  void DrawRectangleRec(RectangleC rec, ColorC color)
    => _DrawRectangleRec(rec, color);
  late final _DrawRectangleRecPtr = _lookup<NativeFunction<Void Function(RectangleC, ColorC)>>('DrawRectangleRec');
  late final _DrawRectangleRec = _DrawRectangleRecPtr.asFunction<void Function(RectangleC, ColorC)>();

  /// Draw a color-filled rectangle with pro parameters
  void DrawRectanglePro(RectangleC rec, Vector2C origin, double rotation, ColorC color)
    => _DrawRectanglePro(rec, origin, rotation, color);
  late final _DrawRectangleProPtr = _lookup<NativeFunction<Void Function(RectangleC, Vector2C, Float, ColorC)>>('DrawRectanglePro');
  late final _DrawRectanglePro = _DrawRectangleProPtr.asFunction<void Function(RectangleC, Vector2C, double, ColorC)>();

  /// Draw a vertical-gradient-filled rectangle
  void DrawRectangleGradientV(int posX, int posY, int width, int height, ColorC top, ColorC bottom)
    => _DrawRectangleGradientV(posX, posY, width, height, top, bottom);
  late final _DrawRectangleGradientVPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC, ColorC)>>('DrawRectangleGradientV');
  late final _DrawRectangleGradientV = _DrawRectangleGradientVPtr.asFunction<void Function(int, int, int, int, ColorC, ColorC)>();

  /// Draw a horizontal-gradient-filled rectangle
  void DrawRectangleGradientH(int posX, int posY, int width, int height, ColorC left, ColorC right)
    => _DrawRectangleGradientH(posX, posY, width, height, left, right);
  late final _DrawRectangleGradientHPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC, ColorC)>>('DrawRectangleGradientH');
  late final _DrawRectangleGradientH = _DrawRectangleGradientHPtr.asFunction<void Function(int, int, int, int, ColorC, ColorC)>();

  /// Draw a gradient-filled rectangle with custom vertex colors
  void DrawRectangleGradientEx(RectangleC rec, ColorC topLeft, ColorC bottomLeft, ColorC topRight, ColorC bottomRight)
    => _DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight);
  late final _DrawRectangleGradientExPtr = _lookup<NativeFunction<Void Function(RectangleC, ColorC, ColorC, ColorC, ColorC)>>('DrawRectangleGradientEx');
  late final _DrawRectangleGradientEx = _DrawRectangleGradientExPtr.asFunction<void Function(RectangleC, ColorC, ColorC, ColorC, ColorC)>();

  /// Draw rectangle outline
  void DrawRectangleLines(int posX, int posY, int width, int height, ColorC color)
    => _DrawRectangleLines(posX, posY, width, height, color);
  late final _DrawRectangleLinesPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC)>>('DrawRectangleLines');
  late final _DrawRectangleLines = _DrawRectangleLinesPtr.asFunction<void Function(int, int, int, int, ColorC)>();

  /// Draw rectangle outline with extended parameters
  void DrawRectangleLinesEx(RectangleC rec, double lineThick, ColorC color)
    => _DrawRectangleLinesEx(rec, lineThick, color);
  late final _DrawRectangleLinesExPtr = _lookup<NativeFunction<Void Function(RectangleC, Float, ColorC)>>('DrawRectangleLinesEx');
  late final _DrawRectangleLinesEx = _DrawRectangleLinesExPtr.asFunction<void Function(RectangleC, double, ColorC)>();

  /// Draw rectangle with rounded edges
  void DrawRectangleRounded(RectangleC rec, double roundness, int segments, ColorC color)
    => _DrawRectangleRounded(rec, roundness, segments, color);
  late final _DrawRectangleRoundedPtr = _lookup<NativeFunction<Void Function(RectangleC, Float, Int, ColorC)>>('DrawRectangleRounded');
  late final _DrawRectangleRounded = _DrawRectangleRoundedPtr.asFunction<void Function(RectangleC, double, int, ColorC)>();

  /// Draw rectangle lines with rounded edges
  void DrawRectangleRoundedLines(RectangleC rec, double roundness, int segments, ColorC color)
    => _DrawRectangleRoundedLines(rec, roundness, segments, color);
  late final _DrawRectangleRoundedLinesPtr = _lookup<NativeFunction<Void Function(RectangleC, Float, Int, ColorC)>>('DrawRectangleRoundedLines');
  late final _DrawRectangleRoundedLines = _DrawRectangleRoundedLinesPtr.asFunction<void Function(RectangleC, double, int, ColorC)>();

  /// Draw rectangle with rounded edges outline
  void DrawRectangleRoundedLinesEx(RectangleC rec, double roundness, int segments, double lineThick, ColorC color)
    => _DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color);
  late final _DrawRectangleRoundedLinesExPtr = _lookup<NativeFunction<Void Function(RectangleC, Float, Int, Float, ColorC)>>('DrawRectangleRoundedLinesEx');
  late final _DrawRectangleRoundedLinesEx = _DrawRectangleRoundedLinesExPtr.asFunction<void Function(RectangleC, double, int, double, ColorC)>();

  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle(Vector2C v1, Vector2C v2, Vector2C v3, ColorC color)
    => _DrawTriangle(v1, v2, v3, color);
  late final _DrawTrianglePtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, ColorC)>>('DrawTriangle');
  late final _DrawTriangle = _DrawTrianglePtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, ColorC)>();

  /// Draw triangle outline (vertex in counter-clockwise order!)
  void DrawTriangleLines(Vector2C v1, Vector2C v2, Vector2C v3, ColorC color)
    => _DrawTriangleLines(v1, v2, v3, color);
  late final _DrawTriangleLinesPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, ColorC)>>('DrawTriangleLines');
  late final _DrawTriangleLines = _DrawTriangleLinesPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, ColorC)>();

  /// Draw a triangle fan defined by points (first vertex is the center)
  void DrawTriangleFan(Pointer<Vector2C> points, int pointCount, ColorC color)
    => _DrawTriangleFan(points, pointCount, color);
  late final _DrawTriangleFanPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, ColorC)>>('DrawTriangleFan');
  late final _DrawTriangleFan = _DrawTriangleFanPtr.asFunction<void Function(Pointer<Vector2C>, int, ColorC)>();

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip(Pointer<Vector2C> points, int pointCount, ColorC color)
    => _DrawTriangleStrip(points, pointCount, color);
  late final _DrawTriangleStripPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, ColorC)>>('DrawTriangleStrip');
  late final _DrawTriangleStrip = _DrawTriangleStripPtr.asFunction<void Function(Pointer<Vector2C>, int, ColorC)>();

  /// Draw a regular polygon (Vector version)
  void DrawPoly(Vector2C center, int sides, double radius, double rotation, ColorC color)
    => _DrawPoly(center, sides, radius, rotation, color);
  late final _DrawPolyPtr = _lookup<NativeFunction<Void Function(Vector2C, Int, Float, Float, ColorC)>>('DrawPoly');
  late final _DrawPoly = _DrawPolyPtr.asFunction<void Function(Vector2C, int, double, double, ColorC)>();

  /// Draw a polygon outline of n sides
  void DrawPolyLines(Vector2C center, int sides, double radius, double rotation, ColorC color)
    => _DrawPolyLines(center, sides, radius, rotation, color);
  late final _DrawPolyLinesPtr = _lookup<NativeFunction<Void Function(Vector2C, Int, Float, Float, ColorC)>>('DrawPolyLines');
  late final _DrawPolyLines = _DrawPolyLinesPtr.asFunction<void Function(Vector2C, int, double, double, ColorC)>();

  /// Draw a polygon outline of n sides with extended parameters
  void DrawPolyLinesEx(Vector2C center, int sides, double radius, double rotation, double lineThick, ColorC color)
    => _DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color);
  late final _DrawPolyLinesExPtr = _lookup<NativeFunction<Void Function(Vector2C, Int, Float, Float, Float, ColorC)>>('DrawPolyLinesEx');
  late final _DrawPolyLinesEx = _DrawPolyLinesExPtr.asFunction<void Function(Vector2C, int, double, double, double, ColorC)>();

  /// Draw spline: Linear, minimum 2 points
  void DrawSplineLinear(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineLinear(points, pointCount, thick, color);
  late final _DrawSplineLinearPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineLinear');
  late final _DrawSplineLinear = _DrawSplineLinearPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  /// Draw spline: B-Spline, minimum 4 points
  void DrawSplineBasis(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineBasis(points, pointCount, thick, color);
  late final _DrawSplineBasisPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineBasis');
  late final _DrawSplineBasis = _DrawSplineBasisPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  /// Draw spline: Catmull-Rom, minimum 4 points
  void DrawSplineCatmullRom(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineCatmullRom(points, pointCount, thick, color);
  late final _DrawSplineCatmullRomPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineCatmullRom');
  late final _DrawSplineCatmullRom = _DrawSplineCatmullRomPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
  void DrawSplineBezierQuadratic(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineBezierQuadratic(points, pointCount, thick, color);
  late final _DrawSplineBezierQuadraticPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineBezierQuadratic');
  late final _DrawSplineBezierQuadratic = _DrawSplineBezierQuadraticPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
  void DrawSplineBezierCubic(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineBezierCubic(points, pointCount, thick, color);
  late final _DrawSplineBezierCubicPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineBezierCubic');
  late final _DrawSplineBezierCubic = _DrawSplineBezierCubicPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  /// Draw spline segment: Linear, 2 points
  void DrawSplineSegmentLinear(Vector2C p1, Vector2C p2, double thick, ColorC color)
    => _DrawSplineSegmentLinear(p1, p2, thick, color);
  late final _DrawSplineSegmentLinearPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentLinear');
  late final _DrawSplineSegmentLinear = _DrawSplineSegmentLinearPtr.asFunction<void Function(Vector2C, Vector2C, double, ColorC)>();

  /// Draw spline segment: B-Spline, 4 points
  void DrawSplineSegmentBasis(Vector2C p1, Vector2C p2, Vector2C p3, Vector2C p4, double thick, ColorC color)
    => _DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color);
  late final _DrawSplineSegmentBasisPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentBasis');
  late final _DrawSplineSegmentBasis = _DrawSplineSegmentBasisPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, Vector2C, double, ColorC)>();

  /// Draw spline segment: Catmull-Rom, 4 points
  void DrawSplineSegmentCatmullRom(Vector2C p1, Vector2C p2, Vector2C p3, Vector2C p4, double thick, ColorC color)
    => _DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color);
  late final _DrawSplineSegmentCatmullRomPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentCatmullRom');
  late final _DrawSplineSegmentCatmullRom = _DrawSplineSegmentCatmullRomPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, Vector2C, double, ColorC)>();

  /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
  void DrawSplineSegmentBezierQuadratic(Vector2C p1, Vector2C c2, Vector2C p3, double thick, ColorC color)
    => _DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color);
  late final _DrawSplineSegmentBezierQuadraticPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentBezierQuadratic');
  late final _DrawSplineSegmentBezierQuadratic = _DrawSplineSegmentBezierQuadraticPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, double, ColorC)>();

  /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
  void DrawSplineSegmentBezierCubic(Vector2C p1, Vector2C c2, Vector2C c3, Vector2C p4, double thick, ColorC color)
    => _DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color);
  late final _DrawSplineSegmentBezierCubicPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentBezierCubic');
  late final _DrawSplineSegmentBezierCubic = _DrawSplineSegmentBezierCubicPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, Vector2C, double, ColorC)>();

  /// Get (evaluate) spline point: Linear
  Vector2C GetSplinePointLinear(Vector2C startPos, Vector2C endPos, double t)
    => _GetSplinePointLinear(startPos, endPos, t);
  late final _GetSplinePointLinearPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Float)>>('GetSplinePointLinear');
  late final _GetSplinePointLinear = _GetSplinePointLinearPtr.asFunction<Vector2C Function(Vector2C, Vector2C, double)>();

  /// Get (evaluate) spline point: B-Spline
  Vector2C GetSplinePointBasis(Vector2C p1, Vector2C p2, Vector2C p3, Vector2C p4, double t)
    => _GetSplinePointBasis(p1, p2, p3, p4, t);
  late final _GetSplinePointBasisPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, Float)>>('GetSplinePointBasis');
  late final _GetSplinePointBasis = _GetSplinePointBasisPtr.asFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, double)>();

  /// Get (evaluate) spline point: Catmull-Rom
  Vector2C GetSplinePointCatmullRom(Vector2C p1, Vector2C p2, Vector2C p3, Vector2C p4, double t)
    => _GetSplinePointCatmullRom(p1, p2, p3, p4, t);
  late final _GetSplinePointCatmullRomPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, Float)>>('GetSplinePointCatmullRom');
  late final _GetSplinePointCatmullRom = _GetSplinePointCatmullRomPtr.asFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, double)>();

  /// Get (evaluate) spline point: Quadratic Bezier
  Vector2C GetSplinePointBezierQuad(Vector2C p1, Vector2C c2, Vector2C p3, double t)
    => _GetSplinePointBezierQuad(p1, c2, p3, t);
  late final _GetSplinePointBezierQuadPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Float)>>('GetSplinePointBezierQuad');
  late final _GetSplinePointBezierQuad = _GetSplinePointBezierQuadPtr.asFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, double)>();

  /// Get (evaluate) spline point: Cubic Bezier
  Vector2C GetSplinePointBezierCubic(Vector2C p1, Vector2C c2, Vector2C c3, Vector2C p4, double t)
    => _GetSplinePointBezierCubic(p1, c2, c3, p4, t);
  late final _GetSplinePointBezierCubicPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, Float)>>('GetSplinePointBezierCubic');
  late final _GetSplinePointBezierCubic = _GetSplinePointBezierCubicPtr.asFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, double)>();

  /// Check collision between two rectangles
  bool CheckCollisionRecs(RectangleC rec1, RectangleC rec2)
    => _CheckCollisionRecs(rec1, rec2);
  late final _CheckCollisionRecsPtr = _lookup<NativeFunction<Bool Function(RectangleC, RectangleC)>>('CheckCollisionRecs');
  late final _CheckCollisionRecs = _CheckCollisionRecsPtr.asFunction<bool Function(RectangleC, RectangleC)>();

  /// Check collision between two circles
  bool CheckCollisionCircles(Vector2C center1, double radius1, Vector2C center2, double radius2)
    => _CheckCollisionCircles(center1, radius1, center2, radius2);
  late final _CheckCollisionCirclesPtr = _lookup<NativeFunction<Bool Function(Vector2C, Float, Vector2C, Float)>>('CheckCollisionCircles');
  late final _CheckCollisionCircles = _CheckCollisionCirclesPtr.asFunction<bool Function(Vector2C, double, Vector2C, double)>();

  /// Check collision between circle and rectangle
  bool CheckCollisionCircleRec(Vector2C center, double radius, RectangleC rec)
    => _CheckCollisionCircleRec(center, radius, rec);
  late final _CheckCollisionCircleRecPtr = _lookup<NativeFunction<Bool Function(Vector2C, Float, RectangleC)>>('CheckCollisionCircleRec');
  late final _CheckCollisionCircleRec = _CheckCollisionCircleRecPtr.asFunction<bool Function(Vector2C, double, RectangleC)>();

  /// Check if circle collides with a line created betweeen two points [p1] and [p2]
  bool CheckCollisionCircleLine(Vector2C center, double radius, Vector2C p1, Vector2C p2)
    => _CheckCollisionCircleLine(center, radius, p1, p2);
  late final _CheckCollisionCircleLinePtr = _lookup<NativeFunction<Bool Function(Vector2C, Float, Vector2C, Vector2C)>>('CheckCollisionCircleLine');
  late final _CheckCollisionCircleLine = _CheckCollisionCircleLinePtr.asFunction<bool Function(Vector2C, double, Vector2C, Vector2C)>();

  /// Check if point is inside rectangle
  bool CheckCollisionPointRec(Vector2C point, RectangleC rec)
    => _CheckCollisionPointRec(point, rec);
  late final _CheckCollisionPointRecPtr = _lookup<NativeFunction<Bool Function(Vector2C, RectangleC)>>('CheckCollisionPointRec');
  late final _CheckCollisionPointRec = _CheckCollisionPointRecPtr.asFunction<bool Function(Vector2C, RectangleC)>();

  /// Check if point is inside circle
  bool CheckCollisionPointCircle(Vector2C point, Vector2C center, double radius)
    => _CheckCollisionPointCircle(point, center, radius);
  late final _CheckCollisionPointCirclePtr = _lookup<NativeFunction<Bool Function(Vector2C, Vector2C, Float)>>('CheckCollisionPointCircle');
  late final _CheckCollisionPointCircle = _CheckCollisionPointCirclePtr.asFunction<bool Function(Vector2C, Vector2C, double)>();

  /// Check if point is inside a triangle
  bool CheckCollisionPointTriangle(Vector2C point, Vector2C p1, Vector2C p2, Vector2C p3)
    => _CheckCollisionPointTriangle(point, p1, p2, p3);
  late final _CheckCollisionPointTrianglePtr = _lookup<NativeFunction<Bool Function(Vector2C, Vector2C, Vector2C, Vector2C)>>('CheckCollisionPointTriangle');
  late final _CheckCollisionPointTriangle = _CheckCollisionPointTrianglePtr.asFunction<bool Function(Vector2C, Vector2C, Vector2C, Vector2C)>();

  /// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
  bool CheckCollisionPointLine(Vector2C point, Vector2C p1, Vector2C p2, int threshold)
    => _CheckCollisionPointLine(point, p1, p2, threshold);
  late final _CheckCollisionPointLinePtr = _lookup<NativeFunction<Bool Function(Vector2C, Vector2C, Vector2C, Int)>>('CheckCollisionPointLine');
  late final _CheckCollisionPointLine = _CheckCollisionPointLinePtr.asFunction<bool Function(Vector2C, Vector2C, Vector2C, int)>();

  /// Check if point is within a polygon described by array of vertices
  bool CheckCollisionPointPoly(Vector2C point, Pointer<Vector2C> points, int pointCount)
    => _CheckCollisionPointPoly(point, points, pointCount);
  late final _CheckCollisionPointPolyPtr = _lookup<NativeFunction<Bool Function(Vector2C, Pointer<Vector2C>, Int)>>('CheckCollisionPointPoly');
  late final _CheckCollisionPointPoly = _CheckCollisionPointPolyPtr.asFunction<bool Function(Vector2C, Pointer<Vector2C>, int)>();

  /// Check the collision between two lines defined by two points each, returns collision point by reference
  bool CheckCollisionLines(Vector2C startPos1, Vector2C endPos1, Vector2C startPos2, Vector2C endPos2, Pointer<Vector2C> collisionPoint)
    => _CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint);
  late final _CheckCollisionLinesPtr = _lookup<NativeFunction<Bool Function(Vector2C, Vector2C, Vector2C, Vector2C, Pointer<Vector2C>)>>('CheckCollisionLines');
  late final _CheckCollisionLines = _CheckCollisionLinesPtr.asFunction<bool Function(Vector2C, Vector2C, Vector2C, Vector2C, Pointer<Vector2C>)>();

  /// Get collision rectangle for two rectangles collision
  RectangleC GetCollisionRec(RectangleC rec1, RectangleC rec2)
    => _GetCollisionRec(rec1, rec2);
  late final _GetCollisionRecPtr = _lookup<NativeFunction<RectangleC Function(RectangleC, RectangleC)>>('GetCollisionRec');
  late final _GetCollisionRec = _GetCollisionRecPtr.asFunction<RectangleC Function(RectangleC, RectangleC)>();

  /// Load image from file into CPU memory (RAM)
  ImageC LoadImage(Pointer<Char> fileName)
    => _LoadImage(fileName);
  late final _LoadImagePtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>)>>('LoadImage');
  late final _LoadImage = _LoadImagePtr.asFunction<ImageC Function(Pointer<Char>)>();

  /// Load image from RAW file data
  ImageC LoadImageRaw(Pointer<Char> fileName, int width, int height, int format, int headerSize)
    => _LoadImageRaw(fileName, width, height, format, headerSize);
  late final _LoadImageRawPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Int, Int, Int, Int)>>('LoadImageRaw');
  late final _LoadImageRaw = _LoadImageRawPtr.asFunction<ImageC Function(Pointer<Char>, int, int, int, int)>();

  /// Load image sequence from file (frames appended to image.data)
  ImageC LoadImageAnim(Pointer<Char> fileName, Pointer<Int> frames)
    => _LoadImageAnim(fileName, frames);
  late final _LoadImageAnimPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Pointer<Int>)>>('LoadImageAnim');
  late final _LoadImageAnim = _LoadImageAnimPtr.asFunction<ImageC Function(Pointer<Char>, Pointer<Int>)>();

  /// Load image sequence from memory buffer
  ImageC LoadImageAnimFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> fileData, int dataSize, Pointer<Int> frames)
    => _LoadImageAnimFromMemory(fileType, fileData, dataSize, frames);
  late final _LoadImageAnimFromMemoryPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Pointer<UnsignedChar>, Int, Pointer<Int>)>>('LoadImageAnimFromMemory');
  late final _LoadImageAnimFromMemory = _LoadImageAnimFromMemoryPtr.asFunction<ImageC Function(Pointer<Char>, Pointer<UnsignedChar>, int, Pointer<Int>)>();

  /// Load image from memory buffer, fileType refers to extension: i.e. '.png'
  ImageC LoadImageFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> fileData, int dataSize)
    => _LoadImageFromMemory(fileType, fileData, dataSize);
  late final _LoadImageFromMemoryPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Pointer<UnsignedChar>, Int)>>('LoadImageFromMemory');
  late final _LoadImageFromMemory = _LoadImageFromMemoryPtr.asFunction<ImageC Function(Pointer<Char>, Pointer<UnsignedChar>, int)>();

  /// Load image from GPU texture data
  ImageC LoadImageFromTexture(TextureC texture)
    => _LoadImageFromTexture(texture);
  late final _LoadImageFromTexturePtr = _lookup<NativeFunction<ImageC Function(TextureC)>>('LoadImageFromTexture');
  late final _LoadImageFromTexture = _LoadImageFromTexturePtr.asFunction<ImageC Function(TextureC)>();

  /// Load image from screen buffer and (screenshot)
  ImageC LoadImageFromScreen()
    => _LoadImageFromScreen();
  late final _LoadImageFromScreenPtr = _lookup<NativeFunction<ImageC Function()>>('LoadImageFromScreen');
  late final _LoadImageFromScreen = _LoadImageFromScreenPtr.asFunction<ImageC Function()>();

  /// Check if an image is valid (data and parameters)
  bool IsImageValid(ImageC image)
    => _IsImageValid(image);
  late final _IsImageValidPtr = _lookup<NativeFunction<Bool Function(ImageC)>>('IsImageValid');
  late final _IsImageValid = _IsImageValidPtr.asFunction<bool Function(ImageC)>();

  /// Unload image from CPU memory (RAM)
  void UnloadImage(ImageC image)
    => _UnloadImage(image);
  late final _UnloadImagePtr = _lookup<NativeFunction<Void Function(ImageC)>>('UnloadImage');
  late final _UnloadImage = _UnloadImagePtr.asFunction<void Function(ImageC)>();

  /// Export image data to file, returns true on success
  bool ExportImage(ImageC image, Pointer<Char> fileName)
    => _ExportImage(image, fileName);
  late final _ExportImagePtr = _lookup<NativeFunction<Bool Function(ImageC, Pointer<Char>)>>('ExportImage');
  late final _ExportImage = _ExportImagePtr.asFunction<bool Function(ImageC, Pointer<Char>)>();

  /// Export image to memory buffer
  Pointer<UnsignedChar> ExportImageToMemory(ImageC image, Pointer<Char> fileType, Pointer<Int> fileSize)
    => _ExportImageToMemory(image, fileType, fileSize);
  late final _ExportImageToMemoryPtr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(ImageC, Pointer<Char>, Pointer<Int>)>>('ExportImageToMemory');
  late final _ExportImageToMemory = _ExportImageToMemoryPtr.asFunction<Pointer<UnsignedChar> Function(ImageC, Pointer<Char>, Pointer<Int>)>();

  /// Export image as code file defining an array of bytes, returns true on success
  bool ExportImageAsCode(ImageC image, Pointer<Char> fileName)
    => _ExportImageAsCode(image, fileName);
  late final _ExportImageAsCodePtr = _lookup<NativeFunction<Bool Function(ImageC, Pointer<Char>)>>('ExportImageAsCode');
  late final _ExportImageAsCode = _ExportImageAsCodePtr.asFunction<bool Function(ImageC, Pointer<Char>)>();

  /// Generate image: plain color
  ImageC GenImageColor(int width, int height, ColorC color)
    => _GenImageColor(width, height, color);
  late final _GenImageColorPtr = _lookup<NativeFunction<ImageC Function(Int, Int, ColorC)>>('GenImageColor');
  late final _GenImageColor = _GenImageColorPtr.asFunction<ImageC Function(int, int, ColorC)>();

  /// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
  ImageC GenImageGradientLinear(int width, int height, int direction, ColorC start, ColorC end)
    => _GenImageGradientLinear(width, height, direction, start, end);
  late final _GenImageGradientLinearPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Int, ColorC, ColorC)>>('GenImageGradientLinear');
  late final _GenImageGradientLinear = _GenImageGradientLinearPtr.asFunction<ImageC Function(int, int, int, ColorC, ColorC)>();

  /// Generate image: radial gradient
  ImageC GenImageGradientRadial(int width, int height, double density, ColorC inner, ColorC outer)
    => _GenImageGradientRadial(width, height, density, inner, outer);
  late final _GenImageGradientRadialPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Float, ColorC, ColorC)>>('GenImageGradientRadial');
  late final _GenImageGradientRadial = _GenImageGradientRadialPtr.asFunction<ImageC Function(int, int, double, ColorC, ColorC)>();

  /// Generate image: square gradient
  ImageC GenImageGradientSquare(int width, int height, double density, ColorC inner, ColorC outer)
    => _GenImageGradientSquare(width, height, density, inner, outer);
  late final _GenImageGradientSquarePtr = _lookup<NativeFunction<ImageC Function(Int, Int, Float, ColorC, ColorC)>>('GenImageGradientSquare');
  late final _GenImageGradientSquare = _GenImageGradientSquarePtr.asFunction<ImageC Function(int, int, double, ColorC, ColorC)>();

  /// Generate image: checked
  ImageC GenImageChecked(int width, int height, int checksX, int checksY, ColorC col1, ColorC col2)
    => _GenImageChecked(width, height, checksX, checksY, col1, col2);
  late final _GenImageCheckedPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Int, Int, ColorC, ColorC)>>('GenImageChecked');
  late final _GenImageChecked = _GenImageCheckedPtr.asFunction<ImageC Function(int, int, int, int, ColorC, ColorC)>();

  /// Generate image: white noise
  ImageC GenImageWhiteNoise(int width, int height, double factor)
    => _GenImageWhiteNoise(width, height, factor);
  late final _GenImageWhiteNoisePtr = _lookup<NativeFunction<ImageC Function(Int, Int, Float)>>('GenImageWhiteNoise');
  late final _GenImageWhiteNoise = _GenImageWhiteNoisePtr.asFunction<ImageC Function(int, int, double)>();

  /// Generate image: perlin noise
  ImageC GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, double scale)
    => _GenImagePerlinNoise(width, height, offsetX, offsetY, scale);
  late final _GenImagePerlinNoisePtr = _lookup<NativeFunction<ImageC Function(Int, Int, Int, Int, Float)>>('GenImagePerlinNoise');
  late final _GenImagePerlinNoise = _GenImagePerlinNoisePtr.asFunction<ImageC Function(int, int, int, int, double)>();

  /// Generate image: cellular algorithm, bigger tileSize means bigger cells
  ImageC GenImageCellular(int width, int height, int tileSize)
    => _GenImageCellular(width, height, tileSize);
  late final _GenImageCellularPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Int)>>('GenImageCellular');
  late final _GenImageCellular = _GenImageCellularPtr.asFunction<ImageC Function(int, int, int)>();

  /// Generate image: grayscale image from text data
  ImageC GenImageText(int width, int height, Pointer<Char> text)
    => _GenImageText(width, height, text);
  late final _GenImageTextPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Pointer<Char>)>>('GenImageText');
  late final _GenImageText = _GenImageTextPtr.asFunction<ImageC Function(int, int, Pointer<Char>)>();

  /// Create an image duplicate (useful for transformations)
  ImageC ImageCopy(ImageC image)
    => _ImageCopy(image);
  late final _ImageCopyPtr = _lookup<NativeFunction<ImageC Function(ImageC)>>('ImageCopy');
  late final _ImageCopy = _ImageCopyPtr.asFunction<ImageC Function(ImageC)>();

  /// Create an image from another image piece
  ImageC ImageFromImage(ImageC image, RectangleC rec)
    => _ImageFromImage(image, rec);
  late final _ImageFromImagePtr = _lookup<NativeFunction<ImageC Function(ImageC, RectangleC)>>('ImageFromImage');
  late final _ImageFromImage = _ImageFromImagePtr.asFunction<ImageC Function(ImageC, RectangleC)>();

  /// Create an image from a selected channel of another image (GRAYSCALE)
  ImageC ImageFromChannel(ImageC image, int selectedChannel)
    => _ImageFromChannel(image, selectedChannel);
  late final _ImageFromChannelPtr = _lookup<NativeFunction<ImageC Function(ImageC, Int)>>('ImageFromChannel');
  late final _ImageFromChannel = _ImageFromChannelPtr.asFunction<ImageC Function(ImageC, int)>();

  /// Create an image from text (default font)
  ImageC ImageText(Pointer<Char> text, int fontSize, ColorC color)
    => _ImageText(text, fontSize, color);
  late final _ImageTextPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Int, ColorC)>>('ImageText');
  late final _ImageText = _ImageTextPtr.asFunction<ImageC Function(Pointer<Char>, int, ColorC)>();

  /// Create an image from text (custom sprite font)
  ImageC ImageTextEx(FontC font, Pointer<Char> text, double fontSize, double spacing, ColorC tint)
    => _ImageTextEx(font, text, fontSize, spacing, tint);
  late final _ImageTextExPtr = _lookup<NativeFunction<ImageC Function(FontC, Pointer<Char>, Float, Float, ColorC)>>('ImageTextEx');
  late final _ImageTextEx = _ImageTextExPtr.asFunction<ImageC Function(FontC, Pointer<Char>, double, double, ColorC)>();

  /// Convert image data to desired format
  void ImageFormat(Pointer<ImageC> image, int newFormat)
    => _ImageFormat(image, newFormat);
  late final _ImageFormatPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('ImageFormat');
  late final _ImageFormat = _ImageFormatPtr.asFunction<void Function(Pointer<ImageC>, int)>();

  /// Convert image to POT (power-of-two)
  void ImageToPOT(Pointer<ImageC> image, ColorC fill)
    => _ImageToPOT(image, fill);
  late final _ImageToPOTPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC)>>('ImageToPOT');
  late final _ImageToPOT = _ImageToPOTPtr.asFunction<void Function(Pointer<ImageC>, ColorC)>();

  /// Crop an image to a defined rectangle
  void ImageCrop(Pointer<ImageC> image, RectangleC crop)
    => _ImageCrop(image, crop);
  late final _ImageCropPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, RectangleC)>>('ImageCrop');
  late final _ImageCrop = _ImageCropPtr.asFunction<void Function(Pointer<ImageC>, RectangleC)>();

  /// Crop image depending on alpha value
  void ImageAlphaCrop(Pointer<ImageC> image, double threshold)
    => _ImageAlphaCrop(image, threshold);
  late final _ImageAlphaCropPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Float)>>('ImageAlphaCrop');
  late final _ImageAlphaCrop = _ImageAlphaCropPtr.asFunction<void Function(Pointer<ImageC>, double)>();

  /// Clear alpha channel to desired color
  void ImageAlphaClear(Pointer<ImageC> image, ColorC color, double threshold)
    => _ImageAlphaClear(image, color, threshold);
  late final _ImageAlphaClearPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC, Float)>>('ImageAlphaClear');
  late final _ImageAlphaClear = _ImageAlphaClearPtr.asFunction<void Function(Pointer<ImageC>, ColorC, double)>();

  /// Apply alpha mask to image
  void ImageAlphaMask(Pointer<ImageC> image, ImageC alphaMask)
    => _ImageAlphaMask(image, alphaMask);
  late final _ImageAlphaMaskPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ImageC)>>('ImageAlphaMask');
  late final _ImageAlphaMask = _ImageAlphaMaskPtr.asFunction<void Function(Pointer<ImageC>, ImageC)>();

  /// Premultiply alpha channel
  void ImageAlphaPremultiply(Pointer<ImageC> image)
    => _ImageAlphaPremultiply(image);
  late final _ImageAlphaPremultiplyPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageAlphaPremultiply');
  late final _ImageAlphaPremultiply = _ImageAlphaPremultiplyPtr.asFunction<void Function(Pointer<ImageC>)>();

  /// Apply Gaussian blur using a box blur approximation
  void ImageBlurGaussian(Pointer<ImageC> image, int blurSize)
    => _ImageBlurGaussian(image, blurSize);
  late final _ImageBlurGaussianPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('ImageBlurGaussian');
  late final _ImageBlurGaussian = _ImageBlurGaussianPtr.asFunction<void Function(Pointer<ImageC>, int)>();

  /// Apply custom square convolution kernel to image
  void ImageKernelConvolution(Pointer<ImageC> image, Pointer<Float> kernel, int kernelSize)
    => _ImageKernelConvolution(image, kernel, kernelSize);
  late final _ImageKernelConvolutionPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Pointer<Float>, Int)>>('ImageKernelConvolution');
  late final _ImageKernelConvolution = _ImageKernelConvolutionPtr.asFunction<void Function(Pointer<ImageC>, Pointer<Float>, int)>();

  /// Resize image (Bicubic scaling algorithm)
  void ImageResize(Pointer<ImageC> image, int newWidth, int newHeight)
    => _ImageResize(image, newWidth, newHeight);
  late final _ImageResizePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int)>>('ImageResize');
  late final _ImageResize = _ImageResizePtr.asFunction<void Function(Pointer<ImageC>, int, int)>();

  /// Resize image (Nearest-Neighbor scaling algorithm)
  void ImageResizeNN(Pointer<ImageC> image, int newWidth, int newHeight)
    => _ImageResizeNN(image, newWidth, newHeight);
  late final _ImageResizeNNPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int)>>('ImageResizeNN');
  late final _ImageResizeNN = _ImageResizeNNPtr.asFunction<void Function(Pointer<ImageC>, int, int)>();

  /// Resize canvas and fill with color
  void ImageResizeCanvas(Pointer<ImageC> image, int newWidth, int newHeight, int offsetX, int offsetY, ColorC fill)
    => _ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill);
  late final _ImageResizeCanvasPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, Int, ColorC)>>('ImageResizeCanvas');
  late final _ImageResizeCanvas = _ImageResizeCanvasPtr.asFunction<void Function(Pointer<ImageC>, int, int, int, int, ColorC)>();

  /// Compute all mipmap levels for a provided image
  void ImageMipmaps(Pointer<ImageC> image)
    => _ImageMipmaps(image);
  late final _ImageMipmapsPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageMipmaps');
  late final _ImageMipmaps = _ImageMipmapsPtr.asFunction<void Function(Pointer<ImageC>)>();

  /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  void ImageDither(Pointer<ImageC> image, int rBpp, int gBpp, int bBpp, int aBpp)
    => _ImageDither(image, rBpp, gBpp, bBpp, aBpp);
  late final _ImageDitherPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, Int)>>('ImageDither');
  late final _ImageDither = _ImageDitherPtr.asFunction<void Function(Pointer<ImageC>, int, int, int, int)>();

  /// Flip image vertically
  void ImageFlipVertical(Pointer<ImageC> image)
    => _ImageFlipVertical(image);
  late final _ImageFlipVerticalPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageFlipVertical');
  late final _ImageFlipVertical = _ImageFlipVerticalPtr.asFunction<void Function(Pointer<ImageC>)>();

  /// Flip image horizontally
  void ImageFlipHorizontal(Pointer<ImageC> image)
    => _ImageFlipHorizontal(image);
  late final _ImageFlipHorizontalPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageFlipHorizontal');
  late final _ImageFlipHorizontal = _ImageFlipHorizontalPtr.asFunction<void Function(Pointer<ImageC>)>();

  /// Rotate image by input angle in degrees (-359 to 359)
  void ImageRotate(Pointer<ImageC> image, int degrees)
    => _ImageRotate(image, degrees);
  late final _ImageRotatePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('ImageRotate');
  late final _ImageRotate = _ImageRotatePtr.asFunction<void Function(Pointer<ImageC>, int)>();

  /// Rotate image clockwise 90deg
  void ImageRotateCW(Pointer<ImageC> image)
    => _ImageRotateCW(image);
  late final _ImageRotateCWPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageRotateCW');
  late final _ImageRotateCW = _ImageRotateCWPtr.asFunction<void Function(Pointer<ImageC>)>();

  /// Rotate image counter-clockwise 90deg
  void ImageRotateCCW(Pointer<ImageC> image)
    => _ImageRotateCCW(image);
  late final _ImageRotateCCWPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageRotateCCW');
  late final _ImageRotateCCW = _ImageRotateCCWPtr.asFunction<void Function(Pointer<ImageC>)>();

  /// Modify image color: tint
  void ImageColorTint(Pointer<ImageC> image, ColorC color)
    => _ImageColorTint(image, color);
  late final _ImageColorTintPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC)>>('ImageColorTint');
  late final _ImageColorTint = _ImageColorTintPtr.asFunction<void Function(Pointer<ImageC>, ColorC)>();

  /// Modify image color: invert
  void ImageColorInvert(Pointer<ImageC> image)
    => _ImageColorInvert(image);
  late final _ImageColorInvertPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageColorInvert');
  late final _ImageColorInvert = _ImageColorInvertPtr.asFunction<void Function(Pointer<ImageC>)>();

  /// Modify image color: grayscale
  void ImageColorGrayscale(Pointer<ImageC> image)
    => _ImageColorGrayscale(image);
  late final _ImageColorGrayscalePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageColorGrayscale');
  late final _ImageColorGrayscale = _ImageColorGrayscalePtr.asFunction<void Function(Pointer<ImageC>)>();

  /// Modify image color: contrast (-100 to 100)
  void ImageColorContrast(Pointer<ImageC> image, double contrast)
    => _ImageColorContrast(image, contrast);
  late final _ImageColorContrastPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Float)>>('ImageColorContrast');
  late final _ImageColorContrast = _ImageColorContrastPtr.asFunction<void Function(Pointer<ImageC>, double)>();

  /// Modify image color: brightness (-255 to 255)
  void ImageColorBrightness(Pointer<ImageC> image, int brightness)
    => _ImageColorBrightness(image, brightness);
  late final _ImageColorBrightnessPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('ImageColorBrightness');
  late final _ImageColorBrightness = _ImageColorBrightnessPtr.asFunction<void Function(Pointer<ImageC>, int)>();

  /// Modify image color: replace color
  void ImageColorReplace(Pointer<ImageC> image, ColorC color, ColorC replace)
    => _ImageColorReplace(image, color, replace);
  late final _ImageColorReplacePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC, ColorC)>>('ImageColorReplace');
  late final _ImageColorReplace = _ImageColorReplacePtr.asFunction<void Function(Pointer<ImageC>, ColorC, ColorC)>();

  /// Load color data from image as a Color array (RGBA - 32bit)
  Pointer<ColorC> LoadImageColors(ImageC image)
    => _LoadImageColors(image);
  late final _LoadImageColorsPtr = _lookup<NativeFunction<Pointer<ColorC> Function(ImageC)>>('LoadImageColors');
  late final _LoadImageColors = _LoadImageColorsPtr.asFunction<Pointer<ColorC> Function(ImageC)>();

  /// Load colors palette from image as a Color array (RGBA - 32bit)
  Pointer<ColorC> LoadImagePalette(ImageC image, int maxPaletteSize, Pointer<Int> colorCount)
    => _LoadImagePalette(image, maxPaletteSize, colorCount);
  late final _LoadImagePalettePtr = _lookup<NativeFunction<Pointer<ColorC> Function(ImageC, Int, Pointer<Int>)>>('LoadImagePalette');
  late final _LoadImagePalette = _LoadImagePalettePtr.asFunction<Pointer<ColorC> Function(ImageC, int, Pointer<Int>)>();

  /// Unload color data loaded with LoadImageColors()
  void UnloadImageColors(Pointer<ColorC> colors)
    => _UnloadImageColors(colors);
  late final _UnloadImageColorsPtr = _lookup<NativeFunction<Void Function(Pointer<ColorC>)>>('UnloadImageColors');
  late final _UnloadImageColors = _UnloadImageColorsPtr.asFunction<void Function(Pointer<ColorC>)>();

  /// Unload colors palette loaded with LoadImagePalette()
  void UnloadImagePalette(Pointer<ColorC> colors)
    => _UnloadImagePalette(colors);
  late final _UnloadImagePalettePtr = _lookup<NativeFunction<Void Function(Pointer<ColorC>)>>('UnloadImagePalette');
  late final _UnloadImagePalette = _UnloadImagePalettePtr.asFunction<void Function(Pointer<ColorC>)>();

  /// Get image alpha border rectangle
  RectangleC GetImageAlphaBorder(ImageC image, double threshold)
    => _GetImageAlphaBorder(image, threshold);
  late final _GetImageAlphaBorderPtr = _lookup<NativeFunction<RectangleC Function(ImageC, Float)>>('GetImageAlphaBorder');
  late final _GetImageAlphaBorder = _GetImageAlphaBorderPtr.asFunction<RectangleC Function(ImageC, double)>();

  /// Get image pixel color at (x, y) position
  ColorC GetImageColor(ImageC image, int x, int y)
    => _GetImageColor(image, x, y);
  late final _GetImageColorPtr = _lookup<NativeFunction<ColorC Function(ImageC, Int, Int)>>('GetImageColor');
  late final _GetImageColor = _GetImageColorPtr.asFunction<ColorC Function(ImageC, int, int)>();

  /// Clear image background with given color
  void ImageClearBackground(Pointer<ImageC> dst, ColorC color)
    => _ImageClearBackground(dst, color);
  late final _ImageClearBackgroundPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC)>>('ImageClearBackground');
  late final _ImageClearBackground = _ImageClearBackgroundPtr.asFunction<void Function(Pointer<ImageC>, ColorC)>();

  /// Draw pixel within an image
  void ImageDrawPixel(Pointer<ImageC> dst, int posX, int posY, ColorC color)
    => _ImageDrawPixel(dst, posX, posY, color);
  late final _ImageDrawPixelPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, ColorC)>>('ImageDrawPixel');
  late final _ImageDrawPixel = _ImageDrawPixelPtr.asFunction<void Function(Pointer<ImageC>, int, int, ColorC)>();

  /// Draw pixel within an image (Vector version)
  void ImageDrawPixelV(Pointer<ImageC> dst, Vector2C position, ColorC color)
    => _ImageDrawPixelV(dst, position, color);
  late final _ImageDrawPixelVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, ColorC)>>('ImageDrawPixelV');
  late final _ImageDrawPixelV = _ImageDrawPixelVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, ColorC)>();

  /// Draw line within an image
  void ImageDrawLine(Pointer<ImageC> dst, int startPosX, int startPosY, int endPosX, int endPosY, ColorC color)
    => _ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color);
  late final _ImageDrawLinePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, Int, ColorC)>>('ImageDrawLine');
  late final _ImageDrawLine = _ImageDrawLinePtr.asFunction<void Function(Pointer<ImageC>, int, int, int, int, ColorC)>();

  /// Draw line within an image (Vector version)
  void ImageDrawLineV(Pointer<ImageC> dst, Vector2C start, Vector2C end, ColorC color)
    => _ImageDrawLineV(dst, start, end, color);
  late final _ImageDrawLineVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, ColorC)>>('ImageDrawLineV');
  late final _ImageDrawLineV = _ImageDrawLineVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, ColorC)>();

  /// Draw a line defining thickness within an image
  void ImageDrawLineEx(Pointer<ImageC> dst, Vector2C start, Vector2C end, int thick, ColorC color)
    => _ImageDrawLineEx(dst, start, end, thick, color);
  late final _ImageDrawLineExPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, Int, ColorC)>>('ImageDrawLineEx');
  late final _ImageDrawLineEx = _ImageDrawLineExPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, int, ColorC)>();

  /// Draw a filled circle within an image
  void ImageDrawCircle(Pointer<ImageC> dst, int centerX, int centerY, int radius, ColorC color)
    => _ImageDrawCircle(dst, centerX, centerY, radius, color);
  late final _ImageDrawCirclePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, ColorC)>>('ImageDrawCircle');
  late final _ImageDrawCircle = _ImageDrawCirclePtr.asFunction<void Function(Pointer<ImageC>, int, int, int, ColorC)>();

  /// Draw a filled circle within an image (Vector version)
  void ImageDrawCircleV(Pointer<ImageC> dst, Vector2C center, int radius, ColorC color)
    => _ImageDrawCircleV(dst, center, radius, color);
  late final _ImageDrawCircleVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Int, ColorC)>>('ImageDrawCircleV');
  late final _ImageDrawCircleV = _ImageDrawCircleVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, int, ColorC)>();

  /// Draw circle outline within an image
  void ImageDrawCircleLines(Pointer<ImageC> dst, int centerX, int centerY, int radius, ColorC color)
    => _ImageDrawCircleLines(dst, centerX, centerY, radius, color);
  late final _ImageDrawCircleLinesPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, ColorC)>>('ImageDrawCircleLines');
  late final _ImageDrawCircleLines = _ImageDrawCircleLinesPtr.asFunction<void Function(Pointer<ImageC>, int, int, int, ColorC)>();

  /// Draw circle outline within an image (Vector version)
  void ImageDrawCircleLinesV(Pointer<ImageC> dst, Vector2C center, int radius, ColorC color)
    => _ImageDrawCircleLinesV(dst, center, radius, color);
  late final _ImageDrawCircleLinesVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Int, ColorC)>>('ImageDrawCircleLinesV');
  late final _ImageDrawCircleLinesV = _ImageDrawCircleLinesVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, int, ColorC)>();

  /// Draw rectangle within an image
  void ImageDrawRectangle(Pointer<ImageC> dst, int posX, int posY, int width, int height, ColorC color)
    => _ImageDrawRectangle(dst, posX, posY, width, height, color);
  late final _ImageDrawRectanglePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, Int, ColorC)>>('ImageDrawRectangle');
  late final _ImageDrawRectangle = _ImageDrawRectanglePtr.asFunction<void Function(Pointer<ImageC>, int, int, int, int, ColorC)>();

  /// Draw rectangle within an image (Vector version)
  void ImageDrawRectangleV(Pointer<ImageC> dst, Vector2C position, Vector2C size, ColorC color)
    => _ImageDrawRectangleV(dst, position, size, color);
  late final _ImageDrawRectangleVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, ColorC)>>('ImageDrawRectangleV');
  late final _ImageDrawRectangleV = _ImageDrawRectangleVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, ColorC)>();

  /// Draw rectangle within an image
  void ImageDrawRectangleRec(Pointer<ImageC> dst, RectangleC rec, ColorC color)
    => _ImageDrawRectangleRec(dst, rec, color);
  late final _ImageDrawRectangleRecPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, RectangleC, ColorC)>>('ImageDrawRectangleRec');
  late final _ImageDrawRectangleRec = _ImageDrawRectangleRecPtr.asFunction<void Function(Pointer<ImageC>, RectangleC, ColorC)>();

  /// Draw rectangle lines within an image
  void ImageDrawRectangleLines(Pointer<ImageC> dst, RectangleC rec, int thick, ColorC color)
    => _ImageDrawRectangleLines(dst, rec, thick, color);
  late final _ImageDrawRectangleLinesPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, RectangleC, Int, ColorC)>>('ImageDrawRectangleLines');
  late final _ImageDrawRectangleLines = _ImageDrawRectangleLinesPtr.asFunction<void Function(Pointer<ImageC>, RectangleC, int, ColorC)>();

  /// Draw triangle within an image
  void ImageDrawTriangle(Pointer<ImageC> dst, Vector2C v1, Vector2C v2, Vector2C v3, ColorC color)
    => _ImageDrawTriangle(dst, v1, v2, v3, color);
  late final _ImageDrawTrianglePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC)>>('ImageDrawTriangle');
  late final _ImageDrawTriangle = _ImageDrawTrianglePtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC)>();

  /// Draw triangle with interpolated colors within an image
  void ImageDrawTriangleEx(Pointer<ImageC> dst, Vector2C v1, Vector2C v2, Vector2C v3, ColorC c1, ColorC c2, ColorC c3)
    => _ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3);
  late final _ImageDrawTriangleExPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC, ColorC, ColorC)>>('ImageDrawTriangleEx');
  late final _ImageDrawTriangleEx = _ImageDrawTriangleExPtr.asFunction<void Function(Pointer<ImageC>,Vector2C,Vector2C,Vector2C,ColorC,ColorC,ColorC)>();

  /// Draw triangle outline within an image
  void ImageDrawTriangleLines(Pointer<ImageC> dst, Vector2C v1, Vector2C v2, Vector2C v3, ColorC color)
    => _ImageDrawTriangleLines(dst, v1, v2, v3, color);
  late final _ImageDrawTriangleLinesPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC)>>('ImageDrawTriangleLines');
  late final _ImageDrawTriangleLines = _ImageDrawTriangleLinesPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC)>();

  /// Draw a triangle fan defined by points within an image (first vertex is the center)
  void ImageDrawTriangleFan(Pointer<ImageC> dst, Pointer<Vector2C> points, int pointCount, ColorC color)
    => _ImageDrawTriangleFan(dst, points, pointCount, color);
  late final _ImageDrawTriangleFanPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Pointer<Vector2C>, Int, ColorC)>>('ImageDrawTriangleFan');
  late final _ImageDrawTriangleFan = _ImageDrawTriangleFanPtr.asFunction<void Function(Pointer<ImageC>, Pointer<Vector2C>, int, ColorC)>();

  /// Draw a triangle strip defined by points within an image
  void ImageDrawTriangleStrip(Pointer<ImageC> dst, Pointer<Vector2C> points, int pointCount, ColorC color)
    => _ImageDrawTriangleStrip(dst, points, pointCount, color);
  late final _ImageDrawTriangleStripPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Pointer<Vector2C>, Int, ColorC)>>('ImageDrawTriangleStrip');
  late final _ImageDrawTriangleStrip = _ImageDrawTriangleStripPtr.asFunction<void Function(Pointer<ImageC>, Pointer<Vector2C>, int, ColorC)>();

  /// Draw a source image within a destination image (tint applied to source)
  void ImageDraw(Pointer<ImageC> dst, ImageC src, RectangleC srcRec, RectangleC dstRec, ColorC tint)
    => _ImageDraw(dst, src, srcRec, dstRec, tint);
  late final _ImageDrawPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ImageC, RectangleC, RectangleC, ColorC)>>('ImageDraw');
  late final _ImageDraw = _ImageDrawPtr.asFunction<void Function(Pointer<ImageC>, ImageC, RectangleC, RectangleC, ColorC)>();

  /// Draw text (using default font) within an image (destination)
  void ImageDrawText(Pointer<ImageC> dst, Pointer<Char> text, int posX, int posY, int fontSize, ColorC color)
    => _ImageDrawText(dst, text, posX, posY, fontSize, color);
  late final _ImageDrawTextPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Pointer<Char>, Int, Int, Int, ColorC)>>('ImageDrawText');
  late final _ImageDrawText = _ImageDrawTextPtr.asFunction<void Function(Pointer<ImageC>, Pointer<Char>, int, int, int, ColorC)>();

  /// Draw text (custom sprite font) within an image (destination)
  void ImageDrawTextEx(Pointer<ImageC> dst, FontC font, Pointer<Char> text, Vector2C position, double fontSize, double spacing, ColorC tint)
    => _ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint);
  late final _ImageDrawTextExPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, FontC, Pointer<Char>, Vector2C, Float, Float, ColorC)>>('ImageDrawTextEx');
  late final _ImageDrawTextEx = _ImageDrawTextExPtr.asFunction<void Function(Pointer<ImageC>, FontC, Pointer<Char>, Vector2C, double, double, ColorC)>();

  /// Load texture from file into GPU memory (VRAM)
  TextureC LoadTexture(Pointer<Char> fileName)
    => _LoadTexture(fileName);
  late final _LoadTexturePtr = _lookup<NativeFunction<TextureC Function(Pointer<Char>)>>('LoadTexture');
  late final _LoadTexture = _LoadTexturePtr.asFunction<TextureC Function(Pointer<Char>)>();

  /// Load texture from image data
  TextureC LoadTextureFromImage(ImageC image)
    => _LoadTextureFromImage(image);
  late final _LoadTextureFromImagePtr = _lookup<NativeFunction<TextureC Function(ImageC)>>('LoadTextureFromImage');
  late final _LoadTextureFromImage = _LoadTextureFromImagePtr.asFunction<TextureC Function(ImageC)>();

  /// Load cubemap from image, multiple image cubemap layouts supported
  TextureC LoadTextureCubemap(ImageC image, int layout)
    => _LoadTextureCubemap(image, layout);
  late final _LoadTextureCubemapPtr = _lookup<NativeFunction<TextureC Function(ImageC, Int)>>('LoadTextureCubemap');
  late final _LoadTextureCubemap = _LoadTextureCubemapPtr.asFunction<TextureC Function(ImageC, int)>();

  /// Load texture for rendering (framebuffer)
  RenderTextureC LoadRenderTexture(int width, int height)
    => _LoadRenderTexture(width, height);
  late final _LoadRenderTexturePtr = _lookup<NativeFunction<RenderTextureC Function(Int, Int)>>('LoadRenderTexture');
  late final _LoadRenderTexture = _LoadRenderTexturePtr.asFunction<RenderTextureC Function(int, int)>();

  /// Check if a texture is valid (loaded in GPU)
  bool IsTextureValid(TextureC texture)
    => _IsTextureValid(texture);
  late final _IsTextureValidPtr = _lookup<NativeFunction<Bool Function(TextureC)>>('IsTextureValid');
  late final _IsTextureValid = _IsTextureValidPtr.asFunction<bool Function(TextureC)>();

  /// Unload texture from GPU memory (VRAM)
  void UnloadTexture(TextureC texture)
    => _UnloadTexture(texture);
  late final _UnloadTexturePtr = _lookup<NativeFunction<Void Function(TextureC)>>('UnloadTexture');
  late final _UnloadTexture = _UnloadTexturePtr.asFunction<void Function(TextureC)>();

  /// Check if a render texture is valid (loaded in GPU)
  bool IsRenderTextureValid(RenderTextureC target)
    => _IsRenderTextureValid(target);
  late final _IsRenderTextureValidPtr = _lookup<NativeFunction<Bool Function(RenderTextureC)>>('IsRenderTextureValid');
  late final _IsRenderTextureValid = _IsRenderTextureValidPtr.asFunction<bool Function(RenderTextureC)>();

  /// Unload render texture from GPU memory (VRAM)
  void UnloadRenderTexture(RenderTextureC target)
    => _UnloadRenderTexture(target);
  late final _UnloadRenderTexturePtr = _lookup<NativeFunction<Void Function(RenderTextureC)>>('UnloadRenderTexture');
  late final _UnloadRenderTexture = _UnloadRenderTexturePtr.asFunction<void Function(RenderTextureC)>();

  /// Update GPU texture with new data
  void UpdateTexture(TextureC texture, Pointer<Void> pixels)
    => _UpdateTexture(texture, pixels);
  late final _UpdateTexturePtr = _lookup<NativeFunction<Void Function(TextureC, Pointer<Void>)>>('UpdateTexture');
  late final _UpdateTexture = _UpdateTexturePtr.asFunction<void Function(TextureC, Pointer<Void>)>();

  /// Update GPU texture rectangle with new data
  void UpdateTextureRec(TextureC texture, RectangleC rec, Pointer<Void> pixels)
    => _UpdateTextureRec(texture, rec, pixels);
  late final _UpdateTextureRecPtr = _lookup<NativeFunction<Void Function(TextureC, RectangleC, Pointer<Void>)>>('UpdateTextureRec');
  late final _UpdateTextureRec = _UpdateTextureRecPtr.asFunction<void Function(TextureC, RectangleC, Pointer<Void>)>();

  /// Generate GPU mipmaps for a texture
  void GenTextureMipmaps(Pointer<TextureC> texture)
    => _GenTextureMipmaps(texture);
  late final _GenTextureMipmapsPtr = _lookup<NativeFunction<Void Function(Pointer<TextureC>)>>('GenTextureMipmaps');
  late final _GenTextureMipmaps = _GenTextureMipmapsPtr.asFunction<void Function(Pointer<TextureC>)>();

  /// Set texture scaling filter mode
  void SetTextureFilter(TextureC texture, int filter)
    => _SetTextureFilter(texture, filter);
  late final _SetTextureFilterPtr = _lookup<NativeFunction<Void Function(TextureC, Int)>>('SetTextureFilter');
  late final _SetTextureFilter = _SetTextureFilterPtr.asFunction<void Function(TextureC, int)>();

  /// Set texture wrapping mode
  void SetTextureWrap(TextureC texture, int wrap)
    => _SetTextureWrap(texture, wrap);
  late final _SetTextureWrapPtr = _lookup<NativeFunction<Void Function(TextureC, Int)>>('SetTextureWrap');
  late final _SetTextureWrap = _SetTextureWrapPtr.asFunction<void Function(TextureC, int)>();

  /// Draw a Texture2D
  void DrawTexture(TextureC texture, int posX, int posY, ColorC tint)
    => _DrawTexture(texture, posX, posY, tint);
  late final _DrawTexturePtr = _lookup<NativeFunction<Void Function(TextureC, Int, Int, ColorC)>>('DrawTexture');
  late final _DrawTexture = _DrawTexturePtr.asFunction<void Function(TextureC, int, int, ColorC)>();

  /// Draw a Texture2D with position defined as Vector2
  void DrawTextureV(TextureC texture, Vector2C position, ColorC tint)
    => _DrawTextureV(texture, position, tint);
  late final _DrawTextureVPtr = _lookup<NativeFunction<Void Function(TextureC, Vector2C, ColorC)>>('DrawTextureV');
  late final _DrawTextureV = _DrawTextureVPtr.asFunction<void Function(TextureC, Vector2C, ColorC)>();

  /// Draw a Texture2D with extended parameters
  void DrawTextureEx(TextureC texture, Vector2C position, double rotation, double scale, ColorC tint)
    => _DrawTextureEx(texture, position, rotation, scale, tint);
  late final _DrawTextureExPtr = _lookup<NativeFunction<Void Function(TextureC, Vector2C, Float, Float, ColorC)>>('DrawTextureEx');
  late final _DrawTextureEx = _DrawTextureExPtr.asFunction<void Function(TextureC, Vector2C, double, double, ColorC)>();

  /// Draw a part of a texture defined by a rectangle
  void DrawTextureRec(TextureC texture, RectangleC source, Vector2C position, ColorC tint)
    => _DrawTextureRec(texture, source, position, tint);
  late final _DrawTextureRecPtr = _lookup<NativeFunction<Void Function(TextureC, RectangleC, Vector2C, ColorC)>>('DrawTextureRec');
  late final _DrawTextureRec = _DrawTextureRecPtr.asFunction<void Function(TextureC, RectangleC, Vector2C, ColorC)>();

  /// Draw a part of a texture defined by a rectangle with 'pro' parameters
  void DrawTexturePro(TextureC texture, RectangleC source, RectangleC dest, Vector2C origin, double rotation, ColorC tint)
    => _DrawTexturePro(texture, source, dest, origin, rotation, tint);
  late final _DrawTextureProPtr = _lookup<NativeFunction<Void Function(TextureC, RectangleC, RectangleC, Vector2C, Float, ColorC)>>('DrawTexturePro');
  late final _DrawTexturePro = _DrawTextureProPtr.asFunction<void Function(TextureC, RectangleC, RectangleC, Vector2C, double, ColorC)>();

  /// Draws a texture (or part of it) that stretches or shrinks nicely
  void DrawTextureNPatch(TextureC texture, NPatchInfoC nPatchInfo, RectangleC dest, Vector2C origin, double rotation, ColorC tint)
    => _DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint);
  late final _DrawTextureNPatchPtr = _lookup<NativeFunction<Void Function(TextureC, NPatchInfoC, RectangleC, Vector2C, Float, ColorC)>>('DrawTextureNPatch');
  late final _DrawTextureNPatch = _DrawTextureNPatchPtr.asFunction<void Function(TextureC, NPatchInfoC, RectangleC, Vector2C, double, ColorC)>();

  /// Check if two colors are equal
  bool ColorIsEqual(ColorC col1, ColorC col2)
    => _ColorIsEqual(col1, col2);
  late final _ColorIsEqualPtr = _lookup<NativeFunction<Bool Function(ColorC, ColorC)>>('ColorIsEqual');
  late final _ColorIsEqual = _ColorIsEqualPtr.asFunction<bool Function(ColorC, ColorC)>();

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorC Fade(ColorC color, double alpha)
    => _Fade(color, alpha);
  late final _FadePtr = _lookup<NativeFunction<ColorC Function(ColorC, Float)>>('Fade');
  late final _Fade = _FadePtr.asFunction<ColorC Function(ColorC, double)>();

  /// Get hexadecimal value for a Color (0xRRGGBBAA)
  int ColorToInt(ColorC color)
    => _ColorToInt(color);
  late final _ColorToIntPtr = _lookup<NativeFunction<Int Function(ColorC)>>('ColorToInt');
  late final _ColorToInt = _ColorToIntPtr.asFunction<int Function(ColorC)>();

  /// Get Color normalized as float [0..1]
  Vector4C ColorNormalize(ColorC color)
    => _ColorNormalize(color);
  late final _ColorNormalizePtr = _lookup<NativeFunction<Vector4C Function(ColorC)>>('ColorNormalize');
  late final _ColorNormalize = _ColorNormalizePtr.asFunction<Vector4C Function(ColorC)>();

  /// Get Color from normalized values [0..1]
  ColorC ColorFromNormalized(Vector4C normalized)
    => _ColorFromNormalized(normalized);
  late final _ColorFromNormalizedPtr = _lookup<NativeFunction<ColorC Function(Vector4C)>>('ColorFromNormalized');
  late final _ColorFromNormalized = _ColorFromNormalizedPtr.asFunction<ColorC Function(Vector4C)>();

  /// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
  Vector3C ColorToHSV(ColorC color)
    => _ColorToHSV(color);
  late final _ColorToHSVPtr = _lookup<NativeFunction<Vector3C Function(ColorC)>>('ColorToHSV');
  late final _ColorToHSV = _ColorToHSVPtr.asFunction<Vector3C Function(ColorC)>();

  /// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
  ColorC ColorFromHSV(double hue, double saturation, double value)
    => _ColorFromHSV(hue, saturation, value);
  late final _ColorFromHSVPtr = _lookup<NativeFunction<ColorC Function(Float, Float, Float)>>('ColorFromHSV');
  late final _ColorFromHSV = _ColorFromHSVPtr.asFunction<ColorC Function(double, double, double)>();

  /// Get color multiplied with another color
  ColorC ColorTint(ColorC color, ColorC tint)
    => _ColorTint(color, tint);
  late final _ColorTintPtr = _lookup<NativeFunction<ColorC Function(ColorC, ColorC)>>('ColorTint');
  late final _ColorTint = _ColorTintPtr.asFunction<ColorC Function(ColorC, ColorC)>();

  /// Get color with brightness correction, brightness factor goes from -1.0 to 1.0
  ColorC ColorBrightness(ColorC color, double factor)
    => _ColorBrightness(color, factor);
  late final _ColorBrightnessPtr = _lookup<NativeFunction<ColorC Function(ColorC, Float)>>('ColorBrightness');
  late final _ColorBrightness = _ColorBrightnessPtr.asFunction<ColorC Function(ColorC, double)>();

  /// Get color with contrast correction, contrast values between -1.0 and 1.0
  ColorC ColorContrast(ColorC color, double contrast)
    => _ColorContrast(color, contrast);
  late final _ColorContrastPtr = _lookup<NativeFunction<ColorC Function(ColorC, Float)>>('ColorContrast');
  late final _ColorContrast = _ColorContrastPtr.asFunction<ColorC Function(ColorC, double)>();

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorC ColorAlpha(ColorC color, double alpha)
    => _ColorAlpha(color, alpha);
  late final _ColorAlphaPtr = _lookup<NativeFunction<ColorC Function(ColorC, Float)>>('ColorAlpha');
  late final _ColorAlpha = _ColorAlphaPtr.asFunction<ColorC Function(ColorC, double)>();

  /// Get src alpha-blended into dst color with tint
  ColorC ColorAlphaBlend(ColorC dst, ColorC src, ColorC tint)
    => _ColorAlphaBlend(dst, src, tint);
  late final _ColorAlphaBlendPtr = _lookup<NativeFunction<ColorC Function(ColorC, ColorC, ColorC)>>('ColorAlphaBlend');
  late final _ColorAlphaBlend = _ColorAlphaBlendPtr.asFunction<ColorC Function(ColorC, ColorC, ColorC)>();

  /// Get color lerp interpolation between two colors, factor [0.0..1.0]
  ColorC ColorLerp(ColorC color1, ColorC color2, double factor)
    => _ColorLerp(color1, color2, factor);
  late final _ColorLerpPtr = _lookup<NativeFunction<ColorC Function(ColorC, ColorC, Float)>>('ColorLerp');
  late final _ColorLerp = _ColorLerpPtr.asFunction<ColorC Function(ColorC, ColorC, double)>();

  /// Get Color structure from hexadecimal value
  ColorC GetColor(int hexValue)
    => _GetColor(hexValue);
  late final _GetColorPtr = _lookup<NativeFunction<ColorC Function(UnsignedInt)>>('GetColor');
  late final _GetColor = _GetColorPtr.asFunction<ColorC Function(int)>();

  /// Get Color from a source pixel pointer of certain format
  ColorC GetPixelColor(Pointer<Void> srcPtr, int format)
    => _GetPixelColor(srcPtr, format);
  late final _GetPixelColorPtr = _lookup<NativeFunction<ColorC Function(Pointer<Void>, Int)>>('GetPixelColor');
  late final _GetPixelColor = _GetPixelColorPtr.asFunction<ColorC Function(Pointer<Void>, int)>();

  /// Set color formatted into destination pixel pointer
  void SetPixelColor(Pointer<Void> dstPtr, ColorC color, int format)
    => _SetPixelColor(dstPtr, color, format);
  late final _SetPixelColorPtr = _lookup<NativeFunction<Void Function(Pointer<Void>, ColorC, Int)>>('SetPixelColor');
  late final _SetPixelColor = _SetPixelColorPtr.asFunction<void Function(Pointer<Void>, ColorC, int)>();

  /// Get pixel data size in bytes for certain format
  int GetPixelDataSize(int width, int height, int format)
    => _GetPixelDataSize(width, height, format);
  late final _GetPixelDataSizePtr = _lookup<NativeFunction<Int Function(Int, Int, Int)>>('GetPixelDataSize');
  late final _GetPixelDataSize = _GetPixelDataSizePtr.asFunction<int Function(int, int, int)>();

  /// Get the default Font
  FontC GetFontDefault()
    => _GetFontDefault();
  late final _GetFontDefaultPtr = _lookup<NativeFunction<FontC Function()>>('GetFontDefault');
  late final _GetFontDefault = _GetFontDefaultPtr.asFunction<FontC Function()>();

  /// Load font from file into GPU memory (VRAM)
  FontC LoadFont(Pointer<Char> fileName)
    => _LoadFont(fileName);
  late final _LoadFontPtr = _lookup<NativeFunction<FontC Function(Pointer<Char>)>>('LoadFont');
  late final _LoadFont = _LoadFontPtr.asFunction<FontC Function(Pointer<Char>)>();

  /// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
  FontC LoadFontEx(Pointer<Char> fileName, int fontSize, Pointer<Int> codepoints, int codepointCount)
    => _LoadFontEx(fileName, fontSize, codepoints, codepointCount);
  late final _LoadFontExPtr = _lookup<NativeFunction<FontC Function(Pointer<Char>, Int, Pointer<Int>, Int)>>('LoadFontEx');
  late final _LoadFontEx = _LoadFontExPtr.asFunction<FontC Function(Pointer<Char>, int, Pointer<Int>, int)>();

  /// Load font from Image (XNA style)
  FontC LoadFontFromImage(ImageC image, ColorC key, int firstChar)
    => _LoadFontFromImage(image, key, firstChar);
  late final _LoadFontFromImagePtr = _lookup<NativeFunction<FontC Function(ImageC, ColorC, Int)>>('LoadFontFromImage');
  late final _LoadFontFromImage = _LoadFontFromImagePtr.asFunction<FontC Function(ImageC, ColorC, int)>();

  /// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  FontC LoadFontFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> fileData, int dataSize, int fontSize, Pointer<Int> codepoints, int codepointCount)
    => _LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount);
  late final _LoadFontFromMemoryPtr = _lookup<NativeFunction<FontC Function(Pointer<Char>, Pointer<UnsignedChar>, Int, Int, Pointer<Int>, Int)>>('LoadFontFromMemory');
  late final _LoadFontFromMemory = _LoadFontFromMemoryPtr.asFunction<FontC Function(Pointer<Char>, Pointer<UnsignedChar>, int, int, Pointer<Int>, int)>();

  /// Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
  bool IsFontValid(FontC font)
    => _IsFontValid(font);
  late final _IsFontValidPtr = _lookup<NativeFunction<Bool Function(FontC)>>('IsFontValid');
  late final _IsFontValid = _IsFontValidPtr.asFunction<bool Function(FontC)>();

  /// Load font data for further use
  Pointer<GlyphInfoC> LoadFontData(Pointer<UnsignedChar> fileData, int dataSize, int fontSize, Pointer<Int> codepoints, int codepointCount, int type, Pointer<Int> glyphCount)
    => _LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type, glyphCount);
  late final _LoadFontDataPtr = _lookup<NativeFunction<Pointer<GlyphInfoC> Function(Pointer<UnsignedChar>, Int, Int, Pointer<Int>, Int, Int, Pointer<Int>)>>('LoadFontData');
  late final _LoadFontData = _LoadFontDataPtr.asFunction<Pointer<GlyphInfoC> Function(Pointer<UnsignedChar>, int, int, Pointer<Int>, int, int, Pointer<Int>)>();

  /// Generate image font atlas using chars info
  ImageC GenImageFontAtlas(Pointer<GlyphInfoC> glyphs, Pointer<Pointer<RectangleC>> glyphRecs, int glyphCount, int fontSize, int padding, int packMethod)
    => _GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod);
  late final _GenImageFontAtlasPtr = _lookup<NativeFunction<ImageC Function(Pointer<GlyphInfoC>, Pointer<Pointer<RectangleC>>, Int, Int, Int, Int)>>('GenImageFontAtlas');
  late final _GenImageFontAtlas = _GenImageFontAtlasPtr.asFunction<ImageC Function(Pointer<GlyphInfoC>, Pointer<Pointer<RectangleC>>, int, int, int, int)>();

  /// Unload font chars info data (RAM)
  void UnloadFontData(Pointer<GlyphInfoC> glyphs, int glyphCount)
    => _UnloadFontData(glyphs, glyphCount);
  late final _UnloadFontDataPtr = _lookup<NativeFunction<Void Function(Pointer<GlyphInfoC>, Int)>>('UnloadFontData');
  late final _UnloadFontData = _UnloadFontDataPtr.asFunction<void Function(Pointer<GlyphInfoC>, int)>();

  /// Unload font from GPU memory (VRAM)
  void UnloadFont(FontC font)
    => _UnloadFont(font);
  late final _UnloadFontPtr = _lookup<NativeFunction<Void Function(FontC)>>('UnloadFont');
  late final _UnloadFont = _UnloadFontPtr.asFunction<void Function(FontC)>();

  /// Export font as code file, returns true on success
  bool ExportFontAsCode(FontC font, Pointer<Char> fileName)
    => _ExportFontAsCode(font, fileName);
  late final _ExportFontAsCodePtr = _lookup<NativeFunction<Bool Function(FontC, Pointer<Char>)>>('ExportFontAsCode');
  late final _ExportFontAsCode = _ExportFontAsCodePtr.asFunction<bool Function(FontC, Pointer<Char>)>();

  /// Draw current FPS
  void DrawFPS(int posX, int posY)
    => _DrawFPS(posX, posY);
  late final _DrawFPSPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('DrawFPS');
  late final _DrawFPS = _DrawFPSPtr.asFunction<void Function(int, int)>();

  /// Draw text (using default font)
  void DrawText(Pointer<Char> text, int posX, int posY, int fontSize, ColorC color)
    => _DrawText(text, posX, posY, fontSize, color);
  late final _DrawTextPtr = _lookup<NativeFunction<Void Function(Pointer<Char>, Int, Int, Int, ColorC)>>('DrawText');
  late final _DrawText = _DrawTextPtr.asFunction<void Function(Pointer<Char>, int, int, int, ColorC)>();

  /// Draw text using font and additional parameters
  void DrawTextEx(FontC font, Pointer<Char> text, Vector2C position, double fontSize, double spacing, ColorC tint)
    => _DrawTextEx(font, text, position, fontSize, spacing, tint);
  late final _DrawTextExPtr = _lookup<NativeFunction<Void Function(FontC, Pointer<Char>, Vector2C, Float, Float, ColorC)>>('DrawTextEx');
  late final _DrawTextEx = _DrawTextExPtr.asFunction<void Function(FontC, Pointer<Char>, Vector2C, double, double, ColorC)>();

  /// Draw text using Font and pro parameters (rotation)
  void DrawTextPro(FontC font, Pointer<Char> text, Vector2C position, Vector2C origin, double rotation, double fontSize, double spacing, ColorC tint)
    => _DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint);
  late final _DrawTextProPtr = _lookup<NativeFunction<Void Function(FontC, Pointer<Char>, Vector2C, Vector2C, Float, Float, Float, ColorC)>>('DrawTextPro');
  late final _DrawTextPro = _DrawTextProPtr.asFunction<void Function(FontC, Pointer<Char>, Vector2C, Vector2C, double, double, double, ColorC)>();

  /// Draw one character (codepoint)
  void DrawTextCodepoint(FontC font, int codepoint, Vector2C position, double fontSize, ColorC tint)
    => _DrawTextCodepoint(font, codepoint, position, fontSize, tint);
  late final _DrawTextCodepointPtr = _lookup<NativeFunction<Void Function(FontC, Int, Vector2C, Float, ColorC)>>('DrawTextCodepoint');
  late final _DrawTextCodepoint = _DrawTextCodepointPtr.asFunction<void Function(FontC, int, Vector2C, double, ColorC)>();

  /// Draw multiple character (codepoint)
  void DrawTextCodepoints(FontC font, Pointer<Int> codepoints, int codepointCount, Vector2C position, double fontSize, double spacing, ColorC tint)
    => _DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint);
  late final _DrawTextCodepointsPtr = _lookup<NativeFunction<Void Function(FontC, Pointer<Int>, Int, Vector2C, Float, Float, ColorC)>>('DrawTextCodepoints');
  late final _DrawTextCodepoints = _DrawTextCodepointsPtr.asFunction<void Function(FontC, Pointer<Int>, int, Vector2C, double, double, ColorC)>();

  /// Set vertical line spacing when drawing with line-breaks
  void SetTextLineSpacing(int spacing)
    => _SetTextLineSpacing(spacing);
  late final _SetTextLineSpacingPtr = _lookup<NativeFunction<Void Function(Int)>>('SetTextLineSpacing');
  late final _SetTextLineSpacing = _SetTextLineSpacingPtr.asFunction<void Function(int)>();

  /// Measure string width for default font
  int MeasureText(Pointer<Char> text, int fontSize)
    => _MeasureText(text, fontSize);
  late final _MeasureTextPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Int)>>('MeasureText');
  late final _MeasureText = _MeasureTextPtr.asFunction<int Function(Pointer<Char>, int)>();

  /// Measure string size for Font
  Vector2C MeasureTextEx(FontC font, Pointer<Char> text, double fontSize, double spacing)
    => _MeasureTextEx(font, text, fontSize, spacing);
  late final _MeasureTextExPtr = _lookup<NativeFunction<Vector2C Function(FontC, Pointer<Char>, Float, Float)>>('MeasureTextEx');
  late final _MeasureTextEx = _MeasureTextExPtr.asFunction<Vector2C Function(FontC, Pointer<Char>, double, double)>();

  /// Measure string size for an existing array of codepoints for Font
  Vector2C MeasureTextCodepoints(FontC font, Pointer<Int> codepoints, int length, double fontSize, double spacing)
    => _MeasureTextCodepoints(font, codepoints, length, fontSize, spacing);
  late final _MeasureTextCodepointsPtr = _lookup<NativeFunction<Vector2C Function(FontC, Pointer<Int>, Int, Float, Float)>>('MeasureTextCodepoints');
  late final _MeasureTextCodepoints = _MeasureTextCodepointsPtr.asFunction<Vector2C Function(FontC, Pointer<Int>, int, double, double)>();

  /// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  int GetGlyphIndex(FontC font, int codepoint)
    => _GetGlyphIndex(font, codepoint);
  late final _GetGlyphIndexPtr = _lookup<NativeFunction<Int Function(FontC, Int)>>('GetGlyphIndex');
  late final _GetGlyphIndex = _GetGlyphIndexPtr.asFunction<int Function(FontC, int)>();

  /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  GlyphInfoC GetGlyphInfo(FontC font, int codepoint)
    => _GetGlyphInfo(font, codepoint);
  late final _GetGlyphInfoPtr = _lookup<NativeFunction<GlyphInfoC Function(FontC, Int)>>('GetGlyphInfo');
  late final _GetGlyphInfo = _GetGlyphInfoPtr.asFunction<GlyphInfoC Function(FontC, int)>();

  /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  RectangleC GetGlyphAtlasRec(FontC font, int codepoint)
    => _GetGlyphAtlasRec(font, codepoint);
  late final _GetGlyphAtlasRecPtr = _lookup<NativeFunction<RectangleC Function(FontC, Int)>>('GetGlyphAtlasRec');
  late final _GetGlyphAtlasRec = _GetGlyphAtlasRecPtr.asFunction<RectangleC Function(FontC, int)>();

  /// Load UTF-8 text encoded from codepoints array
  Pointer<Char> LoadUTF8(Pointer<Int> codepoints, int length)
    => _LoadUTF8(codepoints, length);
  late final _LoadUTF8Ptr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Int>, Int)>>('LoadUTF8');
  late final _LoadUTF8 = _LoadUTF8Ptr.asFunction<Pointer<Char> Function(Pointer<Int>, int)>();

  /// Unload UTF-8 text encoded from codepoints array
  void UnloadUTF8(Pointer<Char> text)
    => _UnloadUTF8(text);
  late final _UnloadUTF8Ptr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('UnloadUTF8');
  late final _UnloadUTF8 = _UnloadUTF8Ptr.asFunction<void Function(Pointer<Char>)>();

  /// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
  Pointer<Int> LoadCodepoints(Pointer<Char> text, Pointer<Int> count)
    => _LoadCodepoints(text, count);
  late final _LoadCodepointsPtr = _lookup<NativeFunction<Pointer<Int> Function(Pointer<Char>, Pointer<Int>)>>('LoadCodepoints');
  late final _LoadCodepoints = _LoadCodepointsPtr.asFunction<Pointer<Int> Function(Pointer<Char>, Pointer<Int>)>();

  /// Unload codepoints data from memory
  void UnloadCodepoints(Pointer<Int> codepoints)
    => _UnloadCodepoints(codepoints);
  late final _UnloadCodepointsPtr = _lookup<NativeFunction<Void Function(Pointer<Int>)>>('UnloadCodepoints');
  late final _UnloadCodepoints = _UnloadCodepointsPtr.asFunction<void Function(Pointer<Int>)>();

  /// Get total number of codepoints in a UTF-8 encoded string
  int GetCodepointCount(Pointer<Char> text)
    => _GetCodepointCount(text);
  late final _GetCodepointCountPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('GetCodepointCount');
  late final _GetCodepointCount = _GetCodepointCountPtr.asFunction<int Function(Pointer<Char>)>();

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  int GetCodepoint(Pointer<Char> text, Pointer<Int> codepointSize)
    => _GetCodepoint(text, codepointSize);
  late final _GetCodepointPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Int>)>>('GetCodepoint');
  late final _GetCodepoint = _GetCodepointPtr.asFunction<int Function(Pointer<Char>, Pointer<Int>)>();

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  int GetCodepointNext(Pointer<Char> text, Pointer<Int> codepointSize)
    => _GetCodepointNext(text, codepointSize);
  late final _GetCodepointNextPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Int>)>>('GetCodepointNext');
  late final _GetCodepointNext = _GetCodepointNextPtr.asFunction<int Function(Pointer<Char>, Pointer<Int>)>();

  /// Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  int GetCodepointPrevious(Pointer<Char> text, Pointer<Int> codepointSize)
    => _GetCodepointPrevious(text, codepointSize);
  late final _GetCodepointPreviousPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Int>)>>('GetCodepointPrevious');
  late final _GetCodepointPrevious = _GetCodepointPreviousPtr.asFunction<int Function(Pointer<Char>, Pointer<Int>)>();

  /// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
  Pointer<Char> CodepointToUTF8(int codepoint, Pointer<Int> utf8Size)
    => _CodepointToUTF8(codepoint, utf8Size);
  late final _CodepointToUTF8Ptr = _lookup<NativeFunction<Pointer<Char> Function(Int, Pointer<Int>)>>('CodepointToUTF8');
  late final _CodepointToUTF8 = _CodepointToUTF8Ptr.asFunction<Pointer<Char> Function(int, Pointer<Int>)>();

  /// Load text as separate lines ('\n')
  Pointer<Pointer<Char>> LoadTextLines(Pointer<Char> text, Pointer<Int> count)
    => _LoadTextLines(text, count);
  late final _LoadTextLinesPtr = _lookup<NativeFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, Pointer<Int>)>>('LoadTextLines');
  late final _LoadTextLines = _LoadTextLinesPtr.asFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, Pointer<Int>)>();

  /// Unload text lines
  void UnloadTextLines(Pointer<Pointer<Char>> text, int lineCount)
    => _UnloadTextLines(text, lineCount);
  late final _UnloadTextLinesPtr = _lookup<NativeFunction<Void Function(Pointer<Pointer<Char>>, Int)>>('UnloadTextLines');
  late final _UnloadTextLines = _UnloadTextLinesPtr.asFunction<void Function(Pointer<Pointer<Char>>, int)>();

  /// Copy one string to another, returns bytes copied
  int TextCopy(Pointer<Char> dst, Pointer<Char> src)
    => _TextCopy(dst, src);
  late final _TextCopyPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('TextCopy');
  late final _TextCopy = _TextCopyPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  /// Check if two text string are equal
  bool TextIsEqual(Pointer<Char> text1, Pointer<Char> text2)
    => _TextIsEqual(text1, text2);
  late final _TextIsEqualPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>, Pointer<Char>)>>('TextIsEqual');
  late final _TextIsEqual = _TextIsEqualPtr.asFunction<bool Function(Pointer<Char>, Pointer<Char>)>();

  /// Get text length
  int TextLength(Pointer<Char> text)
    => _TextLength(text);
  late final _TextLengthPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Char>)>>('TextLength');
  late final _TextLength = _TextLengthPtr.asFunction<int Function(Pointer<Char>)>();

  /// Text formatting with variables (sprintf() style)
  Pointer<Char> TextFormat(Pointer<Char> text)
    => _TextFormat(text);
  late final _TextFormatPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextFormat');
  late final _TextFormat = _TextFormatPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get a piece of a text string
  Pointer<Char> TextSubtext(Pointer<Char> text, int position, int length)
    => _TextSubtext(text, position, length);
  late final _TextSubtextPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Int, Int)>>('TextSubtext');
  late final _TextSubtext = _TextSubtextPtr.asFunction<Pointer<Char> Function(Pointer<Char>, int, int)>();

  /// Remove text spaces, concat words
  Pointer<Char> TextRemoveSpaces(Pointer<Char> text)
    => _TextRemoveSpaces(text);
  late final _TextRemoveSpacesPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextRemoveSpaces');
  late final _TextRemoveSpaces = _TextRemoveSpacesPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get text between two strings
  Pointer<Char> GetTextBetween(Pointer<Char> text, Pointer<Char> begin, Pointer<Char> end)
    => _GetTextBetween(text, begin, end);
  late final _GetTextBetweenPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('GetTextBetween');
  late final _GetTextBetween = _GetTextBetweenPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  /// Replace text string with new string
  Pointer<Char> TextReplace(Pointer<Char> text, Pointer<Char> replace, Pointer<Char> by)
    => _TextReplace(text, replace, by);
  late final _TextReplacePtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('TextReplace');
  late final _TextReplace = _TextReplacePtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  /// Replace text string with new string, memory must be freed
  Pointer<Char> TextReplaceAlloc(Pointer<Char> text, Pointer<Char> replace, Pointer<Char> by)
    => _TextReplaceAlloc(text, replace, by);
  late final _TextReplaceAllocPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('TextReplaceAlloc');
  late final _TextReplaceAlloc = _TextReplaceAllocPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  /// Replace text between two specific strings
  Pointer<Char> TextReplaceBetween(Pointer<Char> text, Pointer<Char> begin, Pointer<Char> end, Pointer<Char> replacement)
    => _TextReplaceBetween(text, begin, end, replacement);
  late final _TextReplaceBetweenPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('TextReplaceBetween');
  late final _TextReplaceBetween = _TextReplaceBetweenPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  /// Replace text between two specific strings, memory must be freed
  Pointer<Char> TextReplaceBetweenAlloc(Pointer<Char> text, Pointer<Char> begin, Pointer<Char> end, Pointer<Char> replacement)
    => _TextReplaceBetweenAlloc(text, begin, end, replacement);
  late final _TextReplaceBetweenAllocPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('TextReplaceBetweenAlloc');
  late final _TextReplaceBetweenAlloc = _TextReplaceBetweenAllocPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  /// Insert text in a defined byte position
  Pointer<Char> TextInsert(Pointer<Char> text, Pointer<Char> insert, int position)
    => _TextInsert(text, insert, position);
  late final _TextInsertPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Int)>>('TextInsert');
  late final _TextInsert = _TextInsertPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, int)>();

  /// Insert text in a defined byte position, memory must be freed
  Pointer<Char> TextInsertAlloc(Pointer<Char> text, Pointer<Char> insert, int position)
    => _TextInsertAlloc(text, insert, position);
  late final _TextInsertAllocPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Int)>>('TextInsertAlloc');
  late final _TextInsertAlloc = _TextInsertAllocPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, int)>();

  /// Join text strings with delimiter ([delimiter] is expected to be length of 1)
  Pointer<Char> TextJoin(Pointer<Pointer<Char>> textList, int count, Pointer<Char> delimiter)
    => _TextJoin(textList, count, delimiter);
  late final _TextJoinPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Pointer<Char>>, Int, Pointer<Char>)>>('TextJoin');
  late final _TextJoin = _TextJoinPtr.asFunction<Pointer<Char> Function(Pointer<Pointer<Char>>, int, Pointer<Char>)>();

  /// Split text into multiple strings
  Pointer<Pointer<Char>> TextSplit(Pointer<Char> text, int delimiter, Pointer<Int> count)
    => _TextSplit(text, delimiter, count);
  late final _TextSplitPtr = _lookup<NativeFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, Char, Pointer<Int>)>>('TextSplit');
  late final _TextSplit = _TextSplitPtr.asFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, int, Pointer<Int>)>();

  /// Append text at specific position and move cursor
  void TextAppend(Pointer<Char> text, Pointer<Char> append, Pointer<Int> position)
    => _TextAppend(text, append, position);
  late final _TextAppendPtr = _lookup<NativeFunction<Void Function(Pointer<Char>, Pointer<Char>, Pointer<Int>)>>('TextAppend');
  late final _TextAppend = _TextAppendPtr.asFunction<void Function(Pointer<Char>, Pointer<Char>, Pointer<Int>)>();

  /// Find first text occurrence within a string, -1 if not found
  int TextFindIndex(Pointer<Char> text, Pointer<Char> find)
    => _TextFindIndex(text, find);
  late final _TextFindIndexPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('TextFindIndex');
  late final _TextFindIndex = _TextFindIndexPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  /// Get upper case version of provided string
  Pointer<Char> TextToUpper(Pointer<Char> text)
    => _TextToUpper(text);
  late final _TextToUpperPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToUpper');
  late final _TextToUpper = _TextToUpperPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get lower case version of provided string
  Pointer<Char> TextToLower(Pointer<Char> text)
    => _TextToLower(text);
  late final _TextToLowerPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToLower');
  late final _TextToLower = _TextToLowerPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get Pascal case notation version of provided string
  Pointer<Char> TextToPascal(Pointer<Char> text)
    => _TextToPascal(text);
  late final _TextToPascalPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToPascal');
  late final _TextToPascal = _TextToPascalPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get Snake case notation version of provided string
  Pointer<Char> TextToSnake(Pointer<Char> text)
    => _TextToSnake(text);
  late final _TextToSnakePtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToSnake');
  late final _TextToSnake = _TextToSnakePtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get Camel case notation version of provided string
  Pointer<Char> TextToCamel(Pointer<Char> text)
    => _TextToCamel(text);
  late final _TextToCamelPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToCamel');
  late final _TextToCamel = _TextToCamelPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  /// Get integer value from text
  int TextToInteger(Pointer<Char> text)
    => _TextToInteger(text);
  late final _TextToIntegerPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('TextToInteger');
  late final _TextToInteger = _TextToIntegerPtr.asFunction<int Function(Pointer<Char>)>();

  /// Get float value from text
  double TextToFloat(Pointer<Char> text)
    => _TextToFloat(text);
  late final _TextToFloatPtr = _lookup<NativeFunction<Float Function(Pointer<Char>)>>('TextToFloat');
  late final _TextToFloat = _TextToFloatPtr.asFunction<double Function(Pointer<Char>)>();

  /// Draw a line in 3D world space
  void DrawLine3D(Vector3C startPos, Vector3C endPos, ColorC color)
    => _DrawLine3D(startPos, endPos, color);
  late final _DrawLine3DPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, ColorC)>>('DrawLine3D');
  late final _DrawLine3D = _DrawLine3DPtr.asFunction<void Function(Vector3C, Vector3C, ColorC)>();

  /// Draw a point in 3D space, actually a small line
  void DrawPoint3D(Vector3C position, ColorC color)
    => _DrawPoint3D(position, color);
  late final _DrawPoint3DPtr = _lookup<NativeFunction<Void Function(Vector3C, ColorC)>>('DrawPoint3D');
  late final _DrawPoint3D = _DrawPoint3DPtr.asFunction<void Function(Vector3C, ColorC)>();

  /// Draw a circle in 3D world space
  void DrawCircle3D(Vector3C center, double radius, Vector3C rotationAxis, double rotationAngle, ColorC color)
    => _DrawCircle3D(center, radius, rotationAxis, rotationAngle, color);
  late final _DrawCircle3DPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Vector3C, Float, ColorC)>>('DrawCircle3D');
  late final _DrawCircle3D = _DrawCircle3DPtr.asFunction<void Function(Vector3C, double, Vector3C, double, ColorC)>();

  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle3D(Vector3C v1, Vector3C v2, Vector3C v3, ColorC color)
    => _DrawTriangle3D(v1, v2, v3, color);
  late final _DrawTriangle3DPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Vector3C, ColorC)>>('DrawTriangle3D');
  late final _DrawTriangle3D = _DrawTriangle3DPtr.asFunction<void Function(Vector3C, Vector3C, Vector3C, ColorC)>();

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip3D(Pointer<Vector3C> points, int pointCount, ColorC color)
    => _DrawTriangleStrip3D(points, pointCount, color);
  late final _DrawTriangleStrip3DPtr = _lookup<NativeFunction<Void Function(Pointer<Vector3C>, Int, ColorC)>>('DrawTriangleStrip3D');
  late final _DrawTriangleStrip3D = _DrawTriangleStrip3DPtr.asFunction<void Function(Pointer<Vector3C>, int, ColorC)>();

  /// Draw cube
  void DrawCube(Vector3C position, double width, double height, double length, ColorC color)
    => _DrawCube(position, width, height, length, color);
  late final _DrawCubePtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Float, Float, ColorC)>>('DrawCube');
  late final _DrawCube = _DrawCubePtr.asFunction<void Function(Vector3C, double, double, double, ColorC)>();

  /// Draw cube (Vector version)
  void DrawCubeV(Vector3C position, Vector3C size, ColorC color)
    => _DrawCubeV(position, size, color);
  late final _DrawCubeVPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, ColorC)>>('DrawCubeV');
  late final _DrawCubeV = _DrawCubeVPtr.asFunction<void Function(Vector3C, Vector3C, ColorC)>();

  /// Draw cube wires
  void DrawCubeWires(Vector3C position, double width, double height, double length, ColorC color)
    => _DrawCubeWires(position, width, height, length, color);
  late final _DrawCubeWiresPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Float, Float, ColorC)>>('DrawCubeWires');
  late final _DrawCubeWires = _DrawCubeWiresPtr.asFunction<void Function(Vector3C, double, double, double, ColorC)>();

  /// Draw cube wires (Vector version)
  void DrawCubeWiresV(Vector3C position, Vector3C size, ColorC color)
    => _DrawCubeWiresV(position, size, color);
  late final _DrawCubeWiresVPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, ColorC)>>('DrawCubeWiresV');
  late final _DrawCubeWiresV = _DrawCubeWiresVPtr.asFunction<void Function(Vector3C, Vector3C, ColorC)>();

  /// Draw sphere
  void DrawSphere(Vector3C centerPos, double radius, ColorC color)
    => _DrawSphere(centerPos, radius, color);
  late final _DrawSpherePtr = _lookup<NativeFunction<Void Function(Vector3C, Float, ColorC)>>('DrawSphere');
  late final _DrawSphere = _DrawSpherePtr.asFunction<void Function(Vector3C, double, ColorC)>();

  /// Draw sphere with extended parameters
  void DrawSphereEx(Vector3C centerPos, double radius, int rings, int slices, ColorC color)
    => _DrawSphereEx(centerPos, radius, rings, slices, color);
  late final _DrawSphereExPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Int, Int, ColorC)>>('DrawSphereEx');
  late final _DrawSphereEx = _DrawSphereExPtr.asFunction<void Function(Vector3C, double, int, int, ColorC)>();

  /// Draw sphere wires
  void DrawSphereWires(Vector3C centerPos, double radius, int rings, int slices, ColorC color)
    => _DrawSphereWires(centerPos, radius, rings, slices, color);
  late final _DrawSphereWiresPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Int, Int, ColorC)>>('DrawSphereWires');
  late final _DrawSphereWires = _DrawSphereWiresPtr.asFunction<void Function(Vector3C, double, int, int, ColorC)>();

  /// Draw a cylinder/cone
  void DrawCylinder(Vector3C position, double radiusTop, double radiusBottom, double height, int slices, ColorC color)
    => _DrawCylinder(position, radiusTop, radiusBottom, height, slices, color);
  late final _DrawCylinderPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Float, Float, Int, ColorC)>>('DrawCylinder');
  late final _DrawCylinder = _DrawCylinderPtr.asFunction<void Function(Vector3C, double, double, double, int, ColorC)>();

  /// Draw a cylinder with base at startPos and top at endPos
  void DrawCylinderEx(Vector3C startPos, Vector3C endPos, double startRadius, double endRadius, int sides, ColorC color)
    => _DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color);
  late final _DrawCylinderExPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Float, Float, Int, ColorC)>>('DrawCylinderEx');
  late final _DrawCylinderEx = _DrawCylinderExPtr.asFunction<void Function(Vector3C, Vector3C, double, double, int, ColorC)>();

  /// Draw a cylinder/cone wires
  void DrawCylinderWires(Vector3C position, double radiusTop, double radiusBottom, double height, int slices, ColorC color)
    => _DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color);
  late final _DrawCylinderWiresPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Float, Float, Int, ColorC)>>('DrawCylinderWires');
  late final _DrawCylinderWires = _DrawCylinderWiresPtr.asFunction<void Function(Vector3C, double, double, double, int, ColorC)>();

  /// Draw a cylinder wires with base at startPos and top at endPos
  void DrawCylinderWiresEx(Vector3C startPos, Vector3C endPos, double startRadius, double endRadius, int sides, ColorC color)
    => _DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color);
  late final _DrawCylinderWiresExPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Float, Float, Int, ColorC)>>('DrawCylinderWiresEx');
  late final _DrawCylinderWiresEx = _DrawCylinderWiresExPtr.asFunction<void Function(Vector3C, Vector3C, double, double, int, ColorC)>();

  /// Draw a capsule with the center of its sphere caps at startPos and endPos
  void DrawCapsule(Vector3C startPos, Vector3C endPos, double radius, int slices, int rings, ColorC color)
    => _DrawCapsule(startPos, endPos, radius, slices, rings, color);
  late final _DrawCapsulePtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Float, Int, Int, ColorC)>>('DrawCapsule');
  late final _DrawCapsule = _DrawCapsulePtr.asFunction<void Function(Vector3C, Vector3C, double, int, int, ColorC)>();

  /// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  void DrawCapsuleWires(Vector3C startPos, Vector3C endPos, double radius, int slices, int rings, ColorC color)
    => _DrawCapsuleWires(startPos, endPos, radius, slices, rings, color);
  late final _DrawCapsuleWiresPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Float, Int, Int, ColorC)>>('DrawCapsuleWires');
  late final _DrawCapsuleWires = _DrawCapsuleWiresPtr.asFunction<void Function(Vector3C, Vector3C, double, int, int, ColorC)>();

  /// Draw a plane XZ
  void DrawPlane(Vector3C centerPos, Vector2C size, ColorC color)
    => _DrawPlane(centerPos, size, color);
  late final _DrawPlanePtr = _lookup<NativeFunction<Void Function(Vector3C, Vector2C, ColorC)>>('DrawPlane');
  late final _DrawPlane = _DrawPlanePtr.asFunction<void Function(Vector3C, Vector2C, ColorC)>();

  /// Draw a ray line
  void DrawRay(RayC ray, ColorC color)
    => _DrawRay(ray, color);
  late final _DrawRayPtr = _lookup<NativeFunction<Void Function(RayC, ColorC)>>('DrawRay');
  late final _DrawRay = _DrawRayPtr.asFunction<void Function(RayC, ColorC)>();

  /// Draw a grid (centered at (0, 0, 0))
  void DrawGrid(int slices, double spacing)
    => _DrawGrid(slices, spacing);
  late final _DrawGridPtr = _lookup<NativeFunction<Void Function(Int, Float)>>('DrawGrid');
  late final _DrawGrid = _DrawGridPtr.asFunction<void Function(int, double)>();

  /// Load model from files (meshes and materials)
  ModelC LoadModel(Pointer<Char> fileName)
    => _LoadModel(fileName);
  late final _LoadModelPtr = _lookup<NativeFunction<ModelC Function(Pointer<Char>)>>('LoadModel');
  late final _LoadModel = _LoadModelPtr.asFunction<ModelC Function(Pointer<Char>)>();

  /// Load model from generated mesh (default material)
  ModelC LoadModelFromMesh(MeshC mesh)
    => _LoadModelFromMesh(mesh);
  late final _LoadModelFromMeshPtr = _lookup<NativeFunction<ModelC Function(MeshC)>>('LoadModelFromMesh');
  late final _LoadModelFromMesh = _LoadModelFromMeshPtr.asFunction<ModelC Function(MeshC)>();

  /// Check if a model is valid (loaded in GPU, VAO/VBOs)
  bool IsModelValid(ModelC model)
    => _IsModelValid(model);
  late final _IsModelValidPtr = _lookup<NativeFunction<Bool Function(ModelC)>>('IsModelValid');
  late final _IsModelValid = _IsModelValidPtr.asFunction<bool Function(ModelC)>();

  /// Unload model (including meshes) from memory (RAM and/or VRAM)
  void UnloadModel(ModelC model)
    => _UnloadModel(model);
  late final _UnloadModelPtr = _lookup<NativeFunction<Void Function(ModelC)>>('UnloadModel');
  late final _UnloadModel = _UnloadModelPtr.asFunction<void Function(ModelC)>();

  /// Compute model bounding box limits (considers all meshes)
  BoundingBoxC GetModelBoundingBox(ModelC model)
    => _GetModelBoundingBox(model);
  late final _GetModelBoundingBoxPtr = _lookup<NativeFunction<BoundingBoxC Function(ModelC)>>('GetModelBoundingBox');
  late final _GetModelBoundingBox = _GetModelBoundingBoxPtr.asFunction<BoundingBoxC Function(ModelC)>();

  /// Draw a model (with texture if set)
  void DrawModel(ModelC model, Vector3C position, double scale, ColorC tint)
    => _DrawModel(model, position, scale, tint);
  late final _DrawModelPtr = _lookup<NativeFunction<Void Function(ModelC, Vector3C, Float, ColorC)>>('DrawModel');
  late final _DrawModel = _DrawModelPtr.asFunction<void Function(ModelC, Vector3C, double, ColorC)>();

  /// Draw a model with extended parameters
  void DrawModelEx(ModelC model, Vector3C position, Vector3C rotationAxis, double rotationAngle, Vector3C scale, ColorC tint)
    => _DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint);
  late final _DrawModelExPtr = _lookup<NativeFunction<Void Function(ModelC, Vector3C, Vector3C, Float, Vector3C, ColorC)>>('DrawModelEx');
  late final _DrawModelEx = _DrawModelExPtr.asFunction<void Function(ModelC, Vector3C, Vector3C, double, Vector3C, ColorC)>();

  /// Draw a model wires (with texture if set)
  void DrawModelWires(ModelC model, Vector3C position, double scale, ColorC tint)
    => _DrawModelWires(model, position, scale, tint);
  late final _DrawModelWiresPtr = _lookup<NativeFunction<Void Function(ModelC, Vector3C, Float, ColorC)>>('DrawModelWires');
  late final _DrawModelWires = _DrawModelWiresPtr.asFunction<void Function(ModelC, Vector3C, double, ColorC)>();

  /// Draw a model wires (with texture if set) with extended parameters
  void DrawModelWiresEx(ModelC model, Vector3C position, Vector3C rotationAxis, double rotationAngle, Vector3C scale, ColorC tint)
    => _DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint);
  late final _DrawModelWiresExPtr = _lookup<NativeFunction<Void Function(ModelC, Vector3C, Vector3C, Float, Vector3C, ColorC)>>('DrawModelWiresEx');
  late final _DrawModelWiresEx = _DrawModelWiresExPtr.asFunction<void Function(ModelC, Vector3C, Vector3C, double, Vector3C, ColorC)>();

  /// Draw bounding box (wires)
  void DrawBoundingBox(BoundingBoxC box, ColorC color)
    => _DrawBoundingBox(box, color);
  late final _DrawBoundingBoxPtr = _lookup<NativeFunction<Void Function(BoundingBoxC, ColorC)>>('DrawBoundingBox');
  late final _DrawBoundingBox = _DrawBoundingBoxPtr.asFunction<void Function(BoundingBoxC, ColorC)>();

  /// Draw a billboard texture
  void DrawBillboard(Camera3DC camera, TextureC texture, Vector3C position, double scale, ColorC tint)
    => _DrawBillboard(camera, texture, position, scale, tint);
  late final _DrawBillboardPtr = _lookup<NativeFunction<Void Function(Camera3DC, TextureC, Vector3C, Float, ColorC)>>('DrawBillboard');
  late final _DrawBillboard = _DrawBillboardPtr.asFunction<void Function(Camera3DC, TextureC, Vector3C, double, ColorC)>();

  /// Draw a billboard texture defined by source
  void DrawBillboardRec(Camera3DC camera, TextureC texture, RectangleC source, Vector3C position, Vector2C size, ColorC tint)
    => _DrawBillboardRec(camera, texture, source, position, size, tint);
  late final _DrawBillboardRecPtr = _lookup<NativeFunction<Void Function(Camera3DC, TextureC, RectangleC, Vector3C, Vector2C, ColorC)>>('DrawBillboardRec');
  late final _DrawBillboardRec = _DrawBillboardRecPtr.asFunction<void Function(Camera3DC, TextureC, RectangleC, Vector3C, Vector2C, ColorC)>();

  /// Draw a billboard texture defined by source and rotation
  void DrawBillboardPro(Camera3DC camera, TextureC texture, RectangleC source, Vector3C position, Vector3C up, Vector2C size, Vector2C origin, double rotation, ColorC tint)
    => _DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint);
  late final _DrawBillboardProPtr = _lookup<NativeFunction<Void Function(Camera3DC, TextureC, RectangleC, Vector3C, Vector3C, Vector2C, Vector2C, Float, ColorC)>>('DrawBillboardPro');
  late final _DrawBillboardPro = _DrawBillboardProPtr.asFunction<void Function(Camera3DC, TextureC, RectangleC, Vector3C, Vector3C, Vector2C, Vector2C, double, ColorC)>();

  /// Upload mesh vertex data in GPU and provide VAO/VBO ids
  void UploadMesh(Pointer<MeshC> mesh, bool dynamic)
    => _UploadMesh(mesh, dynamic);
  late final _UploadMeshPtr = _lookup<NativeFunction<Void Function(Pointer<MeshC>, Bool)>>('UploadMesh');
  late final _UploadMesh = _UploadMeshPtr.asFunction<void Function(Pointer<MeshC>, bool)>();

  /// Update mesh vertex data in GPU for a specific buffer index
  void UpdateMeshBuffer(MeshC mesh, int index, Pointer<Void> data, int dataSize, int offset)
    => _UpdateMeshBuffer(mesh, index, data, dataSize, offset);
  late final _UpdateMeshBufferPtr = _lookup<NativeFunction<Void Function(MeshC, Int, Pointer<Void>, Int, Int)>>('UpdateMeshBuffer');
  late final _UpdateMeshBuffer = _UpdateMeshBufferPtr.asFunction<void Function(MeshC, int, Pointer<Void>, int, int)>();

  /// Unload mesh data from CPU and GPU
  void UnloadMesh(MeshC mesh)
    => _UnloadMesh(mesh);
  late final _UnloadMeshPtr = _lookup<NativeFunction<Void Function(MeshC)>>('UnloadMesh');
  late final _UnloadMesh = _UnloadMeshPtr.asFunction<void Function(MeshC)>();

  /// Draw a 3d mesh with material and transform
  void DrawMesh(MeshC mesh, MaterialC material, MatrixC transform)
    => _DrawMesh(mesh, material, transform);
  late final _DrawMeshPtr = _lookup<NativeFunction<Void Function(MeshC, MaterialC, MatrixC)>>('DrawMesh');
  late final _DrawMesh = _DrawMeshPtr.asFunction<void Function(MeshC, MaterialC, MatrixC)>();

  /// Draw multiple mesh instances with material and different transforms
  void DrawMeshInstanced(MeshC mesh, MaterialC material, Pointer<MatrixC> transforms, int instances)
    => _DrawMeshInstanced(mesh, material, transforms, instances);
  late final _DrawMeshInstancedPtr = _lookup<NativeFunction<Void Function(MeshC, MaterialC, Pointer<MatrixC>, Int)>>('DrawMeshInstanced');
  late final _DrawMeshInstanced = _DrawMeshInstancedPtr.asFunction<void Function(MeshC, MaterialC, Pointer<MatrixC>, int)>();

  /// Compute mesh bounding box limits
  BoundingBoxC GetMeshBoundingBox(MeshC mesh)
    => _GetMeshBoundingBox(mesh);
  late final _GetMeshBoundingBoxPtr = _lookup<NativeFunction<BoundingBoxC Function(MeshC)>>('GetMeshBoundingBox');
  late final _GetMeshBoundingBox = _GetMeshBoundingBoxPtr.asFunction<BoundingBoxC Function(MeshC)>();

  /// Compute mesh tangents
  void GenMeshTangents(Pointer<MeshC> mesh)
    => _GenMeshTangents(mesh);
  late final _GenMeshTangentsPtr = _lookup<NativeFunction<Void Function(Pointer<MeshC>)>>('GenMeshTangents');
  late final _GenMeshTangents = _GenMeshTangentsPtr.asFunction<void Function(Pointer<MeshC>)>();

  /// Export mesh data to file, returns true on success
  bool ExportMesh(MeshC mesh, Pointer<Char> fileName)
    => _ExportMesh(mesh, fileName);
  late final _ExportMeshPtr = _lookup<NativeFunction<Bool Function(MeshC, Pointer<Char>)>>('ExportMesh');
  late final _ExportMesh = _ExportMeshPtr.asFunction<bool Function(MeshC, Pointer<Char>)>();

  /// Export mesh as code file (.h) defining multiple arrays of vertex attributes
  bool ExportMeshAsCode(MeshC mesh, Pointer<Char> fileName)
    => _ExportMeshAsCode(mesh, fileName);
  late final _ExportMeshAsCodePtr = _lookup<NativeFunction<Bool Function(MeshC, Pointer<Char>)>>('ExportMeshAsCode');
  late final _ExportMeshAsCode = _ExportMeshAsCodePtr.asFunction<bool Function(MeshC, Pointer<Char>)>();

  /// Generate polygonal mesh
  MeshC GenMeshPoly(int sides, double radius)
    => _GenMeshPoly(sides, radius);
  late final _GenMeshPolyPtr = _lookup<NativeFunction<MeshC Function(Int, Float)>>('GenMeshPoly');
  late final _GenMeshPoly = _GenMeshPolyPtr.asFunction<MeshC Function(int, double)>();

  /// Generate plane mesh (with subdivisions)
  MeshC GenMeshPlane(double width, double length, int resX, int resZ)
    => _GenMeshPlane(width, length, resX, resZ);
  late final _GenMeshPlanePtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int, Int)>>('GenMeshPlane');
  late final _GenMeshPlane = _GenMeshPlanePtr.asFunction<MeshC Function(double, double, int, int)>();

  /// Generate cuboid mesh
  MeshC GenMeshCube(double width, double height, double length)
    => _GenMeshCube(width, height, length);
  late final _GenMeshCubePtr = _lookup<NativeFunction<MeshC Function(Float, Float, Float)>>('GenMeshCube');
  late final _GenMeshCube = _GenMeshCubePtr.asFunction<MeshC Function(double, double, double)>();

  /// Generate sphere mesh (standard sphere)
  MeshC GenMeshSphere(double radius, int rings, int slices)
    => _GenMeshSphere(radius, rings, slices);
  late final _GenMeshSpherePtr = _lookup<NativeFunction<MeshC Function(Float, Int, Int)>>('GenMeshSphere');
  late final _GenMeshSphere = _GenMeshSpherePtr.asFunction<MeshC Function(double, int, int)>();

  /// Generate half-sphere mesh (no bottom cap)
  MeshC GenMeshHemiSphere(double radius, int rings, int slices)
    => _GenMeshHemiSphere(radius, rings, slices);
  late final _GenMeshHemiSpherePtr = _lookup<NativeFunction<MeshC Function(Float, Int, Int)>>('GenMeshHemiSphere');
  late final _GenMeshHemiSphere = _GenMeshHemiSpherePtr.asFunction<MeshC Function(double, int, int)>();

  /// Generate cylinder mesh
  MeshC GenMeshCylinder(double radius, double height, int slices)
    => _GenMeshCylinder(radius, height, slices);
  late final _GenMeshCylinderPtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int)>>('GenMeshCylinder');
  late final _GenMeshCylinder = _GenMeshCylinderPtr.asFunction<MeshC Function(double, double, int)>();

  /// Generate cone/pyramid mesh
  MeshC GenMeshCone(double radius, double height, int slices)
    => _GenMeshCone(radius, height, slices);
  late final _GenMeshConePtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int)>>('GenMeshCone');
  late final _GenMeshCone = _GenMeshConePtr.asFunction<MeshC Function(double, double, int)>();

  /// Generate torus mesh
  MeshC GenMeshTorus(double radius, double size, int radSeg, int sides)
    => _GenMeshTorus(radius, size, radSeg, sides);
  late final _GenMeshTorusPtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int, Int)>>('GenMeshTorus');
  late final _GenMeshTorus = _GenMeshTorusPtr.asFunction<MeshC Function(double, double, int, int)>();

  /// Generate trefoil knot mesh
  MeshC GenMeshKnot(double radius, double size, int radSeg, int sides)
    => _GenMeshKnot(radius, size, radSeg, sides);
  late final _GenMeshKnotPtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int, Int)>>('GenMeshKnot');
  late final _GenMeshKnot = _GenMeshKnotPtr.asFunction<MeshC Function(double, double, int, int)>();

  /// Generate heightmap mesh from image data
  MeshC GenMeshHeightmap(ImageC heightmap, Vector3C size)
    => _GenMeshHeightmap(heightmap, size);
  late final _GenMeshHeightmapPtr = _lookup<NativeFunction<MeshC Function(ImageC, Vector3C)>>('GenMeshHeightmap');
  late final _GenMeshHeightmap = _GenMeshHeightmapPtr.asFunction<MeshC Function(ImageC, Vector3C)>();

  /// Generate cubes-based map mesh from image data
  MeshC GenMeshCubicmap(ImageC cubicmap, Vector3C cubeSize)
    => _GenMeshCubicmap(cubicmap, cubeSize);
  late final _GenMeshCubicmapPtr = _lookup<NativeFunction<MeshC Function(ImageC, Vector3C)>>('GenMeshCubicmap');
  late final _GenMeshCubicmap = _GenMeshCubicmapPtr.asFunction<MeshC Function(ImageC, Vector3C)>();

  /// Load materials from model file
  Pointer<MaterialC> LoadMaterials(Pointer<Char> fileName, Pointer<Int> materialCount)
    => _LoadMaterials(fileName, materialCount);
  late final _LoadMaterialsPtr = _lookup<NativeFunction<Pointer<MaterialC> Function(Pointer<Char>, Pointer<Int>)>>('LoadMaterials');
  late final _LoadMaterials = _LoadMaterialsPtr.asFunction<Pointer<MaterialC> Function(Pointer<Char>, Pointer<Int>)>();

  /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  MaterialC LoadMaterialDefault()
    => _LoadMaterialDefault();
  late final _LoadMaterialDefaultPtr = _lookup<NativeFunction<MaterialC Function()>>('LoadMaterialDefault');
  late final _LoadMaterialDefault = _LoadMaterialDefaultPtr.asFunction<MaterialC Function()>();

  /// Check if a material is valid (shader assigned, map textures loaded in GPU)
  bool IsMaterialValid(MaterialC material)
    => _IsMaterialValid(material);
  late final _IsMaterialValidPtr = _lookup<NativeFunction<Bool Function(MaterialC)>>('IsMaterialValid');
  late final _IsMaterialValid = _IsMaterialValidPtr.asFunction<bool Function(MaterialC)>();

  /// Unload material from GPU memory (VRAM)
  void UnloadMaterial(MaterialC material)
    => _UnloadMaterial(material);
  late final _UnloadMaterialPtr = _lookup<NativeFunction<Void Function(MaterialC)>>('UnloadMaterial');
  late final _UnloadMaterial = _UnloadMaterialPtr.asFunction<void Function(MaterialC)>();

  /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
  void SetMaterialTexture(Pointer<MaterialC> material, int mapType, TextureC texture)
    => _SetMaterialTexture(material, mapType, texture);
  late final _SetMaterialTexturePtr = _lookup<NativeFunction<Void Function(Pointer<MaterialC>, Int, TextureC)>>('SetMaterialTexture');
  late final _SetMaterialTexture = _SetMaterialTexturePtr.asFunction<void Function(Pointer<MaterialC>, int, TextureC)>();

  /// Set material for a mesh
  void SetModelMeshMaterial(Pointer<ModelC> model, int meshId, int materialId)
    => _SetModelMeshMaterial(model, meshId, materialId);
  late final _SetModelMeshMaterialPtr = _lookup<NativeFunction<Void Function(Pointer<ModelC>, Int, Int)>>('SetModelMeshMaterial');
  late final _SetModelMeshMaterial = _SetModelMeshMaterialPtr.asFunction<void Function(Pointer<ModelC>, int, int)>();

  /// Load model animations from file
  Pointer<ModelAnimationC> LoadModelAnimations(Pointer<Char> fileName, Pointer<Int> animCount)
    => _LoadModelAnimations(fileName, animCount);
  late final _LoadModelAnimationsPtr = _lookup<NativeFunction<Pointer<ModelAnimationC> Function(Pointer<Char>, Pointer<Int>)>>('LoadModelAnimations');
  late final _LoadModelAnimations = _LoadModelAnimationsPtr.asFunction<Pointer<ModelAnimationC> Function(Pointer<Char>, Pointer<Int>)>();

  /// Update model animation pose (CPU)
  void UpdateModelAnimation(ModelC model, ModelAnimationC anim, double frame)
    => _UpdateModelAnimation(model, anim, frame);
  late final _UpdateModelAnimationPtr = _lookup<NativeFunction<Void Function(ModelC, ModelAnimationC, Float)>>('UpdateModelAnimation');
  late final _UpdateModelAnimation = _UpdateModelAnimationPtr.asFunction<void Function(ModelC, ModelAnimationC, double)>();

  /// Update model animation data (vertex buffers / bone matrices) for a specific pose,
  /// defined by two different animations at specific frames blended together
  void UpdateModelAnimationEx(ModelC model, ModelAnimationC animA, double frameA, ModelAnimationC animB, double frameB, double blend)
    => _UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend);
  late final _UpdateModelAnimationExPtr = _lookup<NativeFunction<Void Function(ModelC, ModelAnimationC, Float, ModelAnimationC, Float, Float)>>('UpdateModelAnimationEx');
  late final _UpdateModelAnimationEx = _UpdateModelAnimationExPtr.asFunction<void Function(ModelC, ModelAnimationC, double, ModelAnimationC, double, double)>();

  /// Unload animation array data
  void UnloadModelAnimations(Pointer<ModelAnimationC> animations, int animCount)
    => _UnloadModelAnimations(animations, animCount);
  late final _UnloadModelAnimationsPtr = _lookup<NativeFunction<Void Function(Pointer<ModelAnimationC>, Int)>>('UnloadModelAnimations');
  late final _UnloadModelAnimations = _UnloadModelAnimationsPtr.asFunction<void Function(Pointer<ModelAnimationC>, int)>();

  /// Check model animation skeleton match
  bool IsModelAnimationValid(ModelC model, ModelAnimationC anim)
    => _IsModelAnimationValid(model, anim);
  late final _IsModelAnimationValidPtr = _lookup<NativeFunction<Bool Function(ModelC, ModelAnimationC)>>('IsModelAnimationValid');
  late final _IsModelAnimationValid = _IsModelAnimationValidPtr.asFunction<bool Function(ModelC, ModelAnimationC)>();

  /// Check collision between two spheres
  bool CheckCollisionSpheres(Vector3C center1, double radius1, Vector3C center2, double radius2)
    => _CheckCollisionSpheres(center1, radius1, center2, radius2);
  late final _CheckCollisionSpheresPtr = _lookup<NativeFunction<Bool Function(Vector3C, Float, Vector3C, Float)>>('CheckCollisionSpheres');
  late final _CheckCollisionSpheres = _CheckCollisionSpheresPtr.asFunction<bool Function(Vector3C, double, Vector3C, double)>();

  /// Check collision between two bounding boxes
  bool CheckCollisionBoxes(BoundingBoxC box1, BoundingBoxC box2)
    => _CheckCollisionBoxes(box1, box2);
  late final _CheckCollisionBoxesPtr = _lookup<NativeFunction<Bool Function(BoundingBoxC, BoundingBoxC)>>('CheckCollisionBoxes');
  late final _CheckCollisionBoxes = _CheckCollisionBoxesPtr.asFunction<bool Function(BoundingBoxC, BoundingBoxC)>();

  /// Check collision between box and sphere
  bool CheckCollisionBoxSphere(BoundingBoxC box, Vector3C center, double radius)
    => _CheckCollisionBoxSphere(box, center, radius);
  late final _CheckCollisionBoxSpherePtr = _lookup<NativeFunction<Bool Function(BoundingBoxC, Vector3C, Float)>>('CheckCollisionBoxSphere');
  late final _CheckCollisionBoxSphere = _CheckCollisionBoxSpherePtr.asFunction<bool Function(BoundingBoxC, Vector3C, double)>();

  /// Get collision info between ray and sphere
  RayCollisionC GetRayCollisionSphere(RayC ray, Vector3C center, double radius)
    => _GetRayCollisionSphere(ray, center, radius);
  late final _GetRayCollisionSpherePtr = _lookup<NativeFunction<RayCollisionC Function(RayC, Vector3C, Float)>>('GetRayCollisionSphere');
  late final _GetRayCollisionSphere = _GetRayCollisionSpherePtr.asFunction<RayCollisionC Function(RayC, Vector3C, double)>();

  /// Get collision info between ray and box
  RayCollisionC GetRayCollisionBox(RayC ray, BoundingBoxC box)
    => _GetRayCollisionBox(ray, box);
  late final _GetRayCollisionBoxPtr = _lookup<NativeFunction<RayCollisionC Function(RayC, BoundingBoxC)>>('GetRayCollisionBox');
  late final _GetRayCollisionBox = _GetRayCollisionBoxPtr.asFunction<RayCollisionC Function(RayC, BoundingBoxC)>();

  /// Get collision info between ray and mesh
  RayCollisionC GetRayCollisionMesh(RayC ray, MeshC mesh, MatrixC transform)
    => _GetRayCollisionMesh(ray, mesh, transform);
  late final _GetRayCollisionMeshPtr = _lookup<NativeFunction<RayCollisionC Function(RayC, MeshC, MatrixC)>>('GetRayCollisionMesh');
  late final _GetRayCollisionMesh = _GetRayCollisionMeshPtr.asFunction<RayCollisionC Function(RayC, MeshC, MatrixC)>();

  /// Get collision info between ray and triangle
  RayCollisionC GetRayCollisionTriangle(RayC ray, Vector3C p1, Vector3C p2, Vector3C p3)
    => _GetRayCollisionTriangle(ray, p1, p2, p3);
  late final _GetRayCollisionTrianglePtr = _lookup<NativeFunction<RayCollisionC Function(RayC, Vector3C, Vector3C, Vector3C)>>('GetRayCollisionTriangle');
  late final _GetRayCollisionTriangle = _GetRayCollisionTrianglePtr.asFunction<RayCollisionC Function(RayC, Vector3C, Vector3C, Vector3C)>();

  /// Get collision info between ray and quad
  RayCollisionC GetRayCollisionQuad(RayC ray, Vector3C p1, Vector3C p2, Vector3C p3, Vector3C p4)
    => _GetRayCollisionQuad(ray, p1, p2, p3, p4);
  late final _GetRayCollisionQuadPtr = _lookup<NativeFunction<RayCollisionC Function(RayC, Vector3C, Vector3C, Vector3C, Vector3C)>>('GetRayCollisionQuad');
  late final _GetRayCollisionQuad = _GetRayCollisionQuadPtr.asFunction<RayCollisionC Function(RayC, Vector3C, Vector3C, Vector3C, Vector3C)>();
}
