part of '../../../raylib_dartified.dart';

class RaylibCore extends RaylibModule<Raylib> {
  RaylibCore(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  void InitWindow(int width, int height, Pointer<Char> title)
    => _InitWindow(width, height, title);
  late final _InitWindowPtr = _lookup<NativeFunction<Void Function(Int, Int, Pointer<Char>)>>('InitWindow');
  late final _InitWindow = _InitWindowPtr.asFunction<void Function(int, int, Pointer<Char>)>();

  void CloseWindow()
    => _CloseWindow();
  late final _CloseWindowPtr = _lookup<NativeFunction<Void Function()>>('CloseWindow');
  late final _CloseWindow = _CloseWindowPtr.asFunction<void Function()>();

  bool WindowShouldClose()
    => _WindowShouldClose();
  late final _WindowShouldClosePtr = _lookup<NativeFunction<Bool Function()>>('WindowShouldClose');
  late final _WindowShouldClose = _WindowShouldClosePtr.asFunction<bool Function()>();

  bool IsWindowReady()
    => _IsWindowReady();
  late final _IsWindowReadyPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowReady');
  late final _IsWindowReady = _IsWindowReadyPtr.asFunction<bool Function()>();

  bool IsWindowFullscreen()
    => _IsWindowFullscreen();
  late final _IsWindowFullscreenPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowFullscreen');
  late final _IsWindowFullscreen = _IsWindowFullscreenPtr.asFunction<bool Function()>();

  bool IsWindowHidden()
    => _IsWindowHidden();
  late final _IsWindowHiddenPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowHidden');
  late final _IsWindowHidden = _IsWindowHiddenPtr.asFunction<bool Function()>();

  bool IsWindowMinimized()
    => _IsWindowMinimized();
  late final _IsWindowMinimizedPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowMinimized');
  late final _IsWindowMinimized = _IsWindowMinimizedPtr.asFunction<bool Function()>();

  bool IsWindowMaximized()
    => _IsWindowMaximized();
  late final _IsWindowMaximizedPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowMaximized');
  late final _IsWindowMaximized = _IsWindowMaximizedPtr.asFunction<bool Function()>();

  bool IsWindowFocused()
    => _IsWindowFocused();
  late final _IsWindowFocusedPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowFocused');
  late final _IsWindowFocused = _IsWindowFocusedPtr.asFunction<bool Function()>();

  bool IsWindowResized()
    => _IsWindowResized();
  late final _IsWindowResizedPtr = _lookup<NativeFunction<Bool Function()>>('IsWindowResized');
  late final _IsWindowResized = _IsWindowResizedPtr.asFunction<bool Function()>();

  bool IsWindowState(int flag)
    => _IsWindowState(flag);
  late final _IsWindowStatePtr = _lookup<NativeFunction<Bool Function(UnsignedInt)>>('IsWindowState');
  late final _IsWindowState = _IsWindowStatePtr.asFunction<bool Function(int)>();

  void SetWindowState(int flags)
    => _SetWindowState(flags);
  late final _SetWindowStatePtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('SetWindowState');
  late final _SetWindowState = _SetWindowStatePtr.asFunction<void Function(int)>();

  void ClearWindowState(int flags)
    => _ClearWindowState(flags);
  late final _ClearWindowStatePtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('ClearWindowState');
  late final _ClearWindowState = _ClearWindowStatePtr.asFunction<void Function(int)>();

  void ToggleFullscreen()
    => _ToggleFullscreen();
  late final _ToggleFullscreenPtr = _lookup<NativeFunction<Void Function()>>('ToggleFullscreen');
  late final _ToggleFullscreen = _ToggleFullscreenPtr.asFunction<void Function()>();

  void ToggleBorderlessWindowed()
    => _ToggleBorderlessWindowed();
  late final _ToggleBorderlessWindowedPtr = _lookup<NativeFunction<Void Function()>>('ToggleBorderlessWindowed');
  late final _ToggleBorderlessWindowed = _ToggleBorderlessWindowedPtr.asFunction<void Function()>();

  void MaximizeWindow()
    => _MaximizeWindow();
  late final _MaximizeWindowPtr = _lookup<NativeFunction<Void Function()>>('MaximizeWindow');
  late final _MaximizeWindow = _MaximizeWindowPtr.asFunction<void Function()>();

  void MinimizeWindow()
    => _MinimizeWindow();
  late final _MinimizeWindowPtr = _lookup<NativeFunction<Void Function()>>('MinimizeWindow');
  late final _MinimizeWindow = _MinimizeWindowPtr.asFunction<void Function()>();

  void RestoreWindow()
    => _RestoreWindow();
  late final _RestoreWindowPtr = _lookup<NativeFunction<Void Function()>>('RestoreWindow');
  late final _RestoreWindow = _RestoreWindowPtr.asFunction<void Function()>();

  void SetWindowIcon(ImageC image)
    => _SetWindowIcon(image);
  late final _SetWindowIconPtr = _lookup<NativeFunction<Void Function(ImageC)>>('SetWindowIcon');
  late final _SetWindowIcon = _SetWindowIconPtr.asFunction<void Function(ImageC)>();

  void SetWindowIcons(Pointer<ImageC> images, int count)
    => _SetWindowIcons(images, count);
  late final _SetWindowIconsPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('SetWindowIcons');
  late final _SetWindowIcons = _SetWindowIconsPtr.asFunction<void Function(Pointer<ImageC>, int)>();

  void SetWindowTitle(Pointer<Char> title)
    => _SetWindowTitle(title);
  late final _SetWindowTitlePtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('SetWindowTitle');
  late final _SetWindowTitle = _SetWindowTitlePtr.asFunction<void Function(Pointer<Char>)>();

  void SetWindowPosition(int x, int y)
    => _SetWindowPosition(x, y);
  late final _SetWindowPositionPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetWindowPosition');
  late final _SetWindowPosition = _SetWindowPositionPtr.asFunction<void Function(int, int)>();

  void SetWindowMonitor(int monitor)
    => _SetWindowMonitor(monitor);
  late final _SetWindowMonitorPtr = _lookup<NativeFunction<Void Function(Int)>>('SetWindowMonitor');
  late final _SetWindowMonitor = _SetWindowMonitorPtr.asFunction<void Function(int)>();

  void SetWindowMinSize(int width, int height)
    => _SetWindowMinSize(width, height);
  late final _SetWindowMinSizePtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetWindowMinSize');
  late final _SetWindowMinSize = _SetWindowMinSizePtr.asFunction<void Function(int, int)>();

  void SetWindowMaxSize(int width, int height)
    => _SetWindowMaxSize(width, height);
  late final _SetWindowMaxSizePtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetWindowMaxSize');
  late final _SetWindowMaxSize = _SetWindowMaxSizePtr.asFunction<void Function(int, int)>();

  void SetWindowSize(int width, int height)
    => _SetWindowSize(width, height);
  late final _SetWindowSizePtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetWindowSize');
  late final _SetWindowSize = _SetWindowSizePtr.asFunction<void Function(int, int)>();

  void SetWindowOpacity(double opacity)
    => _SetWindowOpacity(opacity);
  late final _SetWindowOpacityPtr = _lookup<NativeFunction<Void Function(Float)>>('SetWindowOpacity');
  late final _SetWindowOpacity = _SetWindowOpacityPtr.asFunction<void Function(double)>();

  void SetWindowFocused()
    => _SetWindowFocused();
  late final _SetWindowFocusedPtr = _lookup<NativeFunction<Void Function()>>('SetWindowFocused');
  late final _SetWindowFocused = _SetWindowFocusedPtr.asFunction<void Function()>();

  Pointer<Void> GetWindowHandle()
    => _GetWindowHandle();
  late final _GetWindowHandlePtr = _lookup<NativeFunction<Pointer<Void> Function()>>('GetWindowHandle');
  late final _GetWindowHandle = _GetWindowHandlePtr.asFunction<Pointer<Void> Function()>();

  int GetScreenWidth()
    => _GetScreenWidth();
  late final _GetScreenWidthPtr = _lookup<NativeFunction<Int Function()>>('GetScreenWidth');
  late final _GetScreenWidth = _GetScreenWidthPtr.asFunction<int Function()>();

  int GetScreenHeight()
    => _GetScreenHeight();
  late final _GetScreenHeightPtr = _lookup<NativeFunction<Int Function()>>('GetScreenHeight');
  late final _GetScreenHeight = _GetScreenHeightPtr.asFunction<int Function()>();

  int GetRenderWidth()
    => _GetRenderWidth();
  late final _GetRenderWidthPtr = _lookup<NativeFunction<Int Function()>>('GetRenderWidth');
  late final _GetRenderWidth = _GetRenderWidthPtr.asFunction<int Function()>();

  int GetRenderHeight()
    => _GetRenderHeight();
  late final _GetRenderHeightPtr = _lookup<NativeFunction<Int Function()>>('GetRenderHeight');
  late final _GetRenderHeight = _GetRenderHeightPtr.asFunction<int Function()>();

  int GetMonitorCount()
    => _GetMonitorCount();
  late final _GetMonitorCountPtr = _lookup<NativeFunction<Int Function()>>('GetMonitorCount');
  late final _GetMonitorCount = _GetMonitorCountPtr.asFunction<int Function()>();

  int GetCurrentMonitor()
    => _GetCurrentMonitor();
  late final _GetCurrentMonitorPtr = _lookup<NativeFunction<Int Function()>>('GetCurrentMonitor');
  late final _GetCurrentMonitor = _GetCurrentMonitorPtr.asFunction<int Function()>();

  Vector2C GetMonitorPosition(int monitor)
    => _GetMonitorPosition(monitor);
  late final _GetMonitorPositionPtr = _lookup<NativeFunction<Vector2C Function(Int)>>('GetMonitorPosition');
  late final _GetMonitorPosition = _GetMonitorPositionPtr.asFunction<Vector2C Function(int)>();

  int GetMonitorWidth(int monitor)
    => _GetMonitorWidth(monitor);
  late final _GetMonitorWidthPtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorWidth');
  late final _GetMonitorWidth = _GetMonitorWidthPtr.asFunction<int Function(int)>();

  int GetMonitorHeight(int monitor)
    => _GetMonitorHeight(monitor);
  late final _GetMonitorHeightPtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorHeight');
  late final _GetMonitorHeight = _GetMonitorHeightPtr.asFunction<int Function(int)>();

  int GetMonitorPhysicalWidth(int monitor)
    => _GetMonitorPhysicalWidth(monitor);
  late final _GetMonitorPhysicalWidthPtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorPhysicalWidth');
  late final _GetMonitorPhysicalWidth = _GetMonitorPhysicalWidthPtr.asFunction<int Function(int)>();

  int GetMonitorPhysicalHeight(int monitor)
    => _GetMonitorPhysicalHeight(monitor);
  late final _GetMonitorPhysicalHeightPtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorPhysicalHeight');
  late final _GetMonitorPhysicalHeight = _GetMonitorPhysicalHeightPtr.asFunction<int Function(int)>();

  int GetMonitorRefreshRate(int monitor)
    => _GetMonitorRefreshRate(monitor);
  late final _GetMonitorRefreshRatePtr = _lookup<NativeFunction<Int Function(Int)>>('GetMonitorRefreshRate');
  late final _GetMonitorRefreshRate = _GetMonitorRefreshRatePtr.asFunction<int Function(int)>();

  Vector2C GetWindowPosition()
    => _GetWindowPosition();
  late final _GetWindowPositionPtr = _lookup<NativeFunction<Vector2C Function()>>('GetWindowPosition');
  late final _GetWindowPosition = _GetWindowPositionPtr.asFunction<Vector2C Function()>();

  Vector2C GetWindowScaleDPI()
    => _GetWindowScaleDPI();
  late final _GetWindowScaleDPIPtr = _lookup<NativeFunction<Vector2C Function()>>('GetWindowScaleDPI');
  late final _GetWindowScaleDPI = _GetWindowScaleDPIPtr.asFunction<Vector2C Function()>();

  Pointer<Char> GetMonitorName(int monitor)
    => _GetMonitorName(monitor);
  late final _GetMonitorNamePtr = _lookup<NativeFunction<Pointer<Char> Function(Int)>>('GetMonitorName');
  late final _GetMonitorName = _GetMonitorNamePtr.asFunction<Pointer<Char> Function(int)>();

  void SetClipboardText(Pointer<Char> text)
    => _SetClipboardText(text);
  late final _SetClipboardTextPtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('SetClipboardText');
  late final _SetClipboardText = _SetClipboardTextPtr.asFunction<void Function(Pointer<Char>)>();

  Pointer<Char> GetClipboardText()
    => _GetClipboardText();
  late final _GetClipboardTextPtr = _lookup<NativeFunction<Pointer<Char> Function()>>('GetClipboardText');
  late final _GetClipboardText = _GetClipboardTextPtr.asFunction<Pointer<Char> Function()>();

  ImageC GetClipboardImage()
    => _GetClipboardImage();
  late final _GetClipboardImagePtr = _lookup<NativeFunction<ImageC Function()>>('GetClipboardImage');
  late final _GetClipboardImage = _GetClipboardImagePtr.asFunction<ImageC Function()>();

  void EnableEventWaiting()
    => _EnableEventWaiting();
  late final _EnableEventWaitingPtr = _lookup<NativeFunction<Void Function()>>('EnableEventWaiting');
  late final _EnableEventWaiting = _EnableEventWaitingPtr.asFunction<void Function()>();

  void DisableEventWaiting()
    => _DisableEventWaiting();
  late final _DisableEventWaitingPtr = _lookup<NativeFunction<Void Function()>>('DisableEventWaiting');
  late final _DisableEventWaiting = _DisableEventWaitingPtr.asFunction<void Function()>();

  void ShowCursor()
    => _ShowCursor();
  late final _ShowCursorPtr = _lookup<NativeFunction<Void Function()>>('ShowCursor');
  late final _ShowCursor = _ShowCursorPtr.asFunction<void Function()>();

  void HideCursor()
    => _HideCursor();
  late final _HideCursorPtr = _lookup<NativeFunction<Void Function()>>('HideCursor');
  late final _HideCursor = _HideCursorPtr.asFunction<void Function()>();

  bool IsCursorHidden()
    => _IsCursorHidden();
  late final _IsCursorHiddenPtr = _lookup<NativeFunction<Bool Function()>>('IsCursorHidden');
  late final _IsCursorHidden = _IsCursorHiddenPtr.asFunction<bool Function()>();

  void EnableCursor()
    => _EnableCursor();
  late final _EnableCursorPtr = _lookup<NativeFunction<Void Function()>>('EnableCursor');
  late final _EnableCursor = _EnableCursorPtr.asFunction<void Function()>();

  void DisableCursor()
    => _DisableCursor();
  late final _DisableCursorPtr = _lookup<NativeFunction<Void Function()>>('DisableCursor');
  late final _DisableCursor = _DisableCursorPtr.asFunction<void Function()>();

  bool IsCursorOnScreen()
    => _IsCursorOnScreen();
  late final _IsCursorOnScreenPtr = _lookup<NativeFunction<Bool Function()>>('IsCursorOnScreen');
  late final _IsCursorOnScreen = _IsCursorOnScreenPtr.asFunction<bool Function()>();

  void ClearBackground(ColorC color)
    => _ClearBackground(color);
  late final _ClearBackgroundPtr = _lookup<NativeFunction<Void Function(ColorC)>>('ClearBackground');
  late final _ClearBackground = _ClearBackgroundPtr.asFunction<void Function(ColorC)>();

  void BeginDrawing()
    => _BeginDrawing();
  late final _BeginDrawingPtr = _lookup<NativeFunction<Void Function()>>('BeginDrawing');
  late final _BeginDrawing = _BeginDrawingPtr.asFunction<void Function()>();

  void EndDrawing()
    => _EndDrawing();
  late final _EndDrawingPtr = _lookup<NativeFunction<Void Function()>>('EndDrawing');
  late final _EndDrawing = _EndDrawingPtr.asFunction<void Function()>();

  void BeginMode2D(Camera2DC camera)
    => _BeginMode2D(camera);
  late final _BeginMode2DPtr = _lookup<NativeFunction<Void Function(Camera2DC)>>('BeginMode2D');
  late final _BeginMode2D = _BeginMode2DPtr.asFunction<void Function(Camera2DC)>();

  void EndMode2D()
    => _EndMode2D();
  late final _EndMode2DPtr = _lookup<NativeFunction<Void Function()>>('EndMode2D');
  late final _EndMode2D = _EndMode2DPtr.asFunction<void Function()>();

  void BeginMode3D(Camera3DC camera)
    => _BeginMode3D(camera);
  late final _BeginMode3DPtr = _lookup<NativeFunction<Void Function(Camera3DC)>>('BeginMode3D');
  late final _BeginMode3D = _BeginMode3DPtr.asFunction<void Function(Camera3DC)>();

  void EndMode3D()
    => _EndMode3D();
  late final _EndMode3DPtr = _lookup<NativeFunction<Void Function()>>('EndMode3D');
  late final _EndMode3D = _EndMode3DPtr.asFunction<void Function()>();

  void BeginTextureMode(RenderTextureC target)
    => _BeginTextureMode(target);
  late final _BeginTextureModePtr = _lookup<NativeFunction<Void Function(RenderTextureC)>>('BeginTextureMode');
  late final _BeginTextureMode = _BeginTextureModePtr.asFunction<void Function(RenderTextureC)>();

  void EndTextureMode()
    => _EndTextureMode();
  late final _EndTextureModePtr = _lookup<NativeFunction<Void Function()>>('EndTextureMode');
  late final _EndTextureMode = _EndTextureModePtr.asFunction<void Function()>();

  void BeginShaderMode(ShaderC shader)
    => _BeginShaderMode(shader);
  late final _BeginShaderModePtr = _lookup<NativeFunction<Void Function(ShaderC)>>('BeginShaderMode');
  late final _BeginShaderMode = _BeginShaderModePtr.asFunction<void Function(ShaderC)>();

  void EndShaderMode()
    => _EndShaderMode();
  late final _EndShaderModePtr = _lookup<NativeFunction<Void Function()>>('EndShaderMode');
  late final _EndShaderMode = _EndShaderModePtr.asFunction<void Function()>();

  void BeginBlendMode(int mode)
    => _BeginBlendMode(mode);
  late final _BeginBlendModePtr = _lookup<NativeFunction<Void Function(Int)>>('BeginBlendMode');
  late final _BeginBlendMode = _BeginBlendModePtr.asFunction<void Function(int)>();

  void EndBlendMode()
    => _EndBlendMode();
  late final _EndBlendModePtr = _lookup<NativeFunction<Void Function()>>('EndBlendMode');
  late final _EndBlendMode = _EndBlendModePtr.asFunction<void Function()>();

  void BeginScissorMode(int x, int y, int width, int height)
    => _BeginScissorMode(x, y, width, height);
  late final _BeginScissorModePtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int)>>('BeginScissorMode');
  late final _BeginScissorMode = _BeginScissorModePtr.asFunction<void Function(int, int, int, int)>();

  void EndScissorMode()
    => _EndScissorMode();
  late final _EndScissorModePtr = _lookup<NativeFunction<Void Function()>>('EndScissorMode');
  late final _EndScissorMode = _EndScissorModePtr.asFunction<void Function()>();

  void BeginVrStereoMode(VrStereoConfigC config)
    => _BeginVrStereoMode(config);
  late final _BeginVrStereoModePtr = _lookup<NativeFunction<Void Function(VrStereoConfigC)>>('BeginVrStereoMode');
  late final _BeginVrStereoMode = _BeginVrStereoModePtr.asFunction<void Function(VrStereoConfigC)>();

  void EndVrStereoMode()
    => _EndVrStereoMode();
  late final _EndVrStereoModePtr = _lookup<NativeFunction<Void Function()>>('EndVrStereoMode');
  late final _EndVrStereoMode = _EndVrStereoModePtr.asFunction<void Function()>();

  VrStereoConfigC LoadVrStereoConfig(VrDeviceInfoC device)
    => _LoadVrStereoConfig(device);
  late final _LoadVrStereoConfigPtr = _lookup<NativeFunction<VrStereoConfigC Function(VrDeviceInfoC)>>('LoadVrStereoConfig');
  late final _LoadVrStereoConfig = _LoadVrStereoConfigPtr.asFunction<VrStereoConfigC Function(VrDeviceInfoC)>();

  void UnloadVrStereoConfig(VrStereoConfigC config)
    => _UnloadVrStereoConfig(config);
  late final _UnloadVrStereoConfigPtr = _lookup<NativeFunction<Void Function(VrStereoConfigC)>>('UnloadVrStereoConfig');
  late final _UnloadVrStereoConfig = _UnloadVrStereoConfigPtr.asFunction<void Function(VrStereoConfigC)>();

  ShaderC LoadShader(Pointer<Char> vsFileName, Pointer<Char> fsFileName)
    => _LoadShader(vsFileName, fsFileName);
  late final _LoadShaderPtr = _lookup<NativeFunction<ShaderC Function(Pointer<Char>, Pointer<Char>)>>('LoadShader');
  late final _LoadShader = _LoadShaderPtr.asFunction<ShaderC Function(Pointer<Char>, Pointer<Char>)>();

  ShaderC LoadShaderFromMemory(Pointer<Char> vsCode, Pointer<Char> fsCode)
    => _LoadShaderFromMemory(vsCode, fsCode);
  late final _LoadShaderFromMemoryPtr = _lookup<NativeFunction<ShaderC Function(Pointer<Char>, Pointer<Char>)>>('LoadShaderFromMemory');
  late final _LoadShaderFromMemory = _LoadShaderFromMemoryPtr.asFunction<ShaderC Function(Pointer<Char>, Pointer<Char>)>();

  bool IsShaderValid(ShaderC shader)
    => _IsShaderValid(shader);
  late final _IsShaderValidPtr = _lookup<NativeFunction<Bool Function(ShaderC)>>('IsShaderValid');
  late final _IsShaderValid = _IsShaderValidPtr.asFunction<bool Function(ShaderC)>();

  int GetShaderLocation(ShaderC shader, Pointer<Char> uniformName)
    => _GetShaderLocation(shader, uniformName);
  late final _GetShaderLocationPtr = _lookup<NativeFunction<Int Function(ShaderC, Pointer<Char>)>>('GetShaderLocation');
  late final _GetShaderLocation = _GetShaderLocationPtr.asFunction<int Function(ShaderC, Pointer<Char>)>();

  int GetShaderLocationAttrib(ShaderC shader, Pointer<Char> attribName)
    => _GetShaderLocationAttrib(shader, attribName);
  late final _GetShaderLocationAttribPtr = _lookup<NativeFunction<Int Function(ShaderC, Pointer<Char>)>>('GetShaderLocationAttrib');
  late final _GetShaderLocationAttrib = _GetShaderLocationAttribPtr.asFunction<int Function(ShaderC, Pointer<Char>)>();

  void SetShaderValue(ShaderC shader, int locIndex, Pointer<Void> value, int uniformType)
    => _SetShaderValue(shader, locIndex, value, uniformType);
  late final _SetShaderValuePtr = _lookup<NativeFunction<Void Function(ShaderC, Int, Pointer<Void>, Int)>>('SetShaderValue');
  late final _SetShaderValue = _SetShaderValuePtr.asFunction<void Function(ShaderC, int, Pointer<Void>, int)>();

  void SetShaderValueV(ShaderC shader, int locIndex, Pointer<Void> value, int uniformType, int count)
    => _SetShaderValueV(shader, locIndex, value, uniformType, count);
  late final _SetShaderValueVPtr = _lookup<NativeFunction<Void Function(ShaderC, Int, Pointer<Void>, Int, Int)>>('SetShaderValueV');
  late final _SetShaderValueV = _SetShaderValueVPtr.asFunction<void Function(ShaderC, int, Pointer<Void>, int, int)>();

  void SetShaderValueMatrix(ShaderC shader, int locIndex, MatrixC mat)
    => _SetShaderValueMatrix(shader, locIndex, mat);
  late final _SetShaderValueMatrixPtr = _lookup<NativeFunction<Void Function(ShaderC, Int, MatrixC)>>('SetShaderValueMatrix');
  late final _SetShaderValueMatrix = _SetShaderValueMatrixPtr.asFunction<void Function(ShaderC, int, MatrixC)>();

  void SetShaderValueTexture(ShaderC shader, int locIndex, TextureC texture)
    => _SetShaderValueTexture(shader, locIndex, texture);
  late final _SetShaderValueTexturePtr = _lookup<NativeFunction<Void Function(ShaderC, Int, TextureC)>>('SetShaderValueTexture');
  late final _SetShaderValueTexture = _SetShaderValueTexturePtr.asFunction<void Function(ShaderC, int, TextureC)>();

  void UnloadShader(ShaderC shader)
    => _UnloadShader(shader);
  late final _UnloadShaderPtr = _lookup<NativeFunction<Void Function(ShaderC)>>('UnloadShader');
  late final _UnloadShader = _UnloadShaderPtr.asFunction<void Function(ShaderC)>();

  RayC GetScreenToWorldRay(Vector2C position, Camera3DC camera)
    => _GetScreenToWorldRay(position, camera);
  late final _GetScreenToWorldRayPtr = _lookup<NativeFunction<RayC Function(Vector2C, Camera3DC)>>('GetScreenToWorldRay');
  late final _GetScreenToWorldRay = _GetScreenToWorldRayPtr.asFunction<RayC Function(Vector2C, Camera3DC)>();

  RayC GetScreenToWorldRayEx(Vector2C position, Camera3DC camera, int width, int height)
    => _GetScreenToWorldRayEx(position, camera, width, height);
  late final _GetScreenToWorldRayExPtr = _lookup<NativeFunction<RayC Function(Vector2C, Camera3DC, Int, Int)>>('GetScreenToWorldRayEx');
  late final _GetScreenToWorldRayEx = _GetScreenToWorldRayExPtr.asFunction<RayC Function(Vector2C, Camera3DC, int, int)>();

  Vector2C GetWorldToScreen(Vector3C position, Camera3DC camera)
    => _GetWorldToScreen(position, camera);
  late final _GetWorldToScreenPtr = _lookup<NativeFunction<Vector2C Function(Vector3C, Camera3DC)>>('GetWorldToScreen');
  late final _GetWorldToScreen = _GetWorldToScreenPtr.asFunction<Vector2C Function(Vector3C, Camera3DC)>();

  Vector2C GetWorldToScreenEx(Vector3C position, Camera3DC camera, int width, int height)
    => _GetWorldToScreenEx(position, camera, width, height);
  late final _GetWorldToScreenExPtr = _lookup<NativeFunction<Vector2C Function(Vector3C, Camera3DC, Int, Int)>>('GetWorldToScreenEx');
  late final _GetWorldToScreenEx = _GetWorldToScreenExPtr.asFunction<Vector2C Function(Vector3C, Camera3DC, int, int)>();

  Vector2C GetWorldToScreen2D(Vector2C position, Camera2DC camera)
    => _GetWorldToScreen2D(position, camera);
  late final _GetWorldToScreen2DPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Camera2DC)>>('GetWorldToScreen2D');
  late final _GetWorldToScreen2D = _GetWorldToScreen2DPtr.asFunction<Vector2C Function(Vector2C, Camera2DC)>();

  Vector2C GetScreenToWorld2D(Vector2C position, Camera2DC camera)
    => _GetScreenToWorld2D(position, camera);
  late final _GetScreenToWorld2DPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Camera2DC)>>('GetScreenToWorld2D');
  late final _GetScreenToWorld2D = _GetScreenToWorld2DPtr.asFunction<Vector2C Function(Vector2C, Camera2DC)>();

  MatrixC GetCameraMatrix(Camera3DC camera)
    => _GetCameraMatrix(camera);
  late final _GetCameraMatrixPtr = _lookup<NativeFunction<MatrixC Function(Camera3DC)>>('GetCameraMatrix');
  late final _GetCameraMatrix = _GetCameraMatrixPtr.asFunction<MatrixC Function(Camera3DC)>();

  MatrixC GetCameraMatrix2D(Camera2DC camera)
    => _GetCameraMatrix2D(camera);
  late final _GetCameraMatrix2DPtr = _lookup<NativeFunction<MatrixC Function(Camera2DC)>>('GetCameraMatrix2D');
  late final _GetCameraMatrix2D = _GetCameraMatrix2DPtr.asFunction<MatrixC Function(Camera2DC)>();

  void SetTargetFPS(int fps)
    => _SetTargetFPS(fps);
  late final _SetTargetFPSPtr = _lookup<NativeFunction<Void Function(Int)>>('SetTargetFPS');
  late final _SetTargetFPS = _SetTargetFPSPtr.asFunction<void Function(int)>();

  double GetFrameTime()
    => _GetFrameTime();
  late final _GetFrameTimePtr = _lookup<NativeFunction<Float Function()>>('GetFrameTime');
  late final _GetFrameTime = _GetFrameTimePtr.asFunction<double Function()>();

  double GetTime()
    => _GetTime();
  late final _GetTimePtr = _lookup<NativeFunction<Double Function()>>('GetTime');
  late final _GetTime = _GetTimePtr.asFunction<double Function()>();

  int GetFPS()
    => _GetFPS();
  late final _GetFPSPtr = _lookup<NativeFunction<Int Function()>>('GetFPS');
  late final _GetFPS = _GetFPSPtr.asFunction<int Function()>();

  void SwapScreenBuffer()
    => _SwapScreenBuffer();
  late final _SwapScreenBufferPtr = _lookup<NativeFunction<Void Function()>>('SwapScreenBuffer');
  late final _SwapScreenBuffer = _SwapScreenBufferPtr.asFunction<void Function()>();

  void PollInputEvents()
    => _PollInputEvents();
  late final _PollInputEventsPtr = _lookup<NativeFunction<Void Function()>>('PollInputEvents');
  late final _PollInputEvents = _PollInputEventsPtr.asFunction<void Function()>();

  void WaitTime(double seconds)
    => _WaitTime(seconds);
  late final _WaitTimePtr = _lookup<NativeFunction<Void Function(Double)>>('WaitTime');
  late final _WaitTime = _WaitTimePtr.asFunction<void Function(double)>();

  void SetRandomSeed(int seed)
    => _SetRandomSeed(seed);
  late final _SetRandomSeedPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('SetRandomSeed');
  late final _SetRandomSeed = _SetRandomSeedPtr.asFunction<void Function(int)>();

  int GetRandomValue(int min, int max)
    => _GetRandomValue(min, max);
  late final _GetRandomValuePtr = _lookup<NativeFunction<Int Function(Int, Int)>>('GetRandomValue');
  late final _GetRandomValue = _GetRandomValuePtr.asFunction<int Function(int, int)>();

  Pointer<Int> LoadRandomSequence(int count, int min, int max)
    => _LoadRandomSequence(count, min, max);
  late final _LoadRandomSequencePtr = _lookup<NativeFunction<Pointer<Int> Function(UnsignedInt, Int, Int)>>('LoadRandomSequence');
  late final _LoadRandomSequence = _LoadRandomSequencePtr.asFunction<Pointer<Int> Function(int, int, int)>();

  void UnloadRandomSequence(Pointer<Int> sequence)
    => _UnloadRandomSequence(sequence);
  late final _UnloadRandomSequencePtr = _lookup<NativeFunction<Void Function(Pointer<Int>)>>('UnloadRandomSequence');
  late final _UnloadRandomSequence = _UnloadRandomSequencePtr.asFunction<void Function(Pointer<Int>)>();

  void TakeScreenshot(Pointer<Char> fileName)
    => _TakeScreenshot(fileName);
  late final _TakeScreenshotPtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('TakeScreenshot');
  late final _TakeScreenshot = _TakeScreenshotPtr.asFunction<void Function(Pointer<Char>)>();

  void SetConfigFlags(int flags)
    => _SetConfigFlags(flags);
  late final _SetConfigFlagsPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('SetConfigFlags');
  late final _SetConfigFlags = _SetConfigFlagsPtr.asFunction<void Function(int)>();

  void OpenURL(Pointer<Char> url)
    => _OpenURL(url);
  late final _OpenURLPtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('OpenURL');
  late final _OpenURL = _OpenURLPtr.asFunction<void Function(Pointer<Char>)>();

  void TraceLog(int logLevel, Pointer<Char> text)
    => _TraceLog(logLevel, text);
  late final _TraceLogPtr = _lookup<NativeFunction<Void Function(Int, Pointer<Char>)>>('TraceLog');
  late final _TraceLog = _TraceLogPtr.asFunction<void Function(int, Pointer<Char>)>();

  void SetTraceLogLevel(int logLevel)
    => _SetTraceLogLevel(logLevel);
  late final _SetTraceLogLevelPtr = _lookup<NativeFunction<Void Function(Int)>>('SetTraceLogLevel');
  late final _SetTraceLogLevel = _SetTraceLogLevelPtr.asFunction<void Function(int)>();

  // NOTE: va_list is unsolved computer science problem
  // void SetTraceLogCallback(TraceLogCallback callback)
  //   => _SetTraceLogCallback(callback);
  // late final _SetTraceLogCallbackPtr = _lookup<NativeFunction<Void Function(TraceLogCallback)>>('SetTraceLogCallback');
  // late final _SetTraceLogCallback = _SetTraceLogCallbackPtr.asFunction<void Function(TraceLogCallback)>();

  void SetLoadFileDataCallback(LoadFileDataCallbackC callback)
    => _SetLoadFileDataCallback(callback);
  late final _SetLoadFileDataCallbackPtr = _lookup<NativeFunction<Void Function(LoadFileDataCallbackC)>>('SetLoadFileDataCallback');
  late final _SetLoadFileDataCallback = _SetLoadFileDataCallbackPtr.asFunction<void Function(LoadFileDataCallbackC)>();

  void SetSaveFileDataCallback(SaveFileDataCallbackC callback)
    => _SetSaveFileDataCallback(callback);
  late final _SetSaveFileDataCallbackPtr = _lookup<NativeFunction<Void Function(SaveFileDataCallbackC)>>('SetSaveFileDataCallback');
  late final _SetSaveFileDataCallback = _SetSaveFileDataCallbackPtr.asFunction<void Function(SaveFileDataCallbackC)>();

  void SetLoadFileTextCallback(LoadFileTextCallbackC callback)
    => _SetLoadFileTextCallback(callback);
  late final _SetLoadFileTextCallbackPtr = _lookup<NativeFunction<Void Function(LoadFileTextCallbackC)>>('SetLoadFileTextCallback');
  late final _SetLoadFileTextCallback = _SetLoadFileTextCallbackPtr.asFunction<void Function(LoadFileTextCallbackC)>();

  void SetSaveFileTextCallback(SaveFileTextCallbackC callback)
    => _SetSaveFileTextCallback(callback);
  late final _SetSaveFileTextCallbackPtr = _lookup<NativeFunction<Void Function(SaveFileTextCallbackC)>>('SetSaveFileTextCallback');
  late final _SetSaveFileTextCallback = _SetSaveFileTextCallbackPtr.asFunction<void Function(SaveFileTextCallbackC)>();

  Pointer<UnsignedChar> LoadFileData(Pointer<Char> fileName, Pointer<Int> dataSize)
    => _LoadFileData(fileName, dataSize);
  late final _LoadFileDataPtr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(Pointer<Char>, Pointer<Int>)>>('LoadFileData');
  late final _LoadFileData = _LoadFileDataPtr.asFunction<Pointer<UnsignedChar> Function(Pointer<Char>, Pointer<Int>)>();

  void UnloadFileData(Pointer<UnsignedChar> data)
    => _UnloadFileData(data);
  late final _UnloadFileDataPtr = _lookup<NativeFunction<Void Function(Pointer<UnsignedChar>)>>('UnloadFileData');
  late final _UnloadFileData = _UnloadFileDataPtr.asFunction<void Function(Pointer<UnsignedChar>)>();

  bool SaveFileData(Pointer<Char> fileName, Pointer<Void> data, int dataSize)
    => _SaveFileData(fileName, data, dataSize);
  late final _SaveFileDataPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>, Pointer<Void>, Int)>>('SaveFileData');
  late final _SaveFileData = _SaveFileDataPtr.asFunction<bool Function(Pointer<Char>, Pointer<Void>, int)>();

  bool ExportDataAsCode(Pointer<UnsignedChar> data, int dataSize, Pointer<Char> fileName)
    => _ExportDataAsCode(data, dataSize, fileName);
  late final _ExportDataAsCodePtr = _lookup<NativeFunction<Bool Function(Pointer<UnsignedChar>, Int, Pointer<Char>)>>('ExportDataAsCode');
  late final _ExportDataAsCode = _ExportDataAsCodePtr.asFunction<bool Function(Pointer<UnsignedChar>, int, Pointer<Char>)>();

  Pointer<Char> LoadFileText(Pointer<Char> fileName)
    => _LoadFileText(fileName);
  late final _LoadFileTextPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('LoadFileText');
  late final _LoadFileText = _LoadFileTextPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  void UnloadFileText(Pointer<Char> text)
    => _UnloadFileText(text);
  late final _UnloadFileTextPtr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('UnloadFileText');
  late final _UnloadFileText = _UnloadFileTextPtr.asFunction<void Function(Pointer<Char>)>();

  bool SaveFileText(Pointer<Char> fileName, Pointer<Char> text)
    => _SaveFileText(fileName, text);
  late final _SaveFileTextPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>, Pointer<Char>)>>('SaveFileText');
  late final _SaveFileText = _SaveFileTextPtr.asFunction<bool Function(Pointer<Char>, Pointer<Char>)>();
    
  int FileRename(Pointer<Char> fileName, Pointer<Char> fileRename)
    => _FileRename(fileName, fileRename);
  late final _FileRenamePtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('FileRename');
  late final _FileRename = _FileRenamePtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  int FileRemove(Pointer<Char> fileName)
    => _FileRemove(fileName);
  late final _FileRemovePtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('FileRemove');
  late final _FileRemove = _FileRemovePtr.asFunction<int Function(Pointer<Char>)>();

  int FileCopy(Pointer<Char> srcPath, Pointer<Char> dstPath)
    => _FileCopy(srcPath, dstPath);
  late final _FileCopyPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('FileCopy');
  late final _FileCopy = _FileCopyPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  int FileMove(Pointer<Char> srcPath, Pointer<Char> dstPath)
    => _FileMove(srcPath, dstPath);
  late final _FileMovePtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('FileMove');
  late final _FileMove = _FileMovePtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  int FileTextReplace(Pointer<Char> fileName, Pointer<Char> search, Pointer<Char> replacement)
    => _FileTextReplace(fileName, search, replacement);
  late final _FileTextReplacePtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('FileTextReplace');
  late final _FileTextReplace = _FileTextReplacePtr.asFunction<int Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  int FileTextFindIndex(Pointer<Char> fileName, Pointer<Char> search)
    => _FileTextFindIndex(fileName, search);
  late final _FileTextFindIndexPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('FileTextFindIndex');
  late final _FileTextFindIndex = _FileTextFindIndexPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  bool FileExists(Pointer<Char> fileName)
    => _FileExists(fileName);
  late final _FileExistsPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('FileExists');
  late final _FileExists = _FileExistsPtr.asFunction<bool Function(Pointer<Char>)>();

  bool DirectoryExists(Pointer<Char> dirPath)
    => _DirectoryExists(dirPath);
  late final _DirectoryExistsPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('DirectoryExists');
  late final _DirectoryExists = _DirectoryExistsPtr.asFunction<bool Function(Pointer<Char>)>();

  bool IsFileExtension(Pointer<Char> fileName, Pointer<Char> ext)
    => _IsFileExtension(fileName, ext);
  late final _IsFileExtensionPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>, Pointer<Char>)>>('IsFileExtension');
  late final _IsFileExtension = _IsFileExtensionPtr.asFunction<bool Function(Pointer<Char>, Pointer<Char>)>();

  int GetFileLength(Pointer<Char> fileName)
    => _GetFileLength(fileName);
  late final _GetFileLengthPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('GetFileLength');
  late final _GetFileLength = _GetFileLengthPtr.asFunction<int Function(Pointer<Char>)>();

  Pointer<Char> GetFileExtension(Pointer<Char> fileName)
    => _GetFileExtension(fileName);
  late final _GetFileExtensionPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetFileExtension');
  late final _GetFileExtension = _GetFileExtensionPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> GetFileName(Pointer<Char> filePath)
    => _GetFileName(filePath);
  late final _GetFileNamePtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetFileName');
  late final _GetFileName = _GetFileNamePtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> GetFileNameWithoutExt(Pointer<Char> filePath)
    => _GetFileNameWithoutExt(filePath);
  late final _GetFileNameWithoutExtPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetFileNameWithoutExt');
  late final _GetFileNameWithoutExt = _GetFileNameWithoutExtPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  int GetDirectoryFileCount(Pointer<Char> dirPath)
    => _GetDirectoryFileCount(dirPath);
  late final _GetDirectoryFileCountPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Char>)>>('GetDirectoryFileCount');
  late final _GetDirectoryFileCount = _GetDirectoryFileCountPtr.asFunction<int Function(Pointer<Char>)>();

  int GetDirectoryFileCountEx(Pointer<Char> basePath, Pointer<Char> filter, bool scanSubdirs)
    => _GetDirectoryFileCountEx(basePath, filter, scanSubdirs);
  late final _GetDirectoryFileCountExPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Char>, Pointer<Char>, Bool)>>('GetDirectoryFileCountEx');
  late final _GetDirectoryFileCountEx = _GetDirectoryFileCountExPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>, bool)>();

  Pointer<Char> GetDirectoryPath(Pointer<Char> filePath)
    => _GetDirectoryPath(filePath);
  late final _GetDirectoryPathPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetDirectoryPath');
  late final _GetDirectoryPath = _GetDirectoryPathPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> GetPrevDirectoryPath(Pointer<Char> dirPath)
    => _GetPrevDirectoryPath(dirPath);
  late final _GetPrevDirectoryPathPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('GetPrevDirectoryPath');
  late final _GetPrevDirectoryPath = _GetPrevDirectoryPathPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> GetWorkingDirectory()
    => _GetWorkingDirectory();
  late final _GetWorkingDirectoryPtr = _lookup<NativeFunction<Pointer<Char> Function()>>('GetWorkingDirectory');
  late final _GetWorkingDirectory = _GetWorkingDirectoryPtr.asFunction<Pointer<Char> Function()>();

  Pointer<Char> GetApplicationDirectory()
    => _GetApplicationDirectory();
  late final _GetApplicationDirectoryPtr = _lookup<NativeFunction<Pointer<Char> Function()>>('GetApplicationDirectory');
  late final _GetApplicationDirectory = _GetApplicationDirectoryPtr.asFunction<Pointer<Char> Function()>();

  int MakeDirectory(Pointer<Char> dirPath)
    => _MakeDirectory(dirPath);
  late final _MakeDirectoryPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('MakeDirectory');
  late final _MakeDirectory = _MakeDirectoryPtr.asFunction<int Function(Pointer<Char>)>();

  bool ChangeDirectory(Pointer<Char> dir)
    => _ChangeDirectory(dir);
  late final _ChangeDirectoryPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('ChangeDirectory');
  late final _ChangeDirectory = _ChangeDirectoryPtr.asFunction<bool Function(Pointer<Char>)>();

  bool IsPathFile(Pointer<Char> path)
    => _IsPathFile(path);
  late final _IsPathFilePtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('IsPathFile');
  late final _IsPathFile = _IsPathFilePtr.asFunction<bool Function(Pointer<Char>)>();

  bool IsFileNameValid(Pointer<Char> fileName)
    => _IsFileNameValid(fileName);
  late final _IsFileNameValidPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>)>>('IsFileNameValid');
  late final _IsFileNameValid = _IsFileNameValidPtr.asFunction<bool Function(Pointer<Char>)>();

  FilePathListC LoadDirectoryFiles(Pointer<Char> dirPath)
    => _LoadDirectoryFiles(dirPath);
  late final _LoadDirectoryFilesPtr = _lookup<NativeFunction<FilePathListC Function(Pointer<Char>)>>('LoadDirectoryFiles');
  late final _LoadDirectoryFiles = _LoadDirectoryFilesPtr.asFunction<FilePathListC Function(Pointer<Char>)>();

  FilePathListC LoadDirectoryFilesEx(Pointer<Char> basePath, Pointer<Char> filter, bool scanSubdirs)
    => _LoadDirectoryFilesEx(basePath, filter, scanSubdirs);
  late final _LoadDirectoryFilesExPtr = _lookup<NativeFunction<FilePathListC Function(Pointer<Char>, Pointer<Char>, Bool)>>('LoadDirectoryFilesEx');
  late final _LoadDirectoryFilesEx = _LoadDirectoryFilesExPtr.asFunction<FilePathListC Function(Pointer<Char>, Pointer<Char>, bool)>();

  void UnloadDirectoryFiles(FilePathListC files)
    => _UnloadDirectoryFiles(files);
  late final _UnloadDirectoryFilesPtr = _lookup<NativeFunction<Void Function(FilePathListC)>>('UnloadDirectoryFiles');
  late final _UnloadDirectoryFiles = _UnloadDirectoryFilesPtr.asFunction<void Function(FilePathListC)>();

  bool IsFileDropped()
    => _IsFileDropped();
  late final _IsFileDroppedPtr = _lookup<NativeFunction<Bool Function()>>('IsFileDropped');
  late final _IsFileDropped = _IsFileDroppedPtr.asFunction<bool Function()>();

  FilePathListC LoadDroppedFiles()
    => _LoadDroppedFiles();
  late final _LoadDroppedFilesPtr = _lookup<NativeFunction<FilePathListC Function()>>('LoadDroppedFiles');
  late final _LoadDroppedFiles = _LoadDroppedFilesPtr.asFunction<FilePathListC Function()>();

  void UnloadDroppedFiles(FilePathListC files)
    => _UnloadDroppedFiles(files);
  late final _UnloadDroppedFilesPtr = _lookup<NativeFunction<Void Function(FilePathListC)>>('UnloadDroppedFiles');
  late final _UnloadDroppedFiles = _UnloadDroppedFilesPtr.asFunction<void Function(FilePathListC)>();

  int GetFileModTime(Pointer<Char> fileName)
    => _GetFileModTime(fileName);
  late final _GetFileModTimePtr = _lookup<NativeFunction<Long Function(Pointer<Char>)>>('GetFileModTime');
  late final _GetFileModTime = _GetFileModTimePtr.asFunction<int Function(Pointer<Char>)>();

  Pointer<UnsignedChar> CompressData(Pointer<UnsignedChar> data, int dataSize, Pointer<Int> compDataSize)
    => _CompressData(data, dataSize, compDataSize);
  late final _CompressDataPtr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(Pointer<UnsignedChar>, Int, Pointer<Int>)>>('CompressData');
  late final _CompressData = _CompressDataPtr.asFunction<Pointer<UnsignedChar> Function(Pointer<UnsignedChar>, int, Pointer<Int>)>();

  Pointer<UnsignedChar> DecompressData(Pointer<UnsignedChar> compData, int compDataSize, Pointer<Int> dataSize)
    => _DecompressData(compData, compDataSize, dataSize);
  late final _DecompressDataPtr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(Pointer<UnsignedChar>, Int, Pointer<Int>)>>('DecompressData');
  late final _DecompressData = _DecompressDataPtr.asFunction<Pointer<UnsignedChar> Function(Pointer<UnsignedChar>, int, Pointer<Int>)>();

  Pointer<Char> EncodeDataBase64(Pointer<UnsignedChar> data, int dataSize, Pointer<Int> outputSize)
    => _EncodeDataBase64(data, dataSize, outputSize);
  late final _EncodeDataBase64Ptr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<UnsignedChar>, Int, Pointer<Int>)>>('EncodeDataBase64');
  late final _EncodeDataBase64 = _EncodeDataBase64Ptr.asFunction<Pointer<Char> Function(Pointer<UnsignedChar>, int, Pointer<Int>)>();

  Pointer<UnsignedChar> DecodeDataBase64(Pointer<Char> data, Pointer<Int> outputSize)
    => _DecodeDataBase64(data, outputSize);
  late final _DecodeDataBase64Ptr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(Pointer<Char>, Pointer<Int>)>>('DecodeDataBase64');
  late final _DecodeDataBase64 = _DecodeDataBase64Ptr.asFunction<Pointer<UnsignedChar> Function(Pointer<Char>, Pointer<Int>)>();

  int ComputeCRC32(Pointer<UnsignedChar> data, int dataSize)
    => _ComputeCRC32(data, dataSize);
  late final _ComputeCRC32Ptr = _lookup<NativeFunction<UnsignedInt Function(Pointer<UnsignedChar>, Int)>>('ComputeCRC32');
  late final _ComputeCRC32 = _ComputeCRC32Ptr.asFunction<int Function(Pointer<UnsignedChar>, int)>();

  Pointer<UnsignedInt> ComputeMD5(Pointer<UnsignedChar> data, int dataSize)
    => _ComputeMD5(data, dataSize);
  late final _ComputeMD5Ptr = _lookup<NativeFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, Int)>>('ComputeMD5');
  late final _ComputeMD5 = _ComputeMD5Ptr.asFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, int)>();

  Pointer<UnsignedInt> ComputeSHA1(Pointer<UnsignedChar> data, int dataSize)
    => _ComputeSHA1(data, dataSize);
  late final _ComputeSHA1Ptr = _lookup<NativeFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, Int)>>('ComputeSHA1');
  late final _ComputeSHA1 = _ComputeSHA1Ptr.asFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, int)>();

  Pointer<UnsignedInt> ComputeSHA256(Pointer<UnsignedChar> data, int dataSize)
    => _ComputeSHA256(data, dataSize);
  late final _ComputeSHA256Ptr = _lookup<NativeFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, Int)>>('ComputeSHA256');
  late final _ComputeSHA256 = _ComputeSHA256Ptr.asFunction<Pointer<UnsignedInt> Function(Pointer<UnsignedChar>, int)>();

  AutomationEventListC LoadAutomationEventList(Pointer<Char> fileName)
    => _LoadAutomationEventList(fileName);
  late final _LoadAutomationEventListPtr = _lookup<NativeFunction<AutomationEventListC Function(Pointer<Char>)>>('LoadAutomationEventList');
  late final _LoadAutomationEventList = _LoadAutomationEventListPtr.asFunction<AutomationEventListC Function(Pointer<Char>)>();

  void UnloadAutomationEventList(AutomationEventListC list)
    => _UnloadAutomationEventList(list);
  late final _UnloadAutomationEventListPtr = _lookup<NativeFunction<Void Function(AutomationEventListC)>>('UnloadAutomationEventList');
  late final _UnloadAutomationEventList = _UnloadAutomationEventListPtr.asFunction<void Function(AutomationEventListC)>();

  bool ExportAutomationEventList(AutomationEventListC list, Pointer<Char> fileName)
    => _ExportAutomationEventList(list, fileName);
  late final _ExportAutomationEventListPtr = _lookup<NativeFunction<Bool Function(AutomationEventListC, Pointer<Char>)>>('ExportAutomationEventList');
  late final _ExportAutomationEventList = _ExportAutomationEventListPtr.asFunction<bool Function(AutomationEventListC, Pointer<Char>)>();

  void SetAutomationEventList(Pointer<AutomationEventListC> list)
    => _SetAutomationEventList(list);
  late final _SetAutomationEventListPtr = _lookup<NativeFunction<Void Function(Pointer<AutomationEventListC>)>>('SetAutomationEventList');
  late final _SetAutomationEventList = _SetAutomationEventListPtr.asFunction<void Function(Pointer<AutomationEventListC>)>();

  void SetAutomationEventBaseFrame(int frame)
    => _SetAutomationEventBaseFrame(frame);
  late final _SetAutomationEventBaseFramePtr = _lookup<NativeFunction<Void Function(Int)>>('SetAutomationEventBaseFrame');
  late final _SetAutomationEventBaseFrame = _SetAutomationEventBaseFramePtr.asFunction<void Function(int)>();

  void StartAutomationEventRecording()
    => _StartAutomationEventRecording();
  late final _StartAutomationEventRecordingPtr = _lookup<NativeFunction<Void Function()>>('StartAutomationEventRecording');
  late final _StartAutomationEventRecording = _StartAutomationEventRecordingPtr.asFunction<void Function()>();

  void StopAutomationEventRecording()
    => _StopAutomationEventRecording();
  late final _StopAutomationEventRecordingPtr = _lookup<NativeFunction<Void Function()>>('StopAutomationEventRecording');
  late final _StopAutomationEventRecording = _StopAutomationEventRecordingPtr.asFunction<void Function()>();

  void PlayAutomationEvent(AutomationEventC event)
    => _PlayAutomationEvent(event);
  late final _PlayAutomationEventPtr = _lookup<NativeFunction<Void Function(AutomationEventC)>>('PlayAutomationEvent');
  late final _PlayAutomationEvent = _PlayAutomationEventPtr.asFunction<void Function(AutomationEventC)>();

  bool IsKeyPressed(int key)
    => _IsKeyPressed(key);
  late final _IsKeyPressedPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyPressed');
  late final _IsKeyPressed = _IsKeyPressedPtr.asFunction<bool Function(int)>();

  bool IsKeyPressedRepeat(int key)
    => _IsKeyPressedRepeat(key);
  late final _IsKeyPressedRepeatPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyPressedRepeat');
  late final _IsKeyPressedRepeat = _IsKeyPressedRepeatPtr.asFunction<bool Function(int)>();

  bool IsKeyDown(int key)
    => _IsKeyDown(key);
  late final _IsKeyDownPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyDown');
  late final _IsKeyDown = _IsKeyDownPtr.asFunction<bool Function(int)>();

  bool IsKeyReleased(int key)
    => _IsKeyReleased(key);
  late final _IsKeyReleasedPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyReleased');
  late final _IsKeyReleased = _IsKeyReleasedPtr.asFunction<bool Function(int)>();

  bool IsKeyUp(int key)
    => _IsKeyUp(key);
  late final _IsKeyUpPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsKeyUp');
  late final _IsKeyUp = _IsKeyUpPtr.asFunction<bool Function(int)>();

  Pointer<Char> GetKeyName(int key)
    => _GetKeyName(key);
  late final _GetKeyNamePtr = _lookup<NativeFunction<Pointer<Char> Function(Int)>>('GetKeyName');
  late final _GetKeyName = _GetKeyNamePtr.asFunction<Pointer<Char> Function(int)>();

  int GetKeyPressed()
    => _GetKeyPressed();
  late final _GetKeyPressedPtr = _lookup<NativeFunction<Int Function()>>('GetKeyPressed');
  late final _GetKeyPressed = _GetKeyPressedPtr.asFunction<int Function()>();

  int GetCharPressed()
    => _GetCharPressed();
  late final _GetCharPressedPtr = _lookup<NativeFunction<Int Function()>>('GetCharPressed');
  late final _GetCharPressed = _GetCharPressedPtr.asFunction<int Function()>();

  void SetExitKey(int key)
    => _SetExitKey(key);
  late final _SetExitKeyPtr = _lookup<NativeFunction<Void Function(Int)>>('SetExitKey');
  late final _SetExitKey = _SetExitKeyPtr.asFunction<void Function(int)>();

  bool IsGamepadAvailable(int gamepad)
    => _IsGamepadAvailable(gamepad);
  late final _IsGamepadAvailablePtr = _lookup<NativeFunction<Bool Function(Int)>>('IsGamepadAvailable');
  late final _IsGamepadAvailable = _IsGamepadAvailablePtr.asFunction<bool Function(int)>();

  Pointer<Char> GetGamepadName(int gamepad)
    => _GetGamepadName(gamepad);
  late final _GetGamepadNamePtr = _lookup<NativeFunction<Pointer<Char> Function(Int)>>('GetGamepadName');
  late final _GetGamepadName = _GetGamepadNamePtr.asFunction<Pointer<Char> Function(int)>();

  bool IsGamepadButtonPressed(int gamepad, int button)
    => _IsGamepadButtonPressed(gamepad, button);
  late final _IsGamepadButtonPressedPtr = _lookup<NativeFunction<Bool Function(Int, Int)>>('IsGamepadButtonPressed');
  late final _IsGamepadButtonPressed = _IsGamepadButtonPressedPtr.asFunction<bool Function(int, int)>();

  bool IsGamepadButtonDown(int gamepad, int button)
    => _IsGamepadButtonDown(gamepad, button);
  late final _IsGamepadButtonDownPtr = _lookup<NativeFunction<Bool Function(Int, Int)>>('IsGamepadButtonDown');
  late final _IsGamepadButtonDown = _IsGamepadButtonDownPtr.asFunction<bool Function(int, int)>();

  bool IsGamepadButtonReleased(int gamepad, int button)
    => _IsGamepadButtonReleased(gamepad, button);
  late final _IsGamepadButtonReleasedPtr = _lookup<NativeFunction<Bool Function(Int, Int)>>('IsGamepadButtonReleased');
  late final _IsGamepadButtonReleased = _IsGamepadButtonReleasedPtr.asFunction<bool Function(int, int)>();

  bool IsGamepadButtonUp(int gamepad, int button)
    => _IsGamepadButtonUp(gamepad, button);
  late final _IsGamepadButtonUpPtr = _lookup<NativeFunction<Bool Function(Int, Int)>>('IsGamepadButtonUp');
  late final _IsGamepadButtonUp = _IsGamepadButtonUpPtr.asFunction<bool Function(int, int)>();

  int GetGamepadButtonPressed()
    => _GetGamepadButtonPressed();
  late final _GetGamepadButtonPressedPtr = _lookup<NativeFunction<Int Function()>>('GetGamepadButtonPressed');
  late final _GetGamepadButtonPressed = _GetGamepadButtonPressedPtr.asFunction<int Function()>();

  int GetGamepadAxisCount(int gamepad)
    => _GetGamepadAxisCount(gamepad);
  late final _GetGamepadAxisCountPtr = _lookup<NativeFunction<Int Function(Int)>>('GetGamepadAxisCount');
  late final _GetGamepadAxisCount = _GetGamepadAxisCountPtr.asFunction<int Function(int)>();

  double GetGamepadAxisMovement(int gamepad, int axis)
    => _GetGamepadAxisMovement(gamepad, axis);
  late final _GetGamepadAxisMovementPtr = _lookup<NativeFunction<Float Function(Int, Int)>>('GetGamepadAxisMovement');
  late final _GetGamepadAxisMovement = _GetGamepadAxisMovementPtr.asFunction<double Function(int, int)>();

  int SetGamepadMappings(Pointer<Char> mappings)
    => _SetGamepadMappings(mappings);
  late final _SetGamepadMappingsPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('SetGamepadMappings');
  late final _SetGamepadMappings = _SetGamepadMappingsPtr.asFunction<int Function(Pointer<Char>)>();

  void SetGamepadVibration(int gamepad, double leftMotor, double rightMotor, double duration)
    => _SetGamepadVibration(gamepad, leftMotor, rightMotor, duration);
  late final _SetGamepadVibrationPtr = _lookup<NativeFunction<Void Function(Int, Float, Float, Float)>>('SetGamepadVibration');
  late final _SetGamepadVibration = _SetGamepadVibrationPtr.asFunction<void Function(int, double, double, double)>();

  bool IsMouseButtonPressed(int button)
    => _IsMouseButtonPressed(button);
  late final _IsMouseButtonPressedPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsMouseButtonPressed');
  late final _IsMouseButtonPressed = _IsMouseButtonPressedPtr.asFunction<bool Function(int)>();

  bool IsMouseButtonDown(int button)
    => _IsMouseButtonDown(button);
  late final _IsMouseButtonDownPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsMouseButtonDown');
  late final _IsMouseButtonDown = _IsMouseButtonDownPtr.asFunction<bool Function(int)>();

  bool IsMouseButtonReleased(int button)
    => _IsMouseButtonReleased(button);
  late final _IsMouseButtonReleasedPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsMouseButtonReleased');
  late final _IsMouseButtonReleased = _IsMouseButtonReleasedPtr.asFunction<bool Function(int)>();

  bool IsMouseButtonUp(int button)
    => _IsMouseButtonUp(button);
  late final _IsMouseButtonUpPtr = _lookup<NativeFunction<Bool Function(Int)>>('IsMouseButtonUp');
  late final _IsMouseButtonUp = _IsMouseButtonUpPtr.asFunction<bool Function(int)>();

  int GetMouseX()
    => _GetMouseX();
  late final _GetMouseXPtr = _lookup<NativeFunction<Int Function()>>('GetMouseX');
  late final _GetMouseX = _GetMouseXPtr.asFunction<int Function()>();

  int GetMouseY()
    => _GetMouseY();
  late final _GetMouseYPtr = _lookup<NativeFunction<Int Function()>>('GetMouseY');
  late final _GetMouseY = _GetMouseYPtr.asFunction<int Function()>();

  Vector2C GetMousePosition()
    => _GetMousePosition();
  late final _GetMousePositionPtr = _lookup<NativeFunction<Vector2C Function()>>('GetMousePosition');
  late final _GetMousePosition = _GetMousePositionPtr.asFunction<Vector2C Function()>();

  Vector2C GetMouseDelta()
    => _GetMouseDelta();
  late final _GetMouseDeltaPtr = _lookup<NativeFunction<Vector2C Function()>>('GetMouseDelta');
  late final _GetMouseDelta = _GetMouseDeltaPtr.asFunction<Vector2C Function()>();

  void SetMousePosition(int x, int y)
    => _SetMousePosition(x, y);
  late final _SetMousePositionPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetMousePosition');
  late final _SetMousePosition = _SetMousePositionPtr.asFunction<void Function(int, int)>();

  void SetMouseOffset(int offsetX, int offsetY)
    => _SetMouseOffset(offsetX, offsetY);
  late final _SetMouseOffsetPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('SetMouseOffset');
  late final _SetMouseOffset = _SetMouseOffsetPtr.asFunction<void Function(int, int)>();

  void SetMouseScale(double scaleX, double scaleY)
    => _SetMouseScale(scaleX, scaleY);
  late final _SetMouseScalePtr = _lookup<NativeFunction<Void Function(Float, Float)>>('SetMouseScale');
  late final _SetMouseScale = _SetMouseScalePtr.asFunction<void Function(double, double)>();

  double GetMouseWheelMove()
    => _GetMouseWheelMove();
  late final _GetMouseWheelMovePtr = _lookup<NativeFunction<Float Function()>>('GetMouseWheelMove');
  late final _GetMouseWheelMove = _GetMouseWheelMovePtr.asFunction<double Function()>();

  Vector2C GetMouseWheelMoveV()
    => _GetMouseWheelMoveV();
  late final _GetMouseWheelMoveVPtr = _lookup<NativeFunction<Vector2C Function()>>('GetMouseWheelMoveV');
  late final _GetMouseWheelMoveV = _GetMouseWheelMoveVPtr.asFunction<Vector2C Function()>();

  void SetMouseCursor(int cursor)
    => _SetMouseCursor(cursor);
  late final _SetMouseCursorPtr = _lookup<NativeFunction<Void Function(Int)>>('SetMouseCursor');
  late final _SetMouseCursor = _SetMouseCursorPtr.asFunction<void Function(int)>();

  int GetTouchX()
    => _GetTouchX();
  late final _GetTouchXPtr = _lookup<NativeFunction<Int Function()>>('GetTouchX');
  late final _GetTouchX = _GetTouchXPtr.asFunction<int Function()>();

  int GetTouchY()
    => _GetTouchY();
  late final _GetTouchYPtr = _lookup<NativeFunction<Int Function()>>('GetTouchY');
  late final _GetTouchY = _GetTouchYPtr.asFunction<int Function()>();

  Vector2C GetTouchPosition(int index)
    => _GetTouchPosition(index);
  late final _GetTouchPositionPtr = _lookup<NativeFunction<Vector2C Function(Int)>>('GetTouchPosition');
  late final _GetTouchPosition = _GetTouchPositionPtr.asFunction<Vector2C Function(int)>();

  int GetTouchPointId(int index)
    => _GetTouchPointId(index);
  late final _GetTouchPointIdPtr = _lookup<NativeFunction<Int Function(Int)>>('GetTouchPointId');
  late final _GetTouchPointId = _GetTouchPointIdPtr.asFunction<int Function(int)>();

  int GetTouchPointCount()
    => _GetTouchPointCount();
  late final _GetTouchPointCountPtr = _lookup<NativeFunction<Int Function()>>('GetTouchPointCount');
  late final _GetTouchPointCount = _GetTouchPointCountPtr.asFunction<int Function()>();

  void SetGesturesEnabled(int flags)
    => _SetGesturesEnabled(flags);
  late final _SetGesturesEnabledPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('SetGesturesEnabled');
  late final _SetGesturesEnabled = _SetGesturesEnabledPtr.asFunction<void Function(int)>();

  bool IsGestureDetected(int gesture)
    => _IsGestureDetected(gesture);
  late final _IsGestureDetectedPtr = _lookup<NativeFunction<Bool Function(UnsignedInt)>>('IsGestureDetected');
  late final _IsGestureDetected = _IsGestureDetectedPtr.asFunction<bool Function(int)>();

  int GetGestureDetected()
    => _GetGestureDetected();
  late final _GetGestureDetectedPtr = _lookup<NativeFunction<Int Function()>>('GetGestureDetected');
  late final _GetGestureDetected = _GetGestureDetectedPtr.asFunction<int Function()>();

  double GetGestureHoldDuration()
    => _GetGestureHoldDuration();
  late final _GetGestureHoldDurationPtr = _lookup<NativeFunction<Float Function()>>('GetGestureHoldDuration');
  late final _GetGestureHoldDuration = _GetGestureHoldDurationPtr.asFunction<double Function()>();

  Vector2C GetGestureDragVector()
    => _GetGestureDragVector();
  late final _GetGestureDragVectorPtr = _lookup<NativeFunction<Vector2C Function()>>('GetGestureDragVector');
  late final _GetGestureDragVector = _GetGestureDragVectorPtr.asFunction<Vector2C Function()>();

  double GetGestureDragAngle()
    => _GetGestureDragAngle();
  late final _GetGestureDragAnglePtr = _lookup<NativeFunction<Float Function()>>('GetGestureDragAngle');
  late final _GetGestureDragAngle = _GetGestureDragAnglePtr.asFunction<double Function()>();

  Vector2C GetGesturePinchVector()
    => _GetGesturePinchVector();
  late final _GetGesturePinchVectorPtr = _lookup<NativeFunction<Vector2C Function()>>('GetGesturePinchVector');
  late final _GetGesturePinchVector = _GetGesturePinchVectorPtr.asFunction<Vector2C Function()>();

  double GetGesturePinchAngle()
    => _GetGesturePinchAngle();
  late final _GetGesturePinchAnglePtr = _lookup<NativeFunction<Float Function()>>('GetGesturePinchAngle');
  late final _GetGesturePinchAngle = _GetGesturePinchAnglePtr.asFunction<double Function()>();

  void ProcessGestureEvent(GestureEventC event)
    => _ProcessGestureEvent(event);
  late final _ProcessGestureEventPtr = _lookup<NativeFunction<Void Function(GestureEventC)>>('ProcessGestureEvent');
  late final _ProcessGestureEvent = _ProcessGestureEventPtr.asFunction<void Function(GestureEventC)>();

  void UpdateGestures()
    => _UpdateGestures();
  late final _UpdateGesturesPtr = _lookup<NativeFunction<Void Function()>>('UpdateGestures');
  late final _UpdateGestures = _UpdateGesturesPtr.asFunction<void Function()>();

  void UpdateCamera(Pointer<Camera3DC> camera, int mode)
    => _UpdateCamera(camera, mode);
  late final _UpdateCameraPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Int)>>('UpdateCamera');
  late final _UpdateCamera = _UpdateCameraPtr.asFunction<void Function(Pointer<Camera3DC>, int)>();

  void UpdateCameraPro(Pointer<Camera3DC> camera, Vector3C movement, Vector3C rotation, double zoom)
    => _UpdateCameraPro(camera, movement, rotation, zoom);
  late final _UpdateCameraProPtr = _lookup<NativeFunction<Void Function(Pointer<Camera3DC>, Vector3C, Vector3C, Float)>>('UpdateCameraPro');
  late final _UpdateCameraPro = _UpdateCameraProPtr.asFunction<void Function(Pointer<Camera3DC>, Vector3C, Vector3C, double)>();

  void SetShapesTexture(TextureC texture, RectangleC source)
    => _SetShapesTexture(texture, source);
  late final _SetShapesTexturePtr = _lookup<NativeFunction<Void Function(TextureC, RectangleC)>>('SetShapesTexture');
  late final _SetShapesTexture = _SetShapesTexturePtr.asFunction<void Function(TextureC, RectangleC)>();

  TextureC GetShapesTexture()
    => _GetShapesTexture();
  late final _GetShapesTexturePtr = _lookup<NativeFunction<TextureC Function()>>('GetShapesTexture');
  late final _GetShapesTexture = _GetShapesTexturePtr.asFunction<TextureC Function()>();

  RectangleC GetShapesTextureRectangle()
    => _GetShapesTextureRectangle();
  late final _GetShapesTextureRectanglePtr = _lookup<NativeFunction<RectangleC Function()>>('GetShapesTextureRectangle');
  late final _GetShapesTextureRectangle = _GetShapesTextureRectanglePtr.asFunction<RectangleC Function()>();

  void DrawPixel(int posX, int posY, ColorC color)
    => _DrawPixel(posX, posY, color);
  late final _DrawPixelPtr = _lookup<NativeFunction<Void Function(Int, Int, ColorC)>>('DrawPixel');
  late final _DrawPixel = _DrawPixelPtr.asFunction<void Function(int, int, ColorC)>();

  void DrawPixelV(Vector2C position, ColorC color)
    => _DrawPixelV(position, color);
  late final _DrawPixelVPtr = _lookup<NativeFunction<Void Function(Vector2C, ColorC)>>('DrawPixelV');
  late final _DrawPixelV = _DrawPixelVPtr.asFunction<void Function(Vector2C, ColorC)>();

  void DrawLine(int startPosX, int startPosY, int endPosX, int endPosY, ColorC color)
    => _DrawLine(startPosX, startPosY, endPosX, endPosY, color);
  late final _DrawLinePtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC)>>('DrawLine');
  late final _DrawLine = _DrawLinePtr.asFunction<void Function(int, int, int, int, ColorC)>();

  void DrawLineV(Vector2C startPos, Vector2C endPos, ColorC color)
    => _DrawLineV(startPos, endPos, color);
  late final _DrawLineVPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, ColorC)>>('DrawLineV');
  late final _DrawLineV = _DrawLineVPtr.asFunction<void Function(Vector2C, Vector2C, ColorC)>();

  void DrawLineEx(Vector2C startPos, Vector2C endPos, double thick, ColorC color)
    => _DrawLineEx(startPos, endPos, thick, color);
  late final _DrawLineExPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Float, ColorC)>>('DrawLineEx');
  late final _DrawLineEx = _DrawLineExPtr.asFunction<void Function(Vector2C, Vector2C, double, ColorC)>();

  void DrawLineStrip(Pointer<Vector2C> points, int pointCount, ColorC color)
    => _DrawLineStrip(points, pointCount, color);
  late final _DrawLineStripPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, ColorC)>>('DrawLineStrip');
  late final _DrawLineStrip = _DrawLineStripPtr.asFunction<void Function(Pointer<Vector2C>, int, ColorC)>();

  void DrawLineBezier(Vector2C startPos, Vector2C endPos, double thick, ColorC color)
    => _DrawLineBezier(startPos, endPos, thick, color);
  late final _DrawLineBezierPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Float, ColorC)>>('DrawLineBezier');
  late final _DrawLineBezier = _DrawLineBezierPtr.asFunction<void Function(Vector2C, Vector2C, double, ColorC)>();

  void DrawLineDashed(Vector2C startPos, Vector2C endPos, int dashSize, int spaceSize, ColorC color)
    => _DrawLineDashed(startPos, endPos, dashSize, spaceSize, color);
  late final _DrawLineDashedPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Int, Int, ColorC)>>('DrawLineDashed');
  late final _DrawLineDashed = _DrawLineDashedPtr.asFunction<void Function(Vector2C, Vector2C, int, int, ColorC)>();

  void DrawCircle(int centerX, int centerY, double radius, ColorC color)
    => _DrawCircle(centerX, centerY, radius, color);
  late final _DrawCirclePtr = _lookup<NativeFunction<Void Function(Int, Int, Float, ColorC)>>('DrawCircle');
  late final _DrawCircle = _DrawCirclePtr.asFunction<void Function(int, int, double, ColorC)>();

  void DrawCircleSector(Vector2C center, double radius, double startAngle, double endAngle, int segments, ColorC color)
    => _DrawCircleSector(center, radius, startAngle, endAngle, segments, color);
  late final _DrawCircleSectorPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, Float, Int, ColorC)>>('DrawCircleSector');
  late final _DrawCircleSector = _DrawCircleSectorPtr.asFunction<void Function(Vector2C, double, double, double, int, ColorC)>();

  void DrawCircleSectorLines(Vector2C center, double radius, double startAngle, double endAngle, int segments, ColorC color)
    => _DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color);
  late final _DrawCircleSectorLinesPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, Float, Int, ColorC)>>('DrawCircleSectorLines');
  late final _DrawCircleSectorLines = _DrawCircleSectorLinesPtr.asFunction<void Function(Vector2C, double, double, double, int, ColorC)>();

  void DrawCircleGradient(Vector2C center, double radius, ColorC inner, ColorC outer)
    => _DrawCircleGradient(center, radius, inner, outer);
  late final _DrawCircleGradientPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, ColorC, ColorC)>>('DrawCircleGradient');
  late final _DrawCircleGradient = _DrawCircleGradientPtr.asFunction<void Function(Vector2C, double, ColorC, ColorC)>();

  void DrawCircleV(Vector2C center, double radius, ColorC color)
    => _DrawCircleV(center, radius, color);
  late final _DrawCircleVPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, ColorC)>>('DrawCircleV');
  late final _DrawCircleV = _DrawCircleVPtr.asFunction<void Function(Vector2C, double, ColorC)>();

  void DrawCircleLines(int centerX, int centerY, double radius, ColorC color)
    => _DrawCircleLines(centerX, centerY, radius, color);
  late final _DrawCircleLinesPtr = _lookup<NativeFunction<Void Function(Int, Int, Float, ColorC)>>('DrawCircleLines');
  late final _DrawCircleLines = _DrawCircleLinesPtr.asFunction<void Function(int, int, double, ColorC)>();

  void DrawCircleLinesV(Vector2C center, double radius, ColorC color)
    => _DrawCircleLinesV(center, radius, color);
  late final _DrawCircleLinesVPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, ColorC)>>('DrawCircleLinesV');
  late final _DrawCircleLinesV = _DrawCircleLinesVPtr.asFunction<void Function(Vector2C, double, ColorC)>();

  void DrawEllipse(int centerX, int centerY, double radiusH, double radiusV, ColorC color)
    => _DrawEllipse(centerX, centerY, radiusH, radiusV, color);
  late final _DrawEllipsePtr = _lookup<NativeFunction<Void Function(Int, Int, Float, Float, ColorC)>>('DrawEllipse');
  late final _DrawEllipse = _DrawEllipsePtr.asFunction<void Function(int, int, double, double, ColorC)>();

  void DrawEllipseV(Vector2C center,double radiusH,double radiusV,ColorC color)
    => _DrawEllipseV(center, radiusH, radiusV, color);
  late final _DrawEllipseVPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, ColorC)>>('DrawEllipseV');
  late final _DrawEllipseV = _DrawEllipseVPtr.asFunction<void Function(Vector2C, double, double, ColorC)>();

  void DrawEllipseLines(int centerX, int centerY, double radiusH, double radiusV, ColorC color)
    => _DrawEllipseLines(centerX, centerY, radiusH, radiusV, color);
  late final _DrawEllipseLinesPtr = _lookup<NativeFunction<Void Function(Int, Int, Float, Float, ColorC)>>('DrawEllipseLines');
  late final _DrawEllipseLines = _DrawEllipseLinesPtr.asFunction<void Function(int, int, double, double, ColorC)>();

  void DrawEllipseLinesV(Vector2C center, double radiusH, double radiusV, ColorC color)
    => _DrawEllipseLinesV(center, radiusH, radiusV, color);
  late final _DrawEllipseLinesVPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, ColorC)>>('DrawEllipseLinesV');
  late final _DrawEllipseLinesV = _DrawEllipseLinesVPtr.asFunction<void Function(Vector2C, double, double, ColorC)>();

  void DrawRing(Vector2C center, double innerRadius, double outerRadius, double startAngle, double endAngle, int segments, ColorC color)
    => _DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);
  late final _DrawRingPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, Float, Float, Int, ColorC)>>('DrawRing');
  late final _DrawRing = _DrawRingPtr.asFunction<void Function(Vector2C, double, double, double, double, int, ColorC)>();

  void DrawRingLines(Vector2C center, double innerRadius, double outerRadius, double startAngle, double endAngle, int segments, ColorC color)
    => _DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);
  late final _DrawRingLinesPtr = _lookup<NativeFunction<Void Function(Vector2C, Float, Float, Float, Float, Int, ColorC)>>('DrawRingLines');
  late final _DrawRingLines = _DrawRingLinesPtr.asFunction<void Function(Vector2C, double, double, double, double, int, ColorC)>();

  void DrawRectangle(int posX, int posY, int width, int height, ColorC color)
    => _DrawRectangle(posX, posY, width, height, color);
  late final _DrawRectanglePtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC)>>('DrawRectangle');
  late final _DrawRectangle = _DrawRectanglePtr.asFunction<void Function(int, int, int, int, ColorC)>();

  void DrawRectangleV(Vector2C position, Vector2C size, ColorC color)
    => _DrawRectangleV(position, size, color);
  late final _DrawRectangleVPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, ColorC)>>('DrawRectangleV');
  late final _DrawRectangleV = _DrawRectangleVPtr.asFunction<void Function(Vector2C, Vector2C, ColorC)>();

  void DrawRectangleRec(RectangleC rec, ColorC color)
    => _DrawRectangleRec(rec, color);
  late final _DrawRectangleRecPtr = _lookup<NativeFunction<Void Function(RectangleC, ColorC)>>('DrawRectangleRec');
  late final _DrawRectangleRec = _DrawRectangleRecPtr.asFunction<void Function(RectangleC, ColorC)>();

  void DrawRectanglePro(RectangleC rec, Vector2C origin, double rotation, ColorC color)
    => _DrawRectanglePro(rec, origin, rotation, color);
  late final _DrawRectangleProPtr = _lookup<NativeFunction<Void Function(RectangleC, Vector2C, Float, ColorC)>>('DrawRectanglePro');
  late final _DrawRectanglePro = _DrawRectangleProPtr.asFunction<void Function(RectangleC, Vector2C, double, ColorC)>();

  void DrawRectangleGradientV(int posX, int posY, int width, int height, ColorC top, ColorC bottom)
    => _DrawRectangleGradientV(posX, posY, width, height, top, bottom);
  late final _DrawRectangleGradientVPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC, ColorC)>>('DrawRectangleGradientV');
  late final _DrawRectangleGradientV = _DrawRectangleGradientVPtr.asFunction<void Function(int, int, int, int, ColorC, ColorC)>();

  void DrawRectangleGradientH(int posX, int posY, int width, int height, ColorC left, ColorC right)
    => _DrawRectangleGradientH(posX, posY, width, height, left, right);
  late final _DrawRectangleGradientHPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC, ColorC)>>('DrawRectangleGradientH');
  late final _DrawRectangleGradientH = _DrawRectangleGradientHPtr.asFunction<void Function(int, int, int, int, ColorC, ColorC)>();

  void DrawRectangleGradientEx(RectangleC rec, ColorC topLeft, ColorC bottomLeft, ColorC topRight, ColorC bottomRight)
    => _DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight);
  late final _DrawRectangleGradientExPtr = _lookup<NativeFunction<Void Function(RectangleC, ColorC, ColorC, ColorC, ColorC)>>('DrawRectangleGradientEx');
  late final _DrawRectangleGradientEx = _DrawRectangleGradientExPtr.asFunction<void Function(RectangleC, ColorC, ColorC, ColorC, ColorC)>();

  void DrawRectangleLines(int posX, int posY, int width, int height, ColorC color)
    => _DrawRectangleLines(posX, posY, width, height, color);
  late final _DrawRectangleLinesPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, ColorC)>>('DrawRectangleLines');
  late final _DrawRectangleLines = _DrawRectangleLinesPtr.asFunction<void Function(int, int, int, int, ColorC)>();

  void DrawRectangleLinesEx(RectangleC rec, double lineThick, ColorC color)
    => _DrawRectangleLinesEx(rec, lineThick, color);
  late final _DrawRectangleLinesExPtr = _lookup<NativeFunction<Void Function(RectangleC, Float, ColorC)>>('DrawRectangleLinesEx');
  late final _DrawRectangleLinesEx = _DrawRectangleLinesExPtr.asFunction<void Function(RectangleC, double, ColorC)>();

  void DrawRectangleRounded(RectangleC rec, double roundness, int segments, ColorC color)
    => _DrawRectangleRounded(rec, roundness, segments, color);
  late final _DrawRectangleRoundedPtr = _lookup<NativeFunction<Void Function(RectangleC, Float, Int, ColorC)>>('DrawRectangleRounded');
  late final _DrawRectangleRounded = _DrawRectangleRoundedPtr.asFunction<void Function(RectangleC, double, int, ColorC)>();

  void DrawRectangleRoundedLines(RectangleC rec, double roundness, int segments, ColorC color)
    => _DrawRectangleRoundedLines(rec, roundness, segments, color);
  late final _DrawRectangleRoundedLinesPtr = _lookup<NativeFunction<Void Function(RectangleC, Float, Int, ColorC)>>('DrawRectangleRoundedLines');
  late final _DrawRectangleRoundedLines = _DrawRectangleRoundedLinesPtr.asFunction<void Function(RectangleC, double, int, ColorC)>();

  void DrawRectangleRoundedLinesEx(RectangleC rec, double roundness, int segments, double lineThick, ColorC color)
    => _DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color);
  late final _DrawRectangleRoundedLinesExPtr = _lookup<NativeFunction<Void Function(RectangleC, Float, Int, Float, ColorC)>>('DrawRectangleRoundedLinesEx');
  late final _DrawRectangleRoundedLinesEx = _DrawRectangleRoundedLinesExPtr.asFunction<void Function(RectangleC, double, int, double, ColorC)>();

  void DrawTriangle(Vector2C v1, Vector2C v2, Vector2C v3, ColorC color)
    => _DrawTriangle(v1, v2, v3, color);
  late final _DrawTrianglePtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, ColorC)>>('DrawTriangle');
  late final _DrawTriangle = _DrawTrianglePtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, ColorC)>();

  void DrawTriangleLines(Vector2C v1, Vector2C v2, Vector2C v3, ColorC color)
    => _DrawTriangleLines(v1, v2, v3, color);
  late final _DrawTriangleLinesPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, ColorC)>>('DrawTriangleLines');
  late final _DrawTriangleLines = _DrawTriangleLinesPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, ColorC)>();

  void DrawTriangleFan(Pointer<Vector2C> points, int pointCount, ColorC color)
    => _DrawTriangleFan(points, pointCount, color);
  late final _DrawTriangleFanPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, ColorC)>>('DrawTriangleFan');
  late final _DrawTriangleFan = _DrawTriangleFanPtr.asFunction<void Function(Pointer<Vector2C>, int, ColorC)>();

  void DrawTriangleStrip(Pointer<Vector2C> points, int pointCount, ColorC color)
    => _DrawTriangleStrip(points, pointCount, color);
  late final _DrawTriangleStripPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, ColorC)>>('DrawTriangleStrip');
  late final _DrawTriangleStrip = _DrawTriangleStripPtr.asFunction<void Function(Pointer<Vector2C>, int, ColorC)>();

  void DrawPoly(Vector2C center, int sides, double radius, double rotation, ColorC color)
    => _DrawPoly(center, sides, radius, rotation, color);
  late final _DrawPolyPtr = _lookup<NativeFunction<Void Function(Vector2C, Int, Float, Float, ColorC)>>('DrawPoly');
  late final _DrawPoly = _DrawPolyPtr.asFunction<void Function(Vector2C, int, double, double, ColorC)>();

  void DrawPolyLines(Vector2C center, int sides, double radius, double rotation, ColorC color)
    => _DrawPolyLines(center, sides, radius, rotation, color);
  late final _DrawPolyLinesPtr = _lookup<NativeFunction<Void Function(Vector2C, Int, Float, Float, ColorC)>>('DrawPolyLines');
  late final _DrawPolyLines = _DrawPolyLinesPtr.asFunction<void Function(Vector2C, int, double, double, ColorC)>();

  void DrawPolyLinesEx(Vector2C center, int sides, double radius, double rotation, double lineThick, ColorC color)
    => _DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color);
  late final _DrawPolyLinesExPtr = _lookup<NativeFunction<Void Function(Vector2C, Int, Float, Float, Float, ColorC)>>('DrawPolyLinesEx');
  late final _DrawPolyLinesEx = _DrawPolyLinesExPtr.asFunction<void Function(Vector2C, int, double, double, double, ColorC)>();

  void DrawSplineLinear(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineLinear(points, pointCount, thick, color);
  late final _DrawSplineLinearPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineLinear');
  late final _DrawSplineLinear = _DrawSplineLinearPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  void DrawSplineBasis(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineBasis(points, pointCount, thick, color);
  late final _DrawSplineBasisPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineBasis');
  late final _DrawSplineBasis = _DrawSplineBasisPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  void DrawSplineCatmullRom(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineCatmullRom(points, pointCount, thick, color);
  late final _DrawSplineCatmullRomPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineCatmullRom');
  late final _DrawSplineCatmullRom = _DrawSplineCatmullRomPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  void DrawSplineBezierQuadratic(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineBezierQuadratic(points, pointCount, thick, color);
  late final _DrawSplineBezierQuadraticPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineBezierQuadratic');
  late final _DrawSplineBezierQuadratic = _DrawSplineBezierQuadraticPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  void DrawSplineBezierCubic(Pointer<Vector2C> points, int pointCount, double thick, ColorC color)
    => _DrawSplineBezierCubic(points, pointCount, thick, color);
  late final _DrawSplineBezierCubicPtr = _lookup<NativeFunction<Void Function(Pointer<Vector2C>, Int, Float, ColorC)>>('DrawSplineBezierCubic');
  late final _DrawSplineBezierCubic = _DrawSplineBezierCubicPtr.asFunction<void Function(Pointer<Vector2C>, int, double, ColorC)>();

  void DrawSplineSegmentLinear(Vector2C p1, Vector2C p2, double thick, ColorC color)
    => _DrawSplineSegmentLinear(p1, p2, thick, color);
  late final _DrawSplineSegmentLinearPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentLinear');
  late final _DrawSplineSegmentLinear = _DrawSplineSegmentLinearPtr.asFunction<void Function(Vector2C, Vector2C, double, ColorC)>();

  void DrawSplineSegmentBasis(Vector2C p1, Vector2C p2, Vector2C p3, Vector2C p4, double thick, ColorC color)
    => _DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color);
  late final _DrawSplineSegmentBasisPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentBasis');
  late final _DrawSplineSegmentBasis = _DrawSplineSegmentBasisPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, Vector2C, double, ColorC)>();

  void DrawSplineSegmentCatmullRom(Vector2C p1, Vector2C p2, Vector2C p3, Vector2C p4, double thick, ColorC color)
    => _DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color);
  late final _DrawSplineSegmentCatmullRomPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentCatmullRom');
  late final _DrawSplineSegmentCatmullRom = _DrawSplineSegmentCatmullRomPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, Vector2C, double, ColorC)>();

  void DrawSplineSegmentBezierQuadratic(Vector2C p1, Vector2C c2, Vector2C p3, double thick, ColorC color)
    => _DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color);
  late final _DrawSplineSegmentBezierQuadraticPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentBezierQuadratic');
  late final _DrawSplineSegmentBezierQuadratic = _DrawSplineSegmentBezierQuadraticPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, double, ColorC)>();

  void DrawSplineSegmentBezierCubic(Vector2C p1, Vector2C c2, Vector2C c3, Vector2C p4, double thick, ColorC color)
    => _DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color);
  late final _DrawSplineSegmentBezierCubicPtr = _lookup<NativeFunction<Void Function(Vector2C, Vector2C, Vector2C, Vector2C, Float, ColorC)>>('DrawSplineSegmentBezierCubic');
  late final _DrawSplineSegmentBezierCubic = _DrawSplineSegmentBezierCubicPtr.asFunction<void Function(Vector2C, Vector2C, Vector2C, Vector2C, double, ColorC)>();

  Vector2C GetSplinePointLinear(Vector2C startPos, Vector2C endPos, double t)
    => _GetSplinePointLinear(startPos, endPos, t);
  late final _GetSplinePointLinearPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Float)>>('GetSplinePointLinear');
  late final _GetSplinePointLinear = _GetSplinePointLinearPtr.asFunction<Vector2C Function(Vector2C, Vector2C, double)>();

  Vector2C GetSplinePointBasis(Vector2C p1, Vector2C p2, Vector2C p3, Vector2C p4, double t)
    => _GetSplinePointBasis(p1, p2, p3, p4, t);
  late final _GetSplinePointBasisPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, Float)>>('GetSplinePointBasis');
  late final _GetSplinePointBasis = _GetSplinePointBasisPtr.asFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, double)>();

  Vector2C GetSplinePointCatmullRom(Vector2C p1, Vector2C p2, Vector2C p3, Vector2C p4, double t)
    => _GetSplinePointCatmullRom(p1, p2, p3, p4, t);
  late final _GetSplinePointCatmullRomPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, Float)>>('GetSplinePointCatmullRom');
  late final _GetSplinePointCatmullRom = _GetSplinePointCatmullRomPtr.asFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, double)>();

  Vector2C GetSplinePointBezierQuad(Vector2C p1, Vector2C c2, Vector2C p3, double t)
    => _GetSplinePointBezierQuad(p1, c2, p3, t);
  late final _GetSplinePointBezierQuadPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Float)>>('GetSplinePointBezierQuad');
  late final _GetSplinePointBezierQuad = _GetSplinePointBezierQuadPtr.asFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, double)>();

  Vector2C GetSplinePointBezierCubic(Vector2C p1, Vector2C c2, Vector2C c3, Vector2C p4, double t)
    => _GetSplinePointBezierCubic(p1, c2, c3, p4, t);
  late final _GetSplinePointBezierCubicPtr = _lookup<NativeFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, Float)>>('GetSplinePointBezierCubic');
  late final _GetSplinePointBezierCubic = _GetSplinePointBezierCubicPtr.asFunction<Vector2C Function(Vector2C, Vector2C, Vector2C, Vector2C, double)>();

  bool CheckCollisionRecs(RectangleC rec1, RectangleC rec2)
    => _CheckCollisionRecs(rec1, rec2);
  late final _CheckCollisionRecsPtr = _lookup<NativeFunction<Bool Function(RectangleC, RectangleC)>>('CheckCollisionRecs');
  late final _CheckCollisionRecs = _CheckCollisionRecsPtr.asFunction<bool Function(RectangleC, RectangleC)>();

  bool CheckCollisionCircles(Vector2C center1, double radius1, Vector2C center2, double radius2)
    => _CheckCollisionCircles(center1, radius1, center2, radius2);
  late final _CheckCollisionCirclesPtr = _lookup<NativeFunction<Bool Function(Vector2C, Float, Vector2C, Float)>>('CheckCollisionCircles');
  late final _CheckCollisionCircles = _CheckCollisionCirclesPtr.asFunction<bool Function(Vector2C, double, Vector2C, double)>();

  bool CheckCollisionCircleRec(Vector2C center, double radius, RectangleC rec)
    => _CheckCollisionCircleRec(center, radius, rec);
  late final _CheckCollisionCircleRecPtr = _lookup<NativeFunction<Bool Function(Vector2C, Float, RectangleC)>>('CheckCollisionCircleRec');
  late final _CheckCollisionCircleRec = _CheckCollisionCircleRecPtr.asFunction<bool Function(Vector2C, double, RectangleC)>();

  bool CheckCollisionCircleLine(Vector2C center, double radius, Vector2C p1, Vector2C p2)
    => _CheckCollisionCircleLine(center, radius, p1, p2);
  late final _CheckCollisionCircleLinePtr = _lookup<NativeFunction<Bool Function(Vector2C, Float, Vector2C, Vector2C)>>('CheckCollisionCircleLine');
  late final _CheckCollisionCircleLine = _CheckCollisionCircleLinePtr.asFunction<bool Function(Vector2C, double, Vector2C, Vector2C)>();

  bool CheckCollisionPointRec(Vector2C point, RectangleC rec)
    => _CheckCollisionPointRec(point, rec);
  late final _CheckCollisionPointRecPtr = _lookup<NativeFunction<Bool Function(Vector2C, RectangleC)>>('CheckCollisionPointRec');
  late final _CheckCollisionPointRec = _CheckCollisionPointRecPtr.asFunction<bool Function(Vector2C, RectangleC)>();

  bool CheckCollisionPointCircle(Vector2C point, Vector2C center, double radius)
    => _CheckCollisionPointCircle(point, center, radius);
  late final _CheckCollisionPointCirclePtr = _lookup<NativeFunction<Bool Function(Vector2C, Vector2C, Float)>>('CheckCollisionPointCircle');
  late final _CheckCollisionPointCircle = _CheckCollisionPointCirclePtr.asFunction<bool Function(Vector2C, Vector2C, double)>();

  bool CheckCollisionPointTriangle(Vector2C point, Vector2C p1, Vector2C p2, Vector2C p3)
    => _CheckCollisionPointTriangle(point, p1, p2, p3);
  late final _CheckCollisionPointTrianglePtr = _lookup<NativeFunction<Bool Function(Vector2C, Vector2C, Vector2C, Vector2C)>>('CheckCollisionPointTriangle');
  late final _CheckCollisionPointTriangle = _CheckCollisionPointTrianglePtr.asFunction<bool Function(Vector2C, Vector2C, Vector2C, Vector2C)>();

  bool CheckCollisionPointLine(Vector2C point, Vector2C p1, Vector2C p2, int threshold)
    => _CheckCollisionPointLine(point, p1, p2, threshold);
  late final _CheckCollisionPointLinePtr = _lookup<NativeFunction<Bool Function(Vector2C, Vector2C, Vector2C, Int)>>('CheckCollisionPointLine');
  late final _CheckCollisionPointLine = _CheckCollisionPointLinePtr.asFunction<bool Function(Vector2C, Vector2C, Vector2C, int)>();

  bool CheckCollisionPointPoly(Vector2C point, Pointer<Vector2C> points, int pointCount)
    => _CheckCollisionPointPoly(point, points, pointCount);
  late final _CheckCollisionPointPolyPtr = _lookup<NativeFunction<Bool Function(Vector2C, Pointer<Vector2C>, Int)>>('CheckCollisionPointPoly');
  late final _CheckCollisionPointPoly = _CheckCollisionPointPolyPtr.asFunction<bool Function(Vector2C, Pointer<Vector2C>, int)>();

  bool CheckCollisionLines(Vector2C startPos1, Vector2C endPos1, Vector2C startPos2, Vector2C endPos2, Pointer<Vector2C> collisionPoint)
    => _CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint);
  late final _CheckCollisionLinesPtr = _lookup<NativeFunction<Bool Function(Vector2C, Vector2C, Vector2C, Vector2C, Pointer<Vector2C>)>>('CheckCollisionLines');
  late final _CheckCollisionLines = _CheckCollisionLinesPtr.asFunction<bool Function(Vector2C, Vector2C, Vector2C, Vector2C, Pointer<Vector2C>)>();

  RectangleC GetCollisionRec(RectangleC rec1, RectangleC rec2)
    => _GetCollisionRec(rec1, rec2);
  late final _GetCollisionRecPtr = _lookup<NativeFunction<RectangleC Function(RectangleC, RectangleC)>>('GetCollisionRec');
  late final _GetCollisionRec = _GetCollisionRecPtr.asFunction<RectangleC Function(RectangleC, RectangleC)>();

  ImageC LoadImage(Pointer<Char> fileName)
    => _LoadImage(fileName);
  late final _LoadImagePtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>)>>('LoadImage');
  late final _LoadImage = _LoadImagePtr.asFunction<ImageC Function(Pointer<Char>)>();

  ImageC LoadImageRaw(Pointer<Char> fileName, int width, int height, int format, int headerSize)
    => _LoadImageRaw(fileName, width, height, format, headerSize);
  late final _LoadImageRawPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Int, Int, Int, Int)>>('LoadImageRaw');
  late final _LoadImageRaw = _LoadImageRawPtr.asFunction<ImageC Function(Pointer<Char>, int, int, int, int)>();

  ImageC LoadImageAnim(Pointer<Char> fileName, Pointer<Int> frames)
    => _LoadImageAnim(fileName, frames);
  late final _LoadImageAnimPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Pointer<Int>)>>('LoadImageAnim');
  late final _LoadImageAnim = _LoadImageAnimPtr.asFunction<ImageC Function(Pointer<Char>, Pointer<Int>)>();

  ImageC LoadImageAnimFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> fileData, int dataSize, Pointer<Int> frames)
    => _LoadImageAnimFromMemory(fileType, fileData, dataSize, frames);
  late final _LoadImageAnimFromMemoryPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Pointer<UnsignedChar>, Int, Pointer<Int>)>>('LoadImageAnimFromMemory');
  late final _LoadImageAnimFromMemory = _LoadImageAnimFromMemoryPtr.asFunction<ImageC Function(Pointer<Char>, Pointer<UnsignedChar>, int, Pointer<Int>)>();

  ImageC LoadImageFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> fileData, int dataSize)
    => _LoadImageFromMemory(fileType, fileData, dataSize);
  late final _LoadImageFromMemoryPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Pointer<UnsignedChar>, Int)>>('LoadImageFromMemory');
  late final _LoadImageFromMemory = _LoadImageFromMemoryPtr.asFunction<ImageC Function(Pointer<Char>, Pointer<UnsignedChar>, int)>();

  ImageC LoadImageFromTexture(TextureC texture)
    => _LoadImageFromTexture(texture);
  late final _LoadImageFromTexturePtr = _lookup<NativeFunction<ImageC Function(TextureC)>>('LoadImageFromTexture');
  late final _LoadImageFromTexture = _LoadImageFromTexturePtr.asFunction<ImageC Function(TextureC)>();

  ImageC LoadImageFromScreen()
    => _LoadImageFromScreen();
  late final _LoadImageFromScreenPtr = _lookup<NativeFunction<ImageC Function()>>('LoadImageFromScreen');
  late final _LoadImageFromScreen = _LoadImageFromScreenPtr.asFunction<ImageC Function()>();

  bool IsImageValid(ImageC image)
    => _IsImageValid(image);
  late final _IsImageValidPtr = _lookup<NativeFunction<Bool Function(ImageC)>>('IsImageValid');
  late final _IsImageValid = _IsImageValidPtr.asFunction<bool Function(ImageC)>();

  void UnloadImage(ImageC image)
    => _UnloadImage(image);
  late final _UnloadImagePtr = _lookup<NativeFunction<Void Function(ImageC)>>('UnloadImage');
  late final _UnloadImage = _UnloadImagePtr.asFunction<void Function(ImageC)>();

  bool ExportImage(ImageC image, Pointer<Char> fileName)
    => _ExportImage(image, fileName);
  late final _ExportImagePtr = _lookup<NativeFunction<Bool Function(ImageC, Pointer<Char>)>>('ExportImage');
  late final _ExportImage = _ExportImagePtr.asFunction<bool Function(ImageC, Pointer<Char>)>();

  Pointer<UnsignedChar> ExportImageToMemory(ImageC image, Pointer<Char> fileType, Pointer<Int> fileSize)
    => _ExportImageToMemory(image, fileType, fileSize);
  late final _ExportImageToMemoryPtr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(ImageC, Pointer<Char>, Pointer<Int>)>>('ExportImageToMemory');
  late final _ExportImageToMemory = _ExportImageToMemoryPtr.asFunction<Pointer<UnsignedChar> Function(ImageC, Pointer<Char>, Pointer<Int>)>();

  bool ExportImageAsCode(ImageC image, Pointer<Char> fileName)
    => _ExportImageAsCode(image, fileName);
  late final _ExportImageAsCodePtr = _lookup<NativeFunction<Bool Function(ImageC, Pointer<Char>)>>('ExportImageAsCode');
  late final _ExportImageAsCode = _ExportImageAsCodePtr.asFunction<bool Function(ImageC, Pointer<Char>)>();

  ImageC GenImageColor(int width, int height, ColorC color)
    => _GenImageColor(width, height, color);
  late final _GenImageColorPtr = _lookup<NativeFunction<ImageC Function(Int, Int, ColorC)>>('GenImageColor');
  late final _GenImageColor = _GenImageColorPtr.asFunction<ImageC Function(int, int, ColorC)>();

  ImageC GenImageGradientLinear(int width, int height, int direction, ColorC start, ColorC end)
    => _GenImageGradientLinear(width, height, direction, start, end);
  late final _GenImageGradientLinearPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Int, ColorC, ColorC)>>('GenImageGradientLinear');
  late final _GenImageGradientLinear = _GenImageGradientLinearPtr.asFunction<ImageC Function(int, int, int, ColorC, ColorC)>();

  ImageC GenImageGradientRadial(int width, int height, double density, ColorC inner, ColorC outer)
    => _GenImageGradientRadial(width, height, density, inner, outer);
  late final _GenImageGradientRadialPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Float, ColorC, ColorC)>>('GenImageGradientRadial');
  late final _GenImageGradientRadial = _GenImageGradientRadialPtr.asFunction<ImageC Function(int, int, double, ColorC, ColorC)>();

  ImageC GenImageGradientSquare(int width, int height, double density, ColorC inner, ColorC outer)
    => _GenImageGradientSquare(width, height, density, inner, outer);
  late final _GenImageGradientSquarePtr = _lookup<NativeFunction<ImageC Function(Int, Int, Float, ColorC, ColorC)>>('GenImageGradientSquare');
  late final _GenImageGradientSquare = _GenImageGradientSquarePtr.asFunction<ImageC Function(int, int, double, ColorC, ColorC)>();

  ImageC GenImageChecked(int width, int height, int checksX, int checksY, ColorC col1, ColorC col2)
    => _GenImageChecked(width, height, checksX, checksY, col1, col2);
  late final _GenImageCheckedPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Int, Int, ColorC, ColorC)>>('GenImageChecked');
  late final _GenImageChecked = _GenImageCheckedPtr.asFunction<ImageC Function(int, int, int, int, ColorC, ColorC)>();

  ImageC GenImageWhiteNoise(int width, int height, double factor)
    => _GenImageWhiteNoise(width, height, factor);
  late final _GenImageWhiteNoisePtr = _lookup<NativeFunction<ImageC Function(Int, Int, Float)>>('GenImageWhiteNoise');
  late final _GenImageWhiteNoise = _GenImageWhiteNoisePtr.asFunction<ImageC Function(int, int, double)>();

  ImageC GenImagePerlinNoise(int width, int height, int offsetX, int offsetY, double scale)
    => _GenImagePerlinNoise(width, height, offsetX, offsetY, scale);
  late final _GenImagePerlinNoisePtr = _lookup<NativeFunction<ImageC Function(Int, Int, Int, Int, Float)>>('GenImagePerlinNoise');
  late final _GenImagePerlinNoise = _GenImagePerlinNoisePtr.asFunction<ImageC Function(int, int, int, int, double)>();

  ImageC GenImageCellular(int width, int height, int tileSize)
    => _GenImageCellular(width, height, tileSize);
  late final _GenImageCellularPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Int)>>('GenImageCellular');
  late final _GenImageCellular = _GenImageCellularPtr.asFunction<ImageC Function(int, int, int)>();

  ImageC GenImageText(int width, int height, Pointer<Char> text)
    => _GenImageText(width, height, text);
  late final _GenImageTextPtr = _lookup<NativeFunction<ImageC Function(Int, Int, Pointer<Char>)>>('GenImageText');
  late final _GenImageText = _GenImageTextPtr.asFunction<ImageC Function(int, int, Pointer<Char>)>();

  ImageC ImageCopy(ImageC image)
    => _ImageCopy(image);
  late final _ImageCopyPtr = _lookup<NativeFunction<ImageC Function(ImageC)>>('ImageCopy');
  late final _ImageCopy = _ImageCopyPtr.asFunction<ImageC Function(ImageC)>();

  ImageC ImageFromImage(ImageC image, RectangleC rec)
    => _ImageFromImage(image, rec);
  late final _ImageFromImagePtr = _lookup<NativeFunction<ImageC Function(ImageC, RectangleC)>>('ImageFromImage');
  late final _ImageFromImage = _ImageFromImagePtr.asFunction<ImageC Function(ImageC, RectangleC)>();

  ImageC ImageFromChannel(ImageC image, int selectedChannel)
    => _ImageFromChannel(image, selectedChannel);
  late final _ImageFromChannelPtr = _lookup<NativeFunction<ImageC Function(ImageC, Int)>>('ImageFromChannel');
  late final _ImageFromChannel = _ImageFromChannelPtr.asFunction<ImageC Function(ImageC, int)>();

  ImageC ImageText(Pointer<Char> text, int fontSize, ColorC color)
    => _ImageText(text, fontSize, color);
  late final _ImageTextPtr = _lookup<NativeFunction<ImageC Function(Pointer<Char>, Int, ColorC)>>('ImageText');
  late final _ImageText = _ImageTextPtr.asFunction<ImageC Function(Pointer<Char>, int, ColorC)>();

  ImageC ImageTextEx(FontC font, Pointer<Char> text, double fontSize, double spacing, ColorC tint)
    => _ImageTextEx(font, text, fontSize, spacing, tint);
  late final _ImageTextExPtr = _lookup<NativeFunction<ImageC Function(FontC, Pointer<Char>, Float, Float, ColorC)>>('ImageTextEx');
  late final _ImageTextEx = _ImageTextExPtr.asFunction<ImageC Function(FontC, Pointer<Char>, double, double, ColorC)>();

  void ImageFormat(Pointer<ImageC> image, int newFormat)
    => _ImageFormat(image, newFormat);
  late final _ImageFormatPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('ImageFormat');
  late final _ImageFormat = _ImageFormatPtr.asFunction<void Function(Pointer<ImageC>, int)>();

  void ImageToPOT(Pointer<ImageC> image, ColorC fill)
    => _ImageToPOT(image, fill);
  late final _ImageToPOTPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC)>>('ImageToPOT');
  late final _ImageToPOT = _ImageToPOTPtr.asFunction<void Function(Pointer<ImageC>, ColorC)>();

  void ImageCrop(Pointer<ImageC> image, RectangleC crop)
    => _ImageCrop(image, crop);
  late final _ImageCropPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, RectangleC)>>('ImageCrop');
  late final _ImageCrop = _ImageCropPtr.asFunction<void Function(Pointer<ImageC>, RectangleC)>();

  void ImageAlphaCrop(Pointer<ImageC> image, double threshold)
    => _ImageAlphaCrop(image, threshold);
  late final _ImageAlphaCropPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Float)>>('ImageAlphaCrop');
  late final _ImageAlphaCrop = _ImageAlphaCropPtr.asFunction<void Function(Pointer<ImageC>, double)>();

  void ImageAlphaClear(Pointer<ImageC> image, ColorC color, double threshold)
    => _ImageAlphaClear(image, color, threshold);
  late final _ImageAlphaClearPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC, Float)>>('ImageAlphaClear');
  late final _ImageAlphaClear = _ImageAlphaClearPtr.asFunction<void Function(Pointer<ImageC>, ColorC, double)>();

  void ImageAlphaMask(Pointer<ImageC> image, ImageC alphaMask)
    => _ImageAlphaMask(image, alphaMask);
  late final _ImageAlphaMaskPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ImageC)>>('ImageAlphaMask');
  late final _ImageAlphaMask = _ImageAlphaMaskPtr.asFunction<void Function(Pointer<ImageC>, ImageC)>();

  void ImageAlphaPremultiply(Pointer<ImageC> image)
    => _ImageAlphaPremultiply(image);
  late final _ImageAlphaPremultiplyPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageAlphaPremultiply');
  late final _ImageAlphaPremultiply = _ImageAlphaPremultiplyPtr.asFunction<void Function(Pointer<ImageC>)>();

  void ImageBlurGaussian(Pointer<ImageC> image, int blurSize)
    => _ImageBlurGaussian(image, blurSize);
  late final _ImageBlurGaussianPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('ImageBlurGaussian');
  late final _ImageBlurGaussian = _ImageBlurGaussianPtr.asFunction<void Function(Pointer<ImageC>, int)>();

  void ImageKernelConvolution(Pointer<ImageC> image, Pointer<Float> kernel, int kernelSize)
    => _ImageKernelConvolution(image, kernel, kernelSize);
  late final _ImageKernelConvolutionPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Pointer<Float>, Int)>>('ImageKernelConvolution');
  late final _ImageKernelConvolution = _ImageKernelConvolutionPtr.asFunction<void Function(Pointer<ImageC>, Pointer<Float>, int)>();

  void ImageResize(Pointer<ImageC> image, int newWidth, int newHeight)
    => _ImageResize(image, newWidth, newHeight);
  late final _ImageResizePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int)>>('ImageResize');
  late final _ImageResize = _ImageResizePtr.asFunction<void Function(Pointer<ImageC>, int, int)>();

  void ImageResizeNN(Pointer<ImageC> image, int newWidth, int newHeight)
    => _ImageResizeNN(image, newWidth, newHeight);
  late final _ImageResizeNNPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int)>>('ImageResizeNN');
  late final _ImageResizeNN = _ImageResizeNNPtr.asFunction<void Function(Pointer<ImageC>, int, int)>();

  void ImageResizeCanvas(Pointer<ImageC> image, int newWidth, int newHeight, int offsetX, int offsetY, ColorC fill)
    => _ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill);
  late final _ImageResizeCanvasPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, Int, ColorC)>>('ImageResizeCanvas');
  late final _ImageResizeCanvas = _ImageResizeCanvasPtr.asFunction<void Function(Pointer<ImageC>, int, int, int, int, ColorC)>();

  void ImageMipmaps(Pointer<ImageC> image)
    => _ImageMipmaps(image);
  late final _ImageMipmapsPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageMipmaps');
  late final _ImageMipmaps = _ImageMipmapsPtr.asFunction<void Function(Pointer<ImageC>)>();

  void ImageDither(Pointer<ImageC> image, int rBpp, int gBpp, int bBpp, int aBpp)
    => _ImageDither(image, rBpp, gBpp, bBpp, aBpp);
  late final _ImageDitherPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, Int)>>('ImageDither');
  late final _ImageDither = _ImageDitherPtr.asFunction<void Function(Pointer<ImageC>, int, int, int, int)>();

  void ImageFlipVertical(Pointer<ImageC> image)
    => _ImageFlipVertical(image);
  late final _ImageFlipVerticalPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageFlipVertical');
  late final _ImageFlipVertical = _ImageFlipVerticalPtr.asFunction<void Function(Pointer<ImageC>)>();

  void ImageFlipHorizontal(Pointer<ImageC> image)
    => _ImageFlipHorizontal(image);
  late final _ImageFlipHorizontalPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageFlipHorizontal');
  late final _ImageFlipHorizontal = _ImageFlipHorizontalPtr.asFunction<void Function(Pointer<ImageC>)>();

  void ImageRotate(Pointer<ImageC> image, int degrees)
    => _ImageRotate(image, degrees);
  late final _ImageRotatePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('ImageRotate');
  late final _ImageRotate = _ImageRotatePtr.asFunction<void Function(Pointer<ImageC>, int)>();

  void ImageRotateCW(Pointer<ImageC> image)
    => _ImageRotateCW(image);
  late final _ImageRotateCWPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageRotateCW');
  late final _ImageRotateCW = _ImageRotateCWPtr.asFunction<void Function(Pointer<ImageC>)>();

  void ImageRotateCCW(Pointer<ImageC> image)
    => _ImageRotateCCW(image);
  late final _ImageRotateCCWPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageRotateCCW');
  late final _ImageRotateCCW = _ImageRotateCCWPtr.asFunction<void Function(Pointer<ImageC>)>();

  void ImageColorTint(Pointer<ImageC> image, ColorC color)
    => _ImageColorTint(image, color);
  late final _ImageColorTintPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC)>>('ImageColorTint');
  late final _ImageColorTint = _ImageColorTintPtr.asFunction<void Function(Pointer<ImageC>, ColorC)>();

  void ImageColorInvert(Pointer<ImageC> image)
    => _ImageColorInvert(image);
  late final _ImageColorInvertPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageColorInvert');
  late final _ImageColorInvert = _ImageColorInvertPtr.asFunction<void Function(Pointer<ImageC>)>();

  void ImageColorGrayscale(Pointer<ImageC> image)
    => _ImageColorGrayscale(image);
  late final _ImageColorGrayscalePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>)>>('ImageColorGrayscale');
  late final _ImageColorGrayscale = _ImageColorGrayscalePtr.asFunction<void Function(Pointer<ImageC>)>();

  void ImageColorContrast(Pointer<ImageC> image, double contrast)
    => _ImageColorContrast(image, contrast);
  late final _ImageColorContrastPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Float)>>('ImageColorContrast');
  late final _ImageColorContrast = _ImageColorContrastPtr.asFunction<void Function(Pointer<ImageC>, double)>();

  void ImageColorBrightness(Pointer<ImageC> image, int brightness)
    => _ImageColorBrightness(image, brightness);
  late final _ImageColorBrightnessPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int)>>('ImageColorBrightness');
  late final _ImageColorBrightness = _ImageColorBrightnessPtr.asFunction<void Function(Pointer<ImageC>, int)>();

  void ImageColorReplace(Pointer<ImageC> image, ColorC color, ColorC replace)
    => _ImageColorReplace(image, color, replace);
  late final _ImageColorReplacePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC, ColorC)>>('ImageColorReplace');
  late final _ImageColorReplace = _ImageColorReplacePtr.asFunction<void Function(Pointer<ImageC>, ColorC, ColorC)>();

  Pointer<ColorC> LoadImageColors(ImageC image)
    => _LoadImageColors(image);
  late final _LoadImageColorsPtr = _lookup<NativeFunction<Pointer<ColorC> Function(ImageC)>>('LoadImageColors');
  late final _LoadImageColors = _LoadImageColorsPtr.asFunction<Pointer<ColorC> Function(ImageC)>();

  Pointer<ColorC> LoadImagePalette(ImageC image, int maxPaletteSize, Pointer<Int> colorCount)
    => _LoadImagePalette(image, maxPaletteSize, colorCount);
  late final _LoadImagePalettePtr = _lookup<NativeFunction<Pointer<ColorC> Function(ImageC, Int, Pointer<Int>)>>('LoadImagePalette');
  late final _LoadImagePalette = _LoadImagePalettePtr.asFunction<Pointer<ColorC> Function(ImageC, int, Pointer<Int>)>();

  void UnloadImageColors(Pointer<ColorC> colors)
    => _UnloadImageColors(colors);
  late final _UnloadImageColorsPtr = _lookup<NativeFunction<Void Function(Pointer<ColorC>)>>('UnloadImageColors');
  late final _UnloadImageColors = _UnloadImageColorsPtr.asFunction<void Function(Pointer<ColorC>)>();

  void UnloadImagePalette(Pointer<ColorC> colors)
    => _UnloadImagePalette(colors);
  late final _UnloadImagePalettePtr = _lookup<NativeFunction<Void Function(Pointer<ColorC>)>>('UnloadImagePalette');
  late final _UnloadImagePalette = _UnloadImagePalettePtr.asFunction<void Function(Pointer<ColorC>)>();

  RectangleC GetImageAlphaBorder(ImageC image, double threshold)
    => _GetImageAlphaBorder(image, threshold);
  late final _GetImageAlphaBorderPtr = _lookup<NativeFunction<RectangleC Function(ImageC, Float)>>('GetImageAlphaBorder');
  late final _GetImageAlphaBorder = _GetImageAlphaBorderPtr.asFunction<RectangleC Function(ImageC, double)>();

  ColorC GetImageColor(ImageC image, int x, int y)
    => _GetImageColor(image, x, y);
  late final _GetImageColorPtr = _lookup<NativeFunction<ColorC Function(ImageC, Int, Int)>>('GetImageColor');
  late final _GetImageColor = _GetImageColorPtr.asFunction<ColorC Function(ImageC, int, int)>();

  void ImageClearBackground(Pointer<ImageC> dst, ColorC color)
    => _ImageClearBackground(dst, color);
  late final _ImageClearBackgroundPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ColorC)>>('ImageClearBackground');
  late final _ImageClearBackground = _ImageClearBackgroundPtr.asFunction<void Function(Pointer<ImageC>, ColorC)>();

  void ImageDrawPixel(Pointer<ImageC> dst, int posX, int posY, ColorC color)
    => _ImageDrawPixel(dst, posX, posY, color);
  late final _ImageDrawPixelPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, ColorC)>>('ImageDrawPixel');
  late final _ImageDrawPixel = _ImageDrawPixelPtr.asFunction<void Function(Pointer<ImageC>, int, int, ColorC)>();

  void ImageDrawPixelV(Pointer<ImageC> dst, Vector2C position, ColorC color)
    => _ImageDrawPixelV(dst, position, color);
  late final _ImageDrawPixelVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, ColorC)>>('ImageDrawPixelV');
  late final _ImageDrawPixelV = _ImageDrawPixelVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, ColorC)>();

  void ImageDrawLine(Pointer<ImageC> dst, int startPosX, int startPosY, int endPosX, int endPosY, ColorC color)
    => _ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color);
  late final _ImageDrawLinePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, Int, ColorC)>>('ImageDrawLine');
  late final _ImageDrawLine = _ImageDrawLinePtr.asFunction<void Function(Pointer<ImageC>, int, int, int, int, ColorC)>();

  void ImageDrawLineV(Pointer<ImageC> dst, Vector2C start, Vector2C end, ColorC color)
    => _ImageDrawLineV(dst, start, end, color);
  late final _ImageDrawLineVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, ColorC)>>('ImageDrawLineV');
  late final _ImageDrawLineV = _ImageDrawLineVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, ColorC)>();

  void ImageDrawLineEx(Pointer<ImageC> dst, Vector2C start, Vector2C end, int thick, ColorC color)
    => _ImageDrawLineEx(dst, start, end, thick, color);
  late final _ImageDrawLineExPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, Int, ColorC)>>('ImageDrawLineEx');
  late final _ImageDrawLineEx = _ImageDrawLineExPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, int, ColorC)>();

  void ImageDrawCircle(Pointer<ImageC> dst, int centerX, int centerY, int radius, ColorC color)
    => _ImageDrawCircle(dst, centerX, centerY, radius, color);
  late final _ImageDrawCirclePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, ColorC)>>('ImageDrawCircle');
  late final _ImageDrawCircle = _ImageDrawCirclePtr.asFunction<void Function(Pointer<ImageC>, int, int, int, ColorC)>();

  void ImageDrawCircleV(Pointer<ImageC> dst, Vector2C center, int radius, ColorC color)
    => _ImageDrawCircleV(dst, center, radius, color);
  late final _ImageDrawCircleVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Int, ColorC)>>('ImageDrawCircleV');
  late final _ImageDrawCircleV = _ImageDrawCircleVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, int, ColorC)>();

  void ImageDrawCircleLines(Pointer<ImageC> dst, int centerX, int centerY, int radius, ColorC color)
    => _ImageDrawCircleLines(dst, centerX, centerY, radius, color);
  late final _ImageDrawCircleLinesPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, ColorC)>>('ImageDrawCircleLines');
  late final _ImageDrawCircleLines = _ImageDrawCircleLinesPtr.asFunction<void Function(Pointer<ImageC>, int, int, int, ColorC)>();

  void ImageDrawCircleLinesV(Pointer<ImageC> dst, Vector2C center, int radius, ColorC color)
    => _ImageDrawCircleLinesV(dst, center, radius, color);
  late final _ImageDrawCircleLinesVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Int, ColorC)>>('ImageDrawCircleLinesV');
  late final _ImageDrawCircleLinesV = _ImageDrawCircleLinesVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, int, ColorC)>();

  void ImageDrawRectangle(Pointer<ImageC> dst, int posX, int posY, int width, int height, ColorC color)
    => _ImageDrawRectangle(dst, posX, posY, width, height, color);
  late final _ImageDrawRectanglePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Int, Int, Int, Int, ColorC)>>('ImageDrawRectangle');
  late final _ImageDrawRectangle = _ImageDrawRectanglePtr.asFunction<void Function(Pointer<ImageC>, int, int, int, int, ColorC)>();

  void ImageDrawRectangleV(Pointer<ImageC> dst, Vector2C position, Vector2C size, ColorC color)
    => _ImageDrawRectangleV(dst, position, size, color);
  late final _ImageDrawRectangleVPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, ColorC)>>('ImageDrawRectangleV');
  late final _ImageDrawRectangleV = _ImageDrawRectangleVPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, ColorC)>();

  void ImageDrawRectangleRec(Pointer<ImageC> dst, RectangleC rec, ColorC color)
    => _ImageDrawRectangleRec(dst, rec, color);
  late final _ImageDrawRectangleRecPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, RectangleC, ColorC)>>('ImageDrawRectangleRec');
  late final _ImageDrawRectangleRec = _ImageDrawRectangleRecPtr.asFunction<void Function(Pointer<ImageC>, RectangleC, ColorC)>();

  void ImageDrawRectangleLines(Pointer<ImageC> dst, RectangleC rec, int thick, ColorC color)
    => _ImageDrawRectangleLines(dst, rec, thick, color);
  late final _ImageDrawRectangleLinesPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, RectangleC, Int, ColorC)>>('ImageDrawRectangleLines');
  late final _ImageDrawRectangleLines = _ImageDrawRectangleLinesPtr.asFunction<void Function(Pointer<ImageC>, RectangleC, int, ColorC)>();

  void ImageDrawTriangle(Pointer<ImageC> dst, Vector2C v1, Vector2C v2, Vector2C v3, ColorC color)
    => _ImageDrawTriangle(dst, v1, v2, v3, color);
  late final _ImageDrawTrianglePtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC)>>('ImageDrawTriangle');
  late final _ImageDrawTriangle = _ImageDrawTrianglePtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC)>();

  void ImageDrawTriangleEx(Pointer<ImageC> dst, Vector2C v1, Vector2C v2, Vector2C v3, ColorC c1, ColorC c2, ColorC c3)
    => _ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3);
  late final _ImageDrawTriangleExPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC, ColorC, ColorC)>>('ImageDrawTriangleEx');
  late final _ImageDrawTriangleEx = _ImageDrawTriangleExPtr.asFunction<void Function(Pointer<ImageC>,Vector2C,Vector2C,Vector2C,ColorC,ColorC,ColorC)>();

  void ImageDrawTriangleLines(Pointer<ImageC> dst, Vector2C v1, Vector2C v2, Vector2C v3, ColorC color)
    => _ImageDrawTriangleLines(dst, v1, v2, v3, color);
  late final _ImageDrawTriangleLinesPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC)>>('ImageDrawTriangleLines');
  late final _ImageDrawTriangleLines = _ImageDrawTriangleLinesPtr.asFunction<void Function(Pointer<ImageC>, Vector2C, Vector2C, Vector2C, ColorC)>();

  void ImageDrawTriangleFan(Pointer<ImageC> dst, Pointer<Vector2C> points, int pointCount, ColorC color)
    => _ImageDrawTriangleFan(dst, points, pointCount, color);
  late final _ImageDrawTriangleFanPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Pointer<Vector2C>, Int, ColorC)>>('ImageDrawTriangleFan');
  late final _ImageDrawTriangleFan = _ImageDrawTriangleFanPtr.asFunction<void Function(Pointer<ImageC>, Pointer<Vector2C>, int, ColorC)>();

  void ImageDrawTriangleStrip(Pointer<ImageC> dst, Pointer<Vector2C> points, int pointCount, ColorC color)
    => _ImageDrawTriangleStrip(dst, points, pointCount, color);
  late final _ImageDrawTriangleStripPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Pointer<Vector2C>, Int, ColorC)>>('ImageDrawTriangleStrip');
  late final _ImageDrawTriangleStrip = _ImageDrawTriangleStripPtr.asFunction<void Function(Pointer<ImageC>, Pointer<Vector2C>, int, ColorC)>();

  void ImageDraw(Pointer<ImageC> dst, ImageC src, RectangleC srcRec, RectangleC dstRec, ColorC tint)
    => _ImageDraw(dst, src, srcRec, dstRec, tint);
  late final _ImageDrawPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, ImageC, RectangleC, RectangleC, ColorC)>>('ImageDraw');
  late final _ImageDraw = _ImageDrawPtr.asFunction<void Function(Pointer<ImageC>, ImageC, RectangleC, RectangleC, ColorC)>();

  void ImageDrawText(Pointer<ImageC> dst, Pointer<Char> text, int posX, int posY, int fontSize, ColorC color)
    => _ImageDrawText(dst, text, posX, posY, fontSize, color);
  late final _ImageDrawTextPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, Pointer<Char>, Int, Int, Int, ColorC)>>('ImageDrawText');
  late final _ImageDrawText = _ImageDrawTextPtr.asFunction<void Function(Pointer<ImageC>, Pointer<Char>, int, int, int, ColorC)>();

  void ImageDrawTextEx(Pointer<ImageC> dst, FontC font, Pointer<Char> text, Vector2C position, double fontSize, double spacing, ColorC tint)
    => _ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint);
  late final _ImageDrawTextExPtr = _lookup<NativeFunction<Void Function(Pointer<ImageC>, FontC, Pointer<Char>, Vector2C, Float, Float, ColorC)>>('ImageDrawTextEx');
  late final _ImageDrawTextEx = _ImageDrawTextExPtr.asFunction<void Function(Pointer<ImageC>, FontC, Pointer<Char>, Vector2C, double, double, ColorC)>();

  TextureC LoadTexture(Pointer<Char> fileName)
    => _LoadTexture(fileName);
  late final _LoadTexturePtr = _lookup<NativeFunction<TextureC Function(Pointer<Char>)>>('LoadTexture');
  late final _LoadTexture = _LoadTexturePtr.asFunction<TextureC Function(Pointer<Char>)>();

  TextureC LoadTextureFromImage(ImageC image)
    => _LoadTextureFromImage(image);
  late final _LoadTextureFromImagePtr = _lookup<NativeFunction<TextureC Function(ImageC)>>('LoadTextureFromImage');
  late final _LoadTextureFromImage = _LoadTextureFromImagePtr.asFunction<TextureC Function(ImageC)>();

  TextureC LoadTextureCubemap(ImageC image, int layout)
    => _LoadTextureCubemap(image, layout);
  late final _LoadTextureCubemapPtr = _lookup<NativeFunction<TextureC Function(ImageC, Int)>>('LoadTextureCubemap');
  late final _LoadTextureCubemap = _LoadTextureCubemapPtr.asFunction<TextureC Function(ImageC, int)>();

  RenderTextureC LoadRenderTexture(int width, int height)
    => _LoadRenderTexture(width, height);
  late final _LoadRenderTexturePtr = _lookup<NativeFunction<RenderTextureC Function(Int, Int)>>('LoadRenderTexture');
  late final _LoadRenderTexture = _LoadRenderTexturePtr.asFunction<RenderTextureC Function(int, int)>();

  bool IsTextureValid(TextureC texture)
    => _IsTextureValid(texture);
  late final _IsTextureValidPtr = _lookup<NativeFunction<Bool Function(TextureC)>>('IsTextureValid');
  late final _IsTextureValid = _IsTextureValidPtr.asFunction<bool Function(TextureC)>();

  void UnloadTexture(TextureC texture)
    => _UnloadTexture(texture);
  late final _UnloadTexturePtr = _lookup<NativeFunction<Void Function(TextureC)>>('UnloadTexture');
  late final _UnloadTexture = _UnloadTexturePtr.asFunction<void Function(TextureC)>();

  bool IsRenderTextureValid(RenderTextureC target)
    => _IsRenderTextureValid(target);
  late final _IsRenderTextureValidPtr = _lookup<NativeFunction<Bool Function(RenderTextureC)>>('IsRenderTextureValid');
  late final _IsRenderTextureValid = _IsRenderTextureValidPtr.asFunction<bool Function(RenderTextureC)>();

  void UnloadRenderTexture(RenderTextureC target)
    => _UnloadRenderTexture(target);
  late final _UnloadRenderTexturePtr = _lookup<NativeFunction<Void Function(RenderTextureC)>>('UnloadRenderTexture');
  late final _UnloadRenderTexture = _UnloadRenderTexturePtr.asFunction<void Function(RenderTextureC)>();

  void UpdateTexture(TextureC texture, Pointer<Void> pixels)
    => _UpdateTexture(texture, pixels);
  late final _UpdateTexturePtr = _lookup<NativeFunction<Void Function(TextureC, Pointer<Void>)>>('UpdateTexture');
  late final _UpdateTexture = _UpdateTexturePtr.asFunction<void Function(TextureC, Pointer<Void>)>();

  void UpdateTextureRec(TextureC texture, RectangleC rec, Pointer<Void> pixels)
    => _UpdateTextureRec(texture, rec, pixels);
  late final _UpdateTextureRecPtr = _lookup<NativeFunction<Void Function(TextureC, RectangleC, Pointer<Void>)>>('UpdateTextureRec');
  late final _UpdateTextureRec = _UpdateTextureRecPtr.asFunction<void Function(TextureC, RectangleC, Pointer<Void>)>();

  void GenTextureMipmaps(Pointer<TextureC> texture)
    => _GenTextureMipmaps(texture);
  late final _GenTextureMipmapsPtr = _lookup<NativeFunction<Void Function(Pointer<TextureC>)>>('GenTextureMipmaps');
  late final _GenTextureMipmaps = _GenTextureMipmapsPtr.asFunction<void Function(Pointer<TextureC>)>();

  void SetTextureFilter(TextureC texture, int filter)
    => _SetTextureFilter(texture, filter);
  late final _SetTextureFilterPtr = _lookup<NativeFunction<Void Function(TextureC, Int)>>('SetTextureFilter');
  late final _SetTextureFilter = _SetTextureFilterPtr.asFunction<void Function(TextureC, int)>();

  void SetTextureWrap(TextureC texture, int wrap)
    => _SetTextureWrap(texture, wrap);
  late final _SetTextureWrapPtr = _lookup<NativeFunction<Void Function(TextureC, Int)>>('SetTextureWrap');
  late final _SetTextureWrap = _SetTextureWrapPtr.asFunction<void Function(TextureC, int)>();

  void DrawTexture(TextureC texture, int posX, int posY, ColorC tint)
    => _DrawTexture(texture, posX, posY, tint);
  late final _DrawTexturePtr = _lookup<NativeFunction<Void Function(TextureC, Int, Int, ColorC)>>('DrawTexture');
  late final _DrawTexture = _DrawTexturePtr.asFunction<void Function(TextureC, int, int, ColorC)>();

  void DrawTextureV(TextureC texture, Vector2C position, ColorC tint)
    => _DrawTextureV(texture, position, tint);
  late final _DrawTextureVPtr = _lookup<NativeFunction<Void Function(TextureC, Vector2C, ColorC)>>('DrawTextureV');
  late final _DrawTextureV = _DrawTextureVPtr.asFunction<void Function(TextureC, Vector2C, ColorC)>();

  void DrawTextureEx(TextureC texture, Vector2C position, double rotation, double scale, ColorC tint)
    => _DrawTextureEx(texture, position, rotation, scale, tint);
  late final _DrawTextureExPtr = _lookup<NativeFunction<Void Function(TextureC, Vector2C, Float, Float, ColorC)>>('DrawTextureEx');
  late final _DrawTextureEx = _DrawTextureExPtr.asFunction<void Function(TextureC, Vector2C, double, double, ColorC)>();

  void DrawTextureRec(TextureC texture, RectangleC source, Vector2C position, ColorC tint)
    => _DrawTextureRec(texture, source, position, tint);
  late final _DrawTextureRecPtr = _lookup<NativeFunction<Void Function(TextureC, RectangleC, Vector2C, ColorC)>>('DrawTextureRec');
  late final _DrawTextureRec = _DrawTextureRecPtr.asFunction<void Function(TextureC, RectangleC, Vector2C, ColorC)>();

  void DrawTexturePro(TextureC texture, RectangleC source, RectangleC dest, Vector2C origin, double rotation, ColorC tint)
    => _DrawTexturePro(texture, source, dest, origin, rotation, tint);
  late final _DrawTextureProPtr = _lookup<NativeFunction<Void Function(TextureC, RectangleC, RectangleC, Vector2C, Float, ColorC)>>('DrawTexturePro');
  late final _DrawTexturePro = _DrawTextureProPtr.asFunction<void Function(TextureC, RectangleC, RectangleC, Vector2C, double, ColorC)>();

  void DrawTextureNPatch(TextureC texture, NPatchInfoC nPatchInfo, RectangleC dest, Vector2C origin, double rotation, ColorC tint)
    => _DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint);
  late final _DrawTextureNPatchPtr = _lookup<NativeFunction<Void Function(TextureC, NPatchInfoC, RectangleC, Vector2C, Float, ColorC)>>('DrawTextureNPatch');
  late final _DrawTextureNPatch = _DrawTextureNPatchPtr.asFunction<void Function(TextureC, NPatchInfoC, RectangleC, Vector2C, double, ColorC)>();

  bool ColorIsEqual(ColorC col1, ColorC col2)
    => _ColorIsEqual(col1, col2);
  late final _ColorIsEqualPtr = _lookup<NativeFunction<Bool Function(ColorC, ColorC)>>('ColorIsEqual');
  late final _ColorIsEqual = _ColorIsEqualPtr.asFunction<bool Function(ColorC, ColorC)>();

  ColorC Fade(ColorC color, double alpha)
    => _Fade(color, alpha);
  late final _FadePtr = _lookup<NativeFunction<ColorC Function(ColorC, Float)>>('Fade');
  late final _Fade = _FadePtr.asFunction<ColorC Function(ColorC, double)>();

  int ColorToInt(ColorC color)
    => _ColorToInt(color);
  late final _ColorToIntPtr = _lookup<NativeFunction<Int Function(ColorC)>>('ColorToInt');
  late final _ColorToInt = _ColorToIntPtr.asFunction<int Function(ColorC)>();

  Vector4C ColorNormalize(ColorC color)
    => _ColorNormalize(color);
  late final _ColorNormalizePtr = _lookup<NativeFunction<Vector4C Function(ColorC)>>('ColorNormalize');
  late final _ColorNormalize = _ColorNormalizePtr.asFunction<Vector4C Function(ColorC)>();

  ColorC ColorFromNormalized(Vector4C normalized)
    => _ColorFromNormalized(normalized);
  late final _ColorFromNormalizedPtr = _lookup<NativeFunction<ColorC Function(Vector4C)>>('ColorFromNormalized');
  late final _ColorFromNormalized = _ColorFromNormalizedPtr.asFunction<ColorC Function(Vector4C)>();

  Vector3C ColorToHSV(ColorC color)
    => _ColorToHSV(color);
  late final _ColorToHSVPtr = _lookup<NativeFunction<Vector3C Function(ColorC)>>('ColorToHSV');
  late final _ColorToHSV = _ColorToHSVPtr.asFunction<Vector3C Function(ColorC)>();

  ColorC ColorFromHSV(double hue, double saturation, double value)
    => _ColorFromHSV(hue, saturation, value);
  late final _ColorFromHSVPtr = _lookup<NativeFunction<ColorC Function(Float, Float, Float)>>('ColorFromHSV');
  late final _ColorFromHSV = _ColorFromHSVPtr.asFunction<ColorC Function(double, double, double)>();

  ColorC ColorTint(ColorC color, ColorC tint)
    => _ColorTint(color, tint);
  late final _ColorTintPtr = _lookup<NativeFunction<ColorC Function(ColorC, ColorC)>>('ColorTint');
  late final _ColorTint = _ColorTintPtr.asFunction<ColorC Function(ColorC, ColorC)>();

  ColorC ColorBrightness(ColorC color, double factor)
    => _ColorBrightness(color, factor);
  late final _ColorBrightnessPtr = _lookup<NativeFunction<ColorC Function(ColorC, Float)>>('ColorBrightness');
  late final _ColorBrightness = _ColorBrightnessPtr.asFunction<ColorC Function(ColorC, double)>();

  ColorC ColorContrast(ColorC color, double contrast)
    => _ColorContrast(color, contrast);
  late final _ColorContrastPtr = _lookup<NativeFunction<ColorC Function(ColorC, Float)>>('ColorContrast');
  late final _ColorContrast = _ColorContrastPtr.asFunction<ColorC Function(ColorC, double)>();

  ColorC ColorAlpha(ColorC color, double alpha)
    => _ColorAlpha(color, alpha);
  late final _ColorAlphaPtr = _lookup<NativeFunction<ColorC Function(ColorC, Float)>>('ColorAlpha');
  late final _ColorAlpha = _ColorAlphaPtr.asFunction<ColorC Function(ColorC, double)>();

  ColorC ColorAlphaBlend(ColorC dst, ColorC src, ColorC tint)
    => _ColorAlphaBlend(dst, src, tint);
  late final _ColorAlphaBlendPtr = _lookup<NativeFunction<ColorC Function(ColorC, ColorC, ColorC)>>('ColorAlphaBlend');
  late final _ColorAlphaBlend = _ColorAlphaBlendPtr.asFunction<ColorC Function(ColorC, ColorC, ColorC)>();

  ColorC ColorLerp(ColorC color1, ColorC color2, double factor)
    => _ColorLerp(color1, color2, factor);
  late final _ColorLerpPtr = _lookup<NativeFunction<ColorC Function(ColorC, ColorC, Float)>>('ColorLerp');
  late final _ColorLerp = _ColorLerpPtr.asFunction<ColorC Function(ColorC, ColorC, double)>();

  ColorC GetColor(int hexValue)
    => _GetColor(hexValue);
  late final _GetColorPtr = _lookup<NativeFunction<ColorC Function(UnsignedInt)>>('GetColor');
  late final _GetColor = _GetColorPtr.asFunction<ColorC Function(int)>();

  ColorC GetPixelColor(Pointer<Void> srcPtr, int format)
    => _GetPixelColor(srcPtr, format);
  late final _GetPixelColorPtr = _lookup<NativeFunction<ColorC Function(Pointer<Void>, Int)>>('GetPixelColor');
  late final _GetPixelColor = _GetPixelColorPtr.asFunction<ColorC Function(Pointer<Void>, int)>();

  void SetPixelColor(Pointer<Void> dstPtr, ColorC color, int format)
    => _SetPixelColor(dstPtr, color, format);
  late final _SetPixelColorPtr = _lookup<NativeFunction<Void Function(Pointer<Void>, ColorC, Int)>>('SetPixelColor');
  late final _SetPixelColor = _SetPixelColorPtr.asFunction<void Function(Pointer<Void>, ColorC, int)>();

  int GetPixelDataSize(int width, int height, int format)
    => _GetPixelDataSize(width, height, format);
  late final _GetPixelDataSizePtr = _lookup<NativeFunction<Int Function(Int, Int, Int)>>('GetPixelDataSize');
  late final _GetPixelDataSize = _GetPixelDataSizePtr.asFunction<int Function(int, int, int)>();

  FontC GetFontDefault()
    => _GetFontDefault();
  late final _GetFontDefaultPtr = _lookup<NativeFunction<FontC Function()>>('GetFontDefault');
  late final _GetFontDefault = _GetFontDefaultPtr.asFunction<FontC Function()>();

  FontC LoadFont(Pointer<Char> fileName)
    => _LoadFont(fileName);
  late final _LoadFontPtr = _lookup<NativeFunction<FontC Function(Pointer<Char>)>>('LoadFont');
  late final _LoadFont = _LoadFontPtr.asFunction<FontC Function(Pointer<Char>)>();

  FontC LoadFontEx(Pointer<Char> fileName, int fontSize, Pointer<Int> codepoints, int codepointCount)
    => _LoadFontEx(fileName, fontSize, codepoints, codepointCount);
  late final _LoadFontExPtr = _lookup<NativeFunction<FontC Function(Pointer<Char>, Int, Pointer<Int>, Int)>>('LoadFontEx');
  late final _LoadFontEx = _LoadFontExPtr.asFunction<FontC Function(Pointer<Char>, int, Pointer<Int>, int)>();

  FontC LoadFontFromImage(ImageC image, ColorC key, int firstChar)
    => _LoadFontFromImage(image, key, firstChar);
  late final _LoadFontFromImagePtr = _lookup<NativeFunction<FontC Function(ImageC, ColorC, Int)>>('LoadFontFromImage');
  late final _LoadFontFromImage = _LoadFontFromImagePtr.asFunction<FontC Function(ImageC, ColorC, int)>();

  FontC LoadFontFromMemory(Pointer<Char> fileType, Pointer<UnsignedChar> fileData, int dataSize, int fontSize, Pointer<Int> codepoints, int codepointCount)
    => _LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount);
  late final _LoadFontFromMemoryPtr = _lookup<NativeFunction<FontC Function(Pointer<Char>, Pointer<UnsignedChar>, Int, Int, Pointer<Int>, Int)>>('LoadFontFromMemory');
  late final _LoadFontFromMemory = _LoadFontFromMemoryPtr.asFunction<FontC Function(Pointer<Char>, Pointer<UnsignedChar>, int, int, Pointer<Int>, int)>();

  bool IsFontValid(FontC font)
    => _IsFontValid(font);
  late final _IsFontValidPtr = _lookup<NativeFunction<Bool Function(FontC)>>('IsFontValid');
  late final _IsFontValid = _IsFontValidPtr.asFunction<bool Function(FontC)>();

  Pointer<GlyphInfoC> LoadFontData(Pointer<UnsignedChar> fileData, int dataSize, int fontSize, Pointer<Int> codepoints, int codepointCount, int type, Pointer<Int> glyphCount)
    => _LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type, glyphCount);
  late final _LoadFontDataPtr = _lookup<NativeFunction<Pointer<GlyphInfoC> Function(Pointer<UnsignedChar>, Int, Int, Pointer<Int>, Int, Int, Pointer<Int>)>>('LoadFontData');
  late final _LoadFontData = _LoadFontDataPtr.asFunction<Pointer<GlyphInfoC> Function(Pointer<UnsignedChar>, int, int, Pointer<Int>, int, int, Pointer<Int>)>();

  ImageC GenImageFontAtlas(Pointer<GlyphInfoC> glyphs, Pointer<Pointer<RectangleC>> glyphRecs, int glyphCount, int fontSize, int padding, int packMethod)
    => _GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod);
  late final _GenImageFontAtlasPtr = _lookup<NativeFunction<ImageC Function(Pointer<GlyphInfoC>, Pointer<Pointer<RectangleC>>, Int, Int, Int, Int)>>('GenImageFontAtlas');
  late final _GenImageFontAtlas = _GenImageFontAtlasPtr.asFunction<ImageC Function(Pointer<GlyphInfoC>, Pointer<Pointer<RectangleC>>, int, int, int, int)>();

  void UnloadFontData(Pointer<GlyphInfoC> glyphs, int glyphCount)
    => _UnloadFontData(glyphs, glyphCount);
  late final _UnloadFontDataPtr = _lookup<NativeFunction<Void Function(Pointer<GlyphInfoC>, Int)>>('UnloadFontData');
  late final _UnloadFontData = _UnloadFontDataPtr.asFunction<void Function(Pointer<GlyphInfoC>, int)>();

  void UnloadFont(FontC font)
    => _UnloadFont(font);
  late final _UnloadFontPtr = _lookup<NativeFunction<Void Function(FontC)>>('UnloadFont');
  late final _UnloadFont = _UnloadFontPtr.asFunction<void Function(FontC)>();

  bool ExportFontAsCode(FontC font, Pointer<Char> fileName)
    => _ExportFontAsCode(font, fileName);
  late final _ExportFontAsCodePtr = _lookup<NativeFunction<Bool Function(FontC, Pointer<Char>)>>('ExportFontAsCode');
  late final _ExportFontAsCode = _ExportFontAsCodePtr.asFunction<bool Function(FontC, Pointer<Char>)>();

  void DrawFPS(int posX, int posY)
    => _DrawFPS(posX, posY);
  late final _DrawFPSPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('DrawFPS');
  late final _DrawFPS = _DrawFPSPtr.asFunction<void Function(int, int)>();

  void DrawText(Pointer<Char> text, int posX, int posY, int fontSize, ColorC color)
    => _DrawText(text, posX, posY, fontSize, color);
  late final _DrawTextPtr = _lookup<NativeFunction<Void Function(Pointer<Char>, Int, Int, Int, ColorC)>>('DrawText');
  late final _DrawText = _DrawTextPtr.asFunction<void Function(Pointer<Char>, int, int, int, ColorC)>();

  void DrawTextEx(FontC font, Pointer<Char> text, Vector2C position, double fontSize, double spacing, ColorC tint)
    => _DrawTextEx(font, text, position, fontSize, spacing, tint);
  late final _DrawTextExPtr = _lookup<NativeFunction<Void Function(FontC, Pointer<Char>, Vector2C, Float, Float, ColorC)>>('DrawTextEx');
  late final _DrawTextEx = _DrawTextExPtr.asFunction<void Function(FontC, Pointer<Char>, Vector2C, double, double, ColorC)>();

  void DrawTextPro(FontC font, Pointer<Char> text, Vector2C position, Vector2C origin, double rotation, double fontSize, double spacing, ColorC tint)
    => _DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint);
  late final _DrawTextProPtr = _lookup<NativeFunction<Void Function(FontC, Pointer<Char>, Vector2C, Vector2C, Float, Float, Float, ColorC)>>('DrawTextPro');
  late final _DrawTextPro = _DrawTextProPtr.asFunction<void Function(FontC, Pointer<Char>, Vector2C, Vector2C, double, double, double, ColorC)>();

  void DrawTextCodepoint(FontC font, int codepoint, Vector2C position, double fontSize, ColorC tint)
    => _DrawTextCodepoint(font, codepoint, position, fontSize, tint);
  late final _DrawTextCodepointPtr = _lookup<NativeFunction<Void Function(FontC, Int, Vector2C, Float, ColorC)>>('DrawTextCodepoint');
  late final _DrawTextCodepoint = _DrawTextCodepointPtr.asFunction<void Function(FontC, int, Vector2C, double, ColorC)>();

  void DrawTextCodepoints(FontC font, Pointer<Int> codepoints, int codepointCount, Vector2C position, double fontSize, double spacing, ColorC tint)
    => _DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint);
  late final _DrawTextCodepointsPtr = _lookup<NativeFunction<Void Function(FontC, Pointer<Int>, Int, Vector2C, Float, Float, ColorC)>>('DrawTextCodepoints');
  late final _DrawTextCodepoints = _DrawTextCodepointsPtr.asFunction<void Function(FontC, Pointer<Int>, int, Vector2C, double, double, ColorC)>();

  void SetTextLineSpacing(int spacing)
    => _SetTextLineSpacing(spacing);
  late final _SetTextLineSpacingPtr = _lookup<NativeFunction<Void Function(Int)>>('SetTextLineSpacing');
  late final _SetTextLineSpacing = _SetTextLineSpacingPtr.asFunction<void Function(int)>();

  int MeasureText(Pointer<Char> text, int fontSize)
    => _MeasureText(text, fontSize);
  late final _MeasureTextPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Int)>>('MeasureText');
  late final _MeasureText = _MeasureTextPtr.asFunction<int Function(Pointer<Char>, int)>();

  Vector2C MeasureTextEx(FontC font, Pointer<Char> text, double fontSize, double spacing)
    => _MeasureTextEx(font, text, fontSize, spacing);
  late final _MeasureTextExPtr = _lookup<NativeFunction<Vector2C Function(FontC, Pointer<Char>, Float, Float)>>('MeasureTextEx');
  late final _MeasureTextEx = _MeasureTextExPtr.asFunction<Vector2C Function(FontC, Pointer<Char>, double, double)>();

  Vector2C MeasureTextCodepoints(FontC font, Pointer<Int> codepoints, int length, double fontSize, double spacing)
    => _MeasureTextCodepoints(font, codepoints, length, fontSize, spacing);
  late final _MeasureTextCodepointsPtr = _lookup<NativeFunction<Vector2C Function(FontC, Pointer<Int>, Int, Float, Float)>>('MeasureTextCodepoints');
  late final _MeasureTextCodepoints = _MeasureTextCodepointsPtr.asFunction<Vector2C Function(FontC, Pointer<Int>, int, double, double)>();

  int GetGlyphIndex(FontC font, int codepoint)
    => _GetGlyphIndex(font, codepoint);
  late final _GetGlyphIndexPtr = _lookup<NativeFunction<Int Function(FontC, Int)>>('GetGlyphIndex');
  late final _GetGlyphIndex = _GetGlyphIndexPtr.asFunction<int Function(FontC, int)>();

  GlyphInfoC GetGlyphInfo(FontC font, int codepoint)
    => _GetGlyphInfo(font, codepoint);
  late final _GetGlyphInfoPtr = _lookup<NativeFunction<GlyphInfoC Function(FontC, Int)>>('GetGlyphInfo');
  late final _GetGlyphInfo = _GetGlyphInfoPtr.asFunction<GlyphInfoC Function(FontC, int)>();

  RectangleC GetGlyphAtlasRec(FontC font, int codepoint)
    => _GetGlyphAtlasRec(font, codepoint);
  late final _GetGlyphAtlasRecPtr = _lookup<NativeFunction<RectangleC Function(FontC, Int)>>('GetGlyphAtlasRec');
  late final _GetGlyphAtlasRec = _GetGlyphAtlasRecPtr.asFunction<RectangleC Function(FontC, int)>();

  Pointer<Char> LoadUTF8(Pointer<Int> codepoints, int length)
    => _LoadUTF8(codepoints, length);
  late final _LoadUTF8Ptr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Int>, Int)>>('LoadUTF8');
  late final _LoadUTF8 = _LoadUTF8Ptr.asFunction<Pointer<Char> Function(Pointer<Int>, int)>();

  void UnloadUTF8(Pointer<Char> text)
    => _UnloadUTF8(text);
  late final _UnloadUTF8Ptr = _lookup<NativeFunction<Void Function(Pointer<Char>)>>('UnloadUTF8');
  late final _UnloadUTF8 = _UnloadUTF8Ptr.asFunction<void Function(Pointer<Char>)>();

  Pointer<Int> LoadCodepoints(Pointer<Char> text, Pointer<Int> count)
    => _LoadCodepoints(text, count);
  late final _LoadCodepointsPtr = _lookup<NativeFunction<Pointer<Int> Function(Pointer<Char>, Pointer<Int>)>>('LoadCodepoints');
  late final _LoadCodepoints = _LoadCodepointsPtr.asFunction<Pointer<Int> Function(Pointer<Char>, Pointer<Int>)>();

  void UnloadCodepoints(Pointer<Int> codepoints)
    => _UnloadCodepoints(codepoints);
  late final _UnloadCodepointsPtr = _lookup<NativeFunction<Void Function(Pointer<Int>)>>('UnloadCodepoints');
  late final _UnloadCodepoints = _UnloadCodepointsPtr.asFunction<void Function(Pointer<Int>)>();

  int GetCodepointCount(Pointer<Char> text)
    => _GetCodepointCount(text);
  late final _GetCodepointCountPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('GetCodepointCount');
  late final _GetCodepointCount = _GetCodepointCountPtr.asFunction<int Function(Pointer<Char>)>();

  int GetCodepoint(Pointer<Char> text, Pointer<Int> codepointSize)
    => _GetCodepoint(text, codepointSize);
  late final _GetCodepointPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Int>)>>('GetCodepoint');
  late final _GetCodepoint = _GetCodepointPtr.asFunction<int Function(Pointer<Char>, Pointer<Int>)>();

  int GetCodepointNext(Pointer<Char> text, Pointer<Int> codepointSize)
    => _GetCodepointNext(text, codepointSize);
  late final _GetCodepointNextPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Int>)>>('GetCodepointNext');
  late final _GetCodepointNext = _GetCodepointNextPtr.asFunction<int Function(Pointer<Char>, Pointer<Int>)>();

  int GetCodepointPrevious(Pointer<Char> text, Pointer<Int> codepointSize)
    => _GetCodepointPrevious(text, codepointSize);
  late final _GetCodepointPreviousPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Int>)>>('GetCodepointPrevious');
  late final _GetCodepointPrevious = _GetCodepointPreviousPtr.asFunction<int Function(Pointer<Char>, Pointer<Int>)>();

  Pointer<Char> CodepointToUTF8(int codepoint, Pointer<Int> utf8Size)
    => _CodepointToUTF8(codepoint, utf8Size);
  late final _CodepointToUTF8Ptr = _lookup<NativeFunction<Pointer<Char> Function(Int, Pointer<Int>)>>('CodepointToUTF8');
  late final _CodepointToUTF8 = _CodepointToUTF8Ptr.asFunction<Pointer<Char> Function(int, Pointer<Int>)>();

  Pointer<Pointer<Char>> LoadTextLines(Pointer<Char> text, Pointer<Int> count)
    => _LoadTextLines(text, count);
  late final _LoadTextLinesPtr = _lookup<NativeFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, Pointer<Int>)>>('LoadTextLines');
  late final _LoadTextLines = _LoadTextLinesPtr.asFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, Pointer<Int>)>();

  void UnloadTextLines(Pointer<Pointer<Char>> text, int lineCount)
    => _UnloadTextLines(text, lineCount);
  late final _UnloadTextLinesPtr = _lookup<NativeFunction<Void Function(Pointer<Pointer<Char>>, Int)>>('UnloadTextLines');
  late final _UnloadTextLines = _UnloadTextLinesPtr.asFunction<void Function(Pointer<Pointer<Char>>, int)>();

  int TextCopy(Pointer<Char> dst, Pointer<Char> src)
    => _TextCopy(dst, src);
  late final _TextCopyPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('TextCopy');
  late final _TextCopy = _TextCopyPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  bool TextIsEqual(Pointer<Char> text1, Pointer<Char> text2)
    => _TextIsEqual(text1, text2);
  late final _TextIsEqualPtr = _lookup<NativeFunction<Bool Function(Pointer<Char>, Pointer<Char>)>>('TextIsEqual');
  late final _TextIsEqual = _TextIsEqualPtr.asFunction<bool Function(Pointer<Char>, Pointer<Char>)>();

  int TextLength(Pointer<Char> text)
    => _TextLength(text);
  late final _TextLengthPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Char>)>>('TextLength');
  late final _TextLength = _TextLengthPtr.asFunction<int Function(Pointer<Char>)>();

  Pointer<Char> TextFormat(Pointer<Char> text)
    => _TextFormat(text);
  late final _TextFormatPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextFormat');
  late final _TextFormat = _TextFormatPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> TextSubtext(Pointer<Char> text, int position, int length)
    => _TextSubtext(text, position, length);
  late final _TextSubtextPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Int, Int)>>('TextSubtext');
  late final _TextSubtext = _TextSubtextPtr.asFunction<Pointer<Char> Function(Pointer<Char>, int, int)>();

  Pointer<Char> TextRemoveSpaces(Pointer<Char> text)
    => _TextRemoveSpaces(text);
  late final _TextRemoveSpacesPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextRemoveSpaces');
  late final _TextRemoveSpaces = _TextRemoveSpacesPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> GetTextBetween(Pointer<Char> text, Pointer<Char> begin, Pointer<Char> end)
    => _GetTextBetween(text, begin, end);
  late final _GetTextBetweenPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('GetTextBetween');
  late final _GetTextBetween = _GetTextBetweenPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  Pointer<Char> TextReplace(Pointer<Char> text, Pointer<Char> replace, Pointer<Char> by)
    => _TextReplace(text, replace, by);
  late final _TextReplacePtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('TextReplace');
  late final _TextReplace = _TextReplacePtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  Pointer<Char> TextReplaceAlloc(Pointer<Char> text, Pointer<Char> replace, Pointer<Char> by)
    => _TextReplaceAlloc(text, replace, by);
  late final _TextReplaceAllocPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('TextReplaceAlloc');
  late final _TextReplaceAlloc = _TextReplaceAllocPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  Pointer<Char> TextReplaceBetween(Pointer<Char> text, Pointer<Char> begin, Pointer<Char> end, Pointer<Char> replacement)
    => _TextReplaceBetween(text, begin, end, replacement);
  late final _TextReplaceBetweenPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('TextReplaceBetween');
  late final _TextReplaceBetween = _TextReplaceBetweenPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  Pointer<Char> TextReplaceBetweenAlloc(Pointer<Char> text, Pointer<Char> begin, Pointer<Char> end, Pointer<Char> replacement)
    => _TextReplaceBetweenAlloc(text, begin, end, replacement);
  late final _TextReplaceBetweenAllocPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>)>>('TextReplaceBetweenAlloc');
  late final _TextReplaceBetweenAlloc = _TextReplaceBetweenAllocPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Pointer<Char>, Pointer<Char>)>();

  Pointer<Char> TextInsert(Pointer<Char> text, Pointer<Char> insert, int position)
    => _TextInsert(text, insert, position);
  late final _TextInsertPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Int)>>('TextInsert');
  late final _TextInsert = _TextInsertPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, int)>();

  Pointer<Char> TextInsertAlloc(Pointer<Char> text, Pointer<Char> insert, int position)
    => _TextInsertAlloc(text, insert, position);
  late final _TextInsertAllocPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, Int)>>('TextInsertAlloc');
  late final _TextInsertAlloc = _TextInsertAllocPtr.asFunction<Pointer<Char> Function(Pointer<Char>, Pointer<Char>, int)>();

  Pointer<Char> TextJoin(Pointer<Pointer<Char>> textList, int count, Pointer<Char> delimiter)
    => _TextJoin(textList, count, delimiter);
  late final _TextJoinPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Pointer<Char>>, Int, Pointer<Char>)>>('TextJoin');
  late final _TextJoin = _TextJoinPtr.asFunction<Pointer<Char> Function(Pointer<Pointer<Char>>, int, Pointer<Char>)>();

  Pointer<Pointer<Char>> TextSplit(Pointer<Char> text, int delimiter, Pointer<Int> count)
    => _TextSplit(text, delimiter, count);
  late final _TextSplitPtr = _lookup<NativeFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, Char, Pointer<Int>)>>('TextSplit');
  late final _TextSplit = _TextSplitPtr.asFunction<Pointer<Pointer<Char>> Function(Pointer<Char>, int, Pointer<Int>)>();

  void TextAppend(Pointer<Char> text, Pointer<Char> append, Pointer<Int> position)
    => _TextAppend(text, append, position);
  late final _TextAppendPtr = _lookup<NativeFunction<Void Function(Pointer<Char>, Pointer<Char>, Pointer<Int>)>>('TextAppend');
  late final _TextAppend = _TextAppendPtr.asFunction<void Function(Pointer<Char>, Pointer<Char>, Pointer<Int>)>();

  int TextFindIndex(Pointer<Char> text, Pointer<Char> find)
    => _TextFindIndex(text, find);
  late final _TextFindIndexPtr = _lookup<NativeFunction<Int Function(Pointer<Char>, Pointer<Char>)>>('TextFindIndex');
  late final _TextFindIndex = _TextFindIndexPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  Pointer<Char> TextToUpper(Pointer<Char> text)
    => _TextToUpper(text);
  late final _TextToUpperPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToUpper');
  late final _TextToUpper = _TextToUpperPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> TextToLower(Pointer<Char> text)
    => _TextToLower(text);
  late final _TextToLowerPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToLower');
  late final _TextToLower = _TextToLowerPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> TextToPascal(Pointer<Char> text)
    => _TextToPascal(text);
  late final _TextToPascalPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToPascal');
  late final _TextToPascal = _TextToPascalPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> TextToSnake(Pointer<Char> text)
    => _TextToSnake(text);
  late final _TextToSnakePtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToSnake');
  late final _TextToSnake = _TextToSnakePtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  Pointer<Char> TextToCamel(Pointer<Char> text)
    => _TextToCamel(text);
  late final _TextToCamelPtr = _lookup<NativeFunction<Pointer<Char> Function(Pointer<Char>)>>('TextToCamel');
  late final _TextToCamel = _TextToCamelPtr.asFunction<Pointer<Char> Function(Pointer<Char>)>();

  int TextToInteger(Pointer<Char> text)
    => _TextToInteger(text);
  late final _TextToIntegerPtr = _lookup<NativeFunction<Int Function(Pointer<Char>)>>('TextToInteger');
  late final _TextToInteger = _TextToIntegerPtr.asFunction<int Function(Pointer<Char>)>();

  double TextToFloat(Pointer<Char> text)
    => _TextToFloat(text);
  late final _TextToFloatPtr = _lookup<NativeFunction<Float Function(Pointer<Char>)>>('TextToFloat');
  late final _TextToFloat = _TextToFloatPtr.asFunction<double Function(Pointer<Char>)>();

  void DrawLine3D(Vector3C startPos, Vector3C endPos, ColorC color)
    => _DrawLine3D(startPos, endPos, color);
  late final _DrawLine3DPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, ColorC)>>('DrawLine3D');
  late final _DrawLine3D = _DrawLine3DPtr.asFunction<void Function(Vector3C, Vector3C, ColorC)>();

  void DrawPoint3D(Vector3C position, ColorC color)
    => _DrawPoint3D(position, color);
  late final _DrawPoint3DPtr = _lookup<NativeFunction<Void Function(Vector3C, ColorC)>>('DrawPoint3D');
  late final _DrawPoint3D = _DrawPoint3DPtr.asFunction<void Function(Vector3C, ColorC)>();

  void DrawCircle3D(Vector3C center, double radius, Vector3C rotationAxis, double rotationAngle, ColorC color)
    => _DrawCircle3D(center, radius, rotationAxis, rotationAngle, color);
  late final _DrawCircle3DPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Vector3C, Float, ColorC)>>('DrawCircle3D');
  late final _DrawCircle3D = _DrawCircle3DPtr.asFunction<void Function(Vector3C, double, Vector3C, double, ColorC)>();

  void DrawTriangle3D(Vector3C v1, Vector3C v2, Vector3C v3, ColorC color)
    => _DrawTriangle3D(v1, v2, v3, color);
  late final _DrawTriangle3DPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Vector3C, ColorC)>>('DrawTriangle3D');
  late final _DrawTriangle3D = _DrawTriangle3DPtr.asFunction<void Function(Vector3C, Vector3C, Vector3C, ColorC)>();

  void DrawTriangleStrip3D(Pointer<Vector3C> points, int pointCount, ColorC color)
    => _DrawTriangleStrip3D(points, pointCount, color);
  late final _DrawTriangleStrip3DPtr = _lookup<NativeFunction<Void Function(Pointer<Vector3C>, Int, ColorC)>>('DrawTriangleStrip3D');
  late final _DrawTriangleStrip3D = _DrawTriangleStrip3DPtr.asFunction<void Function(Pointer<Vector3C>, int, ColorC)>();

  void DrawCube(Vector3C position, double width, double height, double length, ColorC color)
    => _DrawCube(position, width, height, length, color);
  late final _DrawCubePtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Float, Float, ColorC)>>('DrawCube');
  late final _DrawCube = _DrawCubePtr.asFunction<void Function(Vector3C, double, double, double, ColorC)>();

  void DrawCubeV(Vector3C position, Vector3C size, ColorC color)
    => _DrawCubeV(position, size, color);
  late final _DrawCubeVPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, ColorC)>>('DrawCubeV');
  late final _DrawCubeV = _DrawCubeVPtr.asFunction<void Function(Vector3C, Vector3C, ColorC)>();

  void DrawCubeWires(Vector3C position, double width, double height, double length, ColorC color)
    => _DrawCubeWires(position, width, height, length, color);
  late final _DrawCubeWiresPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Float, Float, ColorC)>>('DrawCubeWires');
  late final _DrawCubeWires = _DrawCubeWiresPtr.asFunction<void Function(Vector3C, double, double, double, ColorC)>();

  void DrawCubeWiresV(Vector3C position, Vector3C size, ColorC color)
    => _DrawCubeWiresV(position, size, color);
  late final _DrawCubeWiresVPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, ColorC)>>('DrawCubeWiresV');
  late final _DrawCubeWiresV = _DrawCubeWiresVPtr.asFunction<void Function(Vector3C, Vector3C, ColorC)>();

  void DrawSphere(Vector3C centerPos, double radius, ColorC color)
    => _DrawSphere(centerPos, radius, color);
  late final _DrawSpherePtr = _lookup<NativeFunction<Void Function(Vector3C, Float, ColorC)>>('DrawSphere');
  late final _DrawSphere = _DrawSpherePtr.asFunction<void Function(Vector3C, double, ColorC)>();

  void DrawSphereEx(Vector3C centerPos, double radius, int rings, int slices, ColorC color)
    => _DrawSphereEx(centerPos, radius, rings, slices, color);
  late final _DrawSphereExPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Int, Int, ColorC)>>('DrawSphereEx');
  late final _DrawSphereEx = _DrawSphereExPtr.asFunction<void Function(Vector3C, double, int, int, ColorC)>();

  void DrawSphereWires(Vector3C centerPos, double radius, int rings, int slices, ColorC color)
    => _DrawSphereWires(centerPos, radius, rings, slices, color);
  late final _DrawSphereWiresPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Int, Int, ColorC)>>('DrawSphereWires');
  late final _DrawSphereWires = _DrawSphereWiresPtr.asFunction<void Function(Vector3C, double, int, int, ColorC)>();

  void DrawCylinder(Vector3C position, double radiusTop, double radiusBottom, double height, int slices, ColorC color)
    => _DrawCylinder(position, radiusTop, radiusBottom, height, slices, color);
  late final _DrawCylinderPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Float, Float, Int, ColorC)>>('DrawCylinder');
  late final _DrawCylinder = _DrawCylinderPtr.asFunction<void Function(Vector3C, double, double, double, int, ColorC)>();

  void DrawCylinderEx(Vector3C startPos, Vector3C endPos, double startRadius, double endRadius, int sides, ColorC color)
    => _DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color);
  late final _DrawCylinderExPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Float, Float, Int, ColorC)>>('DrawCylinderEx');
  late final _DrawCylinderEx = _DrawCylinderExPtr.asFunction<void Function(Vector3C, Vector3C, double, double, int, ColorC)>();

  void DrawCylinderWires(Vector3C position, double radiusTop, double radiusBottom, double height, int slices, ColorC color)
    => _DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color);
  late final _DrawCylinderWiresPtr = _lookup<NativeFunction<Void Function(Vector3C, Float, Float, Float, Int, ColorC)>>('DrawCylinderWires');
  late final _DrawCylinderWires = _DrawCylinderWiresPtr.asFunction<void Function(Vector3C, double, double, double, int, ColorC)>();

  void DrawCylinderWiresEx(Vector3C startPos, Vector3C endPos, double startRadius, double endRadius, int sides, ColorC color)
    => _DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color);
  late final _DrawCylinderWiresExPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Float, Float, Int, ColorC)>>('DrawCylinderWiresEx');
  late final _DrawCylinderWiresEx = _DrawCylinderWiresExPtr.asFunction<void Function(Vector3C, Vector3C, double, double, int, ColorC)>();

  void DrawCapsule(Vector3C startPos, Vector3C endPos, double radius, int slices, int rings, ColorC color)
    => _DrawCapsule(startPos, endPos, radius, slices, rings, color);
  late final _DrawCapsulePtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Float, Int, Int, ColorC)>>('DrawCapsule');
  late final _DrawCapsule = _DrawCapsulePtr.asFunction<void Function(Vector3C, Vector3C, double, int, int, ColorC)>();

  void DrawCapsuleWires(Vector3C startPos, Vector3C endPos, double radius, int slices, int rings, ColorC color)
    => _DrawCapsuleWires(startPos, endPos, radius, slices, rings, color);
  late final _DrawCapsuleWiresPtr = _lookup<NativeFunction<Void Function(Vector3C, Vector3C, Float, Int, Int, ColorC)>>('DrawCapsuleWires');
  late final _DrawCapsuleWires = _DrawCapsuleWiresPtr.asFunction<void Function(Vector3C, Vector3C, double, int, int, ColorC)>();

  void DrawPlane(Vector3C centerPos, Vector2C size, ColorC color)
    => _DrawPlane(centerPos, size, color);
  late final _DrawPlanePtr = _lookup<NativeFunction<Void Function(Vector3C, Vector2C, ColorC)>>('DrawPlane');
  late final _DrawPlane = _DrawPlanePtr.asFunction<void Function(Vector3C, Vector2C, ColorC)>();

  void DrawRay(RayC ray, ColorC color)
    => _DrawRay(ray, color);
  late final _DrawRayPtr = _lookup<NativeFunction<Void Function(RayC, ColorC)>>('DrawRay');
  late final _DrawRay = _DrawRayPtr.asFunction<void Function(RayC, ColorC)>();

  void DrawGrid(int slices, double spacing)
    => _DrawGrid(slices, spacing);
  late final _DrawGridPtr = _lookup<NativeFunction<Void Function(Int, Float)>>('DrawGrid');
  late final _DrawGrid = _DrawGridPtr.asFunction<void Function(int, double)>();

  ModelC LoadModel(Pointer<Char> fileName)
    => _LoadModel(fileName);
  late final _LoadModelPtr = _lookup<NativeFunction<ModelC Function(Pointer<Char>)>>('LoadModel');
  late final _LoadModel = _LoadModelPtr.asFunction<ModelC Function(Pointer<Char>)>();

  ModelC LoadModelFromMesh(MeshC mesh)
    => _LoadModelFromMesh(mesh);
  late final _LoadModelFromMeshPtr = _lookup<NativeFunction<ModelC Function(MeshC)>>('LoadModelFromMesh');
  late final _LoadModelFromMesh = _LoadModelFromMeshPtr.asFunction<ModelC Function(MeshC)>();

  bool IsModelValid(ModelC model)
    => _IsModelValid(model);
  late final _IsModelValidPtr = _lookup<NativeFunction<Bool Function(ModelC)>>('IsModelValid');
  late final _IsModelValid = _IsModelValidPtr.asFunction<bool Function(ModelC)>();

  void UnloadModel(ModelC model)
    => _UnloadModel(model);
  late final _UnloadModelPtr = _lookup<NativeFunction<Void Function(ModelC)>>('UnloadModel');
  late final _UnloadModel = _UnloadModelPtr.asFunction<void Function(ModelC)>();

  BoundingBoxC GetModelBoundingBox(ModelC model)
    => _GetModelBoundingBox(model);
  late final _GetModelBoundingBoxPtr = _lookup<NativeFunction<BoundingBoxC Function(ModelC)>>('GetModelBoundingBox');
  late final _GetModelBoundingBox = _GetModelBoundingBoxPtr.asFunction<BoundingBoxC Function(ModelC)>();

  void DrawModel(ModelC model, Vector3C position, double scale, ColorC tint)
    => _DrawModel(model, position, scale, tint);
  late final _DrawModelPtr = _lookup<NativeFunction<Void Function(ModelC, Vector3C, Float, ColorC)>>('DrawModel');
  late final _DrawModel = _DrawModelPtr.asFunction<void Function(ModelC, Vector3C, double, ColorC)>();

  void DrawModelEx(ModelC model, Vector3C position, Vector3C rotationAxis, double rotationAngle, Vector3C scale, ColorC tint)
    => _DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint);
  late final _DrawModelExPtr = _lookup<NativeFunction<Void Function(ModelC, Vector3C, Vector3C, Float, Vector3C, ColorC)>>('DrawModelEx');
  late final _DrawModelEx = _DrawModelExPtr.asFunction<void Function(ModelC, Vector3C, Vector3C, double, Vector3C, ColorC)>();

  void DrawModelWires(ModelC model, Vector3C position, double scale, ColorC tint)
    => _DrawModelWires(model, position, scale, tint);
  late final _DrawModelWiresPtr = _lookup<NativeFunction<Void Function(ModelC, Vector3C, Float, ColorC)>>('DrawModelWires');
  late final _DrawModelWires = _DrawModelWiresPtr.asFunction<void Function(ModelC, Vector3C, double, ColorC)>();

  void DrawModelWiresEx(ModelC model, Vector3C position, Vector3C rotationAxis, double rotationAngle, Vector3C scale, ColorC tint)
    => _DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint);
  late final _DrawModelWiresExPtr = _lookup<NativeFunction<Void Function(ModelC, Vector3C, Vector3C, Float, Vector3C, ColorC)>>('DrawModelWiresEx');
  late final _DrawModelWiresEx = _DrawModelWiresExPtr.asFunction<void Function(ModelC, Vector3C, Vector3C, double, Vector3C, ColorC)>();

  void DrawBoundingBox(BoundingBoxC box, ColorC color)
    => _DrawBoundingBox(box, color);
  late final _DrawBoundingBoxPtr = _lookup<NativeFunction<Void Function(BoundingBoxC, ColorC)>>('DrawBoundingBox');
  late final _DrawBoundingBox = _DrawBoundingBoxPtr.asFunction<void Function(BoundingBoxC, ColorC)>();

  void DrawBillboard(Camera3DC camera, TextureC texture, Vector3C position, double scale, ColorC tint)
    => _DrawBillboard(camera, texture, position, scale, tint);
  late final _DrawBillboardPtr = _lookup<NativeFunction<Void Function(Camera3DC, TextureC, Vector3C, Float, ColorC)>>('DrawBillboard');
  late final _DrawBillboard = _DrawBillboardPtr.asFunction<void Function(Camera3DC, TextureC, Vector3C, double, ColorC)>();

  void DrawBillboardRec(Camera3DC camera, TextureC texture, RectangleC source, Vector3C position, Vector2C size, ColorC tint)
    => _DrawBillboardRec(camera, texture, source, position, size, tint);
  late final _DrawBillboardRecPtr = _lookup<NativeFunction<Void Function(Camera3DC, TextureC, RectangleC, Vector3C, Vector2C, ColorC)>>('DrawBillboardRec');
  late final _DrawBillboardRec = _DrawBillboardRecPtr.asFunction<void Function(Camera3DC, TextureC, RectangleC, Vector3C, Vector2C, ColorC)>();

  void DrawBillboardPro(Camera3DC camera, TextureC texture, RectangleC source, Vector3C position, Vector3C up, Vector2C size, Vector2C origin, double rotation, ColorC tint)
    => _DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint);
  late final _DrawBillboardProPtr = _lookup<NativeFunction<Void Function(Camera3DC, TextureC, RectangleC, Vector3C, Vector3C, Vector2C, Vector2C, Float, ColorC)>>('DrawBillboardPro');
  late final _DrawBillboardPro = _DrawBillboardProPtr.asFunction<void Function(Camera3DC, TextureC, RectangleC, Vector3C, Vector3C, Vector2C, Vector2C, double, ColorC)>();

  void UploadMesh(Pointer<MeshC> mesh, bool dynamic)
    => _UploadMesh(mesh, dynamic);
  late final _UploadMeshPtr = _lookup<NativeFunction<Void Function(Pointer<MeshC>, Bool)>>('UploadMesh');
  late final _UploadMesh = _UploadMeshPtr.asFunction<void Function(Pointer<MeshC>, bool)>();

  void UpdateMeshBuffer(MeshC mesh, int index, Pointer<Void> data, int dataSize, int offset)
    => _UpdateMeshBuffer(mesh, index, data, dataSize, offset);
  late final _UpdateMeshBufferPtr = _lookup<NativeFunction<Void Function(MeshC, Int, Pointer<Void>, Int, Int)>>('UpdateMeshBuffer');
  late final _UpdateMeshBuffer = _UpdateMeshBufferPtr.asFunction<void Function(MeshC, int, Pointer<Void>, int, int)>();

  void UnloadMesh(MeshC mesh)
    => _UnloadMesh(mesh);
  late final _UnloadMeshPtr = _lookup<NativeFunction<Void Function(MeshC)>>('UnloadMesh');
  late final _UnloadMesh = _UnloadMeshPtr.asFunction<void Function(MeshC)>();

  void DrawMesh(MeshC mesh, MaterialC material, MatrixC transform)
    => _DrawMesh(mesh, material, transform);
  late final _DrawMeshPtr = _lookup<NativeFunction<Void Function(MeshC, MaterialC, MatrixC)>>('DrawMesh');
  late final _DrawMesh = _DrawMeshPtr.asFunction<void Function(MeshC, MaterialC, MatrixC)>();

  void DrawMeshInstanced(MeshC mesh, MaterialC material, Pointer<MatrixC> transforms, int instances)
    => _DrawMeshInstanced(mesh, material, transforms, instances);
  late final _DrawMeshInstancedPtr = _lookup<NativeFunction<Void Function(MeshC, MaterialC, Pointer<MatrixC>, Int)>>('DrawMeshInstanced');
  late final _DrawMeshInstanced = _DrawMeshInstancedPtr.asFunction<void Function(MeshC, MaterialC, Pointer<MatrixC>, int)>();

  BoundingBoxC GetMeshBoundingBox(MeshC mesh)
    => _GetMeshBoundingBox(mesh);
  late final _GetMeshBoundingBoxPtr = _lookup<NativeFunction<BoundingBoxC Function(MeshC)>>('GetMeshBoundingBox');
  late final _GetMeshBoundingBox = _GetMeshBoundingBoxPtr.asFunction<BoundingBoxC Function(MeshC)>();

  void GenMeshTangents(Pointer<MeshC> mesh)
    => _GenMeshTangents(mesh);
  late final _GenMeshTangentsPtr = _lookup<NativeFunction<Void Function(Pointer<MeshC>)>>('GenMeshTangents');
  late final _GenMeshTangents = _GenMeshTangentsPtr.asFunction<void Function(Pointer<MeshC>)>();

  bool ExportMesh(MeshC mesh, Pointer<Char> fileName)
    => _ExportMesh(mesh, fileName);
  late final _ExportMeshPtr = _lookup<NativeFunction<Bool Function(MeshC, Pointer<Char>)>>('ExportMesh');
  late final _ExportMesh = _ExportMeshPtr.asFunction<bool Function(MeshC, Pointer<Char>)>();

  bool ExportMeshAsCode(MeshC mesh, Pointer<Char> fileName)
    => _ExportMeshAsCode(mesh, fileName);
  late final _ExportMeshAsCodePtr = _lookup<NativeFunction<Bool Function(MeshC, Pointer<Char>)>>('ExportMeshAsCode');
  late final _ExportMeshAsCode = _ExportMeshAsCodePtr.asFunction<bool Function(MeshC, Pointer<Char>)>();

  MeshC GenMeshPoly(int sides, double radius)
    => _GenMeshPoly(sides, radius);
  late final _GenMeshPolyPtr = _lookup<NativeFunction<MeshC Function(Int, Float)>>('GenMeshPoly');
  late final _GenMeshPoly = _GenMeshPolyPtr.asFunction<MeshC Function(int, double)>();

  MeshC GenMeshPlane(double width, double length, int resX, int resZ)
    => _GenMeshPlane(width, length, resX, resZ);
  late final _GenMeshPlanePtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int, Int)>>('GenMeshPlane');
  late final _GenMeshPlane = _GenMeshPlanePtr.asFunction<MeshC Function(double, double, int, int)>();

  MeshC GenMeshCube(double width, double height, double length)
    => _GenMeshCube(width, height, length);
  late final _GenMeshCubePtr = _lookup<NativeFunction<MeshC Function(Float, Float, Float)>>('GenMeshCube');
  late final _GenMeshCube = _GenMeshCubePtr.asFunction<MeshC Function(double, double, double)>();

  MeshC GenMeshSphere(double radius, int rings, int slices)
    => _GenMeshSphere(radius, rings, slices);
  late final _GenMeshSpherePtr = _lookup<NativeFunction<MeshC Function(Float, Int, Int)>>('GenMeshSphere');
  late final _GenMeshSphere = _GenMeshSpherePtr.asFunction<MeshC Function(double, int, int)>();

  MeshC GenMeshHemiSphere(double radius, int rings, int slices)
    => _GenMeshHemiSphere(radius, rings, slices);
  late final _GenMeshHemiSpherePtr = _lookup<NativeFunction<MeshC Function(Float, Int, Int)>>('GenMeshHemiSphere');
  late final _GenMeshHemiSphere = _GenMeshHemiSpherePtr.asFunction<MeshC Function(double, int, int)>();

  MeshC GenMeshCylinder(double radius, double height, int slices)
    => _GenMeshCylinder(radius, height, slices);
  late final _GenMeshCylinderPtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int)>>('GenMeshCylinder');
  late final _GenMeshCylinder = _GenMeshCylinderPtr.asFunction<MeshC Function(double, double, int)>();

  MeshC GenMeshCone(double radius, double height, int slices)
    => _GenMeshCone(radius, height, slices);
  late final _GenMeshConePtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int)>>('GenMeshCone');
  late final _GenMeshCone = _GenMeshConePtr.asFunction<MeshC Function(double, double, int)>();

  MeshC GenMeshTorus(double radius, double size, int radSeg, int sides)
    => _GenMeshTorus(radius, size, radSeg, sides);
  late final _GenMeshTorusPtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int, Int)>>('GenMeshTorus');
  late final _GenMeshTorus = _GenMeshTorusPtr.asFunction<MeshC Function(double, double, int, int)>();

  MeshC GenMeshKnot(double radius, double size, int radSeg, int sides)
    => _GenMeshKnot(radius, size, radSeg, sides);
  late final _GenMeshKnotPtr = _lookup<NativeFunction<MeshC Function(Float, Float, Int, Int)>>('GenMeshKnot');
  late final _GenMeshKnot = _GenMeshKnotPtr.asFunction<MeshC Function(double, double, int, int)>();

  MeshC GenMeshHeightmap(ImageC heightmap, Vector3C size)
    => _GenMeshHeightmap(heightmap, size);
  late final _GenMeshHeightmapPtr = _lookup<NativeFunction<MeshC Function(ImageC, Vector3C)>>('GenMeshHeightmap');
  late final _GenMeshHeightmap = _GenMeshHeightmapPtr.asFunction<MeshC Function(ImageC, Vector3C)>();

  MeshC GenMeshCubicmap(ImageC cubicmap, Vector3C cubeSize)
    => _GenMeshCubicmap(cubicmap, cubeSize);
  late final _GenMeshCubicmapPtr = _lookup<NativeFunction<MeshC Function(ImageC, Vector3C)>>('GenMeshCubicmap');
  late final _GenMeshCubicmap = _GenMeshCubicmapPtr.asFunction<MeshC Function(ImageC, Vector3C)>();

  Pointer<MaterialC> LoadMaterials(Pointer<Char> fileName, Pointer<Int> materialCount)
    => _LoadMaterials(fileName, materialCount);
  late final _LoadMaterialsPtr = _lookup<NativeFunction<Pointer<MaterialC> Function(Pointer<Char>, Pointer<Int>)>>('LoadMaterials');
  late final _LoadMaterials = _LoadMaterialsPtr.asFunction<Pointer<MaterialC> Function(Pointer<Char>, Pointer<Int>)>();

  MaterialC LoadMaterialDefault()
    => _LoadMaterialDefault();
  late final _LoadMaterialDefaultPtr = _lookup<NativeFunction<MaterialC Function()>>('LoadMaterialDefault');
  late final _LoadMaterialDefault = _LoadMaterialDefaultPtr.asFunction<MaterialC Function()>();

  bool IsMaterialValid(MaterialC material)
    => _IsMaterialValid(material);
  late final _IsMaterialValidPtr = _lookup<NativeFunction<Bool Function(MaterialC)>>('IsMaterialValid');
  late final _IsMaterialValid = _IsMaterialValidPtr.asFunction<bool Function(MaterialC)>();

  void UnloadMaterial(MaterialC material)
    => _UnloadMaterial(material);
  late final _UnloadMaterialPtr = _lookup<NativeFunction<Void Function(MaterialC)>>('UnloadMaterial');
  late final _UnloadMaterial = _UnloadMaterialPtr.asFunction<void Function(MaterialC)>();

  void SetMaterialTexture(Pointer<MaterialC> material, int mapType, TextureC texture)
    => _SetMaterialTexture(material, mapType, texture);
  late final _SetMaterialTexturePtr = _lookup<NativeFunction<Void Function(Pointer<MaterialC>, Int, TextureC)>>('SetMaterialTexture');
  late final _SetMaterialTexture = _SetMaterialTexturePtr.asFunction<void Function(Pointer<MaterialC>, int, TextureC)>();

  void SetModelMeshMaterial(Pointer<ModelC> model, int meshId, int materialId)
    => _SetModelMeshMaterial(model, meshId, materialId);
  late final _SetModelMeshMaterialPtr = _lookup<NativeFunction<Void Function(Pointer<ModelC>, Int, Int)>>('SetModelMeshMaterial');
  late final _SetModelMeshMaterial = _SetModelMeshMaterialPtr.asFunction<void Function(Pointer<ModelC>, int, int)>();

  Pointer<ModelAnimationC> LoadModelAnimations(Pointer<Char> fileName, Pointer<Int> animCount)
    => _LoadModelAnimations(fileName, animCount);
  late final _LoadModelAnimationsPtr = _lookup<NativeFunction<Pointer<ModelAnimationC> Function(Pointer<Char>, Pointer<Int>)>>('LoadModelAnimations');
  late final _LoadModelAnimations = _LoadModelAnimationsPtr.asFunction<Pointer<ModelAnimationC> Function(Pointer<Char>, Pointer<Int>)>();

  void UpdateModelAnimation(ModelC model, ModelAnimationC anim, double frame)
    => _UpdateModelAnimation(model, anim, frame);
  late final _UpdateModelAnimationPtr = _lookup<NativeFunction<Void Function(ModelC, ModelAnimationC, Float)>>('UpdateModelAnimation');
  late final _UpdateModelAnimation = _UpdateModelAnimationPtr.asFunction<void Function(ModelC, ModelAnimationC, double)>();

  void UpdateModelAnimationEx(ModelC model, ModelAnimationC animA, double frameA, ModelAnimationC animB, double frameB, double blend)
    => _UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend);
  late final _UpdateModelAnimationExPtr = _lookup<NativeFunction<Void Function(ModelC, ModelAnimationC, Float, ModelAnimationC, Float, Float)>>('UpdateModelAnimationEx');
  late final _UpdateModelAnimationEx = _UpdateModelAnimationExPtr.asFunction<void Function(ModelC, ModelAnimationC, double, ModelAnimationC, double, double)>();

  void UnloadModelAnimations(Pointer<ModelAnimationC> animations, int animCount)
    => _UnloadModelAnimations(animations, animCount);
  late final _UnloadModelAnimationsPtr = _lookup<NativeFunction<Void Function(Pointer<ModelAnimationC>, Int)>>('UnloadModelAnimations');
  late final _UnloadModelAnimations = _UnloadModelAnimationsPtr.asFunction<void Function(Pointer<ModelAnimationC>, int)>();

  bool IsModelAnimationValid(ModelC model, ModelAnimationC anim)
    => _IsModelAnimationValid(model, anim);
  late final _IsModelAnimationValidPtr = _lookup<NativeFunction<Bool Function(ModelC, ModelAnimationC)>>('IsModelAnimationValid');
  late final _IsModelAnimationValid = _IsModelAnimationValidPtr.asFunction<bool Function(ModelC, ModelAnimationC)>();

  bool CheckCollisionSpheres(Vector3C center1, double radius1, Vector3C center2, double radius2)
    => _CheckCollisionSpheres(center1, radius1, center2, radius2);
  late final _CheckCollisionSpheresPtr = _lookup<NativeFunction<Bool Function(Vector3C, Float, Vector3C, Float)>>('CheckCollisionSpheres');
  late final _CheckCollisionSpheres = _CheckCollisionSpheresPtr.asFunction<bool Function(Vector3C, double, Vector3C, double)>();

  bool CheckCollisionBoxes(BoundingBoxC box1, BoundingBoxC box2)
    => _CheckCollisionBoxes(box1, box2);
  late final _CheckCollisionBoxesPtr = _lookup<NativeFunction<Bool Function(BoundingBoxC, BoundingBoxC)>>('CheckCollisionBoxes');
  late final _CheckCollisionBoxes = _CheckCollisionBoxesPtr.asFunction<bool Function(BoundingBoxC, BoundingBoxC)>();

  bool CheckCollisionBoxSphere(BoundingBoxC box, Vector3C center, double radius)
    => _CheckCollisionBoxSphere(box, center, radius);
  late final _CheckCollisionBoxSpherePtr = _lookup<NativeFunction<Bool Function(BoundingBoxC, Vector3C, Float)>>('CheckCollisionBoxSphere');
  late final _CheckCollisionBoxSphere = _CheckCollisionBoxSpherePtr.asFunction<bool Function(BoundingBoxC, Vector3C, double)>();

  RayCollisionC GetRayCollisionSphere(RayC ray, Vector3C center, double radius)
    => _GetRayCollisionSphere(ray, center, radius);
  late final _GetRayCollisionSpherePtr = _lookup<NativeFunction<RayCollisionC Function(RayC, Vector3C, Float)>>('GetRayCollisionSphere');
  late final _GetRayCollisionSphere = _GetRayCollisionSpherePtr.asFunction<RayCollisionC Function(RayC, Vector3C, double)>();

  RayCollisionC GetRayCollisionBox(RayC ray, BoundingBoxC box)
    => _GetRayCollisionBox(ray, box);
  late final _GetRayCollisionBoxPtr = _lookup<NativeFunction<RayCollisionC Function(RayC, BoundingBoxC)>>('GetRayCollisionBox');
  late final _GetRayCollisionBox = _GetRayCollisionBoxPtr.asFunction<RayCollisionC Function(RayC, BoundingBoxC)>();

  RayCollisionC GetRayCollisionMesh(RayC ray, MeshC mesh, MatrixC transform)
    => _GetRayCollisionMesh(ray, mesh, transform);
  late final _GetRayCollisionMeshPtr = _lookup<NativeFunction<RayCollisionC Function(RayC, MeshC, MatrixC)>>('GetRayCollisionMesh');
  late final _GetRayCollisionMesh = _GetRayCollisionMeshPtr.asFunction<RayCollisionC Function(RayC, MeshC, MatrixC)>();

  RayCollisionC GetRayCollisionTriangle(RayC ray, Vector3C p1, Vector3C p2, Vector3C p3)
    => _GetRayCollisionTriangle(ray, p1, p2, p3);
  late final _GetRayCollisionTrianglePtr = _lookup<NativeFunction<RayCollisionC Function(RayC, Vector3C, Vector3C, Vector3C)>>('GetRayCollisionTriangle');
  late final _GetRayCollisionTriangle = _GetRayCollisionTrianglePtr.asFunction<RayCollisionC Function(RayC, Vector3C, Vector3C, Vector3C)>();

  RayCollisionC GetRayCollisionQuad(RayC ray, Vector3C p1, Vector3C p2, Vector3C p3, Vector3C p4)
    => _GetRayCollisionQuad(ray, p1, p2, p3, p4);
  late final _GetRayCollisionQuadPtr = _lookup<NativeFunction<RayCollisionC Function(RayC, Vector3C, Vector3C, Vector3C, Vector3C)>>('GetRayCollisionQuad');
  late final _GetRayCollisionQuad = _GetRayCollisionQuadPtr.asFunction<RayCollisionC Function(RayC, Vector3C, Vector3C, Vector3C, Vector3C)>();
}
