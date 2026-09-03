part of '../../../raylib_dartified.dart';

class RaylibCoreFlat extends RaylibCoreFlatModule<Raylib> {

  RaylibCoreFlat(super.rl);

  @override
  void InitWindow(
    int width,
    int height,
    MemoryPointer<RChar> title,
  ) => rl.Core.InitWindow(
    width,
    height,
    title.asNativePointer(),
  );

  @override
  void CloseWindow() => rl.Core.CloseWindow();

  @override
  bool WindowShouldClose() => rl.Core.WindowShouldClose();

  @override
  bool IsWindowReady() => rl.Core.IsWindowReady();

  @override
  bool IsWindowFullscreen() => rl.Core.IsWindowFullscreen();

  @override
  bool IsWindowHidden() => rl.Core.IsWindowHidden();

  @override
  bool IsWindowMinimized() => rl.Core.IsWindowMinimized();

  @override
  bool IsWindowMaximized() => rl.Core.IsWindowMaximized();

  @override
  bool IsWindowFocused() => rl.Core.IsWindowFocused();

  @override
  bool IsWindowResized() => rl.Core.IsWindowResized();

  @override
  bool IsWindowState(
    int flag,
  ) => rl.Core.IsWindowState(
    flag,
  );

  @override
  void SetWindowState(
    int flags,
  ) => rl.Core.SetWindowState(
    flags,
  );

  @override
  void ClearWindowState(
    int flags,
  ) => rl.Core.ClearWindowState(
    flags,
  );

  @override
  void ToggleFullscreen() => rl.Core.ToggleFullscreen();

  @override
  void ToggleBorderlessWindowed() => rl.Core.ToggleBorderlessWindowed();

  @override
  void MaximizeWindow() => rl.Core.MaximizeWindow();

  @override
  void MinimizeWindow() => rl.Core.MinimizeWindow();

  @override
  void RestoreWindow() => rl.Core.RestoreWindow();

  @override
  void SetWindowIcon(
    ImageD image,
  ) => rl.Core.SetWindowIcon(
    rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
  );

  @override
  void SetWindowIcons(
    StructPointer<ImageD> images,
    int count,
  ) => rl.Core.SetWindowIcons(
    images.asNativePointer(),
    count,
  );

  @override
  void SetWindowTitle(
    MemoryPointer<RChar> title,
  ) => rl.Core.SetWindowTitle(
    title.asNativePointer(),
  );

  @override
  void SetWindowPosition(
    int x,
    int y,
  ) => rl.Core.SetWindowPosition(
    x,
    y,
  );

  @override
  void SetWindowMonitor(
    int monitor,
  ) => rl.Core.SetWindowMonitor(
    monitor,
  );

  @override
  void SetWindowMinSize(
    int width,
    int height,
  ) => rl.Core.SetWindowMinSize(
    width,
    height,
  );

  @override
  void SetWindowMaxSize(
    int width,
    int height,
  ) => rl.Core.SetWindowMaxSize(
    width,
    height,
  );

  @override
  void SetWindowSize(
    int width,
    int height,
  ) => rl.Core.SetWindowSize(
    width,
    height,
  );

  @override
  void SetWindowOpacity(
    double opacity,
  ) => rl.Core.SetWindowOpacity(
    opacity,
  );

  @override
  void SetWindowFocused() => rl.Core.SetWindowFocused();

  @override
  NativeMemoryPointer<RVoid> GetWindowHandle() => rl.Core.GetWindowHandle().asMemoryPointer();

  @override
  int GetScreenWidth() => rl.Core.GetScreenWidth();

  @override
  int GetScreenHeight() => rl.Core.GetScreenHeight();

  @override
  int GetRenderWidth() => rl.Core.GetRenderWidth();

  @override
  int GetRenderHeight() => rl.Core.GetRenderHeight();

  @override
  int GetMonitorCount() => rl.Core.GetMonitorCount();

  @override
  int GetCurrentMonitor() => rl.Core.GetCurrentMonitor();

  @override
  Vector2D GetMonitorPosition(
    int monitor,
  ) => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetMonitorPosition(
      monitor,
    ).toDart(p.asNativePointer()),
  );

  @override
  int GetMonitorWidth(
    int monitor,
  ) => rl.Core.GetMonitorWidth(
    monitor,
  );

  @override
  int GetMonitorHeight(
    int monitor,
  ) => rl.Core.GetMonitorHeight(
    monitor,
  );

  @override
  int GetMonitorPhysicalWidth(
    int monitor,
  ) => rl.Core.GetMonitorPhysicalWidth(
    monitor,
  );

  @override
  int GetMonitorPhysicalHeight(
    int monitor,
  ) => rl.Core.GetMonitorPhysicalHeight(
    monitor,
  );

  @override
  int GetMonitorRefreshRate(
    int monitor,
  ) => rl.Core.GetMonitorRefreshRate(
    monitor,
  );

  @override
  Vector2D GetWindowPosition() => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetWindowPosition().toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetWindowScaleDPI() => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetWindowScaleDPI().toDart(p.asNativePointer()),
  );

  @override
  NativeMemoryPointer<RChar> GetMonitorName(
    int monitor,
  ) => rl.Core.GetMonitorName(
    monitor,
  ).asMemoryPointer();

  @override
  void SetClipboardText(
    MemoryPointer<RChar> text,
  ) => rl.Core.SetClipboardText(
    text.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> GetClipboardText() => rl.Core.GetClipboardText().asMemoryPointer();

  @override
  ImageD GetClipboardImage() => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GetClipboardImage,
    (p) => rl.Core.GetClipboardImage().toDart(p.asNativePointer()),
  );

  @override
  void EnableEventWaiting() => rl.Core.EnableEventWaiting();

  @override
  void DisableEventWaiting() => rl.Core.DisableEventWaiting();

  @override
  void ShowCursor() => rl.Core.ShowCursor();

  @override
  void HideCursor() => rl.Core.HideCursor();

  @override
  bool IsCursorHidden() => rl.Core.IsCursorHidden();

  @override
  void EnableCursor() => rl.Core.EnableCursor();

  @override
  void DisableCursor() => rl.Core.DisableCursor();

  @override
  bool IsCursorOnScreen() => rl.Core.IsCursorOnScreen();

  @override
  void ClearBackground(
    ColorD color,
  ) => rl.Core.ClearBackground(
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void BeginDrawing() => rl.Core.BeginDrawing();

  @override
  void EndDrawing() => rl.Core.EndDrawing();

  @override
  void BeginMode2D(
    Camera2DD camera,
  ) => rl.Core.BeginMode2D(
    rl.Temp.Camera2D$.Ref1(camera).asNativePointer<Camera2DC>().ref,
  );

  @override
  void EndMode2D() => rl.Core.EndMode2D();

  @override
  void BeginMode3D(
    Camera3DD camera,
  ) => rl.Core.BeginMode3D(
    rl.Temp.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
  );

  @override
  void EndMode3D() => rl.Core.EndMode3D();

  @override
  void BeginTextureMode(
    RenderTextureD target,
  ) => rl.Core.BeginTextureMode(
    rl.Temp.RenderTexture$.Ref1(target).asNativePointer<RenderTextureC>().ref,
  );

  @override
  void EndTextureMode() => rl.Core.EndTextureMode();

  @override
  void BeginShaderMode(
    ShaderD shader,
  ) => rl.Core.BeginShaderMode(
    rl.Temp.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
  );

  @override
  void EndShaderMode() => rl.Core.EndShaderMode();

  @override
  void BeginBlendMode(
    int mode,
  ) => rl.Core.BeginBlendMode(
    mode,
  );

  @override
  void EndBlendMode() => rl.Core.EndBlendMode();

  @override
  void BeginScissorMode(
    int x,
    int y,
    int width,
    int height,
  ) => rl.Core.BeginScissorMode(
    x,
    y,
    width,
    height,
  );

  @override
  void EndScissorMode() => rl.Core.EndScissorMode();

  @override
  void BeginVrStereoMode(
    VrStereoConfigD config,
  ) => rl.Core.BeginVrStereoMode(
    rl.Temp.VrStereoConfig$.Ref1(config).asNativePointer<VrStereoConfigC>().ref,
  );

  @override
  void EndVrStereoMode() => rl.Core.EndVrStereoMode();

  @override
  VrStereoConfigD LoadVrStereoConfig(
    VrDeviceInfoD device,
  ) => rl.Temp.VrStereoConfig$.RefCapture(
    RaylibCaptureIds.LoadVrStereoConfig,
    (p) => rl.Core.LoadVrStereoConfig(
      rl.Temp.VrDeviceInfo$.Ref1(device).asNativePointer<VrDeviceInfoC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void UnloadVrStereoConfig(
    VrStereoConfigD config,
  ) => rl.Core.UnloadVrStereoConfig(
    config.getOpAndDispose().asNativePointer<VrStereoConfigC>().ref,
  );

  @override
  ShaderD LoadShader(
    MemoryPointer<RChar> vsFileName,
    MemoryPointer<RChar> fsFileName,
  ) => rl.Temp.Shader$.RefCapture(
    RaylibCaptureIds.LoadShader,
    (p) => rl.Core.LoadShader(
      vsFileName.asNativePointer(),
      fsFileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  ShaderD LoadShaderFromMemory(
    MemoryPointer<RChar> vsCode,
    MemoryPointer<RChar> fsCode,
  ) => rl.Temp.Shader$.RefCapture(
    RaylibCaptureIds.LoadShaderFromMemory,
    (p) => rl.Core.LoadShaderFromMemory(
      vsCode.asNativePointer(),
      fsCode.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  bool IsShaderValid(
    ShaderD shader,
  ) => rl.Core.IsShaderValid(
    rl.Temp.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
  );

  @override
  int GetShaderLocation(
    ShaderD shader,
    MemoryPointer<RChar> uniformName,
  ) => rl.Core.GetShaderLocation(
    rl.Temp.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    uniformName.asNativePointer(),
  );

  @override
  int GetShaderLocationAttrib(
    ShaderD shader,
    MemoryPointer<RChar> attribName,
  ) => rl.Core.GetShaderLocationAttrib(
    rl.Temp.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    attribName.asNativePointer(),
  );

  @override
  void SetShaderValueV(
    ShaderD shader,
    int locIndex,
    MemoryPointer<RVoid> value,
    int uniformType,
    int count,
  ) => rl.Core.SetShaderValueV(
    rl.Temp.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    locIndex,
    value.asNativePointer(),
    uniformType,
    count,
  );

  @override
  void SetShaderValueMatrix(
    ShaderD shader,
    int locIndex,
    MatrixD mat,
  ) => rl.Core.SetShaderValueMatrix(
    rl.Temp.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    locIndex,
    rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
  );

  @override
  void SetShaderValueTexture(
    ShaderD shader,
    int locIndex,
    TextureD texture,
  ) => rl.Core.SetShaderValueTexture(
    rl.Temp.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    locIndex,
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
  );

  @override
  void UnloadShader(
    ShaderD shader,
  ) => rl.Core.UnloadShader(
    shader.getOpAndDispose().asNativePointer<ShaderC>().ref,
  );

  @override
  RayD GetScreenToWorldRay(
    Vector2D position,
    Camera3DD camera,
  ) => rl.Temp.Ray$.Extract1(
    (p) => rl.Core.GetScreenToWorldRay(
      rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
      rl.Temp.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayD GetScreenToWorldRayEx(
    Vector2D position,
    Camera3DD camera,
    int width,
    int height,
  ) => rl.Temp.Ray$.Extract1(
    (p) => rl.Core.GetScreenToWorldRayEx(
      rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
      rl.Temp.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
      width,
      height,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetWorldToScreen(
    Vector3D position,
    Camera3DD camera,
  ) => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetWorldToScreen(
      rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
      rl.Temp.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetWorldToScreenEx(
    Vector3D position,
    Camera3DD camera,
    int width,
    int height,
  ) => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetWorldToScreenEx(
      rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
      rl.Temp.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
      width,
      height,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => rl.Core.GetWorldToScreen2D(
      rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
      rl.Temp.Camera2D$.Ref1(camera).asNativePointer<Camera2DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  ) => rl.Temp.Vector2$.Extract2(
    (p) => rl.Core.GetScreenToWorld2D(
      rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
      rl.Temp.Camera2D$.Ref1(camera).asNativePointer<Camera2DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD GetCameraMatrix(
    Camera3DD camera,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => rl.Core.GetCameraMatrix(
      rl.Temp.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD GetCameraMatrix2D(
    Camera2DD camera,
  ) => rl.Temp.Matrix$.Extract1(
    (p) => rl.Core.GetCameraMatrix2D(
      rl.Temp.Camera2D$.Ref1(camera).asNativePointer<Camera2DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void SetTargetFPS(
    int fps,
  ) => rl.Core.SetTargetFPS(
    fps,
  );

  @override
  double GetFrameTime() => rl.Core.GetFrameTime();

  @override
  double GetTime() => rl.Core.GetTime();

  @override
  int GetFPS() => rl.Core.GetFPS();

  @override
  void SwapScreenBuffer() => rl.Core.SwapScreenBuffer();

  @override
  void PollInputEvents() => rl.Core.PollInputEvents();

  @override
  void WaitTime(
    double seconds,
  ) => rl.Core.WaitTime(
    seconds,
  );

  @override
  void SetRandomSeed(
    int seed,
  ) => rl.Core.SetRandomSeed(
    seed,
  );

  @override
  int GetRandomValue(
    int min,
    int max,
  ) => rl.Core.GetRandomValue(
    min,
    max,
  );

  @override
  NativeMemoryPointer<RInt> LoadRandomSequence(
    int count,
    int min,
    int max,
  ) => rl.Core.LoadRandomSequence(
    count,
    min,
    max,
  ).asMemoryPointer();

  @override
  void UnloadRandomSequence(
    MemoryPointer<RInt> sequence,
  ) => rl.Core.UnloadRandomSequence(
    sequence.asNativePointer(),
  );

  @override
  void TakeScreenshot(
    MemoryPointer<RChar> fileName,
  ) => rl.Core.TakeScreenshot(
    fileName.asNativePointer(),
  );

  @override
  void SetConfigFlags(
    int flags,
  ) => rl.Core.SetConfigFlags(
    flags,
  );

  @override
  void OpenURL(
    MemoryPointer<RChar> url,
  ) => rl.Core.OpenURL(
    url.asNativePointer(),
  );

  @override
  void TraceLog(
    int logLevel,
    MemoryPointer<RChar> text,
    // NOTE: missing va_list argument
  ) => rl.Core.TraceLog(
    logLevel,
    text.asNativePointer(),
  );

  @override
  void SetTraceLogLevel(
    int logLevel,
  ) => rl.Core.SetTraceLogLevel(
    logLevel,
  );

  @override
  void SetTraceLogCallback(
    MemoryPointer<RFunction<TraceLogCallbackBase>> callback,
  ) => rl.Core.SetTraceLogCallback(
    callback.asNativePointer(),
  );

  @override
  void SetLoadFileDataCallback(
    MemoryPointer<RFunction<LoadFileDataCallbackBase>> callback,
  ) => rl.Core.SetLoadFileDataCallback(
    callback.asNativePointer(),
  );

  @override
  void SetSaveFileDataCallback(
    MemoryPointer<RFunction<SaveFileDataCallbackBase>> callback,
  ) => rl.Core.SetSaveFileDataCallback(
    callback.asNativePointer(),
  );

  @override
  void SetLoadFileTextCallback(
    MemoryPointer<RFunction<LoadFileTextCallbackBase>> callback,
  ) => rl.Core.SetLoadFileTextCallback(
    callback.asNativePointer(),
  );

  @override
  void SetSaveFileTextCallback(
    MemoryPointer<RFunction<SaveFileTextCallbackBase>> callback,
  ) => rl.Core.SetSaveFileTextCallback(
    callback.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RUnsignedChar> LoadFileData(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> dataSize,
  ) => rl.Core.LoadFileData(
    fileName.asNativePointer(),
    dataSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  void UnloadFileData(
    MemoryPointer<RUnsignedChar> data,
  ) => rl.Core.UnloadFileData(
    data.asNativePointer(),
  );

  @override
  bool SaveFileData(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RVoid> data,
    int dataSize,
  ) => rl.Core.SaveFileData(
    fileName.asNativePointer(),
    data.asNativePointer(),
    dataSize,
  );

  @override
  bool ExportDataAsCode(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
    MemoryPointer<RChar> fileName,
  ) => rl.Core.ExportDataAsCode(
    data.asNativePointer(),
    dataSize,
    fileName.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> LoadFileText(
    MemoryPointer<RChar> fileName,
  ) => rl.Core.LoadFileText(
    fileName.asNativePointer(),
  ).asMemoryPointer();

  @override
  void UnloadFileText(
    MemoryPointer<RChar> text,
  ) => rl.Core.UnloadFileText(
    text.asNativePointer(),
  );

  @override
  bool SaveFileText(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> text,
  ) => rl.Core.SaveFileText(
    fileName.asNativePointer(),
    text.asNativePointer(),
  );

  @override
  int FileRename(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> fileRename,
  ) => rl.Core.FileRename(
    fileName.asNativePointer(),
    fileRename.asNativePointer(),
  );

  @override
  int FileRemove(
    MemoryPointer<RChar> fileName,
  ) => rl.Core.FileRemove(
    fileName.asNativePointer(),
  );

  @override
  int FileCopy(
    MemoryPointer<RChar> srcPath,
    MemoryPointer<RChar> dstPath,
  ) => rl.Core.FileCopy(
    srcPath.asNativePointer(),
    dstPath.asNativePointer(),
  );

  @override
  int FileMove(
    MemoryPointer<RChar> srcPath,
    MemoryPointer<RChar> dstPath,
  ) => rl.Core.FileMove(
    srcPath.asNativePointer(),
    dstPath.asNativePointer(),
  );

  @override
  int FileTextReplace(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> search,
    MemoryPointer<RChar> replacement,
  ) => rl.Core.FileTextReplace(
    fileName.asNativePointer(),
    search.asNativePointer(),
    replacement.asNativePointer(),
  );

  @override
  int FileTextFindIndex(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> search,
  ) => rl.Core.FileTextFindIndex(
    fileName.asNativePointer(),
    search.asNativePointer(),
  );

  @override
  bool FileExists(
    MemoryPointer<RChar> fileName,
  ) => rl.Core.FileExists(
    fileName.asNativePointer(),
  );

  @override
  bool DirectoryExists(
    MemoryPointer<RChar> dirPath,
  ) => rl.Core.DirectoryExists(
    dirPath.asNativePointer(),
  );

  @override
  bool IsFileExtension(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> ext,
  ) => rl.Core.IsFileExtension(
    fileName.asNativePointer(),
    ext.asNativePointer(),
  );

  @override
  int GetFileLength(
    MemoryPointer<RChar> fileName,
  ) => rl.Core.GetFileLength(
    fileName.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> GetFileExtension(
    MemoryPointer<RChar> fileName,
  ) => rl.Core.GetFileExtension(
    fileName.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetFileName(
    MemoryPointer<RChar> filePath,
  ) => rl.Core.GetFileName(
    filePath.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetFileNameWithoutExt(
    MemoryPointer<RChar> filePath,
  ) => rl.Core.GetFileNameWithoutExt(
    filePath.asNativePointer(),
  ).asMemoryPointer();

  @override
  int GetDirectoryFileCount(
    MemoryPointer<RChar> dirPath,
  ) => rl.Core.GetDirectoryFileCount(
    dirPath.asNativePointer(),
  );

  @override
  int GetDirectoryFileCountEx(
    MemoryPointer<RChar> basePath,
    MemoryPointer<RChar> filter,
    bool scanSubdirs,
  ) => rl.Core.GetDirectoryFileCountEx(
    basePath.asNativePointer(),
    filter.asNativePointer(),
    scanSubdirs,
  );

  @override
  NativeMemoryPointer<RChar> GetDirectoryPath(
    MemoryPointer<RChar> filePath,
  ) => rl.Core.GetDirectoryPath(
    filePath.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetPrevDirectoryPath(
    MemoryPointer<RChar> dirPath,
  ) => rl.Core.GetPrevDirectoryPath(
    dirPath.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetWorkingDirectory() => rl.Core.GetWorkingDirectory().asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetApplicationDirectory() => rl.Core.GetApplicationDirectory().asMemoryPointer();

  @override
  int MakeDirectory(
    MemoryPointer<RChar> dirPath,
  ) => rl.Core.MakeDirectory(
    dirPath.asNativePointer(),
  );

  @override
  bool ChangeDirectory(
    MemoryPointer<RChar> dir,
  ) => rl.Core.ChangeDirectory(
    dir.asNativePointer(),
  );

  @override
  bool IsPathFile(
    MemoryPointer<RChar> path,
  ) => rl.Core.IsPathFile(
    path.asNativePointer(),
  );

  @override
  bool IsFileNameValid(
    MemoryPointer<RChar> fileName,
  ) => rl.Core.IsFileNameValid(
    fileName.asNativePointer(),
  );

  @override
  FilePathListD LoadDirectoryFiles(
    MemoryPointer<RChar> dirPath,
  ) => rl.Temp.FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDirectoryFiles,
    (p) => rl.Core.LoadDirectoryFiles(
      dirPath.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  FilePathListD LoadDirectoryFilesEx(
    MemoryPointer<RChar> basePath,
    MemoryPointer<RChar> filter,
    bool scanSubdirs,
  ) => rl.Temp.FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDirectoryFilesEx,
    (p) => rl.Core.LoadDirectoryFilesEx(
      basePath.asNativePointer(),
      filter.asNativePointer(),
      scanSubdirs,
    ).toDart(p.asNativePointer()),
  );

  @override
  void UnloadDirectoryFiles(
    FilePathListD files,
  ) => rl.Core.UnloadDirectoryFiles(
    files.getOpAndDispose().asNativePointer<FilePathListC>().ref,
  );

  @override
  bool IsFileDropped() => rl.Core.IsFileDropped();

  @override
  FilePathListD LoadDroppedFiles() => rl.Temp.FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDroppedFiles,
    (p) => rl.Core.LoadDroppedFiles().toDart(p.asNativePointer()),
  );

  @override
  void UnloadDroppedFiles(
    FilePathListD files,
  ) => rl.Core.UnloadDroppedFiles(
    files.getOpAndDispose().asNativePointer<FilePathListC>().ref,
  );

  @override
  int GetFileModTime(
    MemoryPointer<RChar> fileName,
  ) => rl.Core.GetFileModTime(
    fileName.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RUnsignedChar> CompressData(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
    MemoryPointer<RInt> compDataSize,
  ) => rl.Core.CompressData(
    data.asNativePointer(),
    dataSize,
    compDataSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RUnsignedChar> DecompressData(
    MemoryPointer<RUnsignedChar> compData,
    int compDataSize,
    MemoryPointer<RInt> dataSize,
  ) => rl.Core.DecompressData(
    compData.asNativePointer(),
    compDataSize,
    dataSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> EncodeDataBase64(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
    MemoryPointer<RInt> outputSize,
  ) => rl.Core.EncodeDataBase64(
    data.asNativePointer(),
    dataSize,
    outputSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RUnsignedChar> DecodeDataBase64(
    MemoryPointer<RChar> data,
    MemoryPointer<RInt> outputSize,
  ) => rl.Core.DecodeDataBase64(
    data.asNativePointer(),
    outputSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  int ComputeCRC32(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => rl.Core.ComputeCRC32(
    data.asNativePointer(),
    dataSize,
  );

  @override
  NativeMemoryPointer<RUnsignedInt> ComputeMD5(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => rl.Core.ComputeMD5(
    data.asNativePointer(),
    dataSize,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RUnsignedInt> ComputeSHA1(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => rl.Core.ComputeSHA1(
    data.asNativePointer(),
    dataSize,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RUnsignedInt> ComputeSHA256(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => rl.Core.ComputeSHA256(
    data.asNativePointer(),
    dataSize,
  ).asMemoryPointer();

  @override
  AutomationEventListD LoadAutomationEventList(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.AutomationEventList$.RefCapture(
    RaylibCaptureIds.LoadAutomationEventList,
    (p) => rl.Core.LoadAutomationEventList(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  void UnloadAutomationEventList(
    AutomationEventListD list,
  ) => rl.Core.UnloadAutomationEventList(
    list.getOpAndDispose().asNativePointer<AutomationEventListC>().ref,
  );

  @override
  bool ExportAutomationEventList(
    AutomationEventListD list,
    MemoryPointer<RChar> fileName,
  ) => rl.Core.ExportAutomationEventList(
    rl.Temp.AutomationEventList$.Ref1(list).asNativePointer<AutomationEventListC>().ref,
    fileName.asNativePointer(),
  );

  @override
  void SetAutomationEventList(
    StructPointer<AutomationEventListD> list,
  ) => rl.Core.SetAutomationEventList(
    list.asNativePointer(),
  );

  @override
  void SetAutomationEventBaseFrame(
    int frame,
  ) => rl.Core.SetAutomationEventBaseFrame(
    frame,
  );

  @override
  void StartAutomationEventRecording() => rl.Core.StartAutomationEventRecording();

  @override
  void StopAutomationEventRecording() => rl.Core.StopAutomationEventRecording();

  @override
  void PlayAutomationEvent(
    AutomationEventD event,
  ) => rl.Core.PlayAutomationEvent(
    rl.Temp.AutomationEvent$.Ref1(event).asNativePointer<AutomationEventC>().ref,
  );

  @override
  bool IsKeyPressed(
    int key,
  ) => rl.Core.IsKeyPressed(
    key,
  );

  @override
  bool IsKeyPressedRepeat(
    int key,
  ) => rl.Core.IsKeyPressedRepeat(
    key,
  );

  @override
  bool IsKeyDown(
    int key,
  ) => rl.Core.IsKeyDown(
    key,
  );

  @override
  bool IsKeyReleased(
    int key,
  ) => rl.Core.IsKeyReleased(
    key,
  );

  @override
  bool IsKeyUp(
    int key,
  ) => rl.Core.IsKeyUp(
    key,
  );

  @override
  NativeMemoryPointer<RChar> GetKeyName(
    int key,
  ) => rl.Core.GetKeyName(
    key,
  ).asMemoryPointer();

  @override
  int GetKeyPressed() => rl.Core.GetKeyPressed();

  @override
  int GetCharPressed() => rl.Core.GetCharPressed();

  @override
  void SetExitKey(
    int key,
  ) => rl.Core.SetExitKey(
    key,
  );

  @override
  bool IsGamepadAvailable(
    int gamepad,
  ) => rl.Core.IsGamepadAvailable(
    gamepad,
  );

  @override
  NativeMemoryPointer<RChar> GetGamepadName(
    int gamepad,
  ) => rl.Core.GetGamepadName(
    gamepad,
  ).asMemoryPointer();

  @override
  bool IsGamepadButtonPressed(
    int gamepad,
    int button,
  ) => rl.Core.IsGamepadButtonPressed(
    gamepad,
    button,
  );

  @override
  bool IsGamepadButtonDown(
    int gamepad,
    int button,
  ) => rl.Core.IsGamepadButtonDown(
    gamepad,
    button,
  );

  @override
  bool IsGamepadButtonReleased(
    int gamepad,
    int button,
  ) => rl.Core.IsGamepadButtonReleased(
    gamepad,
    button,
  );

  @override
  bool IsGamepadButtonUp(
    int gamepad,
    int button,
  ) => rl.Core.IsGamepadButtonUp(
    gamepad,
    button,
  );

  @override
  int GetGamepadButtonPressed() => rl.Core.GetGamepadButtonPressed();

  @override
  int GetGamepadAxisCount(
    int gamepad,
  ) => rl.Core.GetGamepadAxisCount(
    gamepad,
  );

  @override
  double GetGamepadAxisMovement(
    int gamepad,
    int axis,
  ) => rl.Core.GetGamepadAxisMovement(
    gamepad,
    axis,
  );

  @override
  int SetGamepadMappings(
    MemoryPointer<RChar> mappings,
  ) => rl.Core.SetGamepadMappings(
    mappings.asNativePointer(),
  );

  @override
  void SetGamepadVibration(
    int gamepad,
    double leftMotor,
    double rightMotor,
    double duration,
  ) => rl.Core.SetGamepadVibration(
    gamepad,
    leftMotor,
    rightMotor,
    duration,
  );

  @override
  bool IsMouseButtonPressed(
    int button,
  ) => rl.Core.IsMouseButtonPressed(
    button,
  );

  @override
  bool IsMouseButtonDown(
    int button,
  ) => rl.Core.IsMouseButtonDown(
    button,
  );

  @override
  bool IsMouseButtonReleased(
    int button,
  ) => rl.Core.IsMouseButtonReleased(
    button,
  );

  @override
  bool IsMouseButtonUp(
    int button,
  ) => rl.Core.IsMouseButtonUp(
    button,
  );

  @override
  int GetMouseX() => rl.Core.GetMouseX();

  @override
  int GetMouseY() => rl.Core.GetMouseY();

  @override
  Vector2D GetMousePosition() => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetMousePosition().toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetMouseDelta() => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetMouseDelta().toDart(p.asNativePointer()),
  );

  @override
  void SetMousePosition(
    int x,
    int y,
  ) => rl.Core.SetMousePosition(
    x,
    y,
  );

  @override
  void SetMouseOffset(
    int offsetX,
    int offsetY,
  ) => rl.Core.SetMouseOffset(
    offsetX,
    offsetY,
  );

  @override
  void SetMouseScale(
    double scaleX,
    double scaleY,
  ) => rl.Core.SetMouseScale(
    scaleX,
    scaleY,
  );

  @override
  double GetMouseWheelMove() => rl.Core.GetMouseWheelMove();

  @override
  Vector2D GetMouseWheelMoveV() => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetMouseWheelMoveV().toDart(p.asNativePointer()),
  );

  @override
  void SetMouseCursor(
    int cursor,
  ) => rl.Core.SetMouseCursor(
    cursor,
  );

  @override
  int GetTouchX() => rl.Core.GetTouchX();

  @override
  int GetTouchY() => rl.Core.GetTouchY();

  @override
  Vector2D GetTouchPosition(
    int index,
  ) => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetTouchPosition(
      index,
    ).toDart(p.asNativePointer()),
  );

  @override
  int GetTouchPointId(
    int index,
  ) => rl.Core.GetTouchPointId(
    index,
  );

  @override
  int GetTouchPointCount() => rl.Core.GetTouchPointCount();

  @override
  void SetGesturesEnabled(
    int flags,
  ) => rl.Core.SetGesturesEnabled(
    flags,
  );

  @override
  bool IsGestureDetected(
    int gesture,
  ) => rl.Core.IsGestureDetected(
    gesture,
  );

  @override
  int GetGestureDetected() => rl.Core.GetGestureDetected();

  @override
  double GetGestureHoldDuration() => rl.Core.GetGestureHoldDuration();

  @override
  Vector2D GetGestureDragVector() => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetGestureDragVector().toDart(p.asNativePointer()),
  );

  @override
  double GetGestureDragAngle() => rl.Core.GetGestureDragAngle();

  @override
  Vector2D GetGesturePinchVector() => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.GetGesturePinchVector().toDart(p.asNativePointer()),
  );

  @override
  double GetGesturePinchAngle() => rl.Core.GetGesturePinchAngle();

  @override
  void ProcessGestureEvent(
    GestureEventD event,
  ) => rl.Core.ProcessGestureEvent(
    rl.Temp.GestureEvent$.Ref1(event).asNativePointer<GestureEventC>().ref,
  );

  @override
  void UpdateGestures() => rl.Core.UpdateGestures();

  @override
  void UpdateCamera(
    StructPointer<Camera3DD> camera,
    int mode,
  ) => rl.Core.UpdateCamera(
    camera.asNativePointer(),
    mode,
  );

  @override
  void UpdateCameraPro(
    StructPointer<Camera3DD> camera,
    Vector3D movement,
    Vector3D rotation,
    double zoom,
  ) => rl.Core.UpdateCameraPro(
    camera.asNativePointer(),
    rl.Temp.Vector3$.Ref1(movement).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(rotation).asNativePointer<Vector3C>().ref,
    zoom,
  );

  @override
  void SetShapesTexture(
    TextureD texture,
    RectangleD source,
  ) => rl.Core.SetShapesTexture(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
  );

  @override
  TextureD GetShapesTexture() => rl.Temp.Texture$.Extract1(
    (p) => rl.Core.GetShapesTexture().toDart(p.asNativePointer()),
  );

  @override
  RectangleD GetShapesTextureRectangle() => rl.Temp.Rectangle$.Extract1(
    (p) => rl.Core.GetShapesTextureRectangle().toDart(p.asNativePointer()),
  );

  @override
  void DrawPixel(
    int posX,
    int posY,
    ColorD color,
  ) => rl.Core.DrawPixel(
    posX,
    posY,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPixelV(
    Vector2D position,
    ColorD color,
  ) => rl.Core.DrawPixelV(
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLine(
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    ColorD color,
  ) => rl.Core.DrawLine(
    startPosX,
    startPosY,
    endPosX,
    endPosY,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  ) => rl.Core.DrawLineV(
    rl.Temp.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineEx(
    Vector2D startPos,
    Vector2D endPos,
    double thick,
    ColorD color,
  ) => rl.Core.DrawLineEx(
    rl.Temp.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineStrip(
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => rl.Core.DrawLineStrip(
    points.asNativePointer(),
    pointCount,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    double thick,
    ColorD color,
  ) => rl.Core.DrawLineBezier(
    rl.Temp.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineDashed(
    Vector2D startPos,
    Vector2D endPos,
    int dashSize,
    int spaceSize,
    ColorD color,
  ) => rl.Core.DrawLineDashed(
    rl.Temp.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
    dashSize,
    spaceSize,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircle(
    int centerX,
    int centerY,
    double radius,
    ColorD color,
  ) => rl.Core.DrawCircle(
    centerX,
    centerY,
    radius,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleSector(
    Vector2D center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  ) => rl.Core.DrawCircleSector(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    startAngle,
    endAngle,
    segments,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleSectorLines(
    Vector2D center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  ) => rl.Core.DrawCircleSectorLines(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    startAngle,
    endAngle,
    segments,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleGradient(
    Vector2D center,
    double radius,
    ColorD inner,
    ColorD outer,
  ) => rl.Core.DrawCircleGradient(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    rl.Temp.Color$.Ref1(inner).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref2(outer).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleV(
    Vector2D center,
    double radius,
    ColorD color,
  ) => rl.Core.DrawCircleV(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleLines(
    int centerX,
    int centerY,
    double radius,
    ColorD color,
  ) => rl.Core.DrawCircleLines(
    centerX,
    centerY,
    radius,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleLinesV(
    Vector2D center,
    double radius,
    ColorD color,
  ) => rl.Core.DrawCircleLinesV(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawEllipse(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    ColorD color,
  ) => rl.Core.DrawEllipse(
    centerX,
    centerY,
    radiusH,
    radiusV,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawEllipseV(
    Vector2D center,
    double radiusH,
    double radiusV,
    ColorD color,
  ) => rl.Core.DrawEllipseV(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radiusH,
    radiusV,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawEllipseLines(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    ColorD color,
  ) => rl.Core.DrawEllipseLines(
    centerX,
    centerY,
    radiusH,
    radiusV,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawEllipseLinesV(
    Vector2D center,
    double radiusH,
    double radiusV,
    ColorD color,
  ) => rl.Core.DrawEllipseLinesV(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radiusH,
    radiusV,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRing(
    Vector2D center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  ) => rl.Core.DrawRing(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    innerRadius,
    outerRadius,
    startAngle,
    endAngle,
    segments,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRingLines(
    Vector2D center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  ) => rl.Core.DrawRingLines(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    innerRadius,
    outerRadius,
    startAngle,
    endAngle,
    segments,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangle(
    int posX,
    int posY,
    int width,
    int height,
    ColorD color,
  ) => rl.Core.DrawRectangle(
    posX,
    posY,
    width,
    height,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => rl.Core.DrawRectangleV(
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(size).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  ) => rl.Core.DrawRectangleRec(
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectanglePro(
    RectangleD rec,
    Vector2D origin,
    double rotation,
    ColorD color,
  ) => rl.Core.DrawRectanglePro(
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    rl.Temp.Vector2$.Ref1(origin).asNativePointer<Vector2C>().ref,
    rotation,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleGradientV(
    int posX,
    int posY,
    int width,
    int height,
    ColorD top,
    ColorD bottom,
  ) => rl.Core.DrawRectangleGradientV(
    posX,
    posY,
    width,
    height,
    rl.Temp.Color$.Ref1(top).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref2(bottom).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleGradientH(
    int posX,
    int posY,
    int width,
    int height,
    ColorD left,
    ColorD right,
  ) => rl.Core.DrawRectangleGradientH(
    posX,
    posY,
    width,
    height,
    rl.Temp.Color$.Ref1(left).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref2(right).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleGradientEx(
    RectangleD rec,
    ColorD topLeft,
    ColorD bottomLeft,
    ColorD topRight,
    ColorD bottomRight,
  ) => rl.Core.DrawRectangleGradientEx(
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    rl.Temp.Color$.Ref1(topLeft).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref2(bottomLeft).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref3(topRight).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref4(bottomRight).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleLines(
    int posX,
    int posY,
    int width,
    int height,
    ColorD color,
  ) => rl.Core.DrawRectangleLines(
    posX,
    posY,
    width,
    height,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleLinesEx(
    RectangleD rec,
    double lineThick,
    ColorD color,
  ) => rl.Core.DrawRectangleLinesEx(
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    lineThick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleRounded(
    RectangleD rec,
    double roundness,
    int segments,
    ColorD color,
  ) => rl.Core.DrawRectangleRounded(
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    roundness,
    segments,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleRoundedLines(
    RectangleD rec,
    double roundness,
    int segments,
    ColorD color,
  ) => rl.Core.DrawRectangleRoundedLines(
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    roundness,
    segments,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleRoundedLinesEx(
    RectangleD rec,
    double roundness,
    int segments,
    double lineThick,
    ColorD color,
  ) => rl.Core.DrawRectangleRoundedLinesEx(
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    roundness,
    segments,
    lineThick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangle(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => rl.Core.DrawTriangle(
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangleLines(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => rl.Core.DrawTriangleLines(
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangleFan(
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => rl.Core.DrawTriangleFan(
    points.asNativePointer(),
    pointCount,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref
  );

  @override
  void DrawTriangleStrip(
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => rl.Core.DrawTriangleStrip(
    points.asNativePointer(),
    pointCount,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref
  );

  @override
  void DrawPoly(
    Vector2D center,
    int sides,
    double radius,
    double rotation,
    ColorD color,
  ) => rl.Core.DrawPoly(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    sides,
    radius,
    rotation,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPolyLines(
    Vector2D center,
    int sides,
    double radius,
    double rotation,
    ColorD color,
  ) => rl.Core.DrawPolyLines(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    sides,
    radius,
    rotation,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPolyLinesEx(
    Vector2D center,
    int sides,
    double radius,
    double rotation,
    double lineThick,
    ColorD color,
  ) => rl.Core.DrawPolyLinesEx(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    sides,
    radius,
    rotation,
    lineThick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineLinear(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineLinear(
    points.asNativePointer(),
    pointCount,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineBasis(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineBasis(
    points.asNativePointer(),
    pointCount,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineCatmullRom(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineCatmullRom(
    points.asNativePointer(),
    pointCount, 
    thick, 
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineBezierQuadratic(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineBezierQuadratic(
    points.asNativePointer(),
    pointCount,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineBezierCubic(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineBezierCubic(
    points.asNativePointer(),
    pointCount,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineSegmentLinear(
    rl.Temp.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineSegmentBasis(
    rl.Temp.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineSegmentCatmullRom(
    rl.Temp.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineSegmentBezierQuadratic(
    rl.Temp.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(c2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    double thick,
    ColorD color,
  ) => rl.Core.DrawSplineSegmentBezierCubic(
    rl.Temp.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(c2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(c3).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  Vector2D GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    double t,
  ) => rl.Temp.Vector2$.Extract3(
    (p) => rl.Core.GetSplinePointLinear(
      rl.Temp.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetSplinePointBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double t,
  ) => rl.Temp.Vector2$.Extract5(
    (p) => rl.Core.GetSplinePointBasis(
      rl.Temp.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetSplinePointCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double t,
  ) => rl.Temp.Vector2$.Extract5(
    (p) => rl.Core.GetSplinePointCatmullRom(
      rl.Temp.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    double t,
  ) => rl.Temp.Vector2$.Extract4(
    (p) => rl.Core.GetSplinePointBezierQuad(
      rl.Temp.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(c2).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetSplinePointBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    double t,
  ) => rl.Temp.Vector2$.Extract5(
    (p) => rl.Core.GetSplinePointBezierCubic(
      rl.Temp.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref2(c2).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref3(c3).asNativePointer<Vector2C>().ref,
      rl.Temp.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  ) => rl.Core.CheckCollisionRecs(
    rl.Temp.Rectangle$.Ref1(rec1).asNativePointer<RectangleC>().ref,
    rl.Temp.Rectangle$.Ref2(rec2).asNativePointer<RectangleC>().ref,
  );

  @override
  bool CheckCollisionCircles(
    Vector2D center1,
    double radius1,
    Vector2D center2,
    double radius2,
  ) => rl.Core.CheckCollisionCircles(
    rl.Temp.Vector2$.Ref1(center1).asNativePointer<Vector2C>().ref,
    radius1,
    rl.Temp.Vector2$.Ref2(center2).asNativePointer<Vector2C>().ref,
    radius2,
  );

  @override
  bool CheckCollisionCircleRec(
    Vector2D center,
    double radius,
    RectangleD rec,
  ) => rl.Core.CheckCollisionCircleRec(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
  );

  @override
  bool CheckCollisionCircleLine(
    Vector2D center,
    double radius,
    Vector2D p1,
    Vector2D p2,
  ) => rl.Core.CheckCollisionCircleLine(
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    rl.Temp.Vector2$.Ref2(p1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(p2).asNativePointer<Vector2C>().ref,
  );

  @override
  bool CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  ) => rl.Core.CheckCollisionPointRec(
    rl.Temp.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
  );

  @override
  bool CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    double radius,
  ) => rl.Core.CheckCollisionPointCircle(
    rl.Temp.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(center).asNativePointer<Vector2C>().ref,
    radius,
  );

  @override
  bool CheckCollisionPointTriangle(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
  ) => rl.Core.CheckCollisionPointTriangle(
    rl.Temp.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(p1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(p2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref4(p3).asNativePointer<Vector2C>().ref,
  );

  @override
  bool CheckCollisionPointLine(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    int threshold,
  ) => rl.Core.CheckCollisionPointLine(
    rl.Temp.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(p1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(p2).asNativePointer<Vector2C>().ref,
    threshold,
  );

  @override
  bool CheckCollisionPointPoly(
    Vector2D point,
    StructPointer<Vector2D> points,
    int pointCount,
  ) => rl.Core.CheckCollisionPointPoly(
    rl.Temp.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
    points.asNativePointer(),
    pointCount,
  );

  @override
  bool CheckCollisionLines(
    Vector2D startPos1,
    Vector2D endPos1,
    Vector2D startPos2,
    Vector2D endPos2,
    StructPointer<Vector2D> collisionPoint,
  ) => rl.Core.CheckCollisionLines(
    rl.Temp.Vector2$.Ref1(startPos1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(endPos1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(startPos2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref4(endPos2).asNativePointer<Vector2C>().ref,
    collisionPoint.asNativePointer(),
  );

  @override
  RectangleD GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  ) => rl.Temp.Rectangle$.Extract3(
    (p) => rl.Core.GetCollisionRec(
      rl.Temp.Rectangle$.Ref1(rec1).asNativePointer<RectangleC>().ref,
      rl.Temp.Rectangle$.Ref2(rec2).asNativePointer<RectangleC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImage(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.LoadImage,
    (p) => rl.Core.LoadImage(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImageRaw(
    MemoryPointer<RChar> fileName,
    int width,
    int height,
    int format,
    int headerSize,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.LoadImageRaw,
    (p) => rl.Core.LoadImageRaw(
      fileName.asNativePointer(),
      width,
      height,
      format,
      headerSize,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImageAnim(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> frames,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.LoadImageAnim,
    (p) => rl.Core.LoadImageAnim(
      fileName.asNativePointer(),
      frames.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImageAnimFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
    MemoryPointer<RInt> frames,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.LoadImageAnimFromMemory,
    (p) => rl.Core.LoadImageAnimFromMemory(
      fileType.asNativePointer(),
      fileData.asNativePointer(),
      dataSize,
      frames.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImageFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromMemory,
    (p) => rl.Core.LoadImageFromMemory(
      fileType.asNativePointer(),
      fileData.asNativePointer(),
      dataSize,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImageFromTexture(
    TextureD texture,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromTexture,
    (p) => rl.Core.LoadImageFromTexture(
      rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImageFromScreen() => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromScreen,
    (p) => rl.Core.LoadImageFromScreen().toDart(p.asNativePointer()),
  );

  @override
  bool IsImageValid(
    ImageD image,
  ) => rl.Core.IsImageValid(
    rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
  );

  @override
  void UnloadImage(
    ImageD image,
  ) => rl.Core.UnloadImage(
    rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
  );

  @override
  bool ExportImage(
    ImageD image,
    MemoryPointer<RChar> fileName,
  ) => rl.Core.ExportImage(
    rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    fileName.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RUnsignedChar> ExportImageToMemory(
    ImageD image,
    MemoryPointer<RChar> fileType,
    MemoryPointer<RInt> fileSize,
  ) => rl.Core.ExportImageToMemory(
    rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    fileType.asNativePointer(),
    fileSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  bool ExportImageAsCode(
    ImageD image,
    MemoryPointer<RChar> fileName,
  ) => rl.Core.ExportImageAsCode(
    rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    fileName.asNativePointer(),
  );

  @override
  ImageD GenImageColor(
    int width,
    int height,
    ColorD color,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImageColor,
    (p) => rl.Core.GenImageColor(
      width,
      height,
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageGradientLinear(
    int width,
    int height,
    int direction,
    ColorD start,
    ColorD end,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImageGradientLinear,
    (p) => rl.Core.GenImageGradientLinear(
      width,
      height,
      direction,
      rl.Temp.Color$.Ref1(start).asNativePointer<ColorC>().ref,
      rl.Temp.Color$.Ref2(end).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageGradientRadial(
    int width,
    int height,
    double density,
    ColorD inner,
    ColorD outer,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImageGradientRadial,
    (p) => rl.Core.GenImageGradientRadial(
      width,
      height,
      density,
      rl.Temp.Color$.Ref1(inner).asNativePointer<ColorC>().ref,
      rl.Temp.Color$.Ref2(outer).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageGradientSquare(
    int width,
    int height,
    double density,
    ColorD inner,
    ColorD outer,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImageGradientSquare,
    (p) => rl.Core.GenImageGradientSquare(
      width,
      height,
      density,
      rl.Temp.Color$.Ref1(inner).asNativePointer<ColorC>().ref,
      rl.Temp.Color$.Ref2(outer).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageChecked(
    int width,
    int height,
    int checksX,
    int checksY,
    ColorD col1,
    ColorD col2,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImageChecked,
    (p) => rl.Core.GenImageChecked(
      width,
      height,
      checksX,
      checksY,
      rl.Temp.Color$.Ref1(col1).asNativePointer<ColorC>().ref,
      rl.Temp.Color$.Ref2(col2).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageWhiteNoise(
    int width,
    int height,
    double factor,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImageWhiteNoise,
    (p) => rl.Core.GenImageWhiteNoise(
      width,
      height,
      factor,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImagePerlinNoise(
    int width,
    int height,
    int offsetX,
    int offsetY,
    double scale,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImagePerlinNoise,
    (p) => rl.Core.GenImagePerlinNoise(
      width,
      height,
      offsetX,
      offsetY,
      scale,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageCellular(
    int width,
    int height,
    int tileSize,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImageCellular,
    (p) => rl.Core.GenImageCellular(
      width,
      height,
      tileSize,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageText(
    int width,
    int height,
    MemoryPointer<RChar> text,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImageText,
    (p) => rl.Core.GenImageText(
      width,
      height,
      text.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageCopy(
    ImageD image,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.ImageCopy,
    (p) => rl.Core.ImageCopy(
      rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageFromImage(
    ImageD image,
    RectangleD rec,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.ImageFromImage,
    (p) => rl.Core.ImageFromImage(
      rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageFromChannel(
    ImageD image,
    int selectedChannel,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.ImageFromChannel,
    (p) => rl.Core.ImageFromChannel(
      rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      selectedChannel,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageText(
    MemoryPointer<RChar> text,
    int fontSize,
    ColorD color,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.ImageText,
    (p) => rl.Core.ImageText(
      text.asNativePointer(),
      fontSize,
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageTextEx(
    FontD font,
    MemoryPointer<RChar> text,
    double fontSize,
    double spacing,
    ColorD tint,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.ImageTextEx,
    (p) => rl.Core.ImageTextEx(
      rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
      text.asNativePointer(),
      fontSize,
      spacing,
      rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void ImageFormat(
    StructPointer<ImageD> image,
    int newFormat,
  ) => rl.Core.ImageFormat(
    image.asNativePointer(),
    newFormat,
  );

  @override
  void ImageToPOT(
    StructPointer<ImageD> image,
    ColorD fill,
  ) => rl.Core.ImageToPOT(
    image.asNativePointer(),
    rl.Temp.Color$.Ref1(fill).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageCrop(
    StructPointer<ImageD> image,
    RectangleD crop,
  ) => rl.Core.ImageCrop(
    image.asNativePointer(),
    rl.Temp.Rectangle$.Ref1(crop).asNativePointer<RectangleC>().ref,
  );

  @override
  void ImageAlphaCrop(
    StructPointer<ImageD> image,
    double threshold,
  ) => rl.Core.ImageAlphaCrop(
    image.asNativePointer(),
    threshold,
  );

  @override
  void ImageAlphaClear(
    StructPointer<ImageD> image,
    ColorD color,
    double threshold,
  ) => rl.Core.ImageAlphaClear(
    image.asNativePointer(),
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    threshold,
  );

  @override
  void ImageAlphaMask(
    StructPointer<ImageD> image,
    ImageD alphaMask,
  ) => rl.Core.ImageAlphaMask(
    image.asNativePointer(),
    rl.Temp.Image$.Ref2(alphaMask).asNativePointer<ImageC>().ref,
  );

  @override
  void ImageAlphaPremultiply(
    StructPointer<ImageD> image,
  ) => rl.Core.ImageAlphaPremultiply(
    image.asNativePointer(),
  );

  @override
  void ImageBlurGaussian(
    StructPointer<ImageD> image,
    int blurSize,
  ) => rl.Core.ImageBlurGaussian(
    image.asNativePointer(),
    blurSize,
  );

  @override
  void ImageKernelConvolution(
    StructPointer<ImageD> image,
    MemoryPointer<RFloat> kernel,
    int kernelSize,
  ) => rl.Core.ImageKernelConvolution(
    image.asNativePointer(),
    kernel.asNativePointer(),
    kernelSize,
  );

  @override
  void ImageResize(
    StructPointer<ImageD> image,
    int newWidth,
    int newHeight,
  ) => rl.Core.ImageResize(
    image.asNativePointer(),
    newWidth,
    newHeight,
  );

  @override
  void ImageResizeNN(
    StructPointer<ImageD> image,
    int newWidth,
    int newHeight,
  ) => rl.Core.ImageResizeNN(
    image.asNativePointer(),
    newWidth,
    newHeight,
  );

  @override
  void ImageResizeCanvas(
    StructPointer<ImageD> image,
    int newWidth,
    int newHeight,
    int offsetX,
    int offsetY,
    ColorD fill,
  ) => rl.Core.ImageResizeCanvas(
    image.asNativePointer(),
    newWidth,
    newHeight,
    offsetX,
    offsetY,
    rl.Temp.Color$.Ref1(fill).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageMipmaps(
    StructPointer<ImageD> image,
  ) => rl.Core.ImageMipmaps(
    image.asNativePointer(),
  );

  @override
  void ImageDither(
    StructPointer<ImageD> image,
    int rBpp,
    int gBpp,
    int bBpp,
    int aBpp,
  ) => rl.Core.ImageDither(
    image.asNativePointer(),
    rBpp,
    gBpp,
    bBpp,
    aBpp,
  );

  @override
  void ImageFlipVertical(
    StructPointer<ImageD> image,
  ) => rl.Core.ImageFlipVertical(
    image.asNativePointer(),
  );

  @override
  void ImageFlipHorizontal(
    StructPointer<ImageD> image,
  ) => rl.Core.ImageFlipHorizontal(
    image.asNativePointer(),
  );

  @override
  void ImageRotate(
    StructPointer<ImageD> image,
    int degrees,
  ) => rl.Core.ImageRotate(
    image.asNativePointer(),
    degrees,
  );

  @override
  void ImageRotateCW(
    StructPointer<ImageD> image,
  ) => rl.Core.ImageRotateCW(
    image.asNativePointer(),
  );

  @override
  void ImageRotateCCW(
    StructPointer<ImageD> image,
  ) => rl.Core.ImageRotateCCW(
    image.asNativePointer(),
  );

  @override
  void ImageColorTint(
    StructPointer<ImageD> image,
    ColorD color,
  ) => rl.Core.ImageColorTint(
    image.asNativePointer(),
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageColorInvert(
    StructPointer<ImageD> image,
  ) => rl.Core.ImageColorInvert(
    image.asNativePointer(),
  );

  @override
  void ImageColorGrayscale(
    StructPointer<ImageD> image,
  ) => rl.Core.ImageColorGrayscale(
    image.asNativePointer(),
  );

  @override
  void ImageColorContrast(
    StructPointer<ImageD> image,
    double contrast,
  ) => rl.Core.ImageColorContrast(
    image.asNativePointer(),
    contrast,
  );

  @override
  void ImageColorBrightness(
    StructPointer<ImageD> image,
    int brightness,
  ) => rl.Core.ImageColorBrightness(
    image.asNativePointer(),
    brightness,
  );

  @override
  void ImageColorReplace(
    StructPointer<ImageD> image,
    ColorD color,
    ColorD replace,
  ) => rl.Core.ImageColorReplace(
    image.asNativePointer(),
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref2(replace).asNativePointer<ColorC>().ref,
  );

  @override
  StructPointer<ColorD> LoadImageColors(
    ImageD image,
  ) => ColorD.pointer(rl.Core.LoadImageColors(
    rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
  ).asMemoryPointer());

  @override
  StructPointer<ColorD> LoadImagePalette(
    ImageD image,
    int maxPaletteSize,
    MemoryPointer<RInt> colorCount,
  ) => ColorD.pointer(rl.Core.LoadImagePalette(
    rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    maxPaletteSize,
    colorCount.asNativePointer(),
  ).asMemoryPointer());

  @override
  void UnloadImageColors(
    StructPointer<ColorD> colors,
  ) => rl.Core.UnloadImageColors(
    colors.asNativePointer(),
  );

  @override
  void UnloadImagePalette(
    StructPointer<ColorD> colors,
  ) => rl.Core.UnloadImagePalette(
    colors.asNativePointer(),
  );

  @override
  RectangleD GetImageAlphaBorder(
    ImageD image,
    double threshold,
  ) => rl.Temp.Rectangle$.Extract1(
    (p) => rl.Core.GetImageAlphaBorder(
      rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      threshold,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD GetImageColor(
    ImageD image,
    int x,
    int y,
  ) => rl.Temp.Color$.Extract1(
    (p) => rl.Core.GetImageColor(
      rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      x,
      y,
    ).toDart(p.asNativePointer()),
  );

  @override
  void ImageClearBackground(
    StructPointer<ImageD> dst,
    ColorD color,
  ) => rl.Core.ImageClearBackground(
    dst.asNativePointer(),
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawPixel(
    StructPointer<ImageD> dst,
    int posX,
    int posY,
    ColorD color,
  ) => rl.Core.ImageDrawPixel(
    dst.asNativePointer(),
    posX,
    posY,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawPixelV(
    StructPointer<ImageD> dst,
    Vector2D position,
    ColorD color,
  ) => rl.Core.ImageDrawPixelV(
    dst.asNativePointer(),
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawLine(
    StructPointer<ImageD> dst,
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    ColorD color,
  ) => rl.Core.ImageDrawLine(
    dst.asNativePointer(),
    startPosX,
    startPosY,
    endPosX,
    endPosY,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawLineV(
    StructPointer<ImageD> dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  ) => rl.Core.ImageDrawLineV(
    dst.asNativePointer(),
    rl.Temp.Vector2$.Ref1(start).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(end).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawLineEx(
    StructPointer<ImageD> dst,
    Vector2D start,
    Vector2D end,
    int thick,
    ColorD color,
  ) => rl.Core.ImageDrawLineEx(
    dst.asNativePointer(),
    rl.Temp.Vector2$.Ref1(start).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(end).asNativePointer<Vector2C>().ref,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawCircle(
    StructPointer<ImageD> dst,
    int centerX,
    int centerY,
    int radius,
    ColorD color,
  ) => rl.Core.ImageDrawCircle(
    dst.asNativePointer(),
    centerX,
    centerY,
    radius,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawCircleV(
    StructPointer<ImageD> dst,
    Vector2D center,
    int radius,
    ColorD color,
  ) => rl.Core.ImageDrawCircleV(
    dst.asNativePointer(),
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawCircleLines(
    StructPointer<ImageD> dst,
    int centerX,
    int centerY,
    int radius,
    ColorD color,
  ) => rl.Core.ImageDrawCircleLines(
    dst.asNativePointer(),
    centerX,
    centerY,
    radius,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawCircleLinesV(
    StructPointer<ImageD> dst,
    Vector2D center,
    int radius,
    ColorD color,
  ) => rl.Core.ImageDrawCircleLinesV(
    dst.asNativePointer(),
    rl.Temp.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawRectangle(
    StructPointer<ImageD> dst,
    int posX,
    int posY,
    int width,
    int height,
    ColorD color,
  ) => rl.Core.ImageDrawRectangle(
    dst.asNativePointer(),
    posX,
    posY,
    width,
    height,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawRectangleV(
    StructPointer<ImageD> dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => rl.Core.ImageDrawRectangleV(
    dst.asNativePointer(),
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(size).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawRectangleRec(
    StructPointer<ImageD> dst,
    RectangleD rec,
    ColorD color,
  ) => rl.Core.ImageDrawRectangleRec(
    dst.asNativePointer(),
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawRectangleLines(
    StructPointer<ImageD> dst,
    RectangleD rec,
    int thick,
    ColorD color,
  ) => rl.Core.ImageDrawRectangleLines(
    dst.asNativePointer(),
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    thick,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTriangle(
    StructPointer<ImageD> dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => rl.Core.ImageDrawTriangle(
    dst.asNativePointer(),
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleEx(
    StructPointer<ImageD> dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD c1,
    ColorD c2,
    ColorD c3,
  ) => rl.Core.ImageDrawTriangleEx(
    dst.asNativePointer(),
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(c1).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref2(c2).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref3(c3).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleLines(
    StructPointer<ImageD> dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => rl.Core.ImageDrawTriangleLines(
    dst.asNativePointer(),
    rl.Temp.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleFan(
    StructPointer<ImageD> dst,
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => rl.Core.ImageDrawTriangleFan(
    dst.asNativePointer(),
    points.asNativePointer(),
    pointCount,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleStrip(
    StructPointer<ImageD> dst,
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => rl.Core.ImageDrawTriangleStrip(
    dst.asNativePointer(),
    points.asNativePointer(),
    pointCount,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDraw(
    StructPointer<ImageD> dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  ) => rl.Core.ImageDraw(
    dst.asNativePointer(),
    rl.Temp.Image$.Ref2(src).asNativePointer<ImageC>().ref,
    rl.Temp.Rectangle$.Ref1(srcRec).asNativePointer<RectangleC>().ref,
    rl.Temp.Rectangle$.Ref2(dstRec).asNativePointer<RectangleC>().ref,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawText(
    StructPointer<ImageD> dst,
    MemoryPointer<RChar> text,
    int posX,
    int posY,
    int fontSize,
    ColorD color,
  ) => rl.Core.ImageDrawText(
    dst.asNativePointer(),
    text.asNativePointer(),
    posX,
    posY,
    fontSize,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTextEx(
    StructPointer<ImageD> dst,
    FontD font,
    MemoryPointer<RChar> text,
    Vector2D position,
    double fontSize,
    double spacing,
    ColorD tint,
  ) => rl.Core.ImageDrawTextEx(
    dst.asNativePointer(),
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
    text.asNativePointer(),
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    fontSize,
    spacing,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  TextureD LoadTexture(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Texture$.RefCapture(
    RaylibCaptureIds.LoadTexture,
    (p) => rl.Core.LoadTexture(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  TextureD LoadTextureFromImage(
    ImageD image,
  ) => rl.Temp.Texture$.RefCapture(
    RaylibCaptureIds.LoadTextureFromImage,
    (p) => rl.Core.LoadTextureFromImage(
      rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  TextureD LoadTextureCubemap(
    ImageD image,
    int layout,
  ) => rl.Temp.Texture$.RefCapture(
    RaylibCaptureIds.LoadTextureCubemap,
    (p) => rl.Core.LoadTextureCubemap(
      rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      layout,
    ).toDart(p.asNativePointer()),
  );

  @override
  RenderTextureD LoadRenderTexture(
    int width,
    int height,
  ) => rl.Temp.RenderTexture$.RefCapture(
    RaylibCaptureIds.LoadRenderTexture,
    (p) => rl.Core.LoadRenderTexture(
      width,
      height,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool IsTextureValid(
    TextureD texture,
  ) => rl.Core.IsTextureValid(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
  );

  @override
  void UnloadTexture(
    TextureD texture,
  ) => rl.Core.UnloadTexture(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
  );

  @override
  bool IsRenderTextureValid(
    RenderTextureD target,
  ) => rl.Core.IsRenderTextureValid(
    rl.Temp.RenderTexture$.Ref1(target).asNativePointer<RenderTextureC>().ref,
  );

  @override
  void UnloadRenderTexture(
    RenderTextureD target,
  ) => rl.Core.UnloadRenderTexture(
    rl.Temp.RenderTexture$.Ref1(target).asNativePointer<RenderTextureC>().ref,
  );

  @override
  void UpdateTexture(
    TextureD texture,
    MemoryPointer<RVoid> pixels,
  ) => rl.Core.UpdateTexture(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    pixels.asNativePointer(),
  );

  @override
  void UpdateTextureRec(
    TextureD texture,
    RectangleD rec,
    MemoryPointer<RVoid> pixels,
  ) => rl.Core.UpdateTextureRec(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    pixels.asNativePointer(),
  );

  @override
  void GenTextureMipmaps(
    StructPointer<TextureD> texture,
  ) => rl.Core.GenTextureMipmaps(
    texture.asNativePointer(),
  );

  @override
  void SetTextureFilter(
    TextureD texture,
    int filter,
  ) => rl.Core.SetTextureFilter(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    filter,
  );

  @override
  void SetTextureWrap(
    TextureD texture,
    int wrap,
  ) => rl.Core.SetTextureWrap(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    wrap,
  );

  @override
  void DrawTexture(
    TextureD texture,
    int posX,
    int posY,
    ColorD tint,
  ) => rl.Core.DrawTexture(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    posX,
    posY,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextureV(
    TextureD texture,
    Vector2D position,
    ColorD tint,
  ) => rl.Core.DrawTextureV(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextureEx(
    TextureD texture,
    Vector2D position,
    double rotation,
    double scale,
    ColorD tint,
  ) => rl.Core.DrawTextureEx(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    rotation,
    scale,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextureRec(
    TextureD texture,
    RectangleD source,
    Vector2D position,
    ColorD tint,
  ) => rl.Core.DrawTextureRec(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTexturePro(
    TextureD texture,
    RectangleD source,
    RectangleD dest,
    Vector2D origin,
    double rotation,
    ColorD tint,
  ) => rl.Core.DrawTexturePro(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
    rl.Temp.Rectangle$.Ref2(dest).asNativePointer<RectangleC>().ref,
    rl.Temp.Vector2$.Ref1(origin).asNativePointer<Vector2C>().ref,
    rotation,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextureNPatch(
    TextureD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    double rotation,
    ColorD tint,
  ) => rl.Core.DrawTextureNPatch(
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.NPatchInfo$.Ref1(nPatchInfo).asNativePointer<NPatchInfoC>().ref,
    rl.Temp.Rectangle$.Ref1(dest).asNativePointer<RectangleC>().ref,
    rl.Temp.Vector2$.Ref1(origin).asNativePointer<Vector2C>().ref,
    rotation,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  bool ColorIsEqual(
    ColorD col1,
    ColorD col2,
  ) => rl.Core.ColorIsEqual(
    rl.Temp.Color$.Ref1(col1).asNativePointer<ColorC>().ref,
    rl.Temp.Color$.Ref2(col2).asNativePointer<ColorC>().ref,
  );

  @override
  ColorD Fade(
    ColorD color,
    double alpha,
  ) => rl.Temp.Color$.Extract2(
    (p) => rl.Core.Fade(
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      alpha,
    ).toDart(p.asNativePointer()),
  );

  @override
  int ColorToInt(
    ColorD color,
  ) => rl.Core.ColorToInt(
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  Vector4D ColorNormalize(
    ColorD color,
  ) => rl.Temp.Vector4$.Extract1(
    (p) => rl.Core.ColorNormalize(
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorFromNormalized(
    Vector4D normalized,
  ) => rl.Temp.Color$.Extract1(
    (p) => rl.Core.ColorFromNormalized(
      rl.Temp.Vector4$.Ref1(normalized).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D ColorToHSV(
    ColorD color,
  ) => rl.Temp.Vector3$.Extract1(
    (p) => rl.Core.ColorToHSV(
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorFromHSV(
    double hue,
    double saturation,
    double value,
  ) => rl.Temp.Color$.Extract1(
    (p) => rl.Core.ColorFromHSV(
      hue,
      saturation,
      value,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorTint(
    ColorD color,
    ColorD tint,
  ) => rl.Temp.Color$.Extract3(
    (p) => rl.Core.ColorTint(
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      rl.Temp.Color$.Ref2(tint).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorBrightness(
    ColorD color,
    double factor,
  ) => rl.Temp.Color$.Extract2(
    (p) => rl.Core.ColorBrightness(
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      factor,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorContrast(
    ColorD color,
    double contrast,
  ) => rl.Temp.Color$.Extract2(
    (p) => rl.Core.ColorContrast(
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      contrast,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorAlpha(
    ColorD color,
    double alpha,
  ) => rl.Temp.Color$.Extract2(
    (p) => rl.Core.ColorAlpha(
      rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      alpha,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  ) => rl.Temp.Color$.Extract4(
    (p) => rl.Core.ColorAlphaBlend(
      rl.Temp.Color$.Ref1(dst).asNativePointer<ColorC>().ref,
      rl.Temp.Color$.Ref2(src).asNativePointer<ColorC>().ref,
      rl.Temp.Color$.Ref3(tint).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorLerp(
    ColorD color1,
    ColorD color2,
    double factor,
  ) => rl.Temp.Color$.Extract3(
    (p) => rl.Core.ColorLerp(
      rl.Temp.Color$.Ref1(color1).asNativePointer<ColorC>().ref,
      rl.Temp.Color$.Ref2(color2).asNativePointer<ColorC>().ref,
      factor,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD GetColor(
    int hexValue,
  ) => rl.Temp.Color$.Extract1(
    (p) => rl.Core.GetColor(
      hexValue,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD GetPixelColor(
    MemoryPointer<RVoid> srcPtr,
    int format,
  ) => rl.Temp.Color$.Extract1(
    (p) => rl.Core.GetPixelColor(
      srcPtr.asNativePointer(),
      format,
    ).toDart(p.asNativePointer()),
  );

  @override
  void SetPixelColor(
    MemoryPointer<RVoid> dstPtr,
    ColorD color,
    int format,
  ) => rl.Core.SetPixelColor(
    dstPtr.asNativePointer(),
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    format,
  );

  @override
  int GetPixelDataSize(
    int width,
    int height,
    int format,
  ) => rl.Core.GetPixelDataSize(
    width,
    height,
    format,
  );

  @override
  FontD GetFontDefault() => rl.Temp.Font$.RefCapture(
    RaylibCaptureIds.GetFontDefault,
    (p) => rl.Core.GetFontDefault().toDart(p.asNativePointer()),
  );

  @override
  FontD LoadFont(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Font$.RefCapture(
    RaylibCaptureIds.LoadFont,
    (p) => rl.Core.LoadFont(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  FontD LoadFontEx(
    MemoryPointer<RChar> fileName,
    int fontSize,
    MemoryPointer<RInt> codepoints,
    int codepointCount,
  ) => rl.Temp.Font$.RefCapture(
    RaylibCaptureIds.LoadFontEx,
    (p) => rl.Core.LoadFontEx(
      fileName.asNativePointer(),
      fontSize,
      codepoints.asNativePointer(),
      codepointCount,
    ).toDart(p.asNativePointer()),
  );

  @override
  FontD LoadFontFromImage(
    ImageD image,
    ColorD key,
    int firstChar,
  ) => rl.Temp.Font$.RefCapture(
    RaylibCaptureIds.LoadFontFromImage,
    (p) => rl.Core.LoadFontFromImage(
      rl.Temp.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      rl.Temp.Color$.Ref1(key).asNativePointer<ColorC>().ref,
      firstChar,
    ).toDart(p.asNativePointer()),
  );

  @override
  FontD LoadFontFromMemory(
    MemoryPointer<RChar> fileType,
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
    int fontSize,
    MemoryPointer<RInt> codepoints,
    int codepointCount,
  ) => rl.Temp.Font$.RefCapture(
    RaylibCaptureIds.LoadFontFromMemory,
    (p) => rl.Core.LoadFontFromMemory(
      fileType.asNativePointer(),
      fileData.asNativePointer(),
      dataSize,
      fontSize,
      codepoints.asNativePointer(),
      codepointCount,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool IsFontValid(
    FontD font,
  ) => rl.Core.IsFontValid(
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
  );

  @override
  StructPointer<GlyphInfoD> LoadFontData(
    MemoryPointer<RUnsignedChar> fileData,
    int dataSize,
    int fontSize,
    MemoryPointer<RInt> codepoints,
    int codepointCount,
    int type,
    MemoryPointer<RInt> glyphCount,
  ) => GlyphInfoD.pointer(rl.Core.LoadFontData(
    fileData.asNativePointer(),
    dataSize,
    fontSize,
    codepoints.asNativePointer(),
    codepointCount,
    type,
    glyphCount.asNativePointer(),
  ).asMemoryPointer());

  @override
  ImageD GenImageFontAtlas(
    StructPointer<GlyphInfoD> glyphs,
    MemoryPointer<RPointer<RStruct>> glyphRecs, // RectangleD
    int glyphCount,
    int fontSize,
    int padding,
    int packMethod,
  ) => rl.Temp.Image$.RefCapture(
    RaylibCaptureIds.GenImageFontAtlas,
    (p) => rl.Core.GenImageFontAtlas(
      glyphs.asNativePointer(),
      glyphRecs.asNativePointer(),
      glyphCount,
      fontSize,
      padding,
      packMethod,
    ).toDart(p.asNativePointer()),
  );

  @override
  void UnloadFontData(
    StructPointer<GlyphInfoD> glyphs,
    int glyphCount,
  ) => rl.Core.UnloadFontData(
    glyphs.asNativePointer(),
    glyphCount,
  );

  @override
  void UnloadFont(
    FontD font,
  ) => rl.Core.UnloadFont(
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
  );

  @override
  bool ExportFontAsCode(
    FontD font,
    MemoryPointer<RChar> fileName,
  ) => rl.Core.ExportFontAsCode(
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
    fileName.asNativePointer(),
  );

  @override
  void DrawFPS(
    int posX,
    int posY,
  ) => rl.Core.DrawFPS(
    posX,
    posY,
  );

  @override
  void DrawText(
    MemoryPointer<RChar> text,
    int posX,
    int posY,
    int fontSize,
    ColorD color,
  ) => rl.Core.DrawText(
    text.asNativePointer(),
    posX,
    posY,
    fontSize,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextEx(
    FontD font,
    MemoryPointer<RChar> text,
    Vector2D position,
    double fontSize,
    double spacing,
    ColorD tint,
  ) => rl.Core.DrawTextEx(
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
    text.asNativePointer(),
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    fontSize,
    spacing,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextPro(
    FontD font,
    MemoryPointer<RChar> text,
    Vector2D position,
    Vector2D origin,
    double rotation,
    double fontSize,
    double spacing,
    ColorD tint,
  ) => rl.Core.DrawTextPro(
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
    text.asNativePointer(),
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(origin).asNativePointer<Vector2C>().ref,
    rotation,
    fontSize,
    spacing,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextCodepoint(
    FontD font,
    int codepoint,
    Vector2D position,
    double fontSize,
    ColorD tint,
  ) => rl.Core.DrawTextCodepoint(
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
    codepoint,
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    fontSize,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextCodepoints(
    FontD font,
    MemoryPointer<RInt> codepoints,
    int codepointCount,
    Vector2D position,
    double fontSize,
    double spacing,
    ColorD tint,
  ) => rl.Core.DrawTextCodepoints(
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
    codepoints.asNativePointer(),
    codepointCount,
    rl.Temp.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    fontSize,
    spacing,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void SetTextLineSpacing(
    int spacing,
  ) => rl.Core.SetTextLineSpacing(
    spacing,
  );

  @override
  int MeasureText(
    MemoryPointer<RChar> text,
    int fontSize,
  ) => rl.Core.MeasureText(
    text.asNativePointer(),
    fontSize,
  );

  @override
  Vector2D MeasureTextEx(
    FontD font,
    MemoryPointer<RChar> text,
    double fontSize,
    double spacing,
  ) => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.MeasureTextEx(
      rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
      text.asNativePointer(),
      fontSize,
      spacing,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D MeasureTextCodepoints(
    FontD font,
    MemoryPointer<RInt> codepoints,
    int length,
    double fontSize,
    double spacing,
  ) => rl.Temp.Vector2$.Extract1(
    (p) => rl.Core.MeasureTextCodepoints(
      rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
      codepoints.asNativePointer(),
      length,
      fontSize,
      spacing,
    ).toDart(p.asNativePointer()),
  );

  @override
  int GetGlyphIndex(
    FontD font,
    int codepoint,
  ) => rl.Core.GetGlyphIndex(
    rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
    codepoint,
  );

  @override
  GlyphInfoD GetGlyphInfo(
    FontD font,
    int codepoint,
  ) => rl.Temp.GlyphInfo$.Extract1(
    (p) => rl.Core.GetGlyphInfo(
      rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
      codepoint,
    ).toDart(p.asNativePointer()),
  );

  @override
  RectangleD GetGlyphAtlasRec(
    FontD font,
    int codepoint,
  ) => rl.Temp.Rectangle$.Extract1(
    (p) => rl.Core.GetGlyphAtlasRec(
      rl.Temp.Font$.Ref1(font).asNativePointer<FontC>().ref,
      codepoint,
    ).toDart(p.asNativePointer()),
  );

  @override
  NativeMemoryPointer<RChar> LoadUTF8(
    MemoryPointer<RInt> codepoints,
    int length,
  ) => rl.Core.LoadUTF8(
    codepoints.asNativePointer(),
    length,
  ).asMemoryPointer();

  @override
  void UnloadUTF8(
    MemoryPointer<RChar> text,
  ) => rl.Core.UnloadUTF8(
    text.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RInt> LoadCodepoints(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> count,
  ) => rl.Core.LoadCodepoints(
    text.asNativePointer(),
    count.asNativePointer(),
  ).asMemoryPointer();

  @override
  void UnloadCodepoints(
    MemoryPointer<RInt> codepoints,
  ) => rl.Core.UnloadCodepoints(
    codepoints.asNativePointer(),
  );

  @override
  int GetCodepointCount(
    MemoryPointer<RChar> text,
  ) => rl.Core.GetCodepointCount(
    text.asNativePointer(),
  );

  @override
  int GetCodepoint(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> codepointSize,
  ) => rl.Core.GetCodepoint(
    text.asNativePointer(),
    codepointSize.asNativePointer(),
  );

  @override
  int GetCodepointNext(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> codepointSize,
  ) => rl.Core.GetCodepointNext(
    text.asNativePointer(),
    codepointSize.asNativePointer(),
  );

  @override
  int GetCodepointPrevious(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> codepointSize,
  ) => rl.Core.GetCodepointPrevious(
    text.asNativePointer(),
    codepointSize.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> CodepointToUTF8(
    int codepoint,
    MemoryPointer<RInt> utf8Size,
  ) => rl.Core.CodepointToUTF8(
    codepoint,
    utf8Size.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RPointer<RChar>> LoadTextLines(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> count,
  ) => rl.Core.LoadTextLines(
    text.asNativePointer(),
    count.asNativePointer(),
  ).asMemoryPointer();

  @override
  void UnloadTextLines(
    MemoryPointer<RPointer<RChar>> text,
    int lineCount,
  ) => rl.Core.UnloadTextLines(
    text.asNativePointer(),
    lineCount,
  );

  @override
  int TextCopy(
    MemoryPointer<RChar> dst,
    MemoryPointer<RChar> src,
  ) => rl.Core.TextCopy(
    dst.asNativePointer(),
    src.asNativePointer(),
  );

  @override
  bool TextIsEqual(
    MemoryPointer<RChar> text1,
    MemoryPointer<RChar> text2,
  ) => rl.Core.TextIsEqual(
    text1.asNativePointer(),
    text2.asNativePointer(),
  );

  @override
  int TextLength(
    MemoryPointer<RChar> text,
  ) => rl.Core.TextLength(
    text.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> TextSubtext(
    MemoryPointer<RChar> text,
    int position,
    int length,
  ) => rl.Core.TextSubtext(
    text.asNativePointer(),
    position,
    length
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextRemoveSpaces(
    MemoryPointer<RChar> text,
  ) => rl.Core.TextRemoveSpaces(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetTextBetween(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> begin,
    MemoryPointer<RChar> end,
  ) => rl.Core.GetTextBetween(
    text.asNativePointer(),
    begin.asNativePointer(),
    end.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextReplace(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> replace,
    MemoryPointer<RChar> by,
  ) => rl.Core.TextReplace(
    text.asNativePointer(),
    replace.asNativePointer(),
    by.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextReplaceAlloc(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> replace,
    MemoryPointer<RChar> by,
  ) => rl.Core.TextReplaceAlloc(
    text.asNativePointer(),
    replace.asNativePointer(),
    by.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextReplaceBetween(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> begin,
    MemoryPointer<RChar> end,
    MemoryPointer<RChar> replacement,
  ) => rl.Core.TextReplaceBetween(
    text.asNativePointer(),
    begin.asNativePointer(),
    end.asNativePointer(),
    replacement.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextReplaceBetweenAlloc(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> begin,
    MemoryPointer<RChar> end,
    MemoryPointer<RChar> replacement,
  ) => rl.Core.TextReplaceBetweenAlloc(
    text.asNativePointer(),
    begin.asNativePointer(),
    end.asNativePointer(),
    replacement.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextInsert(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> insert,
    int position,
  ) => rl.Core.TextInsert(
    text.asNativePointer(),
    insert.asNativePointer(),
    position,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextInsertAlloc(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> insert,
    int position,
  ) => rl.Core.TextInsertAlloc(
    text.asNativePointer(),
    insert.asNativePointer(),
    position,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextJoin(
    MemoryPointer<RPointer<RChar>> textList,
    int count,
    MemoryPointer<RChar> delimiter,
  ) => rl.Core.TextJoin(
    textList.asNativePointer(),
    count,
    delimiter.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RPointer<RChar>> TextSplit(
    MemoryPointer<RChar> text,
    int delimiter,
    MemoryPointer<RInt> count,
  ) => rl.Core.TextSplit(
    text.asNativePointer(),
    delimiter,
    count.asNativePointer(),
  ).asMemoryPointer();

  @override
  void TextAppend(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> append,
    MemoryPointer<RInt> position,
  ) => rl.Core.TextAppend(
    text.asNativePointer(),
    append.asNativePointer(),
    position.asNativePointer(),
  );

  @override
  int TextFindIndex(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> find,
  ) => rl.Core.TextFindIndex(
    text.asNativePointer(),
    find.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> TextToUpper(
    MemoryPointer<RChar> text,
  ) => rl.Core.TextToUpper(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextToLower(
    MemoryPointer<RChar> text,
  ) => rl.Core.TextToLower(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextToPascal(
    MemoryPointer<RChar> text,
  ) => rl.Core.TextToPascal(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextToSnake(
    MemoryPointer<RChar> text,
  ) => rl.Core.TextToSnake(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextToCamel(
    MemoryPointer<RChar> text,
  ) => rl.Core.TextToCamel(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  int TextToInteger(
    MemoryPointer<RChar> text,
  ) => rl.Core.TextToInteger(
    text.asNativePointer(),
  );

  @override
  double TextToFloat(
    MemoryPointer<RChar> text,
  ) => rl.Core.TextToFloat(
    text.asNativePointer(),
  );

  @override
  void DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  ) => rl.Core.DrawLine3D(
    rl.Temp.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPoint3D(
    Vector3D position,
    ColorD color,
  ) => rl.Core.DrawPoint3D(
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircle3D(
    Vector3D center,
    double radius,
    Vector3D rotationAxis,
    double rotationAngle,
    ColorD color,
  ) => rl.Core.DrawCircle3D(
    rl.Temp.Vector3$.Ref1(center).asNativePointer<Vector3C>().ref,
    radius,
    rl.Temp.Vector3$.Ref2(rotationAxis).asNativePointer<Vector3C>().ref,
    rotationAngle,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangle3D(
    Vector3D v1,
    Vector3D v2,
    Vector3D v3,
    ColorD color,
  ) => rl.Core.DrawTriangle3D(
    rl.Temp.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref3(v3).asNativePointer<Vector3C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangleStrip3D(
    StructPointer<Vector3D> points,
    int pointCount,
    ColorD color,
  ) => rl.Core.DrawTriangleStrip3D(
    points.asNativePointer(),
    pointCount,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCube(
    Vector3D position,
    double width,
    double height,
    double length,
    ColorD color,
  ) => rl.Core.DrawCube(
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    width,
    height,
    length,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => rl.Core.DrawCubeV(
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(size).asNativePointer<Vector3C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCubeWires(
    Vector3D position,
    double width,
    double height,
    double length,
    ColorD color,
  ) => rl.Core.DrawCubeWires(
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    width,
    height,
    length,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => rl.Core.DrawCubeWiresV(
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(size).asNativePointer<Vector3C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSphere(
    Vector3D centerPos,
    double radius,
    ColorD color,
  ) => rl.Core.DrawSphere(
    rl.Temp.Vector3$.Ref1(centerPos).asNativePointer<Vector3C>().ref,
    radius,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSphereEx(
    Vector3D centerPos,
    double radius,
    int rings,
    int slices,
    ColorD color,
  ) => rl.Core.DrawSphereEx(
    rl.Temp.Vector3$.Ref1(centerPos).asNativePointer<Vector3C>().ref,
    radius,
    rings,
    slices,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSphereWires(
    Vector3D centerPos,
    double radius,
    int rings,
    int slices,
    ColorD color,
  ) => rl.Core.DrawSphereWires(
    rl.Temp.Vector3$.Ref1(centerPos).asNativePointer<Vector3C>().ref,
    radius,
    rings,
    slices,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCylinder(
    Vector3D position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    ColorD color,
  ) => rl.Core.DrawCylinder(
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    radiusTop,
    radiusBottom,
    height,
    slices,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    double startRadius,
    double endRadius,
    int sides,
    ColorD color,
  ) => rl.Core.DrawCylinderEx(
    rl.Temp.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    startRadius,
    endRadius,
    sides,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCylinderWires(
    Vector3D position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    ColorD color,
  ) => rl.Core.DrawCylinderWires(
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    radiusTop,
    radiusBottom,
    height,
    slices,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    double startRadius,
    double endRadius,
    int sides,
    ColorD color,
  ) => rl.Core.DrawCylinderWiresEx(
    rl.Temp.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    startRadius,
    endRadius,
    sides,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    double radius,
    int slices,
    int rings,
    ColorD color,
  ) => rl.Core.DrawCapsule(
    rl.Temp.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    radius,
    slices,
    rings,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    double radius,
    int slices,
    int rings,
    ColorD color,
  ) => rl.Core.DrawCapsuleWires(
    rl.Temp.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    radius,
    slices,
    rings,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  ) => rl.Core.DrawPlane(
    rl.Temp.Vector3$.Ref1(centerPos).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector2$.Ref1(size).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRay(
    RayD ray,
    ColorD color,
  ) => rl.Core.DrawRay(
    rl.Temp.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawGrid(
    int slices,
    double spacing,
  ) => rl.Core.DrawGrid(
    slices,
    spacing,
  );

  @override
  ModelD LoadModel(
    MemoryPointer<RChar> fileName,
  ) => rl.Temp.Model$.RefCapture(
    RaylibCaptureIds.LoadModel,
    (p) => rl.Core.LoadModel(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  ModelD LoadModelFromMesh(
    MeshD mesh,
  ) => rl.Temp.Model$.RefCapture(
    RaylibCaptureIds.LoadModelFromMesh,
    (p) => rl.Core.LoadModelFromMesh(
      rl.Temp.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool IsModelValid(
    ModelD model,
  ) => rl.Core.IsModelValid(
    rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
  );

  @override
  void UnloadModel(
    ModelD model,
  ) => rl.Core.UnloadModel(
    rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
  );

  @override
  BoundingBoxD GetModelBoundingBox(
    ModelD model,
  ) => rl.Temp.BoundingBox$.Extract1(
    (p) => rl.Core.GetModelBoundingBox(
      rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void DrawModel(
    ModelD model,
    Vector3D position,
    double scale,
    ColorD tint,
  ) => rl.Core.DrawModel(
    rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    scale,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    double rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => rl.Core.DrawModelEx(
    rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(rotationAxis).asNativePointer<Vector3C>().ref,
    rotationAngle,
    rl.Temp.Vector3$.Ref3(scale).asNativePointer<Vector3C>().ref,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawModelWires(
    ModelD model,
    Vector3D position,
    double scale,
    ColorD tint,
  ) => rl.Core.DrawModelWires(
    rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    scale,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    double rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => rl.Core.DrawModelWiresEx(
    rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(rotationAxis).asNativePointer<Vector3C>().ref,
    rotationAngle,
    rl.Temp.Vector3$.Ref3(scale).asNativePointer<Vector3C>().ref,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  ) => rl.Core.DrawBoundingBox(
    rl.Temp.BoundingBox$.Ref1(box).asNativePointer<BoundingBoxC>().ref,
    rl.Temp.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawBillboard(
    Camera3DD camera,
    TextureD texture,
    Vector3D position,
    double scale,
    ColorD tint,
  ) => rl.Core.DrawBillboard(
    rl.Temp.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    scale,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawBillboardRec(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector2D size,
    ColorD tint,
  ) => rl.Core.DrawBillboardRec(
    rl.Temp.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector2$.Ref1(size).asNativePointer<Vector2C>().ref,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
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
    double rotation,
    ColorD tint,
  ) => rl.Core.DrawBillboardPro(
    rl.Temp.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    rl.Temp.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
    rl.Temp.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector3$.Ref2(up).asNativePointer<Vector3C>().ref,
    rl.Temp.Vector2$.Ref1(size).asNativePointer<Vector2C>().ref,
    rl.Temp.Vector2$.Ref2(origin).asNativePointer<Vector2C>().ref,
    rotation,
    rl.Temp.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void UploadMesh(
    StructPointer<MeshD> mesh,
    bool dynamic,
  ) => rl.Core.UploadMesh(
    mesh.asNativePointer(),
    dynamic,
  );

  @override
  void UpdateMeshBuffer(
    MeshD mesh,
    int index,
    MemoryPointer<RVoid> data,
    int dataSize,
    int offset,
  ) => rl.Core.UpdateMeshBuffer(
    rl.Temp.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    index,
    data.asNativePointer(),
    dataSize,
    offset,
  );

  @override
  void UnloadMesh(
    MeshD mesh,
  ) => rl.Core.UnloadMesh(
    rl.Temp.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
  );

  @override
  void DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  ) => rl.Core.DrawMesh(
    rl.Temp.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    rl.Temp.Material$.Ref1(material).asNativePointer<MaterialC>().ref,
    rl.Temp.Matrix$.Ref1(transform).asNativePointer<MatrixC>().ref,
  );

  @override
  void DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    StructPointer<MatrixD> transforms,
    int instances,
  ) => rl.Core.DrawMeshInstanced(
    rl.Temp.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    rl.Temp.Material$.Ref1(material).asNativePointer<MaterialC>().ref,
    transforms.asNativePointer(),
    instances,
  );

  @override
  BoundingBoxD GetMeshBoundingBox(
    MeshD mesh,
  ) => rl.Temp.BoundingBox$.Extract1(
    (p) => rl.Core.GetMeshBoundingBox(
      rl.Temp.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void GenMeshTangents(
    StructPointer<MeshD> mesh,
  ) => rl.Core.GenMeshTangents(
    mesh.asNativePointer(),
  );

  @override
  bool ExportMesh(
    MeshD mesh,
    MemoryPointer<RChar> fileName,
  ) => rl.Core.ExportMesh(
    rl.Temp.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    fileName.asNativePointer(),
  );

  @override
  bool ExportMeshAsCode(
    MeshD mesh,
    MemoryPointer<RChar> fileName,
  ) => rl.Core.ExportMeshAsCode(
    rl.Temp.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    fileName.asNativePointer(),
  );

  @override
  MeshD GenMeshPoly(
    int sides,
    double radius,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshPoly,
    (p) => rl.Core.GenMeshPoly(
      sides,
      radius,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshPlane(
    double width,
    double length,
    int resX,
    int resZ,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshPlane,
    (p) => rl.Core.GenMeshPlane(
      width,
      length,
      resX,
      resZ,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshCube(
    double width,
    double height,
    double length,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCube,
    (p) => rl.Core.GenMeshCube(
      width,
      height,
      length,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshSphere(
    double radius,
    int rings,
    int slices,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshSphere,
    (p) => rl.Core.GenMeshSphere(
      radius,
      rings,
      slices,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshHemiSphere(
    double radius,
    int rings,
    int slices,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshHemiSphere,
    (p) => rl.Core.GenMeshHemiSphere(
      radius,
      rings,
      slices,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshCylinder(
    double radius,
    double height,
    int slices,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCylinder,
    (p) => rl.Core.GenMeshCylinder(
      radius,
      height,
      slices,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshCone(
    double radius,
    double height,
    int slices,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCone,
    (p) => rl.Core.GenMeshCone(
      radius,
      height,
      slices,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshTorus(
    double radius,
    double size,
    int radSeg,
    int sides,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshTorus,
    (p) => rl.Core.GenMeshTorus(
      radius,
      size,
      radSeg,
      sides,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshKnot(
    double radius,
    double size,
    int radSeg,
    int sides,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshKnot,
    (p) => rl.Core.GenMeshKnot(
      radius,
      size,
      radSeg,
      sides,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshHeightmap(
    ImageD heightmap,
    Vector3D size,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshHeightmap,
    (p) => rl.Core.GenMeshHeightmap(
      rl.Temp.Image$.Ref1(heightmap).asNativePointer<ImageC>().ref,
      rl.Temp.Vector3$.Ref1(size).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  ) => rl.Temp.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCubicmap,
    (p) => rl.Core.GenMeshCubicmap(
      rl.Temp.Image$.Ref1(cubicmap).asNativePointer<ImageC>().ref,
      rl.Temp.Vector3$.Ref1(cubeSize).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  StructPointer<MaterialD> LoadMaterials(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> materialCount,
  ) => MaterialD.pointer(rl.Core.LoadMaterials(
    fileName.asNativePointer(),
    materialCount.asNativePointer(),
  ).asMemoryPointer());

  @override
  MaterialD LoadMaterialDefault() => rl.Temp.Material$.Extract1(
    (p) => rl.Core.LoadMaterialDefault().toDart(p.asNativePointer()),
  );

  @override
  bool IsMaterialValid(
    MaterialD material,
  ) => rl.Core.IsMaterialValid(
    rl.Temp.Material$.Ref1(material).asNativePointer<MaterialC>().ref,
  );

  @override
  void UnloadMaterial(
    MaterialD material,
  ) => rl.Core.UnloadMaterial(
    rl.Temp.Material$.Ref1(material).asNativePointer<MaterialC>().ref,
  );

  @override
  void SetMaterialTexture(
    StructPointer<MaterialD> material,
    int mapType,
    TextureD texture,
  ) => rl.Core.SetMaterialTexture(
    material.asNativePointer(),
    mapType,
    rl.Temp.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
  );

  @override
  void SetModelMeshMaterial(
    StructPointer<ModelD> model,
    int meshId,
    int materialId,
  ) => rl.Core.SetModelMeshMaterial(
    model.asNativePointer(),
    meshId,
    materialId,
  );

  @override
  StructPointer<ModelAnimationD> LoadModelAnimations(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> animCount,
  ) => ModelAnimationD.pointer(rl.Core.LoadModelAnimations(
    fileName.asNativePointer(),
    animCount.asNativePointer(),
  ).asMemoryPointer());

  @override
  void UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    double frame,
  ) => rl.Core.UpdateModelAnimation(
    rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    rl.Temp.ModelAnimation$.Ref1(anim).asNativePointer<ModelAnimationC>().ref,
    frame,
  );

  @override
  void UpdateModelAnimationEx(
    ModelD model,
    ModelAnimationD animA,
    double frameA,
    ModelAnimationD animB,
    double frameB,
    double blend,
  ) => rl.Core.UpdateModelAnimationEx(
    rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    rl.Temp.ModelAnimation$.Ref1(animA).asNativePointer<ModelAnimationC>().ref,
    frameA,
    rl.Temp.ModelAnimation$.Ref2(animB).asNativePointer<ModelAnimationC>().ref,
    frameB,
    blend,
  );

  @override
  void UnloadModelAnimations(
    StructPointer<ModelAnimationD> animations,
    int animCount,
  ) => rl.Core.UnloadModelAnimations(
    animations.asNativePointer(),
    animCount,
  );

  @override
  bool IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  ) => rl.Core.IsModelAnimationValid(
    rl.Temp.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    rl.Temp.ModelAnimation$.Ref1(anim).asNativePointer<ModelAnimationC>().ref,
  );

  @override
  bool CheckCollisionSpheres(
    Vector3D center1,
    double radius1,
    Vector3D center2,
    double radius2,
  ) => rl.Core.CheckCollisionSpheres(
    rl.Temp.Vector3$.Ref1(center1).asNativePointer<Vector3C>().ref,
    radius1,
    rl.Temp.Vector3$.Ref2(center2).asNativePointer<Vector3C>().ref,
    radius2,
  );

  @override
  bool CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  ) => rl.Core.CheckCollisionBoxes(
    rl.Temp.BoundingBox$.Ref1(box1).asNativePointer<BoundingBoxC>().ref,
    rl.Temp.BoundingBox$.Ref2(box2).asNativePointer<BoundingBoxC>().ref,
  );

  @override
  bool CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    double radius,
  ) => rl.Core.CheckCollisionBoxSphere(
    rl.Temp.BoundingBox$.Ref1(box).asNativePointer<BoundingBoxC>().ref,
    rl.Temp.Vector3$.Ref1(center).asNativePointer<Vector3C>().ref,
    radius,
  );

  @override
  RayCollisionD GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    double radius,
  ) => rl.Temp.RayCollision$.Extract1(
    (p) => rl.Core.GetRayCollisionSphere(
      rl.Temp.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      rl.Temp.Vector3$.Ref1(center).asNativePointer<Vector3C>().ref,
      radius,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayCollisionD GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  ) => rl.Temp.RayCollision$.Extract1(
    (p) => rl.Core.GetRayCollisionBox(
      rl.Temp.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      rl.Temp.BoundingBox$.Ref1(box).asNativePointer<BoundingBoxC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayCollisionD GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  ) => rl.Temp.RayCollision$.Extract1(
    (p) => rl.Core.GetRayCollisionMesh(
      rl.Temp.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      rl.Temp.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
      rl.Temp.Matrix$.Ref1(transform).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayCollisionD GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  ) => rl.Temp.RayCollision$.Extract1(
    (p) => rl.Core.GetRayCollisionTriangle(
      rl.Temp.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      rl.Temp.Vector3$.Ref1(p1).asNativePointer<Vector3C>().ref,
      rl.Temp.Vector3$.Ref2(p2).asNativePointer<Vector3C>().ref,
      rl.Temp.Vector3$.Ref3(p3).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayCollisionD GetRayCollisionQuad(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
    Vector3D p4,
  ) => rl.Temp.RayCollision$.Extract1(
    (p) => rl.Core.GetRayCollisionQuad(
      rl.Temp.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      rl.Temp.Vector3$.Ref1(p1).asNativePointer<Vector3C>().ref,
      rl.Temp.Vector3$.Ref2(p2).asNativePointer<Vector3C>().ref,
      rl.Temp.Vector3$.Ref3(p3).asNativePointer<Vector3C>().ref,
      rl.Temp.Vector3$.Ref4(p4).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );
}
