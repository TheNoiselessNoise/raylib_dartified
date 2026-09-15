part of '../../../raylib_dartified.dart';

class RaylibCoreFlat extends RaylibCoreFlatModule<Raylib> {

  RaylibCoreFlat(super.rl);

  RaylibCore get _ffi => rl.module();

  @override
  void InitWindow(
    int width,
    int height,
    MemoryPointer<RChar> title,
  ) => _ffi.InitWindow(
    width,
    height,
    title.asNativePointer(),
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
    ImageD image,
  ) => _ffi.SetWindowIcon(
    $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
  );

  @override
  void SetWindowIcons(
    StructPointer<ImageD> images,
    int count,
  ) => _ffi.SetWindowIcons(
    images.asNativePointer(),
    count,
  );

  @override
  void SetWindowTitle(
    MemoryPointer<RChar> title,
  ) => _ffi.SetWindowTitle(
    title.asNativePointer(),
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
  NativeMemoryPointer<RVoid> GetWindowHandle() => _ffi.GetWindowHandle().asMemoryPointer();

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
  Vector2D GetMonitorPosition(
    int monitor,
  ) => $.Vector2$.Extract1(
    (p) => _ffi.GetMonitorPosition(
      monitor,
    ).toDart(p.asNativePointer()),
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
  Vector2D GetWindowPosition() => $.Vector2$.Extract1(
    (p) => _ffi.GetWindowPosition().toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetWindowScaleDPI() => $.Vector2$.Extract1(
    (p) => _ffi.GetWindowScaleDPI().toDart(p.asNativePointer()),
  );

  @override
  NativeMemoryPointer<RChar> GetMonitorName(
    int monitor,
  ) => _ffi.GetMonitorName(
    monitor,
  ).asMemoryPointer();

  @override
  void SetClipboardText(
    MemoryPointer<RChar> text,
  ) => _ffi.SetClipboardText(
    text.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> GetClipboardText() => _ffi.GetClipboardText().asMemoryPointer();

  @override
  ImageD GetClipboardImage() => $.Image$.RefCapture(
    RaylibCaptureIds.GetClipboardImage,
    (p) => _ffi.GetClipboardImage().toDart(p.asNativePointer()),
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
    ColorD color,
  ) => _ffi.ClearBackground(
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void BeginDrawing() => _ffi.BeginDrawing();

  @override
  void EndDrawing() => _ffi.EndDrawing();

  @override
  void BeginMode2D(
    Camera2DD camera,
  ) => _ffi.BeginMode2D(
    $.Camera2D$.Ref1(camera).asNativePointer<Camera2DC>().ref,
  );

  @override
  void EndMode2D() => _ffi.EndMode2D();

  @override
  void BeginMode3D(
    Camera3DD camera,
  ) => _ffi.BeginMode3D(
    $.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
  );

  @override
  void EndMode3D() => _ffi.EndMode3D();

  @override
  void BeginTextureMode(
    RenderTextureD target,
  ) => _ffi.BeginTextureMode(
    $.RenderTexture$.Ref1(target).asNativePointer<RenderTextureC>().ref,
  );

  @override
  void EndTextureMode() => _ffi.EndTextureMode();

  @override
  void BeginShaderMode(
    ShaderD shader,
  ) => _ffi.BeginShaderMode(
    $.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
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
    VrStereoConfigD config,
  ) => _ffi.BeginVrStereoMode(
    $.VrStereoConfig$.Ref1(config).asNativePointer<VrStereoConfigC>().ref,
  );

  @override
  void EndVrStereoMode() => _ffi.EndVrStereoMode();

  @override
  VrStereoConfigD LoadVrStereoConfig(
    VrDeviceInfoD device,
  ) => $.VrStereoConfig$.RefCapture(
    RaylibCaptureIds.LoadVrStereoConfig,
    (p) => _ffi.LoadVrStereoConfig(
      $.VrDeviceInfo$.Ref1(device).asNativePointer<VrDeviceInfoC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void UnloadVrStereoConfig(
    VrStereoConfigD config,
  ) => disposeStructWithOpFreed(config, (ptr) {
    _ffi.UnloadVrStereoConfig(
      ptr.asNativePointer<VrStereoConfigC>().ref,
    );
  });

  @override
  ShaderD LoadShader(
    MemoryPointer<RChar> vsFileName,
    MemoryPointer<RChar> fsFileName,
  ) => $.Shader$.RefCapture(
    RaylibCaptureIds.LoadShader,
    (p) => _ffi.LoadShader(
      vsFileName.asNativePointer(),
      fsFileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  ShaderD LoadShaderFromMemory(
    MemoryPointer<RChar> vsCode,
    MemoryPointer<RChar> fsCode,
  ) => $.Shader$.RefCapture(
    RaylibCaptureIds.LoadShaderFromMemory,
    (p) => _ffi.LoadShaderFromMemory(
      vsCode.asNativePointer(),
      fsCode.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  bool IsShaderValid(
    ShaderD shader,
  ) => _ffi.IsShaderValid(
    $.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
  );

  @override
  int GetShaderLocation(
    ShaderD shader,
    MemoryPointer<RChar> uniformName,
  ) => _ffi.GetShaderLocation(
    $.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    uniformName.asNativePointer(),
  );

  @override
  int GetShaderLocationAttrib(
    ShaderD shader,
    MemoryPointer<RChar> attribName,
  ) => _ffi.GetShaderLocationAttrib(
    $.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    attribName.asNativePointer(),
  );

  @override
  void SetShaderValueV(
    ShaderD shader,
    int locIndex,
    MemoryPointer<RVoid> value,
    int uniformType,
    int count,
  ) => _ffi.SetShaderValueV(
    $.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
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
  ) => _ffi.SetShaderValueMatrix(
    $.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    locIndex,
    $.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
  );

  @override
  void SetShaderValueTexture(
    ShaderD shader,
    int locIndex,
    TextureD texture,
  ) => _ffi.SetShaderValueTexture(
    $.Shader$.Ref1(shader).asNativePointer<ShaderC>().ref,
    locIndex,
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
  );

  @override
  void UnloadShader(
    ShaderD shader,
  ) => disposeStructWithOpFreed(shader, (ptr) {
    _ffi.UnloadShader(
      ptr.asNativePointer<ShaderC>().ref,
    );
  });

  @override
  RayD GetScreenToWorldRay(
    Vector2D position,
    Camera3DD camera,
  ) => $.Ray$.Extract1(
    (p) => _ffi.GetScreenToWorldRay(
      $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
      $.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayD GetScreenToWorldRayEx(
    Vector2D position,
    Camera3DD camera,
    int width,
    int height,
  ) => $.Ray$.Extract1(
    (p) => _ffi.GetScreenToWorldRayEx(
      $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
      $.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
      width,
      height,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetWorldToScreen(
    Vector3D position,
    Camera3DD camera,
  ) => $.Vector2$.Extract1(
    (p) => _ffi.GetWorldToScreen(
      $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
      $.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetWorldToScreenEx(
    Vector3D position,
    Camera3DD camera,
    int width,
    int height,
  ) => $.Vector2$.Extract1(
    (p) => _ffi.GetWorldToScreenEx(
      $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
      $.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
      width,
      height,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  ) => $.Vector2$.Extract2(
    (p) => _ffi.GetWorldToScreen2D(
      $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
      $.Camera2D$.Ref1(camera).asNativePointer<Camera2DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  ) => $.Vector2$.Extract2(
    (p) => _ffi.GetScreenToWorld2D(
      $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
      $.Camera2D$.Ref1(camera).asNativePointer<Camera2DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD GetCameraMatrix(
    Camera3DD camera,
  ) => $.Matrix$.Extract1(
    (p) => _ffi.GetCameraMatrix(
      $.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MatrixD GetCameraMatrix2D(
    Camera2DD camera,
  ) => $.Matrix$.Extract1(
    (p) => _ffi.GetCameraMatrix2D(
      $.Camera2D$.Ref1(camera).asNativePointer<Camera2DC>().ref,
    ).toDart(p.asNativePointer()),
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
  NativeMemoryPointer<RInt> LoadRandomSequence(
    int count,
    int min,
    int max,
  ) => _ffi.LoadRandomSequence(
    count,
    min,
    max,
  ).asMemoryPointer();

  @override
  void UnloadRandomSequence(
    MemoryPointer<RInt> sequence,
  ) => _ffi.UnloadRandomSequence(
    sequence.asNativePointer(),
  );

  @override
  void TakeScreenshot(
    MemoryPointer<RChar> fileName,
  ) => _ffi.TakeScreenshot(
    fileName.asNativePointer(),
  );

  @override
  void SetConfigFlags(
    int flags,
  ) => _ffi.SetConfigFlags(
    flags,
  );

  @override
  void OpenURL(
    MemoryPointer<RChar> url,
  ) => _ffi.OpenURL(
    url.asNativePointer(),
  );

  @override
  void TraceLog(
    int logLevel,
    MemoryPointer<RChar> text,
    // NOTE: missing va_list argument
  ) => _ffi.TraceLog(
    logLevel,
    text.asNativePointer(),
  );

  @override
  void SetTraceLogLevel(
    int logLevel,
  ) => _ffi.SetTraceLogLevel(
    logLevel,
  );

  @override
  void SetTraceLogCallback(
    MemoryPointer<RFunction<TraceLogCallbackBase>> callback,
  ) => _ffi.SetTraceLogCallback(
    callback.asNativePointer(),
  );

  @override
  void SetLoadFileDataCallback(
    MemoryPointer<RFunction<LoadFileDataCallbackBase>> callback,
  ) => _ffi.SetLoadFileDataCallback(
    callback.asNativePointer(),
  );

  @override
  void SetSaveFileDataCallback(
    MemoryPointer<RFunction<SaveFileDataCallbackBase>> callback,
  ) => _ffi.SetSaveFileDataCallback(
    callback.asNativePointer(),
  );

  @override
  void SetLoadFileTextCallback(
    MemoryPointer<RFunction<LoadFileTextCallbackBase>> callback,
  ) => _ffi.SetLoadFileTextCallback(
    callback.asNativePointer(),
  );

  @override
  void SetSaveFileTextCallback(
    MemoryPointer<RFunction<SaveFileTextCallbackBase>> callback,
  ) => _ffi.SetSaveFileTextCallback(
    callback.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RUnsignedChar> LoadFileData(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> dataSize,
  ) => _ffi.LoadFileData(
    fileName.asNativePointer(),
    dataSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  void UnloadFileData(
    MemoryPointer<RUnsignedChar> data,
  ) => _ffi.UnloadFileData(
    data.asNativePointer(),
  );

  @override
  bool SaveFileData(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RVoid> data,
    int dataSize,
  ) => _ffi.SaveFileData(
    fileName.asNativePointer(),
    data.asNativePointer(),
    dataSize,
  );

  @override
  bool ExportDataAsCode(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportDataAsCode(
    data.asNativePointer(),
    dataSize,
    fileName.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> LoadFileText(
    MemoryPointer<RChar> fileName,
  ) => _ffi.LoadFileText(
    fileName.asNativePointer(),
  ).asMemoryPointer();

  @override
  void UnloadFileText(
    MemoryPointer<RChar> text,
  ) => _ffi.UnloadFileText(
    text.asNativePointer(),
  );

  @override
  bool SaveFileText(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> text,
  ) => _ffi.SaveFileText(
    fileName.asNativePointer(),
    text.asNativePointer(),
  );

  @override
  int FileRename(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> fileRename,
  ) => _ffi.FileRename(
    fileName.asNativePointer(),
    fileRename.asNativePointer(),
  );

  @override
  int FileRemove(
    MemoryPointer<RChar> fileName,
  ) => _ffi.FileRemove(
    fileName.asNativePointer(),
  );

  @override
  int FileCopy(
    MemoryPointer<RChar> srcPath,
    MemoryPointer<RChar> dstPath,
  ) => _ffi.FileCopy(
    srcPath.asNativePointer(),
    dstPath.asNativePointer(),
  );

  @override
  int FileMove(
    MemoryPointer<RChar> srcPath,
    MemoryPointer<RChar> dstPath,
  ) => _ffi.FileMove(
    srcPath.asNativePointer(),
    dstPath.asNativePointer(),
  );

  @override
  int FileTextReplace(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> search,
    MemoryPointer<RChar> replacement,
  ) => _ffi.FileTextReplace(
    fileName.asNativePointer(),
    search.asNativePointer(),
    replacement.asNativePointer(),
  );

  @override
  int FileTextFindIndex(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> search,
  ) => _ffi.FileTextFindIndex(
    fileName.asNativePointer(),
    search.asNativePointer(),
  );

  @override
  bool FileExists(
    MemoryPointer<RChar> fileName,
  ) => _ffi.FileExists(
    fileName.asNativePointer(),
  );

  @override
  bool DirectoryExists(
    MemoryPointer<RChar> dirPath,
  ) => _ffi.DirectoryExists(
    dirPath.asNativePointer(),
  );

  @override
  bool IsFileExtension(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RChar> ext,
  ) => _ffi.IsFileExtension(
    fileName.asNativePointer(),
    ext.asNativePointer(),
  );

  @override
  int GetFileLength(
    MemoryPointer<RChar> fileName,
  ) => _ffi.GetFileLength(
    fileName.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> GetFileExtension(
    MemoryPointer<RChar> fileName,
  ) => _ffi.GetFileExtension(
    fileName.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetFileName(
    MemoryPointer<RChar> filePath,
  ) => _ffi.GetFileName(
    filePath.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetFileNameWithoutExt(
    MemoryPointer<RChar> filePath,
  ) => _ffi.GetFileNameWithoutExt(
    filePath.asNativePointer(),
  ).asMemoryPointer();

  @override
  int GetDirectoryFileCount(
    MemoryPointer<RChar> dirPath,
  ) => _ffi.GetDirectoryFileCount(
    dirPath.asNativePointer(),
  );

  @override
  int GetDirectoryFileCountEx(
    MemoryPointer<RChar> basePath,
    MemoryPointer<RChar> filter,
    bool scanSubdirs,
  ) => _ffi.GetDirectoryFileCountEx(
    basePath.asNativePointer(),
    filter.asNativePointer(),
    scanSubdirs,
  );

  @override
  NativeMemoryPointer<RChar> GetDirectoryPath(
    MemoryPointer<RChar> filePath,
  ) => _ffi.GetDirectoryPath(
    filePath.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetPrevDirectoryPath(
    MemoryPointer<RChar> dirPath,
  ) => _ffi.GetPrevDirectoryPath(
    dirPath.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetWorkingDirectory() => _ffi.GetWorkingDirectory().asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetApplicationDirectory() => _ffi.GetApplicationDirectory().asMemoryPointer();

  @override
  int MakeDirectory(
    MemoryPointer<RChar> dirPath,
  ) => _ffi.MakeDirectory(
    dirPath.asNativePointer(),
  );

  @override
  bool ChangeDirectory(
    MemoryPointer<RChar> dir,
  ) => _ffi.ChangeDirectory(
    dir.asNativePointer(),
  );

  @override
  bool IsPathFile(
    MemoryPointer<RChar> path,
  ) => _ffi.IsPathFile(
    path.asNativePointer(),
  );

  @override
  bool IsFileNameValid(
    MemoryPointer<RChar> fileName,
  ) => _ffi.IsFileNameValid(
    fileName.asNativePointer(),
  );

  @override
  FilePathListD LoadDirectoryFiles(
    MemoryPointer<RChar> dirPath,
  ) => $.FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDirectoryFiles,
    (p) => _ffi.LoadDirectoryFiles(
      dirPath.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  FilePathListD LoadDirectoryFilesEx(
    MemoryPointer<RChar> basePath,
    MemoryPointer<RChar> filter,
    bool scanSubdirs,
  ) => $.FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDirectoryFilesEx,
    (p) => _ffi.LoadDirectoryFilesEx(
      basePath.asNativePointer(),
      filter.asNativePointer(),
      scanSubdirs,
    ).toDart(p.asNativePointer()),
  );

  @override
  void UnloadDirectoryFiles(
    FilePathListD files,
  ) => disposeStructWithOpFreed(files, (ptr) {
    _ffi.UnloadDirectoryFiles(
      ptr.asNativePointer<FilePathListC>().ref,
    );
  });

  @override
  bool IsFileDropped() => _ffi.IsFileDropped();

  @override
  FilePathListD LoadDroppedFiles() => $.FilePathList$.RefCapture(
    RaylibCaptureIds.LoadDroppedFiles,
    (p) => _ffi.LoadDroppedFiles().toDart(p.asNativePointer()),
  );

  @override
  void UnloadDroppedFiles(
    FilePathListD files,
  ) => disposeStructWithOpFreed(files, (ptr) {
    _ffi.UnloadDroppedFiles(
      ptr.asNativePointer<FilePathListC>().ref,
    );
  });

  @override
  int GetFileModTime(
    MemoryPointer<RChar> fileName,
  ) => _ffi.GetFileModTime(
    fileName.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RUnsignedChar> CompressData(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
    MemoryPointer<RInt> compDataSize,
  ) => _ffi.CompressData(
    data.asNativePointer(),
    dataSize,
    compDataSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RUnsignedChar> DecompressData(
    MemoryPointer<RUnsignedChar> compData,
    int compDataSize,
    MemoryPointer<RInt> dataSize,
  ) => _ffi.DecompressData(
    compData.asNativePointer(),
    compDataSize,
    dataSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> EncodeDataBase64(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
    MemoryPointer<RInt> outputSize,
  ) => _ffi.EncodeDataBase64(
    data.asNativePointer(),
    dataSize,
    outputSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RUnsignedChar> DecodeDataBase64(
    MemoryPointer<RChar> data,
    MemoryPointer<RInt> outputSize,
  ) => _ffi.DecodeDataBase64(
    data.asNativePointer(),
    outputSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  int ComputeCRC32(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => _ffi.ComputeCRC32(
    data.asNativePointer(),
    dataSize,
  );

  @override
  NativeMemoryPointer<RUnsignedInt> ComputeMD5(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => _ffi.ComputeMD5(
    data.asNativePointer(),
    dataSize,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RUnsignedInt> ComputeSHA1(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => _ffi.ComputeSHA1(
    data.asNativePointer(),
    dataSize,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RUnsignedInt> ComputeSHA256(
    MemoryPointer<RUnsignedChar> data,
    int dataSize,
  ) => _ffi.ComputeSHA256(
    data.asNativePointer(),
    dataSize,
  ).asMemoryPointer();

  @override
  AutomationEventListD LoadAutomationEventList(
    MemoryPointer<RChar> fileName,
  ) => $.AutomationEventList$.RefCapture(
    RaylibCaptureIds.LoadAutomationEventList,
    (p) => _ffi.LoadAutomationEventList(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  void UnloadAutomationEventList(
    AutomationEventListD list,
  ) => disposeStructWithOpFreed(list, (ptr) {
    _ffi.UnloadAutomationEventList(
      ptr.asNativePointer<AutomationEventListC>().ref,
    );
  });

  @override
  bool ExportAutomationEventList(
    AutomationEventListD list,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportAutomationEventList(
    $.AutomationEventList$.Ref1(list).asNativePointer<AutomationEventListC>().ref,
    fileName.asNativePointer(),
  );

  @override
  void SetAutomationEventList(
    StructPointer<AutomationEventListD> list,
  ) => _ffi.SetAutomationEventList(
    list.asNativePointer(),
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
    AutomationEventD event,
  ) => _ffi.PlayAutomationEvent(
    $.AutomationEvent$.Ref1(event).asNativePointer<AutomationEventC>().ref,
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
  NativeMemoryPointer<RChar> GetKeyName(
    int key,
  ) => _ffi.GetKeyName(
    key,
  ).asMemoryPointer();

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
  NativeMemoryPointer<RChar> GetGamepadName(
    int gamepad,
  ) => _ffi.GetGamepadName(
    gamepad,
  ).asMemoryPointer();

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
    MemoryPointer<RChar> mappings,
  ) => _ffi.SetGamepadMappings(
    mappings.asNativePointer(),
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
  Vector2D GetMousePosition() => $.Vector2$.Extract1(
    (p) => _ffi.GetMousePosition().toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetMouseDelta() => $.Vector2$.Extract1(
    (p) => _ffi.GetMouseDelta().toDart(p.asNativePointer()),
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
  Vector2D GetMouseWheelMoveV() => $.Vector2$.Extract1(
    (p) => _ffi.GetMouseWheelMoveV().toDart(p.asNativePointer()),
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
  Vector2D GetTouchPosition(
    int index,
  ) => $.Vector2$.Extract1(
    (p) => _ffi.GetTouchPosition(
      index,
    ).toDart(p.asNativePointer()),
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
  Vector2D GetGestureDragVector() => $.Vector2$.Extract1(
    (p) => _ffi.GetGestureDragVector().toDart(p.asNativePointer()),
  );

  @override
  double GetGestureDragAngle() => _ffi.GetGestureDragAngle();

  @override
  Vector2D GetGesturePinchVector() => $.Vector2$.Extract1(
    (p) => _ffi.GetGesturePinchVector().toDart(p.asNativePointer()),
  );

  @override
  double GetGesturePinchAngle() => _ffi.GetGesturePinchAngle();

  @override
  void ProcessGestureEvent(
    GestureEventD event,
  ) => _ffi.ProcessGestureEvent(
    $.GestureEvent$.Ref1(event).asNativePointer<GestureEventC>().ref,
  );

  @override
  void UpdateGestures() => _ffi.UpdateGestures();

  @override
  void UpdateCamera(
    StructPointer<Camera3DD> camera,
    int mode,
  ) => _ffi.UpdateCamera(
    camera.asNativePointer(),
    mode,
  );

  @override
  void UpdateCameraPro(
    StructPointer<Camera3DD> camera,
    Vector3D movement,
    Vector3D rotation,
    double zoom,
  ) => _ffi.UpdateCameraPro(
    camera.asNativePointer(),
    $.Vector3$.Ref1(movement).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(rotation).asNativePointer<Vector3C>().ref,
    zoom,
  );

  @override
  void SetShapesTexture(
    TextureD texture,
    RectangleD source,
  ) => _ffi.SetShapesTexture(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
  );

  @override
  TextureD GetShapesTexture() => $.Texture$.Extract1(
    (p) => _ffi.GetShapesTexture().toDart(p.asNativePointer()),
  );

  @override
  RectangleD GetShapesTextureRectangle() => $.Rectangle$.Extract1(
    (p) => _ffi.GetShapesTextureRectangle().toDart(p.asNativePointer()),
  );

  @override
  void DrawPixel(
    int posX,
    int posY,
    ColorD color,
  ) => _ffi.DrawPixel(
    posX,
    posY,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPixelV(
    Vector2D position,
    ColorD color,
  ) => _ffi.DrawPixelV(
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLine(
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    ColorD color,
  ) => _ffi.DrawLine(
    startPosX,
    startPosY,
    endPosX,
    endPosY,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  ) => _ffi.DrawLineV(
    $.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineEx(
    Vector2D startPos,
    Vector2D endPos,
    double thick,
    ColorD color,
  ) => _ffi.DrawLineEx(
    $.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineStrip(
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => _ffi.DrawLineStrip(
    points.asNativePointer(),
    pointCount,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    double thick,
    ColorD color,
  ) => _ffi.DrawLineBezier(
    $.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawLineDashed(
    Vector2D startPos,
    Vector2D endPos,
    int dashSize,
    int spaceSize,
    ColorD color,
  ) => _ffi.DrawLineDashed(
    $.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
    dashSize,
    spaceSize,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircle(
    int centerX,
    int centerY,
    double radius,
    ColorD color,
  ) => _ffi.DrawCircle(
    centerX,
    centerY,
    radius,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleSector(
    Vector2D center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  ) => _ffi.DrawCircleSector(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    startAngle,
    endAngle,
    segments,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleSectorLines(
    Vector2D center,
    double radius,
    double startAngle,
    double endAngle,
    int segments,
    ColorD color,
  ) => _ffi.DrawCircleSectorLines(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    startAngle,
    endAngle,
    segments,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleGradient(
    Vector2D center,
    double radius,
    ColorD inner,
    ColorD outer,
  ) => _ffi.DrawCircleGradient(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    $.Color$.Ref1(inner).asNativePointer<ColorC>().ref,
    $.Color$.Ref2(outer).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleV(
    Vector2D center,
    double radius,
    ColorD color,
  ) => _ffi.DrawCircleV(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleLines(
    int centerX,
    int centerY,
    double radius,
    ColorD color,
  ) => _ffi.DrawCircleLines(
    centerX,
    centerY,
    radius,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircleLinesV(
    Vector2D center,
    double radius,
    ColorD color,
  ) => _ffi.DrawCircleLinesV(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawEllipse(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    ColorD color,
  ) => _ffi.DrawEllipse(
    centerX,
    centerY,
    radiusH,
    radiusV,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawEllipseV(
    Vector2D center,
    double radiusH,
    double radiusV,
    ColorD color,
  ) => _ffi.DrawEllipseV(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radiusH,
    radiusV,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawEllipseLines(
    int centerX,
    int centerY,
    double radiusH,
    double radiusV,
    ColorD color,
  ) => _ffi.DrawEllipseLines(
    centerX,
    centerY,
    radiusH,
    radiusV,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawEllipseLinesV(
    Vector2D center,
    double radiusH,
    double radiusV,
    ColorD color,
  ) => _ffi.DrawEllipseLinesV(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radiusH,
    radiusV,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
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
  ) => _ffi.DrawRing(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    innerRadius,
    outerRadius,
    startAngle,
    endAngle,
    segments,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
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
  ) => _ffi.DrawRingLines(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    innerRadius,
    outerRadius,
    startAngle,
    endAngle,
    segments,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangle(
    int posX,
    int posY,
    int width,
    int height,
    ColorD color,
  ) => _ffi.DrawRectangle(
    posX,
    posY,
    width,
    height,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => _ffi.DrawRectangleV(
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(size).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  ) => _ffi.DrawRectangleRec(
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectanglePro(
    RectangleD rec,
    Vector2D origin,
    double rotation,
    ColorD color,
  ) => _ffi.DrawRectanglePro(
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    $.Vector2$.Ref1(origin).asNativePointer<Vector2C>().ref,
    rotation,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleGradientV(
    int posX,
    int posY,
    int width,
    int height,
    ColorD top,
    ColorD bottom,
  ) => _ffi.DrawRectangleGradientV(
    posX,
    posY,
    width,
    height,
    $.Color$.Ref1(top).asNativePointer<ColorC>().ref,
    $.Color$.Ref2(bottom).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleGradientH(
    int posX,
    int posY,
    int width,
    int height,
    ColorD left,
    ColorD right,
  ) => _ffi.DrawRectangleGradientH(
    posX,
    posY,
    width,
    height,
    $.Color$.Ref1(left).asNativePointer<ColorC>().ref,
    $.Color$.Ref2(right).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleGradientEx(
    RectangleD rec,
    ColorD topLeft,
    ColorD bottomLeft,
    ColorD topRight,
    ColorD bottomRight,
  ) => _ffi.DrawRectangleGradientEx(
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    $.Color$.Ref1(topLeft).asNativePointer<ColorC>().ref,
    $.Color$.Ref2(bottomLeft).asNativePointer<ColorC>().ref,
    $.Color$.Ref3(topRight).asNativePointer<ColorC>().ref,
    $.Color$.Ref4(bottomRight).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleLines(
    int posX,
    int posY,
    int width,
    int height,
    ColorD color,
  ) => _ffi.DrawRectangleLines(
    posX,
    posY,
    width,
    height,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleLinesEx(
    RectangleD rec,
    double lineThick,
    ColorD color,
  ) => _ffi.DrawRectangleLinesEx(
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    lineThick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleRounded(
    RectangleD rec,
    double roundness,
    int segments,
    ColorD color,
  ) => _ffi.DrawRectangleRounded(
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    roundness,
    segments,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleRoundedLines(
    RectangleD rec,
    double roundness,
    int segments,
    ColorD color,
  ) => _ffi.DrawRectangleRoundedLines(
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    roundness,
    segments,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRectangleRoundedLinesEx(
    RectangleD rec,
    double roundness,
    int segments,
    double lineThick,
    ColorD color,
  ) => _ffi.DrawRectangleRoundedLinesEx(
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    roundness,
    segments,
    lineThick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangle(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => _ffi.DrawTriangle(
    $.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangleLines(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => _ffi.DrawTriangleLines(
    $.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangleFan(
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => _ffi.DrawTriangleFan(
    points.asNativePointer(),
    pointCount,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref
  );

  @override
  void DrawTriangleStrip(
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => _ffi.DrawTriangleStrip(
    points.asNativePointer(),
    pointCount,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref
  );

  @override
  void DrawPoly(
    Vector2D center,
    int sides,
    double radius,
    double rotation,
    ColorD color,
  ) => _ffi.DrawPoly(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    sides,
    radius,
    rotation,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPolyLines(
    Vector2D center,
    int sides,
    double radius,
    double rotation,
    ColorD color,
  ) => _ffi.DrawPolyLines(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    sides,
    radius,
    rotation,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPolyLinesEx(
    Vector2D center,
    int sides,
    double radius,
    double rotation,
    double lineThick,
    ColorD color,
  ) => _ffi.DrawPolyLinesEx(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    sides,
    radius,
    rotation,
    lineThick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineLinear(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineLinear(
    points.asNativePointer(),
    pointCount,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineBasis(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineBasis(
    points.asNativePointer(),
    pointCount,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineCatmullRom(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineCatmullRom(
    points.asNativePointer(),
    pointCount, 
    thick, 
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineBezierQuadratic(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineBezierQuadratic(
    points.asNativePointer(),
    pointCount,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineBezierCubic(
    StructPointer<Vector2D> points,
    int pointCount,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineBezierCubic(
    points.asNativePointer(),
    pointCount,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineSegmentLinear(
    $.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineSegmentBasis(
    $.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineSegmentCatmullRom(
    $.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineSegmentBezierQuadratic(
    $.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(c2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    double thick,
    ColorD color,
  ) => _ffi.DrawSplineSegmentBezierCubic(
    $.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(c2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(c3).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  Vector2D GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    double t,
  ) => $.Vector2$.Extract3(
    (p) => _ffi.GetSplinePointLinear(
      $.Vector2$.Ref1(startPos).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref2(endPos).asNativePointer<Vector2C>().ref,
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
  ) => $.Vector2$.Extract5(
    (p) => _ffi.GetSplinePointBasis(
      $.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
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
  ) => $.Vector2$.Extract5(
    (p) => _ffi.GetSplinePointCatmullRom(
      $.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref2(p2).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector2D GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    double t,
  ) => $.Vector2$.Extract4(
    (p) => _ffi.GetSplinePointBezierQuad(
      $.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref2(c2).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref3(p3).asNativePointer<Vector2C>().ref,
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
  ) => $.Vector2$.Extract5(
    (p) => _ffi.GetSplinePointBezierCubic(
      $.Vector2$.Ref1(p1).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref2(c2).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref3(c3).asNativePointer<Vector2C>().ref,
      $.Vector2$.Ref4(p4).asNativePointer<Vector2C>().ref,
      t,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  ) => _ffi.CheckCollisionRecs(
    $.Rectangle$.Ref1(rec1).asNativePointer<RectangleC>().ref,
    $.Rectangle$.Ref2(rec2).asNativePointer<RectangleC>().ref,
  );

  @override
  bool CheckCollisionCircles(
    Vector2D center1,
    double radius1,
    Vector2D center2,
    double radius2,
  ) => _ffi.CheckCollisionCircles(
    $.Vector2$.Ref1(center1).asNativePointer<Vector2C>().ref,
    radius1,
    $.Vector2$.Ref2(center2).asNativePointer<Vector2C>().ref,
    radius2,
  );

  @override
  bool CheckCollisionCircleRec(
    Vector2D center,
    double radius,
    RectangleD rec,
  ) => _ffi.CheckCollisionCircleRec(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
  );

  @override
  bool CheckCollisionCircleLine(
    Vector2D center,
    double radius,
    Vector2D p1,
    Vector2D p2,
  ) => _ffi.CheckCollisionCircleLine(
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    $.Vector2$.Ref2(p1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(p2).asNativePointer<Vector2C>().ref,
  );

  @override
  bool CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  ) => _ffi.CheckCollisionPointRec(
    $.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
  );

  @override
  bool CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    double radius,
  ) => _ffi.CheckCollisionPointCircle(
    $.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(center).asNativePointer<Vector2C>().ref,
    radius,
  );

  @override
  bool CheckCollisionPointTriangle(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
  ) => _ffi.CheckCollisionPointTriangle(
    $.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(p1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(p2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref4(p3).asNativePointer<Vector2C>().ref,
  );

  @override
  bool CheckCollisionPointLine(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    int threshold,
  ) => _ffi.CheckCollisionPointLine(
    $.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(p1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(p2).asNativePointer<Vector2C>().ref,
    threshold,
  );

  @override
  bool CheckCollisionPointPoly(
    Vector2D point,
    StructPointer<Vector2D> points,
    int pointCount,
  ) => _ffi.CheckCollisionPointPoly(
    $.Vector2$.Ref1(point).asNativePointer<Vector2C>().ref,
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
  ) => _ffi.CheckCollisionLines(
    $.Vector2$.Ref1(startPos1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(endPos1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(startPos2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref4(endPos2).asNativePointer<Vector2C>().ref,
    collisionPoint.asNativePointer(),
  );

  @override
  RectangleD GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  ) => $.Rectangle$.Extract3(
    (p) => _ffi.GetCollisionRec(
      $.Rectangle$.Ref1(rec1).asNativePointer<RectangleC>().ref,
      $.Rectangle$.Ref2(rec2).asNativePointer<RectangleC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImage(
    MemoryPointer<RChar> fileName,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.LoadImage,
    (p) => _ffi.LoadImage(
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
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.LoadImageRaw,
    (p) => _ffi.LoadImageRaw(
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
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.LoadImageAnim,
    (p) => _ffi.LoadImageAnim(
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
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.LoadImageAnimFromMemory,
    (p) => _ffi.LoadImageAnimFromMemory(
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
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromMemory,
    (p) => _ffi.LoadImageFromMemory(
      fileType.asNativePointer(),
      fileData.asNativePointer(),
      dataSize,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImageFromTexture(
    TextureD texture,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromTexture,
    (p) => _ffi.LoadImageFromTexture(
      $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD LoadImageFromScreen() => $.Image$.RefCapture(
    RaylibCaptureIds.LoadImageFromScreen,
    (p) => _ffi.LoadImageFromScreen().toDart(p.asNativePointer()),
  );

  @override
  bool IsImageValid(
    ImageD image,
  ) => _ffi.IsImageValid(
    $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
  );

  @override
  void UnloadImage(
    ImageD image,
  ) => _ffi.UnloadImage(
    $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
  );

  @override
  bool ExportImage(
    ImageD image,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportImage(
    $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    fileName.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RUnsignedChar> ExportImageToMemory(
    ImageD image,
    MemoryPointer<RChar> fileType,
    MemoryPointer<RInt> fileSize,
  ) => _ffi.ExportImageToMemory(
    $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    fileType.asNativePointer(),
    fileSize.asNativePointer(),
  ).asMemoryPointer();

  @override
  bool ExportImageAsCode(
    ImageD image,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportImageAsCode(
    $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    fileName.asNativePointer(),
  );

  @override
  ImageD GenImageColor(
    int width,
    int height,
    ColorD color,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImageColor,
    (p) => _ffi.GenImageColor(
      width,
      height,
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageGradientLinear(
    int width,
    int height,
    int direction,
    ColorD start,
    ColorD end,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImageGradientLinear,
    (p) => _ffi.GenImageGradientLinear(
      width,
      height,
      direction,
      $.Color$.Ref1(start).asNativePointer<ColorC>().ref,
      $.Color$.Ref2(end).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageGradientRadial(
    int width,
    int height,
    double density,
    ColorD inner,
    ColorD outer,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImageGradientRadial,
    (p) => _ffi.GenImageGradientRadial(
      width,
      height,
      density,
      $.Color$.Ref1(inner).asNativePointer<ColorC>().ref,
      $.Color$.Ref2(outer).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageGradientSquare(
    int width,
    int height,
    double density,
    ColorD inner,
    ColorD outer,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImageGradientSquare,
    (p) => _ffi.GenImageGradientSquare(
      width,
      height,
      density,
      $.Color$.Ref1(inner).asNativePointer<ColorC>().ref,
      $.Color$.Ref2(outer).asNativePointer<ColorC>().ref,
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
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImageChecked,
    (p) => _ffi.GenImageChecked(
      width,
      height,
      checksX,
      checksY,
      $.Color$.Ref1(col1).asNativePointer<ColorC>().ref,
      $.Color$.Ref2(col2).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD GenImageWhiteNoise(
    int width,
    int height,
    double factor,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImageWhiteNoise,
    (p) => _ffi.GenImageWhiteNoise(
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
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImagePerlinNoise,
    (p) => _ffi.GenImagePerlinNoise(
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
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImageCellular,
    (p) => _ffi.GenImageCellular(
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
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImageText,
    (p) => _ffi.GenImageText(
      width,
      height,
      text.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageCopy(
    ImageD image,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.ImageCopy,
    (p) => _ffi.ImageCopy(
      $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageFromImage(
    ImageD image,
    RectangleD rec,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.ImageFromImage,
    (p) => _ffi.ImageFromImage(
      $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageFromChannel(
    ImageD image,
    int selectedChannel,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.ImageFromChannel,
    (p) => _ffi.ImageFromChannel(
      $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      selectedChannel,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageText(
    MemoryPointer<RChar> text,
    int fontSize,
    ColorD color,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.ImageText,
    (p) => _ffi.ImageText(
      text.asNativePointer(),
      fontSize,
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ImageD ImageTextEx(
    FontD font,
    MemoryPointer<RChar> text,
    double fontSize,
    double spacing,
    ColorD tint,
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.ImageTextEx,
    (p) => _ffi.ImageTextEx(
      $.Font$.Ref1(font).asNativePointer<FontC>().ref,
      text.asNativePointer(),
      fontSize,
      spacing,
      $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void ImageFormat(
    StructPointer<ImageD> image,
    int newFormat,
  ) => _ffi.ImageFormat(
    image.asNativePointer(),
    newFormat,
  );

  @override
  void ImageToPOT(
    StructPointer<ImageD> image,
    ColorD fill,
  ) => _ffi.ImageToPOT(
    image.asNativePointer(),
    $.Color$.Ref1(fill).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageCrop(
    StructPointer<ImageD> image,
    RectangleD crop,
  ) => _ffi.ImageCrop(
    image.asNativePointer(),
    $.Rectangle$.Ref1(crop).asNativePointer<RectangleC>().ref,
  );

  @override
  void ImageAlphaCrop(
    StructPointer<ImageD> image,
    double threshold,
  ) => _ffi.ImageAlphaCrop(
    image.asNativePointer(),
    threshold,
  );

  @override
  void ImageAlphaClear(
    StructPointer<ImageD> image,
    ColorD color,
    double threshold,
  ) => _ffi.ImageAlphaClear(
    image.asNativePointer(),
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    threshold,
  );

  @override
  void ImageAlphaMask(
    StructPointer<ImageD> image,
    ImageD alphaMask,
  ) => _ffi.ImageAlphaMask(
    image.asNativePointer(),
    $.Image$.Ref2(alphaMask).asNativePointer<ImageC>().ref,
  );

  @override
  void ImageAlphaPremultiply(
    StructPointer<ImageD> image,
  ) => _ffi.ImageAlphaPremultiply(
    image.asNativePointer(),
  );

  @override
  void ImageBlurGaussian(
    StructPointer<ImageD> image,
    int blurSize,
  ) => _ffi.ImageBlurGaussian(
    image.asNativePointer(),
    blurSize,
  );

  @override
  void ImageKernelConvolution(
    StructPointer<ImageD> image,
    MemoryPointer<RFloat> kernel,
    int kernelSize,
  ) => _ffi.ImageKernelConvolution(
    image.asNativePointer(),
    kernel.asNativePointer(),
    kernelSize,
  );

  @override
  void ImageResize(
    StructPointer<ImageD> image,
    int newWidth,
    int newHeight,
  ) => _ffi.ImageResize(
    image.asNativePointer(),
    newWidth,
    newHeight,
  );

  @override
  void ImageResizeNN(
    StructPointer<ImageD> image,
    int newWidth,
    int newHeight,
  ) => _ffi.ImageResizeNN(
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
  ) => _ffi.ImageResizeCanvas(
    image.asNativePointer(),
    newWidth,
    newHeight,
    offsetX,
    offsetY,
    $.Color$.Ref1(fill).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageMipmaps(
    StructPointer<ImageD> image,
  ) => _ffi.ImageMipmaps(
    image.asNativePointer(),
  );

  @override
  void ImageDither(
    StructPointer<ImageD> image,
    int rBpp,
    int gBpp,
    int bBpp,
    int aBpp,
  ) => _ffi.ImageDither(
    image.asNativePointer(),
    rBpp,
    gBpp,
    bBpp,
    aBpp,
  );

  @override
  void ImageFlipVertical(
    StructPointer<ImageD> image,
  ) => _ffi.ImageFlipVertical(
    image.asNativePointer(),
  );

  @override
  void ImageFlipHorizontal(
    StructPointer<ImageD> image,
  ) => _ffi.ImageFlipHorizontal(
    image.asNativePointer(),
  );

  @override
  void ImageRotate(
    StructPointer<ImageD> image,
    int degrees,
  ) => _ffi.ImageRotate(
    image.asNativePointer(),
    degrees,
  );

  @override
  void ImageRotateCW(
    StructPointer<ImageD> image,
  ) => _ffi.ImageRotateCW(
    image.asNativePointer(),
  );

  @override
  void ImageRotateCCW(
    StructPointer<ImageD> image,
  ) => _ffi.ImageRotateCCW(
    image.asNativePointer(),
  );

  @override
  void ImageColorTint(
    StructPointer<ImageD> image,
    ColorD color,
  ) => _ffi.ImageColorTint(
    image.asNativePointer(),
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageColorInvert(
    StructPointer<ImageD> image,
  ) => _ffi.ImageColorInvert(
    image.asNativePointer(),
  );

  @override
  void ImageColorGrayscale(
    StructPointer<ImageD> image,
  ) => _ffi.ImageColorGrayscale(
    image.asNativePointer(),
  );

  @override
  void ImageColorContrast(
    StructPointer<ImageD> image,
    double contrast,
  ) => _ffi.ImageColorContrast(
    image.asNativePointer(),
    contrast,
  );

  @override
  void ImageColorBrightness(
    StructPointer<ImageD> image,
    int brightness,
  ) => _ffi.ImageColorBrightness(
    image.asNativePointer(),
    brightness,
  );

  @override
  void ImageColorReplace(
    StructPointer<ImageD> image,
    ColorD color,
    ColorD replace,
  ) => _ffi.ImageColorReplace(
    image.asNativePointer(),
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    $.Color$.Ref2(replace).asNativePointer<ColorC>().ref,
  );

  @override
  StructPointer<ColorD> LoadImageColors(
    ImageD image,
  ) => ColorD.struct.ptr(_ffi.LoadImageColors(
    $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
  ).asMemoryPointer());

  @override
  StructPointer<ColorD> LoadImagePalette(
    ImageD image,
    int maxPaletteSize,
    MemoryPointer<RInt> colorCount,
  ) => ColorD.struct.ptr(_ffi.LoadImagePalette(
    $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    maxPaletteSize,
    colorCount.asNativePointer(),
  ).asMemoryPointer());

  @override
  void UnloadImageColors(
    StructPointer<ColorD> colors,
  ) => _ffi.UnloadImageColors(
    colors.asNativePointer(),
  );

  @override
  void UnloadImagePalette(
    StructPointer<ColorD> colors,
  ) => _ffi.UnloadImagePalette(
    colors.asNativePointer(),
  );

  @override
  RectangleD GetImageAlphaBorder(
    ImageD image,
    double threshold,
  ) => $.Rectangle$.Extract1(
    (p) => _ffi.GetImageAlphaBorder(
      $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      threshold,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD GetImageColor(
    ImageD image,
    int x,
    int y,
  ) => $.Color$.Extract1(
    (p) => _ffi.GetImageColor(
      $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      x,
      y,
    ).toDart(p.asNativePointer()),
  );

  @override
  void ImageClearBackground(
    StructPointer<ImageD> dst,
    ColorD color,
  ) => _ffi.ImageClearBackground(
    dst.asNativePointer(),
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawPixel(
    StructPointer<ImageD> dst,
    int posX,
    int posY,
    ColorD color,
  ) => _ffi.ImageDrawPixel(
    dst.asNativePointer(),
    posX,
    posY,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawPixelV(
    StructPointer<ImageD> dst,
    Vector2D position,
    ColorD color,
  ) => _ffi.ImageDrawPixelV(
    dst.asNativePointer(),
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawLine(
    StructPointer<ImageD> dst,
    int startPosX,
    int startPosY,
    int endPosX,
    int endPosY,
    ColorD color,
  ) => _ffi.ImageDrawLine(
    dst.asNativePointer(),
    startPosX,
    startPosY,
    endPosX,
    endPosY,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawLineV(
    StructPointer<ImageD> dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  ) => _ffi.ImageDrawLineV(
    dst.asNativePointer(),
    $.Vector2$.Ref1(start).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(end).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawLineEx(
    StructPointer<ImageD> dst,
    Vector2D start,
    Vector2D end,
    int thick,
    ColorD color,
  ) => _ffi.ImageDrawLineEx(
    dst.asNativePointer(),
    $.Vector2$.Ref1(start).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(end).asNativePointer<Vector2C>().ref,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawCircle(
    StructPointer<ImageD> dst,
    int centerX,
    int centerY,
    int radius,
    ColorD color,
  ) => _ffi.ImageDrawCircle(
    dst.asNativePointer(),
    centerX,
    centerY,
    radius,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawCircleV(
    StructPointer<ImageD> dst,
    Vector2D center,
    int radius,
    ColorD color,
  ) => _ffi.ImageDrawCircleV(
    dst.asNativePointer(),
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawCircleLines(
    StructPointer<ImageD> dst,
    int centerX,
    int centerY,
    int radius,
    ColorD color,
  ) => _ffi.ImageDrawCircleLines(
    dst.asNativePointer(),
    centerX,
    centerY,
    radius,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawCircleLinesV(
    StructPointer<ImageD> dst,
    Vector2D center,
    int radius,
    ColorD color,
  ) => _ffi.ImageDrawCircleLinesV(
    dst.asNativePointer(),
    $.Vector2$.Ref1(center).asNativePointer<Vector2C>().ref,
    radius,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawRectangle(
    StructPointer<ImageD> dst,
    int posX,
    int posY,
    int width,
    int height,
    ColorD color,
  ) => _ffi.ImageDrawRectangle(
    dst.asNativePointer(),
    posX,
    posY,
    width,
    height,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawRectangleV(
    StructPointer<ImageD> dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => _ffi.ImageDrawRectangleV(
    dst.asNativePointer(),
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(size).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawRectangleRec(
    StructPointer<ImageD> dst,
    RectangleD rec,
    ColorD color,
  ) => _ffi.ImageDrawRectangleRec(
    dst.asNativePointer(),
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawRectangleLines(
    StructPointer<ImageD> dst,
    RectangleD rec,
    int thick,
    ColorD color,
  ) => _ffi.ImageDrawRectangleLines(
    dst.asNativePointer(),
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    thick,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTriangle(
    StructPointer<ImageD> dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => _ffi.ImageDrawTriangle(
    dst.asNativePointer(),
    $.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
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
  ) => _ffi.ImageDrawTriangleEx(
    dst.asNativePointer(),
    $.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(c1).asNativePointer<ColorC>().ref,
    $.Color$.Ref2(c2).asNativePointer<ColorC>().ref,
    $.Color$.Ref3(c3).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleLines(
    StructPointer<ImageD> dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => _ffi.ImageDrawTriangleLines(
    dst.asNativePointer(),
    $.Vector2$.Ref1(v1).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(v2).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref3(v3).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleFan(
    StructPointer<ImageD> dst,
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => _ffi.ImageDrawTriangleFan(
    dst.asNativePointer(),
    points.asNativePointer(),
    pointCount,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawTriangleStrip(
    StructPointer<ImageD> dst,
    StructPointer<Vector2D> points,
    int pointCount,
    ColorD color,
  ) => _ffi.ImageDrawTriangleStrip(
    dst.asNativePointer(),
    points.asNativePointer(),
    pointCount,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDraw(
    StructPointer<ImageD> dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  ) => _ffi.ImageDraw(
    dst.asNativePointer(),
    $.Image$.Ref2(src).asNativePointer<ImageC>().ref,
    $.Rectangle$.Ref1(srcRec).asNativePointer<RectangleC>().ref,
    $.Rectangle$.Ref2(dstRec).asNativePointer<RectangleC>().ref,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void ImageDrawText(
    StructPointer<ImageD> dst,
    MemoryPointer<RChar> text,
    int posX,
    int posY,
    int fontSize,
    ColorD color,
  ) => _ffi.ImageDrawText(
    dst.asNativePointer(),
    text.asNativePointer(),
    posX,
    posY,
    fontSize,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
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
  ) => _ffi.ImageDrawTextEx(
    dst.asNativePointer(),
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
    text.asNativePointer(),
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    fontSize,
    spacing,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  TextureD LoadTexture(
    MemoryPointer<RChar> fileName,
  ) => $.Texture$.RefCapture(
    RaylibCaptureIds.LoadTexture,
    (p) => _ffi.LoadTexture(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  TextureD LoadTextureFromImage(
    ImageD image,
  ) => $.Texture$.RefCapture(
    RaylibCaptureIds.LoadTextureFromImage,
    (p) => _ffi.LoadTextureFromImage(
      $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  TextureD LoadTextureCubemap(
    ImageD image,
    int layout,
  ) => $.Texture$.RefCapture(
    RaylibCaptureIds.LoadTextureCubemap,
    (p) => _ffi.LoadTextureCubemap(
      $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      layout,
    ).toDart(p.asNativePointer()),
  );

  @override
  RenderTextureD LoadRenderTexture(
    int width,
    int height,
  ) => $.RenderTexture$.RefCapture(
    RaylibCaptureIds.LoadRenderTexture,
    (p) => _ffi.LoadRenderTexture(
      width,
      height,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool IsTextureValid(
    TextureD texture,
  ) => _ffi.IsTextureValid(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
  );

  @override
  void UnloadTexture(
    TextureD texture,
  ) => _ffi.UnloadTexture(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
  );

  @override
  bool IsRenderTextureValid(
    RenderTextureD target,
  ) => _ffi.IsRenderTextureValid(
    $.RenderTexture$.Ref1(target).asNativePointer<RenderTextureC>().ref,
  );

  @override
  void UnloadRenderTexture(
    RenderTextureD target,
  ) => _ffi.UnloadRenderTexture(
    $.RenderTexture$.Ref1(target).asNativePointer<RenderTextureC>().ref,
  );

  @override
  void UpdateTexture(
    TextureD texture,
    MemoryPointer<RVoid> pixels,
  ) => _ffi.UpdateTexture(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    pixels.asNativePointer(),
  );

  @override
  void UpdateTextureRec(
    TextureD texture,
    RectangleD rec,
    MemoryPointer<RVoid> pixels,
  ) => _ffi.UpdateTextureRec(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.Rectangle$.Ref1(rec).asNativePointer<RectangleC>().ref,
    pixels.asNativePointer(),
  );

  @override
  void GenTextureMipmaps(
    StructPointer<TextureD> texture,
  ) => _ffi.GenTextureMipmaps(
    texture.asNativePointer(),
  );

  @override
  void SetTextureFilter(
    TextureD texture,
    int filter,
  ) => _ffi.SetTextureFilter(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    filter,
  );

  @override
  void SetTextureWrap(
    TextureD texture,
    int wrap,
  ) => _ffi.SetTextureWrap(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    wrap,
  );

  @override
  void DrawTexture(
    TextureD texture,
    int posX,
    int posY,
    ColorD tint,
  ) => _ffi.DrawTexture(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    posX,
    posY,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextureV(
    TextureD texture,
    Vector2D position,
    ColorD tint,
  ) => _ffi.DrawTextureV(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextureEx(
    TextureD texture,
    Vector2D position,
    double rotation,
    double scale,
    ColorD tint,
  ) => _ffi.DrawTextureEx(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    rotation,
    scale,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextureRec(
    TextureD texture,
    RectangleD source,
    Vector2D position,
    ColorD tint,
  ) => _ffi.DrawTextureRec(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTexturePro(
    TextureD texture,
    RectangleD source,
    RectangleD dest,
    Vector2D origin,
    double rotation,
    ColorD tint,
  ) => _ffi.DrawTexturePro(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
    $.Rectangle$.Ref2(dest).asNativePointer<RectangleC>().ref,
    $.Vector2$.Ref1(origin).asNativePointer<Vector2C>().ref,
    rotation,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextureNPatch(
    TextureD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    double rotation,
    ColorD tint,
  ) => _ffi.DrawTextureNPatch(
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.NPatchInfo$.Ref1(nPatchInfo).asNativePointer<NPatchInfoC>().ref,
    $.Rectangle$.Ref1(dest).asNativePointer<RectangleC>().ref,
    $.Vector2$.Ref1(origin).asNativePointer<Vector2C>().ref,
    rotation,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  bool ColorIsEqual(
    ColorD col1,
    ColorD col2,
  ) => _ffi.ColorIsEqual(
    $.Color$.Ref1(col1).asNativePointer<ColorC>().ref,
    $.Color$.Ref2(col2).asNativePointer<ColorC>().ref,
  );

  @override
  ColorD Fade(
    ColorD color,
    double alpha,
  ) => $.Color$.Extract2(
    (p) => _ffi.Fade(
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      alpha,
    ).toDart(p.asNativePointer()),
  );

  @override
  int ColorToInt(
    ColorD color,
  ) => _ffi.ColorToInt(
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  Vector4D ColorNormalize(
    ColorD color,
  ) => $.Vector4$.Extract1(
    (p) => _ffi.ColorNormalize(
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorFromNormalized(
    Vector4D normalized,
  ) => $.Color$.Extract1(
    (p) => _ffi.ColorFromNormalized(
      $.Vector4$.Ref1(normalized).asNativePointer<Vector4C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  Vector3D ColorToHSV(
    ColorD color,
  ) => $.Vector3$.Extract1(
    (p) => _ffi.ColorToHSV(
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorFromHSV(
    double hue,
    double saturation,
    double value,
  ) => $.Color$.Extract1(
    (p) => _ffi.ColorFromHSV(
      hue,
      saturation,
      value,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorTint(
    ColorD color,
    ColorD tint,
  ) => $.Color$.Extract3(
    (p) => _ffi.ColorTint(
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      $.Color$.Ref2(tint).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorBrightness(
    ColorD color,
    double factor,
  ) => $.Color$.Extract2(
    (p) => _ffi.ColorBrightness(
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      factor,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorContrast(
    ColorD color,
    double contrast,
  ) => $.Color$.Extract2(
    (p) => _ffi.ColorContrast(
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      contrast,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorAlpha(
    ColorD color,
    double alpha,
  ) => $.Color$.Extract2(
    (p) => _ffi.ColorAlpha(
      $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
      alpha,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  ) => $.Color$.Extract4(
    (p) => _ffi.ColorAlphaBlend(
      $.Color$.Ref1(dst).asNativePointer<ColorC>().ref,
      $.Color$.Ref2(src).asNativePointer<ColorC>().ref,
      $.Color$.Ref3(tint).asNativePointer<ColorC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD ColorLerp(
    ColorD color1,
    ColorD color2,
    double factor,
  ) => $.Color$.Extract3(
    (p) => _ffi.ColorLerp(
      $.Color$.Ref1(color1).asNativePointer<ColorC>().ref,
      $.Color$.Ref2(color2).asNativePointer<ColorC>().ref,
      factor,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD GetColor(
    int hexValue,
  ) => $.Color$.Extract1(
    (p) => _ffi.GetColor(
      hexValue,
    ).toDart(p.asNativePointer()),
  );

  @override
  ColorD GetPixelColor(
    MemoryPointer<RVoid> srcPtr,
    int format,
  ) => $.Color$.Extract1(
    (p) => _ffi.GetPixelColor(
      srcPtr.asNativePointer(),
      format,
    ).toDart(p.asNativePointer()),
  );

  @override
  void SetPixelColor(
    MemoryPointer<RVoid> dstPtr,
    ColorD color,
    int format,
  ) => _ffi.SetPixelColor(
    dstPtr.asNativePointer(),
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
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
  FontD GetFontDefault() => $.Font$.RefCaptureCached(
    RaylibCaptureIds.GetFontDefault,
    (p) => _ffi.GetFontDefault().toDart(p.asNativePointer()),
  );

  @override
  FontD LoadFont(
    MemoryPointer<RChar> fileName,
  ) => $.Font$.RefCapture(
    RaylibCaptureIds.LoadFont,
    (p) => _ffi.LoadFont(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  FontD LoadFontEx(
    MemoryPointer<RChar> fileName,
    int fontSize,
    MemoryPointer<RInt> codepoints,
    int codepointCount,
  ) => $.Font$.RefCapture(
    RaylibCaptureIds.LoadFontEx,
    (p) => _ffi.LoadFontEx(
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
  ) => $.Font$.RefCapture(
    RaylibCaptureIds.LoadFontFromImage,
    (p) => _ffi.LoadFontFromImage(
      $.Image$.Ref1(image).asNativePointer<ImageC>().ref,
      $.Color$.Ref1(key).asNativePointer<ColorC>().ref,
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
  ) => $.Font$.RefCapture(
    RaylibCaptureIds.LoadFontFromMemory,
    (p) => _ffi.LoadFontFromMemory(
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
  ) => _ffi.IsFontValid(
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
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
  ) => GlyphInfoD.struct.ptr(_ffi.LoadFontData(
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
  ) => $.Image$.RefCapture(
    RaylibCaptureIds.GenImageFontAtlas,
    (p) => _ffi.GenImageFontAtlas(
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
  ) => _ffi.UnloadFontData(
    glyphs.asNativePointer(),
    glyphCount,
  );

  @override
  void UnloadFont(
    FontD font,
  ) => _ffi.UnloadFont(
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
  );

  @override
  bool ExportFontAsCode(
    FontD font,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportFontAsCode(
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
    fileName.asNativePointer(),
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
    MemoryPointer<RChar> text,
    int posX,
    int posY,
    int fontSize,
    ColorD color,
  ) => _ffi.DrawText(
    text.asNativePointer(),
    posX,
    posY,
    fontSize,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextEx(
    FontD font,
    MemoryPointer<RChar> text,
    Vector2D position,
    double fontSize,
    double spacing,
    ColorD tint,
  ) => _ffi.DrawTextEx(
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
    text.asNativePointer(),
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    fontSize,
    spacing,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
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
  ) => _ffi.DrawTextPro(
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
    text.asNativePointer(),
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(origin).asNativePointer<Vector2C>().ref,
    rotation,
    fontSize,
    spacing,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTextCodepoint(
    FontD font,
    int codepoint,
    Vector2D position,
    double fontSize,
    ColorD tint,
  ) => _ffi.DrawTextCodepoint(
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
    codepoint,
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    fontSize,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
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
  ) => _ffi.DrawTextCodepoints(
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
    codepoints.asNativePointer(),
    codepointCount,
    $.Vector2$.Ref1(position).asNativePointer<Vector2C>().ref,
    fontSize,
    spacing,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void SetTextLineSpacing(
    int spacing,
  ) => _ffi.SetTextLineSpacing(
    spacing,
  );

  @override
  int MeasureText(
    MemoryPointer<RChar> text,
    int fontSize,
  ) => _ffi.MeasureText(
    text.asNativePointer(),
    fontSize,
  );

  @override
  Vector2D MeasureTextEx(
    FontD font,
    MemoryPointer<RChar> text,
    double fontSize,
    double spacing,
  ) => $.Vector2$.Extract1(
    (p) => _ffi.MeasureTextEx(
      $.Font$.Ref1(font).asNativePointer<FontC>().ref,
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
  ) => $.Vector2$.Extract1(
    (p) => _ffi.MeasureTextCodepoints(
      $.Font$.Ref1(font).asNativePointer<FontC>().ref,
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
  ) => _ffi.GetGlyphIndex(
    $.Font$.Ref1(font).asNativePointer<FontC>().ref,
    codepoint,
  );

  @override
  GlyphInfoD GetGlyphInfo(
    FontD font,
    int codepoint,
  ) => $.GlyphInfo$.Extract1(
    (p) => _ffi.GetGlyphInfo(
      $.Font$.Ref1(font).asNativePointer<FontC>().ref,
      codepoint,
    ).toDart(p.asNativePointer()),
  );

  @override
  RectangleD GetGlyphAtlasRec(
    FontD font,
    int codepoint,
  ) => $.Rectangle$.Extract1(
    (p) => _ffi.GetGlyphAtlasRec(
      $.Font$.Ref1(font).asNativePointer<FontC>().ref,
      codepoint,
    ).toDart(p.asNativePointer()),
  );

  @override
  NativeMemoryPointer<RChar> LoadUTF8(
    MemoryPointer<RInt> codepoints,
    int length,
  ) => _ffi.LoadUTF8(
    codepoints.asNativePointer(),
    length,
  ).asMemoryPointer();

  @override
  void UnloadUTF8(
    MemoryPointer<RChar> text,
  ) => _ffi.UnloadUTF8(
    text.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RInt> LoadCodepoints(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> count,
  ) => _ffi.LoadCodepoints(
    text.asNativePointer(),
    count.asNativePointer(),
  ).asMemoryPointer();

  @override
  void UnloadCodepoints(
    MemoryPointer<RInt> codepoints,
  ) => _ffi.UnloadCodepoints(
    codepoints.asNativePointer(),
  );

  @override
  int GetCodepointCount(
    MemoryPointer<RChar> text,
  ) => _ffi.GetCodepointCount(
    text.asNativePointer(),
  );

  @override
  int GetCodepoint(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> codepointSize,
  ) => _ffi.GetCodepoint(
    text.asNativePointer(),
    codepointSize.asNativePointer(),
  );

  @override
  int GetCodepointNext(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> codepointSize,
  ) => _ffi.GetCodepointNext(
    text.asNativePointer(),
    codepointSize.asNativePointer(),
  );

  @override
  int GetCodepointPrevious(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> codepointSize,
  ) => _ffi.GetCodepointPrevious(
    text.asNativePointer(),
    codepointSize.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> CodepointToUTF8(
    int codepoint,
    MemoryPointer<RInt> utf8Size,
  ) => _ffi.CodepointToUTF8(
    codepoint,
    utf8Size.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RPointer<RChar>> LoadTextLines(
    MemoryPointer<RChar> text,
    MemoryPointer<RInt> count,
  ) => _ffi.LoadTextLines(
    text.asNativePointer(),
    count.asNativePointer(),
  ).asMemoryPointer();

  @override
  void UnloadTextLines(
    MemoryPointer<RPointer<RChar>> text,
    int lineCount,
  ) => _ffi.UnloadTextLines(
    text.asNativePointer(),
    lineCount,
  );

  @override
  int TextCopy(
    MemoryPointer<RChar> dst,
    MemoryPointer<RChar> src,
  ) => _ffi.TextCopy(
    dst.asNativePointer(),
    src.asNativePointer(),
  );

  @override
  bool TextIsEqual(
    MemoryPointer<RChar> text1,
    MemoryPointer<RChar> text2,
  ) => _ffi.TextIsEqual(
    text1.asNativePointer(),
    text2.asNativePointer(),
  );

  @override
  int TextLength(
    MemoryPointer<RChar> text,
  ) => _ffi.TextLength(
    text.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> TextSubtext(
    MemoryPointer<RChar> text,
    int position,
    int length,
  ) => _ffi.TextSubtext(
    text.asNativePointer(),
    position,
    length
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextRemoveSpaces(
    MemoryPointer<RChar> text,
  ) => _ffi.TextRemoveSpaces(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> GetTextBetween(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> begin,
    MemoryPointer<RChar> end,
  ) => _ffi.GetTextBetween(
    text.asNativePointer(),
    begin.asNativePointer(),
    end.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextReplace(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> replace,
    MemoryPointer<RChar> by,
  ) => _ffi.TextReplace(
    text.asNativePointer(),
    replace.asNativePointer(),
    by.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextReplaceAlloc(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> replace,
    MemoryPointer<RChar> by,
  ) => _ffi.TextReplaceAlloc(
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
  ) => _ffi.TextReplaceBetween(
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
  ) => _ffi.TextReplaceBetweenAlloc(
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
  ) => _ffi.TextInsert(
    text.asNativePointer(),
    insert.asNativePointer(),
    position,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextInsertAlloc(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> insert,
    int position,
  ) => _ffi.TextInsertAlloc(
    text.asNativePointer(),
    insert.asNativePointer(),
    position,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextJoin(
    MemoryPointer<RPointer<RChar>> textList,
    int count,
    MemoryPointer<RChar> delimiter,
  ) => _ffi.TextJoin(
    textList.asNativePointer(),
    count,
    delimiter.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RPointer<RChar>> TextSplit(
    MemoryPointer<RChar> text,
    int delimiter,
    MemoryPointer<RInt> count,
  ) => _ffi.TextSplit(
    text.asNativePointer(),
    delimiter,
    count.asNativePointer(),
  ).asMemoryPointer();

  @override
  void TextAppend(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> append,
    MemoryPointer<RInt> position,
  ) => _ffi.TextAppend(
    text.asNativePointer(),
    append.asNativePointer(),
    position.asNativePointer(),
  );

  @override
  int TextFindIndex(
    MemoryPointer<RChar> text,
    MemoryPointer<RChar> find,
  ) => _ffi.TextFindIndex(
    text.asNativePointer(),
    find.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> TextToUpper(
    MemoryPointer<RChar> text,
  ) => _ffi.TextToUpper(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextToLower(
    MemoryPointer<RChar> text,
  ) => _ffi.TextToLower(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextToPascal(
    MemoryPointer<RChar> text,
  ) => _ffi.TextToPascal(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextToSnake(
    MemoryPointer<RChar> text,
  ) => _ffi.TextToSnake(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RChar> TextToCamel(
    MemoryPointer<RChar> text,
  ) => _ffi.TextToCamel(
    text.asNativePointer(),
  ).asMemoryPointer();

  @override
  int TextToInteger(
    MemoryPointer<RChar> text,
  ) => _ffi.TextToInteger(
    text.asNativePointer(),
  );

  @override
  double TextToFloat(
    MemoryPointer<RChar> text,
  ) => _ffi.TextToFloat(
    text.asNativePointer(),
  );

  @override
  void DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  ) => _ffi.DrawLine3D(
    $.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPoint3D(
    Vector3D position,
    ColorD color,
  ) => _ffi.DrawPoint3D(
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCircle3D(
    Vector3D center,
    double radius,
    Vector3D rotationAxis,
    double rotationAngle,
    ColorD color,
  ) => _ffi.DrawCircle3D(
    $.Vector3$.Ref1(center).asNativePointer<Vector3C>().ref,
    radius,
    $.Vector3$.Ref2(rotationAxis).asNativePointer<Vector3C>().ref,
    rotationAngle,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangle3D(
    Vector3D v1,
    Vector3D v2,
    Vector3D v3,
    ColorD color,
  ) => _ffi.DrawTriangle3D(
    $.Vector3$.Ref1(v1).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(v2).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref3(v3).asNativePointer<Vector3C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawTriangleStrip3D(
    StructPointer<Vector3D> points,
    int pointCount,
    ColorD color,
  ) => _ffi.DrawTriangleStrip3D(
    points.asNativePointer(),
    pointCount,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCube(
    Vector3D position,
    double width,
    double height,
    double length,
    ColorD color,
  ) => _ffi.DrawCube(
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    width,
    height,
    length,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => _ffi.DrawCubeV(
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(size).asNativePointer<Vector3C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCubeWires(
    Vector3D position,
    double width,
    double height,
    double length,
    ColorD color,
  ) => _ffi.DrawCubeWires(
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    width,
    height,
    length,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => _ffi.DrawCubeWiresV(
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(size).asNativePointer<Vector3C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSphere(
    Vector3D centerPos,
    double radius,
    ColorD color,
  ) => _ffi.DrawSphere(
    $.Vector3$.Ref1(centerPos).asNativePointer<Vector3C>().ref,
    radius,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSphereEx(
    Vector3D centerPos,
    double radius,
    int rings,
    int slices,
    ColorD color,
  ) => _ffi.DrawSphereEx(
    $.Vector3$.Ref1(centerPos).asNativePointer<Vector3C>().ref,
    radius,
    rings,
    slices,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawSphereWires(
    Vector3D centerPos,
    double radius,
    int rings,
    int slices,
    ColorD color,
  ) => _ffi.DrawSphereWires(
    $.Vector3$.Ref1(centerPos).asNativePointer<Vector3C>().ref,
    radius,
    rings,
    slices,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCylinder(
    Vector3D position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    ColorD color,
  ) => _ffi.DrawCylinder(
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    radiusTop,
    radiusBottom,
    height,
    slices,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    double startRadius,
    double endRadius,
    int sides,
    ColorD color,
  ) => _ffi.DrawCylinderEx(
    $.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    startRadius,
    endRadius,
    sides,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCylinderWires(
    Vector3D position,
    double radiusTop,
    double radiusBottom,
    double height,
    int slices,
    ColorD color,
  ) => _ffi.DrawCylinderWires(
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    radiusTop,
    radiusBottom,
    height,
    slices,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    double startRadius,
    double endRadius,
    int sides,
    ColorD color,
  ) => _ffi.DrawCylinderWiresEx(
    $.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    startRadius,
    endRadius,
    sides,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    double radius,
    int slices,
    int rings,
    ColorD color,
  ) => _ffi.DrawCapsule(
    $.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    radius,
    slices,
    rings,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    double radius,
    int slices,
    int rings,
    ColorD color,
  ) => _ffi.DrawCapsuleWires(
    $.Vector3$.Ref1(startPos).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(endPos).asNativePointer<Vector3C>().ref,
    radius,
    slices,
    rings,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  ) => _ffi.DrawPlane(
    $.Vector3$.Ref1(centerPos).asNativePointer<Vector3C>().ref,
    $.Vector2$.Ref1(size).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawRay(
    RayD ray,
    ColorD color,
  ) => _ffi.DrawRay(
    $.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
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
  ModelD LoadModel(
    MemoryPointer<RChar> fileName,
  ) => $.Model$.RefCapture(
    RaylibCaptureIds.LoadModel,
    (p) => _ffi.LoadModel(
      fileName.asNativePointer(),
    ).toDart(p.asNativePointer()),
  );

  @override
  ModelD LoadModelFromMesh(
    MeshD mesh,
  ) => $.Model$.RefCapture(
    RaylibCaptureIds.LoadModelFromMesh,
    (p) => _ffi.LoadModelFromMesh(
      $.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  bool IsModelValid(
    ModelD model,
  ) => _ffi.IsModelValid(
    $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
  );

  @override
  void UnloadModel(
    ModelD model,
  ) => _ffi.UnloadModel(
    $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
  );

  @override
  BoundingBoxD GetModelBoundingBox(
    ModelD model,
  ) => $.BoundingBox$.Extract1(
    (p) => _ffi.GetModelBoundingBox(
      $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void DrawModel(
    ModelD model,
    Vector3D position,
    double scale,
    ColorD tint,
  ) => _ffi.DrawModel(
    $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    scale,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    double rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => _ffi.DrawModelEx(
    $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(rotationAxis).asNativePointer<Vector3C>().ref,
    rotationAngle,
    $.Vector3$.Ref3(scale).asNativePointer<Vector3C>().ref,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawModelWires(
    ModelD model,
    Vector3D position,
    double scale,
    ColorD tint,
  ) => _ffi.DrawModelWires(
    $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    scale,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    double rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => _ffi.DrawModelWiresEx(
    $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(rotationAxis).asNativePointer<Vector3C>().ref,
    rotationAngle,
    $.Vector3$.Ref3(scale).asNativePointer<Vector3C>().ref,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  ) => _ffi.DrawBoundingBox(
    $.BoundingBox$.Ref1(box).asNativePointer<BoundingBoxC>().ref,
    $.Color$.Ref1(color).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawBillboard(
    Camera3DD camera,
    TextureD texture,
    Vector3D position,
    double scale,
    ColorD tint,
  ) => _ffi.DrawBillboard(
    $.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    scale,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void DrawBillboardRec(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector2D size,
    ColorD tint,
  ) => _ffi.DrawBillboardRec(
    $.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    $.Vector2$.Ref1(size).asNativePointer<Vector2C>().ref,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
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
  ) => _ffi.DrawBillboardPro(
    $.Camera3D$.Ref1(camera).asNativePointer<Camera3DC>().ref,
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
    $.Rectangle$.Ref1(source).asNativePointer<RectangleC>().ref,
    $.Vector3$.Ref1(position).asNativePointer<Vector3C>().ref,
    $.Vector3$.Ref2(up).asNativePointer<Vector3C>().ref,
    $.Vector2$.Ref1(size).asNativePointer<Vector2C>().ref,
    $.Vector2$.Ref2(origin).asNativePointer<Vector2C>().ref,
    rotation,
    $.Color$.Ref1(tint).asNativePointer<ColorC>().ref,
  );

  @override
  void UploadMesh(
    StructPointer<MeshD> mesh,
    bool dynamic,
  ) => _ffi.UploadMesh(
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
  ) => _ffi.UpdateMeshBuffer(
    $.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    index,
    data.asNativePointer(),
    dataSize,
    offset,
  );

  @override
  void UnloadMesh(
    MeshD mesh,
  ) => _ffi.UnloadMesh(
    $.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
  );

  @override
  void DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  ) => _ffi.DrawMesh(
    $.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    $.Material$.Ref1(material).asNativePointer<MaterialC>().ref,
    $.Matrix$.Ref1(transform).asNativePointer<MatrixC>().ref,
  );

  @override
  void DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    StructPointer<MatrixD> transforms,
    int instances,
  ) => _ffi.DrawMeshInstanced(
    $.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    $.Material$.Ref1(material).asNativePointer<MaterialC>().ref,
    transforms.asNativePointer(),
    instances,
  );

  @override
  BoundingBoxD GetMeshBoundingBox(
    MeshD mesh,
  ) => $.BoundingBox$.Extract1(
    (p) => _ffi.GetMeshBoundingBox(
      $.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  void GenMeshTangents(
    StructPointer<MeshD> mesh,
  ) => _ffi.GenMeshTangents(
    mesh.asNativePointer(),
  );

  @override
  bool ExportMesh(
    MeshD mesh,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportMesh(
    $.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    fileName.asNativePointer(),
  );

  @override
  bool ExportMeshAsCode(
    MeshD mesh,
    MemoryPointer<RChar> fileName,
  ) => _ffi.ExportMeshAsCode(
    $.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
    fileName.asNativePointer(),
  );

  @override
  MeshD GenMeshPoly(
    int sides,
    double radius,
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshPoly,
    (p) => _ffi.GenMeshPoly(
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
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshPlane,
    (p) => _ffi.GenMeshPlane(
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
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCube,
    (p) => _ffi.GenMeshCube(
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
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshSphere,
    (p) => _ffi.GenMeshSphere(
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
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshHemiSphere,
    (p) => _ffi.GenMeshHemiSphere(
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
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCylinder,
    (p) => _ffi.GenMeshCylinder(
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
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCone,
    (p) => _ffi.GenMeshCone(
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
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshTorus,
    (p) => _ffi.GenMeshTorus(
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
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshKnot,
    (p) => _ffi.GenMeshKnot(
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
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshHeightmap,
    (p) => _ffi.GenMeshHeightmap(
      $.Image$.Ref1(heightmap).asNativePointer<ImageC>().ref,
      $.Vector3$.Ref1(size).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  MeshD GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  ) => $.Mesh$.RefCapture(
    RaylibCaptureIds.GenMeshCubicmap,
    (p) => _ffi.GenMeshCubicmap(
      $.Image$.Ref1(cubicmap).asNativePointer<ImageC>().ref,
      $.Vector3$.Ref1(cubeSize).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  StructPointer<MaterialD> LoadMaterials(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> materialCount,
  ) => MaterialD.struct.ptr(_ffi.LoadMaterials(
    fileName.asNativePointer(),
    materialCount.asNativePointer(),
  ).asMemoryPointer());

  @override
  MaterialD LoadMaterialDefault() => $.Material$.RefCapture(
    RaylibCaptureIds.LoadMaterialDefault,
    (p) => _ffi.LoadMaterialDefault().toDart(p.asNativePointer()),
  );

  @override
  bool IsMaterialValid(
    MaterialD material,
  ) => _ffi.IsMaterialValid(
    $.Material$.Ref1(material).asNativePointer<MaterialC>().ref,
  );

  @override
  void UnloadMaterial(
    MaterialD material,
  ) => _ffi.UnloadMaterial(
    $.Material$.Ref1(material).asNativePointer<MaterialC>().ref,
  );

  @override
  void SetMaterialTexture(
    StructPointer<MaterialD> material,
    int mapType,
    TextureD texture,
  ) => _ffi.SetMaterialTexture(
    material.asNativePointer(),
    mapType,
    $.Texture$.Ref1(texture).asNativePointer<TextureC>().ref,
  );

  @override
  void SetModelMeshMaterial(
    StructPointer<ModelD> model,
    int meshId,
    int materialId,
  ) => _ffi.SetModelMeshMaterial(
    model.asNativePointer(),
    meshId,
    materialId,
  );

  @override
  StructPointer<ModelAnimationD> LoadModelAnimations(
    MemoryPointer<RChar> fileName,
    MemoryPointer<RInt> animCount,
  ) => ModelAnimationD.struct.ptr(_ffi.LoadModelAnimations(
    fileName.asNativePointer(),
    animCount.asNativePointer(),
  ).asMemoryPointer());

  @override
  void UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    double frame,
  ) => _ffi.UpdateModelAnimation(
    $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    $.ModelAnimation$.Ref1(anim).asNativePointer<ModelAnimationC>().ref,
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
  ) => _ffi.UpdateModelAnimationEx(
    $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    $.ModelAnimation$.Ref1(animA).asNativePointer<ModelAnimationC>().ref,
    frameA,
    $.ModelAnimation$.Ref2(animB).asNativePointer<ModelAnimationC>().ref,
    frameB,
    blend,
  );

  @override
  void UnloadModelAnimations(
    StructPointer<ModelAnimationD> animations,
    int animCount,
  ) => _ffi.UnloadModelAnimations(
    animations.asNativePointer(),
    animCount,
  );

  @override
  bool IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  ) => _ffi.IsModelAnimationValid(
    $.Model$.Ref1(model).asNativePointer<ModelC>().ref,
    $.ModelAnimation$.Ref1(anim).asNativePointer<ModelAnimationC>().ref,
  );

  @override
  bool CheckCollisionSpheres(
    Vector3D center1,
    double radius1,
    Vector3D center2,
    double radius2,
  ) => _ffi.CheckCollisionSpheres(
    $.Vector3$.Ref1(center1).asNativePointer<Vector3C>().ref,
    radius1,
    $.Vector3$.Ref2(center2).asNativePointer<Vector3C>().ref,
    radius2,
  );

  @override
  bool CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  ) => _ffi.CheckCollisionBoxes(
    $.BoundingBox$.Ref1(box1).asNativePointer<BoundingBoxC>().ref,
    $.BoundingBox$.Ref2(box2).asNativePointer<BoundingBoxC>().ref,
  );

  @override
  bool CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    double radius,
  ) => _ffi.CheckCollisionBoxSphere(
    $.BoundingBox$.Ref1(box).asNativePointer<BoundingBoxC>().ref,
    $.Vector3$.Ref1(center).asNativePointer<Vector3C>().ref,
    radius,
  );

  @override
  RayCollisionD GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    double radius,
  ) => $.RayCollision$.Extract1(
    (p) => _ffi.GetRayCollisionSphere(
      $.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      $.Vector3$.Ref1(center).asNativePointer<Vector3C>().ref,
      radius,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayCollisionD GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  ) => $.RayCollision$.Extract1(
    (p) => _ffi.GetRayCollisionBox(
      $.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      $.BoundingBox$.Ref1(box).asNativePointer<BoundingBoxC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayCollisionD GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  ) => $.RayCollision$.Extract1(
    (p) => _ffi.GetRayCollisionMesh(
      $.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      $.Mesh$.Ref1(mesh).asNativePointer<MeshC>().ref,
      $.Matrix$.Ref1(transform).asNativePointer<MatrixC>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayCollisionD GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  ) => $.RayCollision$.Extract1(
    (p) => _ffi.GetRayCollisionTriangle(
      $.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      $.Vector3$.Ref1(p1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(p2).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref3(p3).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );

  @override
  RayCollisionD GetRayCollisionQuad(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
    Vector3D p4,
  ) => $.RayCollision$.Extract1(
    (p) => _ffi.GetRayCollisionQuad(
      $.Ray$.Ref1(ray).asNativePointer<RayC>().ref,
      $.Vector3$.Ref1(p1).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref2(p2).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref3(p3).asNativePointer<Vector3C>().ref,
      $.Vector3$.Ref4(p4).asNativePointer<Vector3C>().ref,
    ).toDart(p.asNativePointer()),
  );
}
