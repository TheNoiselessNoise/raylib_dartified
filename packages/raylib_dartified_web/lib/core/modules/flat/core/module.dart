part of '../../../raylib_dartified_web.dart';

final class RaylibCoreFlatWeb extends RaylibCoreFlat<Raylib> {

  RaylibCoreFlatWeb(super.rl);

  RaylibCore get _wasm => rl.module();

  @override
  void InitWindow(
    int width,
    int height,
    XPtr<XChar> title,
  ) => _wasm.InitWindow(
    width.toJS,
    height.toJS,
    title.toJS,
  );

  @override
  void CloseWindow() => _wasm.CloseWindow();

  @override
  bool WindowShouldClose() => _wasm.WindowShouldClose();

  @override
  bool IsWindowReady() => _wasm.IsWindowReady();

  @override
  bool IsWindowFullscreen() => _wasm.IsWindowFullscreen();

  @override
  bool IsWindowHidden() => _wasm.IsWindowHidden();

  @override
  bool IsWindowMinimized() => _wasm.IsWindowMinimized();

  @override
  bool IsWindowMaximized() => _wasm.IsWindowMaximized();

  @override
  bool IsWindowFocused() => _wasm.IsWindowFocused();

  @override
  bool IsWindowResized() => _wasm.IsWindowResized();

  @override
  bool IsWindowState(
    int flag,
  ) => _wasm.IsWindowState(
    flag.toJS,
  );

  @override
  void SetWindowState(
    int flags,
  ) => _wasm.SetWindowState(
    flags.toJS,
  );

  @override
  void ClearWindowState(
    int flags,
  ) => _wasm.ClearWindowState(
    flags.toJS,
  );

  @override
  void ToggleFullscreen() => _wasm.ToggleFullscreen();

  @override
  void ToggleBorderlessWindowed() => _wasm.ToggleBorderlessWindowed();

  @override
  void MaximizeWindow() => _wasm.MaximizeWindow();

  @override
  void MinimizeWindow() => _wasm.MinimizeWindow();

  @override
  void RestoreWindow() => _wasm.RestoreWindow();

  @override
  void SetWindowIcon(
    Image image,
  ) => _wasm.SetWindowIcon(
    Image$.Ref1(image).toJS,
  );

  @override
  void SetWindowIcons(
    XStructPtr<Image> images,
    int count,
  ) => _wasm.SetWindowIcons(
    images.toJS,
    count.toJS,
  );

  @override
  void SetWindowTitle(
    XPtr<XChar> title,
  ) => _wasm.SetWindowTitle(
    title.toJS,
  );

  @override
  void SetWindowPosition(
    int x,
    int y,
  ) => _wasm.SetWindowPosition(
    x.toJS,
    y.toJS,
  );

  @override
  void SetWindowMonitor(
    int monitor,
  ) => _wasm.SetWindowMonitor(
    monitor.toJS,
  );

  @override
  void SetWindowMinSize(
    int width,
    int height,
  ) => _wasm.SetWindowMinSize(
    width.toJS,
    height.toJS,
  );

  @override
  void SetWindowMaxSize(
    int width,
    int height,
  ) => _wasm.SetWindowMaxSize(
    width.toJS,
    height.toJS,
  );

  @override
  void SetWindowSize(
    int width,
    int height,
  ) => _wasm.SetWindowSize(
    width.toJS,
    height.toJS,
  );

  @override
  void SetWindowOpacity(
    double opacity,
  ) => _wasm.SetWindowOpacity(
    opacity.toJS,
  );

  @override
  void SetWindowFocused() => _wasm.SetWindowFocused();

  @override
  XWasmPtr<XVoid> GetWindowHandle() => _wasm.GetWindowHandle();

  @override
  int GetScreenWidth() => _wasm.GetScreenWidth();

  @override
  int GetScreenHeight() => _wasm.GetScreenHeight();

  @override
  int GetRenderWidth() => _wasm.GetRenderWidth();

  @override
  int GetRenderHeight() => _wasm.GetRenderHeight();

  @override
  int GetMonitorCount() => _wasm.GetMonitorCount();

  @override
  int GetCurrentMonitor() => _wasm.GetCurrentMonitor();

  @override
  Vector2 GetMonitorPosition(
    int monitor,
  ) => Vector2$.Extract(
    (p) => _wasm.GetMonitorPosition(
      p.toJS,
      monitor.toJS,
    ),
  );

  @override
  int GetMonitorWidth(
    int monitor,
  ) => _wasm.GetMonitorWidth(
    monitor.toJS,
  );

  @override
  int GetMonitorHeight(
    int monitor,
  ) => _wasm.GetMonitorHeight(
    monitor.toJS,
  );

  @override
  int GetMonitorPhysicalWidth(
    int monitor,
  ) => _wasm.GetMonitorPhysicalWidth(
    monitor.toJS,
  );

  @override
  int GetMonitorPhysicalHeight(
    int monitor,
  ) => _wasm.GetMonitorPhysicalHeight(
    monitor.toJS,
  );

  @override
  int GetMonitorRefreshRate(
    int monitor,
  ) => _wasm.GetMonitorRefreshRate(
    monitor.toJS,
  );

  @override
  Vector2 GetWindowPosition() => Vector2$.Extract(
    (p) => _wasm.GetWindowPosition(
      p.toJS,
    ),
  );

  @override
  Vector2 GetWindowScaleDPI() => Vector2$.Extract(
    (p) => _wasm.GetWindowScaleDPI(
      p.toJS,
    ),
  );

  @override
  XWasmPtr<XChar> GetMonitorName(
    int monitor,
  ) => _wasm.GetMonitorName(
    monitor.toJS,
  );

  @override
  void SetClipboardText(
    XPtr<XChar> text,
  ) => _wasm.SetClipboardText(
    text.toJS,
  );

  @override
  XWasmPtr<XChar> GetClipboardText() => _wasm.GetClipboardText();

  @override
  Image GetClipboardImage() => Image$.RefCapture(
    RaylibCaptureIds.GetClipboardImage,
    (p) => _wasm.GetClipboardImage(
      p.toJS,
    ),
  );

  @override
  void EnableEventWaiting() => _wasm.EnableEventWaiting();

  @override
  void DisableEventWaiting() => _wasm.DisableEventWaiting();

  @override
  void ShowCursor() => _wasm.ShowCursor();

  @override
  void HideCursor() => _wasm.HideCursor();

  @override
  bool IsCursorHidden() => _wasm.IsCursorHidden();

  @override
  void EnableCursor() => _wasm.EnableCursor();

  @override
  void DisableCursor() => _wasm.DisableCursor();

  @override
  bool IsCursorOnScreen() => _wasm.IsCursorOnScreen();

  @override
  void ClearBackground(
    Color color,
  ) => _wasm.ClearBackground(
    Color$.Ref1(color).toJS,
  );

  @override
  void BeginDrawing() => _wasm.BeginDrawing();

  @override
  void EndDrawing() => _wasm.EndDrawing();

  @override
  void BeginMode2D(
    Camera2D camera,
  ) => _wasm.BeginMode2D(
    Camera2D$.Ref1(camera).toJS,
  );

  @override
  void EndMode2D() => _wasm.EndMode2D();

  @override
  void BeginMode3D(
    Camera3D camera,
  ) => _wasm.BeginMode3D(
    Camera3D$.Ref1(camera).toJS,
  );

  @override
  void EndMode3D() => _wasm.EndMode3D();

  @override
  void BeginTextureMode(
    RenderTexture target,
  ) => _wasm.BeginTextureMode(
    RenderTexture$.Ref1(target).toJS,
  );

  @override
  void EndTextureMode() => _wasm.EndTextureMode();

  @override
  void BeginShaderMode(
    Shader shader,
  ) => _wasm.BeginShaderMode(
    Shader$.Ref1(shader).toJS,
  );

  @override
  void EndShaderMode() => _wasm.EndShaderMode();

  @override
  void BeginBlendMode(
    int mode,
  ) => _wasm.BeginBlendMode(
    mode.toJS,
  );

  @override
  void EndBlendMode() => _wasm.EndBlendMode();

  @override
  void BeginScissorMode(
    int x,
    int y,
    int width,
    int height,
  ) => _wasm.BeginScissorMode(
    x.toJS,
    y.toJS,
    width.toJS,
    height.toJS,
  );

  @override
  void EndScissorMode() => _wasm.EndScissorMode();

  @override
  void BeginVrStereoMode(
    VrStereoConfig config,
  ) => _wasm.BeginVrStereoMode(
    VrStereoConfig$.Ref1(config).toJS,
  );

  @override
  void EndVrStereoMode() => _wasm.EndVrStereoMode();

  @override
  VrStereoConfig LoadVrStereoConfig(
    VrDeviceInfo device,
  ) => VrStereoConfig$.RefCapture(
    RaylibCaptureIds.LoadVrStereoConfig,
    (p) => _wasm.LoadVrStereoConfig(
      p.toJS,
      VrDeviceInfo$.Ref1(device).toJS,
    ),
  );

  @override
  void UnloadVrStereoConfig(
    VrStereoConfig config,
  ) => disposeStructWithOpFreed(config, (ptr) {
    _wasm.UnloadVrStereoConfig(
      ptr.toJS,
    );
  });

  @override
  Shader LoadShader(
    XPtr<XChar> vsFileName,
    XPtr<XChar> fsFileName,
  ) => Shader$.RefCapture(
    RaylibCaptureIds.LoadShader,
    (p) => _wasm.LoadShader(
      p.toJS,
      vsFileName.toJS,
      fsFileName.toJS,
    ),
  );

  @override
  Shader LoadShaderFromMemory(
    XPtr<XChar> vsCode,
    XPtr<XChar> fsCode,
  ) => Shader$.RefCapture(
    RaylibCaptureIds.LoadShaderFromMemory,
    (p) => _wasm.LoadShaderFromMemory(
      p.toJS,
      vsCode.toJS,
      fsCode.toJS,
    ),
  );

  @override
  bool IsShaderValid(
    Shader shader,
  ) => _wasm.IsShaderValid(
    Shader$.Ref1(shader).toJS,
  );

  @override
  int GetShaderLocation(
    Shader shader,
    XPtr<XChar> uniformName,
  ) => _wasm.GetShaderLocation(
    Shader$.Ref1(shader).toJS,
    uniformName.toJS,
  );

  @override
  int GetShaderLocationAttrib(
    Shader shader,
    XPtr<XChar> attribName,
  ) => _wasm.GetShaderLocationAttrib(
    Shader$.Ref1(shader).toJS,
    attribName.toJS,
  );

  @override
  void SetShaderValueV(
    Shader shader,
    int locIndex,
    XPtr<XVoid> value,
    int uniformType,
    int count,
  ) => _wasm.SetShaderValueV(
    Shader$.Ref1(shader).toJS,
    locIndex.toJS,
    value.toJS,
    uniformType.toJS,
    count.toJS,
  );

  @override
  void SetShaderValueMatrix(
    Shader shader,
    int locIndex,
    Matrix mat,
  ) => _wasm.SetShaderValueMatrix(
    Shader$.Ref1(shader).toJS,
    locIndex.toJS,
    Matrix$.Ref1(mat).toJS,
  );

  @override
  void SetShaderValueTexture(
    Shader shader,
    int locIndex,
    Texture texture,
  ) => _wasm.SetShaderValueTexture(
    Shader$.Ref1(shader).toJS,
    locIndex.toJS,
    Texture$.Ref1(texture).toJS,
  );

  @override
  void UnloadShader(
    Shader shader,
  ) => _wasm.UnloadShader(
    shader.getOpAndDispose().toJS,
  );

  @override
  Ray GetScreenToWorldRay(
    Vector2 position,
    Camera3D camera,
  ) => Ray$.Extract(
    (p) => _wasm.GetScreenToWorldRay(
      p.toJS,
      Vector2$.Ref1(position).toJS,
      Camera3D$.Ref1(camera).toJS,
    ),
  );

  @override
  Ray GetScreenToWorldRayEx(
    Vector2 position,
    Camera3D camera,
    int width,
    int height,
  ) => Ray$.Extract(
    (p) => _wasm.GetScreenToWorldRayEx(
      p.toJS,
      Vector2$.Ref1(position).toJS,
      Camera3D$.Ref1(camera).toJS,
      width.toJS,
      height.toJS,
    ),
  );

  @override
  Vector2 GetWorldToScreen(
    Vector3 position,
    Camera3D camera,
  ) => Vector2$.Extract(
    (p) => _wasm.GetWorldToScreen(
      p.toJS,
      Vector3$.Ref1(position).toJS,
      Camera3D$.Ref1(camera).toJS,
    ),
  );

  @override
  Vector2 GetWorldToScreenEx(
    Vector3 position,
    Camera3D camera,
    int width,
    int height,
  ) => Vector2$.Extract(
    (p) => _wasm.GetWorldToScreenEx(
      p.toJS,
      Vector3$.Ref1(position).toJS,
      Camera3D$.Ref1(camera).toJS,
      width.toJS,
      height.toJS,
    ),
  );

  @override
  Vector2 GetWorldToScreen2D(
    Vector2 position,
    Camera2D camera,
  ) => Vector2$.Extract(
    (p) => _wasm.GetWorldToScreen2D(
      p.toJS,
      Vector2$.Ref2(position).toJS,
      Camera2D$.Ref1(camera).toJS,
    ),
  );

  @override
  Vector2 GetScreenToWorld2D(
    Vector2 position,
    Camera2D camera,
  ) => Vector2$.Extract(
    (p) => _wasm.GetScreenToWorld2D(
      p.toJS,
      Vector2$.Ref2(position).toJS,
      Camera2D$.Ref1(camera).toJS,
    ),
  );

  @override
  Matrix GetCameraMatrix(
    Camera3D camera,
  ) => Matrix$.Extract(
    (p) => _wasm.GetCameraMatrix(
      p.toJS,
      Camera3D$.Ref1(camera).toJS,
    ),
  );

  @override
  Matrix GetCameraMatrix2D(
    Camera2D camera,
  ) => Matrix$.Extract(
    (p) => _wasm.GetCameraMatrix2D(
      p.toJS,
      Camera2D$.Ref1(camera).toJS,
    ),
  );

  @override
  void SetTargetFPS(
    int fps,
  ) => _wasm.SetTargetFPS(
    fps.toJS,
  );

  @override
  double GetFrameTime() => _wasm.GetFrameTime();

  @override
  double GetTime() => _wasm.GetTime();

  @override
  int GetFPS() => _wasm.GetFPS();

  @override
  void SwapScreenBuffer() => _wasm.SwapScreenBuffer();

  @override
  void PollInputEvents() => _wasm.PollInputEvents();

  @override
  void WaitTime(
    double seconds,
  ) => _wasm.WaitTime(
    seconds.toJS,
  );

  @override
  void SetRandomSeed(
    int seed,
  ) => _wasm.SetRandomSeed(
    seed.toJS,
  );

  @override
  int GetRandomValue(
    int min,
    int max,
  ) => _wasm.GetRandomValue(
    min.toJS,
    max.toJS,
  );

  @override
  XWasmPtr<XInt> LoadRandomSequence(
    int count,
    int min,
    int max,
  ) => _wasm.LoadRandomSequence(
    count.toJS,
    min.toJS,
    max.toJS,
  );

  @override
  void UnloadRandomSequence(
    XPtr<XInt> sequence,
  ) => _wasm.UnloadRandomSequence(
    sequence.toJS,
  );

  @override
  void TakeScreenshot(
    XPtr<XChar> fileName,
  ) => _wasm.TakeScreenshot(
    fileName.toJS,
  );

  @override
  void SetConfigFlags(
    int flags,
  ) => _wasm.SetConfigFlags(
    flags.toJS,
  );

  @override
  void OpenURL(
    XPtr<XChar> url,
  ) => _wasm.OpenURL(
    url.toJS,
  );

  @override
  void TraceLog(
    int logLevel,
    XPtr<XChar> text,
    // NOTE: missing va_list argument
  ) => _wasm.TraceLog(
    logLevel.toJS,
    text.toJS,
  );

  @override
  void SetTraceLogLevel(
    int logLevel,
  ) => _wasm.SetTraceLogLevel(
    logLevel.toJS,
  );

  @override
  void SetTraceLogCallback(
    XPtr<XFunction<TraceLogCallbackBase>> callback,
  ) => _wasm.SetTraceLogCallback(
    callback.toJS,
  );

  @override
  void SetLoadFileDataCallback(
    XPtr<XFunction<LoadFileDataCallbackBase>> callback,
  ) => _wasm.SetLoadFileDataCallback(
    callback.toJS,
  );

  @override
  void SetSaveFileDataCallback(
    XPtr<XFunction<SaveFileDataCallbackBase>> callback,
  ) => _wasm.SetSaveFileDataCallback(
    callback.toJS,
  );

  @override
  void SetLoadFileTextCallback(
    XPtr<XFunction<LoadFileTextCallbackBase>> callback,
  ) => _wasm.SetLoadFileTextCallback(
    callback.toJS,
  );

  @override
  void SetSaveFileTextCallback(
    XPtr<XFunction<SaveFileTextCallbackBase>> callback,
  ) => _wasm.SetSaveFileTextCallback(
    callback.toJS,
  );

  @override
  XWasmPtr<XUnsignedChar> LoadFileData(
    XPtr<XChar> fileName,
    XPtr<XInt> dataSize,
  ) => _wasm.LoadFileData(
    fileName.toJS,
    dataSize.toJS,
  );

  @override
  void UnloadFileData(
    XPtr<XUnsignedChar> data,
  ) => _wasm.UnloadFileData(
    data.toJS,
  );

  @override
  bool SaveFileData(
    XPtr<XChar> fileName,
    XPtr<XVoid> data,
    int dataSize,
  ) => _wasm.SaveFileData(
    fileName.toJS,
    data.toJS,
    dataSize.toJS,
  );

  @override
  bool ExportDataAsCode(
    XPtr<XUnsignedChar> data,
    int dataSize,
    XPtr<XChar> fileName,
  ) => _wasm.ExportDataAsCode(
    data.toJS,
    dataSize.toJS,
    fileName.toJS,
  );

  @override
  XWasmPtr<XChar> LoadFileText(
    XPtr<XChar> fileName,
  ) => _wasm.LoadFileText(
    fileName.toJS,
  );

  @override
  void UnloadFileText(
    XPtr<XChar> text,
  ) => _wasm.UnloadFileText(
    text.toJS,
  );

  @override
  bool SaveFileText(
    XPtr<XChar> fileName,
    XPtr<XChar> text,
  ) => _wasm.SaveFileText(
    fileName.toJS,
    text.toJS,
  );

  @override
  int FileRename(
    XPtr<XChar> fileName,
    XPtr<XChar> fileRename,
  ) => _wasm.FileRename(
    fileName.toJS,
    fileRename.toJS,
  );

  @override
  int FileRemove(
    XPtr<XChar> fileName,
  ) => _wasm.FileRemove(
    fileName.toJS,
  );

  @override
  int FileCopy(
    XPtr<XChar> srcPath,
    XPtr<XChar> dstPath,
  ) => _wasm.FileCopy(
    srcPath.toJS,
    dstPath.toJS,
  );

  @override
  int FileMove(
    XPtr<XChar> srcPath,
    XPtr<XChar> dstPath,
  ) => _wasm.FileMove(
    srcPath.toJS,
    dstPath.toJS,
  );

  @override
  int FileTextReplace(
    XPtr<XChar> fileName,
    XPtr<XChar> search,
    XPtr<XChar> replacement,
  ) => _wasm.FileTextReplace(
    fileName.toJS,
    search.toJS,
    replacement.toJS,
  );

  @override
  int FileTextFindIndex(
    XPtr<XChar> fileName,
    XPtr<XChar> search,
  ) => _wasm.FileTextFindIndex(
    fileName.toJS,
    search.toJS,
  );

  @override
  bool FileExists(
    XPtr<XChar> fileName,
  ) => _wasm.FileExists(
    fileName.toJS,
  );

  @override
  bool DirectoryExists(
    XPtr<XChar> dirPath,
  ) => _wasm.DirectoryExists(
    dirPath.toJS,
  );

  @override
  bool IsFileExtension(
    XPtr<XChar> fileName,
    XPtr<XChar> ext,
  ) => _wasm.IsFileExtension(
    fileName.toJS,
    ext.toJS,
  );

  @override
  int GetFileLength(
    XPtr<XChar> fileName,
  ) => _wasm.GetFileLength(
    fileName.toJS,
  );

  @override
  XWasmPtr<XChar> GetFileExtension(
    XPtr<XChar> fileName,
  ) => _wasm.GetFileExtension(
    fileName.toJS,
  );

  @override
  XWasmPtr<XChar> GetFileName(
    XPtr<XChar> filePath,
  ) => _wasm.GetFileName(
    filePath.toJS,
  );

  @override
  XWasmPtr<XChar> GetFileNameWithoutExt(
    XPtr<XChar> filePath,
  ) => _wasm.GetFileNameWithoutExt(
    filePath.toJS,
  );

  @override
  int GetDirectoryFileCount(
    XPtr<XChar> dirPath,
  ) => _wasm.GetDirectoryFileCount(
    dirPath.toJS,
  );

  @override
  int GetDirectoryFileCountEx(
    XPtr<XChar> basePath,
    XPtr<XChar> filter,
    bool scanSubdirs,
  ) => _wasm.GetDirectoryFileCountEx(
    basePath.toJS,
    filter.toJS,
    scanSubdirs.toJS,
  );

  @override
  XWasmPtr<XChar> GetDirectoryPath(
    XPtr<XChar> filePath,
  ) => _wasm.GetDirectoryPath(
    filePath.toJS,
  );

  @override
  XWasmPtr<XChar> GetPrevDirectoryPath(
    XPtr<XChar> dirPath,
  ) => _wasm.GetPrevDirectoryPath(
    dirPath.toJS,
  );

  @override
  XWasmPtr<XChar> GetWorkingDirectory() => _wasm.GetWorkingDirectory();

  @override
  XWasmPtr<XChar> GetApplicationDirectory() => _wasm.GetApplicationDirectory();

  @override
  int MakeDirectory(
    XPtr<XChar> dirPath,
  ) => _wasm.MakeDirectory(
    dirPath.toJS,
  );

  @override
  bool ChangeDirectory(
    XPtr<XChar> dir,
  ) => _wasm.ChangeDirectory(
    dir.toJS,
  );

  @override
  bool IsPathFile(
    XPtr<XChar> path,
  ) => _wasm.IsPathFile(
    path.toJS,
  );

  @override
  bool IsFileNameValid(
    XPtr<XChar> fileName,
  ) => _wasm.IsFileNameValid(
    fileName.toJS,
  );

  @override
  FilePathList LoadDirectoryFiles(
    XPtr<XChar> dirPath,
  ) => FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDirectoryFiles,
    (p) => _wasm.LoadDirectoryFiles(
      p.toJS,
      dirPath.toJS,
    ),
  );

  @override
  FilePathList LoadDirectoryFilesEx(
    XPtr<XChar> basePath,
    XPtr<XChar> filter,
    bool scanSubdirs,
  ) => FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDirectoryFilesEx,
    (p) => _wasm.LoadDirectoryFilesEx(
      p.toJS,
      basePath.toJS,
      filter.toJS,
      scanSubdirs.toJS,
    ),
  );

  @override
  void UnloadDirectoryFiles(
    FilePathList files,
  ) => _wasm.UnloadDirectoryFiles(
    files.getOpAndDispose().toJS,
  );

  @override
  bool IsFileDropped() => _wasm.IsFileDropped();

  @override
  FilePathList LoadDroppedFiles() => FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDroppedFiles,
    (p) => _wasm.LoadDroppedFiles(
      p.toJS,
    ),
  );

  @override
  void UnloadDroppedFiles(
    FilePathList files,
  ) => _wasm.UnloadDroppedFiles(
    files.getOpAndDispose().toJS,
  );

  @override
  int GetFileModTime(
    XPtr<XChar> fileName,
  ) => _wasm.GetFileModTime(
    fileName.toJS,
  );

  @override
  XWasmPtr<XUnsignedChar> CompressData(
    XPtr<XUnsignedChar> data,
    int dataSize,
    XPtr<XInt> compDataSize,
  ) => _wasm.CompressData(
    data.toJS,
    dataSize.toJS,
    compDataSize.toJS,
  );

  @override
  XWasmPtr<XUnsignedChar> DecompressData(
    XPtr<XUnsignedChar> compData,
    int compDataSize,
    XPtr<XInt> dataSize,
  ) => _wasm.DecompressData(
    compData.toJS,
    compDataSize.toJS,
    dataSize.toJS,
  );

  @override
  XWasmPtr<XChar> EncodeDataBase64(
    XPtr<XUnsignedChar> data,
    int dataSize,
    XPtr<XInt> outputSize,
  ) => _wasm.EncodeDataBase64(
    data.toJS,
    dataSize.toJS,
    outputSize.toJS,
  );

  @override
  XWasmPtr<XUnsignedChar> DecodeDataBase64(
    XPtr<XChar> data,
    XPtr<XInt> outputSize,
  ) => _wasm.DecodeDataBase64(
    data.toJS,
    outputSize.toJS,
  );

  @override
  int ComputeCRC32(
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => _wasm.ComputeCRC32(
    data.toJS,
    dataSize.toJS,
  );

  @override
  XWasmPtr<XUnsignedInt> ComputeMD5(
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => _wasm.ComputeMD5(
    data.toJS,
    dataSize.toJS,
  );

  @override
  XWasmPtr<XUnsignedInt> ComputeSHA1(
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => _wasm.ComputeSHA1(
    data.toJS,
    dataSize.toJS,
  );

  @override
  XWasmPtr<XUnsignedInt> ComputeSHA256(
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => _wasm.ComputeSHA256(
    data.toJS,
    dataSize.toJS,
  );

  @override
  AutomationEventList LoadAutomationEventList(
    XPtr<XChar> fileName,
  ) => AutomationEventList$.RefCapture(
    RaylibCaptureIds.LoadAutomationEventList,
    (p) => _wasm.LoadAutomationEventList(
      p.toJS,
      fileName.toJS,
    ),
  );

  @override
  void UnloadAutomationEventList(
    AutomationEventList list,
  ) => disposeStructWithOpFreed(list, (ptr) {
    _wasm.UnloadAutomationEventList(
      ptr.toJS,
    );
  });

  @override
  bool ExportAutomationEventList(
    AutomationEventList list,
    XPtr<XChar> fileName,
  ) => _wasm.ExportAutomationEventList(
    AutomationEventList$.Ref1(list).toJS,
    fileName.toJS,
  );

  @override
  void SetAutomationEventList(
    XStructPtr<AutomationEventList> list,
  ) => _wasm.SetAutomationEventList(
    list.toJS,
  );

  @override
  void SetAutomationEventBaseFrame(
    int frame,
  ) => _wasm.SetAutomationEventBaseFrame(
    frame.toJS,
  );

  @override
  void StartAutomationEventRecording() => _wasm.StartAutomationEventRecording();

  @override
  void StopAutomationEventRecording() => _wasm.StopAutomationEventRecording();

  @override
  void PlayAutomationEvent(
    AutomationEvent event,
  ) => _wasm.PlayAutomationEvent(
    AutomationEvent$.Ref1(event).toJS,
  );

  @override
  bool IsKeyPressed(
    int key,
  ) => _wasm.IsKeyPressed(
    key.toJS,
  );

  @override
  bool IsKeyPressedRepeat(
    int key,
  ) => _wasm.IsKeyPressedRepeat(
    key.toJS,
  );

  @override
  bool IsKeyDown(
    int key,
  ) => _wasm.IsKeyDown(
    key.toJS,
  );

  @override
  bool IsKeyReleased(
    int key,
  ) => _wasm.IsKeyReleased(
    key.toJS,
  );

  @override
  bool IsKeyUp(
    int key,
  ) => _wasm.IsKeyUp(
    key.toJS,
  );

  @override
  XWasmPtr<XChar> GetKeyName(
    int key,
  ) => _wasm.GetKeyName(
    key.toJS,
  );

  @override
  int GetKeyPressed() => _wasm.GetKeyPressed();

  @override
  int GetCharPressed() => _wasm.GetCharPressed();

  @override
  void SetExitKey(
    int key,
  ) => _wasm.SetExitKey(
    key.toJS,
  );

  @override
  bool IsGamepadAvailable(
    int gamepad,
  ) => _wasm.IsGamepadAvailable(
    gamepad.toJS,
  );

  @override
  XWasmPtr<XChar> GetGamepadName(
    int gamepad,
  ) => _wasm.GetGamepadName(
    gamepad.toJS,
  );

  @override
  bool IsGamepadButtonPressed(
    int gamepad,
    int button,
  ) => _wasm.IsGamepadButtonPressed(
    gamepad.toJS,
    button.toJS,
  );

  @override
  bool IsGamepadButtonDown(
    int gamepad,
    int button,
  ) => _wasm.IsGamepadButtonDown(
    gamepad.toJS,
    button.toJS,
  );

  @override
  bool IsGamepadButtonReleased(
    int gamepad,
    int button,
  ) => _wasm.IsGamepadButtonReleased(
    gamepad.toJS,
    button.toJS,
  );

  @override
  bool IsGamepadButtonUp(
    int gamepad,
    int button,
  ) => _wasm.IsGamepadButtonUp(
    gamepad.toJS,
    button.toJS,
  );

  @override
  int GetGamepadButtonPressed() => _wasm.GetGamepadButtonPressed();

  @override
  int GetGamepadAxisCount(
    int gamepad,
  ) => _wasm.GetGamepadAxisCount(
    gamepad.toJS,
  );

  @override
  double GetGamepadAxisMovement(
    int gamepad,
    int axis,
  ) => _wasm.GetGamepadAxisMovement(
    gamepad.toJS,
    axis.toJS,
  );

  @override
  int SetGamepadMappings(
    XPtr<XChar> mappings,
  ) => _wasm.SetGamepadMappings(
    mappings.toJS,
  );

  @override
  void SetGamepadVibration(
    int gamepad,
    double leftMotor,
    double rightMotor,
    double duration,
  ) => _wasm.SetGamepadVibration(
    gamepad.toJS,
    leftMotor.toJS,
    rightMotor.toJS,
    duration.toJS,
  );

  @override
  bool IsMouseButtonPressed(
    int button,
  ) => _wasm.IsMouseButtonPressed(
    button.toJS,
  );

  @override
  bool IsMouseButtonDown(
    int button,
  ) => _wasm.IsMouseButtonDown(
    button.toJS,
  );

  @override
  bool IsMouseButtonReleased(
    int button,
  ) => _wasm.IsMouseButtonReleased(
    button.toJS,
  );

  @override
  bool IsMouseButtonUp(
    int button,
  ) => _wasm.IsMouseButtonUp(
    button.toJS,
  );

  @override
  int GetMouseX() => _wasm.GetMouseX();

  @override
  int GetMouseY() => _wasm.GetMouseY();

  @override
  Vector2 GetMousePosition() => Vector2$.Extract(
    (p) => _wasm.GetMousePosition(
      p.toJS,
    ),
  );

  @override
  Vector2 GetMouseDelta() => Vector2$.Extract(
    (p) => _wasm.GetMouseDelta(
      p.toJS,
    ),
  );

  @override
  void SetMousePosition(
    int x,
    int y,
  ) => _wasm.SetMousePosition(
    x.toJS,
    y.toJS,
  );

  @override
  void SetMouseOffset(
    int offsetX,
    int offsetY,
  ) => _wasm.SetMouseOffset(
    offsetX.toJS,
    offsetY.toJS,
  );

  @override
  void SetMouseScale(
    double scaleX,
    double scaleY,
  ) => _wasm.SetMouseScale(
    scaleX.toJS,
    scaleY.toJS,
  );

  @override
  double GetMouseWheelMove() => _wasm.GetMouseWheelMove();

  @override
  Vector2 GetMouseWheelMoveV() => Vector2$.Extract(
    (p) => _wasm.GetMouseWheelMoveV(
      p.toJS,
    ),
  );

  @override
  void SetMouseCursor(
    int cursor,
  ) => _wasm.SetMouseCursor(
    cursor.toJS,
  );

  @override
  int GetTouchX() => _wasm.GetTouchX();

  @override
  int GetTouchY() => _wasm.GetTouchY();

  @override
  Vector2 GetTouchPosition(
    int index,
  ) => Vector2$.Extract(
    (p) => _wasm.GetTouchPosition(
      p.toJS,
      index.toJS,
    ),
  );

  @override
  int GetTouchPointId(
    int index,
  ) => _wasm.GetTouchPointId(
    index.toJS,
  );

  @override
  int GetTouchPointCount() => _wasm.GetTouchPointCount();

  @override
  void SetGesturesEnabled(
    int flags,
  ) => _wasm.SetGesturesEnabled(
    flags.toJS,
  );

  @override
  bool IsGestureDetected(
    int gesture,
  ) => _wasm.IsGestureDetected(
    gesture.toJS,
  );

  @override
  int GetGestureDetected() => _wasm.GetGestureDetected();

  @override
  double GetGestureHoldDuration() => _wasm.GetGestureHoldDuration();

  @override
  Vector2 GetGestureDragVector() => Vector2$.Extract(
    (p) => _wasm.GetGestureDragVector(
      p.toJS,
    ),
  );

  @override
  double GetGestureDragAngle() => _wasm.GetGestureDragAngle();

  @override
  Vector2 GetGesturePinchVector() => Vector2$.Extract(
    (p) => _wasm.GetGesturePinchVector(
      p.toJS,
    ),
  );

  @override
  double GetGesturePinchAngle() => _wasm.GetGesturePinchAngle();

  @override
  void ProcessGestureEvent(
    GestureEvent event,
  ) => _wasm.ProcessGestureEvent(
    GestureEvent$.Ref1(event).toJS,
  );

  @override
  void UpdateGestures() => _wasm.UpdateGestures();

  @override
  void UpdateCamera(
    XStructPtr<Camera3D> camera,
    int mode,
  ) => _wasm.UpdateCamera(
    camera.toJS,
    mode.toJS,
  );

  @override
  void UpdateCameraPro(
    XStructPtr<Camera3D> camera,
    Vector3 movement,
    Vector3 rotation,
    double zoom,
  ) => _wasm.UpdateCameraPro(
    camera.toJS,
    Vector3$.Ref1(movement).toJS,
    Vector3$.Ref2(rotation).toJS,
    zoom.toJS,
  );

  @override
  void SetShapesTexture(
    Texture texture,
    Rectangle source,
  ) => _wasm.SetShapesTexture(
    Texture$.Ref1(texture).toJS,
    Rectangle$.Ref1(source).toJS,
  );

  @override
  Texture GetShapesTexture() => Texture$.Extract(
    (p) => _wasm.GetShapesTexture(
      p.toJS,
    ),
  );

  @override
  Rectangle GetShapesTextureRectangle() => Rectangle$.Extract(
    (p) => _wasm.GetShapesTextureRectangle(
      p.toJS,
    ),
  );

  @override
  void DrawPixel(
    int posX,
    int posY,
    Color color,
  ) => _wasm.DrawPixel(
    posX.toJS,
    posY.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawPixelV(
    Vector2 position,
    Color color,
  ) => _wasm.DrawPixelV(
    Vector2$.Ref1(position).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawLine(
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    Color color,
  ) => _wasm.DrawLine(
    startPosX.toJS,
    startPosY.toJS,
    endPosX.toJS,
    endPosY.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawLineV(
    Vector2 startPos,
    Vector2 endPos,
    Color color,
  ) => _wasm.DrawLineV(
    Vector2$.Ref1(startPos).toJS,
    Vector2$.Ref2(endPos).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawLineEx(
    Vector2 startPos,
    Vector2 endPos,
    double thick,
    Color color,
  ) => _wasm.DrawLineEx(
    Vector2$.Ref1(startPos).toJS,
    Vector2$.Ref2(endPos).toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawLineStrip(
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _wasm.DrawLineStrip(
    points.toJS,
    pointCount.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawLineBezier(
    Vector2 startPos,
    Vector2 endPos,
    double thick,
    Color color,
  ) => _wasm.DrawLineBezier(
    Vector2$.Ref1(startPos).toJS,
    Vector2$.Ref2(endPos).toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawLineDashed(
    Vector2 startPos,
    Vector2 endPos,
    int dashSize,
    int spaceSize,
    Color color,
  ) => _wasm.DrawLineDashed(
    Vector2$.Ref1(startPos).toJS,
    Vector2$.Ref2(endPos).toJS,
    dashSize.toJS,
    spaceSize.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCircle(
    int centerX,
    int centerY,
    double radius,
    Color color,
  ) => _wasm.DrawCircle(
    centerX.toJS,
    centerY.toJS,
    radius.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCircleSector(
    Vector2 center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) => _wasm.DrawCircleSector(
    Vector2$.Ref1(center).toJS,
    radius.toJS,
    startAngle.toJS,
    endAngle.toJS,
    segments.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCircleSectorLines(
    Vector2 center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) => _wasm.DrawCircleSectorLines(
    Vector2$.Ref1(center).toJS,
    radius.toJS,
    startAngle.toJS,
    endAngle.toJS,
    segments.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCircleGradient(
    Vector2 center,
    double radius,
    Color inner,
    Color outer,
  ) => _wasm.DrawCircleGradient(
    Vector2$.Ref1(center).toJS,
    radius.toJS,
    Color$.Ref1(inner).toJS,
    Color$.Ref2(outer).toJS,
  );

  @override
  void DrawCircleV(
    Vector2 center,
    double radius,
    Color color,
  ) => _wasm.DrawCircleV(
    Vector2$.Ref1(center).toJS,
    radius.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCircleLines(
    int centerX,
    int centerY,
    double radius,
    Color color,
  ) => _wasm.DrawCircleLines(
    centerX.toJS,
    centerY.toJS,
    radius.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCircleLinesV(
    Vector2 center,
    double radius,
    Color color,
  ) => _wasm.DrawCircleLinesV(
    Vector2$.Ref1(center).toJS,
    radius.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawEllipse(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    Color color,
  ) => _wasm.DrawEllipse(
    centerX.toJS,
    centerY.toJS,
    radiusH.toJS,
    radiusV.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawEllipseV(
    Vector2 center,
    double radiusH,
    double radiusV,
    Color color,
  ) => _wasm.DrawEllipseV(
    Vector2$.Ref1(center).toJS,
    radiusH.toJS,
    radiusV.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawEllipseLines(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    Color color,
  ) => _wasm.DrawEllipseLines(
    centerX.toJS,
    centerY.toJS,
    radiusH.toJS,
    radiusV.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawEllipseLinesV(
    Vector2 center,
    double radiusH,
    double radiusV,
    Color color,
  ) => _wasm.DrawEllipseLinesV(
    Vector2$.Ref1(center).toJS,
    radiusH.toJS,
    radiusV.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRing(
    Vector2 center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) => _wasm.DrawRing(
    Vector2$.Ref1(center).toJS,
    innerRadius.toJS,
    outerRadius.toJS,
    startAngle.toJS,
    endAngle.toJS,
    segments.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRingLines(
    Vector2 center,
    double innerRadius,
    double outerRadius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) => _wasm.DrawRingLines(
    Vector2$.Ref1(center).toJS,
    innerRadius.toJS,
    outerRadius.toJS,
    startAngle.toJS,
    endAngle.toJS,
    segments.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRectangle(
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  ) => _wasm.DrawRectangle(
    posX.toJS,
    posY.toJS,
    width.toJS,
    height.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRectangleV(
    Vector2 position,
    Vector2 size,
    Color color,
  ) => _wasm.DrawRectangleV(
    Vector2$.Ref1(position).toJS,
    Vector2$.Ref2(size).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRectangleRec(
    Rectangle rec,
    Color color,
  ) => _wasm.DrawRectangleRec(
    Rectangle$.Ref1(rec).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRectanglePro(
    Rectangle rec,
    Vector2 origin,
    double rotation,
    Color color,
  ) => _wasm.DrawRectanglePro(
    Rectangle$.Ref1(rec).toJS,
    Vector2$.Ref1(origin).toJS,
    rotation.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRectangleGradientV(
    int posX,
    int posY,
    int width,
    int height,
    Color top,
    Color bottom,
  ) => _wasm.DrawRectangleGradientV(
    posX.toJS,
    posY.toJS,
    width.toJS,
    height.toJS,
    Color$.Ref1(top).toJS,
    Color$.Ref2(bottom).toJS,
  );

  @override
  void DrawRectangleGradientH(
    int posX,
    int posY,
    int width,
    int height,
    Color left,
    Color right,
  ) => _wasm.DrawRectangleGradientH(
    posX.toJS,
    posY.toJS,
    width.toJS,
    height.toJS,
    Color$.Ref1(left).toJS,
    Color$.Ref2(right).toJS,
  );

  @override
  void DrawRectangleGradientEx(
    Rectangle rec,
    Color topLeft,
    Color bottomLeft,
    Color topRight,
    Color bottomRight,
  ) => _wasm.DrawRectangleGradientEx(
    Rectangle$.Ref1(rec).toJS,
    Color$.Ref1(topLeft).toJS,
    Color$.Ref2(bottomLeft).toJS,
    Color$.Ref3(topRight).toJS,
    Color$.Ref4(bottomRight).toJS,
  );

  @override
  void DrawRectangleLines(
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  ) => _wasm.DrawRectangleLines(
    posX.toJS,
    posY.toJS,
    width.toJS,
    height.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRectangleLinesEx(
    Rectangle rec,
    double lineThick,
    Color color,
  ) => _wasm.DrawRectangleLinesEx(
    Rectangle$.Ref1(rec).toJS,
    lineThick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRectangleRounded(
    Rectangle rec,
    double roundness,
    int segments,
    Color color,
  ) => _wasm.DrawRectangleRounded(
    Rectangle$.Ref1(rec).toJS,
    roundness.toJS,
    segments.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRectangleRoundedLines(
    Rectangle rec,
    double roundness,
    int segments,
    Color color,
  ) => _wasm.DrawRectangleRoundedLines(
    Rectangle$.Ref1(rec).toJS,
    roundness.toJS,
    segments.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRectangleRoundedLinesEx(
    Rectangle rec,
    double roundness,
    int segments,
    double lineThick,
    Color color,
  ) => _wasm.DrawRectangleRoundedLinesEx(
    Rectangle$.Ref1(rec).toJS,
    roundness.toJS,
    segments.toJS,
    lineThick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawTriangle(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _wasm.DrawTriangle(
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
    Vector2$.Ref3(v3).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawTriangleLines(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _wasm.DrawTriangleLines(
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
    Vector2$.Ref3(v3).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawTriangleFan(
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _wasm.DrawTriangleFan(
    points.toJS,
    pointCount.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawTriangleStrip(
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _wasm.DrawTriangleStrip(
    points.toJS,
    pointCount.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawPoly(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    Color color,
  ) => _wasm.DrawPoly(
    Vector2$.Ref1(center).toJS,
    sides.toJS,
    radius.toJS,
    rotation.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawPolyLines(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    Color color,
  ) => _wasm.DrawPolyLines(
    Vector2$.Ref1(center).toJS,
    sides.toJS,
    radius.toJS,
    rotation.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawPolyLinesEx(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    double lineThick,
    Color color,
  ) => _wasm.DrawPolyLinesEx(
    Vector2$.Ref1(center).toJS,
    sides.toJS,
    radius.toJS,
    rotation.toJS,
    lineThick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineLinear(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _wasm.DrawSplineLinear(
    points.toJS,
    pointCount.toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineBasis(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _wasm.DrawSplineBasis(
    points.toJS,
    pointCount.toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineCatmullRom(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _wasm.DrawSplineCatmullRom(
    points.toJS,
    pointCount.toJS, 
    thick.toJS, 
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineBezierQuadratic(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _wasm.DrawSplineBezierQuadratic(
    points.toJS,
    pointCount.toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineBezierCubic(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _wasm.DrawSplineBezierCubic(
    points.toJS,
    pointCount.toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineSegmentLinear(
    Vector2 p1,
    Vector2 p2,
    double thick,
    Color color,
  ) => _wasm.DrawSplineSegmentLinear(
    Vector2$.Ref1(p1).toJS,
    Vector2$.Ref2(p2).toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineSegmentBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double thick,
    Color color,
  ) => _wasm.DrawSplineSegmentBasis(
    Vector2$.Ref1(p1).toJS,
    Vector2$.Ref2(p2).toJS,
    Vector2$.Ref3(p3).toJS,
    Vector2$.Ref4(p4).toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineSegmentCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double thick,
    Color color,
  ) => _wasm.DrawSplineSegmentCatmullRom(
    Vector2$.Ref1(p1).toJS,
    Vector2$.Ref2(p2).toJS,
    Vector2$.Ref3(p3).toJS,
    Vector2$.Ref4(p4).toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineSegmentBezierQuadratic(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    double thick,
    Color color,
  ) => _wasm.DrawSplineSegmentBezierQuadratic(
    Vector2$.Ref1(p1).toJS,
    Vector2$.Ref2(c2).toJS,
    Vector2$.Ref3(p3).toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSplineSegmentBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    double thick,
    Color color,
  ) => _wasm.DrawSplineSegmentBezierCubic(
    Vector2$.Ref1(p1).toJS,
    Vector2$.Ref2(c2).toJS,
    Vector2$.Ref3(c3).toJS,
    Vector2$.Ref4(p4).toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  Vector2 GetSplinePointLinear(
    Vector2 startPos,
    Vector2 endPos,
    double t,
  ) => Vector2$.Extract(
    (p) => _wasm.GetSplinePointLinear(
      p.toJS,
      Vector2$.Ref2(startPos).toJS,
      Vector2$.Ref3(endPos).toJS,
      t.toJS,
    ),
  );

  @override
  Vector2 GetSplinePointBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double t,
  ) => Vector2$.Extract(
    (p) => _wasm.GetSplinePointBasis(
      p.toJS,
      Vector2$.Ref2(p1).toJS,
      Vector2$.Ref3(p2).toJS,
      Vector2$.Ref4(p3).toJS,
      Vector2$.Ref5(p4).toJS,
      t.toJS,
    ),
  );

  @override
  Vector2 GetSplinePointCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double t,
  ) => Vector2$.Extract(
    (p) => _wasm.GetSplinePointBasis(
      p.toJS,
      Vector2$.Ref2(p1).toJS,
      Vector2$.Ref3(p2).toJS,
      Vector2$.Ref4(p3).toJS,
      Vector2$.Ref5(p4).toJS,
      t.toJS,
    ),
  );

  @override
  Vector2 GetSplinePointBezierQuad(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    double t,
  ) => Vector2$.Extract(
    (p) => _wasm.GetSplinePointBezierQuad(
      p.toJS,
      Vector2$.Ref2(p1).toJS,
      Vector2$.Ref3(c2).toJS,
      Vector2$.Ref4(p3).toJS,
      t.toJS,
    ),
  );

  @override
  Vector2 GetSplinePointBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    double t,
  ) => Vector2$.Extract(
    (p) => _wasm.GetSplinePointBasis(
      p.toJS,
      Vector2$.Ref2(p1).toJS,
      Vector2$.Ref3(c2).toJS,
      Vector2$.Ref4(c3).toJS,
      Vector2$.Ref5(p4).toJS,
      t.toJS,
    ),
  );

  @override
  bool CheckCollisionRecs(
    Rectangle rec1,
    Rectangle rec2,
  ) => _wasm.CheckCollisionRecs(
    Rectangle$.Ref1(rec1).toJS,
    Rectangle$.Ref2(rec2).toJS,
  );

  @override
  bool CheckCollisionCircles(
    Vector2 center1,
    double radius1,
    Vector2 center2,
    double radius2,
  ) => _wasm.CheckCollisionCircles(
    Vector2$.Ref1(center1).toJS,
    radius1.toJS,
    Vector2$.Ref2(center2).toJS,
    radius2.toJS,
  );

  @override
  bool CheckCollisionCircleRec(
    Vector2 center,
    double radius,
    Rectangle rec,
  ) => _wasm.CheckCollisionCircleRec(
    Vector2$.Ref1(center).toJS,
    radius.toJS,
    Rectangle$.Ref1(rec).toJS,
  );

  @override
  bool CheckCollisionCircleLine(
    Vector2 center,
    double radius,
    Vector2 p1,
    Vector2 p2,
  ) => _wasm.CheckCollisionCircleLine(
    Vector2$.Ref1(center).toJS,
    radius.toJS,
    Vector2$.Ref2(p1).toJS,
    Vector2$.Ref3(p2).toJS,
  );

  @override
  bool CheckCollisionPointRec(
    Vector2 point,
    Rectangle rec,
  ) => _wasm.CheckCollisionPointRec(
    Vector2$.Ref1(point).toJS,
    Rectangle$.Ref1(rec).toJS,
  );

  @override
  bool CheckCollisionPointCircle(
    Vector2 point,
    Vector2 center,
    double radius,
  ) => _wasm.CheckCollisionPointCircle(
    Vector2$.Ref1(point).toJS,
    Vector2$.Ref2(center).toJS,
    radius.toJS,
  );

  @override
  bool CheckCollisionPointTriangle(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
  ) => _wasm.CheckCollisionPointTriangle(
    Vector2$.Ref1(point).toJS,
    Vector2$.Ref2(p1).toJS,
    Vector2$.Ref3(p2).toJS,
    Vector2$.Ref4(p3).toJS,
  );

  @override
  bool CheckCollisionPointLine(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    int threshold,
  ) => _wasm.CheckCollisionPointLine(
    Vector2$.Ref1(point).toJS,
    Vector2$.Ref2(p1).toJS,
    Vector2$.Ref3(p2).toJS,
    threshold.toJS,
  );

  @override
  bool CheckCollisionPointPoly(
    Vector2 point,
    XStructPtr<Vector2> points,
    int pointCount,
  ) => _wasm.CheckCollisionPointPoly(
    Vector2$.Ref1(point).toJS,
    points.toJS,
    pointCount.toJS,
  );

  @override
  bool CheckCollisionLines(
    Vector2 startPos1,
    Vector2 endPos1,
    Vector2 startPos2,
    Vector2 endPos2,
    XStructPtr<Vector2> collisionPoint,
  ) => _wasm.CheckCollisionLines(
    Vector2$.Ref1(startPos1).toJS,
    Vector2$.Ref2(endPos1).toJS,
    Vector2$.Ref3(startPos2).toJS,
    Vector2$.Ref4(endPos2).toJS,
    collisionPoint.toJS,
  );

  @override
  Rectangle GetCollisionRec(
    Rectangle rec1,
    Rectangle rec2,
  ) => Rectangle$.Extract(
    (p) => _wasm.GetCollisionRec(
      p.toJS,
      Rectangle$.Ref2(rec1).toJS,
      Rectangle$.Ref3(rec2).toJS,
    ),
  );

  @override
  Image LoadImage(
    XPtr<XChar> fileName,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImage,
    (p) => _wasm.LoadImage(
      p.toJS,
      fileName.toJS,
    ),
  );

  @override
  Image LoadImageRaw(
    XPtr<XChar> fileName,
    int width,
    int height,
    int format,
    int headerSize,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImageRaw,
    (p) => _wasm.LoadImageRaw(
      p.toJS,
      fileName.toJS,
      width.toJS,
      height.toJS,
      format.toJS,
      headerSize.toJS,
    ),
  );

  @override
  Image LoadImageAnim(
    XPtr<XChar> fileName,
    XPtr<XInt> frames,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImageAnim,
    (p) => _wasm.LoadImageAnim(
      p.toJS,
      fileName.toJS,
      frames.toJS,
    ),
  );

  @override
  Image LoadImageAnimFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    XPtr<XInt> frames,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImageAnimFromMemory,
    (p) => _wasm.LoadImageAnimFromMemory(
      p.toJS,
      fileType.toJS,
      fileData.toJS,
      dataSize.toJS,
      frames.toJS,
    ),
  );

  @override
  Image LoadImageFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromMemory,
    (p) => _wasm.LoadImageFromMemory(
      p.toJS,
      fileType.toJS,
      fileData.toJS,
      dataSize.toJS,
    ),
  );

  @override
  Image LoadImageFromTexture(
    Texture texture,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromTexture,
    (p) => _wasm.LoadImageFromTexture(
      p.toJS,
      Texture$.Ref1(texture).toJS,
    ),
  );

  @override
  Image LoadImageFromScreen() => Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromScreen,
    (p) => _wasm.LoadImageFromScreen(
      p.toJS,
    ),
  );

  @override
  bool IsImageValid(
    Image image,
  ) => _wasm.IsImageValid(
    Image$.Ref1(image).toJS,
  );

  @override
  void UnloadImage(
    Image image,
  ) => _wasm.UnloadImage(
    Image$.Ref1(image).toJS,
  );

  @override
  bool ExportImage(
    Image image,
    XPtr<XChar> fileName,
  ) => _wasm.ExportImage(
    Image$.Ref1(image).toJS,
    fileName.toJS,
  );

  @override
  XWasmPtr<XUnsignedChar> ExportImageToMemory(
    Image image,
    XPtr<XChar> fileType,
    XPtr<XInt> fileSize,
  ) => _wasm.ExportImageToMemory(
    Image$.Ref1(image).toJS,
    fileType.toJS,
    fileSize.toJS,
  );

  @override
  bool ExportImageAsCode(
    Image image,
    XPtr<XChar> fileName,
  ) => _wasm.ExportImageAsCode(
    Image$.Ref1(image).toJS,
    fileName.toJS,
  );

  @override
  Image GenImageColor(
    int width,
    int height,
    Color color,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageColor,
    (p) => _wasm.GenImageColor(
      p.toJS,
      width.toJS,
      height.toJS,
      Color$.Ref1(color).toJS,
    ),
  );

  @override
  Image GenImageGradientLinear(
    int width,
    int height,
    int direction,
    Color start,
    Color end,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageGradientLinear,
    (p) => _wasm.GenImageGradientLinear(
      p.toJS,
      width.toJS,
      height.toJS,
      direction.toJS,
      Color$.Ref1(start).toJS,
      Color$.Ref2(end).toJS,
    ),
  );

  @override
  Image GenImageGradientRadial(
    int width,
    int height,
    double density,
    Color inner,
    Color outer,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageGradientRadial,
    (p) => _wasm.GenImageGradientRadial(
      p.toJS,
      width.toJS,
      height.toJS,
      density.toJS,
      Color$.Ref1(inner).toJS,
      Color$.Ref2(outer).toJS,
    ),
  );

  @override
  Image GenImageGradientSquare(
    int width,
    int height,
    double density,
    Color inner,
    Color outer,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageGradientSquare,
    (p) => _wasm.GenImageGradientSquare(
      p.toJS,
      width.toJS,
      height.toJS,
      density.toJS,
      Color$.Ref1(inner).toJS,
      Color$.Ref2(outer).toJS,
    ),
  );

  @override
  Image GenImageChecked(
    int width,
    int height,
    int checksX,
    int checksY,
    Color col1,
    Color col2,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageChecked,
    (p) => _wasm.GenImageChecked(
      p.toJS,
      width.toJS,
      height.toJS,
      checksX.toJS,
      checksY.toJS,
      Color$.Ref1(col1).toJS,
      Color$.Ref2(col2).toJS,
    ),
  );

  @override
  Image GenImageWhiteNoise(
    int width,
    int height,
    double factor,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageWhiteNoise,
    (p) => _wasm.GenImageWhiteNoise(
      p.toJS,
      width.toJS,
      height.toJS,
      factor.toJS,
    ),
  );

  @override
  Image GenImagePerlinNoise(
    int width,
    int height,
    int offsetX,
    int offsetY,
    double scale,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImagePerlinNoise,
    (p) => _wasm.GenImagePerlinNoise(
      p.toJS,
      width.toJS,
      height.toJS,
      offsetX.toJS,
      offsetY.toJS,
      scale.toJS,
    ),
  );

  @override
  Image GenImageCellular(
    int width,
    int height,
    int tileSize,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageCellular,
    (p) => _wasm.GenImageCellular(
      p.toJS,
      width.toJS,
      height.toJS,
      tileSize.toJS,
    ),
  );

  @override
  Image GenImageText(
    int width,
    int height,
    XPtr<XChar> text,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageText,
    (p) => _wasm.GenImageText(
      p.toJS,
      width.toJS,
      height.toJS,
      text.toJS,
    ),
  );

  @override
  Image ImageCopy(
    Image image,
  ) => Image$.RefCapture(
    RaylibCaptureIds.ImageCopy,
    (p) => _wasm.ImageCopy(
      p.toJS,
      Image$.Ref1(image).toJS,
    ),
  );

  @override
  Image ImageFromImage(
    Image image,
    Rectangle rec,
  ) => Image$.RefCapture(
    RaylibCaptureIds.ImageFromImage,
    (p) => _wasm.ImageFromImage(
      p.toJS,
      Image$.Ref1(image).toJS,
      Rectangle$.Ref1(rec).toJS,
    ),
  );

  @override
  Image ImageFromChannel(
    Image image,
    int selectedChannel,
  ) => Image$.RefCapture(
    RaylibCaptureIds.ImageFromChannel,
    (p) => _wasm.ImageFromChannel(
      p.toJS,
      Image$.Ref1(image).toJS,
      selectedChannel.toJS,
    ),
  );

  @override
  Image ImageText(
    XPtr<XChar> text,
    int fontSize,
    Color color,
  ) => Image$.RefCapture(
    RaylibCaptureIds.ImageText,
    (p) => _wasm.ImageText(
      p.toJS,
      text.toJS,
      fontSize.toJS,
      Color$.Ref1(color).toJS,
    ),
  );

  @override
  Image ImageTextEx(
    Font font,
    XPtr<XChar> text,
    double fontSize,
    double spacing,
    Color tint,
  ) => Image$.RefCapture(
    RaylibCaptureIds.ImageTextEx,
    (p) => _wasm.ImageTextEx(
      p.toJS,
      Font$.Ref1(font).toJS,
      text.toJS,
      fontSize.toJS,
      spacing.toJS,
      Color$.Ref1(tint).toJS,
    ),
  );

  @override
  void ImageFormat(
    XStructPtr<Image> image,
    int newFormat,
  ) => _wasm.ImageFormat(
    image.toJS,
    newFormat.toJS,
  );

  @override
  void ImageToPOT(
    XStructPtr<Image> image,
    Color fill,
  ) => _wasm.ImageToPOT(
    image.toJS,
    Color$.Ref1(fill).toJS,
  );

  @override
  void ImageCrop(
    XStructPtr<Image> image,
    Rectangle crop,
  ) => _wasm.ImageCrop(
    image.toJS,
    Rectangle$.Ref1(crop).toJS,
  );

  @override
  void ImageAlphaCrop(
    XStructPtr<Image> image,
    double threshold,
  ) => _wasm.ImageAlphaCrop(
    image.toJS,
    threshold.toJS,
  );

  @override
  void ImageAlphaClear(
    XStructPtr<Image> image,
    Color color,
    double threshold,
  ) => _wasm.ImageAlphaClear(
    image.toJS,
    Color$.Ref1(color).toJS,
    threshold.toJS,
  );

  @override
  void ImageAlphaMask(
    XStructPtr<Image> image,
    Image alphaMask,
  ) => _wasm.ImageAlphaMask(
    image.toJS,
    Image$.Ref2(alphaMask).toJS,
  );

  @override
  void ImageAlphaPremultiply(
    XStructPtr<Image> image,
  ) => _wasm.ImageAlphaPremultiply(
    image.toJS,
  );

  @override
  void ImageBlurGaussian(
    XStructPtr<Image> image,
    int blurSize,
  ) => _wasm.ImageBlurGaussian(
    image.toJS,
    blurSize.toJS,
  );

  @override
  void ImageKernelConvolution(
    XStructPtr<Image> image,
    XPtr<XFloat> kernel,
    int kernelSize,
  ) => _wasm.ImageKernelConvolution(
    image.toJS,
    kernel.toJS,
    kernelSize.toJS,
  );

  @override
  void ImageResize(
    XStructPtr<Image> image,
    int newWidth,
    int newHeight,
  ) => _wasm.ImageResize(
    image.toJS,
    newWidth.toJS,
    newHeight.toJS,
  );

  @override
  void ImageResizeNN(
    XStructPtr<Image> image,
    int newWidth,
    int newHeight,
  ) => _wasm.ImageResizeNN(
    image.toJS,
    newWidth.toJS,
    newHeight.toJS,
  );

  @override
  void ImageResizeCanvas(
    XStructPtr<Image> image,
    int newWidth,
    int newHeight,
    int offsetX,
    int offsetY,
    Color fill,
  ) => _wasm.ImageResizeCanvas(
    image.toJS,
    newWidth.toJS,
    newHeight.toJS,
    offsetX.toJS,
    offsetY.toJS,
    Color$.Ref1(fill).toJS,
  );

  @override
  void ImageMipmaps(
    XStructPtr<Image> image,
  ) => _wasm.ImageMipmaps(
    image.toJS,
  );

  @override
  void ImageDither(
    XStructPtr<Image> image,
    int rBpp,
    int gBpp,
    int bBpp,
    int aBpp,
  ) => _wasm.ImageDither(
    image.toJS,
    rBpp.toJS,
    gBpp.toJS,
    bBpp.toJS,
    aBpp.toJS,
  );

  @override
  void ImageFlipVertical(
    XStructPtr<Image> image,
  ) => _wasm.ImageFlipVertical(
    image.toJS,
  );

  @override
  void ImageFlipHorizontal(
    XStructPtr<Image> image,
  ) => _wasm.ImageFlipHorizontal(
    image.toJS,
  );

  @override
  void ImageRotate(
    XStructPtr<Image> image,
    int degrees,
  ) => _wasm.ImageRotate(
    image.toJS,
    degrees.toJS,
  );

  @override
  void ImageRotateCW(
    XStructPtr<Image> image,
  ) => _wasm.ImageRotateCW(
    image.toJS,
  );

  @override
  void ImageRotateCCW(
    XStructPtr<Image> image,
  ) => _wasm.ImageRotateCCW(
    image.toJS,
  );

  @override
  void ImageColorTint(
    XStructPtr<Image> image,
    Color color,
  ) => _wasm.ImageColorTint(
    image.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageColorInvert(
    XStructPtr<Image> image,
  ) => _wasm.ImageColorInvert(
    image.toJS,
  );

  @override
  void ImageColorGrayscale(
    XStructPtr<Image> image,
  ) => _wasm.ImageColorGrayscale(
    image.toJS,
  );

  @override
  void ImageColorContrast(
    XStructPtr<Image> image,
    double contrast,
  ) => _wasm.ImageColorContrast(
    image.toJS,
    contrast.toJS,
  );

  @override
  void ImageColorBrightness(
    XStructPtr<Image> image,
    int brightness,
  ) => _wasm.ImageColorBrightness(
    image.toJS,
    brightness.toJS,
  );

  @override
  void ImageColorReplace(
    XStructPtr<Image> image,
    Color color,
    Color replace,
  ) => _wasm.ImageColorReplace(
    image.toJS,
    Color$.Ref1(color).toJS,
    Color$.Ref2(replace).toJS,
  );

  @override
  XStructPtr<Color> LoadImageColors(
    Image image,
  ) => _wasm.LoadImageColors(
    Image$.Ref1(image).toJS,
  );

  @override
  XStructPtr<Color> LoadImagePalette(
    Image image,
    int maxPaletteSize,
    XPtr<XInt> colorCount,
  ) => _wasm.LoadImagePalette(
    Image$.Ref1(image).toJS,
    maxPaletteSize.toJS,
    colorCount.toJS,
  );

  @override
  void UnloadImageColors(
    XStructPtr<Color> colors,
  ) => _wasm.UnloadImageColors(
    colors.toJS,
  );

  @override
  void UnloadImagePalette(
    XStructPtr<Color> colors,
  ) => _wasm.UnloadImagePalette(
    colors.toJS,
  );

  @override
  Rectangle GetImageAlphaBorder(
    Image image,
    double threshold,
  ) => Rectangle$.Extract(
    (p) => _wasm.GetImageAlphaBorder(
      p.toJS,
      Image$.Ref1(image).toJS,
      threshold.toJS,
    ),
  );

  @override
  Color GetImageColor(
    Image image,
    int x,
    int y,
  ) => Color$.Extract(
    (p) => _wasm.GetImageColor(
      p.toJS,
      Image$.Ref1(image).toJS,
      x.toJS,
      y.toJS,
    ),
  );

  @override
  void ImageClearBackground(
    XStructPtr<Image> dst,
    Color color,
  ) => _wasm.ImageClearBackground(
    dst.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawPixel(
    XStructPtr<Image> dst,
    int posX,
    int posY,
    Color color,
  ) => _wasm.ImageDrawPixel(
    dst.toJS,
    posX.toJS,
    posY.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawPixelV(
    XStructPtr<Image> dst,
    Vector2 position,
    Color color,
  ) => _wasm.ImageDrawPixelV(
    dst.toJS,
    Vector2$.Ref1(position).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawLine(
    XStructPtr<Image> dst,
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    Color color,
  ) => _wasm.ImageDrawLine(
    dst.toJS,
    startPosX.toJS,
    startPosY.toJS,
    endPosX.toJS,
    endPosY.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawLineV(
    XStructPtr<Image> dst,
    Vector2 start,
    Vector2 end,
    Color color,
  ) => _wasm.ImageDrawLineV(
    dst.toJS,
    Vector2$.Ref1(start).toJS,
    Vector2$.Ref2(end).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawLineEx(
    XStructPtr<Image> dst,
    Vector2 start,
    Vector2 end,
    int thick,
    Color color,
  ) => _wasm.ImageDrawLineEx(
    dst.toJS,
    Vector2$.Ref1(start).toJS,
    Vector2$.Ref2(end).toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawCircle(
    XStructPtr<Image> dst,
    int centerX,
    int centerY,
    int radius,
    Color color,
  ) => _wasm.ImageDrawCircle(
    dst.toJS,
    centerX.toJS,
    centerY.toJS,
    radius.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawCircleV(
    XStructPtr<Image> dst,
    Vector2 center,
    int radius,
    Color color,
  ) => _wasm.ImageDrawCircleV(
    dst.toJS,
    Vector2$.Ref1(center).toJS,
    radius.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawCircleLines(
    XStructPtr<Image> dst,
    int centerX,
    int centerY,
    int radius,
    Color color,
  ) => _wasm.ImageDrawCircleLines(
    dst.toJS,
    centerX.toJS,
    centerY.toJS,
    radius.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawCircleLinesV(
    XStructPtr<Image> dst,
    Vector2 center,
    int radius,
    Color color,
  ) => _wasm.ImageDrawCircleLinesV(
    dst.toJS,
    Vector2$.Ref1(center).toJS,
    radius.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawRectangle(
    XStructPtr<Image> dst,
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  ) => _wasm.ImageDrawRectangle(
    dst.toJS,
    posX.toJS,
    posY.toJS,
    width.toJS,
    height.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawRectangleV(
    XStructPtr<Image> dst,
    Vector2 position,
    Vector2 size,
    Color color,
  ) => _wasm.ImageDrawRectangleV(
    dst.toJS,
    Vector2$.Ref1(position).toJS,
    Vector2$.Ref2(size).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawRectangleRec(
    XStructPtr<Image> dst,
    Rectangle rec,
    Color color,
  ) => _wasm.ImageDrawRectangleRec(
    dst.toJS,
    Rectangle$.Ref1(rec).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawRectangleLines(
    XStructPtr<Image> dst,
    Rectangle rec,
    int thick,
    Color color,
  ) => _wasm.ImageDrawRectangleLines(
    dst.toJS,
    Rectangle$.Ref1(rec).toJS,
    thick.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawTriangle(
    XStructPtr<Image> dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _wasm.ImageDrawTriangle(
    dst.toJS,
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
    Vector2$.Ref3(v3).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawTriangleEx(
    XStructPtr<Image> dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color c1,
    Color c2,
    Color c3,
  ) => _wasm.ImageDrawTriangleEx(
    dst.toJS,
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
    Vector2$.Ref3(v3).toJS,
    Color$.Ref1(c1).toJS,
    Color$.Ref2(c2).toJS,
    Color$.Ref3(c3).toJS,
  );

  @override
  void ImageDrawTriangleLines(
    XStructPtr<Image> dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _wasm.ImageDrawTriangleLines(
    dst.toJS,
    Vector2$.Ref1(v1).toJS,
    Vector2$.Ref2(v2).toJS,
    Vector2$.Ref3(v3).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawTriangleFan(
    XStructPtr<Image> dst,
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _wasm.ImageDrawTriangleFan(
    dst.toJS,
    points.toJS,
    pointCount.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawTriangleStrip(
    XStructPtr<Image> dst,
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _wasm.ImageDrawTriangleStrip(
    dst.toJS,
    points.toJS,
    pointCount.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDraw(
    XStructPtr<Image> dst,
    Image src,
    Rectangle srcRec,
    Rectangle dstRec,
    Color tint,
  ) => _wasm.ImageDraw(
    dst.toJS,
    Image$.Ref2(src).toJS,
    Rectangle$.Ref1(srcRec).toJS,
    Rectangle$.Ref2(dstRec).toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void ImageDrawText(
    XStructPtr<Image> dst,
    XPtr<XChar> text,
    int posX,
    int posY,
    int fontSize,
    Color color,
  ) => _wasm.ImageDrawText(
    dst.toJS,
    text.toJS,
    posX.toJS,
    posY.toJS,
    fontSize.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void ImageDrawTextEx(
    XStructPtr<Image> dst,
    Font font,
    XPtr<XChar> text,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  ) => _wasm.ImageDrawTextEx(
    dst.toJS,
    Font$.Ref1(font).toJS,
    text.toJS,
    Vector2$.Ref1(position).toJS,
    fontSize.toJS,
    spacing.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  Texture LoadTexture(
    XPtr<XChar> fileName,
  ) => Texture$.RefCapture(
    RaylibCaptureIds.LoadTexture,
    (p) => _wasm.LoadTexture(
      p.toJS,
      fileName.toJS,
    ),
  );

  @override
  Texture LoadTextureFromImage(
    Image image,
  ) => Texture$.RefCapture(
    RaylibCaptureIds.LoadTextureFromImage,
    (p) => _wasm.LoadTextureFromImage(
      p.toJS,
      Image$.Ref1(image).toJS,
    ),
  );

  @override
  Texture LoadTextureCubemap(
    Image image,
    int layout,
  ) => Texture$.RefCapture(
    RaylibCaptureIds.LoadTextureCubemap,
    (p) => _wasm.LoadTextureCubemap(
      p.toJS,
      Image$.Ref1(image).toJS,
      layout.toJS,
    ),
  );

  @override
  RenderTexture LoadRenderTexture(
    int width,
    int height,
  ) => RenderTexture$.RefCapture(
    RaylibCaptureIds.LoadRenderTexture,
    (p) => _wasm.LoadRenderTexture(
      p.toJS,
      width.toJS,
      height.toJS,
    ),
  );

  @override
  bool IsTextureValid(
    Texture texture,
  ) => _wasm.IsTextureValid(
    Texture$.Ref1(texture).toJS,
  );

  @override
  void UnloadTexture(
    Texture texture,
  ) => _wasm.UnloadTexture(
    Texture$.Ref1(texture).toJS,
  );

  @override
  bool IsRenderTextureValid(
    RenderTexture target,
  ) => _wasm.IsRenderTextureValid(
    RenderTexture$.Ref1(target).toJS,
  );

  @override
  void UnloadRenderTexture(
    RenderTexture target,
  ) => _wasm.UnloadRenderTexture(
    RenderTexture$.Ref1(target).toJS,
  );

  @override
  void UpdateTexture(
    Texture texture,
    XPtr<XVoid> pixels,
  ) => _wasm.UpdateTexture(
    Texture$.Ref1(texture).toJS,
    pixels.toJS,
  );

  @override
  void UpdateTextureRec(
    Texture texture,
    Rectangle rec,
    XPtr<XVoid> pixels,
  ) => _wasm.UpdateTextureRec(
    Texture$.Ref1(texture).toJS,
    Rectangle$.Ref1(rec).toJS,
    pixels.toJS,
  );

  @override
  void GenTextureMipmaps(
    XStructPtr<Texture> texture,
  ) => _wasm.GenTextureMipmaps(
    texture.toJS,
  );

  @override
  void SetTextureFilter(
    Texture texture,
    int filter,
  ) => _wasm.SetTextureFilter(
    Texture$.Ref1(texture).toJS,
    filter.toJS,
  );

  @override
  void SetTextureWrap(
    Texture texture,
    int wrap,
  ) => _wasm.SetTextureWrap(
    Texture$.Ref1(texture).toJS,
    wrap.toJS,
  );

  @override
  void DrawTexture(
    Texture texture,
    int posX,
    int posY,
    Color tint,
  ) => _wasm.DrawTexture(
    Texture$.Ref1(texture).toJS,
    posX.toJS,
    posY.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawTextureV(
    Texture texture,
    Vector2 position,
    Color tint,
  ) => _wasm.DrawTextureV(
    Texture$.Ref1(texture).toJS,
    Vector2$.Ref1(position).toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawTextureEx(
    Texture texture,
    Vector2 position,
    double rotation,
    double scale,
    Color tint,
  ) => _wasm.DrawTextureEx(
    Texture$.Ref1(texture).toJS,
    Vector2$.Ref1(position).toJS,
    rotation.toJS,
    scale.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawTextureRec(
    Texture texture,
    Rectangle source,
    Vector2 position,
    Color tint,
  ) => _wasm.DrawTextureRec(
    Texture$.Ref1(texture).toJS,
    Rectangle$.Ref1(source).toJS,
    Vector2$.Ref1(position).toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawTexturePro(
    Texture texture,
    Rectangle source,
    Rectangle dest,
    Vector2 origin,
    double rotation,
    Color tint,
  ) => _wasm.DrawTexturePro(
    Texture$.Ref1(texture).toJS,
    Rectangle$.Ref1(source).toJS,
    Rectangle$.Ref2(dest).toJS,
    Vector2$.Ref1(origin).toJS,
    rotation.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawTextureNPatch(
    Texture texture,
    NPatchInfo nPatchInfo,
    Rectangle dest,
    Vector2 origin,
    double rotation,
    Color tint,
  ) => _wasm.DrawTextureNPatch(
    Texture$.Ref1(texture).toJS,
    NPatchInfo$.Ref1(nPatchInfo).toJS,
    Rectangle$.Ref1(dest).toJS,
    Vector2$.Ref1(origin).toJS,
    rotation.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  bool ColorIsEqual(
    Color col1,
    Color col2,
  ) => _wasm.ColorIsEqual(
    Color$.Ref1(col1).toJS,
    Color$.Ref2(col2).toJS,
  );

  @override
  Color Fade(
    Color color,
    double alpha,
  ) => Color$.Extract(
    (p) => _wasm.Fade(
      p.toJS,
      Color$.Ref2(color).toJS,
      alpha.toJS,
    ),
  );

  @override
  int ColorToInt(
    Color color,
  ) => _wasm.ColorToInt(
    Color$.Ref1(color).toJS,
  );

  @override
  Vector4 ColorNormalize(
    Color color,
  ) => Vector4$.Extract(
    (p) => _wasm.ColorNormalize(
      p.toJS,
      Color$.Ref1(color).toJS,
    ),
  );

  @override
  Color ColorFromNormalized(
    Vector4 normalized,
  ) => Color$.Extract(
    (p) => _wasm.ColorFromNormalized(
      p.toJS,
      Vector4$.Ref1(normalized).toJS,
    ),
  );

  @override
  Vector3 ColorToHSV(
    Color color,
  ) => Vector3$.Extract(
    (p) => _wasm.ColorToHSV(
      p.toJS,
      Color$.Ref1(color).toJS,
    ),
  );

  @override
  Color ColorFromHSV(
    double hue,
    double saturation,
    double value,
  ) => Color$.Extract(
    (p) => _wasm.ColorFromHSV(
      p.toJS,
      hue.toJS,
      saturation.toJS,
      value.toJS,
    ),
  );

  @override
  Color ColorTint(
    Color color,
    Color tint,
  ) => Color$.Extract(
    (p) => _wasm.ColorTint(
      p.toJS,
      Color$.Ref2(color).toJS,
      Color$.Ref3(tint).toJS,
    ),
  );

  @override
  Color ColorBrightness(
    Color color,
    double factor,
  ) => Color$.Extract(
    (p) => _wasm.ColorBrightness(
      p.toJS,
      Color$.Ref2(color).toJS,
      factor.toJS,
    ),
  );

  @override
  Color ColorContrast(
    Color color,
    double contrast,
  ) => Color$.Extract(
    (p) => _wasm.ColorContrast(
      p.toJS,
      Color$.Ref2(color).toJS,
      contrast.toJS,
    ),
  );

  @override
  Color ColorAlpha(
    Color color,
    double alpha,
  ) => Color$.Extract(
    (p) => _wasm.ColorAlpha(
      p.toJS,
      Color$.Ref2(color).toJS,
      alpha.toJS,
    ),
  );

  @override
  Color ColorAlphaBlend(
    Color dst,
    Color src,
    Color tint,
  ) => Color$.Extract(
    (p) => _wasm.ColorAlphaBlend(
      p.toJS,
      Color$.Ref2(dst).toJS,
      Color$.Ref3(src).toJS,
      Color$.Ref4(tint).toJS,
    ),
  );

  @override
  Color ColorLerp(
    Color color1,
    Color color2,
    double factor,
  ) => Color$.Extract(
    (p) => _wasm.ColorLerp(
      p.toJS,
      Color$.Ref2(color1).toJS,
      Color$.Ref3(color2).toJS,
      factor.toJS,
    ),
  );

  @override
  Color GetColor(
    int hexValue,
  ) => Color$.Extract(
    (p) => _wasm.GetColor(
      p.toJS,
      hexValue.toJS,
    ),
  );

  @override
  Color GetPixelColor(
    XPtr<XVoid> srcPtr,
    int format,
  ) => Color$.Extract(
    (p) => _wasm.GetPixelColor(
      p.toJS,
      srcPtr.toJS,
      format.toJS,
    ),
  );

  @override
  void SetPixelColor(
    XPtr<XVoid> dstPtr,
    Color color,
    int format,
  ) => _wasm.SetPixelColor(
    dstPtr.toJS,
    Color$.Ref1(color).toJS,
    format.toJS,
  );

  @override
  int GetPixelDataSize(
    int width,
    int height,
    int format,
  ) => _wasm.GetPixelDataSize(
    width.toJS,
    height.toJS,
    format.toJS,
  );

  @override
  Font GetFontDefault() => Font$.RefCached(
    RaylibCaptureIds.GetFontDefault,
    (p) => _wasm.GetFontDefault(
      p.toJS,
    ),
  );

  @override
  Font LoadFont(
    XPtr<XChar> fileName,
  ) => Font$.RefCapture(
    RaylibCaptureIds.LoadFont,
    (p) => _wasm.LoadFont(
      p.toJS,
      fileName.toJS,
    ),
  );

  @override
  Font LoadFontEx(
    XPtr<XChar> fileName,
    int fontSize,
    XPtr<XInt> codepoints,
    int codepointCount,
  ) => Font$.RefCapture(
    RaylibCaptureIds.LoadFontEx,
    (p) => _wasm.LoadFontEx(
      p.toJS,
      fileName.toJS,
      fontSize.toJS,
      codepoints.toJS,
      codepointCount.toJS,
    ),
  );

  @override
  Font LoadFontFromImage(
    Image image,
    Color key,
    int firstChar,
  ) => Font$.RefCapture(
    RaylibCaptureIds.LoadFontFromImage,
    (p) => _wasm.LoadFontFromImage(
      p.toJS,
      Image$.Ref1(image).toJS,
      Color$.Ref1(key).toJS,
      firstChar.toJS,
    ),
  );

  @override
  Font LoadFontFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    int fontSize,
    XPtr<XInt> codepoints,
    int codepointCount,
  ) => Font$.RefCapture(
    RaylibCaptureIds.LoadFontFromMemory,
    (p) => _wasm.LoadFontFromMemory(
      p.toJS,
      fileType.toJS,
      fileData.toJS,
      dataSize.toJS,
      fontSize.toJS,
      codepoints.toJS,
      codepointCount.toJS,
    ),
  );

  @override
  bool IsFontValid(
    Font font,
  ) => _wasm.IsFontValid(
    Font$.Ref1(font).toJS,
  );

  @override
  XStructPtr<GlyphInfo> LoadFontData(
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    int fontSize,
    XPtr<XInt> codepoints,
    int codepointCount,
    int type,
    XPtr<XInt> glyphCount,
  ) => _wasm.LoadFontData(
    fileData.toJS,
    dataSize.toJS,
    fontSize.toJS,
    codepoints.toJS,
    codepointCount.toJS,
    type.toJS,
    glyphCount.toJS,
  );

  @override
  Image GenImageFontAtlas(
    XStructPtr<GlyphInfo> glyphs,
    XPtr<XPtrType<XStructType>> glyphRecs, // Rectangle
    int glyphCount,
    int fontSize,
    int padding,
    int packMethod,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageFontAtlas,
    (p) => _wasm.GenImageFontAtlas(
      p.toJS,
      glyphs.toJS,
      glyphRecs.toJS,
      glyphCount.toJS,
      fontSize.toJS,
      padding.toJS,
      packMethod.toJS,
    ),
  );

  @override
  void UnloadFontData(
    XStructPtr<GlyphInfo> glyphs,
    int glyphCount,
  ) => _wasm.UnloadFontData(
    glyphs.toJS,
    glyphCount.toJS,
  );

  @override
  void UnloadFont(
    Font font,
  ) => _wasm.UnloadFont(
    Font$.Ref1(font).toJS,
  );

  @override
  bool ExportFontAsCode(
    Font font,
    XPtr<XChar> fileName,
  ) => _wasm.ExportFontAsCode(
    Font$.Ref1(font).toJS,
    fileName.toJS,
  );

  @override
  void DrawFPS(
    int posX,
    int posY,
  ) => _wasm.DrawFPS(
    posX.toJS,
    posY.toJS,
  );

  @override
  void DrawText(
    XPtr<XChar> text,
    int posX,
    int posY,
    int fontSize,
    Color color,
  ) => _wasm.DrawText(
    text.toJS,
    posX.toJS,
    posY.toJS,
    fontSize.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawTextEx(
    Font font,
    XPtr<XChar> text,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  ) => _wasm.DrawTextEx(
    Font$.Ref1(font).toJS,
    text.toJS,
    Vector2$.Ref1(position).toJS,
    fontSize.toJS,
    spacing.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawTextPro(
    Font font,
    XPtr<XChar> text,
    Vector2 position,
    Vector2 origin,
    double rotation,
    double fontSize,
    double spacing,
    Color tint,
  ) => _wasm.DrawTextPro(
    Font$.Ref1(font).toJS,
    text.toJS,
    Vector2$.Ref1(position).toJS,
    Vector2$.Ref2(origin).toJS,
    rotation.toJS,
    fontSize.toJS,
    spacing.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawTextCodepoint(
    Font font,
    int codepoint,
    Vector2 position,
    double fontSize,
    Color tint,
  ) => _wasm.DrawTextCodepoint(
    Font$.Ref1(font).toJS,
    codepoint.toJS,
    Vector2$.Ref1(position).toJS,
    fontSize.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawTextCodepoints(
    Font font,
    XPtr<XInt> codepoints,
    int codepointCount,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  ) => _wasm.DrawTextCodepoints(
    Font$.Ref1(font).toJS,
    codepoints.toJS,
    codepointCount.toJS,
    Vector2$.Ref1(position).toJS,
    fontSize.toJS,
    spacing.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void SetTextLineSpacing(
    int spacing,
  ) => _wasm.SetTextLineSpacing(
    spacing.toJS,
  );

  @override
  int MeasureText(
    XPtr<XChar> text,
    int fontSize,
  ) => _wasm.MeasureText(
    text.toJS,
    fontSize.toJS,
  );

  @override
  Vector2 MeasureTextEx(
    Font font,
    XPtr<XChar> text,
    double fontSize,
    double spacing,
  ) => Vector2$.Extract(
    (p) => _wasm.MeasureTextEx(
      p.toJS,
      Font$.Ref1(font).toJS,
      text.toJS,
      fontSize.toJS,
      spacing.toJS,
    ),
  );

  @override
  Vector2 MeasureTextCodepoints(
    Font font,
    XPtr<XInt> codepoints,
    int length,
    double fontSize,
    double spacing,
  ) => Vector2$.Extract(
    (p) => _wasm.MeasureTextCodepoints(
      p.toJS,
      Font$.Ref1(font).toJS,
      codepoints.toJS,
      length.toJS,
      fontSize.toJS,
      spacing.toJS,
    ),
  );

  @override
  int GetGlyphIndex(
    Font font,
    int codepoint,
  ) => _wasm.GetGlyphIndex(
    Font$.Ref1(font).toJS,
    codepoint.toJS,
  );

  @override
  GlyphInfo GetGlyphInfo(
    Font font,
    int codepoint,
  ) => GlyphInfo$.Extract(
    (p) => _wasm.GetGlyphInfo(
      p.toJS,
      Font$.Ref1(font).toJS,
      codepoint.toJS,
    ),
  );

  @override
  Rectangle GetGlyphAtlasRec(
    Font font,
    int codepoint,
  ) => Rectangle$.Extract(
    (p) => _wasm.GetGlyphAtlasRec(
      p.toJS,
      Font$.Ref1(font).toJS,
      codepoint.toJS,
    ),
  );

  @override
  XWasmPtr<XChar> LoadUTF8(
    XPtr<XInt> codepoints,
    int length,
  ) => _wasm.LoadUTF8(
    codepoints.toJS,
    length.toJS,
  );

  @override
  void UnloadUTF8(
    XPtr<XChar> text,
  ) => _wasm.UnloadUTF8(
    text.toJS,
  );

  @override
  XWasmPtr<XInt> LoadCodepoints(
    XPtr<XChar> text,
    XPtr<XInt> count,
  ) => _wasm.LoadCodepoints(
    text.toJS,
    count.toJS,
  );

  @override
  void UnloadCodepoints(
    XPtr<XInt> codepoints,
  ) => _wasm.UnloadCodepoints(
    codepoints.toJS,
  );

  @override
  int GetCodepointCount(
    XPtr<XChar> text,
  ) => _wasm.GetCodepointCount(
    text.toJS,
  );

  @override
  int GetCodepoint(
    XPtr<XChar> text,
    XPtr<XInt> codepointSize,
  ) => _wasm.GetCodepoint(
    text.toJS,
    codepointSize.toJS,
  );

  @override
  int GetCodepointNext(
    XPtr<XChar> text,
    XPtr<XInt> codepointSize,
  ) => _wasm.GetCodepointNext(
    text.toJS,
    codepointSize.toJS,
  );

  @override
  int GetCodepointPrevious(
    XPtr<XChar> text,
    XPtr<XInt> codepointSize,
  ) => _wasm.GetCodepointPrevious(
    text.toJS,
    codepointSize.toJS,
  );

  @override
  XWasmPtr<XChar> CodepointToUTF8(
    int codepoint,
    XPtr<XInt> utf8Size,
  ) => _wasm.CodepointToUTF8(
    codepoint.toJS,
    utf8Size.toJS,
  );

  @override
  XWasmPtr<XPtrType<XChar>> LoadTextLines(
    XPtr<XChar> text,
    XPtr<XInt> count,
  ) => _wasm.LoadTextLines(
    text.toJS,
    count.toJS,
  );

  @override
  void UnloadTextLines(
    XPtr<XPtrType<XChar>> text,
    int lineCount,
  ) => _wasm.UnloadTextLines(
    text.toJS,
    lineCount.toJS,
  );

  @override
  int TextCopy(
    XPtr<XChar> dst,
    XPtr<XChar> src,
  ) => _wasm.TextCopy(
    dst.toJS,
    src.toJS,
  );

  @override
  bool TextIsEqual(
    XPtr<XChar> text1,
    XPtr<XChar> text2,
  ) => _wasm.TextIsEqual(
    text1.toJS,
    text2.toJS,
  );

  @override
  int TextLength(
    XPtr<XChar> text,
  ) => _wasm.TextLength(
    text.toJS,
  );

  @override
  XWasmPtr<XChar> TextSubtext(
    XPtr<XChar> text,
    int position,
    int length,
  ) => _wasm.TextSubtext(
    text.toJS,
    position.toJS,
    length.toJS
  );

  @override
  XWasmPtr<XChar> TextRemoveSpaces(
    XPtr<XChar> text,
  ) => _wasm.TextRemoveSpaces(
    text.toJS,
  );

  @override
  XWasmPtr<XChar> GetTextBetween(
    XPtr<XChar> text,
    XPtr<XChar> begin,
    XPtr<XChar> end,
  ) => _wasm.GetTextBetween(
    text.toJS,
    begin.toJS,
    end.toJS,
  );

  @override
  XWasmPtr<XChar> TextReplace(
    XPtr<XChar> text,
    XPtr<XChar> replace,
    XPtr<XChar> by,
  ) => _wasm.TextReplace(
    text.toJS,
    replace.toJS,
    by.toJS,
  );

  @override
  XWasmPtr<XChar> TextReplaceAlloc(
    XPtr<XChar> text,
    XPtr<XChar> replace,
    XPtr<XChar> by,
  ) => _wasm.TextReplaceAlloc(
    text.toJS,
    replace.toJS,
    by.toJS,
  );

  @override
  XWasmPtr<XChar> TextReplaceBetween(
    XPtr<XChar> text,
    XPtr<XChar> begin,
    XPtr<XChar> end,
    XPtr<XChar> replacement,
  ) => _wasm.TextReplaceBetween(
    text.toJS,
    begin.toJS,
    end.toJS,
    replacement.toJS,
  );

  @override
  XWasmPtr<XChar> TextReplaceBetweenAlloc(
    XPtr<XChar> text,
    XPtr<XChar> begin,
    XPtr<XChar> end,
    XPtr<XChar> replacement,
  ) => _wasm.TextReplaceBetweenAlloc(
    text.toJS,
    begin.toJS,
    end.toJS,
    replacement.toJS,
  );

  @override
  XWasmPtr<XChar> TextInsert(
    XPtr<XChar> text,
    XPtr<XChar> insert,
    int position,
  ) => _wasm.TextInsert(
    text.toJS,
    insert.toJS,
    position.toJS,
  );

  @override
  XWasmPtr<XChar> TextInsertAlloc(
    XPtr<XChar> text,
    XPtr<XChar> insert,
    int position,
  ) => _wasm.TextInsertAlloc(
    text.toJS,
    insert.toJS,
    position.toJS,
  );

  @override
  XWasmPtr<XChar> TextJoin(
    XPtr<XPtrType<XChar>> textList,
    int count,
    XPtr<XChar> delimiter,
  ) => _wasm.TextJoin(
    textList.toJS,
    count.toJS,
    delimiter.toJS,
  );

  @override
  XWasmPtr<XPtrType<XChar>> TextSplit(
    XPtr<XChar> text,
    int delimiter,
    XPtr<XInt> count,
  ) => _wasm.TextSplit(
    text.toJS,
    delimiter.toJS,
    count.toJS,
  );

  @override
  void TextAppend(
    XPtr<XChar> text,
    XPtr<XChar> append,
    XPtr<XInt> position,
  ) => _wasm.TextAppend(
    text.toJS,
    append.toJS,
    position.toJS,
  );

  @override
  int TextFindIndex(
    XPtr<XChar> text,
    XPtr<XChar> find,
  ) => _wasm.TextFindIndex(
    text.toJS,
    find.toJS,
  );

  @override
  XWasmPtr<XChar> TextToUpper(
    XPtr<XChar> text,
  ) => _wasm.TextToUpper(
    text.toJS,
  );

  @override
  XWasmPtr<XChar> TextToLower(
    XPtr<XChar> text,
  ) => _wasm.TextToLower(
    text.toJS,
  );

  @override
  XWasmPtr<XChar> TextToPascal(
    XPtr<XChar> text,
  ) => _wasm.TextToPascal(
    text.toJS,
  );

  @override
  XWasmPtr<XChar> TextToSnake(
    XPtr<XChar> text,
  ) => _wasm.TextToSnake(
    text.toJS,
  );

  @override
  XWasmPtr<XChar> TextToCamel(
    XPtr<XChar> text,
  ) => _wasm.TextToCamel(
    text.toJS,
  );

  @override
  int TextToInteger(
    XPtr<XChar> text,
  ) => _wasm.TextToInteger(
    text.toJS,
  );

  @override
  double TextToFloat(
    XPtr<XChar> text,
  ) => _wasm.TextToFloat(
    text.toJS,
  );

  @override
  void DrawLine3D(
    Vector3 startPos,
    Vector3 endPos,
    Color color,
  ) => _wasm.DrawLine3D(
    Vector3$.Ref1(startPos).toJS,
    Vector3$.Ref2(endPos).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawPoint3D(
    Vector3 position,
    Color color,
  ) => _wasm.DrawPoint3D(
    Vector3$.Ref1(position).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCircle3D(
    Vector3 center,
    double radius,
    Vector3 rotationAxis,
    double rotationAngle,
    Color color,
  ) => _wasm.DrawCircle3D(
    Vector3$.Ref1(center).toJS,
    radius.toJS,
    Vector3$.Ref2(rotationAxis).toJS,
    rotationAngle.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawTriangle3D(
    Vector3 v1,
    Vector3 v2,
    Vector3 v3,
    Color color,
  ) => _wasm.DrawTriangle3D(
    Vector3$.Ref1(v1).toJS,
    Vector3$.Ref2(v2).toJS,
    Vector3$.Ref3(v3).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawTriangleStrip3D(
    XStructPtr<Vector3> points,
    int pointCount,
    Color color,
  ) => _wasm.DrawTriangleStrip3D(
    points.toJS,
    pointCount.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCube(
    Vector3 position,
    double width,
    double height,
    double length,
    Color color,
  ) => _wasm.DrawCube(
    Vector3$.Ref1(position).toJS,
    width.toJS,
    height.toJS,
    length.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCubeV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => _wasm.DrawCubeV(
    Vector3$.Ref1(position).toJS,
    Vector3$.Ref2(size).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCubeWires(
    Vector3 position,
    double width,
    double height,
    double length,
    Color color,
  ) => _wasm.DrawCubeWires(
    Vector3$.Ref1(position).toJS,
    width.toJS,
    height.toJS,
    length.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCubeWiresV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => _wasm.DrawCubeWiresV(
    Vector3$.Ref1(position).toJS,
    Vector3$.Ref2(size).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSphere(
    Vector3 centerPos,
    double radius,
    Color color,
  ) => _wasm.DrawSphere(
    Vector3$.Ref1(centerPos).toJS,
    radius.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSphereEx(
    Vector3 centerPos,
    double radius,
    int rings,
    int slices,
    Color color,
  ) => _wasm.DrawSphereEx(
    Vector3$.Ref1(centerPos).toJS,
    radius.toJS,
    rings.toJS,
    slices.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawSphereWires(
    Vector3 centerPos,
    double radius,
    int rings,
    int slices,
    Color color,
  ) => _wasm.DrawSphereWires(
    Vector3$.Ref1(centerPos).toJS,
    radius.toJS,
    rings.toJS,
    slices.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCylinder(
    Vector3 position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    Color color,
  ) => _wasm.DrawCylinder(
    Vector3$.Ref1(position).toJS,
    radiusTop.toJS,
    radiusBottom.toJS,
    height.toJS,
    slices.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCylinderEx(
    Vector3 startPos,
    Vector3 endPos,
    double startRadius,
    double endRadius,
    int sides,
    Color color,
  ) => _wasm.DrawCylinderEx(
    Vector3$.Ref1(startPos).toJS,
    Vector3$.Ref2(endPos).toJS,
    startRadius.toJS,
    endRadius.toJS,
    sides.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCylinderWires(
    Vector3 position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    Color color,
  ) => _wasm.DrawCylinderWires(
    Vector3$.Ref1(position).toJS,
    radiusTop.toJS,
    radiusBottom.toJS,
    height.toJS,
    slices.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCylinderWiresEx(
    Vector3 startPos,
    Vector3 endPos,
    double startRadius,
    double endRadius,
    int sides,
    Color color,
  ) => _wasm.DrawCylinderWiresEx(
    Vector3$.Ref1(startPos).toJS,
    Vector3$.Ref2(endPos).toJS,
    startRadius.toJS,
    endRadius.toJS,
    sides.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCapsule(
    Vector3 startPos,
    Vector3 endPos,
    double radius,
    int slices,
    int rings,
    Color color,
  ) => _wasm.DrawCapsule(
    Vector3$.Ref1(startPos).toJS,
    Vector3$.Ref2(endPos).toJS,
    radius.toJS,
    slices.toJS,
    rings.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawCapsuleWires(
    Vector3 startPos,
    Vector3 endPos,
    double radius,
    int slices,
    int rings,
    Color color,
  ) => _wasm.DrawCapsuleWires(
    Vector3$.Ref1(startPos).toJS,
    Vector3$.Ref2(endPos).toJS,
    radius.toJS,
    slices.toJS,
    rings.toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawPlane(
    Vector3 centerPos,
    Vector2 size,
    Color color,
  ) => _wasm.DrawPlane(
    Vector3$.Ref1(centerPos).toJS,
    Vector2$.Ref1(size).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawRay(
    Ray ray,
    Color color,
  ) => _wasm.DrawRay(
    Ray$.Ref1(ray).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawGrid(
    int slices,
    double spacing,
  ) => _wasm.DrawGrid(
    slices.toJS,
    spacing.toJS,
  );

  @override
  Model LoadModel(
    XPtr<XChar> fileName,
  ) => Model$.RefCapture(
    RaylibCaptureIds.LoadModel,
    (p) => _wasm.LoadModel(
      p.toJS,
      fileName.toJS,
    ),
  );

  @override
  Model LoadModelFromMesh(
    Mesh mesh,
  ) => Model$.RefCapture(
    RaylibCaptureIds.LoadModelFromMesh,
    (p) => _wasm.LoadModelFromMesh(
      p.toJS,
      Mesh$.Ref1(mesh).toJS,
    ),
  );

  @override
  bool IsModelValid(
    Model model,
  ) => _wasm.IsModelValid(
    Model$.Ref1(model).toJS,
  );

  @override
  void UnloadModel(
    Model model,
  ) => _wasm.UnloadModel(
    Model$.Ref1(model).toJS,
  );

  @override
  BoundingBox GetModelBoundingBox(
    Model model,
  ) => BoundingBox$.Extract(
    (p) => _wasm.GetModelBoundingBox(
      p.toJS,
      Model$.Ref1(model).toJS,
    ),
  );

  @override
  void DrawModel(
    Model model,
    Vector3 position,
    double scale,
    Color tint,
  ) => _wasm.DrawModel(
    Model$.Ref1(model).toJS,
    Vector3$.Ref1(position).toJS,
    scale.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawModelEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    double rotationAngle,
    Vector3 scale,
    Color tint,
  ) => _wasm.DrawModelEx(
    Model$.Ref1(model).toJS,
    Vector3$.Ref1(position).toJS,
    Vector3$.Ref2(rotationAxis).toJS,
    rotationAngle.toJS,
    Vector3$.Ref3(scale).toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawModelWires(
    Model model,
    Vector3 position,
    double scale,
    Color tint,
  ) => _wasm.DrawModelWires(
    Model$.Ref1(model).toJS,
    Vector3$.Ref1(position).toJS,
    scale.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawModelWiresEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    double rotationAngle,
    Vector3 scale,
    Color tint,
  ) => _wasm.DrawModelWiresEx(
    Model$.Ref1(model).toJS,
    Vector3$.Ref1(position).toJS,
    Vector3$.Ref2(rotationAxis).toJS,
    rotationAngle.toJS,
    Vector3$.Ref3(scale).toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawBoundingBox(
    BoundingBox box,
    Color color,
  ) => _wasm.DrawBoundingBox(
    BoundingBox$.Ref1(box).toJS,
    Color$.Ref1(color).toJS,
  );

  @override
  void DrawBillboard(
    Camera3D camera,
    Texture texture,
    Vector3 position,
    double scale,
    Color tint,
  ) => _wasm.DrawBillboard(
    Camera3D$.Ref1(camera).toJS,
    Texture$.Ref1(texture).toJS,
    Vector3$.Ref1(position).toJS,
    scale.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void DrawBillboardRec(
    Camera3D camera,
    Texture texture,
    Rectangle source,
    Vector3 position,
    Vector2 size,
    Color tint,
  ) => _wasm.DrawBillboardRec(
    Camera3D$.Ref1(camera).toJS,
    Texture$.Ref1(texture).toJS,
    Rectangle$.Ref1(source).toJS,
    Vector3$.Ref1(position).toJS,
    Vector2$.Ref1(size).toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
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
    double rotation,
    Color tint,
  ) => _wasm.DrawBillboardPro(
    Camera3D$.Ref1(camera).toJS,
    Texture$.Ref1(texture).toJS,
    Rectangle$.Ref1(source).toJS,
    Vector3$.Ref1(position).toJS,
    Vector3$.Ref2(up).toJS,
    Vector2$.Ref1(size).toJS,
    Vector2$.Ref2(origin).toJS,
    rotation.toJS,
    Color$.Ref1(tint).toJS,
  );

  @override
  void UploadMesh(
    XStructPtr<Mesh> mesh,
    bool dynamic,
  ) => _wasm.UploadMesh(
    mesh.toJS,
    dynamic.toJS,
  );

  @override
  void UpdateMeshBuffer(
    Mesh mesh,
    int index,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  ) => _wasm.UpdateMeshBuffer(
    Mesh$.Ref1(mesh).toJS,
    index.toJS,
    data.toJS,
    dataSize.toJS,
    offset.toJS,
  );

  @override
  void UnloadMesh(
    Mesh mesh,
  ) => _wasm.UnloadMesh(
    Mesh$.Ref1(mesh).toJS,
  );

  @override
  void DrawMesh(
    Mesh mesh,
    Material material,
    Matrix transform,
  ) => _wasm.DrawMesh(
    Mesh$.Ref1(mesh).toJS,
    Material$.Ref1(material).toJS,
    Matrix$.Ref1(transform).toJS,
  );

  @override
  void DrawMeshInstanced(
    Mesh mesh,
    Material material,
    XStructPtr<Matrix> transforms,
    int instances,
  ) => _wasm.DrawMeshInstanced(
    Mesh$.Ref1(mesh).toJS,
    Material$.Ref1(material).toJS,
    transforms.toJS,
    instances.toJS,
  );

  @override
  BoundingBox GetMeshBoundingBox(
    Mesh mesh,
  ) => BoundingBox$.Extract(
    (p) => _wasm.GetMeshBoundingBox(
      p.toJS,
      Mesh$.Ref1(mesh).toJS,
    ),
  );

  @override
  void GenMeshTangents(
    XStructPtr<Mesh> mesh,
  ) => _wasm.GenMeshTangents(
    mesh.toJS,
  );

  @override
  bool ExportMesh(
    Mesh mesh,
    XPtr<XChar> fileName,
  ) => _wasm.ExportMesh(
    Mesh$.Ref1(mesh).toJS,
    fileName.toJS,
  );

  @override
  bool ExportMeshAsCode(
    Mesh mesh,
    XPtr<XChar> fileName,
  ) => _wasm.ExportMeshAsCode(
    Mesh$.Ref1(mesh).toJS,
    fileName.toJS,
  );

  @override
  Mesh GenMeshPoly(
    int sides,
    double radius,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshPoly,
    (p) => _wasm.GenMeshPoly(
      p.toJS,
      sides.toJS,
      radius.toJS,
    ),
  );

  @override
  Mesh GenMeshPlane(
    double width,
    double length,
    int resX,
    int resZ,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshPlane,
    (p) => _wasm.GenMeshPlane(
      p.toJS,
      width.toJS,
      length.toJS,
      resX.toJS,
      resZ.toJS,
    ),
  );

  @override
  Mesh GenMeshCube(
    double width,
    double height,
    double length,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCube,
    (p) => _wasm.GenMeshCube(
      p.toJS,
      width.toJS,
      height.toJS,
      length.toJS,
    ),
  );

  @override
  Mesh GenMeshSphere(
    double radius,
    int rings,
    int slices,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshSphere,
    (p) => _wasm.GenMeshSphere(
      p.toJS,
      radius.toJS,
      rings.toJS,
      slices.toJS,
    ),
  );

  @override
  Mesh GenMeshHemiSphere(
    double radius,
    int rings,
    int slices,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshHemiSphere,
    (p) => _wasm.GenMeshHemiSphere(
      p.toJS,
      radius.toJS,
      rings.toJS,
      slices.toJS,
    ),
  );

  @override
  Mesh GenMeshCylinder(
    double radius,
    double height,
    int slices,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCylinder,
    (p) => _wasm.GenMeshCylinder(
      p.toJS,
      radius.toJS,
      height.toJS,
      slices.toJS,
    ),
  );

  @override
  Mesh GenMeshCone(
    double radius,
    double height,
    int slices,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCone,
    (p) => _wasm.GenMeshCone(
      p.toJS,
      radius.toJS,
      height.toJS,
      slices.toJS,
    ),
  );

  @override
  Mesh GenMeshTorus(
    double radius,
    double size,
    int radSeg,
    int sides,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshTorus,
    (p) => _wasm.GenMeshTorus(
      p.toJS,
      radius.toJS,
      size.toJS,
      radSeg.toJS,
      sides.toJS,
    ),
  );

  @override
  Mesh GenMeshKnot(
    double radius,
    double size,
    int radSeg,
    int sides,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshKnot,
    (p) => _wasm.GenMeshKnot(
      p.toJS,
      radius.toJS,
      size.toJS,
      radSeg.toJS,
      sides.toJS,
    ),
  );

  @override
  Mesh GenMeshHeightmap(
    Image heightmap,
    Vector3 size,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshHeightmap,
    (p) => _wasm.GenMeshHeightmap(
      p.toJS,
      Image$.Ref1(heightmap).toJS,
      Vector3$.Ref1(size).toJS,
    ),
  );

  @override
  Mesh GenMeshCubicmap(
    Image cubicmap,
    Vector3 cubeSize,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCubicmap,
    (p) => _wasm.GenMeshCubicmap(
      p.toJS,
      Image$.Ref1(cubicmap).toJS,
      Vector3$.Ref1(cubeSize).toJS,
    ),
  );

  @override
  XStructPtr<Material> LoadMaterials(
    XPtr<XChar> fileName,
    XPtr<XInt> materialCount,
  ) => _wasm.LoadMaterials(
    fileName.toJS,
    materialCount.toJS,
  );

  @override
  Material LoadMaterialDefault() => Material$.RefCapture(
    RaylibCaptureIds.LoadMaterialDefault,
    (p) => _wasm.LoadMaterialDefault(
      p.toJS,
    ),
  );

  @override
  bool IsMaterialValid(
    Material material,
  ) => _wasm.IsMaterialValid(
    Material$.Ref1(material).toJS,
  );

  @override
  void UnloadMaterial(
    Material material,
  ) => _wasm.UnloadMaterial(
    Material$.Ref1(material).toJS,
  );

  @override
  void SetMaterialTexture(
    XStructPtr<Material> material,
    int mapType,
    Texture texture,
  ) => _wasm.SetMaterialTexture(
    material.toJS,
    mapType.toJS,
    Texture$.Ref1(texture).toJS,
  );

  @override
  void SetModelMeshMaterial(
    XStructPtr<Model> model,
    int meshId,
    int materialId,
  ) => _wasm.SetModelMeshMaterial(
    model.toJS,
    meshId.toJS,
    materialId.toJS,
  );

  @override
  XStructPtr<ModelAnimation> LoadModelAnimations(
    XPtr<XChar> fileName,
    XPtr<XInt> animCount,
  ) => _wasm.LoadModelAnimations(
    fileName.toJS,
    animCount.toJS,
  );

  @override
  void UpdateModelAnimation(
    Model model,
    ModelAnimation anim,
    double frame,
  ) => _wasm.UpdateModelAnimation(
    Model$.Ref1(model).toJS,
    ModelAnimation$.Ref1(anim).toJS,
    frame.toJS,
  );

  @override
  void UpdateModelAnimationEx(
    Model model,
    ModelAnimation animA,
    double frameA,
    ModelAnimation animB,
    double frameB,
    double blend,
  ) => _wasm.UpdateModelAnimationEx(
    Model$.Ref1(model).toJS,
    ModelAnimation$.Ref1(animA).toJS,
    frameA.toJS,
    ModelAnimation$.Ref2(animB).toJS,
    frameB.toJS,
    blend.toJS,
  );

  @override
  void UnloadModelAnimations(
    XStructPtr<ModelAnimation> animations,
    int animCount,
  ) => _wasm.UnloadModelAnimations(
    animations.toJS,
    animCount.toJS,
  );

  @override
  bool IsModelAnimationValid(
    Model model,
    ModelAnimation anim,
  ) => _wasm.IsModelAnimationValid(
    Model$.Ref1(model).toJS,
    ModelAnimation$.Ref1(anim).toJS,
  );

  @override
  bool CheckCollisionSpheres(
    Vector3 center1,
    double radius1,
    Vector3 center2,
    double radius2,
  ) => _wasm.CheckCollisionSpheres(
    Vector3$.Ref1(center1).toJS,
    radius1.toJS,
    Vector3$.Ref2(center2).toJS,
    radius2.toJS,
  );

  @override
  bool CheckCollisionBoxes(
    BoundingBox box1,
    BoundingBox box2,
  ) => _wasm.CheckCollisionBoxes(
    BoundingBox$.Ref1(box1).toJS,
    BoundingBox$.Ref2(box2).toJS,
  );

  @override
  bool CheckCollisionBoxSphere(
    BoundingBox box,
    Vector3 center,
    double radius,
  ) => _wasm.CheckCollisionBoxSphere(
    BoundingBox$.Ref1(box).toJS,
    Vector3$.Ref1(center).toJS,
    radius.toJS,
  );

  @override
  RayCollision GetRayCollisionSphere(
    Ray ray,
    Vector3 center,
    double radius,
  ) => RayCollision$.Extract(
    (p) => _wasm.GetRayCollisionSphere(
      p.toJS,
      Ray$.Ref1(ray).toJS,
      Vector3$.Ref1(center).toJS,
      radius.toJS,
    ),
  );

  @override
  RayCollision GetRayCollisionBox(
    Ray ray,
    BoundingBox box,
  ) => RayCollision$.Extract(
    (p) => _wasm.GetRayCollisionBox(
      p.toJS,
      Ray$.Ref1(ray).toJS,
      BoundingBox$.Ref1(box).toJS,
    ),
  );

  @override
  RayCollision GetRayCollisionMesh(
    Ray ray,
    Mesh mesh,
    Matrix transform,
  ) => RayCollision$.Extract(
    (p) => _wasm.GetRayCollisionMesh(
      p.toJS,
      Ray$.Ref1(ray).toJS,
      Mesh$.Ref1(mesh).toJS,
      Matrix$.Ref1(transform).toJS,
    ),
  );

  @override
  RayCollision GetRayCollisionTriangle(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
  ) => RayCollision$.Extract(
    (p) => _wasm.GetRayCollisionTriangle(
      p.toJS,
      Ray$.Ref1(ray).toJS,
      Vector3$.Ref1(p1).toJS,
      Vector3$.Ref2(p2).toJS,
      Vector3$.Ref3(p3).toJS,
    ),
  );

  @override
  RayCollision GetRayCollisionQuad(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
    Vector3 p4,
  ) => RayCollision$.Extract(
    (p) => _wasm.GetRayCollisionQuad(
      p.toJS,
      Ray$.Ref1(ray).toJS,
      Vector3$.Ref1(p1).toJS,
      Vector3$.Ref2(p2).toJS,
      Vector3$.Ref3(p3).toJS,
      Vector3$.Ref4(p4).toJS,
    ),
  );
}