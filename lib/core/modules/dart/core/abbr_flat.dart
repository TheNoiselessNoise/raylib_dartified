import 'package:raylib_dartified/raylib_dartified.dart';

RaylibCoreFlat get _module => Raylib.instance.CoreFlat;

/// See [RaylibCoreFlat.InitWindow].
void InitWindow(
  int width,
  int height,
  MemoryPointer<RChar> title,
) => _module.InitWindow(width, height, title);

/// See [RaylibCoreFlat.CloseWindow].
void CloseWindow() => _module.CloseWindow();

/// See [RaylibCoreFlat.WindowShouldClose].
bool WindowShouldClose() => _module.WindowShouldClose();

/// See [RaylibCoreFlat.IsWindowReady].
bool IsWindowReady() => _module.IsWindowReady();

/// See [RaylibCoreFlat.IsWindowFullscreen].
bool IsWindowFullscreen() => _module.IsWindowFullscreen();

/// See [RaylibCoreFlat.IsWindowHidden].
bool IsWindowHidden() => _module.IsWindowHidden();

/// See [RaylibCoreFlat.IsWindowMinimized].
bool IsWindowMinimized() => _module.IsWindowMinimized();

/// See [RaylibCoreFlat.IsWindowMaximized].
bool IsWindowMaximized() => _module.IsWindowMaximized();

/// See [RaylibCoreFlat.IsWindowFocused].
bool IsWindowFocused() => _module.IsWindowFocused();

/// See [RaylibCoreFlat.IsWindowResized].
bool IsWindowResized() => _module.IsWindowResized();

/// See [RaylibCoreFlat.IsWindowState].
bool IsWindowState(
  int flag,
) => _module.IsWindowState(flag);

/// See [RaylibCoreFlat.SetWindowState].
void SetWindowState(
  int flags,
) => _module.SetWindowState(flags);

/// See [RaylibCoreFlat.ClearWindowState].
void ClearWindowState(
  int flags,
) => _module.ClearWindowState(flags);

/// See [RaylibCoreFlat.ToggleFullscreen].
void ToggleFullscreen() => _module.ToggleFullscreen();

/// See [RaylibCoreFlat.ToggleBorderlessWindowed].
void ToggleBorderlessWindowed() => _module.ToggleBorderlessWindowed();

/// See [RaylibCoreFlat.MaximizeWindow].
void MaximizeWindow() => _module.MaximizeWindow();

/// See [RaylibCoreFlat.MinimizeWindow].
void MinimizeWindow() => _module.MinimizeWindow();

/// See [RaylibCoreFlat.RestoreWindow].
void RestoreWindow() => _module.RestoreWindow();

/// See [RaylibCoreFlat.SetWindowIcon].
void SetWindowIcon(
  ImageD image,
) => _module.SetWindowIcon(image);

/// See [RaylibCoreFlat.SetWindowIcons].
void SetWindowIcons(
  StructPointer<ImageD> images,
  int count,
) => _module.SetWindowIcons(images, count);

/// See [RaylibCoreFlat.SetWindowTitle].
void SetWindowTitle(
  MemoryPointer<RChar> title,
) => _module.SetWindowTitle(title);

/// See [RaylibCoreFlat.SetWindowPosition].
void SetWindowPosition(
  int x,
  int y,
) => _module.SetWindowPosition(x, y);

/// See [RaylibCoreFlat.SetWindowMonitor].
void SetWindowMonitor(
  int monitor,
) => _module.SetWindowMonitor(monitor);

/// See [RaylibCoreFlat.SetWindowMinSize].
void SetWindowMinSize(
  int width,
  int height,
) => _module.SetWindowMinSize(width, height);

/// See [RaylibCoreFlat.SetWindowMaxSize].
void SetWindowMaxSize(
  int width,
  int height,
) => _module.SetWindowMaxSize(width, height);

/// See [RaylibCoreFlat.SetWindowSize].
void SetWindowSize(
  int width,
  int height,
) => _module.SetWindowSize(width, height);

/// See [RaylibCoreFlat.SetWindowOpacity].
void SetWindowOpacity(
  double opacity,
) => _module.SetWindowOpacity(opacity);

/// See [RaylibCoreFlat.SetWindowFocused].
void SetWindowFocused() => _module.SetWindowFocused();

/// See [RaylibCoreFlat.GetWindowHandle].
NativeMemoryPointer<RVoid> GetWindowHandle() => _module.GetWindowHandle();

/// See [RaylibCoreFlat.GetScreenWidth].
int GetScreenWidth() => _module.GetScreenWidth();

/// See [RaylibCoreFlat.GetScreenHeight].
int GetScreenHeight() => _module.GetScreenHeight();

/// See [RaylibCoreFlat.GetRenderWidth].
int GetRenderWidth() => _module.GetRenderWidth();

/// See [RaylibCoreFlat.GetRenderHeight].
int GetRenderHeight() => _module.GetRenderHeight();

/// See [RaylibCoreFlat.GetMonitorCount].
int GetMonitorCount() => _module.GetMonitorCount();

/// See [RaylibCoreFlat.GetCurrentMonitor].
int GetCurrentMonitor() => _module.GetCurrentMonitor();

/// See [RaylibCoreFlat.GetMonitorPosition].
Vector2D GetMonitorPosition(
  int monitor,
) => _module.GetMonitorPosition(monitor);

/// See [RaylibCoreFlat.GetMonitorWidth].
int GetMonitorWidth(
  int monitor,
) => _module.GetMonitorWidth(monitor);

/// See [RaylibCoreFlat.GetMonitorHeight].
int GetMonitorHeight(
  int monitor,
) => _module.GetMonitorHeight(monitor);

/// See [RaylibCoreFlat.GetMonitorPhysicalWidth].
int GetMonitorPhysicalWidth(
  int monitor,
) => _module.GetMonitorPhysicalWidth(monitor);

/// See [RaylibCoreFlat.GetMonitorPhysicalHeight].
int GetMonitorPhysicalHeight(
  int monitor,
) => _module.GetMonitorPhysicalHeight(monitor);

/// See [RaylibCoreFlat.GetMonitorRefreshRate].
int GetMonitorRefreshRate(
  int monitor,
) => _module.GetMonitorRefreshRate(monitor);

/// See [RaylibCoreFlat.GetWindowPosition].
Vector2D GetWindowPosition() => _module.GetWindowPosition();

/// See [RaylibCoreFlat.GetWindowScaleDPI].
Vector2D GetWindowScaleDPI() => _module.GetWindowScaleDPI();

/// See [RaylibCoreFlat.GetMonitorName].
NativeMemoryPointer<RChar> GetMonitorName(
  int monitor,
) => _module.GetMonitorName(monitor);

/// See [RaylibCoreFlat.SetClipboardText].
void SetClipboardText(
  MemoryPointer<RChar> text,
) => _module.SetClipboardText(text);

/// See [RaylibCoreFlat.GetClipboardText].
NativeMemoryPointer<RChar> GetClipboardText() => _module.GetClipboardText();

/// See [RaylibCoreFlat.GetClipboardImage].
ImageD GetClipboardImage() => _module.GetClipboardImage();

/// See [RaylibCoreFlat.EnableEventWaiting].
void EnableEventWaiting() => _module.EnableEventWaiting();

/// See [RaylibCoreFlat.DisableEventWaiting].
void DisableEventWaiting() => _module.DisableEventWaiting();

/// See [RaylibCoreFlat.ShowCursor].
void ShowCursor() => _module.ShowCursor();

/// See [RaylibCoreFlat.HideCursor].
void HideCursor() => _module.HideCursor();

/// See [RaylibCoreFlat.IsCursorHidden].
bool IsCursorHidden() => _module.IsCursorHidden();

/// See [RaylibCoreFlat.EnableCursor].
void EnableCursor() => _module.EnableCursor();

/// See [RaylibCoreFlat.DisableCursor].
void DisableCursor() => _module.DisableCursor();

/// See [RaylibCoreFlat.IsCursorOnScreen].
bool IsCursorOnScreen() => _module.IsCursorOnScreen();

/// See [RaylibCoreFlat.ClearBackground].
void ClearBackground(
  ColorD color,
) => _module.ClearBackground(color);

/// See [RaylibCoreFlat.BeginDrawing].
void BeginDrawing() => _module.BeginDrawing();

/// See [RaylibCoreFlat.EndDrawing].
void EndDrawing() => _module.EndDrawing();

/// See [RaylibCoreFlat.BeginMode2D].
void BeginMode2D(
  Camera2DD camera,
) => _module.BeginMode2D(camera);

/// See [RaylibCoreFlat.EndMode2D].
void EndMode2D() => _module.EndMode2D();

/// See [RaylibCoreFlat.BeginMode3D].
void BeginMode3D(
  Camera3DD camera,
) => _module.BeginMode3D(camera);

/// See [RaylibCoreFlat.EndMode3D].
void EndMode3D() => _module.EndMode3D();

/// See [RaylibCoreFlat.BeginTextureMode].
void BeginTextureMode(
  RenderTextureD target,
) => _module.BeginTextureMode(target);

/// See [RaylibCoreFlat.EndTextureMode].
void EndTextureMode() => _module.EndTextureMode();

/// See [RaylibCoreFlat.BeginShaderMode].
void BeginShaderMode(
  ShaderD shader,
) => _module.BeginShaderMode(shader);

/// See [RaylibCoreFlat.EndShaderMode].
void EndShaderMode() => _module.EndShaderMode();

/// See [RaylibCoreFlat.BeginBlendMode].
void BeginBlendMode(
  int mode,
) => _module.BeginBlendMode(mode);

/// See [RaylibCoreFlat.EndBlendMode].
void EndBlendMode() => _module.EndBlendMode();

/// See [RaylibCoreFlat.BeginScissorMode].
void BeginScissorMode(
  int x,
  int y,
  int width,
  int height,
) => _module.BeginScissorMode(x, y, width, height);

/// See [RaylibCoreFlat.EndScissorMode].
void EndScissorMode() => _module.EndScissorMode();

/// See [RaylibCoreFlat.BeginVrStereoMode].
void BeginVrStereoMode(
  VrStereoConfigD config,
) => _module.BeginVrStereoMode(config);

/// See [RaylibCoreFlat.EndVrStereoMode].
void EndVrStereoMode() => _module.EndVrStereoMode();

/// See [RaylibCoreFlat.LoadVrStereoConfig].
VrStereoConfigD LoadVrStereoConfig(
  VrDeviceInfoD device,
) => _module.LoadVrStereoConfig(device);

/// See [RaylibCoreFlat.UnloadVrStereoConfig].
void UnloadVrStereoConfig(
  VrStereoConfigD config,
) => _module.UnloadVrStereoConfig(config);

/// See [RaylibCoreFlat.LoadShader].
ShaderD LoadShader(
  MemoryPointer<RChar> vsFileName,
  MemoryPointer<RChar> fsFileName,
) => _module.LoadShader(vsFileName, fsFileName);

/// See [RaylibCoreFlat.LoadShaderFromMemory].
ShaderD LoadShaderFromMemory(
  MemoryPointer<RChar> vsCode,
  MemoryPointer<RChar> fsCode,
) => _module.LoadShaderFromMemory(vsCode, fsCode);

/// See [RaylibCoreFlat.IsShaderValid].
bool IsShaderValid(
  ShaderD shader,
) => _module.IsShaderValid(shader);

/// See [RaylibCoreFlat.GetShaderLocation].
int GetShaderLocation(
  ShaderD shader,
  MemoryPointer<RChar> uniformName,
) => _module.GetShaderLocation(shader, uniformName);

/// See [RaylibCoreFlat.GetShaderLocationAttrib].
int GetShaderLocationAttrib(
  ShaderD shader,
  MemoryPointer<RChar> attribName,
) => _module.GetShaderLocationAttrib(shader, attribName);

/// See [RaylibCoreFlat.SetShaderValueV].
void SetShaderValueV(
  ShaderD shader,
  int locIndex,
  MemoryPointer<RVoid> value,
  int uniformType,
  int count,
) => _module.SetShaderValueV(shader, locIndex, value, uniformType, count);

/// See [RaylibCoreFlat.SetShaderValueMatrix].
void SetShaderValueMatrix(
  ShaderD shader,
  int locIndex,
  MatrixD mat,
) => _module.SetShaderValueMatrix(shader, locIndex, mat);

/// See [RaylibCoreFlat.SetShaderValueTexture].
void SetShaderValueTexture(
  ShaderD shader,
  int locIndex,
  TextureD texture,
) => _module.SetShaderValueTexture(shader, locIndex, texture);

/// See [RaylibCoreFlat.UnloadShader].
void UnloadShader(
  ShaderD shader,
) => _module.UnloadShader(shader);

/// See [RaylibCoreFlat.GetScreenToWorldRay].
RayD GetScreenToWorldRay(
  Vector2D position,
  Camera3DD camera,
) => _module.GetScreenToWorldRay(position, camera);

/// See [RaylibCoreFlat.GetScreenToWorldRayEx].
RayD GetScreenToWorldRayEx(
  Vector2D position,
  Camera3DD camera,
  int width,
  int height,
) => _module.GetScreenToWorldRayEx(position, camera, width, height);

/// See [RaylibCoreFlat.GetWorldToScreen].
Vector2D GetWorldToScreen(
  Vector3D position,
  Camera3DD camera,
) => _module.GetWorldToScreen(position, camera);

/// See [RaylibCoreFlat.GetWorldToScreenEx].
Vector2D GetWorldToScreenEx(
  Vector3D position,
  Camera3DD camera,
  int width,
  int height,
) => _module.GetWorldToScreenEx(position, camera, width, height);

/// See [RaylibCoreFlat.GetWorldToScreen2D].
Vector2D GetWorldToScreen2D(
  Vector2D position,
  Camera2DD camera,
) => _module.GetWorldToScreen2D(position, camera);

/// See [RaylibCoreFlat.GetScreenToWorld2D].
Vector2D GetScreenToWorld2D(
  Vector2D position,
  Camera2DD camera,
) => _module.GetScreenToWorld2D(position, camera);

/// See [RaylibCoreFlat.GetCameraMatrix].
MatrixD GetCameraMatrix(
  Camera3DD camera,
) => _module.GetCameraMatrix(camera);

/// See [RaylibCoreFlat.GetCameraMatrix2D].
MatrixD GetCameraMatrix2D(
  Camera2DD camera,
) => _module.GetCameraMatrix2D(camera);

/// See [RaylibCoreFlat.SetTargetFPS].
void SetTargetFPS(
  int fps,
) => _module.SetTargetFPS(fps);

/// See [RaylibCoreFlat.GetFrameTime].
double GetFrameTime() => _module.GetFrameTime();

/// See [RaylibCoreFlat.GetTime].
double GetTime() => _module.GetTime();

/// See [RaylibCoreFlat.GetFPS].
int GetFPS() => _module.GetFPS();

/// See [RaylibCoreFlat.SwapScreenBuffer].
void SwapScreenBuffer() => _module.SwapScreenBuffer();

/// See [RaylibCoreFlat.PollInputEvents].
void PollInputEvents() => _module.PollInputEvents();

/// See [RaylibCoreFlat.WaitTime].
void WaitTime(
  double seconds,
) => _module.WaitTime(seconds);

/// See [RaylibCoreFlat.SetRandomSeed].
void SetRandomSeed(
  int seed,
) => _module.SetRandomSeed(seed);

/// See [RaylibCoreFlat.GetRandomValue].
int GetRandomValue(
  int min,
  int max,
) => _module.GetRandomValue(min, max);

/// See [RaylibCoreFlat.LoadRandomSequence].
NativeMemoryPointer<RInt> LoadRandomSequence(
  int count,
  int min,
  int max,
) => _module.LoadRandomSequence(count, min, max);

/// See [RaylibCoreFlat.UnloadRandomSequence].
void UnloadRandomSequence(
  MemoryPointer<RInt> sequence,
) => _module.UnloadRandomSequence(sequence);

/// See [RaylibCoreFlat.TakeScreenshot].
void TakeScreenshot(
  MemoryPointer<RChar> fileName,
) => _module.TakeScreenshot(fileName);

/// See [RaylibCoreFlat.SetConfigFlags].
void SetConfigFlags(
  int flags,
) => _module.SetConfigFlags(flags);

/// See [RaylibCoreFlat.OpenURL].
void OpenURL(
  MemoryPointer<RChar> url,
) => _module.OpenURL(url);

/// See [RaylibCoreFlat.TraceLog].
void TraceLog(
  int logLevel,
  MemoryPointer<RChar> text,
  // NOTE: missing va_list argument
) => _module.TraceLog(logLevel, text);

/// See [RaylibCoreFlat.SetTraceLogLevel].
void SetTraceLogLevel(
  int logLevel,
) => _module.SetTraceLogLevel(logLevel);

/// See [RaylibCoreFlat.SetTraceLogCallback].
void SetTraceLogCallback(
  MemoryPointer<RFunction> callback, // TraceLogCallback
) => _module.SetTraceLogCallback(callback);

/// See [RaylibCoreFlat.SetLoadFileDataCallback].
void SetLoadFileDataCallback(
  MemoryPointer<RFunction> callback, // LoadFileDataCallback
) => _module.SetLoadFileDataCallback(callback);

/// See [RaylibCoreFlat.SetSaveFileDataCallback].
void SetSaveFileDataCallback(
  MemoryPointer<RFunction> callback, // SaveFileDataCallback
) => _module.SetSaveFileDataCallback(callback);

/// See [RaylibCoreFlat.SetLoadFileTextCallback].
void SetLoadFileTextCallback(
  MemoryPointer<RFunction> callback, // LoadFileTextCallback
) => _module.SetLoadFileTextCallback(callback);

/// See [RaylibCoreFlat.SetSaveFileTextCallback].
void SetSaveFileTextCallback(
  MemoryPointer<RFunction> callback, // SaveFileTextCallback
) => _module.SetSaveFileTextCallback(callback);

/// See [RaylibCoreFlat.LoadFileData].
NativeMemoryPointer<RUnsignedChar> LoadFileData(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RInt> dataSize,
) => _module.LoadFileData(fileName, dataSize);

/// See [RaylibCoreFlat.UnloadFileData].
void UnloadFileData(
  MemoryPointer<RUnsignedChar> data,
) => _module.UnloadFileData(data);

/// See [RaylibCoreFlat.SaveFileData].
bool SaveFileData(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RVoid> data,
  int dataSize,
) => _module.SaveFileData(fileName, data, dataSize);

/// See [RaylibCoreFlat.ExportDataAsCode].
bool ExportDataAsCode(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
  MemoryPointer<RChar> fileName,
) => _module.ExportDataAsCode(data, dataSize, fileName);

/// See [RaylibCoreFlat.LoadFileText].
NativeMemoryPointer<RChar> LoadFileText(
  MemoryPointer<RChar> fileName,
) => _module.LoadFileText(fileName);

/// See [RaylibCoreFlat.UnloadFileText].
void UnloadFileText(
  MemoryPointer<RChar> text,
) => _module.UnloadFileText(text);

/// See [RaylibCoreFlat.SaveFileText].
bool SaveFileText(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> text,
) => _module.SaveFileText(fileName, text);

/// See [RaylibCoreFlat.FileRename].
int FileRename(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> fileRename,
) => _module.FileRename(fileName, fileRename);

/// See [RaylibCoreFlat.FileRemove].
int FileRemove(
  MemoryPointer<RChar> fileName,
) => _module.FileRemove(fileName);

/// See [RaylibCoreFlat.FileCopy].
int FileCopy(
  MemoryPointer<RChar> srcPath,
  MemoryPointer<RChar> dstPath,
) => _module.FileCopy(srcPath, dstPath);

/// See [RaylibCoreFlat.FileMove].
int FileMove(
  MemoryPointer<RChar> srcPath,
  MemoryPointer<RChar> dstPath,
) => _module.FileMove(srcPath, dstPath);

/// See [RaylibCoreFlat.FileTextReplace].
int FileTextReplace(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> search,
  MemoryPointer<RChar> replacement,
) => _module.FileTextReplace(fileName, search, replacement);

/// See [RaylibCoreFlat.FileTextFindIndex].
int FileTextFindIndex(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> search,
) => _module.FileTextFindIndex(fileName, search);

/// See [RaylibCoreFlat.FileExists].
bool FileExists(
  MemoryPointer<RChar> fileName,
) => _module.FileExists(fileName);

/// See [RaylibCoreFlat.DirectoryExists].
bool DirectoryExists(
  MemoryPointer<RChar> dirPath,
) => _module.DirectoryExists(dirPath);

/// See [RaylibCoreFlat.IsFileExtension].
bool IsFileExtension(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RChar> ext,
) => _module.IsFileExtension(fileName, ext);

/// See [RaylibCoreFlat.GetFileLength].
int GetFileLength(
  MemoryPointer<RChar> fileName,
) => _module.GetFileLength(fileName);

/// See [RaylibCoreFlat.GetFileExtension].
NativeMemoryPointer<RChar> GetFileExtension(
  MemoryPointer<RChar> fileName,
) => _module.GetFileExtension(fileName);

/// See [RaylibCoreFlat.GetFileName].
NativeMemoryPointer<RChar> GetFileName(
  MemoryPointer<RChar> filePath,
) => _module.GetFileName(filePath);

/// See [RaylibCoreFlat.GetFileNameWithoutExt].
NativeMemoryPointer<RChar> GetFileNameWithoutExt(
  MemoryPointer<RChar> filePath,
) => _module.GetFileNameWithoutExt(filePath);

/// See [RaylibCoreFlat.GetDirectoryFileCount].
int GetDirectoryFileCount(
  MemoryPointer<RChar> dirPath,
) => _module.GetDirectoryFileCount(dirPath);

/// See [RaylibCoreFlat.GetDirectoryFileCountEx].
int GetDirectoryFileCountEx(
  MemoryPointer<RChar> basePath,
  MemoryPointer<RChar> filter,
  bool scanSubdirs,
) => _module.GetDirectoryFileCountEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreFlat.GetDirectoryPath].
NativeMemoryPointer<RChar> GetDirectoryPath(
  MemoryPointer<RChar> filePath,
) => _module.GetDirectoryPath(filePath);

/// See [RaylibCoreFlat.GetPrevDirectoryPath].
NativeMemoryPointer<RChar> GetPrevDirectoryPath(
  MemoryPointer<RChar> dirPath,
) => _module.GetPrevDirectoryPath(dirPath);

/// See [RaylibCoreFlat.GetWorkingDirectory].
NativeMemoryPointer<RChar> GetWorkingDirectory() => _module.GetWorkingDirectory();

/// See [RaylibCoreFlat.GetApplicationDirectory].
NativeMemoryPointer<RChar> GetApplicationDirectory() => _module.GetApplicationDirectory();

/// See [RaylibCoreFlat.MakeDirectory].
int MakeDirectory(
  MemoryPointer<RChar> dirPath,
) => _module.MakeDirectory(dirPath);

/// See [RaylibCoreFlat.ChangeDirectory].
bool ChangeDirectory(
  MemoryPointer<RChar> dir,
) => _module.ChangeDirectory(dir);

/// See [RaylibCoreFlat.IsPathFile].
bool IsPathFile(
  MemoryPointer<RChar> path,
) => _module.IsPathFile(path);

/// See [RaylibCoreFlat.IsFileNameValid].
bool IsFileNameValid(
  MemoryPointer<RChar> fileName,
) => _module.IsFileNameValid(fileName);

/// See [RaylibCoreFlat.LoadDirectoryFiles].
FilePathListD LoadDirectoryFiles(
  MemoryPointer<RChar> dirPath,
) => _module.LoadDirectoryFiles(dirPath);

/// See [RaylibCoreFlat.LoadDirectoryFilesEx].
FilePathListD LoadDirectoryFilesEx(
  MemoryPointer<RChar> basePath,
  MemoryPointer<RChar> filter,
  bool scanSubdirs,
) => _module.LoadDirectoryFilesEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreFlat.UnloadDirectoryFiles].
void UnloadDirectoryFiles(
  FilePathListD files,
) => _module.UnloadDirectoryFiles(files);

/// See [RaylibCoreFlat.IsFileDropped].
bool IsFileDropped() => _module.IsFileDropped();

/// See [RaylibCoreFlat.LoadDroppedFiles].
FilePathListD LoadDroppedFiles() => _module.LoadDroppedFiles();

/// See [RaylibCoreFlat.UnloadDroppedFiles].
void UnloadDroppedFiles(
  FilePathListD files,
) => _module.UnloadDroppedFiles(files);

/// See [RaylibCoreFlat.GetFileModTime].
int GetFileModTime(
  MemoryPointer<RChar> fileName,
) => _module.GetFileModTime(fileName);

/// See [RaylibCoreFlat.CompressData].
NativeMemoryPointer<RUnsignedChar> CompressData(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
  MemoryPointer<RInt> compDataSize,
) => _module.CompressData(data, dataSize, compDataSize);

/// See [RaylibCoreFlat.DecompressData].
NativeMemoryPointer<RUnsignedChar> DecompressData(
  MemoryPointer<RUnsignedChar> compData,
  int compDataSize,
  MemoryPointer<RInt> dataSize,
) => _module.DecompressData(compData, compDataSize, dataSize);

/// See [RaylibCoreFlat.EncodeDataBase64].
NativeMemoryPointer<RChar> EncodeDataBase64(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
  MemoryPointer<RInt> outputSize,
) => _module.EncodeDataBase64(data, dataSize, outputSize);

/// See [RaylibCoreFlat.DecodeDataBase64].
NativeMemoryPointer<RUnsignedChar> DecodeDataBase64(
  MemoryPointer<RChar> data,
  MemoryPointer<RInt> outputSize,
) => _module.DecodeDataBase64(data, outputSize);

/// See [RaylibCoreFlat.ComputeCRC32].
int ComputeCRC32(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.ComputeCRC32(data, dataSize);

/// See [RaylibCoreFlat.ComputeMD5].
NativeMemoryPointer<RUnsignedInt> ComputeMD5(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.ComputeMD5(data, dataSize);

/// See [RaylibCoreFlat.ComputeSHA1].
NativeMemoryPointer<RUnsignedInt> ComputeSHA1(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.ComputeSHA1(data, dataSize);

/// See [RaylibCoreFlat.ComputeSHA256].
NativeMemoryPointer<RUnsignedInt> ComputeSHA256(
  MemoryPointer<RUnsignedChar> data,
  int dataSize,
) => _module.ComputeSHA256(data, dataSize);

/// See [RaylibCoreFlat.LoadAutomationEventList].
AutomationEventListD LoadAutomationEventList(
  MemoryPointer<RChar> fileName,
) => _module.LoadAutomationEventList(fileName);

/// See [RaylibCoreFlat.UnloadAutomationEventList].
void UnloadAutomationEventList(
  AutomationEventListD list,
) => _module.UnloadAutomationEventList(list);

/// See [RaylibCoreFlat.ExportAutomationEventList].
bool ExportAutomationEventList(
  AutomationEventListD list,
  MemoryPointer<RChar> fileName,
) => _module.ExportAutomationEventList(list, fileName);

/// See [RaylibCoreFlat.SetAutomationEventList].
void SetAutomationEventList(
  StructPointer<AutomationEventListD> list,
) => _module.SetAutomationEventList(list);

/// See [RaylibCoreFlat.SetAutomationEventBaseFrame].
void SetAutomationEventBaseFrame(
  int frame,
) => _module.SetAutomationEventBaseFrame(frame);

/// See [RaylibCoreFlat.StartAutomationEventRecording].
void StartAutomationEventRecording() => _module.StartAutomationEventRecording();

/// See [RaylibCoreFlat.StopAutomationEventRecording].
void StopAutomationEventRecording() => _module.StopAutomationEventRecording();

/// See [RaylibCoreFlat.PlayAutomationEvent].
void PlayAutomationEvent(
  AutomationEventD event,
) => _module.PlayAutomationEvent(event);

/// See [RaylibCoreFlat.IsKeyPressed].
bool IsKeyPressed(
  int key,
) => _module.IsKeyPressed(key);

/// See [RaylibCoreFlat.IsKeyPressedRepeat].
bool IsKeyPressedRepeat(
  int key,
) => _module.IsKeyPressedRepeat(key);

/// See [RaylibCoreFlat.IsKeyDown].
bool IsKeyDown(
  int key,
) => _module.IsKeyDown(key);

/// See [RaylibCoreFlat.IsKeyReleased].
bool IsKeyReleased(
  int key,
) => _module.IsKeyReleased(key);

/// See [RaylibCoreFlat.IsKeyUp].
bool IsKeyUp(
  int key,
) => _module.IsKeyUp(key);

/// See [RaylibCoreFlat.GetKeyName].
NativeMemoryPointer<RChar> GetKeyName(
  int key,
) => _module.GetKeyName(key);

/// See [RaylibCoreFlat.GetKeyPressed].
int GetKeyPressed() => _module.GetKeyPressed();

/// See [RaylibCoreFlat.GetCharPressed].
int GetCharPressed() => _module.GetCharPressed();

/// See [RaylibCoreFlat.SetExitKey].
void SetExitKey(
  int key,
) => _module.SetExitKey(key);

/// See [RaylibCoreFlat.IsGamepadAvailable].
bool IsGamepadAvailable(
  int gamepad,
) => _module.IsGamepadAvailable(gamepad);

/// See [RaylibCoreFlat.GetGamepadName].
NativeMemoryPointer<RChar> GetGamepadName(
  int gamepad,
) => _module.GetGamepadName(gamepad);

/// See [RaylibCoreFlat.IsGamepadButtonPressed].
bool IsGamepadButtonPressed(
  int gamepad,
  int button,
) => _module.IsGamepadButtonPressed(gamepad, button);

/// See [RaylibCoreFlat.IsGamepadButtonDown].
bool IsGamepadButtonDown(
  int gamepad,
  int button,
) => _module.IsGamepadButtonDown(gamepad, button);

/// See [RaylibCoreFlat.IsGamepadButtonReleased].
bool IsGamepadButtonReleased(
  int gamepad,
  int button,
) => _module.IsGamepadButtonReleased(gamepad, button);

/// See [RaylibCoreFlat.IsGamepadButtonUp].
bool IsGamepadButtonUp(
  int gamepad,
  int button,
) => _module.IsGamepadButtonUp(gamepad, button);

/// See [RaylibCoreFlat.GetGamepadButtonPressed].
int GetGamepadButtonPressed() => _module.GetGamepadButtonPressed();

/// See [RaylibCoreFlat.GetGamepadAxisCount].
int GetGamepadAxisCount(
  int gamepad,
) => _module.GetGamepadAxisCount(gamepad);

/// See [RaylibCoreFlat.GetGamepadAxisMovement].
double GetGamepadAxisMovement(
  int gamepad,
  int axis,
) => _module.GetGamepadAxisMovement(gamepad, axis);

/// See [RaylibCoreFlat.SetGamepadMappings].
int SetGamepadMappings(
  MemoryPointer<RChar> mappings,
) => _module.SetGamepadMappings(mappings);

/// See [RaylibCoreFlat.SetGamepadVibration].
void SetGamepadVibration(
  int gamepad,
  double leftMotor,
  double rightMotor,
  double duration,
) => _module.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration);

/// See [RaylibCoreFlat.IsMouseButtonPressed].
bool IsMouseButtonPressed(
  int button,
) => _module.IsMouseButtonPressed(button);

/// See [RaylibCoreFlat.IsMouseButtonDown].
bool IsMouseButtonDown(
  int button,
) => _module.IsMouseButtonDown(button);

/// See [RaylibCoreFlat.IsMouseButtonReleased].
bool IsMouseButtonReleased(
  int button,
) => _module.IsMouseButtonReleased(button);

/// See [RaylibCoreFlat.IsMouseButtonUp].
bool IsMouseButtonUp(
  int button,
) => _module.IsMouseButtonUp(button);

/// See [RaylibCoreFlat.GetMouseX].
int GetMouseX() => _module.GetMouseX();

/// See [RaylibCoreFlat.GetMouseY].
int GetMouseY() => _module.GetMouseY();

/// See [RaylibCoreFlat.GetMousePosition].
Vector2D GetMousePosition() => _module.GetMousePosition();

/// See [RaylibCoreFlat.GetMouseDelta].
Vector2D GetMouseDelta() => _module.GetMouseDelta();

/// See [RaylibCoreFlat.SetMousePosition].
void SetMousePosition(
  int x,
  int y,
) => _module.SetMousePosition(x, y);

/// See [RaylibCoreFlat.SetMouseOffset].
void SetMouseOffset(
  int offsetX,
  int offsetY,
) => _module.SetMouseOffset(offsetX, offsetY);

/// See [RaylibCoreFlat.SetMouseScale].
void SetMouseScale(
  double scaleX,
  double scaleY,
) => _module.SetMouseScale(scaleX, scaleY);

/// See [RaylibCoreFlat.GetMouseWheelMove].
double GetMouseWheelMove() => _module.GetMouseWheelMove();

/// See [RaylibCoreFlat.GetMouseWheelMoveV].
Vector2D GetMouseWheelMoveV() => _module.GetMouseWheelMoveV();

/// See [RaylibCoreFlat.SetMouseCursor].
void SetMouseCursor(
  int cursor,
) => _module.SetMouseCursor(cursor);

/// See [RaylibCoreFlat.GetTouchX].
int GetTouchX() => _module.GetTouchX();

/// See [RaylibCoreFlat.GetTouchY].
int GetTouchY() => _module.GetTouchY();

/// See [RaylibCoreFlat.GetTouchPosition].
Vector2D GetTouchPosition(
  int index,
) => _module.GetTouchPosition(index);

/// See [RaylibCoreFlat.GetTouchPointId].
int GetTouchPointId(
  int index,
) => _module.GetTouchPointId(index);

/// See [RaylibCoreFlat.GetTouchPointCount].
int GetTouchPointCount() => _module.GetTouchPointCount();

/// See [RaylibCoreFlat.SetGesturesEnabled].
void SetGesturesEnabled(
  int flags,
) => _module.SetGesturesEnabled(flags);

/// See [RaylibCoreFlat.IsGestureDetected].
bool IsGestureDetected(
  int gesture,
) => _module.IsGestureDetected(gesture);

/// See [RaylibCoreFlat.GetGestureDetected].
int GetGestureDetected() => _module.GetGestureDetected();

/// See [RaylibCoreFlat.GetGestureHoldDuration].
double GetGestureHoldDuration() => _module.GetGestureHoldDuration();

/// See [RaylibCoreFlat.GetGestureDragVector].
Vector2D GetGestureDragVector() => _module.GetGestureDragVector();

/// See [RaylibCoreFlat.GetGestureDragAngle].
double GetGestureDragAngle() => _module.GetGestureDragAngle();

/// See [RaylibCoreFlat.GetGesturePinchVector].
Vector2D GetGesturePinchVector() => _module.GetGesturePinchVector();

/// See [RaylibCoreFlat.GetGesturePinchAngle].
double GetGesturePinchAngle() => _module.GetGesturePinchAngle();

/// See [RaylibCoreFlat.ProcessGestureEvent].
void ProcessGestureEvent(
  GestureEventD event,
) => _module.ProcessGestureEvent(event);

/// See [RaylibCoreFlat.UpdateGestures].
void UpdateGestures() => _module.UpdateGestures();

/// See [RaylibCoreFlat.UpdateCamera].
void UpdateCamera(
  StructPointer<Camera3DD> camera,
  int mode,
) => _module.UpdateCamera(camera, mode);

/// See [RaylibCoreFlat.UpdateCameraPro].
void UpdateCameraPro(
  StructPointer<Camera3DD> camera,
  Vector3D movement,
  Vector3D rotation,
  double zoom,
) => _module.UpdateCameraPro(camera, movement, rotation, zoom);

/// See [RaylibCoreFlat.SetShapesTexture].
void SetShapesTexture(
  TextureD texture,
  RectangleD source,
) => _module.SetShapesTexture(texture, source);

/// See [RaylibCoreFlat.GetShapesTexture].
TextureD GetShapesTexture() => _module.GetShapesTexture();

/// See [RaylibCoreFlat.GetShapesTextureRectangle].
RectangleD GetShapesTextureRectangle() => _module.GetShapesTextureRectangle();

/// See [RaylibCoreFlat.DrawPixel].
void DrawPixel(
  int posX,
  int posY,
  ColorD color,
) => _module.DrawPixel(posX, posY, color);

/// See [RaylibCoreFlat.DrawPixelV].
void DrawPixelV(
  Vector2D position,
  ColorD color,
) => _module.DrawPixelV(position, color);

/// See [RaylibCoreFlat.DrawLine].
void DrawLine(
  int startPosX,
  int startPosY,
  int endPosX,
  int endPosY,
  ColorD color,
) => _module.DrawLine(startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreFlat.DrawLineV].
void DrawLineV(
  Vector2D startPos,
  Vector2D endPos,
  ColorD color,
) => _module.DrawLineV(startPos, endPos, color);

/// See [RaylibCoreFlat.DrawLineEx].
void DrawLineEx(
  Vector2D startPos,
  Vector2D endPos,
  double thick,
  ColorD color,
) => _module.DrawLineEx(startPos, endPos, thick, color);

/// See [RaylibCoreFlat.DrawLineStrip].
void DrawLineStrip(
  StructPointer<Vector2D> points,
  int pointCount,
  ColorD color,
) => _module.DrawLineStrip(points, pointCount, color);

/// See [RaylibCoreFlat.DrawLineBezier].
void DrawLineBezier(
  Vector2D startPos,
  Vector2D endPos,
  double thick,
  ColorD color,
) => _module.DrawLineBezier(startPos, endPos, thick, color);

/// See [RaylibCoreFlat.DrawLineDashed].
void DrawLineDashed(
  Vector2D startPos,
  Vector2D endPos,
  int dashSize,
  int spaceSize,
  ColorD color,
) => _module.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color);

/// See [RaylibCoreFlat.DrawCircle].
void DrawCircle(
  int centerX,
  int centerY,
  double radius,
  ColorD color,
) => _module.DrawCircle(centerX, centerY, radius, color);

/// See [RaylibCoreFlat.DrawCircleSector].
void DrawCircleSector(
  Vector2D center,
  double radius,
  double startAngle,
  double endAngle,
  int segments,
  ColorD color,
) => _module.DrawCircleSector(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreFlat.DrawCircleSectorLines].
void DrawCircleSectorLines(
  Vector2D center,
  double radius,
  double startAngle,
  double endAngle,
  int segments,
  ColorD color,
) => _module.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreFlat.DrawCircleGradient].
void DrawCircleGradient(
  Vector2D center,
  double radius,
  ColorD inner,
  ColorD outer,
) => _module.DrawCircleGradient(center, radius, inner, outer);

/// See [RaylibCoreFlat.DrawCircleV].
void DrawCircleV(
  Vector2D center,
  double radius,
  ColorD color,
) => _module.DrawCircleV(center, radius, color);

/// See [RaylibCoreFlat.DrawCircleLines].
void DrawCircleLines(
  int centerX,
  int centerY,
  double radius,
  ColorD color,
) => _module.DrawCircleLines(centerX, centerY, radius, color);

/// See [RaylibCoreFlat.DrawCircleLinesV].
void DrawCircleLinesV(
  Vector2D center,
  double radius,
  ColorD color,
) => _module.DrawCircleLinesV(center, radius, color);

/// See [RaylibCoreFlat.DrawEllipse].
void DrawEllipse(
  int centerX,
  int centerY,
  double radiusH,
  double radiusV,
  ColorD color,
) => _module.DrawEllipse(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreFlat.DrawEllipseV].
void DrawEllipseV(
  Vector2D center,
  double radiusH,
  double radiusV,
  ColorD color,
) => _module.DrawEllipseV(center, radiusH, radiusV, color);

/// See [RaylibCoreFlat.DrawEllipseLines].
void DrawEllipseLines(
  int centerX,
  int centerY,
  double radiusH,
  double radiusV,
  ColorD color,
) => _module.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreFlat.DrawEllipseLinesV].
void DrawEllipseLinesV(
  Vector2D center,
  double radiusH,
  double radiusV,
  ColorD color,
) => _module.DrawEllipseLinesV(center, radiusH, radiusV, color);

/// See [RaylibCoreFlat.DrawRing].
void DrawRing(
  Vector2D center,
  double innerRadius,
  double outerRadius,
  double startAngle,
  double endAngle,
  int segments,
  ColorD color,
) => _module.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreFlat.DrawRingLines].
void DrawRingLines(
  Vector2D center,
  double innerRadius,
  double outerRadius,
  double startAngle,
  double endAngle,
  int segments,
  ColorD color,
) => _module.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreFlat.DrawRectangle].
void DrawRectangle(
  int posX,
  int posY,
  int width,
  int height,
  ColorD color,
) => _module.DrawRectangle(posX, posY, width, height, color);

/// See [RaylibCoreFlat.DrawRectangleV].
void DrawRectangleV(
  Vector2D position,
  Vector2D size,
  ColorD color,
) => _module.DrawRectangleV(position, size, color);

/// See [RaylibCoreFlat.DrawRectangleRec].
void DrawRectangleRec(
  RectangleD rec,
  ColorD color,
) => _module.DrawRectangleRec(rec, color);

/// See [RaylibCoreFlat.DrawRectanglePro].
void DrawRectanglePro(
  RectangleD rec,
  Vector2D origin,
  double rotation,
  ColorD color,
) => _module.DrawRectanglePro(rec, origin, rotation, color);

/// See [RaylibCoreFlat.DrawRectangleGradientV].
void DrawRectangleGradientV(
  int posX,
  int posY,
  int width,
  int height,
  ColorD top,
  ColorD bottom,
) => _module.DrawRectangleGradientV(posX, posY, width, height, top, bottom);

/// See [RaylibCoreFlat.DrawRectangleGradientH].
void DrawRectangleGradientH(
  int posX,
  int posY,
  int width,
  int height,
  ColorD left,
  ColorD right,
) => _module.DrawRectangleGradientH(posX, posY, width, height, left, right);

/// See [RaylibCoreFlat.DrawRectangleGradientEx].
void DrawRectangleGradientEx(
  RectangleD rec,
  ColorD topLeft,
  ColorD bottomLeft,
  ColorD topRight,
  ColorD bottomRight,
) => _module.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight);

/// See [RaylibCoreFlat.DrawRectangleLines].
void DrawRectangleLines(
  int posX,
  int posY,
  int width,
  int height,
  ColorD color,
) => _module.DrawRectangleLines(posX, posY, width, height, color);

/// See [RaylibCoreFlat.DrawRectangleLinesEx].
void DrawRectangleLinesEx(
  RectangleD rec,
  double lineThick,
  ColorD color,
) => _module.DrawRectangleLinesEx(rec, lineThick, color);

/// See [RaylibCoreFlat.DrawRectangleRounded].
void DrawRectangleRounded(
  RectangleD rec,
  double roundness,
  int segments,
  ColorD color,
) => _module.DrawRectangleRounded(rec, roundness, segments, color);

/// See [RaylibCoreFlat.DrawRectangleRoundedLines].
void DrawRectangleRoundedLines(
  RectangleD rec,
  double roundness,
  int segments,
  ColorD color,
) => _module.DrawRectangleRoundedLines(rec, roundness, segments, color);

/// See [RaylibCoreFlat.DrawRectangleRoundedLinesEx].
void DrawRectangleRoundedLinesEx(
  RectangleD rec,
  double roundness,
  int segments,
  double lineThick,
  ColorD color,
) => _module.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color);

/// See [RaylibCoreFlat.DrawTriangle].
void DrawTriangle(
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.DrawTriangle(v1, v2, v3, color);

/// See [RaylibCoreFlat.DrawTriangleLines].
void DrawTriangleLines(
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.DrawTriangleLines(v1, v2, v3, color);

/// See [RaylibCoreFlat.DrawTriangleFan].
void DrawTriangleFan(
  StructPointer<Vector2D> points,
  int pointCount,
  ColorD color,
) => _module.DrawTriangleFan(points, pointCount, color);

/// See [RaylibCoreFlat.DrawTriangleStrip].
void DrawTriangleStrip(
  StructPointer<Vector2D> points,
  int pointCount,
  ColorD color,
) => _module.DrawTriangleStrip(points, pointCount, color);

/// See [RaylibCoreFlat.DrawPoly].
void DrawPoly(
  Vector2D center,
  int sides,
  double radius,
  double rotation,
  ColorD color,
) => _module.DrawPoly(center, sides, radius, rotation, color);

/// See [RaylibCoreFlat.DrawPolyLines].
void DrawPolyLines(
  Vector2D center,
  int sides,
  double radius,
  double rotation,
  ColorD color,
) => _module.DrawPolyLines(center, sides, radius, rotation, color);

/// See [RaylibCoreFlat.DrawPolyLinesEx].
void DrawPolyLinesEx(
  Vector2D center,
  int sides,
  double radius,
  double rotation,
  double lineThick,
  ColorD color,
) => _module.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color);

/// See [RaylibCoreFlat.DrawSplineLinear].
void DrawSplineLinear(
  StructPointer<Vector2D> points,
  int pointCount,
  double thick,
  ColorD color,
) => _module.DrawSplineLinear(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineBasis].
void DrawSplineBasis(
  StructPointer<Vector2D> points,
  int pointCount,
  double thick,
  ColorD color,
) => _module.DrawSplineBasis(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineCatmullRom].
void DrawSplineCatmullRom(
  StructPointer<Vector2D> points,
  int pointCount,
  double thick,
  ColorD color,
) => _module.DrawSplineCatmullRom(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineBezierQuadratic].
void DrawSplineBezierQuadratic(
  StructPointer<Vector2D> points,
  int pointCount,
  double thick,
  ColorD color,
) => _module.DrawSplineBezierQuadratic(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineBezierCubic].
void DrawSplineBezierCubic(
  StructPointer<Vector2D> points,
  int pointCount,
  double thick,
  ColorD color,
) => _module.DrawSplineBezierCubic(points, pointCount, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentLinear].
void DrawSplineSegmentLinear(
  Vector2D p1,
  Vector2D p2,
  double thick,
  ColorD color,
) => _module.DrawSplineSegmentLinear(p1, p2, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentBasis].
void DrawSplineSegmentBasis(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  double thick,
  ColorD color,
) => _module.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentCatmullRom].
void DrawSplineSegmentCatmullRom(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  double thick,
  ColorD color,
) => _module.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentBezierQuadratic].
void DrawSplineSegmentBezierQuadratic(
  Vector2D p1,
  Vector2D c2,
  Vector2D p3,
  double thick,
  ColorD color,
) => _module.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color);

/// See [RaylibCoreFlat.DrawSplineSegmentBezierCubic].
void DrawSplineSegmentBezierCubic(
  Vector2D p1,
  Vector2D c2,
  Vector2D c3,
  Vector2D p4,
  double thick,
  ColorD color,
) => _module.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color);

/// See [RaylibCoreFlat.GetSplinePointLinear].
Vector2D GetSplinePointLinear(
  Vector2D startPos,
  Vector2D endPos,
  double t,
) => _module.GetSplinePointLinear(startPos, endPos, t);

/// See [RaylibCoreFlat.GetSplinePointBasis].
Vector2D GetSplinePointBasis(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  double t,
) => _module.GetSplinePointBasis(p1, p2, p3, p4, t);

/// See [RaylibCoreFlat.GetSplinePointCatmullRom].
Vector2D GetSplinePointCatmullRom(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  double t,
) => _module.GetSplinePointCatmullRom(p1, p2, p3, p4, t);

/// See [RaylibCoreFlat.GetSplinePointBezierQuad].
Vector2D GetSplinePointBezierQuad(
  Vector2D p1,
  Vector2D c2,
  Vector2D p3,
  double t,
) => _module.GetSplinePointBezierQuad(p1, c2, p3, t);

/// See [RaylibCoreFlat.GetSplinePointBezierCubic].
Vector2D GetSplinePointBezierCubic(
  Vector2D p1,
  Vector2D c2,
  Vector2D c3,
  Vector2D p4,
  double t,
) => _module.GetSplinePointBezierCubic(p1, c2, c3, p4, t);

/// See [RaylibCoreFlat.CheckCollisionRecs].
bool CheckCollisionRecs(
  RectangleD rec1,
  RectangleD rec2,
) => _module.CheckCollisionRecs(rec1, rec2);

/// See [RaylibCoreFlat.CheckCollisionCircles].
bool CheckCollisionCircles(
  Vector2D center1,
  double radius1,
  Vector2D center2,
  double radius2,
) => _module.CheckCollisionCircles(center1, radius1, center2, radius2);

/// See [RaylibCoreFlat.CheckCollisionCircleRec].
bool CheckCollisionCircleRec(
  Vector2D center,
  double radius,
  RectangleD rec,
) => _module.CheckCollisionCircleRec(center, radius, rec);

/// See [RaylibCoreFlat.CheckCollisionCircleLine].
bool CheckCollisionCircleLine(
  Vector2D center,
  double radius,
  Vector2D p1,
  Vector2D p2,
) => _module.CheckCollisionCircleLine(center, radius, p1, p2);

/// See [RaylibCoreFlat.CheckCollisionPointRec].
bool CheckCollisionPointRec(
  Vector2D point,
  RectangleD rec,
) => _module.CheckCollisionPointRec(point, rec);

/// See [RaylibCoreFlat.CheckCollisionPointCircle].
bool CheckCollisionPointCircle(
  Vector2D point,
  Vector2D center,
  double radius,
) => _module.CheckCollisionPointCircle(point, center, radius);

/// See [RaylibCoreFlat.CheckCollisionPointTriangle].
bool CheckCollisionPointTriangle(
  Vector2D point,
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
) => _module.CheckCollisionPointTriangle(point, p1, p2, p3);

/// See [RaylibCoreFlat.CheckCollisionPointLine].
bool CheckCollisionPointLine(
  Vector2D point,
  Vector2D p1,
  Vector2D p2,
  int threshold,
) => _module.CheckCollisionPointLine(point, p1, p2, threshold);

/// See [RaylibCoreFlat.CheckCollisionPointPoly].
bool CheckCollisionPointPoly(
  Vector2D point,
  StructPointer<Vector2D> points,
  int pointCount,
) => _module.CheckCollisionPointPoly(point, points, pointCount);

/// See [RaylibCoreFlat.CheckCollisionLines].
bool CheckCollisionLines(
  Vector2D startPos1,
  Vector2D endPos1,
  Vector2D startPos2,
  Vector2D endPos2,
  StructPointer<Vector2D> collisionPoint,
) => _module.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint);

/// See [RaylibCoreFlat.GetCollisionRec].
RectangleD GetCollisionRec(
  RectangleD rec1,
  RectangleD rec2,
) => _module.GetCollisionRec(rec1, rec2);

/// See [RaylibCoreFlat.LoadImage].
ImageD LoadImage(
  MemoryPointer<RChar> fileName,
) => _module.LoadImage(fileName);

/// See [RaylibCoreFlat.LoadImageRaw].
ImageD LoadImageRaw(
  MemoryPointer<RChar> fileName,
  int width,
  int height,
  int format,
  int headerSize,
) => _module.LoadImageRaw(fileName, width, height, format, headerSize);

/// See [RaylibCoreFlat.LoadImageAnim].
ImageD LoadImageAnim(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RInt> frames,
) => _module.LoadImageAnim(fileName, frames);

/// See [RaylibCoreFlat.LoadImageAnimFromMemory].
ImageD LoadImageAnimFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
  MemoryPointer<RInt> frames,
) => _module.LoadImageAnimFromMemory(fileType, fileData, dataSize, frames);

/// See [RaylibCoreFlat.LoadImageFromMemory].
ImageD LoadImageFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
) => _module.LoadImageFromMemory(fileType, fileData, dataSize);

/// See [RaylibCoreFlat.LoadImageFromTexture].
ImageD LoadImageFromTexture(
  TextureD texture,
) => _module.LoadImageFromTexture(texture);

/// See [RaylibCoreFlat.LoadImageFromScreen].
ImageD LoadImageFromScreen() => _module.LoadImageFromScreen();

/// See [RaylibCoreFlat.IsImageValid].
bool IsImageValid(
  ImageD image,
) => _module.IsImageValid(image);

/// See [RaylibCoreFlat.UnloadImage].
void UnloadImage(
  ImageD image,
) => _module.UnloadImage(image);

/// See [RaylibCoreFlat.ExportImage].
bool ExportImage(
  ImageD image,
  MemoryPointer<RChar> fileName,
) => _module.ExportImage(image, fileName);

/// See [RaylibCoreFlat.ExportImageToMemory].
NativeMemoryPointer<RUnsignedChar> ExportImageToMemory(
  ImageD image,
  MemoryPointer<RChar> fileType,
  MemoryPointer<RInt> fileSize,
) => _module.ExportImageToMemory(image, fileType, fileSize);

/// See [RaylibCoreFlat.ExportImageAsCode].
bool ExportImageAsCode(
  ImageD image,
  MemoryPointer<RChar> fileName,
) => _module.ExportImageAsCode(image, fileName);

/// See [RaylibCoreFlat.GenImageColor].
ImageD GenImageColor(
  int width,
  int height,
  ColorD color,
) => _module.GenImageColor(width, height, color);

/// See [RaylibCoreFlat.GenImageGradientLinear].
ImageD GenImageGradientLinear(
  int width,
  int height,
  int direction,
  ColorD start,
  ColorD end,
) => _module.GenImageGradientLinear(width, height, direction, start, end);

/// See [RaylibCoreFlat.GenImageGradientRadial].
ImageD GenImageGradientRadial(
  int width,
  int height,
  double density,
  ColorD inner,
  ColorD outer,
) => _module.GenImageGradientRadial(width, height, density, inner, outer);

/// See [RaylibCoreFlat.GenImageGradientSquare].
ImageD GenImageGradientSquare(
  int width,
  int height,
  double density,
  ColorD inner,
  ColorD outer,
) => _module.GenImageGradientSquare(width, height, density, inner, outer);

/// See [RaylibCoreFlat.GenImageChecked].
ImageD GenImageChecked(
  int width,
  int height,
  int checksX,
  int checksY,
  ColorD col1,
  ColorD col2,
) => _module.GenImageChecked(width, height, checksX, checksY, col1, col2);

/// See [RaylibCoreFlat.GenImageWhiteNoise].
ImageD GenImageWhiteNoise(
  int width,
  int height,
  double factor,
) => _module.GenImageWhiteNoise(width, height, factor);

/// See [RaylibCoreFlat.GenImagePerlinNoise].
ImageD GenImagePerlinNoise(
  int width,
  int height,
  int offsetX,
  int offsetY,
  double scale,
) => _module.GenImagePerlinNoise(width, height, offsetX, offsetY, scale);

/// See [RaylibCoreFlat.GenImageCellular].
ImageD GenImageCellular(
  int width,
  int height,
  int tileSize,
) => _module.GenImageCellular(width, height, tileSize);

/// See [RaylibCoreFlat.GenImageText].
ImageD GenImageText(
  int width,
  int height,
  MemoryPointer<RChar> text,
) => _module.GenImageText(width, height, text);

/// See [RaylibCoreFlat.ImageCopy].
ImageD ImageCopy(
  ImageD image,
) => _module.ImageCopy(image);

/// See [RaylibCoreFlat.ImageFromImage].
ImageD ImageFromImage(
  ImageD image,
  RectangleD rec,
) => _module.ImageFromImage(image, rec);

/// See [RaylibCoreFlat.ImageFromChannel].
ImageD ImageFromChannel(
  ImageD image,
  int selectedChannel,
) => _module.ImageFromChannel(image, selectedChannel);

/// See [RaylibCoreFlat.ImageText].
ImageD ImageText(
  MemoryPointer<RChar> text,
  int fontSize,
  ColorD color,
) => _module.ImageText(text, fontSize, color);

/// See [RaylibCoreFlat.ImageTextEx].
ImageD ImageTextEx(
  FontD font,
  MemoryPointer<RChar> text,
  double fontSize,
  double spacing,
  ColorD tint,
) => _module.ImageTextEx(font, text, fontSize, spacing, tint);

/// See [RaylibCoreFlat.ImageFormat].
void ImageFormat(
  StructPointer<ImageD> image,
  int newFormat,
) => _module.ImageFormat(image, newFormat);

/// See [RaylibCoreFlat.ImageToPOT].
void ImageToPOT(
  StructPointer<ImageD> image,
  ColorD fill,
) => _module.ImageToPOT(image, fill);

/// See [RaylibCoreFlat.ImageCrop].
void ImageCrop(
  StructPointer<ImageD> image,
  RectangleD crop,
) => _module.ImageCrop(image, crop);

/// See [RaylibCoreFlat.ImageAlphaCrop].
void ImageAlphaCrop(
  StructPointer<ImageD> image,
  double threshold,
) => _module.ImageAlphaCrop(image, threshold);

/// See [RaylibCoreFlat.ImageAlphaClear].
void ImageAlphaClear(
  StructPointer<ImageD> image,
  ColorD color,
  double threshold,
) => _module.ImageAlphaClear(image, color, threshold);

/// See [RaylibCoreFlat.ImageAlphaMask].
void ImageAlphaMask(
  StructPointer<ImageD> image,
  ImageD alphaMask,
) => _module.ImageAlphaMask(image, alphaMask);

/// See [RaylibCoreFlat.ImageAlphaPremultiply].
void ImageAlphaPremultiply(
  StructPointer<ImageD> image,
) => _module.ImageAlphaPremultiply(image);

/// See [RaylibCoreFlat.ImageBlurGaussian].
void ImageBlurGaussian(
  StructPointer<ImageD> image,
  int blurSize,
) => _module.ImageBlurGaussian(image, blurSize);

/// See [RaylibCoreFlat.ImageKernelConvolution].
void ImageKernelConvolution(
  StructPointer<ImageD> image,
  MemoryPointer<RFloat> kernel,
  int kernelSize,
) => _module.ImageKernelConvolution(image, kernel, kernelSize);

/// See [RaylibCoreFlat.ImageResize].
void ImageResize(
  StructPointer<ImageD> image,
  int newWidth,
  int newHeight,
) => _module.ImageResize(image, newWidth, newHeight);

/// See [RaylibCoreFlat.ImageResizeNN].
void ImageResizeNN(
  StructPointer<ImageD> image,
  int newWidth,
  int newHeight,
) => _module.ImageResizeNN(image, newWidth, newHeight);

/// See [RaylibCoreFlat.ImageResizeCanvas].
void ImageResizeCanvas(
  StructPointer<ImageD> image,
  int newWidth,
  int newHeight,
  int offsetX,
  int offsetY,
  ColorD fill,
) => _module.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill);

/// See [RaylibCoreFlat.ImageMipmaps].
void ImageMipmaps(
  StructPointer<ImageD> image,
) => _module.ImageMipmaps(image);

/// See [RaylibCoreFlat.ImageDither].
void ImageDither(
  StructPointer<ImageD> image,
  int rBpp,
  int gBpp,
  int bBpp,
  int aBpp,
) => _module.ImageDither(image, rBpp, gBpp, bBpp, aBpp);

/// See [RaylibCoreFlat.ImageFlipVertical].
void ImageFlipVertical(
  StructPointer<ImageD> image,
) => _module.ImageFlipVertical(image);

/// See [RaylibCoreFlat.ImageFlipHorizontal].
void ImageFlipHorizontal(
  StructPointer<ImageD> image,
) => _module.ImageFlipHorizontal(image);

/// See [RaylibCoreFlat.ImageRotate].
void ImageRotate(
  StructPointer<ImageD> image,
  int degrees,
) => _module.ImageRotate(image, degrees);

/// See [RaylibCoreFlat.ImageRotateCW].
void ImageRotateCW(
  StructPointer<ImageD> image,
) => _module.ImageRotateCW(image);

/// See [RaylibCoreFlat.ImageRotateCCW].
void ImageRotateCCW(
  StructPointer<ImageD> image,
) => _module.ImageRotateCCW(image);

/// See [RaylibCoreFlat.ImageColorTint].
void ImageColorTint(
  StructPointer<ImageD> image,
  ColorD color,
) => _module.ImageColorTint(image, color);

/// See [RaylibCoreFlat.ImageColorInvert].
void ImageColorInvert(
  StructPointer<ImageD> image,
) => _module.ImageColorInvert(image);

/// See [RaylibCoreFlat.ImageColorGrayscale].
void ImageColorGrayscale(
  StructPointer<ImageD> image,
) => _module.ImageColorGrayscale(image);

/// See [RaylibCoreFlat.ImageColorContrast].
void ImageColorContrast(
  StructPointer<ImageD> image,
  double contrast,
) => _module.ImageColorContrast(image, contrast);

/// See [RaylibCoreFlat.ImageColorBrightness].
void ImageColorBrightness(
  StructPointer<ImageD> image,
  int brightness,
) => _module.ImageColorBrightness(image, brightness);

/// See [RaylibCoreFlat.ImageColorReplace].
void ImageColorReplace(
  StructPointer<ImageD> image,
  ColorD color,
  ColorD replace,
) => _module.ImageColorReplace(image, color, replace);

/// See [RaylibCoreFlat.LoadImageColors].
StructPointer<ColorD> LoadImageColors(
  ImageD image,
) => _module.LoadImageColors(image);

/// See [RaylibCoreFlat.LoadImagePalette].
StructPointer<ColorD> LoadImagePalette(
  ImageD image,
  int maxPaletteSize,
  MemoryPointer<RInt> colorCount,
) => _module.LoadImagePalette(image, maxPaletteSize, colorCount);

/// See [RaylibCoreFlat.UnloadImageColors].
void UnloadImageColors(
  StructPointer<ColorD> colors,
) => _module.UnloadImageColors(colors);

/// See [RaylibCoreFlat.UnloadImagePalette].
void UnloadImagePalette(
  StructPointer<ColorD> colors,
) => _module.UnloadImagePalette(colors);

/// See [RaylibCoreFlat.GetImageAlphaBorder].
RectangleD GetImageAlphaBorder(
  ImageD image,
  double threshold,
) => _module.GetImageAlphaBorder(image, threshold);

/// See [RaylibCoreFlat.GetImageColor].
ColorD GetImageColor(
  ImageD image,
  int x,
  int y,
) => _module.GetImageColor(image, x, y);

/// See [RaylibCoreFlat.ImageClearBackground].
void ImageClearBackground(
  StructPointer<ImageD> dst,
  ColorD color,
) => _module.ImageClearBackground(dst, color);

/// See [RaylibCoreFlat.ImageDrawPixel].
void ImageDrawPixel(
  StructPointer<ImageD> dst,
  int posX,
  int posY,
  ColorD color,
) => _module.ImageDrawPixel(dst, posX, posY, color);

/// See [RaylibCoreFlat.ImageDrawPixelV].
void ImageDrawPixelV(
  StructPointer<ImageD> dst,
  Vector2D position,
  ColorD color,
) => _module.ImageDrawPixelV(dst, position, color);

/// See [RaylibCoreFlat.ImageDrawLine].
void ImageDrawLine(
  StructPointer<ImageD> dst,
  int startPosX,
  int startPosY,
  int endPosX,
  int endPosY,
  ColorD color,
) => _module.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreFlat.ImageDrawLineV].
void ImageDrawLineV(
  StructPointer<ImageD> dst,
  Vector2D start,
  Vector2D end,
  ColorD color,
) => _module.ImageDrawLineV(dst, start, end, color);

/// See [RaylibCoreFlat.ImageDrawLineEx].
void ImageDrawLineEx(
  StructPointer<ImageD> dst,
  Vector2D start,
  Vector2D end,
  int thick,
  ColorD color,
) => _module.ImageDrawLineEx(dst, start, end, thick, color);

/// See [RaylibCoreFlat.ImageDrawCircle].
void ImageDrawCircle(
  StructPointer<ImageD> dst,
  int centerX,
  int centerY,
  int radius,
  ColorD color,
) => _module.ImageDrawCircle(dst, centerX, centerY, radius, color);

/// See [RaylibCoreFlat.ImageDrawCircleV].
void ImageDrawCircleV(
  StructPointer<ImageD> dst,
  Vector2D center,
  int radius,
  ColorD color,
) => _module.ImageDrawCircleV(dst, center, radius, color);

/// See [RaylibCoreFlat.ImageDrawCircleLines].
void ImageDrawCircleLines(
  StructPointer<ImageD> dst,
  int centerX,
  int centerY,
  int radius,
  ColorD color,
) => _module.ImageDrawCircleLines(dst, centerX, centerY, radius, color);

/// See [RaylibCoreFlat.ImageDrawCircleLinesV].
void ImageDrawCircleLinesV(
  StructPointer<ImageD> dst,
  Vector2D center,
  int radius,
  ColorD color,
) => _module.ImageDrawCircleLinesV(dst, center, radius, color);

/// See [RaylibCoreFlat.ImageDrawRectangle].
void ImageDrawRectangle(
  StructPointer<ImageD> dst,
  int posX,
  int posY,
  int width,
  int height,
  ColorD color,
) => _module.ImageDrawRectangle(dst, posX, posY, width, height, color);

/// See [RaylibCoreFlat.ImageDrawRectangleV].
void ImageDrawRectangleV(
  StructPointer<ImageD> dst,
  Vector2D position,
  Vector2D size,
  ColorD color,
) => _module.ImageDrawRectangleV(dst, position, size, color);

/// See [RaylibCoreFlat.ImageDrawRectangleRec].
void ImageDrawRectangleRec(
  StructPointer<ImageD> dst,
  RectangleD rec,
  ColorD color,
) => _module.ImageDrawRectangleRec(dst, rec, color);

/// See [RaylibCoreFlat.ImageDrawRectangleLines].
void ImageDrawRectangleLines(
  StructPointer<ImageD> dst,
  RectangleD rec,
  int thick,
  ColorD color,
) => _module.ImageDrawRectangleLines(dst, rec, thick, color);

/// See [RaylibCoreFlat.ImageDrawTriangle].
void ImageDrawTriangle(
  StructPointer<ImageD> dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.ImageDrawTriangle(dst, v1, v2, v3, color);

/// See [RaylibCoreFlat.ImageDrawTriangleEx].
void ImageDrawTriangleEx(
  StructPointer<ImageD> dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD c1,
  ColorD c2,
  ColorD c3,
) => _module.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3);

/// See [RaylibCoreFlat.ImageDrawTriangleLines].
void ImageDrawTriangleLines(
  StructPointer<ImageD> dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.ImageDrawTriangleLines(dst, v1, v2, v3, color);

/// See [RaylibCoreFlat.ImageDrawTriangleFan].
void ImageDrawTriangleFan(
  StructPointer<ImageD> dst,
  StructPointer<Vector2D> points,
  int pointCount,
  ColorD color,
) => _module.ImageDrawTriangleFan(dst, points, pointCount, color);

/// See [RaylibCoreFlat.ImageDrawTriangleStrip].
void ImageDrawTriangleStrip(
  StructPointer<ImageD> dst,
  StructPointer<Vector2D> points,
  int pointCount,
  ColorD color,
) => _module.ImageDrawTriangleStrip(dst, points, pointCount, color);

/// See [RaylibCoreFlat.ImageDraw].
void ImageDraw(
  StructPointer<ImageD> dst,
  ImageD src,
  RectangleD srcRec,
  RectangleD dstRec,
  ColorD tint,
) => _module.ImageDraw(dst, src, srcRec, dstRec, tint);

/// See [RaylibCoreFlat.ImageDrawText].
void ImageDrawText(
  StructPointer<ImageD> dst,
  MemoryPointer<RChar> text,
  int posX,
  int posY,
  int fontSize,
  ColorD color,
) => _module.ImageDrawText(dst, text, posX, posY, fontSize, color);

/// See [RaylibCoreFlat.ImageDrawTextEx].
void ImageDrawTextEx(
  StructPointer<ImageD> dst,
  FontD font,
  MemoryPointer<RChar> text,
  Vector2D position,
  double fontSize,
  double spacing,
  ColorD tint,
) => _module.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreFlat.LoadTexture].
TextureD LoadTexture(
  MemoryPointer<RChar> fileName,
) => _module.LoadTexture(fileName);

/// See [RaylibCoreFlat.LoadTextureFromImage].
TextureD LoadTextureFromImage(
  ImageD image,
) => _module.LoadTextureFromImage(image);

/// See [RaylibCoreFlat.LoadTextureCubemap].
TextureD LoadTextureCubemap(
  ImageD image,
  int layout,
) => _module.LoadTextureCubemap(image, layout);

/// See [RaylibCoreFlat.LoadRenderTexture].
RenderTextureD LoadRenderTexture(
  int width,
  int height,
) => _module.LoadRenderTexture(width, height);

/// See [RaylibCoreFlat.IsTextureValid].
bool IsTextureValid(
  TextureD texture,
) => _module.IsTextureValid(texture);

/// See [RaylibCoreFlat.UnloadTexture].
void UnloadTexture(
  TextureD texture,
) => _module.UnloadTexture(texture);

/// See [RaylibCoreFlat.IsRenderTextureValid].
bool IsRenderTextureValid(
  RenderTextureD target,
) => _module.IsRenderTextureValid(target);

/// See [RaylibCoreFlat.UnloadRenderTexture].
void UnloadRenderTexture(
  RenderTextureD target,
) => _module.UnloadRenderTexture(target);

/// See [RaylibCoreFlat.UpdateTexture].
void UpdateTexture(
  TextureD texture,
  MemoryPointer<RVoid> pixels,
) => _module.UpdateTexture(texture, pixels);

/// See [RaylibCoreFlat.UpdateTextureRec].
void UpdateTextureRec(
  TextureD texture,
  RectangleD rec,
  MemoryPointer<RVoid> pixels,
) => _module.UpdateTextureRec(texture, rec, pixels);

/// See [RaylibCoreFlat.GenTextureMipmaps].
void GenTextureMipmaps(
  StructPointer<TextureD> texture,
) => _module.GenTextureMipmaps(texture);

/// See [RaylibCoreFlat.SetTextureFilter].
void SetTextureFilter(
  TextureD texture,
  int filter,
) => _module.SetTextureFilter(texture, filter);

/// See [RaylibCoreFlat.SetTextureWrap].
void SetTextureWrap(
  TextureD texture,
  int wrap,
) => _module.SetTextureWrap(texture, wrap);

/// See [RaylibCoreFlat.DrawTexture].
void DrawTexture(
  TextureD texture,
  int posX,
  int posY,
  ColorD tint,
) => _module.DrawTexture(texture, posX, posY, tint);

/// See [RaylibCoreFlat.DrawTextureV].
void DrawTextureV(
  TextureD texture,
  Vector2D position,
  ColorD tint,
) => _module.DrawTextureV(texture, position, tint);

/// See [RaylibCoreFlat.DrawTextureEx].
void DrawTextureEx(
  TextureD texture,
  Vector2D position,
  double rotation,
  double scale,
  ColorD tint,
) => _module.DrawTextureEx(texture, position, rotation, scale, tint);

/// See [RaylibCoreFlat.DrawTextureRec].
void DrawTextureRec(
  TextureD texture,
  RectangleD source,
  Vector2D position,
  ColorD tint,
) => _module.DrawTextureRec(texture, source, position, tint);

/// See [RaylibCoreFlat.DrawTexturePro].
void DrawTexturePro(
  TextureD texture,
  RectangleD source,
  RectangleD dest,
  Vector2D origin,
  double rotation,
  ColorD tint,
) => _module.DrawTexturePro(texture, source, dest, origin, rotation, tint);

/// See [RaylibCoreFlat.DrawTextureNPatch].
void DrawTextureNPatch(
  TextureD texture,
  NPatchInfoD nPatchInfo,
  RectangleD dest,
  Vector2D origin,
  double rotation,
  ColorD tint,
) => _module.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint);

/// See [RaylibCoreFlat.ColorIsEqual].
bool ColorIsEqual(
  ColorD col1,
  ColorD col2,
) => _module.ColorIsEqual(col1, col2);

/// See [RaylibCoreFlat.Fade].
ColorD Fade(
  ColorD color,
  double alpha,
) => _module.Fade(color, alpha);

/// See [RaylibCoreFlat.ColorToInt].
int ColorToInt(
  ColorD color,
) => _module.ColorToInt(color);

/// See [RaylibCoreFlat.ColorNormalize].
Vector4D ColorNormalize(
  ColorD color,
) => _module.ColorNormalize(color);

/// See [RaylibCoreFlat.ColorFromNormalized].
ColorD ColorFromNormalized(
  Vector4D normalized,
) => _module.ColorFromNormalized(normalized);

/// See [RaylibCoreFlat.ColorToHSV].
Vector3D ColorToHSV(
  ColorD color,
) => _module.ColorToHSV(color);

/// See [RaylibCoreFlat.ColorFromHSV].
ColorD ColorFromHSV(
  double hue,
  double saturation,
  double value,
) => _module.ColorFromHSV(hue, saturation, value);

/// See [RaylibCoreFlat.ColorTint].
ColorD ColorTint(
  ColorD color,
  ColorD tint,
) => _module.ColorTint(color, tint);

/// See [RaylibCoreFlat.ColorBrightness].
ColorD ColorBrightness(
  ColorD color,
  double factor,
) => _module.ColorBrightness(color, factor);

/// See [RaylibCoreFlat.ColorContrast].
ColorD ColorContrast(
  ColorD color,
  double contrast,
) => _module.ColorContrast(color, contrast);

/// See [RaylibCoreFlat.ColorAlpha].
ColorD ColorAlpha(
  ColorD color,
  double alpha,
) => _module.ColorAlpha(color, alpha);

/// See [RaylibCoreFlat.ColorAlphaBlend].
ColorD ColorAlphaBlend(
  ColorD dst,
  ColorD src,
  ColorD tint,
) => _module.ColorAlphaBlend(dst, src, tint);

/// See [RaylibCoreFlat.ColorLerp].
ColorD ColorLerp(
  ColorD color1,
  ColorD color2,
  double factor,
) => _module.ColorLerp(color1, color2, factor);

/// See [RaylibCoreFlat.GetColor].
ColorD GetColor(
  int hexValue,
) => _module.GetColor(hexValue);

/// See [RaylibCoreFlat.GetPixelColor].
ColorD GetPixelColor(
  MemoryPointer<RVoid> srcPtr,
  int format,
) => _module.GetPixelColor(srcPtr, format);

/// See [RaylibCoreFlat.SetPixelColor].
void SetPixelColor(
  MemoryPointer<RVoid> dstPtr,
  ColorD color,
  int format,
) => _module.SetPixelColor(dstPtr, color, format);

/// See [RaylibCoreFlat.GetPixelDataSize].
int GetPixelDataSize(
  int width,
  int height,
  int format,
) => _module.GetPixelDataSize(width, height, format);

/// See [RaylibCoreFlat.GetFontDefault].
FontD GetFontDefault() => _module.GetFontDefault();

/// See [RaylibCoreFlat.LoadFont].
FontD LoadFont(
  MemoryPointer<RChar> fileName,
) => _module.LoadFont(fileName);

/// See [RaylibCoreFlat.LoadFontEx].
FontD LoadFontEx(
  MemoryPointer<RChar> fileName,
  int fontSize,
  MemoryPointer<RInt> codepoints,
  int codepointCount,
) => _module.LoadFontEx(fileName, fontSize, codepoints, codepointCount);

/// See [RaylibCoreFlat.LoadFontFromImage].
FontD LoadFontFromImage(
  ImageD image,
  ColorD key,
  int firstChar,
) => _module.LoadFontFromImage(image, key, firstChar);

/// See [RaylibCoreFlat.LoadFontFromMemory].
FontD LoadFontFromMemory(
  MemoryPointer<RChar> fileType,
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
  int fontSize,
  MemoryPointer<RInt> codepoints,
  int codepointCount,
) => _module.LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount);

/// See [RaylibCoreFlat.IsFontValid].
bool IsFontValid(
  FontD font,
) => _module.IsFontValid(font);

/// See [RaylibCoreFlat.LoadFontData].
StructPointer<GlyphInfoD> LoadFontData(
  MemoryPointer<RUnsignedChar> fileData,
  int dataSize,
  int fontSize,
  MemoryPointer<RInt> codepoints,
  int codepointCount,
  int type,
  MemoryPointer<RInt> glyphCount,
) => _module.LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type, glyphCount);

/// See [RaylibCoreFlat.GenImageFontAtlas].
ImageD GenImageFontAtlas(
  StructPointer<GlyphInfoD> glyphs,
  MemoryPointer<RPointer<RStruct>> glyphRecs, // RectangleD
  int glyphCount,
  int fontSize,
  int padding,
  int packMethod,
) => _module.GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod);

/// See [RaylibCoreFlat.UnloadFontData].
void UnloadFontData(
  StructPointer<GlyphInfoD> glyphs,
  int glyphCount,
) => _module.UnloadFontData(glyphs, glyphCount);

/// See [RaylibCoreFlat.UnloadFont].
void UnloadFont(
  FontD font,
) => _module.UnloadFont(font);

/// See [RaylibCoreFlat.ExportFontAsCode].
bool ExportFontAsCode(
  FontD font,
  MemoryPointer<RChar> fileName,
) => _module.ExportFontAsCode(font, fileName);

/// See [RaylibCoreFlat.DrawFPS].
void DrawFPS(
  int posX,
  int posY,
) => _module.DrawFPS(posX, posY);

/// See [RaylibCoreFlat.DrawText].
void DrawText(
  MemoryPointer<RChar> text,
  int posX,
  int posY,
  int fontSize,
  ColorD color,
) => _module.DrawText(text, posX, posY, fontSize, color);

/// See [RaylibCoreFlat.DrawTextEx].
void DrawTextEx(
  FontD font,
  MemoryPointer<RChar> text,
  Vector2D position,
  double fontSize,
  double spacing,
  ColorD tint,
) => _module.DrawTextEx(font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreFlat.DrawTextPro].
void DrawTextPro(
  FontD font,
  MemoryPointer<RChar> text,
  Vector2D position,
  Vector2D origin,
  double rotation,
  double fontSize,
  double spacing,
  ColorD tint,
) => _module.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint);

/// See [RaylibCoreFlat.DrawTextCodepoint].
void DrawTextCodepoint(
  FontD font,
  int codepoint,
  Vector2D position,
  double fontSize,
  ColorD tint,
) => _module.DrawTextCodepoint(font, codepoint, position, fontSize, tint);

/// See [RaylibCoreFlat.DrawTextCodepoints].
void DrawTextCodepoints(
  FontD font,
  MemoryPointer<RInt> codepoints,
  int codepointCount,
  Vector2D position,
  double fontSize,
  double spacing,
  ColorD tint,
) => _module.DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint);

/// See [RaylibCoreFlat.SetTextLineSpacing].
void SetTextLineSpacing(
  int spacing,
) => _module.SetTextLineSpacing(spacing);

/// See [RaylibCoreFlat.MeasureText].
int MeasureText(
  MemoryPointer<RChar> text,
  int fontSize,
) => _module.MeasureText(text, fontSize);

/// See [RaylibCoreFlat.MeasureTextEx].
Vector2D MeasureTextEx(
  FontD font,
  MemoryPointer<RChar> text,
  double fontSize,
  double spacing,
) => _module.MeasureTextEx(font, text, fontSize, spacing);

/// See [RaylibCoreFlat.MeasureTextCodepoints].
Vector2D MeasureTextCodepoints(
  FontD font,
  MemoryPointer<RInt> codepoints,
  int length,
  double fontSize,
  double spacing,
) => _module.MeasureTextCodepoints(font, codepoints, length, fontSize, spacing);

/// See [RaylibCoreFlat.GetGlyphIndex].
int GetGlyphIndex(
  FontD font,
  int codepoint,
) => _module.GetGlyphIndex(font, codepoint);

/// See [RaylibCoreFlat.GetGlyphInfo].
GlyphInfoD GetGlyphInfo(
  FontD font,
  int codepoint,
) => _module.GetGlyphInfo(font, codepoint);

/// See [RaylibCoreFlat.GetGlyphAtlasRec].
RectangleD GetGlyphAtlasRec(
  FontD font,
  int codepoint,
) => _module.GetGlyphAtlasRec(font, codepoint);

/// See [RaylibCoreFlat.LoadUTF8].
NativeMemoryPointer<RChar> LoadUTF8(
  MemoryPointer<RInt> codepoints,
  int length,
) => _module.LoadUTF8(codepoints, length);

/// See [RaylibCoreFlat.UnloadUTF8].
void UnloadUTF8(
  MemoryPointer<RChar> text,
) => _module.UnloadUTF8(text);

/// See [RaylibCoreFlat.LoadCodepoints].
NativeMemoryPointer<RInt> LoadCodepoints(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> count,
) => _module.LoadCodepoints(text, count);

/// See [RaylibCoreFlat.UnloadCodepoints].
void UnloadCodepoints(
  MemoryPointer<RInt> codepoints,
) => _module.UnloadCodepoints(codepoints);

/// See [RaylibCoreFlat.GetCodepointCount].
int GetCodepointCount(
  MemoryPointer<RChar> text,
) => _module.GetCodepointCount(text);

/// See [RaylibCoreFlat.GetCodepoint].
int GetCodepoint(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> codepointSize,
) => _module.GetCodepoint(text, codepointSize);

/// See [RaylibCoreFlat.GetCodepointNext].
int GetCodepointNext(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> codepointSize,
) => _module.GetCodepointNext(text, codepointSize);

/// See [RaylibCoreFlat.GetCodepointPrevious].
int GetCodepointPrevious(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> codepointSize,
) => _module.GetCodepointPrevious(text, codepointSize);

/// See [RaylibCoreFlat.CodepointToUTF8].
NativeMemoryPointer<RChar> CodepointToUTF8(
  int codepoint,
  MemoryPointer<RInt> utf8Size,
) => _module.CodepointToUTF8(codepoint, utf8Size);

/// See [RaylibCoreFlat.LoadTextLines].
NativeMemoryPointer<RPointer<RChar>> LoadTextLines(
  MemoryPointer<RChar> text,
  MemoryPointer<RInt> count,
) => _module.LoadTextLines(text, count);

/// See [RaylibCoreFlat.UnloadTextLines].
void UnloadTextLines(
  MemoryPointer<RPointer<RChar>> text,
  int lineCount,
) => _module.UnloadTextLines(text, lineCount);

/// See [RaylibCoreFlat.TextCopy].
int TextCopy(
  MemoryPointer<RChar> dst,
  MemoryPointer<RChar> src,
) => _module.TextCopy(dst, src);

/// See [RaylibCoreFlat.TextIsEqual].
bool TextIsEqual(
  MemoryPointer<RChar> text1,
  MemoryPointer<RChar> text2,
) => _module.TextIsEqual(text1, text2);

/// See [RaylibCoreFlat.TextLength].
int TextLength(
  MemoryPointer<RChar> text,
) => _module.TextLength(text);

/// See [RaylibCoreFlat.TextFormat].
@Deprecated('va_list is not supported')
MemoryPointer<RChar> TextFormat(
  MemoryPointer<RChar> text,
) => _module.TextFormat(text);

/// See [RaylibCoreFlat.TextSubtext].
NativeMemoryPointer<RChar> TextSubtext(
  MemoryPointer<RChar> text,
  int position,
  int length,
) => _module.TextSubtext(text, position, length);

/// See [RaylibCoreFlat.TextRemoveSpaces].
NativeMemoryPointer<RChar> TextRemoveSpaces(
  MemoryPointer<RChar> text,
) => _module.TextRemoveSpaces(text);

/// See [RaylibCoreFlat.GetTextBetween].
NativeMemoryPointer<RChar> GetTextBetween(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> begin,
  MemoryPointer<RChar> end,
) => _module.GetTextBetween(text, begin, end);

/// See [RaylibCoreFlat.TextReplace].
NativeMemoryPointer<RChar> TextReplace(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> replace,
  MemoryPointer<RChar> by,
) => _module.TextReplace(text, replace, by);

/// See [RaylibCoreFlat.TextReplaceAlloc].
NativeMemoryPointer<RChar> TextReplaceAlloc(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> replace,
  MemoryPointer<RChar> by,
) => _module.TextReplaceAlloc(text, replace, by);

/// See [RaylibCoreFlat.TextReplaceBetween].
NativeMemoryPointer<RChar> TextReplaceBetween(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> begin,
  MemoryPointer<RChar> end,
  MemoryPointer<RChar> replacement,
) => _module.TextReplaceBetween(text, begin, end, replacement);

/// See [RaylibCoreFlat.TextReplaceBetweenAlloc].
NativeMemoryPointer<RChar> TextReplaceBetweenAlloc(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> begin,
  MemoryPointer<RChar> end,
  MemoryPointer<RChar> replacement,
) => _module.TextReplaceBetweenAlloc(text, begin, end, replacement);

/// See [RaylibCoreFlat.TextInsert].
NativeMemoryPointer<RChar> TextInsert(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> insert,
  int position,
) => _module.TextInsert(text, insert, position);

/// See [RaylibCoreFlat.TextInsertAlloc].
NativeMemoryPointer<RChar> TextInsertAlloc(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> insert,
  int position,
) => _module.TextInsertAlloc(text, insert, position);

/// See [RaylibCoreFlat.TextJoin].
NativeMemoryPointer<RChar> TextJoin(
  MemoryPointer<RPointer<RChar>> textList,
  int count,
  MemoryPointer<RChar> delimiter,
) => _module.TextJoin(textList, count, delimiter);

/// See [RaylibCoreFlat.TextSplit].
NativeMemoryPointer<RPointer<RChar>> TextSplit(
  MemoryPointer<RChar> text,
  int delimiter,
  MemoryPointer<RInt> count,
) => _module.TextSplit(text, delimiter, count);

/// See [RaylibCoreFlat.TextAppend].
void TextAppend(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> append,
  MemoryPointer<RInt> position,
) => _module.TextAppend(text, append, position);

/// See [RaylibCoreFlat.TextFindIndex].
int TextFindIndex(
  MemoryPointer<RChar> text,
  MemoryPointer<RChar> find,
) => _module.TextFindIndex(text, find);

/// See [RaylibCoreFlat.TextToUpper].
NativeMemoryPointer<RChar> TextToUpper(
  MemoryPointer<RChar> text,
) => _module.TextToUpper(text);

/// See [RaylibCoreFlat.TextToLower].
NativeMemoryPointer<RChar> TextToLower(
  MemoryPointer<RChar> text,
) => _module.TextToLower(text);

/// See [RaylibCoreFlat.TextToPascal].
NativeMemoryPointer<RChar> TextToPascal(
  MemoryPointer<RChar> text,
) => _module.TextToPascal(text);

/// See [RaylibCoreFlat.TextToSnake].
NativeMemoryPointer<RChar> TextToSnake(
  MemoryPointer<RChar> text,
) => _module.TextToSnake(text);

/// See [RaylibCoreFlat.TextToCamel].
NativeMemoryPointer<RChar> TextToCamel(
  MemoryPointer<RChar> text,
) => _module.TextToCamel(text);

/// See [RaylibCoreFlat.TextToInteger].
int TextToInteger(
  MemoryPointer<RChar> text,
) => _module.TextToInteger(text);

/// See [RaylibCoreFlat.TextToFloat].
double TextToFloat(
  MemoryPointer<RChar> text,
) => _module.TextToFloat(text);

/// See [RaylibCoreFlat.DrawLine3D].
void DrawLine3D(
  Vector3D startPos,
  Vector3D endPos,
  ColorD color,
) => _module.DrawLine3D(startPos, endPos, color);

/// See [RaylibCoreFlat.DrawPoint3D].
void DrawPoint3D(
  Vector3D position,
  ColorD color,
) => _module.DrawPoint3D(position, color);

/// See [RaylibCoreFlat.DrawCircle3D].
void DrawCircle3D(
  Vector3D center,
  double radius,
  Vector3D rotationAxis,
  double rotationAngle,
  ColorD color,
) => _module.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color);

/// See [RaylibCoreFlat.DrawTriangle3D].
void DrawTriangle3D(
  Vector3D v1,
  Vector3D v2,
  Vector3D v3,
  ColorD color,
) => _module.DrawTriangle3D(v1, v2, v3, color);

/// See [RaylibCoreFlat.DrawTriangleStrip3D].
void DrawTriangleStrip3D(
  StructPointer<Vector3D> points,
  int pointCount,
  ColorD color,
) => _module.DrawTriangleStrip3D(points, pointCount, color);

/// See [RaylibCoreFlat.DrawCube].
void DrawCube(
  Vector3D position,
  double width,
  double height,
  double length,
  ColorD color,
) => _module.DrawCube(position, width, height, length, color);

/// See [RaylibCoreFlat.DrawCubeV].
void DrawCubeV(
  Vector3D position,
  Vector3D size,
  ColorD color,
) => _module.DrawCubeV(position, size, color);

/// See [RaylibCoreFlat.DrawCubeWires].
void DrawCubeWires(
  Vector3D position,
  double width,
  double height,
  double length,
  ColorD color,
) => _module.DrawCubeWires(position, width, height, length, color);

/// See [RaylibCoreFlat.DrawCubeWiresV].
void DrawCubeWiresV(
  Vector3D position,
  Vector3D size,
  ColorD color,
) => _module.DrawCubeWiresV(position, size, color);

/// See [RaylibCoreFlat.DrawSphere].
void DrawSphere(
  Vector3D centerPos,
  double radius,
  ColorD color,
) => _module.DrawSphere(centerPos, radius, color);

/// See [RaylibCoreFlat.DrawSphereEx].
void DrawSphereEx(
  Vector3D centerPos,
  double radius,
  int rings,
  int slices,
  ColorD color,
) => _module.DrawSphereEx(centerPos, radius, rings, slices, color);

/// See [RaylibCoreFlat.DrawSphereWires].
void DrawSphereWires(
  Vector3D centerPos,
  double radius,
  int rings,
  int slices,
  ColorD color,
) => _module.DrawSphereWires(centerPos, radius, rings, slices, color);

/// See [RaylibCoreFlat.DrawCylinder].
void DrawCylinder(
  Vector3D position,
  double radiusTop,
  double radiusBottom,
  double height,
  int slices,
  ColorD color,
) => _module.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreFlat.DrawCylinderEx].
void DrawCylinderEx(
  Vector3D startPos,
  Vector3D endPos,
  double startRadius,
  double endRadius,
  int sides,
  ColorD color,
) => _module.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreFlat.DrawCylinderWires].
void DrawCylinderWires(
  Vector3D position,
  double radiusTop,
  double radiusBottom,
  double height,
  int slices,
  ColorD color,
) => _module.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreFlat.DrawCylinderWiresEx].
void DrawCylinderWiresEx(
  Vector3D startPos,
  Vector3D endPos,
  double startRadius,
  double endRadius,
  int sides,
  ColorD color,
) => _module.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreFlat.DrawCapsule].
void DrawCapsule(
  Vector3D startPos,
  Vector3D endPos,
  double radius,
  int slices,
  int rings,
  ColorD color,
) => _module.DrawCapsule(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreFlat.DrawCapsuleWires].
void DrawCapsuleWires(
  Vector3D startPos,
  Vector3D endPos,
  double radius,
  int slices,
  int rings,
  ColorD color,
) => _module.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreFlat.DrawPlane].
void DrawPlane(
  Vector3D centerPos,
  Vector2D size,
  ColorD color,
) => _module.DrawPlane(centerPos, size, color);

/// See [RaylibCoreFlat.DrawRay].
void DrawRay(
  RayD ray,
  ColorD color,
) => _module.DrawRay(ray, color);

/// See [RaylibCoreFlat.DrawGrid].
void DrawGrid(
  int slices,
  double spacing,
) => _module.DrawGrid(slices, spacing);

/// See [RaylibCoreFlat.LoadModel].
ModelD LoadModel(
  MemoryPointer<RChar> fileName,
) => _module.LoadModel(fileName);

/// See [RaylibCoreFlat.LoadModelFromMesh].
ModelD LoadModelFromMesh(
  MeshD mesh,
) => _module.LoadModelFromMesh(mesh);

/// See [RaylibCoreFlat.IsModelValid].
bool IsModelValid(
  ModelD model,
) => _module.IsModelValid(model);

/// See [RaylibCoreFlat.UnloadModel].
void UnloadModel(
  ModelD model,
) => _module.UnloadModel(model);

/// See [RaylibCoreFlat.GetModelBoundingBox].
BoundingBoxD GetModelBoundingBox(
  ModelD model,
) => _module.GetModelBoundingBox(model);

/// See [RaylibCoreFlat.DrawModel].
void DrawModel(
  ModelD model,
  Vector3D position,
  double scale,
  ColorD tint,
) => _module.DrawModel(model, position, scale, tint);

/// See [RaylibCoreFlat.DrawModelEx].
void DrawModelEx(
  ModelD model,
  Vector3D position,
  Vector3D rotationAxis,
  double rotationAngle,
  Vector3D scale,
  ColorD tint,
) => _module.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreFlat.DrawModelWires].
void DrawModelWires(
  ModelD model,
  Vector3D position,
  double scale,
  ColorD tint,
) => _module.DrawModelWires(model, position, scale, tint);

/// See [RaylibCoreFlat.DrawModelWiresEx].
void DrawModelWiresEx(
  ModelD model,
  Vector3D position,
  Vector3D rotationAxis,
  double rotationAngle,
  Vector3D scale,
  ColorD tint,
) => _module.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreFlat.DrawBoundingBox].
void DrawBoundingBox(
  BoundingBoxD box,
  ColorD color,
) => _module.DrawBoundingBox(box, color);

/// See [RaylibCoreFlat.DrawBillboard].
void DrawBillboard(
  Camera3DD camera,
  TextureD texture,
  Vector3D position,
  double scale,
  ColorD tint,
) => _module.DrawBillboard(camera, texture, position, scale, tint);

/// See [RaylibCoreFlat.DrawBillboardRec].
void DrawBillboardRec(
  Camera3DD camera,
  TextureD texture,
  RectangleD source,
  Vector3D position,
  Vector2D size,
  ColorD tint,
) => _module.DrawBillboardRec(camera, texture, source, position, size, tint);

/// See [RaylibCoreFlat.DrawBillboardPro].
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
) => _module.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint);

/// See [RaylibCoreFlat.UploadMesh].
void UploadMesh(
  StructPointer<MeshD> mesh,
  bool dynamic,
) => _module.UploadMesh(mesh, dynamic);

/// See [RaylibCoreFlat.UpdateMeshBuffer].
void UpdateMeshBuffer(
  MeshD mesh,
  int index,
  MemoryPointer<RVoid> data,
  int dataSize,
  int offset,
) => _module.UpdateMeshBuffer(mesh, index, data, dataSize, offset);

/// See [RaylibCoreFlat.UnloadMesh].
void UnloadMesh(
  MeshD mesh,
) => _module.UnloadMesh(mesh);

/// See [RaylibCoreFlat.DrawMesh].
void DrawMesh(
  MeshD mesh,
  MaterialD material,
  MatrixD transform,
) => _module.DrawMesh(mesh, material, transform);

/// See [RaylibCoreFlat.DrawMeshInstanced].
void DrawMeshInstanced(
  MeshD mesh,
  MaterialD material,
  StructPointer<MatrixD> transforms,
  int instances,
) => _module.DrawMeshInstanced(mesh, material, transforms, instances);

/// See [RaylibCoreFlat.GetMeshBoundingBox].
BoundingBoxD GetMeshBoundingBox(
  MeshD mesh,
) => _module.GetMeshBoundingBox(mesh);

/// See [RaylibCoreFlat.GenMeshTangents].
void GenMeshTangents(
  StructPointer<MeshD> mesh,
) => _module.GenMeshTangents(mesh);

/// See [RaylibCoreFlat.ExportMesh].
bool ExportMesh(
  MeshD mesh,
  MemoryPointer<RChar> fileName,
) => _module.ExportMesh(mesh, fileName);

/// See [RaylibCoreFlat.ExportMeshAsCode].
bool ExportMeshAsCode(
  MeshD mesh,
  MemoryPointer<RChar> fileName,
) => _module.ExportMeshAsCode(mesh, fileName);

/// See [RaylibCoreFlat.GenMeshPoly].
MeshD GenMeshPoly(
  int sides,
  double radius,
) => _module.GenMeshPoly(sides, radius);

/// See [RaylibCoreFlat.GenMeshPlane].
MeshD GenMeshPlane(
  double width,
  double length,
  int resX,
  int resZ,
) => _module.GenMeshPlane(width, length, resX, resZ);

/// See [RaylibCoreFlat.GenMeshCube].
MeshD GenMeshCube(
  double width,
  double height,
  double length,
) => _module.GenMeshCube(width, height, length);

/// See [RaylibCoreFlat.GenMeshSphere].
MeshD GenMeshSphere(
  double radius,
  int rings,
  int slices,
) => _module.GenMeshSphere(radius, rings, slices);

/// See [RaylibCoreFlat.GenMeshHemiSphere].
MeshD GenMeshHemiSphere(
  double radius,
  int rings,
  int slices,
) => _module.GenMeshHemiSphere(radius, rings, slices);

/// See [RaylibCoreFlat.GenMeshCylinder].
MeshD GenMeshCylinder(
  double radius,
  double height,
  int slices,
) => _module.GenMeshCylinder(radius, height, slices);

/// See [RaylibCoreFlat.GenMeshCone].
MeshD GenMeshCone(
  double radius,
  double height,
  int slices,
) => _module.GenMeshCone(radius, height, slices);

/// See [RaylibCoreFlat.GenMeshTorus].
MeshD GenMeshTorus(
  double radius,
  double size,
  int radSeg,
  int sides,
) => _module.GenMeshTorus(radius, size, radSeg, sides);

/// See [RaylibCoreFlat.GenMeshKnot].
MeshD GenMeshKnot(
  double radius,
  double size,
  int radSeg,
  int sides,
) => _module.GenMeshKnot(radius, size, radSeg, sides);

/// See [RaylibCoreFlat.GenMeshHeightmap].
MeshD GenMeshHeightmap(
  ImageD heightmap,
  Vector3D size,
) => _module.GenMeshHeightmap(heightmap, size);

/// See [RaylibCoreFlat.GenMeshCubicmap].
MeshD GenMeshCubicmap(
  ImageD cubicmap,
  Vector3D cubeSize,
) => _module.GenMeshCubicmap(cubicmap, cubeSize);

/// See [RaylibCoreFlat.LoadMaterials].
StructPointer<MaterialD> LoadMaterials(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RInt> materialCount,
) => _module.LoadMaterials(fileName, materialCount);

/// See [RaylibCoreFlat.LoadMaterialDefault].
MaterialD LoadMaterialDefault() => _module.LoadMaterialDefault();

/// See [RaylibCoreFlat.IsMaterialValid].
bool IsMaterialValid(
  MaterialD material,
) => _module.IsMaterialValid(material);

/// See [RaylibCoreFlat.UnloadMaterial].
void UnloadMaterial(
  MaterialD material,
) => _module.UnloadMaterial(material);

/// See [RaylibCoreFlat.SetMaterialTexture].
void SetMaterialTexture(
  StructPointer<MaterialD> material,
  int mapType,
  TextureD texture,
) => _module.SetMaterialTexture(material, mapType, texture);

/// See [RaylibCoreFlat.SetModelMeshMaterial].
void SetModelMeshMaterial(
  StructPointer<ModelD> model,
  int meshId,
  int materialId,
) => _module.SetModelMeshMaterial(model, meshId, materialId);

/// See [RaylibCoreFlat.LoadModelAnimations].
StructPointer<ModelAnimationD> LoadModelAnimations(
  MemoryPointer<RChar> fileName,
  MemoryPointer<RInt> animCount,
) => _module.LoadModelAnimations(fileName, animCount);

/// See [RaylibCoreFlat.UpdateModelAnimation].
void UpdateModelAnimation(
  ModelD model,
  ModelAnimationD anim,
  double frame,
) => _module.UpdateModelAnimation(model, anim, frame);

/// See [RaylibCoreFlat.UpdateModelAnimationEx].
void UpdateModelAnimationEx(
  ModelD model,
  ModelAnimationD animA,
  double frameA,
  ModelAnimationD animB,
  double frameB,
  double blend,
) => _module.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend);

/// See [RaylibCoreFlat.UnloadModelAnimations].
void UnloadModelAnimations(
  StructPointer<ModelAnimationD> animations,
  int animCount,
) => _module.UnloadModelAnimations(animations, animCount);

/// See [RaylibCoreFlat.IsModelAnimationValid].
bool IsModelAnimationValid(
  ModelD model,
  ModelAnimationD anim,
) => _module.IsModelAnimationValid(model, anim);

/// See [RaylibCoreFlat.CheckCollisionSpheres].
bool CheckCollisionSpheres(
  Vector3D center1,
  double radius1,
  Vector3D center2,
  double radius2,
) => _module.CheckCollisionSpheres(center1, radius1, center2, radius2);

/// See [RaylibCoreFlat.CheckCollisionBoxes].
bool CheckCollisionBoxes(
  BoundingBoxD box1,
  BoundingBoxD box2,
) => _module.CheckCollisionBoxes(box1, box2);

/// See [RaylibCoreFlat.CheckCollisionBoxSphere].
bool CheckCollisionBoxSphere(
  BoundingBoxD box,
  Vector3D center,
  double radius,
) => _module.CheckCollisionBoxSphere(box, center, radius);

/// See [RaylibCoreFlat.GetRayCollisionSphere].
RayCollisionD GetRayCollisionSphere(
  RayD ray,
  Vector3D center,
  double radius,
) => _module.GetRayCollisionSphere(ray, center, radius);

/// See [RaylibCoreFlat.GetRayCollisionBox].
RayCollisionD GetRayCollisionBox(
  RayD ray,
  BoundingBoxD box,
) => _module.GetRayCollisionBox(ray, box);

/// See [RaylibCoreFlat.GetRayCollisionMesh].
RayCollisionD GetRayCollisionMesh(
  RayD ray,
  MeshD mesh,
  MatrixD transform,
) => _module.GetRayCollisionMesh(ray, mesh, transform);

/// See [RaylibCoreFlat.GetRayCollisionTriangle].
RayCollisionD GetRayCollisionTriangle(
  RayD ray,
  Vector3D p1,
  Vector3D p2,
  Vector3D p3,
) => _module.GetRayCollisionTriangle(ray, p1, p2, p3);

/// See [RaylibCoreFlat.GetRayCollisionQuad].
RayCollisionD GetRayCollisionQuad(
  RayD ray,
  Vector3D p1,
  Vector3D p2,
  Vector3D p3,
  Vector3D p4,
) => _module.GetRayCollisionQuad(ray, p1, p2, p3, p4);
