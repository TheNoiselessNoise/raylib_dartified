part of '../../../raylib_dartified.dart';

class RaylibCoreFlatNative extends RaylibCoreFlat<Raylib> {

  RaylibCoreFlatNative(super.rl);

  RaylibCore get _ffi => rl.module();

  @override
  void InitWindow(
    int width,
    int height,
    XPtr<XChar> title,
  ) => _ffi.InitWindow(
    width,
    height,
    title.asNative(),
  );

  @override
  void CloseWindow() => _ffi.CloseWindow();

  @override
  bool WindowShouldClose() => _ffi.WindowShouldClose();

  @override
  bool IsWindowReady() => _ffi.IsWindowReady();

  @override
  bool IsWindowFullscreen() => _ffi.IsWindowFullscreen();

  @override
  bool IsWindowHidden() => _ffi.IsWindowHidden();

  @override
  bool IsWindowMinimized() => _ffi.IsWindowMinimized();

  @override
  bool IsWindowMaximized() => _ffi.IsWindowMaximized();

  @override
  bool IsWindowFocused() => _ffi.IsWindowFocused();

  @override
  bool IsWindowResized() => _ffi.IsWindowResized();

  @override
  bool IsWindowState(
    int flag,
  ) => _ffi.IsWindowState(
    flag,
  );

  @override
  void SetWindowState(
    int flags,
  ) => _ffi.SetWindowState(
    flags,
  );

  @override
  void ClearWindowState(
    int flags,
  ) => _ffi.ClearWindowState(
    flags,
  );

  @override
  void ToggleFullscreen() => _ffi.ToggleFullscreen();

  @override
  void ToggleBorderlessWindowed() => _ffi.ToggleBorderlessWindowed();

  @override
  void MaximizeWindow() => _ffi.MaximizeWindow();

  @override
  void MinimizeWindow() => _ffi.MinimizeWindow();

  @override
  void RestoreWindow() => _ffi.RestoreWindow();

  @override
  void SetWindowIcon(
    Image image,
  ) => _ffi.SetWindowIcon(
    Image$.Ref1(image).asNative<ImageC>().ref,
  );

  @override
  void SetWindowIcons(
    XStructPtr<Image> images,
    int count,
  ) => _ffi.SetWindowIcons(
    images.asNative(),
    count,
  );

  @override
  void SetWindowTitle(
    XPtr<XChar> title,
  ) => _ffi.SetWindowTitle(
    title.asNative(),
  );

  @override
  void SetWindowPosition(
    int x,
    int y,
  ) => _ffi.SetWindowPosition(
    x,
    y,
  );

  @override
  void SetWindowMonitor(
    int monitor,
  ) => _ffi.SetWindowMonitor(
    monitor,
  );

  @override
  void SetWindowMinSize(
    int width,
    int height,
  ) => _ffi.SetWindowMinSize(
    width,
    height,
  );

  @override
  void SetWindowMaxSize(
    int width,
    int height,
  ) => _ffi.SetWindowMaxSize(
    width,
    height,
  );

  @override
  void SetWindowSize(
    int width,
    int height,
  ) => _ffi.SetWindowSize(
    width,
    height,
  );

  @override
  void SetWindowOpacity(
    double opacity,
  ) => _ffi.SetWindowOpacity(
    opacity,
  );

  @override
  void SetWindowFocused() => _ffi.SetWindowFocused();

  @override
  XNativePtr<XVoid> GetWindowHandle() => _ffi.GetWindowHandle().asXPtr();

  @override
  int GetScreenWidth() => _ffi.GetScreenWidth();

  @override
  int GetScreenHeight() => _ffi.GetScreenHeight();

  @override
  int GetRenderWidth() => _ffi.GetRenderWidth();

  @override
  int GetRenderHeight() => _ffi.GetRenderHeight();

  @override
  int GetMonitorCount() => _ffi.GetMonitorCount();

  @override
  int GetCurrentMonitor() => _ffi.GetCurrentMonitor();

  @override
  Vector2 GetMonitorPosition(
    int monitor,
  ) => Vector2$.Extract(
    (p) => _ffi.GetMonitorPosition(
      monitor,
    ).toDart(p.asNative()),
  );

  @override
  int GetMonitorWidth(
    int monitor,
  ) => _ffi.GetMonitorWidth(
    monitor,
  );

  @override
  int GetMonitorHeight(
    int monitor,
  ) => _ffi.GetMonitorHeight(
    monitor,
  );

  @override
  int GetMonitorPhysicalWidth(
    int monitor,
  ) => _ffi.GetMonitorPhysicalWidth(
    monitor,
  );

  @override
  int GetMonitorPhysicalHeight(
    int monitor,
  ) => _ffi.GetMonitorPhysicalHeight(
    monitor,
  );

  @override
  int GetMonitorRefreshRate(
    int monitor,
  ) => _ffi.GetMonitorRefreshRate(
    monitor,
  );

  @override
  Vector2 GetWindowPosition() => Vector2$.Extract(
    (p) => _ffi.GetWindowPosition().toDart(p.asNative()),
  );

  @override
  Vector2 GetWindowScaleDPI() => Vector2$.Extract(
    (p) => _ffi.GetWindowScaleDPI().toDart(p.asNative()),
  );

  @override
  XNativePtr<XChar> GetMonitorName(
    int monitor,
  ) => _ffi.GetMonitorName(
    monitor,
  ).asXPtr();

  @override
  void SetClipboardText(
    XPtr<XChar> text,
  ) => _ffi.SetClipboardText(
    text.asNative(),
  );

  @override
  XNativePtr<XChar> GetClipboardText() => _ffi.GetClipboardText().asXPtr();

  @override
  Image GetClipboardImage() => Image$.RefCapture(
    RaylibCaptureIds.GetClipboardImage,
    (p) => _ffi.GetClipboardImage().toDart(p.asNative()),
  );

  @override
  void EnableEventWaiting() => _ffi.EnableEventWaiting();

  @override
  void DisableEventWaiting() => _ffi.DisableEventWaiting();

  @override
  void ShowCursor() => _ffi.ShowCursor();

  @override
  void HideCursor() => _ffi.HideCursor();

  @override
  bool IsCursorHidden() => _ffi.IsCursorHidden();

  @override
  void EnableCursor() => _ffi.EnableCursor();

  @override
  void DisableCursor() => _ffi.DisableCursor();

  @override
  bool IsCursorOnScreen() => _ffi.IsCursorOnScreen();

  @override
  void ClearBackground(
    Color color,
  ) => _ffi.ClearBackground(
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void BeginDrawing() => _ffi.BeginDrawing();

  @override
  void EndDrawing() => _ffi.EndDrawing();

  @override
  void BeginMode2D(
    Camera2D camera,
  ) => _ffi.BeginMode2D(
    Camera2D$.Ref1(camera).asNative<Camera2DC>().ref,
  );

  @override
  void EndMode2D() => _ffi.EndMode2D();

  @override
  void BeginMode3D(
    Camera3D camera,
  ) => _ffi.BeginMode3D(
    Camera3D$.Ref1(camera).asNative<Camera3DC>().ref,
  );

  @override
  void EndMode3D() => _ffi.EndMode3D();

  @override
  void BeginTextureMode(
    RenderTexture target,
  ) => _ffi.BeginTextureMode(
    RenderTexture$.Ref1(target).asNative<RenderTextureC>().ref,
  );

  @override
  void EndTextureMode() => _ffi.EndTextureMode();

  @override
  void BeginShaderMode(
    Shader shader,
  ) => _ffi.BeginShaderMode(
    Shader$.Ref1(shader).asNative<ShaderC>().ref,
  );

  @override
  void EndShaderMode() => _ffi.EndShaderMode();

  @override
  void BeginBlendMode(
    int mode,
  ) => _ffi.BeginBlendMode(
    mode,
  );

  @override
  void EndBlendMode() => _ffi.EndBlendMode();

  @override
  void BeginScissorMode(
    int x,
    int y,
    int width,
    int height,
  ) => _ffi.BeginScissorMode(
    x,
    y,
    width,
    height,
  );

  @override
  void EndScissorMode() => _ffi.EndScissorMode();

  @override
  void BeginVrStereoMode(
    VrStereoConfig config,
  ) => _ffi.BeginVrStereoMode(
    VrStereoConfig$.Ref1(config).asNative<VrStereoConfigC>().ref,
  );

  @override
  void EndVrStereoMode() => _ffi.EndVrStereoMode();

  @override
  VrStereoConfig LoadVrStereoConfig(
    VrDeviceInfo device,
  ) => VrStereoConfig$.RefCapture(
    RaylibCaptureIds.LoadVrStereoConfig,
    (p) => _ffi.LoadVrStereoConfig(
      VrDeviceInfo$.Ref1(device).asNative<VrDeviceInfoC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  void UnloadVrStereoConfig(
    VrStereoConfig config,
  ) => disposeStructWithOpFreed(config, (ptr) {
    _ffi.UnloadVrStereoConfig(
      ptr.asNative<VrStereoConfigC>().ref,
    );
  });

  @override
  Shader LoadShader(
    XPtr<XChar> vsFileName,
    XPtr<XChar> fsFileName,
  ) => Shader$.RefCapture(
    RaylibCaptureIds.LoadShader,
    (p) => _ffi.LoadShader(
      vsFileName.asNative(),
      fsFileName.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  Shader LoadShaderFromMemory(
    XPtr<XChar> vsCode,
    XPtr<XChar> fsCode,
  ) => Shader$.RefCapture(
    RaylibCaptureIds.LoadShaderFromMemory,
    (p) => _ffi.LoadShaderFromMemory(
      vsCode.asNative(),
      fsCode.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  bool IsShaderValid(
    Shader shader,
  ) => _ffi.IsShaderValid(
    Shader$.Ref1(shader).asNative<ShaderC>().ref,
  );

  @override
  int GetShaderLocation(
    Shader shader,
    XPtr<XChar> uniformName,
  ) => _ffi.GetShaderLocation(
    Shader$.Ref1(shader).asNative<ShaderC>().ref,
    uniformName.asNative(),
  );

  @override
  int GetShaderLocationAttrib(
    Shader shader,
    XPtr<XChar> attribName,
  ) => _ffi.GetShaderLocationAttrib(
    Shader$.Ref1(shader).asNative<ShaderC>().ref,
    attribName.asNative(),
  );

  @override
  void SetShaderValueV(
    Shader shader,
    int locIndex,
    XPtr<XVoid> value,
    int uniformType,
    int count,
  ) => _ffi.SetShaderValueV(
    Shader$.Ref1(shader).asNative<ShaderC>().ref,
    locIndex,
    value.asNative(),
    uniformType,
    count,
  );

  @override
  void SetShaderValueMatrix(
    Shader shader,
    int locIndex,
    Matrix mat,
  ) => _ffi.SetShaderValueMatrix(
    Shader$.Ref1(shader).asNative<ShaderC>().ref,
    locIndex,
    Matrix$.Ref1(mat).asNative<MatrixC>().ref,
  );

  @override
  void SetShaderValueTexture(
    Shader shader,
    int locIndex,
    Texture texture,
  ) => _ffi.SetShaderValueTexture(
    Shader$.Ref1(shader).asNative<ShaderC>().ref,
    locIndex,
    Texture$.Ref1(texture).asNative<TextureC>().ref,
  );

  @override
  void UnloadShader(
    Shader shader,
  ) => disposeStructWithOpFreed(shader, (ptr) {
    _ffi.UnloadShader(
      ptr.asNative<ShaderC>().ref,
    );
  });

  @override
  Ray GetScreenToWorldRay(
    Vector2 position,
    Camera3D camera,
  ) => Ray$.Extract(
    (p) => _ffi.GetScreenToWorldRay(
      Vector2$.Ref1(position).asNative<Vector2C>().ref,
      Camera3D$.Ref1(camera).asNative<Camera3DC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Ray GetScreenToWorldRayEx(
    Vector2 position,
    Camera3D camera,
    int width,
    int height,
  ) => Ray$.Extract(
    (p) => _ffi.GetScreenToWorldRayEx(
      Vector2$.Ref1(position).asNative<Vector2C>().ref,
      Camera3D$.Ref1(camera).asNative<Camera3DC>().ref,
      width,
      height,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 GetWorldToScreen(
    Vector3 position,
    Camera3D camera,
  ) => Vector2$.Extract(
    (p) => _ffi.GetWorldToScreen(
      Vector3$.Ref1(position).asNative<Vector3C>().ref,
      Camera3D$.Ref1(camera).asNative<Camera3DC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 GetWorldToScreenEx(
    Vector3 position,
    Camera3D camera,
    int width,
    int height,
  ) => Vector2$.Extract(
    (p) => _ffi.GetWorldToScreenEx(
      Vector3$.Ref1(position).asNative<Vector3C>().ref,
      Camera3D$.Ref1(camera).asNative<Camera3DC>().ref,
      width,
      height,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 GetWorldToScreen2D(
    Vector2 position,
    Camera2D camera,
  ) => Vector2$.Extract(
    (p) => _ffi.GetWorldToScreen2D(
      Vector2$.Ref1(position).asNative<Vector2C>().ref,
      Camera2D$.Ref1(camera).asNative<Camera2DC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 GetScreenToWorld2D(
    Vector2 position,
    Camera2D camera,
  ) => Vector2$.Extract(
    (p) => _ffi.GetScreenToWorld2D(
      Vector2$.Ref1(position).asNative<Vector2C>().ref,
      Camera2D$.Ref1(camera).asNative<Camera2DC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix GetCameraMatrix(
    Camera3D camera,
  ) => Matrix$.Extract(
    (p) => _ffi.GetCameraMatrix(
      Camera3D$.Ref1(camera).asNative<Camera3DC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Matrix GetCameraMatrix2D(
    Camera2D camera,
  ) => Matrix$.Extract(
    (p) => _ffi.GetCameraMatrix2D(
      Camera2D$.Ref1(camera).asNative<Camera2DC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  void SetTargetFPS(
    int fps,
  ) => _ffi.SetTargetFPS(
    fps,
  );

  @override
  double GetFrameTime() => _ffi.GetFrameTime();

  @override
  double GetTime() => _ffi.GetTime();

  @override
  int GetFPS() => _ffi.GetFPS();

  @override
  void SwapScreenBuffer() => _ffi.SwapScreenBuffer();

  @override
  void PollInputEvents() => _ffi.PollInputEvents();

  @override
  void WaitTime(
    double seconds,
  ) => _ffi.WaitTime(
    seconds,
  );

  @override
  void SetRandomSeed(
    int seed,
  ) => _ffi.SetRandomSeed(
    seed,
  );

  @override
  int GetRandomValue(
    int min,
    int max,
  ) => _ffi.GetRandomValue(
    min,
    max,
  );

  @override
  XNativePtr<XInt> LoadRandomSequence(
    int count,
    int min,
    int max,
  ) => _ffi.LoadRandomSequence(
    count,
    min,
    max,
  ).asXPtr();

  @override
  void UnloadRandomSequence(
    XPtr<XInt> sequence,
  ) => _ffi.UnloadRandomSequence(
    sequence.asNative(),
  );

  @override
  void TakeScreenshot(
    XPtr<XChar> fileName,
  ) => _ffi.TakeScreenshot(
    fileName.asNative(),
  );

  @override
  void SetConfigFlags(
    int flags,
  ) => _ffi.SetConfigFlags(
    flags,
  );

  @override
  void OpenURL(
    XPtr<XChar> url,
  ) => _ffi.OpenURL(
    url.asNative(),
  );

  @override
  void TraceLog(
    int logLevel,
    XPtr<XChar> text,
    // NOTE: missing va_list argument
  ) => _ffi.TraceLog(
    logLevel,
    text.asNative(),
  );

  @override
  void SetTraceLogLevel(
    int logLevel,
  ) => _ffi.SetTraceLogLevel(
    logLevel,
  );

  @override
  void SetTraceLogCallback(
    XPtr<XFunction<TraceLogCallbackBase>> callback,
  ) => _ffi.SetTraceLogCallback(
    callback.asNative(),
  );

  @override
  void SetLoadFileDataCallback(
    XPtr<XFunction<LoadFileDataCallbackBase>> callback,
  ) => _ffi.SetLoadFileDataCallback(
    callback.asNative(),
  );

  @override
  void SetSaveFileDataCallback(
    XPtr<XFunction<SaveFileDataCallbackBase>> callback,
  ) => _ffi.SetSaveFileDataCallback(
    callback.asNative(),
  );

  @override
  void SetLoadFileTextCallback(
    XPtr<XFunction<LoadFileTextCallbackBase>> callback,
  ) => _ffi.SetLoadFileTextCallback(
    callback.asNative(),
  );

  @override
  void SetSaveFileTextCallback(
    XPtr<XFunction<SaveFileTextCallbackBase>> callback,
  ) => _ffi.SetSaveFileTextCallback(
    callback.asNative(),
  );

  @override
  XNativePtr<XUnsignedChar> LoadFileData(
    XPtr<XChar> fileName,
    XPtr<XInt> dataSize,
  ) => _ffi.LoadFileData(
    fileName.asNative(),
    dataSize.asNative(),
  ).asXPtr();

  @override
  void UnloadFileData(
    XPtr<XUnsignedChar> data,
  ) => _ffi.UnloadFileData(
    data.asNative(),
  );

  @override
  bool SaveFileData(
    XPtr<XChar> fileName,
    XPtr<XVoid> data,
    int dataSize,
  ) => _ffi.SaveFileData(
    fileName.asNative(),
    data.asNative(),
    dataSize,
  );

  @override
  bool ExportDataAsCode(
    XPtr<XUnsignedChar> data,
    int dataSize,
    XPtr<XChar> fileName,
  ) => _ffi.ExportDataAsCode(
    data.asNative(),
    dataSize,
    fileName.asNative(),
  );

  @override
  XNativePtr<XChar> LoadFileText(
    XPtr<XChar> fileName,
  ) => _ffi.LoadFileText(
    fileName.asNative(),
  ).asXPtr();

  @override
  void UnloadFileText(
    XPtr<XChar> text,
  ) => _ffi.UnloadFileText(
    text.asNative(),
  );

  @override
  bool SaveFileText(
    XPtr<XChar> fileName,
    XPtr<XChar> text,
  ) => _ffi.SaveFileText(
    fileName.asNative(),
    text.asNative(),
  );

  @override
  int FileRename(
    XPtr<XChar> fileName,
    XPtr<XChar> fileRename,
  ) => _ffi.FileRename(
    fileName.asNative(),
    fileRename.asNative(),
  );

  @override
  int FileRemove(
    XPtr<XChar> fileName,
  ) => _ffi.FileRemove(
    fileName.asNative(),
  );

  @override
  int FileCopy(
    XPtr<XChar> srcPath,
    XPtr<XChar> dstPath,
  ) => _ffi.FileCopy(
    srcPath.asNative(),
    dstPath.asNative(),
  );

  @override
  int FileMove(
    XPtr<XChar> srcPath,
    XPtr<XChar> dstPath,
  ) => _ffi.FileMove(
    srcPath.asNative(),
    dstPath.asNative(),
  );

  @override
  int FileTextReplace(
    XPtr<XChar> fileName,
    XPtr<XChar> search,
    XPtr<XChar> replacement,
  ) => _ffi.FileTextReplace(
    fileName.asNative(),
    search.asNative(),
    replacement.asNative(),
  );

  @override
  int FileTextFindIndex(
    XPtr<XChar> fileName,
    XPtr<XChar> search,
  ) => _ffi.FileTextFindIndex(
    fileName.asNative(),
    search.asNative(),
  );

  @override
  bool FileExists(
    XPtr<XChar> fileName,
  ) => _ffi.FileExists(
    fileName.asNative(),
  );

  @override
  bool DirectoryExists(
    XPtr<XChar> dirPath,
  ) => _ffi.DirectoryExists(
    dirPath.asNative(),
  );

  @override
  bool IsFileExtension(
    XPtr<XChar> fileName,
    XPtr<XChar> ext,
  ) => _ffi.IsFileExtension(
    fileName.asNative(),
    ext.asNative(),
  );

  @override
  int GetFileLength(
    XPtr<XChar> fileName,
  ) => _ffi.GetFileLength(
    fileName.asNative(),
  );

  @override
  XNativePtr<XChar> GetFileExtension(
    XPtr<XChar> fileName,
  ) => _ffi.GetFileExtension(
    fileName.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> GetFileName(
    XPtr<XChar> filePath,
  ) => _ffi.GetFileName(
    filePath.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> GetFileNameWithoutExt(
    XPtr<XChar> filePath,
  ) => _ffi.GetFileNameWithoutExt(
    filePath.asNative(),
  ).asXPtr();

  @override
  int GetDirectoryFileCount(
    XPtr<XChar> dirPath,
  ) => _ffi.GetDirectoryFileCount(
    dirPath.asNative(),
  );

  @override
  int GetDirectoryFileCountEx(
    XPtr<XChar> basePath,
    XPtr<XChar> filter,
    bool scanSubdirs,
  ) => _ffi.GetDirectoryFileCountEx(
    basePath.asNative(),
    filter.asNative(),
    scanSubdirs,
  );

  @override
  XNativePtr<XChar> GetDirectoryPath(
    XPtr<XChar> filePath,
  ) => _ffi.GetDirectoryPath(
    filePath.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> GetPrevDirectoryPath(
    XPtr<XChar> dirPath,
  ) => _ffi.GetPrevDirectoryPath(
    dirPath.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> GetWorkingDirectory() => _ffi.GetWorkingDirectory().asXPtr();

  @override
  XNativePtr<XChar> GetApplicationDirectory() => _ffi.GetApplicationDirectory().asXPtr();

  @override
  int MakeDirectory(
    XPtr<XChar> dirPath,
  ) => _ffi.MakeDirectory(
    dirPath.asNative(),
  );

  @override
  bool ChangeDirectory(
    XPtr<XChar> dir,
  ) => _ffi.ChangeDirectory(
    dir.asNative(),
  );

  @override
  bool IsPathFile(
    XPtr<XChar> path,
  ) => _ffi.IsPathFile(
    path.asNative(),
  );

  @override
  bool IsFileNameValid(
    XPtr<XChar> fileName,
  ) => _ffi.IsFileNameValid(
    fileName.asNative(),
  );

  @override
  FilePathList LoadDirectoryFiles(
    XPtr<XChar> dirPath,
  ) => FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDirectoryFiles,
    (p) => _ffi.LoadDirectoryFiles(
      dirPath.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  FilePathList LoadDirectoryFilesEx(
    XPtr<XChar> basePath,
    XPtr<XChar> filter,
    bool scanSubdirs,
  ) => FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDirectoryFilesEx,
    (p) => _ffi.LoadDirectoryFilesEx(
      basePath.asNative(),
      filter.asNative(),
      scanSubdirs,
    ).toDart(p.asNative()),
  );

  @override
  void UnloadDirectoryFiles(
    FilePathList files,
  ) => disposeStructWithOpFreed(files, (ptr) {
    _ffi.UnloadDirectoryFiles(
      ptr.asNative<FilePathListC>().ref,
    );
  });

  @override
  bool IsFileDropped() => _ffi.IsFileDropped();

  @override
  FilePathList LoadDroppedFiles() => FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDroppedFiles,
    (p) => _ffi.LoadDroppedFiles().toDart(p.asNative()),
  );

  @override
  void UnloadDroppedFiles(
    FilePathList files,
  ) => disposeStructWithOpFreed(files, (ptr) {
    _ffi.UnloadDroppedFiles(
      ptr.asNative<FilePathListC>().ref,
    );
  });

  @override
  int GetFileModTime(
    XPtr<XChar> fileName,
  ) => _ffi.GetFileModTime(
    fileName.asNative(),
  );

  @override
  XNativePtr<XUnsignedChar> CompressData(
    XPtr<XUnsignedChar> data,
    int dataSize,
    XPtr<XInt> compDataSize,
  ) => _ffi.CompressData(
    data.asNative(),
    dataSize,
    compDataSize.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XUnsignedChar> DecompressData(
    XPtr<XUnsignedChar> compData,
    int compDataSize,
    XPtr<XInt> dataSize,
  ) => _ffi.DecompressData(
    compData.asNative(),
    compDataSize,
    dataSize.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> EncodeDataBase64(
    XPtr<XUnsignedChar> data,
    int dataSize,
    XPtr<XInt> outputSize,
  ) => _ffi.EncodeDataBase64(
    data.asNative(),
    dataSize,
    outputSize.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XUnsignedChar> DecodeDataBase64(
    XPtr<XChar> data,
    XPtr<XInt> outputSize,
  ) => _ffi.DecodeDataBase64(
    data.asNative(),
    outputSize.asNative(),
  ).asXPtr();

  @override
  int ComputeCRC32(
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => _ffi.ComputeCRC32(
    data.asNative(),
    dataSize,
  );

  @override
  XNativePtr<XUnsignedInt> ComputeMD5(
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => _ffi.ComputeMD5(
    data.asNative(),
    dataSize,
  ).asXPtr();

  @override
  XNativePtr<XUnsignedInt> ComputeSHA1(
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => _ffi.ComputeSHA1(
    data.asNative(),
    dataSize,
  ).asXPtr();

  @override
  XNativePtr<XUnsignedInt> ComputeSHA256(
    XPtr<XUnsignedChar> data,
    int dataSize,
  ) => _ffi.ComputeSHA256(
    data.asNative(),
    dataSize,
  ).asXPtr();

  @override
  AutomationEventList LoadAutomationEventList(
    XPtr<XChar> fileName,
  ) => AutomationEventList$.RefCapture(
    RaylibCaptureIds.LoadAutomationEventList,
    (p) => _ffi.LoadAutomationEventList(
      fileName.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  void UnloadAutomationEventList(
    AutomationEventList list,
  ) => disposeStructWithOpFreed(list, (ptr) {
    _ffi.UnloadAutomationEventList(
      ptr.asNative<AutomationEventListC>().ref,
    );
  });

  @override
  bool ExportAutomationEventList(
    AutomationEventList list,
    XPtr<XChar> fileName,
  ) => _ffi.ExportAutomationEventList(
    AutomationEventList$.Ref1(list).asNative<AutomationEventListC>().ref,
    fileName.asNative(),
  );

  @override
  void SetAutomationEventList(
    XStructPtr<AutomationEventList> list,
  ) => _ffi.SetAutomationEventList(
    list.asNative(),
  );

  @override
  void SetAutomationEventBaseFrame(
    int frame,
  ) => _ffi.SetAutomationEventBaseFrame(
    frame,
  );

  @override
  void StartAutomationEventRecording() => _ffi.StartAutomationEventRecording();

  @override
  void StopAutomationEventRecording() => _ffi.StopAutomationEventRecording();

  @override
  void PlayAutomationEvent(
    AutomationEvent event,
  ) => _ffi.PlayAutomationEvent(
    AutomationEvent$.Ref1(event).asNative<AutomationEventC>().ref,
  );

  @override
  bool IsKeyPressed(
    int key,
  ) => _ffi.IsKeyPressed(
    key,
  );

  @override
  bool IsKeyPressedRepeat(
    int key,
  ) => _ffi.IsKeyPressedRepeat(
    key,
  );

  @override
  bool IsKeyDown(
    int key,
  ) => _ffi.IsKeyDown(
    key,
  );

  @override
  bool IsKeyReleased(
    int key,
  ) => _ffi.IsKeyReleased(
    key,
  );

  @override
  bool IsKeyUp(
    int key,
  ) => _ffi.IsKeyUp(
    key,
  );

  @override
  XNativePtr<XChar> GetKeyName(
    int key,
  ) => _ffi.GetKeyName(
    key,
  ).asXPtr();

  @override
  int GetKeyPressed() => _ffi.GetKeyPressed();

  @override
  int GetCharPressed() => _ffi.GetCharPressed();

  @override
  void SetExitKey(
    int key,
  ) => _ffi.SetExitKey(
    key,
  );

  @override
  bool IsGamepadAvailable(
    int gamepad,
  ) => _ffi.IsGamepadAvailable(
    gamepad,
  );

  @override
  XNativePtr<XChar> GetGamepadName(
    int gamepad,
  ) => _ffi.GetGamepadName(
    gamepad,
  ).asXPtr();

  @override
  bool IsGamepadButtonPressed(
    int gamepad,
    int button,
  ) => _ffi.IsGamepadButtonPressed(
    gamepad,
    button,
  );

  @override
  bool IsGamepadButtonDown(
    int gamepad,
    int button,
  ) => _ffi.IsGamepadButtonDown(
    gamepad,
    button,
  );

  @override
  bool IsGamepadButtonReleased(
    int gamepad,
    int button,
  ) => _ffi.IsGamepadButtonReleased(
    gamepad,
    button,
  );

  @override
  bool IsGamepadButtonUp(
    int gamepad,
    int button,
  ) => _ffi.IsGamepadButtonUp(
    gamepad,
    button,
  );

  @override
  int GetGamepadButtonPressed() => _ffi.GetGamepadButtonPressed();

  @override
  int GetGamepadAxisCount(
    int gamepad,
  ) => _ffi.GetGamepadAxisCount(
    gamepad,
  );

  @override
  double GetGamepadAxisMovement(
    int gamepad,
    int axis,
  ) => _ffi.GetGamepadAxisMovement(
    gamepad,
    axis,
  );

  @override
  int SetGamepadMappings(
    XPtr<XChar> mappings,
  ) => _ffi.SetGamepadMappings(
    mappings.asNative(),
  );

  @override
  void SetGamepadVibration(
    int gamepad,
    double leftMotor,
    double rightMotor,
    double duration,
  ) => _ffi.SetGamepadVibration(
    gamepad,
    leftMotor,
    rightMotor,
    duration,
  );

  @override
  bool IsMouseButtonPressed(
    int button,
  ) => _ffi.IsMouseButtonPressed(
    button,
  );

  @override
  bool IsMouseButtonDown(
    int button,
  ) => _ffi.IsMouseButtonDown(
    button,
  );

  @override
  bool IsMouseButtonReleased(
    int button,
  ) => _ffi.IsMouseButtonReleased(
    button,
  );

  @override
  bool IsMouseButtonUp(
    int button,
  ) => _ffi.IsMouseButtonUp(
    button,
  );

  @override
  int GetMouseX() => _ffi.GetMouseX();

  @override
  int GetMouseY() => _ffi.GetMouseY();

  @override
  Vector2 GetMousePosition() => Vector2$.Extract(
    (p) => _ffi.GetMousePosition().toDart(p.asNative()),
  );

  @override
  Vector2 GetMouseDelta() => Vector2$.Extract(
    (p) => _ffi.GetMouseDelta().toDart(p.asNative()),
  );

  @override
  void SetMousePosition(
    int x,
    int y,
  ) => _ffi.SetMousePosition(
    x,
    y,
  );

  @override
  void SetMouseOffset(
    int offsetX,
    int offsetY,
  ) => _ffi.SetMouseOffset(
    offsetX,
    offsetY,
  );

  @override
  void SetMouseScale(
    double scaleX,
    double scaleY,
  ) => _ffi.SetMouseScale(
    scaleX,
    scaleY,
  );

  @override
  double GetMouseWheelMove() => _ffi.GetMouseWheelMove();

  @override
  Vector2 GetMouseWheelMoveV() => Vector2$.Extract(
    (p) => _ffi.GetMouseWheelMoveV().toDart(p.asNative()),
  );

  @override
  void SetMouseCursor(
    int cursor,
  ) => _ffi.SetMouseCursor(
    cursor,
  );

  @override
  int GetTouchX() => _ffi.GetTouchX();

  @override
  int GetTouchY() => _ffi.GetTouchY();

  @override
  Vector2 GetTouchPosition(
    int index,
  ) => Vector2$.Extract(
    (p) => _ffi.GetTouchPosition(
      index,
    ).toDart(p.asNative()),
  );

  @override
  int GetTouchPointId(
    int index,
  ) => _ffi.GetTouchPointId(
    index,
  );

  @override
  int GetTouchPointCount() => _ffi.GetTouchPointCount();

  @override
  void SetGesturesEnabled(
    int flags,
  ) => _ffi.SetGesturesEnabled(
    flags,
  );

  @override
  bool IsGestureDetected(
    int gesture,
  ) => _ffi.IsGestureDetected(
    gesture,
  );

  @override
  int GetGestureDetected() => _ffi.GetGestureDetected();

  @override
  double GetGestureHoldDuration() => _ffi.GetGestureHoldDuration();

  @override
  Vector2 GetGestureDragVector() => Vector2$.Extract(
    (p) => _ffi.GetGestureDragVector().toDart(p.asNative()),
  );

  @override
  double GetGestureDragAngle() => _ffi.GetGestureDragAngle();

  @override
  Vector2 GetGesturePinchVector() => Vector2$.Extract(
    (p) => _ffi.GetGesturePinchVector().toDart(p.asNative()),
  );

  @override
  double GetGesturePinchAngle() => _ffi.GetGesturePinchAngle();

  @override
  void ProcessGestureEvent(
    GestureEvent event,
  ) => _ffi.ProcessGestureEvent(
    GestureEvent$.Ref1(event).asNative<GestureEventC>().ref,
  );

  @override
  void UpdateGestures() => _ffi.UpdateGestures();

  @override
  void UpdateCamera(
    XStructPtr<Camera3D> camera,
    int mode,
  ) => _ffi.UpdateCamera(
    camera.asNative(),
    mode,
  );

  @override
  void UpdateCameraPro(
    XStructPtr<Camera3D> camera,
    Vector3 movement,
    Vector3 rotation,
    double zoom,
  ) => _ffi.UpdateCameraPro(
    camera.asNative(),
    Vector3$.Ref1(movement).asNative<Vector3C>().ref,
    Vector3$.Ref2(rotation).asNative<Vector3C>().ref,
    zoom,
  );

  @override
  void SetShapesTexture(
    Texture texture,
    Rectangle source,
  ) => _ffi.SetShapesTexture(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    Rectangle$.Ref1(source).asNative<RectangleC>().ref,
  );

  @override
  Texture GetShapesTexture() => Texture$.Extract(
    (p) => _ffi.GetShapesTexture().toDart(p.asNative()),
  );

  @override
  Rectangle GetShapesTextureRectangle() => Rectangle$.Extract(
    (p) => _ffi.GetShapesTextureRectangle().toDart(p.asNative()),
  );

  @override
  void DrawPixel(
    int posX,
    int posY,
    Color color,
  ) => _ffi.DrawPixel(
    posX,
    posY,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawPixelV(
    Vector2 position,
    Color color,
  ) => _ffi.DrawPixelV(
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawLine(
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    Color color,
  ) => _ffi.DrawLine(
    startPosX,
    startPosY,
    endPosX,
    endPosY,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawLineV(
    Vector2 startPos,
    Vector2 endPos,
    Color color,
  ) => _ffi.DrawLineV(
    Vector2$.Ref1(startPos).asNative<Vector2C>().ref,
    Vector2$.Ref2(endPos).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawLineEx(
    Vector2 startPos,
    Vector2 endPos,
    double thick,
    Color color,
  ) => _ffi.DrawLineEx(
    Vector2$.Ref1(startPos).asNative<Vector2C>().ref,
    Vector2$.Ref2(endPos).asNative<Vector2C>().ref,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawLineStrip(
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _ffi.DrawLineStrip(
    points.asNative(),
    pointCount,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawLineBezier(
    Vector2 startPos,
    Vector2 endPos,
    double thick,
    Color color,
  ) => _ffi.DrawLineBezier(
    Vector2$.Ref1(startPos).asNative<Vector2C>().ref,
    Vector2$.Ref2(endPos).asNative<Vector2C>().ref,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawLineDashed(
    Vector2 startPos,
    Vector2 endPos,
    int dashSize,
    int spaceSize,
    Color color,
  ) => _ffi.DrawLineDashed(
    Vector2$.Ref1(startPos).asNative<Vector2C>().ref,
    Vector2$.Ref2(endPos).asNative<Vector2C>().ref,
    dashSize,
    spaceSize,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCircle(
    int centerX,
    int centerY,
    double radius,
    Color color,
  ) => _ffi.DrawCircle(
    centerX,
    centerY,
    radius,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCircleSector(
    Vector2 center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) => _ffi.DrawCircleSector(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radius,
    startAngle,
    endAngle,
    segments,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCircleSectorLines(
    Vector2 center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    Color color,
  ) => _ffi.DrawCircleSectorLines(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radius,
    startAngle,
    endAngle,
    segments,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCircleGradient(
    Vector2 center,
    double radius,
    Color inner,
    Color outer,
  ) => _ffi.DrawCircleGradient(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radius,
    Color$.Ref1(inner).asNative<ColorC>().ref,
    Color$.Ref2(outer).asNative<ColorC>().ref,
  );

  @override
  void DrawCircleV(
    Vector2 center,
    double radius,
    Color color,
  ) => _ffi.DrawCircleV(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radius,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCircleLines(
    int centerX,
    int centerY,
    double radius,
    Color color,
  ) => _ffi.DrawCircleLines(
    centerX,
    centerY,
    radius,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCircleLinesV(
    Vector2 center,
    double radius,
    Color color,
  ) => _ffi.DrawCircleLinesV(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radius,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawEllipse(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    Color color,
  ) => _ffi.DrawEllipse(
    centerX,
    centerY,
    radiusH,
    radiusV,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawEllipseV(
    Vector2 center,
    double radiusH,
    double radiusV,
    Color color,
  ) => _ffi.DrawEllipseV(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radiusH,
    radiusV,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawEllipseLines(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    Color color,
  ) => _ffi.DrawEllipseLines(
    centerX,
    centerY,
    radiusH,
    radiusV,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawEllipseLinesV(
    Vector2 center,
    double radiusH,
    double radiusV,
    Color color,
  ) => _ffi.DrawEllipseLinesV(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radiusH,
    radiusV,
    Color$.Ref1(color).asNative<ColorC>().ref,
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
  ) => _ffi.DrawRing(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    innerRadius,
    outerRadius,
    startAngle,
    endAngle,
    segments,
    Color$.Ref1(color).asNative<ColorC>().ref,
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
  ) => _ffi.DrawRingLines(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    innerRadius,
    outerRadius,
    startAngle,
    endAngle,
    segments,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangle(
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  ) => _ffi.DrawRectangle(
    posX,
    posY,
    width,
    height,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleV(
    Vector2 position,
    Vector2 size,
    Color color,
  ) => _ffi.DrawRectangleV(
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    Vector2$.Ref2(size).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleRec(
    Rectangle rec,
    Color color,
  ) => _ffi.DrawRectangleRec(
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRectanglePro(
    Rectangle rec,
    Vector2 origin,
    double rotation,
    Color color,
  ) => _ffi.DrawRectanglePro(
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    Vector2$.Ref1(origin).asNative<Vector2C>().ref,
    rotation,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleGradientV(
    int posX,
    int posY,
    int width,
    int height,
    Color top,
    Color bottom,
  ) => _ffi.DrawRectangleGradientV(
    posX,
    posY,
    width,
    height,
    Color$.Ref1(top).asNative<ColorC>().ref,
    Color$.Ref2(bottom).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleGradientH(
    int posX,
    int posY,
    int width,
    int height,
    Color left,
    Color right,
  ) => _ffi.DrawRectangleGradientH(
    posX,
    posY,
    width,
    height,
    Color$.Ref1(left).asNative<ColorC>().ref,
    Color$.Ref2(right).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleGradientEx(
    Rectangle rec,
    Color topLeft,
    Color bottomLeft,
    Color topRight,
    Color bottomRight,
  ) => _ffi.DrawRectangleGradientEx(
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    Color$.Ref1(topLeft).asNative<ColorC>().ref,
    Color$.Ref2(bottomLeft).asNative<ColorC>().ref,
    Color$.Ref3(topRight).asNative<ColorC>().ref,
    Color$.Ref4(bottomRight).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleLines(
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  ) => _ffi.DrawRectangleLines(
    posX,
    posY,
    width,
    height,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleLinesEx(
    Rectangle rec,
    double lineThick,
    Color color,
  ) => _ffi.DrawRectangleLinesEx(
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    lineThick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleRounded(
    Rectangle rec,
    double roundness,
    int segments,
    Color color,
  ) => _ffi.DrawRectangleRounded(
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    roundness,
    segments,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleRoundedLines(
    Rectangle rec,
    double roundness,
    int segments,
    Color color,
  ) => _ffi.DrawRectangleRoundedLines(
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    roundness,
    segments,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRectangleRoundedLinesEx(
    Rectangle rec,
    double roundness,
    int segments,
    double lineThick,
    Color color,
  ) => _ffi.DrawRectangleRoundedLinesEx(
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    roundness,
    segments,
    lineThick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawTriangle(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _ffi.DrawTriangle(
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    Vector2$.Ref3(v3).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawTriangleLines(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _ffi.DrawTriangleLines(
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    Vector2$.Ref3(v3).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawTriangleFan(
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _ffi.DrawTriangleFan(
    points.asNative(),
    pointCount,
    Color$.Ref1(color).asNative<ColorC>().ref
  );

  @override
  void DrawTriangleStrip(
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _ffi.DrawTriangleStrip(
    points.asNative(),
    pointCount,
    Color$.Ref1(color).asNative<ColorC>().ref
  );

  @override
  void DrawPoly(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    Color color,
  ) => _ffi.DrawPoly(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    sides,
    radius,
    rotation,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawPolyLines(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    Color color,
  ) => _ffi.DrawPolyLines(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    sides,
    radius,
    rotation,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawPolyLinesEx(
    Vector2 center,
    int sides,
    double radius,
    double rotation,
    double lineThick,
    Color color,
  ) => _ffi.DrawPolyLinesEx(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    sides,
    radius,
    rotation,
    lineThick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineLinear(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _ffi.DrawSplineLinear(
    points.asNative(),
    pointCount,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineBasis(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _ffi.DrawSplineBasis(
    points.asNative(),
    pointCount,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineCatmullRom(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _ffi.DrawSplineCatmullRom(
    points.asNative(),
    pointCount, 
    thick, 
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineBezierQuadratic(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _ffi.DrawSplineBezierQuadratic(
    points.asNative(),
    pointCount,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineBezierCubic(
    XStructPtr<Vector2> points,
    int pointCount,
    double thick,
    Color color,
  ) => _ffi.DrawSplineBezierCubic(
    points.asNative(),
    pointCount,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentLinear(
    Vector2 p1,
    Vector2 p2,
    double thick,
    Color color,
  ) => _ffi.DrawSplineSegmentLinear(
    Vector2$.Ref1(p1).asNative<Vector2C>().ref,
    Vector2$.Ref2(p2).asNative<Vector2C>().ref,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double thick,
    Color color,
  ) => _ffi.DrawSplineSegmentBasis(
    Vector2$.Ref1(p1).asNative<Vector2C>().ref,
    Vector2$.Ref2(p2).asNative<Vector2C>().ref,
    Vector2$.Ref3(p3).asNative<Vector2C>().ref,
    Vector2$.Ref4(p4).asNative<Vector2C>().ref,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double thick,
    Color color,
  ) => _ffi.DrawSplineSegmentCatmullRom(
    Vector2$.Ref1(p1).asNative<Vector2C>().ref,
    Vector2$.Ref2(p2).asNative<Vector2C>().ref,
    Vector2$.Ref3(p3).asNative<Vector2C>().ref,
    Vector2$.Ref4(p4).asNative<Vector2C>().ref,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentBezierQuadratic(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    double thick,
    Color color,
  ) => _ffi.DrawSplineSegmentBezierQuadratic(
    Vector2$.Ref1(p1).asNative<Vector2C>().ref,
    Vector2$.Ref2(c2).asNative<Vector2C>().ref,
    Vector2$.Ref3(p3).asNative<Vector2C>().ref,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    double thick,
    Color color,
  ) => _ffi.DrawSplineSegmentBezierCubic(
    Vector2$.Ref1(p1).asNative<Vector2C>().ref,
    Vector2$.Ref2(c2).asNative<Vector2C>().ref,
    Vector2$.Ref3(c3).asNative<Vector2C>().ref,
    Vector2$.Ref4(p4).asNative<Vector2C>().ref,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  Vector2 GetSplinePointLinear(
    Vector2 startPos,
    Vector2 endPos,
    double t,
  ) => Vector2$.Extract(
    (p) => _ffi.GetSplinePointLinear(
      Vector2$.Ref1(startPos).asNative<Vector2C>().ref,
      Vector2$.Ref2(endPos).asNative<Vector2C>().ref,
      t,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 GetSplinePointBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double t,
  ) => Vector2$.Extract(
    (p) => _ffi.GetSplinePointBasis(
      Vector2$.Ref1(p1).asNative<Vector2C>().ref,
      Vector2$.Ref2(p2).asNative<Vector2C>().ref,
      Vector2$.Ref3(p3).asNative<Vector2C>().ref,
      Vector2$.Ref4(p4).asNative<Vector2C>().ref,
      t,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 GetSplinePointCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    double t,
  ) => Vector2$.Extract(
    (p) => _ffi.GetSplinePointCatmullRom(
      Vector2$.Ref1(p1).asNative<Vector2C>().ref,
      Vector2$.Ref2(p2).asNative<Vector2C>().ref,
      Vector2$.Ref3(p3).asNative<Vector2C>().ref,
      Vector2$.Ref4(p4).asNative<Vector2C>().ref,
      t,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 GetSplinePointBezierQuad(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    double t,
  ) => Vector2$.Extract(
    (p) => _ffi.GetSplinePointBezierQuad(
      Vector2$.Ref1(p1).asNative<Vector2C>().ref,
      Vector2$.Ref2(c2).asNative<Vector2C>().ref,
      Vector2$.Ref3(p3).asNative<Vector2C>().ref,
      t,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 GetSplinePointBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    double t,
  ) => Vector2$.Extract(
    (p) => _ffi.GetSplinePointBezierCubic(
      Vector2$.Ref1(p1).asNative<Vector2C>().ref,
      Vector2$.Ref2(c2).asNative<Vector2C>().ref,
      Vector2$.Ref3(c3).asNative<Vector2C>().ref,
      Vector2$.Ref4(p4).asNative<Vector2C>().ref,
      t,
    ).toDart(p.asNative()),
  );

  @override
  bool CheckCollisionRecs(
    Rectangle rec1,
    Rectangle rec2,
  ) => _ffi.CheckCollisionRecs(
    Rectangle$.Ref1(rec1).asNative<RectangleC>().ref,
    Rectangle$.Ref2(rec2).asNative<RectangleC>().ref,
  );

  @override
  bool CheckCollisionCircles(
    Vector2 center1,
    double radius1,
    Vector2 center2,
    double radius2,
  ) => _ffi.CheckCollisionCircles(
    Vector2$.Ref1(center1).asNative<Vector2C>().ref,
    radius1,
    Vector2$.Ref2(center2).asNative<Vector2C>().ref,
    radius2,
  );

  @override
  bool CheckCollisionCircleRec(
    Vector2 center,
    double radius,
    Rectangle rec,
  ) => _ffi.CheckCollisionCircleRec(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radius,
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
  );

  @override
  bool CheckCollisionCircleLine(
    Vector2 center,
    double radius,
    Vector2 p1,
    Vector2 p2,
  ) => _ffi.CheckCollisionCircleLine(
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radius,
    Vector2$.Ref2(p1).asNative<Vector2C>().ref,
    Vector2$.Ref3(p2).asNative<Vector2C>().ref,
  );

  @override
  bool CheckCollisionPointRec(
    Vector2 point,
    Rectangle rec,
  ) => _ffi.CheckCollisionPointRec(
    Vector2$.Ref1(point).asNative<Vector2C>().ref,
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
  );

  @override
  bool CheckCollisionPointCircle(
    Vector2 point,
    Vector2 center,
    double radius,
  ) => _ffi.CheckCollisionPointCircle(
    Vector2$.Ref1(point).asNative<Vector2C>().ref,
    Vector2$.Ref2(center).asNative<Vector2C>().ref,
    radius,
  );

  @override
  bool CheckCollisionPointTriangle(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
  ) => _ffi.CheckCollisionPointTriangle(
    Vector2$.Ref1(point).asNative<Vector2C>().ref,
    Vector2$.Ref2(p1).asNative<Vector2C>().ref,
    Vector2$.Ref3(p2).asNative<Vector2C>().ref,
    Vector2$.Ref4(p3).asNative<Vector2C>().ref,
  );

  @override
  bool CheckCollisionPointLine(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    int threshold,
  ) => _ffi.CheckCollisionPointLine(
    Vector2$.Ref1(point).asNative<Vector2C>().ref,
    Vector2$.Ref2(p1).asNative<Vector2C>().ref,
    Vector2$.Ref3(p2).asNative<Vector2C>().ref,
    threshold,
  );

  @override
  bool CheckCollisionPointPoly(
    Vector2 point,
    XStructPtr<Vector2> points,
    int pointCount,
  ) => _ffi.CheckCollisionPointPoly(
    Vector2$.Ref1(point).asNative<Vector2C>().ref,
    points.asNative(),
    pointCount,
  );

  @override
  bool CheckCollisionLines(
    Vector2 startPos1,
    Vector2 endPos1,
    Vector2 startPos2,
    Vector2 endPos2,
    XStructPtr<Vector2> collisionPoint,
  ) => _ffi.CheckCollisionLines(
    Vector2$.Ref1(startPos1).asNative<Vector2C>().ref,
    Vector2$.Ref2(endPos1).asNative<Vector2C>().ref,
    Vector2$.Ref3(startPos2).asNative<Vector2C>().ref,
    Vector2$.Ref4(endPos2).asNative<Vector2C>().ref,
    collisionPoint.asNative(),
  );

  @override
  Rectangle GetCollisionRec(
    Rectangle rec1,
    Rectangle rec2,
  ) => Rectangle$.Extract(
    (p) => _ffi.GetCollisionRec(
      Rectangle$.Ref1(rec1).asNative<RectangleC>().ref,
      Rectangle$.Ref2(rec2).asNative<RectangleC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Image LoadImage(
    XPtr<XChar> fileName,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImage,
    (p) => _ffi.LoadImage(
      fileName.asNative(),
    ).toDart(p.asNative()),
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
    (p) => _ffi.LoadImageRaw(
      fileName.asNative(),
      width,
      height,
      format,
      headerSize,
    ).toDart(p.asNative()),
  );

  @override
  Image LoadImageAnim(
    XPtr<XChar> fileName,
    XPtr<XInt> frames,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImageAnim,
    (p) => _ffi.LoadImageAnim(
      fileName.asNative(),
      frames.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  Image LoadImageAnimFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
    XPtr<XInt> frames,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImageAnimFromMemory,
    (p) => _ffi.LoadImageAnimFromMemory(
      fileType.asNative(),
      fileData.asNative(),
      dataSize,
      frames.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  Image LoadImageFromMemory(
    XPtr<XChar> fileType,
    XPtr<XUnsignedChar> fileData,
    int dataSize,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromMemory,
    (p) => _ffi.LoadImageFromMemory(
      fileType.asNative(),
      fileData.asNative(),
      dataSize,
    ).toDart(p.asNative()),
  );

  @override
  Image LoadImageFromTexture(
    Texture texture,
  ) => Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromTexture,
    (p) => _ffi.LoadImageFromTexture(
      Texture$.Ref1(texture).asNative<TextureC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Image LoadImageFromScreen() => Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromScreen,
    (p) => _ffi.LoadImageFromScreen().toDart(p.asNative()),
  );

  @override
  bool IsImageValid(
    Image image,
  ) => _ffi.IsImageValid(
    Image$.Ref1(image).asNative<ImageC>().ref,
  );

  @override
  void UnloadImage(
    Image image,
  ) => _ffi.UnloadImage(
    Image$.Ref1(image).asNative<ImageC>().ref,
  );

  @override
  bool ExportImage(
    Image image,
    XPtr<XChar> fileName,
  ) => _ffi.ExportImage(
    Image$.Ref1(image).asNative<ImageC>().ref,
    fileName.asNative(),
  );

  @override
  XNativePtr<XUnsignedChar> ExportImageToMemory(
    Image image,
    XPtr<XChar> fileType,
    XPtr<XInt> fileSize,
  ) => _ffi.ExportImageToMemory(
    Image$.Ref1(image).asNative<ImageC>().ref,
    fileType.asNative(),
    fileSize.asNative(),
  ).asXPtr();

  @override
  bool ExportImageAsCode(
    Image image,
    XPtr<XChar> fileName,
  ) => _ffi.ExportImageAsCode(
    Image$.Ref1(image).asNative<ImageC>().ref,
    fileName.asNative(),
  );

  @override
  Image GenImageColor(
    int width,
    int height,
    Color color,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageColor,
    (p) => _ffi.GenImageColor(
      width,
      height,
      Color$.Ref1(color).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
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
    (p) => _ffi.GenImageGradientLinear(
      width,
      height,
      direction,
      Color$.Ref1(start).asNative<ColorC>().ref,
      Color$.Ref2(end).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
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
    (p) => _ffi.GenImageGradientRadial(
      width,
      height,
      density,
      Color$.Ref1(inner).asNative<ColorC>().ref,
      Color$.Ref2(outer).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
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
    (p) => _ffi.GenImageGradientSquare(
      width,
      height,
      density,
      Color$.Ref1(inner).asNative<ColorC>().ref,
      Color$.Ref2(outer).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
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
    (p) => _ffi.GenImageChecked(
      width,
      height,
      checksX,
      checksY,
      Color$.Ref1(col1).asNative<ColorC>().ref,
      Color$.Ref2(col2).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Image GenImageWhiteNoise(
    int width,
    int height,
    double factor,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageWhiteNoise,
    (p) => _ffi.GenImageWhiteNoise(
      width,
      height,
      factor,
    ).toDart(p.asNative()),
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
    (p) => _ffi.GenImagePerlinNoise(
      width,
      height,
      offsetX,
      offsetY,
      scale,
    ).toDart(p.asNative()),
  );

  @override
  Image GenImageCellular(
    int width,
    int height,
    int tileSize,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageCellular,
    (p) => _ffi.GenImageCellular(
      width,
      height,
      tileSize,
    ).toDart(p.asNative()),
  );

  @override
  Image GenImageText(
    int width,
    int height,
    XPtr<XChar> text,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageText,
    (p) => _ffi.GenImageText(
      width,
      height,
      text.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  Image ImageCopy(
    Image image,
  ) => Image$.RefCapture(
    RaylibCaptureIds.ImageCopy,
    (p) => _ffi.ImageCopy(
      Image$.Ref1(image).asNative<ImageC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Image ImageFromImage(
    Image image,
    Rectangle rec,
  ) => Image$.RefCapture(
    RaylibCaptureIds.ImageFromImage,
    (p) => _ffi.ImageFromImage(
      Image$.Ref1(image).asNative<ImageC>().ref,
      Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Image ImageFromChannel(
    Image image,
    int selectedChannel,
  ) => Image$.RefCapture(
    RaylibCaptureIds.ImageFromChannel,
    (p) => _ffi.ImageFromChannel(
      Image$.Ref1(image).asNative<ImageC>().ref,
      selectedChannel,
    ).toDart(p.asNative()),
  );

  @override
  Image ImageText(
    XPtr<XChar> text,
    int fontSize,
    Color color,
  ) => Image$.RefCapture(
    RaylibCaptureIds.ImageText,
    (p) => _ffi.ImageText(
      text.asNative(),
      fontSize,
      Color$.Ref1(color).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
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
    (p) => _ffi.ImageTextEx(
      Font$.Ref1(font).asNative<FontC>().ref,
      text.asNative(),
      fontSize,
      spacing,
      Color$.Ref1(tint).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  void ImageFormat(
    XStructPtr<Image> image,
    int newFormat,
  ) => _ffi.ImageFormat(
    image.asNative(),
    newFormat,
  );

  @override
  void ImageToPOT(
    XStructPtr<Image> image,
    Color fill,
  ) => _ffi.ImageToPOT(
    image.asNative(),
    Color$.Ref1(fill).asNative<ColorC>().ref,
  );

  @override
  void ImageCrop(
    XStructPtr<Image> image,
    Rectangle crop,
  ) => _ffi.ImageCrop(
    image.asNative(),
    Rectangle$.Ref1(crop).asNative<RectangleC>().ref,
  );

  @override
  void ImageAlphaCrop(
    XStructPtr<Image> image,
    double threshold,
  ) => _ffi.ImageAlphaCrop(
    image.asNative(),
    threshold,
  );

  @override
  void ImageAlphaClear(
    XStructPtr<Image> image,
    Color color,
    double threshold,
  ) => _ffi.ImageAlphaClear(
    image.asNative(),
    Color$.Ref1(color).asNative<ColorC>().ref,
    threshold,
  );

  @override
  void ImageAlphaMask(
    XStructPtr<Image> image,
    Image alphaMask,
  ) => _ffi.ImageAlphaMask(
    image.asNative(),
    Image$.Ref2(alphaMask).asNative<ImageC>().ref,
  );

  @override
  void ImageAlphaPremultiply(
    XStructPtr<Image> image,
  ) => _ffi.ImageAlphaPremultiply(
    image.asNative(),
  );

  @override
  void ImageBlurGaussian(
    XStructPtr<Image> image,
    int blurSize,
  ) => _ffi.ImageBlurGaussian(
    image.asNative(),
    blurSize,
  );

  @override
  void ImageKernelConvolution(
    XStructPtr<Image> image,
    XPtr<XFloat> kernel,
    int kernelSize,
  ) => _ffi.ImageKernelConvolution(
    image.asNative(),
    kernel.asNative(),
    kernelSize,
  );

  @override
  void ImageResize(
    XStructPtr<Image> image,
    int newWidth,
    int newHeight,
  ) => _ffi.ImageResize(
    image.asNative(),
    newWidth,
    newHeight,
  );

  @override
  void ImageResizeNN(
    XStructPtr<Image> image,
    int newWidth,
    int newHeight,
  ) => _ffi.ImageResizeNN(
    image.asNative(),
    newWidth,
    newHeight,
  );

  @override
  void ImageResizeCanvas(
    XStructPtr<Image> image,
    int newWidth,
    int newHeight,
    int offsetX,
    int offsetY,
    Color fill,
  ) => _ffi.ImageResizeCanvas(
    image.asNative(),
    newWidth,
    newHeight,
    offsetX,
    offsetY,
    Color$.Ref1(fill).asNative<ColorC>().ref,
  );

  @override
  void ImageMipmaps(
    XStructPtr<Image> image,
  ) => _ffi.ImageMipmaps(
    image.asNative(),
  );

  @override
  void ImageDither(
    XStructPtr<Image> image,
    int rBpp,
    int gBpp,
    int bBpp,
    int aBpp,
  ) => _ffi.ImageDither(
    image.asNative(),
    rBpp,
    gBpp,
    bBpp,
    aBpp,
  );

  @override
  void ImageFlipVertical(
    XStructPtr<Image> image,
  ) => _ffi.ImageFlipVertical(
    image.asNative(),
  );

  @override
  void ImageFlipHorizontal(
    XStructPtr<Image> image,
  ) => _ffi.ImageFlipHorizontal(
    image.asNative(),
  );

  @override
  void ImageRotate(
    XStructPtr<Image> image,
    int degrees,
  ) => _ffi.ImageRotate(
    image.asNative(),
    degrees,
  );

  @override
  void ImageRotateCW(
    XStructPtr<Image> image,
  ) => _ffi.ImageRotateCW(
    image.asNative(),
  );

  @override
  void ImageRotateCCW(
    XStructPtr<Image> image,
  ) => _ffi.ImageRotateCCW(
    image.asNative(),
  );

  @override
  void ImageColorTint(
    XStructPtr<Image> image,
    Color color,
  ) => _ffi.ImageColorTint(
    image.asNative(),
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageColorInvert(
    XStructPtr<Image> image,
  ) => _ffi.ImageColorInvert(
    image.asNative(),
  );

  @override
  void ImageColorGrayscale(
    XStructPtr<Image> image,
  ) => _ffi.ImageColorGrayscale(
    image.asNative(),
  );

  @override
  void ImageColorContrast(
    XStructPtr<Image> image,
    double contrast,
  ) => _ffi.ImageColorContrast(
    image.asNative(),
    contrast,
  );

  @override
  void ImageColorBrightness(
    XStructPtr<Image> image,
    int brightness,
  ) => _ffi.ImageColorBrightness(
    image.asNative(),
    brightness,
  );

  @override
  void ImageColorReplace(
    XStructPtr<Image> image,
    Color color,
    Color replace,
  ) => _ffi.ImageColorReplace(
    image.asNative(),
    Color$.Ref1(color).asNative<ColorC>().ref,
    Color$.Ref2(replace).asNative<ColorC>().ref,
  );

  @override
  XStructPtr<Color> LoadImageColors(
    Image image,
  ) => Color.struct.ptr(_ffi.LoadImageColors(
    Image$.Ref1(image).asNative<ImageC>().ref,
  ).asXPtr());

  @override
  XStructPtr<Color> LoadImagePalette(
    Image image,
    int maxPaletteSize,
    XPtr<XInt> colorCount,
  ) => Color.struct.ptr(_ffi.LoadImagePalette(
    Image$.Ref1(image).asNative<ImageC>().ref,
    maxPaletteSize,
    colorCount.asNative(),
  ).asXPtr());

  @override
  void UnloadImageColors(
    XStructPtr<Color> colors,
  ) => _ffi.UnloadImageColors(
    colors.asNative(),
  );

  @override
  void UnloadImagePalette(
    XStructPtr<Color> colors,
  ) => _ffi.UnloadImagePalette(
    colors.asNative(),
  );

  @override
  Rectangle GetImageAlphaBorder(
    Image image,
    double threshold,
  ) => Rectangle$.Extract(
    (p) => _ffi.GetImageAlphaBorder(
      Image$.Ref1(image).asNative<ImageC>().ref,
      threshold,
    ).toDart(p.asNative()),
  );

  @override
  Color GetImageColor(
    Image image,
    int x,
    int y,
  ) => Color$.Extract(
    (p) => _ffi.GetImageColor(
      Image$.Ref1(image).asNative<ImageC>().ref,
      x,
      y,
    ).toDart(p.asNative()),
  );

  @override
  void ImageClearBackground(
    XStructPtr<Image> dst,
    Color color,
  ) => _ffi.ImageClearBackground(
    dst.asNative(),
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawPixel(
    XStructPtr<Image> dst,
    int posX,
    int posY,
    Color color,
  ) => _ffi.ImageDrawPixel(
    dst.asNative(),
    posX,
    posY,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawPixelV(
    XStructPtr<Image> dst,
    Vector2 position,
    Color color,
  ) => _ffi.ImageDrawPixelV(
    dst.asNative(),
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawLine(
    XStructPtr<Image> dst,
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    Color color,
  ) => _ffi.ImageDrawLine(
    dst.asNative(),
    startPosX,
    startPosY,
    endPosX,
    endPosY,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawLineV(
    XStructPtr<Image> dst,
    Vector2 start,
    Vector2 end,
    Color color,
  ) => _ffi.ImageDrawLineV(
    dst.asNative(),
    Vector2$.Ref1(start).asNative<Vector2C>().ref,
    Vector2$.Ref2(end).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawLineEx(
    XStructPtr<Image> dst,
    Vector2 start,
    Vector2 end,
    int thick,
    Color color,
  ) => _ffi.ImageDrawLineEx(
    dst.asNative(),
    Vector2$.Ref1(start).asNative<Vector2C>().ref,
    Vector2$.Ref2(end).asNative<Vector2C>().ref,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawCircle(
    XStructPtr<Image> dst,
    int centerX,
    int centerY,
    int radius,
    Color color,
  ) => _ffi.ImageDrawCircle(
    dst.asNative(),
    centerX,
    centerY,
    radius,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawCircleV(
    XStructPtr<Image> dst,
    Vector2 center,
    int radius,
    Color color,
  ) => _ffi.ImageDrawCircleV(
    dst.asNative(),
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radius,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawCircleLines(
    XStructPtr<Image> dst,
    int centerX,
    int centerY,
    int radius,
    Color color,
  ) => _ffi.ImageDrawCircleLines(
    dst.asNative(),
    centerX,
    centerY,
    radius,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawCircleLinesV(
    XStructPtr<Image> dst,
    Vector2 center,
    int radius,
    Color color,
  ) => _ffi.ImageDrawCircleLinesV(
    dst.asNative(),
    Vector2$.Ref1(center).asNative<Vector2C>().ref,
    radius,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawRectangle(
    XStructPtr<Image> dst,
    int posX,
    int posY,
    int width,
    int height,
    Color color,
  ) => _ffi.ImageDrawRectangle(
    dst.asNative(),
    posX,
    posY,
    width,
    height,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawRectangleV(
    XStructPtr<Image> dst,
    Vector2 position,
    Vector2 size,
    Color color,
  ) => _ffi.ImageDrawRectangleV(
    dst.asNative(),
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    Vector2$.Ref2(size).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawRectangleRec(
    XStructPtr<Image> dst,
    Rectangle rec,
    Color color,
  ) => _ffi.ImageDrawRectangleRec(
    dst.asNative(),
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawRectangleLines(
    XStructPtr<Image> dst,
    Rectangle rec,
    int thick,
    Color color,
  ) => _ffi.ImageDrawRectangleLines(
    dst.asNative(),
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    thick,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawTriangle(
    XStructPtr<Image> dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _ffi.ImageDrawTriangle(
    dst.asNative(),
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    Vector2$.Ref3(v3).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
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
  ) => _ffi.ImageDrawTriangleEx(
    dst.asNative(),
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    Vector2$.Ref3(v3).asNative<Vector2C>().ref,
    Color$.Ref1(c1).asNative<ColorC>().ref,
    Color$.Ref2(c2).asNative<ColorC>().ref,
    Color$.Ref3(c3).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleLines(
    XStructPtr<Image> dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => _ffi.ImageDrawTriangleLines(
    dst.asNative(),
    Vector2$.Ref1(v1).asNative<Vector2C>().ref,
    Vector2$.Ref2(v2).asNative<Vector2C>().ref,
    Vector2$.Ref3(v3).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleFan(
    XStructPtr<Image> dst,
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _ffi.ImageDrawTriangleFan(
    dst.asNative(),
    points.asNative(),
    pointCount,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleStrip(
    XStructPtr<Image> dst,
    XStructPtr<Vector2> points,
    int pointCount,
    Color color,
  ) => _ffi.ImageDrawTriangleStrip(
    dst.asNative(),
    points.asNative(),
    pointCount,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void ImageDraw(
    XStructPtr<Image> dst,
    Image src,
    Rectangle srcRec,
    Rectangle dstRec,
    Color tint,
  ) => _ffi.ImageDraw(
    dst.asNative(),
    Image$.Ref2(src).asNative<ImageC>().ref,
    Rectangle$.Ref1(srcRec).asNative<RectangleC>().ref,
    Rectangle$.Ref2(dstRec).asNative<RectangleC>().ref,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void ImageDrawText(
    XStructPtr<Image> dst,
    XPtr<XChar> text,
    int posX,
    int posY,
    int fontSize,
    Color color,
  ) => _ffi.ImageDrawText(
    dst.asNative(),
    text.asNative(),
    posX,
    posY,
    fontSize,
    Color$.Ref1(color).asNative<ColorC>().ref,
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
  ) => _ffi.ImageDrawTextEx(
    dst.asNative(),
    Font$.Ref1(font).asNative<FontC>().ref,
    text.asNative(),
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    fontSize,
    spacing,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  Texture LoadTexture(
    XPtr<XChar> fileName,
  ) => Texture$.RefCapture(
    RaylibCaptureIds.LoadTexture,
    (p) => _ffi.LoadTexture(
      fileName.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  Texture LoadTextureFromImage(
    Image image,
  ) => Texture$.RefCapture(
    RaylibCaptureIds.LoadTextureFromImage,
    (p) => _ffi.LoadTextureFromImage(
      Image$.Ref1(image).asNative<ImageC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Texture LoadTextureCubemap(
    Image image,
    int layout,
  ) => Texture$.RefCapture(
    RaylibCaptureIds.LoadTextureCubemap,
    (p) => _ffi.LoadTextureCubemap(
      Image$.Ref1(image).asNative<ImageC>().ref,
      layout,
    ).toDart(p.asNative()),
  );

  @override
  RenderTexture LoadRenderTexture(
    int width,
    int height,
  ) => RenderTexture$.RefCapture(
    RaylibCaptureIds.LoadRenderTexture,
    (p) => _ffi.LoadRenderTexture(
      width,
      height,
    ).toDart(p.asNative()),
  );

  @override
  bool IsTextureValid(
    Texture texture,
  ) => _ffi.IsTextureValid(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
  );

  @override
  void UnloadTexture(
    Texture texture,
  ) => _ffi.UnloadTexture(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
  );

  @override
  bool IsRenderTextureValid(
    RenderTexture target,
  ) => _ffi.IsRenderTextureValid(
    RenderTexture$.Ref1(target).asNative<RenderTextureC>().ref,
  );

  @override
  void UnloadRenderTexture(
    RenderTexture target,
  ) => _ffi.UnloadRenderTexture(
    RenderTexture$.Ref1(target).asNative<RenderTextureC>().ref,
  );

  @override
  void UpdateTexture(
    Texture texture,
    XPtr<XVoid> pixels,
  ) => _ffi.UpdateTexture(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    pixels.asNative(),
  );

  @override
  void UpdateTextureRec(
    Texture texture,
    Rectangle rec,
    XPtr<XVoid> pixels,
  ) => _ffi.UpdateTextureRec(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    Rectangle$.Ref1(rec).asNative<RectangleC>().ref,
    pixels.asNative(),
  );

  @override
  void GenTextureMipmaps(
    XStructPtr<Texture> texture,
  ) => _ffi.GenTextureMipmaps(
    texture.asNative(),
  );

  @override
  void SetTextureFilter(
    Texture texture,
    int filter,
  ) => _ffi.SetTextureFilter(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    filter,
  );

  @override
  void SetTextureWrap(
    Texture texture,
    int wrap,
  ) => _ffi.SetTextureWrap(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    wrap,
  );

  @override
  void DrawTexture(
    Texture texture,
    int posX,
    int posY,
    Color tint,
  ) => _ffi.DrawTexture(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    posX,
    posY,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawTextureV(
    Texture texture,
    Vector2 position,
    Color tint,
  ) => _ffi.DrawTextureV(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawTextureEx(
    Texture texture,
    Vector2 position,
    double rotation,
    double scale,
    Color tint,
  ) => _ffi.DrawTextureEx(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    rotation,
    scale,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawTextureRec(
    Texture texture,
    Rectangle source,
    Vector2 position,
    Color tint,
  ) => _ffi.DrawTextureRec(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    Rectangle$.Ref1(source).asNative<RectangleC>().ref,
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawTexturePro(
    Texture texture,
    Rectangle source,
    Rectangle dest,
    Vector2 origin,
    double rotation,
    Color tint,
  ) => _ffi.DrawTexturePro(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    Rectangle$.Ref1(source).asNative<RectangleC>().ref,
    Rectangle$.Ref2(dest).asNative<RectangleC>().ref,
    Vector2$.Ref1(origin).asNative<Vector2C>().ref,
    rotation,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawTextureNPatch(
    Texture texture,
    NPatchInfo nPatchInfo,
    Rectangle dest,
    Vector2 origin,
    double rotation,
    Color tint,
  ) => _ffi.DrawTextureNPatch(
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    NPatchInfo$.Ref1(nPatchInfo).asNative<NPatchInfoC>().ref,
    Rectangle$.Ref1(dest).asNative<RectangleC>().ref,
    Vector2$.Ref1(origin).asNative<Vector2C>().ref,
    rotation,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  bool ColorIsEqual(
    Color col1,
    Color col2,
  ) => _ffi.ColorIsEqual(
    Color$.Ref1(col1).asNative<ColorC>().ref,
    Color$.Ref2(col2).asNative<ColorC>().ref,
  );

  @override
  Color Fade(
    Color color,
    double alpha,
  ) => Color$.Extract(
    (p) => _ffi.Fade(
      Color$.Ref1(color).asNative<ColorC>().ref,
      alpha,
    ).toDart(p.asNative()),
  );

  @override
  int ColorToInt(
    Color color,
  ) => _ffi.ColorToInt(
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  Vector4 ColorNormalize(
    Color color,
  ) => Vector4$.Extract(
    (p) => _ffi.ColorNormalize(
      Color$.Ref1(color).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Color ColorFromNormalized(
    Vector4 normalized,
  ) => Color$.Extract(
    (p) => _ffi.ColorFromNormalized(
      Vector4$.Ref1(normalized).asNative<Vector4C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Vector3 ColorToHSV(
    Color color,
  ) => Vector3$.Extract(
    (p) => _ffi.ColorToHSV(
      Color$.Ref1(color).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Color ColorFromHSV(
    double hue,
    double saturation,
    double value,
  ) => Color$.Extract(
    (p) => _ffi.ColorFromHSV(
      hue,
      saturation,
      value,
    ).toDart(p.asNative()),
  );

  @override
  Color ColorTint(
    Color color,
    Color tint,
  ) => Color$.Extract(
    (p) => _ffi.ColorTint(
      Color$.Ref1(color).asNative<ColorC>().ref,
      Color$.Ref2(tint).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Color ColorBrightness(
    Color color,
    double factor,
  ) => Color$.Extract(
    (p) => _ffi.ColorBrightness(
      Color$.Ref1(color).asNative<ColorC>().ref,
      factor,
    ).toDart(p.asNative()),
  );

  @override
  Color ColorContrast(
    Color color,
    double contrast,
  ) => Color$.Extract(
    (p) => _ffi.ColorContrast(
      Color$.Ref1(color).asNative<ColorC>().ref,
      contrast,
    ).toDart(p.asNative()),
  );

  @override
  Color ColorAlpha(
    Color color,
    double alpha,
  ) => Color$.Extract(
    (p) => _ffi.ColorAlpha(
      Color$.Ref1(color).asNative<ColorC>().ref,
      alpha,
    ).toDart(p.asNative()),
  );

  @override
  Color ColorAlphaBlend(
    Color dst,
    Color src,
    Color tint,
  ) => Color$.Extract(
    (p) => _ffi.ColorAlphaBlend(
      Color$.Ref1(dst).asNative<ColorC>().ref,
      Color$.Ref2(src).asNative<ColorC>().ref,
      Color$.Ref3(tint).asNative<ColorC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Color ColorLerp(
    Color color1,
    Color color2,
    double factor,
  ) => Color$.Extract(
    (p) => _ffi.ColorLerp(
      Color$.Ref1(color1).asNative<ColorC>().ref,
      Color$.Ref2(color2).asNative<ColorC>().ref,
      factor,
    ).toDart(p.asNative()),
  );

  @override
  Color GetColor(
    int hexValue,
  ) => Color$.Extract(
    (p) => _ffi.GetColor(
      hexValue,
    ).toDart(p.asNative()),
  );

  @override
  Color GetPixelColor(
    XPtr<XVoid> srcPtr,
    int format,
  ) => Color$.Extract(
    (p) => _ffi.GetPixelColor(
      srcPtr.asNative(),
      format,
    ).toDart(p.asNative()),
  );

  @override
  void SetPixelColor(
    XPtr<XVoid> dstPtr,
    Color color,
    int format,
  ) => _ffi.SetPixelColor(
    dstPtr.asNative(),
    Color$.Ref1(color).asNative<ColorC>().ref,
    format,
  );

  @override
  int GetPixelDataSize(
    int width,
    int height,
    int format,
  ) => _ffi.GetPixelDataSize(
    width,
    height,
    format,
  );

  @override
  Font GetFontDefault() => Font$.RefCached(
    RaylibCaptureIds.GetFontDefault,
    (p) => _ffi.GetFontDefault().toDart(p.asNative()),
  );

  @override
  Font LoadFont(
    XPtr<XChar> fileName,
  ) => Font$.RefCapture(
    RaylibCaptureIds.LoadFont,
    (p) => _ffi.LoadFont(
      fileName.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  Font LoadFontEx(
    XPtr<XChar> fileName,
    int fontSize,
    XPtr<XInt> codepoints,
    int codepointCount,
  ) => Font$.RefCapture(
    RaylibCaptureIds.LoadFontEx,
    (p) => _ffi.LoadFontEx(
      fileName.asNative(),
      fontSize,
      codepoints.asNative(),
      codepointCount,
    ).toDart(p.asNative()),
  );

  @override
  Font LoadFontFromImage(
    Image image,
    Color key,
    int firstChar,
  ) => Font$.RefCapture(
    RaylibCaptureIds.LoadFontFromImage,
    (p) => _ffi.LoadFontFromImage(
      Image$.Ref1(image).asNative<ImageC>().ref,
      Color$.Ref1(key).asNative<ColorC>().ref,
      firstChar,
    ).toDart(p.asNative()),
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
    (p) => _ffi.LoadFontFromMemory(
      fileType.asNative(),
      fileData.asNative(),
      dataSize,
      fontSize,
      codepoints.asNative(),
      codepointCount,
    ).toDart(p.asNative()),
  );

  @override
  bool IsFontValid(
    Font font,
  ) => _ffi.IsFontValid(
    Font$.Ref1(font).asNative<FontC>().ref,
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
  ) => GlyphInfo.struct.ptr(_ffi.LoadFontData(
    fileData.asNative(),
    dataSize,
    fontSize,
    codepoints.asNative(),
    codepointCount,
    type,
    glyphCount.asNative(),
  ).asXPtr());

  @override
  Image GenImageFontAtlas(
    XStructPtr<GlyphInfo> glyphs,
    XPtr<XRawPtr<XRawStruct>> glyphRecs, // Rectangle
    int glyphCount,
    int fontSize,
    int padding,
    int packMethod,
  ) => Image$.RefCapture(
    RaylibCaptureIds.GenImageFontAtlas,
    (p) => _ffi.GenImageFontAtlas(
      glyphs.asNative(),
      glyphRecs.asNative(),
      glyphCount,
      fontSize,
      padding,
      packMethod,
    ).toDart(p.asNative()),
  );

  @override
  void UnloadFontData(
    XStructPtr<GlyphInfo> glyphs,
    int glyphCount,
  ) => _ffi.UnloadFontData(
    glyphs.asNative(),
    glyphCount,
  );

  @override
  void UnloadFont(
    Font font,
  ) => _ffi.UnloadFont(
    Font$.Ref1(font).asNative<FontC>().ref,
  );

  @override
  bool ExportFontAsCode(
    Font font,
    XPtr<XChar> fileName,
  ) => _ffi.ExportFontAsCode(
    Font$.Ref1(font).asNative<FontC>().ref,
    fileName.asNative(),
  );

  @override
  void DrawFPS(
    int posX,
    int posY,
  ) => _ffi.DrawFPS(
    posX,
    posY,
  );

  @override
  void DrawText(
    XPtr<XChar> text,
    int posX,
    int posY,
    int fontSize,
    Color color,
  ) => _ffi.DrawText(
    text.asNative(),
    posX,
    posY,
    fontSize,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawTextEx(
    Font font,
    XPtr<XChar> text,
    Vector2 position,
    double fontSize,
    double spacing,
    Color tint,
  ) => _ffi.DrawTextEx(
    Font$.Ref1(font).asNative<FontC>().ref,
    text.asNative(),
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    fontSize,
    spacing,
    Color$.Ref1(tint).asNative<ColorC>().ref,
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
  ) => _ffi.DrawTextPro(
    Font$.Ref1(font).asNative<FontC>().ref,
    text.asNative(),
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    Vector2$.Ref2(origin).asNative<Vector2C>().ref,
    rotation,
    fontSize,
    spacing,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawTextCodepoint(
    Font font,
    int codepoint,
    Vector2 position,
    double fontSize,
    Color tint,
  ) => _ffi.DrawTextCodepoint(
    Font$.Ref1(font).asNative<FontC>().ref,
    codepoint,
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    fontSize,
    Color$.Ref1(tint).asNative<ColorC>().ref,
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
  ) => _ffi.DrawTextCodepoints(
    Font$.Ref1(font).asNative<FontC>().ref,
    codepoints.asNative(),
    codepointCount,
    Vector2$.Ref1(position).asNative<Vector2C>().ref,
    fontSize,
    spacing,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void SetTextLineSpacing(
    int spacing,
  ) => _ffi.SetTextLineSpacing(
    spacing,
  );

  @override
  int MeasureText(
    XPtr<XChar> text,
    int fontSize,
  ) => _ffi.MeasureText(
    text.asNative(),
    fontSize,
  );

  @override
  Vector2 MeasureTextEx(
    Font font,
    XPtr<XChar> text,
    double fontSize,
    double spacing,
  ) => Vector2$.Extract(
    (p) => _ffi.MeasureTextEx(
      Font$.Ref1(font).asNative<FontC>().ref,
      text.asNative(),
      fontSize,
      spacing,
    ).toDart(p.asNative()),
  );

  @override
  Vector2 MeasureTextCodepoints(
    Font font,
    XPtr<XInt> codepoints,
    int length,
    double fontSize,
    double spacing,
  ) => Vector2$.Extract(
    (p) => _ffi.MeasureTextCodepoints(
      Font$.Ref1(font).asNative<FontC>().ref,
      codepoints.asNative(),
      length,
      fontSize,
      spacing,
    ).toDart(p.asNative()),
  );

  @override
  int GetGlyphIndex(
    Font font,
    int codepoint,
  ) => _ffi.GetGlyphIndex(
    Font$.Ref1(font).asNative<FontC>().ref,
    codepoint,
  );

  @override
  GlyphInfo GetGlyphInfo(
    Font font,
    int codepoint,
  ) => GlyphInfo$.Extract(
    (p) => _ffi.GetGlyphInfo(
      Font$.Ref1(font).asNative<FontC>().ref,
      codepoint,
    ).toDart(p.asNative()),
  );

  @override
  Rectangle GetGlyphAtlasRec(
    Font font,
    int codepoint,
  ) => Rectangle$.Extract(
    (p) => _ffi.GetGlyphAtlasRec(
      Font$.Ref1(font).asNative<FontC>().ref,
      codepoint,
    ).toDart(p.asNative()),
  );

  @override
  XNativePtr<XChar> LoadUTF8(
    XPtr<XInt> codepoints,
    int length,
  ) => _ffi.LoadUTF8(
    codepoints.asNative(),
    length,
  ).asXPtr();

  @override
  void UnloadUTF8(
    XPtr<XChar> text,
  ) => _ffi.UnloadUTF8(
    text.asNative(),
  );

  @override
  XNativePtr<XInt> LoadCodepoints(
    XPtr<XChar> text,
    XPtr<XInt> count,
  ) => _ffi.LoadCodepoints(
    text.asNative(),
    count.asNative(),
  ).asXPtr();

  @override
  void UnloadCodepoints(
    XPtr<XInt> codepoints,
  ) => _ffi.UnloadCodepoints(
    codepoints.asNative(),
  );

  @override
  int GetCodepointCount(
    XPtr<XChar> text,
  ) => _ffi.GetCodepointCount(
    text.asNative(),
  );

  @override
  int GetCodepoint(
    XPtr<XChar> text,
    XPtr<XInt> codepointSize,
  ) => _ffi.GetCodepoint(
    text.asNative(),
    codepointSize.asNative(),
  );

  @override
  int GetCodepointNext(
    XPtr<XChar> text,
    XPtr<XInt> codepointSize,
  ) => _ffi.GetCodepointNext(
    text.asNative(),
    codepointSize.asNative(),
  );

  @override
  int GetCodepointPrevious(
    XPtr<XChar> text,
    XPtr<XInt> codepointSize,
  ) => _ffi.GetCodepointPrevious(
    text.asNative(),
    codepointSize.asNative(),
  );

  @override
  XNativePtr<XChar> CodepointToUTF8(
    int codepoint,
    XPtr<XInt> utf8Size,
  ) => _ffi.CodepointToUTF8(
    codepoint,
    utf8Size.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XRawPtr<XChar>> LoadTextLines(
    XPtr<XChar> text,
    XPtr<XInt> count,
  ) => _ffi.LoadTextLines(
    text.asNative(),
    count.asNative(),
  ).asXPtr();

  @override
  void UnloadTextLines(
    XPtr<XRawPtr<XChar>> text,
    int lineCount,
  ) => _ffi.UnloadTextLines(
    text.asNative(),
    lineCount,
  );

  @override
  int TextCopy(
    XPtr<XChar> dst,
    XPtr<XChar> src,
  ) => _ffi.TextCopy(
    dst.asNative(),
    src.asNative(),
  );

  @override
  bool TextIsEqual(
    XPtr<XChar> text1,
    XPtr<XChar> text2,
  ) => _ffi.TextIsEqual(
    text1.asNative(),
    text2.asNative(),
  );

  @override
  int TextLength(
    XPtr<XChar> text,
  ) => _ffi.TextLength(
    text.asNative(),
  );

  @override
  XNativePtr<XChar> TextSubtext(
    XPtr<XChar> text,
    int position,
    int length,
  ) => _ffi.TextSubtext(
    text.asNative(),
    position,
    length
  ).asXPtr();

  @override
  XNativePtr<XChar> TextRemoveSpaces(
    XPtr<XChar> text,
  ) => _ffi.TextRemoveSpaces(
    text.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> GetTextBetween(
    XPtr<XChar> text,
    XPtr<XChar> begin,
    XPtr<XChar> end,
  ) => _ffi.GetTextBetween(
    text.asNative(),
    begin.asNative(),
    end.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> TextReplace(
    XPtr<XChar> text,
    XPtr<XChar> replace,
    XPtr<XChar> by,
  ) => _ffi.TextReplace(
    text.asNative(),
    replace.asNative(),
    by.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> TextReplaceAlloc(
    XPtr<XChar> text,
    XPtr<XChar> replace,
    XPtr<XChar> by,
  ) => _ffi.TextReplaceAlloc(
    text.asNative(),
    replace.asNative(),
    by.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> TextReplaceBetween(
    XPtr<XChar> text,
    XPtr<XChar> begin,
    XPtr<XChar> end,
    XPtr<XChar> replacement,
  ) => _ffi.TextReplaceBetween(
    text.asNative(),
    begin.asNative(),
    end.asNative(),
    replacement.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> TextReplaceBetweenAlloc(
    XPtr<XChar> text,
    XPtr<XChar> begin,
    XPtr<XChar> end,
    XPtr<XChar> replacement,
  ) => _ffi.TextReplaceBetweenAlloc(
    text.asNative(),
    begin.asNative(),
    end.asNative(),
    replacement.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> TextInsert(
    XPtr<XChar> text,
    XPtr<XChar> insert,
    int position,
  ) => _ffi.TextInsert(
    text.asNative(),
    insert.asNative(),
    position,
  ).asXPtr();

  @override
  XNativePtr<XChar> TextInsertAlloc(
    XPtr<XChar> text,
    XPtr<XChar> insert,
    int position,
  ) => _ffi.TextInsertAlloc(
    text.asNative(),
    insert.asNative(),
    position,
  ).asXPtr();

  @override
  XNativePtr<XChar> TextJoin(
    XPtr<XRawPtr<XChar>> textList,
    int count,
    XPtr<XChar> delimiter,
  ) => _ffi.TextJoin(
    textList.asNative(),
    count,
    delimiter.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XRawPtr<XChar>> TextSplit(
    XPtr<XChar> text,
    int delimiter,
    XPtr<XInt> count,
  ) => _ffi.TextSplit(
    text.asNative(),
    delimiter,
    count.asNative(),
  ).asXPtr();

  @override
  void TextAppend(
    XPtr<XChar> text,
    XPtr<XChar> append,
    XPtr<XInt> position,
  ) => _ffi.TextAppend(
    text.asNative(),
    append.asNative(),
    position.asNative(),
  );

  @override
  int TextFindIndex(
    XPtr<XChar> text,
    XPtr<XChar> find,
  ) => _ffi.TextFindIndex(
    text.asNative(),
    find.asNative(),
  );

  @override
  XNativePtr<XChar> TextToUpper(
    XPtr<XChar> text,
  ) => _ffi.TextToUpper(
    text.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> TextToLower(
    XPtr<XChar> text,
  ) => _ffi.TextToLower(
    text.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> TextToPascal(
    XPtr<XChar> text,
  ) => _ffi.TextToPascal(
    text.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> TextToSnake(
    XPtr<XChar> text,
  ) => _ffi.TextToSnake(
    text.asNative(),
  ).asXPtr();

  @override
  XNativePtr<XChar> TextToCamel(
    XPtr<XChar> text,
  ) => _ffi.TextToCamel(
    text.asNative(),
  ).asXPtr();

  @override
  int TextToInteger(
    XPtr<XChar> text,
  ) => _ffi.TextToInteger(
    text.asNative(),
  );

  @override
  double TextToFloat(
    XPtr<XChar> text,
  ) => _ffi.TextToFloat(
    text.asNative(),
  );

  @override
  void DrawLine3D(
    Vector3 startPos,
    Vector3 endPos,
    Color color,
  ) => _ffi.DrawLine3D(
    Vector3$.Ref1(startPos).asNative<Vector3C>().ref,
    Vector3$.Ref2(endPos).asNative<Vector3C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawPoint3D(
    Vector3 position,
    Color color,
  ) => _ffi.DrawPoint3D(
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCircle3D(
    Vector3 center,
    double radius,
    Vector3 rotationAxis,
    double rotationAngle,
    Color color,
  ) => _ffi.DrawCircle3D(
    Vector3$.Ref1(center).asNative<Vector3C>().ref,
    radius,
    Vector3$.Ref2(rotationAxis).asNative<Vector3C>().ref,
    rotationAngle,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawTriangle3D(
    Vector3 v1,
    Vector3 v2,
    Vector3 v3,
    Color color,
  ) => _ffi.DrawTriangle3D(
    Vector3$.Ref1(v1).asNative<Vector3C>().ref,
    Vector3$.Ref2(v2).asNative<Vector3C>().ref,
    Vector3$.Ref3(v3).asNative<Vector3C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawTriangleStrip3D(
    XStructPtr<Vector3> points,
    int pointCount,
    Color color,
  ) => _ffi.DrawTriangleStrip3D(
    points.asNative(),
    pointCount,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCube(
    Vector3 position,
    double width,
    double height,
    double length,
    Color color,
  ) => _ffi.DrawCube(
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    width,
    height,
    length,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCubeV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => _ffi.DrawCubeV(
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    Vector3$.Ref2(size).asNative<Vector3C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCubeWires(
    Vector3 position,
    double width,
    double height,
    double length,
    Color color,
  ) => _ffi.DrawCubeWires(
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    width,
    height,
    length,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCubeWiresV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => _ffi.DrawCubeWiresV(
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    Vector3$.Ref2(size).asNative<Vector3C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSphere(
    Vector3 centerPos,
    double radius,
    Color color,
  ) => _ffi.DrawSphere(
    Vector3$.Ref1(centerPos).asNative<Vector3C>().ref,
    radius,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSphereEx(
    Vector3 centerPos,
    double radius,
    int rings,
    int slices,
    Color color,
  ) => _ffi.DrawSphereEx(
    Vector3$.Ref1(centerPos).asNative<Vector3C>().ref,
    radius,
    rings,
    slices,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawSphereWires(
    Vector3 centerPos,
    double radius,
    int rings,
    int slices,
    Color color,
  ) => _ffi.DrawSphereWires(
    Vector3$.Ref1(centerPos).asNative<Vector3C>().ref,
    radius,
    rings,
    slices,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCylinder(
    Vector3 position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    Color color,
  ) => _ffi.DrawCylinder(
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    radiusTop,
    radiusBottom,
    height,
    slices,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCylinderEx(
    Vector3 startPos,
    Vector3 endPos,
    double startRadius,
    double endRadius,
    int sides,
    Color color,
  ) => _ffi.DrawCylinderEx(
    Vector3$.Ref1(startPos).asNative<Vector3C>().ref,
    Vector3$.Ref2(endPos).asNative<Vector3C>().ref,
    startRadius,
    endRadius,
    sides,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCylinderWires(
    Vector3 position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    Color color,
  ) => _ffi.DrawCylinderWires(
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    radiusTop,
    radiusBottom,
    height,
    slices,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCylinderWiresEx(
    Vector3 startPos,
    Vector3 endPos,
    double startRadius,
    double endRadius,
    int sides,
    Color color,
  ) => _ffi.DrawCylinderWiresEx(
    Vector3$.Ref1(startPos).asNative<Vector3C>().ref,
    Vector3$.Ref2(endPos).asNative<Vector3C>().ref,
    startRadius,
    endRadius,
    sides,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCapsule(
    Vector3 startPos,
    Vector3 endPos,
    double radius,
    int slices,
    int rings,
    Color color,
  ) => _ffi.DrawCapsule(
    Vector3$.Ref1(startPos).asNative<Vector3C>().ref,
    Vector3$.Ref2(endPos).asNative<Vector3C>().ref,
    radius,
    slices,
    rings,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawCapsuleWires(
    Vector3 startPos,
    Vector3 endPos,
    double radius,
    int slices,
    int rings,
    Color color,
  ) => _ffi.DrawCapsuleWires(
    Vector3$.Ref1(startPos).asNative<Vector3C>().ref,
    Vector3$.Ref2(endPos).asNative<Vector3C>().ref,
    radius,
    slices,
    rings,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawPlane(
    Vector3 centerPos,
    Vector2 size,
    Color color,
  ) => _ffi.DrawPlane(
    Vector3$.Ref1(centerPos).asNative<Vector3C>().ref,
    Vector2$.Ref1(size).asNative<Vector2C>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawRay(
    Ray ray,
    Color color,
  ) => _ffi.DrawRay(
    Ray$.Ref1(ray).asNative<RayC>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawGrid(
    int slices,
    double spacing,
  ) => _ffi.DrawGrid(
    slices,
    spacing,
  );

  @override
  Model LoadModel(
    XPtr<XChar> fileName,
  ) => Model$.RefCapture(
    RaylibCaptureIds.LoadModel,
    (p) => _ffi.LoadModel(
      fileName.asNative(),
    ).toDart(p.asNative()),
  );

  @override
  Model LoadModelFromMesh(
    Mesh mesh,
  ) => Model$.RefCapture(
    RaylibCaptureIds.LoadModelFromMesh,
    (p) => _ffi.LoadModelFromMesh(
      Mesh$.Ref1(mesh).asNative<MeshC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  bool IsModelValid(
    Model model,
  ) => _ffi.IsModelValid(
    Model$.Ref1(model).asNative<ModelC>().ref,
  );

  @override
  void UnloadModel(
    Model model,
  ) => _ffi.UnloadModel(
    Model$.Ref1(model).asNative<ModelC>().ref,
  );

  @override
  BoundingBox GetModelBoundingBox(
    Model model,
  ) => BoundingBox$.Extract(
    (p) => _ffi.GetModelBoundingBox(
      Model$.Ref1(model).asNative<ModelC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  void DrawModel(
    Model model,
    Vector3 position,
    double scale,
    Color tint,
  ) => _ffi.DrawModel(
    Model$.Ref1(model).asNative<ModelC>().ref,
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    scale,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawModelEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    double rotationAngle,
    Vector3 scale,
    Color tint,
  ) => _ffi.DrawModelEx(
    Model$.Ref1(model).asNative<ModelC>().ref,
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    Vector3$.Ref2(rotationAxis).asNative<Vector3C>().ref,
    rotationAngle,
    Vector3$.Ref3(scale).asNative<Vector3C>().ref,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawModelWires(
    Model model,
    Vector3 position,
    double scale,
    Color tint,
  ) => _ffi.DrawModelWires(
    Model$.Ref1(model).asNative<ModelC>().ref,
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    scale,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawModelWiresEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    double rotationAngle,
    Vector3 scale,
    Color tint,
  ) => _ffi.DrawModelWiresEx(
    Model$.Ref1(model).asNative<ModelC>().ref,
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    Vector3$.Ref2(rotationAxis).asNative<Vector3C>().ref,
    rotationAngle,
    Vector3$.Ref3(scale).asNative<Vector3C>().ref,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawBoundingBox(
    BoundingBox box,
    Color color,
  ) => _ffi.DrawBoundingBox(
    BoundingBox$.Ref1(box).asNative<BoundingBoxC>().ref,
    Color$.Ref1(color).asNative<ColorC>().ref,
  );

  @override
  void DrawBillboard(
    Camera3D camera,
    Texture texture,
    Vector3 position,
    double scale,
    Color tint,
  ) => _ffi.DrawBillboard(
    Camera3D$.Ref1(camera).asNative<Camera3DC>().ref,
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    scale,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void DrawBillboardRec(
    Camera3D camera,
    Texture texture,
    Rectangle source,
    Vector3 position,
    Vector2 size,
    Color tint,
  ) => _ffi.DrawBillboardRec(
    Camera3D$.Ref1(camera).asNative<Camera3DC>().ref,
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    Rectangle$.Ref1(source).asNative<RectangleC>().ref,
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    Vector2$.Ref1(size).asNative<Vector2C>().ref,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
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
    double rotation,
    Color tint,
  ) => _ffi.DrawBillboardPro(
    Camera3D$.Ref1(camera).asNative<Camera3DC>().ref,
    Texture$.Ref1(texture).asNative<TextureC>().ref,
    Rectangle$.Ref1(source).asNative<RectangleC>().ref,
    Vector3$.Ref1(position).asNative<Vector3C>().ref,
    Vector3$.Ref2(up).asNative<Vector3C>().ref,
    Vector2$.Ref1(size).asNative<Vector2C>().ref,
    Vector2$.Ref2(origin).asNative<Vector2C>().ref,
    rotation,
    Color$.Ref1(tint).asNative<ColorC>().ref,
  );

  @override
  void UploadMesh(
    XStructPtr<Mesh> mesh,
    bool dynamic,
  ) => _ffi.UploadMesh(
    mesh.asNative(),
    dynamic,
  );

  @override
  void UpdateMeshBuffer(
    Mesh mesh,
    int index,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  ) => _ffi.UpdateMeshBuffer(
    Mesh$.Ref1(mesh).asNative<MeshC>().ref,
    index,
    data.asNative(),
    dataSize,
    offset,
  );

  @override
  void UnloadMesh(
    Mesh mesh,
  ) => _ffi.UnloadMesh(
    Mesh$.Ref1(mesh).asNative<MeshC>().ref,
  );

  @override
  void DrawMesh(
    Mesh mesh,
    Material material,
    Matrix transform,
  ) => _ffi.DrawMesh(
    Mesh$.Ref1(mesh).asNative<MeshC>().ref,
    Material$.Ref1(material).asNative<MaterialC>().ref,
    Matrix$.Ref1(transform).asNative<MatrixC>().ref,
  );

  @override
  void DrawMeshInstanced(
    Mesh mesh,
    Material material,
    XStructPtr<Matrix> transforms,
    int instances,
  ) => _ffi.DrawMeshInstanced(
    Mesh$.Ref1(mesh).asNative<MeshC>().ref,
    Material$.Ref1(material).asNative<MaterialC>().ref,
    transforms.asNative(),
    instances,
  );

  @override
  BoundingBox GetMeshBoundingBox(
    Mesh mesh,
  ) => BoundingBox$.Extract(
    (p) => _ffi.GetMeshBoundingBox(
      Mesh$.Ref1(mesh).asNative<MeshC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  void GenMeshTangents(
    XStructPtr<Mesh> mesh,
  ) => _ffi.GenMeshTangents(
    mesh.asNative(),
  );

  @override
  bool ExportMesh(
    Mesh mesh,
    XPtr<XChar> fileName,
  ) => _ffi.ExportMesh(
    Mesh$.Ref1(mesh).asNative<MeshC>().ref,
    fileName.asNative(),
  );

  @override
  bool ExportMeshAsCode(
    Mesh mesh,
    XPtr<XChar> fileName,
  ) => _ffi.ExportMeshAsCode(
    Mesh$.Ref1(mesh).asNative<MeshC>().ref,
    fileName.asNative(),
  );

  @override
  Mesh GenMeshPoly(
    int sides,
    double radius,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshPoly,
    (p) => _ffi.GenMeshPoly(
      sides,
      radius,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshPlane(
    double width,
    double length,
    int resX,
    int resZ,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshPlane,
    (p) => _ffi.GenMeshPlane(
      width,
      length,
      resX,
      resZ,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshCube(
    double width,
    double height,
    double length,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCube,
    (p) => _ffi.GenMeshCube(
      width,
      height,
      length,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshSphere(
    double radius,
    int rings,
    int slices,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshSphere,
    (p) => _ffi.GenMeshSphere(
      radius,
      rings,
      slices,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshHemiSphere(
    double radius,
    int rings,
    int slices,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshHemiSphere,
    (p) => _ffi.GenMeshHemiSphere(
      radius,
      rings,
      slices,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshCylinder(
    double radius,
    double height,
    int slices,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCylinder,
    (p) => _ffi.GenMeshCylinder(
      radius,
      height,
      slices,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshCone(
    double radius,
    double height,
    int slices,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCone,
    (p) => _ffi.GenMeshCone(
      radius,
      height,
      slices,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshTorus(
    double radius,
    double size,
    int radSeg,
    int sides,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshTorus,
    (p) => _ffi.GenMeshTorus(
      radius,
      size,
      radSeg,
      sides,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshKnot(
    double radius,
    double size,
    int radSeg,
    int sides,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshKnot,
    (p) => _ffi.GenMeshKnot(
      radius,
      size,
      radSeg,
      sides,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshHeightmap(
    Image heightmap,
    Vector3 size,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshHeightmap,
    (p) => _ffi.GenMeshHeightmap(
      Image$.Ref1(heightmap).asNative<ImageC>().ref,
      Vector3$.Ref1(size).asNative<Vector3C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  Mesh GenMeshCubicmap(
    Image cubicmap,
    Vector3 cubeSize,
  ) => Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCubicmap,
    (p) => _ffi.GenMeshCubicmap(
      Image$.Ref1(cubicmap).asNative<ImageC>().ref,
      Vector3$.Ref1(cubeSize).asNative<Vector3C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  XStructPtr<Material> LoadMaterials(
    XPtr<XChar> fileName,
    XPtr<XInt> materialCount,
  ) => Material.struct.ptr(_ffi.LoadMaterials(
    fileName.asNative(),
    materialCount.asNative(),
  ).asXPtr());

  @override
  Material LoadMaterialDefault() => Material$.RefCapture(
    RaylibCaptureIds.LoadMaterialDefault,
    (p) => _ffi.LoadMaterialDefault().toDart(p.asNative()),
  );

  @override
  bool IsMaterialValid(
    Material material,
  ) => _ffi.IsMaterialValid(
    Material$.Ref1(material).asNative<MaterialC>().ref,
  );

  @override
  void UnloadMaterial(
    Material material,
  ) => _ffi.UnloadMaterial(
    Material$.Ref1(material).asNative<MaterialC>().ref,
  );

  @override
  void SetMaterialTexture(
    XStructPtr<Material> material,
    int mapType,
    Texture texture,
  ) => _ffi.SetMaterialTexture(
    material.asNative(),
    mapType,
    Texture$.Ref1(texture).asNative<TextureC>().ref,
  );

  @override
  void SetModelMeshMaterial(
    XStructPtr<Model> model,
    int meshId,
    int materialId,
  ) => _ffi.SetModelMeshMaterial(
    model.asNative(),
    meshId,
    materialId,
  );

  @override
  XStructPtr<ModelAnimation> LoadModelAnimations(
    XPtr<XChar> fileName,
    XPtr<XInt> animCount,
  ) => ModelAnimation.struct.ptr(_ffi.LoadModelAnimations(
    fileName.asNative(),
    animCount.asNative(),
  ).asXPtr());

  @override
  void UpdateModelAnimation(
    Model model,
    ModelAnimation anim,
    double frame,
  ) => _ffi.UpdateModelAnimation(
    Model$.Ref1(model).asNative<ModelC>().ref,
    ModelAnimation$.Ref1(anim).asNative<ModelAnimationC>().ref,
    frame,
  );

  @override
  void UpdateModelAnimationEx(
    Model model,
    ModelAnimation animA,
    double frameA,
    ModelAnimation animB,
    double frameB,
    double blend,
  ) => _ffi.UpdateModelAnimationEx(
    Model$.Ref1(model).asNative<ModelC>().ref,
    ModelAnimation$.Ref1(animA).asNative<ModelAnimationC>().ref,
    frameA,
    ModelAnimation$.Ref2(animB).asNative<ModelAnimationC>().ref,
    frameB,
    blend,
  );

  @override
  void UnloadModelAnimations(
    XStructPtr<ModelAnimation> animations,
    int animCount,
  ) => _ffi.UnloadModelAnimations(
    animations.asNative(),
    animCount,
  );

  @override
  bool IsModelAnimationValid(
    Model model,
    ModelAnimation anim,
  ) => _ffi.IsModelAnimationValid(
    Model$.Ref1(model).asNative<ModelC>().ref,
    ModelAnimation$.Ref1(anim).asNative<ModelAnimationC>().ref,
  );

  @override
  bool CheckCollisionSpheres(
    Vector3 center1,
    double radius1,
    Vector3 center2,
    double radius2,
  ) => _ffi.CheckCollisionSpheres(
    Vector3$.Ref1(center1).asNative<Vector3C>().ref,
    radius1,
    Vector3$.Ref2(center2).asNative<Vector3C>().ref,
    radius2,
  );

  @override
  bool CheckCollisionBoxes(
    BoundingBox box1,
    BoundingBox box2,
  ) => _ffi.CheckCollisionBoxes(
    BoundingBox$.Ref1(box1).asNative<BoundingBoxC>().ref,
    BoundingBox$.Ref2(box2).asNative<BoundingBoxC>().ref,
  );

  @override
  bool CheckCollisionBoxSphere(
    BoundingBox box,
    Vector3 center,
    double radius,
  ) => _ffi.CheckCollisionBoxSphere(
    BoundingBox$.Ref1(box).asNative<BoundingBoxC>().ref,
    Vector3$.Ref1(center).asNative<Vector3C>().ref,
    radius,
  );

  @override
  RayCollision GetRayCollisionSphere(
    Ray ray,
    Vector3 center,
    double radius,
  ) => RayCollision$.Extract(
    (p) => _ffi.GetRayCollisionSphere(
      Ray$.Ref1(ray).asNative<RayC>().ref,
      Vector3$.Ref1(center).asNative<Vector3C>().ref,
      radius,
    ).toDart(p.asNative()),
  );

  @override
  RayCollision GetRayCollisionBox(
    Ray ray,
    BoundingBox box,
  ) => RayCollision$.Extract(
    (p) => _ffi.GetRayCollisionBox(
      Ray$.Ref1(ray).asNative<RayC>().ref,
      BoundingBox$.Ref1(box).asNative<BoundingBoxC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  RayCollision GetRayCollisionMesh(
    Ray ray,
    Mesh mesh,
    Matrix transform,
  ) => RayCollision$.Extract(
    (p) => _ffi.GetRayCollisionMesh(
      Ray$.Ref1(ray).asNative<RayC>().ref,
      Mesh$.Ref1(mesh).asNative<MeshC>().ref,
      Matrix$.Ref1(transform).asNative<MatrixC>().ref,
    ).toDart(p.asNative()),
  );

  @override
  RayCollision GetRayCollisionTriangle(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
  ) => RayCollision$.Extract(
    (p) => _ffi.GetRayCollisionTriangle(
      Ray$.Ref1(ray).asNative<RayC>().ref,
      Vector3$.Ref1(p1).asNative<Vector3C>().ref,
      Vector3$.Ref2(p2).asNative<Vector3C>().ref,
      Vector3$.Ref3(p3).asNative<Vector3C>().ref,
    ).toDart(p.asNative()),
  );

  @override
  RayCollision GetRayCollisionQuad(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
    Vector3 p4,
  ) => RayCollision$.Extract(
    (p) => _ffi.GetRayCollisionQuad(
      Ray$.Ref1(ray).asNative<RayC>().ref,
      Vector3$.Ref1(p1).asNative<Vector3C>().ref,
      Vector3$.Ref2(p2).asNative<Vector3C>().ref,
      Vector3$.Ref3(p3).asNative<Vector3C>().ref,
      Vector3$.Ref4(p4).asNative<Vector3C>().ref,
    ).toDart(p.asNative()),
  );
}
