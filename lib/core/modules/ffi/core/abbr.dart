import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibCore get _module => Raylib.instance.Core;

/// See [RaylibCore.InitWindow].
void InitWindow(int width, int height, Pointer<Char> title) => _module.InitWindow(width, height, title);

/// See [RaylibCore.CloseWindow].
void CloseWindow() => _module.CloseWindow();

/// See [RaylibCore.WindowShouldClose].
bool WindowShouldClose() => _module.WindowShouldClose();

/// See [RaylibCore.IsWindowReady].
bool IsWindowReady() => _module.IsWindowReady();

/// See [RaylibCore.IsWindowFullscreen].
bool IsWindowFullscreen() => _module.IsWindowFullscreen();

/// See [RaylibCore.IsWindowHidden].
bool IsWindowHidden() => _module.IsWindowHidden();

/// See [RaylibCore.IsWindowMinimized].
bool IsWindowMinimized() => _module.IsWindowMinimized();

/// See [RaylibCore.IsWindowMaximized].
bool IsWindowMaximized() => _module.IsWindowMaximized();

/// See [RaylibCore.IsWindowFocused].
bool IsWindowFocused() => _module.IsWindowFocused();

/// See [RaylibCore.IsWindowResized].
bool IsWindowResized() => _module.IsWindowResized();

/// See [RaylibCore.IsWindowState].
bool IsWindowState(int flag) => _module.IsWindowState(flag);

/// See [RaylibCore.SetWindowState].
void SetWindowState(int flags) => _module.SetWindowState(flags);

/// See [RaylibCore.ClearWindowState].
void ClearWindowState(int flags) => _module.ClearWindowState(flags);

/// See [RaylibCore.ToggleFullscreen].
void ToggleFullscreen() => _module.ToggleFullscreen();

/// See [RaylibCore.ToggleBorderlessWindowed].
void ToggleBorderlessWindowed() => _module.ToggleBorderlessWindowed();

/// See [RaylibCore.MaximizeWindow].
void MaximizeWindow() => _module.MaximizeWindow();

/// See [RaylibCore.MinimizeWindow].
void MinimizeWindow() => _module.MinimizeWindow();

/// See [RaylibCore.RestoreWindow].
void RestoreWindow() => _module.RestoreWindow();

/// See [RaylibCore.SetWindowIcon].
void SetWindowIcon(ImageC image) => _module.SetWindowIcon(image);

/// See [RaylibCore.SetWindowIcons].
void SetWindowIcons(Pointer<ImageC> images, int count) => _module.SetWindowIcons(images, count);

/// See [RaylibCore.SetWindowTitle].
void SetWindowTitle(Pointer<Char> title) => _module.SetWindowTitle(title);

/// See [RaylibCore.SetWindowPosition].
void SetWindowPosition(int x, int y) => _module.SetWindowPosition(x, y);

/// See [RaylibCore.SetWindowMonitor].
void SetWindowMonitor(int monitor) => _module.SetWindowMonitor(monitor);

/// See [RaylibCore.SetWindowMinSize].
void SetWindowMinSize(int width, int height) => _module.SetWindowMinSize(width, height);

/// See [RaylibCore.SetWindowMaxSize].
void SetWindowMaxSize(int width, int height) => _module.SetWindowMaxSize(width, height);

/// See [RaylibCore.SetWindowSize].
void SetWindowSize(int width, int height) => _module.SetWindowSize(width, height);

/// See [RaylibCore.SetWindowOpacity].
void SetWindowOpacity(double opacity) => _module.SetWindowOpacity(opacity);

/// See [RaylibCore.SetWindowFocused].
void SetWindowFocused() => _module.SetWindowFocused();

/// See [RaylibCore.GetWindowHandle].
Pointer<Void> GetWindowHandle() => _module.GetWindowHandle();

/// See [RaylibCore.GetScreenWidth].
int GetScreenWidth() => _module.GetScreenWidth();

/// See [RaylibCore.GetScreenHeight].
int GetScreenHeight() => _module.GetScreenHeight();

/// See [RaylibCore.GetRenderWidth].
int GetRenderWidth() => _module.GetRenderWidth();

/// See [RaylibCore.GetRenderHeight].
int GetRenderHeight() => _module.GetRenderHeight();

/// See [RaylibCore.GetMonitorCount].
int GetMonitorCount() => _module.GetMonitorCount();

/// See [RaylibCore.GetCurrentMonitor].
int GetCurrentMonitor() => _module.GetCurrentMonitor();

/// See [RaylibCore.GetMonitorPosition].
Vector2C GetMonitorPosition(int monitor) => _module.GetMonitorPosition(monitor);

/// See [RaylibCore.GetMonitorWidth].
int GetMonitorWidth(int monitor) => _module.GetMonitorWidth(monitor);

/// See [RaylibCore.GetMonitorHeight].
int GetMonitorHeight(int monitor) => _module.GetMonitorHeight(monitor);

/// See [RaylibCore.GetMonitorPhysicalWidth].
int GetMonitorPhysicalWidth(int monitor) => _module.GetMonitorPhysicalWidth(monitor);

/// See [RaylibCore.GetMonitorPhysicalHeight].
int GetMonitorPhysicalHeight(int monitor) => _module.GetMonitorPhysicalHeight(monitor);

/// See [RaylibCore.GetMonitorRefreshRate].
int GetMonitorRefreshRate(int monitor) => _module.GetMonitorRefreshRate(monitor);

/// See [RaylibCore.GetWindowPosition].
Vector2C GetWindowPosition() => _module.GetWindowPosition();

/// See [RaylibCore.GetWindowScaleDPI].
Vector2C GetWindowScaleDPI() => _module.GetWindowScaleDPI();

/// See [RaylibCore.GetMonitorName].
Pointer<Char> GetMonitorName(int monitor) => _module.GetMonitorName(monitor);

/// See [RaylibCore.SetClipboardText].
void SetClipboardText(Pointer<Char> text) => _module.SetClipboardText(text);

/// See [RaylibCore.GetClipboardText].
Pointer<Char> GetClipboardText() => _module.GetClipboardText();

/// See [RaylibCore.GetClipboardImage].
ImageC GetClipboardImage() => _module.GetClipboardImage();

/// See [RaylibCore.EnableEventWaiting].
void EnableEventWaiting() => _module.EnableEventWaiting();

/// See [RaylibCore.DisableEventWaiting].
void DisableEventWaiting() => _module.DisableEventWaiting();

/// See [RaylibCore.ShowCursor].
void ShowCursor() => _module.ShowCursor();

/// See [RaylibCore.HideCursor].
void HideCursor() => _module.HideCursor();

/// See [RaylibCore.IsCursorHidden].
bool IsCursorHidden() => _module.IsCursorHidden();

/// See [RaylibCore.EnableCursor].
void EnableCursor() => _module.EnableCursor();

/// See [RaylibCore.DisableCursor].
void DisableCursor() => _module.DisableCursor();

/// See [RaylibCore.IsCursorOnScreen].
bool IsCursorOnScreen() => _module.IsCursorOnScreen();

/// See [RaylibCore.ClearBackground].
void ClearBackground(ColorC color) => _module.ClearBackground(color);

/// See [RaylibCore.BeginDrawing].
void BeginDrawing() => _module.BeginDrawing();

/// See [RaylibCore.EndDrawing].
void EndDrawing() => _module.EndDrawing();

/// See [RaylibCore.BeginMode2D].
void BeginMode2D(Camera2DC camera) => _module.BeginMode2D(camera);

/// See [RaylibCore.EndMode2D].
void EndMode2D() => _module.EndMode2D();

/// See [RaylibCore.BeginMode3D].
void BeginMode3D(Camera3DC camera) => _module.BeginMode3D(camera);

/// See [RaylibCore.EndMode3D].
void EndMode3D() => _module.EndMode3D();

/// See [RaylibCore.BeginTextureMode].
void BeginTextureMode(RenderTextureC target) => _module.BeginTextureMode(target);

/// See [RaylibCore.EndTextureMode].
void EndTextureMode() => _module.EndTextureMode();

/// See [RaylibCore.BeginShaderMode].
void BeginShaderMode(ShaderC shader) => _module.BeginShaderMode(shader);

/// See [RaylibCore.EndShaderMode].
void EndShaderMode() => _module.EndShaderMode();

/// See [RaylibCore.BeginBlendMode].
void BeginBlendMode(int mode) => _module.BeginBlendMode(mode);

/// See [RaylibCore.EndBlendMode].
void EndBlendMode() => _module.EndBlendMode();

/// See [RaylibCore.BeginScissorMode].
void BeginScissorMode(int x, int y, int width, int height) => _module.BeginScissorMode(x, y, width, height);

/// See [RaylibCore.EndScissorMode].
void EndScissorMode() => _module.EndScissorMode();

/// See [RaylibCore.BeginVrStereoMode].
void BeginVrStereoMode(VrStereoConfigC config) => _module.BeginVrStereoMode(config);

/// See [RaylibCore.EndVrStereoMode].
void EndVrStereoMode() => _module.EndVrStereoMode();

/// See [RaylibCore.LoadVrStereoConfig].
VrStereoConfigC LoadVrStereoConfig(VrDeviceInfoC device) => _module.LoadVrStereoConfig(device);

/// See [RaylibCore.UnloadVrStereoConfig].
void UnloadVrStereoConfig(VrStereoConfigC config) => _module.UnloadVrStereoConfig(config);

/// See [RaylibCore.LoadShader].
ShaderC LoadShader(Pointer<Char> vsFileName, Pointer<Char> fsFileName) => _module.LoadShader(vsFileName, fsFileName);

/// See [RaylibCore.LoadShaderFromMemory].
ShaderC LoadShaderFromMemory(Pointer<Char> vsCode, Pointer<Char> fsCode) => _module.LoadShaderFromMemory(vsCode, fsCode);

/// See [RaylibCore.IsShaderValid].
bool IsShaderValid(ShaderC shader) => _module.IsShaderValid(shader);

/// See [RaylibCore.GetShaderLocation].
int GetShaderLocation(ShaderC shader, Pointer<Char> uniformName) => _module.GetShaderLocation(shader, uniformName);

/// See [RaylibCore.GetShaderLocationAttrib].
int GetShaderLocationAttrib(ShaderC shader, Pointer<Char> attribName) => _module.GetShaderLocationAttrib(shader, attribName);

/// See [RaylibCore.SetShaderValue].
void SetShaderValue(
  ShaderC shader,
  int locIndex,
  Pointer<Void> value,
  int uniformType,
) => _module.SetShaderValue(shader, locIndex, value, uniformType);

/// See [RaylibCore.SetShaderValueV].
void SetShaderValueV(
  ShaderC shader,
  int locIndex,
  Pointer<Void> value,
  int uniformType,
  int count,
) => _module.SetShaderValueV(shader, locIndex, value, uniformType, count);

/// See [RaylibCore.SetShaderValueMatrix].
void SetShaderValueMatrix(ShaderC shader, int locIndex, MatrixC mat) => _module.SetShaderValueMatrix(shader, locIndex, mat);

/// See [RaylibCore.SetShaderValueTexture].
void SetShaderValueTexture(ShaderC shader, int locIndex, TextureC texture) => _module.SetShaderValueTexture(shader, locIndex, texture);

/// See [RaylibCore.UnloadShader].
void UnloadShader(ShaderC shader) => _module.UnloadShader(shader);

/// See [RaylibCore.GetScreenToWorldRay].
RayC GetScreenToWorldRay(Vector2C position, Camera3DC camera) => _module.GetScreenToWorldRay(position, camera);

/// See [RaylibCore.GetScreenToWorldRayEx].
RayC GetScreenToWorldRayEx(
  Vector2C position,
  Camera3DC camera,
  int width,
  int height,
) => _module.GetScreenToWorldRayEx(position, camera, width, height);

/// See [RaylibCore.GetWorldToScreen].
Vector2C GetWorldToScreen(Vector3C position, Camera3DC camera) => _module.GetWorldToScreen(position, camera);

/// See [RaylibCore.GetWorldToScreenEx].
Vector2C GetWorldToScreenEx(
  Vector3C position,
  Camera3DC camera,
  int width,
  int height,
) => _module.GetWorldToScreenEx(position, camera, width, height);

/// See [RaylibCore.GetWorldToScreen2D].
Vector2C GetWorldToScreen2D(Vector2C position, Camera2DC camera) => _module.GetWorldToScreen2D(position, camera);

/// See [RaylibCore.GetScreenToWorld2D].
Vector2C GetScreenToWorld2D(Vector2C position, Camera2DC camera) => _module.GetScreenToWorld2D(position, camera);

/// See [RaylibCore.GetCameraMatrix].
MatrixC GetCameraMatrix(Camera3DC camera) => _module.GetCameraMatrix(camera);

/// See [RaylibCore.GetCameraMatrix2D].
MatrixC GetCameraMatrix2D(Camera2DC camera) => _module.GetCameraMatrix2D(camera);

/// See [RaylibCore.SetTargetFPS].
void SetTargetFPS(int fps) => _module.SetTargetFPS(fps);

/// See [RaylibCore.GetFrameTime].
double GetFrameTime() => _module.GetFrameTime();

/// See [RaylibCore.GetTime].
double GetTime() => _module.GetTime();

/// See [RaylibCore.GetFPS].
int GetFPS() => _module.GetFPS();

/// See [RaylibCore.SwapScreenBuffer].
void SwapScreenBuffer() => _module.SwapScreenBuffer();

/// See [RaylibCore.PollInputEvents].
void PollInputEvents() => _module.PollInputEvents();

/// See [RaylibCore.WaitTime].
void WaitTime(double seconds) => _module.WaitTime(seconds);

/// See [RaylibCore.SetRandomSeed].
void SetRandomSeed(int seed) => _module.SetRandomSeed(seed);

/// See [RaylibCore.GetRandomValue].
int GetRandomValue(int min, int max) => _module.GetRandomValue(min, max);

/// See [RaylibCore.LoadRandomSequence].
Pointer<Int> LoadRandomSequence(int count, int min, int max) => _module.LoadRandomSequence(count, min, max);

/// See [RaylibCore.UnloadRandomSequence].
void UnloadRandomSequence(Pointer<Int> sequence) => _module.UnloadRandomSequence(sequence);

/// See [RaylibCore.TakeScreenshot].
void TakeScreenshot(Pointer<Char> fileName) => _module.TakeScreenshot(fileName);

/// See [RaylibCore.SetConfigFlags].
void SetConfigFlags(int flags) => _module.SetConfigFlags(flags);

/// See [RaylibCore.OpenURL].
void OpenURL(Pointer<Char> url) => _module.OpenURL(url);

/// See [RaylibCore.TraceLog].
void TraceLog(int logLevel, Pointer<Char> text) => _module.TraceLog(logLevel, text);

/// See [RaylibCore.SetTraceLogLevel].
void SetTraceLogLevel(int logLevel) => _module.SetTraceLogLevel(logLevel);

/// See [RaylibCore.SetTraceLogCallback].
void SetTraceLogCallback(TraceLogCallbackC callback) => _module.SetTraceLogCallback(callback);

/// See [RaylibCore.SetLoadFileDataCallback].
void SetLoadFileDataCallback(LoadFileDataCallbackC callback) => _module.SetLoadFileDataCallback(callback);

/// See [RaylibCore.SetSaveFileDataCallback].
void SetSaveFileDataCallback(SaveFileDataCallbackC callback) => _module.SetSaveFileDataCallback(callback);

/// See [RaylibCore.SetLoadFileTextCallback].
void SetLoadFileTextCallback(LoadFileTextCallbackC callback) => _module.SetLoadFileTextCallback(callback);

/// See [RaylibCore.SetSaveFileTextCallback].
void SetSaveFileTextCallback(SaveFileTextCallbackC callback) => _module.SetSaveFileTextCallback(callback);

/// See [RaylibCore.LoadFileData].
Pointer<UnsignedChar> LoadFileData(
  Pointer<Char> fileName,
  Pointer<Int> dataSize,
) => _module.LoadFileData(fileName, dataSize);

/// See [RaylibCore.UnloadFileData].
void UnloadFileData(Pointer<UnsignedChar> data) => _module.UnloadFileData(data);

/// See [RaylibCore.SaveFileData].
bool SaveFileData(Pointer<Char> fileName, Pointer<Void> data, int dataSize) => _module.SaveFileData(fileName, data, dataSize);

/// See [RaylibCore.ExportDataAsCode].
bool ExportDataAsCode(
  Pointer<UnsignedChar> data,
  int dataSize,
  Pointer<Char> fileName,
) => _module.ExportDataAsCode(data, dataSize, fileName);

/// See [RaylibCore.LoadFileText].
Pointer<Char> LoadFileText(Pointer<Char> fileName) => _module.LoadFileText(fileName);

/// See [RaylibCore.UnloadFileText].
void UnloadFileText(Pointer<Char> text) => _module.UnloadFileText(text);

/// See [RaylibCore.SaveFileText].
bool SaveFileText(Pointer<Char> fileName, Pointer<Char> text) => _module.SaveFileText(fileName, text);

/// See [RaylibCore.FileRename].
int FileRename(
  Pointer<Char> fileName,
  Pointer<Char> fileRename,
) => _module.FileRename(fileName, fileRename);

/// See [RaylibCore.FileRemove].
int FileRemove(Pointer<Char> fileName) => _module.FileRemove(fileName);

/// See [RaylibCore.FileCopy].
int FileCopy(Pointer<Char> srcPath, Pointer<Char> dstPath) => _module.FileCopy(srcPath, dstPath);

/// See [RaylibCore.FileMove].
int FileMove(Pointer<Char> srcPath, Pointer<Char> dstPath) => _module.FileMove(srcPath, dstPath);

/// See [RaylibCore.FileTextReplace].
int FileTextReplace(
  Pointer<Char> fileName,
  Pointer<Char> search,
  Pointer<Char> replacement,
) => _module.FileTextReplace(fileName, search, replacement);

/// See [RaylibCore.FileTextFindIndex].
int FileTextFindIndex(
  Pointer<Char> fileName,
  Pointer<Char> search,
) => _module.FileTextFindIndex(fileName, search);

/// See [RaylibCore.FileExists].
bool FileExists(Pointer<Char> fileName) => _module.FileExists(fileName);

/// See [RaylibCore.DirectoryExists].
bool DirectoryExists(Pointer<Char> dirPath) => _module.DirectoryExists(dirPath);

/// See [RaylibCore.IsFileExtension].
bool IsFileExtension(Pointer<Char> fileName, Pointer<Char> ext) => _module.IsFileExtension(fileName, ext);

/// See [RaylibCore.GetFileLength].
int GetFileLength(Pointer<Char> fileName) => _module.GetFileLength(fileName);

/// See [RaylibCore.GetFileExtension].
Pointer<Char> GetFileExtension(Pointer<Char> fileName) => _module.GetFileExtension(fileName);

/// See [RaylibCore.GetFileName].
Pointer<Char> GetFileName(Pointer<Char> filePath) => _module.GetFileName(filePath);

/// See [RaylibCore.GetFileNameWithoutExt].
Pointer<Char> GetFileNameWithoutExt(Pointer<Char> filePath) => _module.GetFileNameWithoutExt(filePath);

/// See [RaylibCore.GetDirectoryFileCount].
int GetDirectoryFileCount(Pointer<Char> dirPath) => _module.GetDirectoryFileCount(dirPath);

/// See [RaylibCore.GetDirectoryFileCountEx].
int GetDirectoryFileCountEx(
  Pointer<Char> basePath,
  Pointer<Char> filter,
  bool scanSubdirs,
) => _module.GetDirectoryFileCountEx(basePath, filter, scanSubdirs);

/// See [RaylibCore.GetDirectoryPath].
Pointer<Char> GetDirectoryPath(Pointer<Char> filePath) => _module.GetDirectoryPath(filePath);

/// See [RaylibCore.GetPrevDirectoryPath].
Pointer<Char> GetPrevDirectoryPath(Pointer<Char> dirPath) => _module.GetPrevDirectoryPath(dirPath);

/// See [RaylibCore.GetWorkingDirectory].
Pointer<Char> GetWorkingDirectory() => _module.GetWorkingDirectory();

/// See [RaylibCore.GetApplicationDirectory].
Pointer<Char> GetApplicationDirectory() => _module.GetApplicationDirectory();

/// See [RaylibCore.MakeDirectory].
int MakeDirectory(Pointer<Char> dirPath) => _module.MakeDirectory(dirPath);

/// See [RaylibCore.ChangeDirectory].
bool ChangeDirectory(Pointer<Char> dir) => _module.ChangeDirectory(dir);

/// See [RaylibCore.IsPathFile].
bool IsPathFile(Pointer<Char> path) => _module.IsPathFile(path);

/// See [RaylibCore.IsFileNameValid].
bool IsFileNameValid(Pointer<Char> fileName) => _module.IsFileNameValid(fileName);

/// See [RaylibCore.LoadDirectoryFiles].
FilePathListC LoadDirectoryFiles(Pointer<Char> dirPath) => _module.LoadDirectoryFiles(dirPath);

/// See [RaylibCore.LoadDirectoryFilesEx].
FilePathListC LoadDirectoryFilesEx(
  Pointer<Char> basePath,
  Pointer<Char> filter,
  bool scanSubdirs,
) => _module.LoadDirectoryFilesEx(basePath, filter, scanSubdirs);

/// See [RaylibCore.UnloadDirectoryFiles].
void UnloadDirectoryFiles(FilePathListC files) => _module.UnloadDirectoryFiles(files);

/// See [RaylibCore.IsFileDropped].
bool IsFileDropped() => _module.IsFileDropped();

/// See [RaylibCore.LoadDroppedFiles].
FilePathListC LoadDroppedFiles() => _module.LoadDroppedFiles();

/// See [RaylibCore.UnloadDroppedFiles].
void UnloadDroppedFiles(FilePathListC files) => _module.UnloadDroppedFiles(files);

/// See [RaylibCore.GetFileModTime].
int GetFileModTime(Pointer<Char> fileName) => _module.GetFileModTime(fileName);

/// See [RaylibCore.CompressData].
Pointer<UnsignedChar> CompressData(
  Pointer<UnsignedChar> data,
  int dataSize,
  Pointer<Int> compDataSize,
) => _module.CompressData(data, dataSize, compDataSize);

/// See [RaylibCore.DecompressData].
Pointer<UnsignedChar> DecompressData(
  Pointer<UnsignedChar> compData,
  int compDataSize,
  Pointer<Int> dataSize,
) => _module.DecompressData(compData, compDataSize, dataSize);

/// See [RaylibCore.EncodeDataBase64].
Pointer<Char> EncodeDataBase64(
  Pointer<UnsignedChar> data,
  int dataSize,
  Pointer<Int> outputSize,
) => _module.EncodeDataBase64(data, dataSize, outputSize);

/// See [RaylibCore.DecodeDataBase64].
Pointer<UnsignedChar> DecodeDataBase64(
  Pointer<Char> data,
  Pointer<Int> outputSize,
) => _module.DecodeDataBase64(data, outputSize);

/// See [RaylibCore.ComputeCRC32].
int ComputeCRC32(Pointer<UnsignedChar> data, int dataSize) => _module.ComputeCRC32(data, dataSize);

/// See [RaylibCore.ComputeMD5].
Pointer<UnsignedInt> ComputeMD5(Pointer<UnsignedChar> data, int dataSize) => _module.ComputeMD5(data, dataSize);

/// See [RaylibCore.ComputeSHA1].
Pointer<UnsignedInt> ComputeSHA1(Pointer<UnsignedChar> data, int dataSize) => _module.ComputeSHA1(data, dataSize);

/// See [RaylibCore.ComputeSHA256].
Pointer<UnsignedInt> ComputeSHA256(
  Pointer<UnsignedChar> data,
  int dataSize,
) => _module.ComputeSHA256(data, dataSize);

/// See [RaylibCore.LoadAutomationEventList].
AutomationEventListC LoadAutomationEventList(Pointer<Char> fileName) => _module.LoadAutomationEventList(fileName);

/// See [RaylibCore.UnloadAutomationEventList].
void UnloadAutomationEventList(AutomationEventListC list) => _module.UnloadAutomationEventList(list);

/// See [RaylibCore.ExportAutomationEventList].
bool ExportAutomationEventList(
  AutomationEventListC list,
  Pointer<Char> fileName,
) => _module.ExportAutomationEventList(list, fileName);

/// See [RaylibCore.SetAutomationEventList].
void SetAutomationEventList(Pointer<AutomationEventListC> list) => _module.SetAutomationEventList(list);

/// See [RaylibCore.SetAutomationEventBaseFrame].
void SetAutomationEventBaseFrame(int frame) => _module.SetAutomationEventBaseFrame(frame);

/// See [RaylibCore.StartAutomationEventRecording].
void StartAutomationEventRecording() => _module.StartAutomationEventRecording();

/// See [RaylibCore.StopAutomationEventRecording].
void StopAutomationEventRecording() => _module.StopAutomationEventRecording();

/// See [RaylibCore.PlayAutomationEvent].
void PlayAutomationEvent(AutomationEventC event) => _module.PlayAutomationEvent(event);

/// See [RaylibCore.IsKeyPressed].
bool IsKeyPressed(int key) => _module.IsKeyPressed(key);

/// See [RaylibCore.IsKeyPressedRepeat].
bool IsKeyPressedRepeat(int key) => _module.IsKeyPressedRepeat(key);

/// See [RaylibCore.IsKeyDown].
bool IsKeyDown(int key) => _module.IsKeyDown(key);

/// See [RaylibCore.IsKeyReleased].
bool IsKeyReleased(int key) => _module.IsKeyReleased(key);

/// See [RaylibCore.IsKeyUp].
bool IsKeyUp(int key) => _module.IsKeyUp(key);

/// See [RaylibCore.GetKeyName].
Pointer<Char> GetKeyName(int key) => _module.GetKeyName(key);

/// See [RaylibCore.GetKeyPressed].
int GetKeyPressed() => _module.GetKeyPressed();

/// See [RaylibCore.GetCharPressed].
int GetCharPressed() => _module.GetCharPressed();

/// See [RaylibCore.SetExitKey].
void SetExitKey(int key) => _module.SetExitKey(key);

/// See [RaylibCore.IsGamepadAvailable].
bool IsGamepadAvailable(int gamepad) => _module.IsGamepadAvailable(gamepad);

/// See [RaylibCore.GetGamepadName].
Pointer<Char> GetGamepadName(int gamepad) => _module.GetGamepadName(gamepad);

/// See [RaylibCore.IsGamepadButtonPressed].
bool IsGamepadButtonPressed(int gamepad, int button) => _module.IsGamepadButtonPressed(gamepad, button);

/// See [RaylibCore.IsGamepadButtonDown].
bool IsGamepadButtonDown(int gamepad, int button) => _module.IsGamepadButtonDown(gamepad, button);

/// See [RaylibCore.IsGamepadButtonReleased].
bool IsGamepadButtonReleased(int gamepad, int button) => _module.IsGamepadButtonReleased(gamepad, button);

/// See [RaylibCore.IsGamepadButtonUp].
bool IsGamepadButtonUp(int gamepad, int button) => _module.IsGamepadButtonUp(gamepad, button);

/// See [RaylibCore.GetGamepadButtonPressed].
int GetGamepadButtonPressed() => _module.GetGamepadButtonPressed();

/// See [RaylibCore.GetGamepadAxisCount].
int GetGamepadAxisCount(int gamepad) => _module.GetGamepadAxisCount(gamepad);

/// See [RaylibCore.GetGamepadAxisMovement].
double GetGamepadAxisMovement(int gamepad, int axis) => _module.GetGamepadAxisMovement(gamepad, axis);

/// See [RaylibCore.SetGamepadMappings].
int SetGamepadMappings(Pointer<Char> mappings) => _module.SetGamepadMappings(mappings);

/// See [RaylibCore.SetGamepadVibration].
void SetGamepadVibration(
  int gamepad,
  double leftMotor,
  double rightMotor,
  double duration,
) => _module.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration);

/// See [RaylibCore.IsMouseButtonPressed].
bool IsMouseButtonPressed(int button) => _module.IsMouseButtonPressed(button);

/// See [RaylibCore.IsMouseButtonDown].
bool IsMouseButtonDown(int button) => _module.IsMouseButtonDown(button);

/// See [RaylibCore.IsMouseButtonReleased].
bool IsMouseButtonReleased(int button) => _module.IsMouseButtonReleased(button);

/// See [RaylibCore.IsMouseButtonUp].
bool IsMouseButtonUp(int button) => _module.IsMouseButtonUp(button);

/// See [RaylibCore.GetMouseX].
int GetMouseX() => _module.GetMouseX();

/// See [RaylibCore.GetMouseY].
int GetMouseY() => _module.GetMouseY();

/// See [RaylibCore.GetMousePosition].
Vector2C GetMousePosition() => _module.GetMousePosition();

/// See [RaylibCore.GetMouseDelta].
Vector2C GetMouseDelta() => _module.GetMouseDelta();

/// See [RaylibCore.SetMousePosition].
void SetMousePosition(int x, int y) => _module.SetMousePosition(x, y);

/// See [RaylibCore.SetMouseOffset].
void SetMouseOffset(int offsetX, int offsetY) => _module.SetMouseOffset(offsetX, offsetY);

/// See [RaylibCore.SetMouseScale].
void SetMouseScale(double scaleX, double scaleY) => _module.SetMouseScale(scaleX, scaleY);

/// See [RaylibCore.GetMouseWheelMove].
double GetMouseWheelMove() => _module.GetMouseWheelMove();

/// See [RaylibCore.GetMouseWheelMoveV].
Vector2C GetMouseWheelMoveV() => _module.GetMouseWheelMoveV();

/// See [RaylibCore.SetMouseCursor].
void SetMouseCursor(int cursor) => _module.SetMouseCursor(cursor);

/// See [RaylibCore.GetTouchX].
int GetTouchX() => _module.GetTouchX();

/// See [RaylibCore.GetTouchY].
int GetTouchY() => _module.GetTouchY();

/// See [RaylibCore.GetTouchPosition].
Vector2C GetTouchPosition(int index) => _module.GetTouchPosition(index);

/// See [RaylibCore.GetTouchPointId].
int GetTouchPointId(int index) => _module.GetTouchPointId(index);

/// See [RaylibCore.GetTouchPointCount].
int GetTouchPointCount() => _module.GetTouchPointCount();

/// See [RaylibCore.SetGesturesEnabled].
void SetGesturesEnabled(int flags) => _module.SetGesturesEnabled(flags);

/// See [RaylibCore.IsGestureDetected].
bool IsGestureDetected(int gesture) => _module.IsGestureDetected(gesture);

/// See [RaylibCore.GetGestureDetected].
int GetGestureDetected() => _module.GetGestureDetected();

/// See [RaylibCore.GetGestureHoldDuration].
double GetGestureHoldDuration() => _module.GetGestureHoldDuration();

/// See [RaylibCore.GetGestureDragVector].
Vector2C GetGestureDragVector() => _module.GetGestureDragVector();

/// See [RaylibCore.GetGestureDragAngle].
double GetGestureDragAngle() => _module.GetGestureDragAngle();

/// See [RaylibCore.GetGesturePinchVector].
Vector2C GetGesturePinchVector() => _module.GetGesturePinchVector();

/// See [RaylibCore.GetGesturePinchAngle].
double GetGesturePinchAngle() => _module.GetGesturePinchAngle();

/// See [RaylibCore.ProcessGestureEvent].
void ProcessGestureEvent(GestureEventC event) => _module.ProcessGestureEvent(event);

/// See [RaylibCore.UpdateGestures].
void UpdateGestures() => _module.UpdateGestures();

/// See [RaylibCore.UpdateCamera].
void UpdateCamera(Pointer<Camera3DC> camera, int mode) => _module.UpdateCamera(camera, mode);

/// See [RaylibCore.UpdateCameraPro].
void UpdateCameraPro(
  Pointer<Camera3DC> camera,
  Vector3C movement,
  Vector3C rotation,
  double zoom,
) => _module.UpdateCameraPro(camera, movement, rotation, zoom);

/// See [RaylibCore.SetShapesTexture].
void SetShapesTexture(TextureC texture, RectangleC source) => _module.SetShapesTexture(texture, source);

/// See [RaylibCore.GetShapesTexture].
TextureC GetShapesTexture() => _module.GetShapesTexture();

/// See [RaylibCore.GetShapesTextureRectangle].
RectangleC GetShapesTextureRectangle() => _module.GetShapesTextureRectangle();

/// See [RaylibCore.DrawPixel].
void DrawPixel(int posX, int posY, ColorC color) => _module.DrawPixel(posX, posY, color);

/// See [RaylibCore.DrawPixelV].
void DrawPixelV(Vector2C position, ColorC color) => _module.DrawPixelV(position, color);

/// See [RaylibCore.DrawLine].
void DrawLine(
  int startPosX,
  int startPosY,
  int endPosX,
  int endPosY,
  ColorC color,
) => _module.DrawLine(startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCore.DrawLineV].
void DrawLineV(Vector2C startPos, Vector2C endPos, ColorC color) => _module.DrawLineV(startPos, endPos, color);

/// See [RaylibCore.DrawLineEx].
void DrawLineEx(
  Vector2C startPos,
  Vector2C endPos,
  double thick,
  ColorC color,
) => _module.DrawLineEx(startPos, endPos, thick, color);

/// See [RaylibCore.DrawLineStrip].
void DrawLineStrip(Pointer<Vector2C> points, int pointCount, ColorC color) => _module.DrawLineStrip(points, pointCount, color);

/// See [RaylibCore.DrawLineBezier].
void DrawLineBezier(
  Vector2C startPos,
  Vector2C endPos,
  double thick,
  ColorC color,
) => _module.DrawLineBezier(startPos, endPos, thick, color);

/// See [RaylibCore.DrawLineDashed].
void DrawLineDashed(
  Vector2C startPos,
  Vector2C endPos,
  int dashSize,
  int spaceSize,
  ColorC color,
) => _module.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color);

/// See [RaylibCore.DrawCircle].
void DrawCircle(int centerX, int centerY, double radius, ColorC color) => _module.DrawCircle(centerX, centerY, radius, color);

/// See [RaylibCore.DrawCircleSector].
void DrawCircleSector(
  Vector2C center,
  double radius,
  double startAngle,
  double endAngle,
  int segments,
  ColorC color,
) => _module.DrawCircleSector(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCore.DrawCircleSectorLines].
void DrawCircleSectorLines(
  Vector2C center,
  double radius,
  double startAngle,
  double endAngle,
  int segments,
  ColorC color,
) => _module.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCore.DrawCircleGradient].
void DrawCircleGradient(
  Vector2C center,
  double radius,
  ColorC inner,
  ColorC outer,
) => _module.DrawCircleGradient(center, radius, inner, outer);

/// See [RaylibCore.DrawCircleV].
void DrawCircleV(Vector2C center, double radius, ColorC color) => _module.DrawCircleV(center, radius, color);

/// See [RaylibCore.DrawCircleLines].
void DrawCircleLines(int centerX, int centerY, double radius, ColorC color) => _module.DrawCircleLines(centerX, centerY, radius, color);

/// See [RaylibCore.DrawCircleLinesV].
void DrawCircleLinesV(Vector2C center, double radius, ColorC color) => _module.DrawCircleLinesV(center, radius, color);

/// See [RaylibCore.DrawEllipse].
void DrawEllipse(
  int centerX,
  int centerY,
  double radiusH,
  double radiusV,
  ColorC color,
) => _module.DrawEllipse(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCore.DrawEllipseV].
void DrawEllipseV(
  Vector2C center,
  double radiusH,
  double radiusV,
  ColorC color,
) => _module.DrawEllipseV(center, radiusH, radiusV, color);

/// See [RaylibCore.DrawEllipseLines].
void DrawEllipseLines(
  int centerX,
  int centerY,
  double radiusH,
  double radiusV,
  ColorC color,
) => _module.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCore.DrawEllipseLinesV].
void DrawEllipseLinesV(
  Vector2C center,
  double radiusH,
  double radiusV,
  ColorC color,
) => _module.DrawEllipseLinesV(center, radiusH, radiusV, color);

/// See [RaylibCore.DrawRing].
void DrawRing(
  Vector2C center,
  double innerRadius,
  double outerRadius,
  double startAngle,
  double endAngle,
  int segments,
  ColorC color,
) => _module.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCore.DrawRingLines].
void DrawRingLines(
  Vector2C center,
  double innerRadius,
  double outerRadius,
  double startAngle,
  double endAngle,
  int segments,
  ColorC color,
) => _module.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCore.DrawRectangle].
void DrawRectangle(int posX, int posY, int width, int height, ColorC color) => _module.DrawRectangle(posX, posY, width, height, color);

/// See [RaylibCore.DrawRectangleV].
void DrawRectangleV(Vector2C position, Vector2C size, ColorC color) => _module.DrawRectangleV(position, size, color);

/// See [RaylibCore.DrawRectangleRec].
void DrawRectangleRec(RectangleC rec, ColorC color) => _module.DrawRectangleRec(rec, color);

/// See [RaylibCore.DrawRectanglePro].
void DrawRectanglePro(
  RectangleC rec,
  Vector2C origin,
  double rotation,
  ColorC color,
) => _module.DrawRectanglePro(rec, origin, rotation, color);

/// See [RaylibCore.DrawRectangleGradientV].
void DrawRectangleGradientV(
  int posX,
  int posY,
  int width,
  int height,
  ColorC top,
  ColorC bottom,
) => _module.DrawRectangleGradientV(posX, posY, width, height, top, bottom);

/// See [RaylibCore.DrawRectangleGradientH].
void DrawRectangleGradientH(
  int posX,
  int posY,
  int width,
  int height,
  ColorC left,
  ColorC right,
) => _module.DrawRectangleGradientH(posX, posY, width, height, left, right);

/// See [RaylibCore.DrawRectangleGradientEx].
void DrawRectangleGradientEx(
  RectangleC rec,
  ColorC topLeft,
  ColorC bottomLeft,
  ColorC topRight,
  ColorC bottomRight,
) => _module.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight);

/// See [RaylibCore.DrawRectangleLines].
void DrawRectangleLines(
  int posX,
  int posY,
  int width,
  int height,
  ColorC color,
) => _module.DrawRectangleLines(posX, posY, width, height, color);

/// See [RaylibCore.DrawRectangleLinesEx].
void DrawRectangleLinesEx(RectangleC rec, double lineThick, ColorC color) => _module.DrawRectangleLinesEx(rec, lineThick, color);

/// See [RaylibCore.DrawRectangleRounded].
void DrawRectangleRounded(
  RectangleC rec,
  double roundness,
  int segments,
  ColorC color,
) => _module.DrawRectangleRounded(rec, roundness, segments, color);

/// See [RaylibCore.DrawRectangleRoundedLines].
void DrawRectangleRoundedLines(
  RectangleC rec,
  double roundness,
  int segments,
  ColorC color,
) => _module.DrawRectangleRoundedLines(rec, roundness, segments, color);

/// See [RaylibCore.DrawRectangleRoundedLinesEx].
void DrawRectangleRoundedLinesEx(
  RectangleC rec,
  double roundness,
  int segments,
  double lineThick,
  ColorC color,
) => _module.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color);

/// See [RaylibCore.DrawTriangle].
void DrawTriangle(Vector2C v1, Vector2C v2, Vector2C v3, ColorC color) => _module.DrawTriangle(v1, v2, v3, color);

/// See [RaylibCore.DrawTriangleLines].
void DrawTriangleLines(Vector2C v1, Vector2C v2, Vector2C v3, ColorC color) => _module.DrawTriangleLines(v1, v2, v3, color);

/// See [RaylibCore.DrawTriangleFan].
void DrawTriangleFan(Pointer<Vector2C> points, int pointCount, ColorC color) => _module.DrawTriangleFan(points, pointCount, color);

/// See [RaylibCore.DrawTriangleStrip].
void DrawTriangleStrip(
  Pointer<Vector2C> points,
  int pointCount,
  ColorC color,
) => _module.DrawTriangleStrip(points, pointCount, color);

/// See [RaylibCore.DrawPoly].
void DrawPoly(
  Vector2C center,
  int sides,
  double radius,
  double rotation,
  ColorC color,
) => _module.DrawPoly(center, sides, radius, rotation, color);

/// See [RaylibCore.DrawPolyLines].
void DrawPolyLines(
  Vector2C center,
  int sides,
  double radius,
  double rotation,
  ColorC color,
) => _module.DrawPolyLines(center, sides, radius, rotation, color);

/// See [RaylibCore.DrawPolyLinesEx].
void DrawPolyLinesEx(
  Vector2C center,
  int sides,
  double radius,
  double rotation,
  double lineThick,
  ColorC color,
) => _module.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color);

/// See [RaylibCore.DrawSplineLinear].
void DrawSplineLinear(
  Pointer<Vector2C> points,
  int pointCount,
  double thick,
  ColorC color,
) => _module.DrawSplineLinear(points, pointCount, thick, color);

/// See [RaylibCore.DrawSplineBasis].
void DrawSplineBasis(
  Pointer<Vector2C> points,
  int pointCount,
  double thick,
  ColorC color,
) => _module.DrawSplineBasis(points, pointCount, thick, color);

/// See [RaylibCore.DrawSplineCatmullRom].
void DrawSplineCatmullRom(
  Pointer<Vector2C> points,
  int pointCount,
  double thick,
  ColorC color,
) => _module.DrawSplineCatmullRom(points, pointCount, thick, color);

/// See [RaylibCore.DrawSplineBezierQuadratic].
void DrawSplineBezierQuadratic(
  Pointer<Vector2C> points,
  int pointCount,
  double thick,
  ColorC color,
) => _module.DrawSplineBezierQuadratic(points, pointCount, thick, color);

/// See [RaylibCore.DrawSplineBezierCubic].
void DrawSplineBezierCubic(
  Pointer<Vector2C> points,
  int pointCount,
  double thick,
  ColorC color,
) => _module.DrawSplineBezierCubic(points, pointCount, thick, color);

/// See [RaylibCore.DrawSplineSegmentLinear].
void DrawSplineSegmentLinear(
  Vector2C p1,
  Vector2C p2,
  double thick,
  ColorC color,
) => _module.DrawSplineSegmentLinear(p1, p2, thick, color);

/// See [RaylibCore.DrawSplineSegmentBasis].
void DrawSplineSegmentBasis(
  Vector2C p1,
  Vector2C p2,
  Vector2C p3,
  Vector2C p4,
  double thick,
  ColorC color,
) => _module.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color);

/// See [RaylibCore.DrawSplineSegmentCatmullRom].
void DrawSplineSegmentCatmullRom(
  Vector2C p1,
  Vector2C p2,
  Vector2C p3,
  Vector2C p4,
  double thick,
  ColorC color,
) => _module.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color);

/// See [RaylibCore.DrawSplineSegmentBezierQuadratic].
void DrawSplineSegmentBezierQuadratic(
  Vector2C p1,
  Vector2C c2,
  Vector2C p3,
  double thick,
  ColorC color,
) => _module.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color);

/// See [RaylibCore.DrawSplineSegmentBezierCubic].
void DrawSplineSegmentBezierCubic(
  Vector2C p1,
  Vector2C c2,
  Vector2C c3,
  Vector2C p4,
  double thick,
  ColorC color,
) => _module.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color);

/// See [RaylibCore.GetSplinePointLinear].
Vector2C GetSplinePointLinear(Vector2C startPos, Vector2C endPos, double t) => _module.GetSplinePointLinear(startPos, endPos, t);

/// See [RaylibCore.GetSplinePointBasis].
Vector2C GetSplinePointBasis(
  Vector2C p1,
  Vector2C p2,
  Vector2C p3,
  Vector2C p4,
  double t,
) => _module.GetSplinePointBasis(p1, p2, p3, p4, t);

/// See [RaylibCore.GetSplinePointCatmullRom].
Vector2C GetSplinePointCatmullRom(
  Vector2C p1,
  Vector2C p2,
  Vector2C p3,
  Vector2C p4,
  double t,
) => _module.GetSplinePointCatmullRom(p1, p2, p3, p4, t);

/// See [RaylibCore.GetSplinePointBezierQuad].
Vector2C GetSplinePointBezierQuad(
  Vector2C p1,
  Vector2C c2,
  Vector2C p3,
  double t,
) => _module.GetSplinePointBezierQuad(p1, c2, p3, t);

/// See [RaylibCore.GetSplinePointBezierCubic].
Vector2C GetSplinePointBezierCubic(
  Vector2C p1,
  Vector2C c2,
  Vector2C c3,
  Vector2C p4,
  double t,
) => _module.GetSplinePointBezierCubic(p1, c2, c3, p4, t);

/// See [RaylibCore.CheckCollisionRecs].
bool CheckCollisionRecs(RectangleC rec1, RectangleC rec2) => _module.CheckCollisionRecs(rec1, rec2);

/// See [RaylibCore.CheckCollisionCircles].
bool CheckCollisionCircles(
  Vector2C center1,
  double radius1,
  Vector2C center2,
  double radius2,
) => _module.CheckCollisionCircles(center1, radius1, center2, radius2);

/// See [RaylibCore.CheckCollisionCircleRec].
bool CheckCollisionCircleRec(Vector2C center, double radius, RectangleC rec) => _module.CheckCollisionCircleRec(center, radius, rec);

/// See [RaylibCore.CheckCollisionCircleLine].
bool CheckCollisionCircleLine(
  Vector2C center,
  double radius,
  Vector2C p1,
  Vector2C p2,
) => _module.CheckCollisionCircleLine(center, radius, p1, p2);

/// See [RaylibCore.CheckCollisionPointRec].
bool CheckCollisionPointRec(Vector2C point, RectangleC rec) => _module.CheckCollisionPointRec(point, rec);

/// See [RaylibCore.CheckCollisionPointCircle].
bool CheckCollisionPointCircle(
  Vector2C point,
  Vector2C center,
  double radius,
) => _module.CheckCollisionPointCircle(point, center, radius);

/// See [RaylibCore.CheckCollisionPointTriangle].
bool CheckCollisionPointTriangle(
  Vector2C point,
  Vector2C p1,
  Vector2C p2,
  Vector2C p3,
) => _module.CheckCollisionPointTriangle(point, p1, p2, p3);

/// See [RaylibCore.CheckCollisionPointLine].
bool CheckCollisionPointLine(
  Vector2C point,
  Vector2C p1,
  Vector2C p2,
  int threshold,
) => _module.CheckCollisionPointLine(point, p1, p2, threshold);

/// See [RaylibCore.CheckCollisionPointPoly].
bool CheckCollisionPointPoly(
  Vector2C point,
  Pointer<Vector2C> points,
  int pointCount,
) => _module.CheckCollisionPointPoly(point, points, pointCount);

/// See [RaylibCore.CheckCollisionLines].
bool CheckCollisionLines(
  Vector2C startPos1,
  Vector2C endPos1,
  Vector2C startPos2,
  Vector2C endPos2,
  Pointer<Vector2C> collisionPoint,
) => _module.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2, collisionPoint);

/// See [RaylibCore.GetCollisionRec].
RectangleC GetCollisionRec(RectangleC rec1, RectangleC rec2) => _module.GetCollisionRec(rec1, rec2);

/// See [RaylibCore.LoadImage].
ImageC LoadImage(Pointer<Char> fileName) => _module.LoadImage(fileName);

/// See [RaylibCore.LoadImageRaw].
ImageC LoadImageRaw(
  Pointer<Char> fileName,
  int width,
  int height,
  int format,
  int headerSize,
) => _module.LoadImageRaw(fileName, width, height, format, headerSize);

/// See [RaylibCore.LoadImageAnim].
ImageC LoadImageAnim(Pointer<Char> fileName, Pointer<Int> frames) => _module.LoadImageAnim(fileName, frames);

/// See [RaylibCore.LoadImageAnimFromMemory].
ImageC LoadImageAnimFromMemory(
  Pointer<Char> fileType,
  Pointer<UnsignedChar> fileData,
  int dataSize,
  Pointer<Int> frames,
) => _module.LoadImageAnimFromMemory(fileType, fileData, dataSize, frames);

/// See [RaylibCore.LoadImageFromMemory].
ImageC LoadImageFromMemory(
  Pointer<Char> fileType,
  Pointer<UnsignedChar> fileData,
  int dataSize,
) => _module.LoadImageFromMemory(fileType, fileData, dataSize);

/// See [RaylibCore.LoadImageFromTexture].
ImageC LoadImageFromTexture(TextureC texture) => _module.LoadImageFromTexture(texture);

/// See [RaylibCore.LoadImageFromScreen].
ImageC LoadImageFromScreen() => _module.LoadImageFromScreen();

/// See [RaylibCore.IsImageValid].
bool IsImageValid(ImageC image) => _module.IsImageValid(image);

/// See [RaylibCore.UnloadImage].
void UnloadImage(ImageC image) => _module.UnloadImage(image);

/// See [RaylibCore.ExportImage].
bool ExportImage(ImageC image, Pointer<Char> fileName) => _module.ExportImage(image, fileName);

/// See [RaylibCore.ExportImageToMemory].
Pointer<UnsignedChar> ExportImageToMemory(
  ImageC image,
  Pointer<Char> fileType,
  Pointer<Int> fileSize,
) => _module.ExportImageToMemory(image, fileType, fileSize);

/// See [RaylibCore.ExportImageAsCode].
bool ExportImageAsCode(ImageC image, Pointer<Char> fileName) => _module.ExportImageAsCode(image, fileName);

/// See [RaylibCore.GenImageColor].
ImageC GenImageColor(int width, int height, ColorC color) => _module.GenImageColor(width, height, color);

/// See [RaylibCore.GenImageGradientLinear].
ImageC GenImageGradientLinear(
  int width,
  int height,
  int direction,
  ColorC start,
  ColorC end,
) => _module.GenImageGradientLinear(width, height, direction, start, end);

/// See [RaylibCore.GenImageGradientRadial].
ImageC GenImageGradientRadial(
  int width,
  int height,
  double density,
  ColorC inner,
  ColorC outer,
) => _module.GenImageGradientRadial(width, height, density, inner, outer);

/// See [RaylibCore.GenImageGradientSquare].
ImageC GenImageGradientSquare(
  int width,
  int height,
  double density,
  ColorC inner,
  ColorC outer,
) => _module.GenImageGradientSquare(width, height, density, inner, outer);

/// See [RaylibCore.GenImageChecked].
ImageC GenImageChecked(
  int width,
  int height,
  int checksX,
  int checksY,
  ColorC col1,
  ColorC col2,
) => _module.GenImageChecked(width, height, checksX, checksY, col1, col2);

/// See [RaylibCore.GenImageWhiteNoise].
ImageC GenImageWhiteNoise(int width, int height, double factor) => _module.GenImageWhiteNoise(width, height, factor);

/// See [RaylibCore.GenImagePerlinNoise].
ImageC GenImagePerlinNoise(
  int width,
  int height,
  int offsetX,
  int offsetY,
  double scale,
) => _module.GenImagePerlinNoise(width, height, offsetX, offsetY, scale);

/// See [RaylibCore.GenImageCellular].
ImageC GenImageCellular(int width, int height, int tileSize) => _module.GenImageCellular(width, height, tileSize);

/// See [RaylibCore.GenImageText].
ImageC GenImageText(int width, int height, Pointer<Char> text) => _module.GenImageText(width, height, text);

/// See [RaylibCore.ImageCopy].
ImageC ImageCopy(ImageC image) => _module.ImageCopy(image);

/// See [RaylibCore.ImageFromImage].
ImageC ImageFromImage(ImageC image, RectangleC rec) => _module.ImageFromImage(image, rec);

/// See [RaylibCore.ImageFromChannel].
ImageC ImageFromChannel(ImageC image, int selectedChannel) => _module.ImageFromChannel(image, selectedChannel);

/// See [RaylibCore.ImageText].
ImageC ImageText(Pointer<Char> text, int fontSize, ColorC color) => _module.ImageText(text, fontSize, color);

/// See [RaylibCore.ImageTextEx].
ImageC ImageTextEx(
  FontC font,
  Pointer<Char> text,
  double fontSize,
  double spacing,
  ColorC tint,
) => _module.ImageTextEx(font, text, fontSize, spacing, tint);

/// See [RaylibCore.ImageFormat].
void ImageFormat(Pointer<ImageC> image, int newFormat) => _module.ImageFormat(image, newFormat);

/// See [RaylibCore.ImageToPOT].
void ImageToPOT(Pointer<ImageC> image, ColorC fill) => _module.ImageToPOT(image, fill);

/// See [RaylibCore.ImageCrop].
void ImageCrop(Pointer<ImageC> image, RectangleC crop) => _module.ImageCrop(image, crop);

/// See [RaylibCore.ImageAlphaCrop].
void ImageAlphaCrop(Pointer<ImageC> image, double threshold) => _module.ImageAlphaCrop(image, threshold);

/// See [RaylibCore.ImageAlphaClear].
void ImageAlphaClear(Pointer<ImageC> image, ColorC color, double threshold) => _module.ImageAlphaClear(image, color, threshold);

/// See [RaylibCore.ImageAlphaMask].
void ImageAlphaMask(Pointer<ImageC> image, ImageC alphaMask) => _module.ImageAlphaMask(image, alphaMask);

/// See [RaylibCore.ImageAlphaPremultiply].
void ImageAlphaPremultiply(Pointer<ImageC> image) => _module.ImageAlphaPremultiply(image);

/// See [RaylibCore.ImageBlurGaussian].
void ImageBlurGaussian(Pointer<ImageC> image, int blurSize) => _module.ImageBlurGaussian(image, blurSize);

/// See [RaylibCore.ImageKernelConvolution].
void ImageKernelConvolution(
  Pointer<ImageC> image,
  Pointer<Float> kernel,
  int kernelSize,
) => _module.ImageKernelConvolution(image, kernel, kernelSize);

/// See [RaylibCore.ImageResize].
void ImageResize(Pointer<ImageC> image, int newWidth, int newHeight) => _module.ImageResize(image, newWidth, newHeight);

/// See [RaylibCore.ImageResizeNN].
void ImageResizeNN(Pointer<ImageC> image, int newWidth, int newHeight) => _module.ImageResizeNN(image, newWidth, newHeight);

/// See [RaylibCore.ImageResizeCanvas].
void ImageResizeCanvas(
  Pointer<ImageC> image,
  int newWidth,
  int newHeight,
  int offsetX,
  int offsetY,
  ColorC fill,
) => _module.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill);

/// See [RaylibCore.ImageMipmaps].
void ImageMipmaps(Pointer<ImageC> image) => _module.ImageMipmaps(image);

/// See [RaylibCore.ImageDither].
void ImageDither(
  Pointer<ImageC> image,
  int rBpp,
  int gBpp,
  int bBpp,
  int aBpp,
) => _module.ImageDither(image, rBpp, gBpp, bBpp, aBpp);

/// See [RaylibCore.ImageFlipVertical].
void ImageFlipVertical(Pointer<ImageC> image) => _module.ImageFlipVertical(image);

/// See [RaylibCore.ImageFlipHorizontal].
void ImageFlipHorizontal(Pointer<ImageC> image) => _module.ImageFlipHorizontal(image);

/// See [RaylibCore.ImageRotate].
void ImageRotate(Pointer<ImageC> image, int degrees) => _module.ImageRotate(image, degrees);

/// See [RaylibCore.ImageRotateCW].
void ImageRotateCW(Pointer<ImageC> image) => _module.ImageRotateCW(image);

/// See [RaylibCore.ImageRotateCCW].
void ImageRotateCCW(Pointer<ImageC> image) => _module.ImageRotateCCW(image);

/// See [RaylibCore.ImageColorTint].
void ImageColorTint(Pointer<ImageC> image, ColorC color) => _module.ImageColorTint(image, color);

/// See [RaylibCore.ImageColorInvert].
void ImageColorInvert(Pointer<ImageC> image) => _module.ImageColorInvert(image);

/// See [RaylibCore.ImageColorGrayscale].
void ImageColorGrayscale(Pointer<ImageC> image) => _module.ImageColorGrayscale(image);

/// See [RaylibCore.ImageColorContrast].
void ImageColorContrast(Pointer<ImageC> image, double contrast) => _module.ImageColorContrast(image, contrast);

/// See [RaylibCore.ImageColorBrightness].
void ImageColorBrightness(Pointer<ImageC> image, int brightness) => _module.ImageColorBrightness(image, brightness);

/// See [RaylibCore.ImageColorReplace].
void ImageColorReplace(Pointer<ImageC> image, ColorC color, ColorC replace) => _module.ImageColorReplace(image, color, replace);

/// See [RaylibCore.LoadImageColors].
Pointer<ColorC> LoadImageColors(ImageC image) => _module.LoadImageColors(image);

/// See [RaylibCore.LoadImagePalette].
Pointer<ColorC> LoadImagePalette(
  ImageC image,
  int maxPaletteSize,
  Pointer<Int> colorCount,
) => _module.LoadImagePalette(image, maxPaletteSize, colorCount);

/// See [RaylibCore.UnloadImageColors].
void UnloadImageColors(Pointer<ColorC> colors) => _module.UnloadImageColors(colors);

/// See [RaylibCore.UnloadImagePalette].
void UnloadImagePalette(Pointer<ColorC> colors) => _module.UnloadImagePalette(colors);

/// See [RaylibCore.GetImageAlphaBorder].
RectangleC GetImageAlphaBorder(ImageC image, double threshold) => _module.GetImageAlphaBorder(image, threshold);

/// See [RaylibCore.GetImageColor].
ColorC GetImageColor(ImageC image, int x, int y) => _module.GetImageColor(image, x, y);

/// See [RaylibCore.ImageClearBackground].
void ImageClearBackground(Pointer<ImageC> dst, ColorC color) => _module.ImageClearBackground(dst, color);

/// See [RaylibCore.ImageDrawPixel].
void ImageDrawPixel(Pointer<ImageC> dst, int posX, int posY, ColorC color) => _module.ImageDrawPixel(dst, posX, posY, color);

/// See [RaylibCore.ImageDrawPixelV].
void ImageDrawPixelV(Pointer<ImageC> dst, Vector2C position, ColorC color) => _module.ImageDrawPixelV(dst, position, color);

/// See [RaylibCore.ImageDrawLine].
void ImageDrawLine(
  Pointer<ImageC> dst,
  int startPosX,
  int startPosY,
  int endPosX,
  int endPosY,
  ColorC color,
) => _module.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCore.ImageDrawLineV].
void ImageDrawLineV(
  Pointer<ImageC> dst,
  Vector2C start,
  Vector2C end,
  ColorC color,
) => _module.ImageDrawLineV(dst, start, end, color);

/// See [RaylibCore.ImageDrawLineEx].
void ImageDrawLineEx(
  Pointer<ImageC> dst,
  Vector2C start,
  Vector2C end,
  int thick,
  ColorC color,
) => _module.ImageDrawLineEx(dst, start, end, thick, color);

/// See [RaylibCore.ImageDrawCircle].
void ImageDrawCircle(
  Pointer<ImageC> dst,
  int centerX,
  int centerY,
  int radius,
  ColorC color,
) => _module.ImageDrawCircle(dst, centerX, centerY, radius, color);

/// See [RaylibCore.ImageDrawCircleV].
void ImageDrawCircleV(
  Pointer<ImageC> dst,
  Vector2C center,
  int radius,
  ColorC color,
) => _module.ImageDrawCircleV(dst, center, radius, color);

/// See [RaylibCore.ImageDrawCircleLines].
void ImageDrawCircleLines(
  Pointer<ImageC> dst,
  int centerX,
  int centerY,
  int radius,
  ColorC color,
) => _module.ImageDrawCircleLines(dst, centerX, centerY, radius, color);

/// See [RaylibCore.ImageDrawCircleLinesV].
void ImageDrawCircleLinesV(
  Pointer<ImageC> dst,
  Vector2C center,
  int radius,
  ColorC color,
) => _module.ImageDrawCircleLinesV(dst, center, radius, color);

/// See [RaylibCore.ImageDrawRectangle].
void ImageDrawRectangle(
  Pointer<ImageC> dst,
  int posX,
  int posY,
  int width,
  int height,
  ColorC color,
) => _module.ImageDrawRectangle(dst, posX, posY, width, height, color);

/// See [RaylibCore.ImageDrawRectangleV].
void ImageDrawRectangleV(
  Pointer<ImageC> dst,
  Vector2C position,
  Vector2C size,
  ColorC color,
) => _module.ImageDrawRectangleV(dst, position, size, color);

/// See [RaylibCore.ImageDrawRectangleRec].
void ImageDrawRectangleRec(Pointer<ImageC> dst, RectangleC rec, ColorC color) => _module.ImageDrawRectangleRec(dst, rec, color);

/// See [RaylibCore.ImageDrawRectangleLines].
void ImageDrawRectangleLines(
  Pointer<ImageC> dst,
  RectangleC rec,
  int thick,
  ColorC color,
) => _module.ImageDrawRectangleLines(dst, rec, thick, color);

/// See [RaylibCore.ImageDrawTriangle].
void ImageDrawTriangle(
  Pointer<ImageC> dst,
  Vector2C v1,
  Vector2C v2,
  Vector2C v3,
  ColorC color,
) => _module.ImageDrawTriangle(dst, v1, v2, v3, color);

/// See [RaylibCore.ImageDrawTriangleEx].
void ImageDrawTriangleEx(
  Pointer<ImageC> dst,
  Vector2C v1,
  Vector2C v2,
  Vector2C v3,
  ColorC c1,
  ColorC c2,
  ColorC c3,
) => _module.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3);

/// See [RaylibCore.ImageDrawTriangleLines].
void ImageDrawTriangleLines(
  Pointer<ImageC> dst,
  Vector2C v1,
  Vector2C v2,
  Vector2C v3,
  ColorC color,
) => _module.ImageDrawTriangleLines(dst, v1, v2, v3, color);

/// See [RaylibCore.ImageDrawTriangleFan].
void ImageDrawTriangleFan(
  Pointer<ImageC> dst,
  Pointer<Vector2C> points,
  int pointCount,
  ColorC color,
) => _module.ImageDrawTriangleFan(dst, points, pointCount, color);

/// See [RaylibCore.ImageDrawTriangleStrip].
void ImageDrawTriangleStrip(
  Pointer<ImageC> dst,
  Pointer<Vector2C> points,
  int pointCount,
  ColorC color,
) => _module.ImageDrawTriangleStrip(dst, points, pointCount, color);

/// See [RaylibCore.ImageDraw].
void ImageDraw(
  Pointer<ImageC> dst,
  ImageC src,
  RectangleC srcRec,
  RectangleC dstRec,
  ColorC tint,
) => _module.ImageDraw(dst, src, srcRec, dstRec, tint);

/// See [RaylibCore.ImageDrawText].
void ImageDrawText(
  Pointer<ImageC> dst,
  Pointer<Char> text,
  int posX,
  int posY,
  int fontSize,
  ColorC color,
) => _module.ImageDrawText(dst, text, posX, posY, fontSize, color);

/// See [RaylibCore.ImageDrawTextEx].
void ImageDrawTextEx(
  Pointer<ImageC> dst,
  FontC font,
  Pointer<Char> text,
  Vector2C position,
  double fontSize,
  double spacing,
  ColorC tint,
) => _module.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint);

/// See [RaylibCore.LoadTexture].
TextureC LoadTexture(Pointer<Char> fileName) => _module.LoadTexture(fileName);

/// See [RaylibCore.LoadTextureFromImage].
TextureC LoadTextureFromImage(ImageC image) => _module.LoadTextureFromImage(image);

/// See [RaylibCore.LoadTextureCubemap].
TextureC LoadTextureCubemap(ImageC image, int layout) => _module.LoadTextureCubemap(image, layout);

/// See [RaylibCore.LoadRenderTexture].
RenderTextureC LoadRenderTexture(int width, int height) => _module.LoadRenderTexture(width, height);

/// See [RaylibCore.IsTextureValid].
bool IsTextureValid(TextureC texture) => _module.IsTextureValid(texture);

/// See [RaylibCore.UnloadTexture].
void UnloadTexture(TextureC texture) => _module.UnloadTexture(texture);

/// See [RaylibCore.IsRenderTextureValid].
bool IsRenderTextureValid(RenderTextureC target) => _module.IsRenderTextureValid(target);

/// See [RaylibCore.UnloadRenderTexture].
void UnloadRenderTexture(RenderTextureC target) => _module.UnloadRenderTexture(target);

/// See [RaylibCore.UpdateTexture].
void UpdateTexture(TextureC texture, Pointer<Void> pixels) => _module.UpdateTexture(texture, pixels);

/// See [RaylibCore.UpdateTextureRec].
void UpdateTextureRec(
  TextureC texture,
  RectangleC rec,
  Pointer<Void> pixels,
) => _module.UpdateTextureRec(texture, rec, pixels);

/// See [RaylibCore.GenTextureMipmaps].
void GenTextureMipmaps(Pointer<TextureC> texture) => _module.GenTextureMipmaps(texture);

/// See [RaylibCore.SetTextureFilter].
void SetTextureFilter(TextureC texture, int filter) => _module.SetTextureFilter(texture, filter);

/// See [RaylibCore.SetTextureWrap].
void SetTextureWrap(TextureC texture, int wrap) => _module.SetTextureWrap(texture, wrap);

/// See [RaylibCore.DrawTexture].
void DrawTexture(TextureC texture, int posX, int posY, ColorC tint) => _module.DrawTexture(texture, posX, posY, tint);

/// See [RaylibCore.DrawTextureV].
void DrawTextureV(TextureC texture, Vector2C position, ColorC tint) => _module.DrawTextureV(texture, position, tint);

/// See [RaylibCore.DrawTextureEx].
void DrawTextureEx(
  TextureC texture,
  Vector2C position,
  double rotation,
  double scale,
  ColorC tint,
) => _module.DrawTextureEx(texture, position, rotation, scale, tint);

/// See [RaylibCore.DrawTextureRec].
void DrawTextureRec(
  TextureC texture,
  RectangleC source,
  Vector2C position,
  ColorC tint,
) => _module.DrawTextureRec(texture, source, position, tint);

/// See [RaylibCore.DrawTexturePro].
void DrawTexturePro(
  TextureC texture,
  RectangleC source,
  RectangleC dest,
  Vector2C origin,
  double rotation,
  ColorC tint,
) => _module.DrawTexturePro(texture, source, dest, origin, rotation, tint);

/// See [RaylibCore.DrawTextureNPatch].
void DrawTextureNPatch(
  TextureC texture,
  NPatchInfoC nPatchInfo,
  RectangleC dest,
  Vector2C origin,
  double rotation,
  ColorC tint,
) => _module.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint);

/// See [RaylibCore.ColorIsEqual].
bool ColorIsEqual(ColorC col1, ColorC col2) => _module.ColorIsEqual(col1, col2);

/// See [RaylibCore.Fade].
ColorC Fade(ColorC color, double alpha) => _module.Fade(color, alpha);

/// See [RaylibCore.ColorToInt].
int ColorToInt(ColorC color) => _module.ColorToInt(color);

/// See [RaylibCore.ColorNormalize].
Vector4C ColorNormalize(ColorC color) => _module.ColorNormalize(color);

/// See [RaylibCore.ColorFromNormalized].
ColorC ColorFromNormalized(Vector4C normalized) => _module.ColorFromNormalized(normalized);

/// See [RaylibCore.ColorToHSV].
Vector3C ColorToHSV(ColorC color) => _module.ColorToHSV(color);

/// See [RaylibCore.ColorFromHSV].
ColorC ColorFromHSV(double hue, double saturation, double value) => _module.ColorFromHSV(hue, saturation, value);

/// See [RaylibCore.ColorTint].
ColorC ColorTint(ColorC color, ColorC tint) => _module.ColorTint(color, tint);

/// See [RaylibCore.ColorBrightness].
ColorC ColorBrightness(ColorC color, double factor) => _module.ColorBrightness(color, factor);

/// See [RaylibCore.ColorContrast].
ColorC ColorContrast(ColorC color, double contrast) => _module.ColorContrast(color, contrast);

/// See [RaylibCore.ColorAlpha].
ColorC ColorAlpha(ColorC color, double alpha) => _module.ColorAlpha(color, alpha);

/// See [RaylibCore.ColorAlphaBlend].
ColorC ColorAlphaBlend(ColorC dst, ColorC src, ColorC tint) => _module.ColorAlphaBlend(dst, src, tint);

/// See [RaylibCore.ColorLerp].
ColorC ColorLerp(ColorC color1, ColorC color2, double factor) => _module.ColorLerp(color1, color2, factor);

/// See [RaylibCore.GetColor].
ColorC GetColor(int hexValue) => _module.GetColor(hexValue);

/// See [RaylibCore.GetPixelColor].
ColorC GetPixelColor(Pointer<Void> srcPtr, int format) => _module.GetPixelColor(srcPtr, format);

/// See [RaylibCore.SetPixelColor].
void SetPixelColor(Pointer<Void> dstPtr, ColorC color, int format) => _module.SetPixelColor(dstPtr, color, format);

/// See [RaylibCore.GetPixelDataSize].
int GetPixelDataSize(int width, int height, int format) => _module.GetPixelDataSize(width, height, format);

/// See [RaylibCore.GetFontDefault].
FontC GetFontDefault() => _module.GetFontDefault();

/// See [RaylibCore.LoadFont].
FontC LoadFont(Pointer<Char> fileName) => _module.LoadFont(fileName);

/// See [RaylibCore.LoadFontEx].
FontC LoadFontEx(
  Pointer<Char> fileName,
  int fontSize,
  Pointer<Int> codepoints,
  int codepointCount,
) => _module.LoadFontEx(fileName, fontSize, codepoints, codepointCount);

/// See [RaylibCore.LoadFontFromImage].
FontC LoadFontFromImage(ImageC image, ColorC key, int firstChar) => _module.LoadFontFromImage(image, key, firstChar);

/// See [RaylibCore.LoadFontFromMemory].
FontC LoadFontFromMemory(
  Pointer<Char> fileType,
  Pointer<UnsignedChar> fileData,
  int dataSize,
  int fontSize,
  Pointer<Int> codepoints,
  int codepointCount,
) => _module.LoadFontFromMemory(fileType, fileData, dataSize, fontSize, codepoints, codepointCount);

/// See [RaylibCore.IsFontValid].
bool IsFontValid(FontC font) => _module.IsFontValid(font);

/// See [RaylibCore.LoadFontData].
Pointer<GlyphInfoC> LoadFontData(
  Pointer<UnsignedChar> fileData,
  int dataSize,
  int fontSize,
  Pointer<Int> codepoints,
  int codepointCount,
  int type,
  Pointer<Int> glyphCount,
) => _module.LoadFontData(fileData, dataSize, fontSize, codepoints, codepointCount, type, glyphCount);

/// See [RaylibCore.GenImageFontAtlas].
ImageC GenImageFontAtlas(
  Pointer<GlyphInfoC> glyphs,
  Pointer<Pointer<RectangleC>> glyphRecs,
  int glyphCount,
  int fontSize,
  int padding,
  int packMethod,
) => _module.GenImageFontAtlas(glyphs, glyphRecs, glyphCount, fontSize, padding, packMethod);

/// See [RaylibCore.UnloadFontData].
void UnloadFontData(Pointer<GlyphInfoC> glyphs, int glyphCount) => _module.UnloadFontData(glyphs, glyphCount);

/// See [RaylibCore.UnloadFont].
void UnloadFont(FontC font) => _module.UnloadFont(font);

/// See [RaylibCore.ExportFontAsCode].
bool ExportFontAsCode(FontC font, Pointer<Char> fileName) => _module.ExportFontAsCode(font, fileName);

/// See [RaylibCore.DrawFPS].
void DrawFPS(int posX, int posY) => _module.DrawFPS(posX, posY);

/// See [RaylibCore.DrawText].
void DrawText(
  Pointer<Char> text,
  int posX,
  int posY,
  int fontSize,
  ColorC color,
) => _module.DrawText(text, posX, posY, fontSize, color);

/// See [RaylibCore.DrawTextEx].
void DrawTextEx(
  FontC font,
  Pointer<Char> text,
  Vector2C position,
  double fontSize,
  double spacing,
  ColorC tint,
) => _module.DrawTextEx(font, text, position, fontSize, spacing, tint);

/// See [RaylibCore.DrawTextPro].
void DrawTextPro(
  FontC font,
  Pointer<Char> text,
  Vector2C position,
  Vector2C origin,
  double rotation,
  double fontSize,
  double spacing,
  ColorC tint,
) => _module.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint);

/// See [RaylibCore.DrawTextCodepoint].
void DrawTextCodepoint(
  FontC font,
  int codepoint,
  Vector2C position,
  double fontSize,
  ColorC tint,
) => _module.DrawTextCodepoint(font, codepoint, position, fontSize, tint);

/// See [RaylibCore.DrawTextCodepoints].
void DrawTextCodepoints(
  FontC font,
  Pointer<Int> codepoints,
  int codepointCount,
  Vector2C position,
  double fontSize,
  double spacing,
  ColorC tint,
) => _module.DrawTextCodepoints(font, codepoints, codepointCount, position, fontSize, spacing, tint);

/// See [RaylibCore.SetTextLineSpacing].
void SetTextLineSpacing(int spacing) => _module.SetTextLineSpacing(spacing);

/// See [RaylibCore.MeasureText].
int MeasureText(Pointer<Char> text, int fontSize) => _module.MeasureText(text, fontSize);

/// See [RaylibCore.MeasureTextEx].
Vector2C MeasureTextEx(
  FontC font,
  Pointer<Char> text,
  double fontSize,
  double spacing,
) => _module.MeasureTextEx(font, text, fontSize, spacing);

/// See [RaylibCore.MeasureTextCodepoints].
Vector2C MeasureTextCodepoints(
  FontC font,
  Pointer<Int> codepoints,
  int length,
  double fontSize,
  double spacing,
) => _module.MeasureTextCodepoints(font, codepoints, length, fontSize, spacing);

/// See [RaylibCore.GetGlyphIndex].
int GetGlyphIndex(FontC font, int codepoint) => _module.GetGlyphIndex(font, codepoint);

/// See [RaylibCore.GetGlyphInfo].
GlyphInfoC GetGlyphInfo(FontC font, int codepoint) => _module.GetGlyphInfo(font, codepoint);

/// See [RaylibCore.GetGlyphAtlasRec].
RectangleC GetGlyphAtlasRec(FontC font, int codepoint) => _module.GetGlyphAtlasRec(font, codepoint);

/// See [RaylibCore.LoadUTF8].
Pointer<Char> LoadUTF8(Pointer<Int> codepoints, int length) => _module.LoadUTF8(codepoints, length);

/// See [RaylibCore.UnloadUTF8].
void UnloadUTF8(Pointer<Char> text) => _module.UnloadUTF8(text);

/// See [RaylibCore.LoadCodepoints].
Pointer<Int> LoadCodepoints(Pointer<Char> text, Pointer<Int> count) => _module.LoadCodepoints(text, count);

/// See [RaylibCore.UnloadCodepoints].
void UnloadCodepoints(Pointer<Int> codepoints) => _module.UnloadCodepoints(codepoints);

/// See [RaylibCore.GetCodepointCount].
int GetCodepointCount(Pointer<Char> text) => _module.GetCodepointCount(text);

/// See [RaylibCore.GetCodepoint].
int GetCodepoint(Pointer<Char> text, Pointer<Int> codepointSize) => _module.GetCodepoint(text, codepointSize);

/// See [RaylibCore.GetCodepointNext].
int GetCodepointNext(Pointer<Char> text, Pointer<Int> codepointSize) => _module.GetCodepointNext(text, codepointSize);

/// See [RaylibCore.GetCodepointPrevious].
int GetCodepointPrevious(Pointer<Char> text, Pointer<Int> codepointSize) => _module.GetCodepointPrevious(text, codepointSize);

/// See [RaylibCore.CodepointToUTF8].
Pointer<Char> CodepointToUTF8(int codepoint, Pointer<Int> utf8Size) => _module.CodepointToUTF8(codepoint, utf8Size);

/// See [RaylibCore.LoadTextLines].
Pointer<Pointer<Char>> LoadTextLines(
  Pointer<Char> text,
  Pointer<Int> count,
) => _module.LoadTextLines(text, count);

/// See [RaylibCore.UnloadTextLines].
void UnloadTextLines(Pointer<Pointer<Char>> text, int lineCount) => _module.UnloadTextLines(text, lineCount);

/// See [RaylibCore.TextCopy].
int TextCopy(Pointer<Char> dst, Pointer<Char> src) => _module.TextCopy(dst, src);

/// See [RaylibCore.TextIsEqual].
bool TextIsEqual(Pointer<Char> text1, Pointer<Char> text2) => _module.TextIsEqual(text1, text2);

/// See [RaylibCore.TextLength].
int TextLength(Pointer<Char> text) => _module.TextLength(text);

/// See [RaylibCore.TextFormat].
Pointer<Char> TextFormat(Pointer<Char> text) => _module.TextFormat(text);

/// See [RaylibCore.TextSubtext].
Pointer<Char> TextSubtext(Pointer<Char> text, int position, int length) => _module.TextSubtext(text, position, length);

/// See [RaylibCore.TextRemoveSpaces].
Pointer<Char> TextRemoveSpaces(Pointer<Char> text) => _module.TextRemoveSpaces(text);

/// See [RaylibCore.GetTextBetween].
Pointer<Char> GetTextBetween(
  Pointer<Char> text,
  Pointer<Char> begin,
  Pointer<Char> end,
) => _module.GetTextBetween(text, begin, end);

/// See [RaylibCore.TextReplace].
Pointer<Char> TextReplace(
  Pointer<Char> text,
  Pointer<Char> replace,
  Pointer<Char> by,
) => _module.TextReplace(text, replace, by);

/// See [RaylibCore.TextReplaceAlloc].
Pointer<Char> TextReplaceAlloc(
  Pointer<Char> text,
  Pointer<Char> replace,
  Pointer<Char> by,
) => _module.TextReplaceAlloc(text, replace, by);

/// See [RaylibCore.TextReplaceBetween].
Pointer<Char> TextReplaceBetween(
  Pointer<Char> text,
  Pointer<Char> begin,
  Pointer<Char> end,
  Pointer<Char> replacement,
) => _module.TextReplaceBetween(text, begin, end, replacement);

/// See [RaylibCore.TextReplaceBetweenAlloc].
Pointer<Char> TextReplaceBetweenAlloc(
  Pointer<Char> text,
  Pointer<Char> begin,
  Pointer<Char> end,
  Pointer<Char> replacement,
) => _module.TextReplaceBetweenAlloc(text, begin, end, replacement);

/// See [RaylibCore.TextInsert].
Pointer<Char> TextInsert(
  Pointer<Char> text,
  Pointer<Char> insert,
  int position,
) => _module.TextInsert(text, insert, position);

/// See [RaylibCore.TextInsertAlloc].
Pointer<Char> TextInsertAlloc(
  Pointer<Char> text,
  Pointer<Char> insert,
  int position,
) => _module.TextInsertAlloc(text, insert, position);

/// See [RaylibCore.TextJoin].
Pointer<Char> TextJoin(
  Pointer<Pointer<Char>> textList,
  int count,
  Pointer<Char> delimiter,
) => _module.TextJoin(textList, count, delimiter);

/// See [RaylibCore.TextSplit].
Pointer<Pointer<Char>> TextSplit(
  Pointer<Char> text,
  int delimiter,
  Pointer<Int> count,
) => _module.TextSplit(text, delimiter, count);

/// See [RaylibCore.TextAppend].
void TextAppend(
  Pointer<Char> text,
  Pointer<Char> append,
  Pointer<Int> position,
) => _module.TextAppend(text, append, position);

/// See [RaylibCore.TextFindIndex].
int TextFindIndex(Pointer<Char> text, Pointer<Char> find) => _module.TextFindIndex(text, find);

/// See [RaylibCore.TextToUpper].
Pointer<Char> TextToUpper(Pointer<Char> text) => _module.TextToUpper(text);

/// See [RaylibCore.TextToLower].
Pointer<Char> TextToLower(Pointer<Char> text) => _module.TextToLower(text);

/// See [RaylibCore.TextToPascal].
Pointer<Char> TextToPascal(Pointer<Char> text) => _module.TextToPascal(text);

/// See [RaylibCore.TextToSnake].
Pointer<Char> TextToSnake(Pointer<Char> text) => _module.TextToSnake(text);

/// See [RaylibCore.TextToCamel].
Pointer<Char> TextToCamel(Pointer<Char> text) => _module.TextToCamel(text);

/// See [RaylibCore.TextToInteger].
int TextToInteger(Pointer<Char> text) => _module.TextToInteger(text);

/// See [RaylibCore.TextToFloat].
double TextToFloat(Pointer<Char> text) => _module.TextToFloat(text);

/// See [RaylibCore.DrawLine3D].
void DrawLine3D(Vector3C startPos, Vector3C endPos, ColorC color) => _module.DrawLine3D(startPos, endPos, color);

/// See [RaylibCore.DrawPoint3D].
void DrawPoint3D(Vector3C position, ColorC color) => _module.DrawPoint3D(position, color);

/// See [RaylibCore.DrawCircle3D].
void DrawCircle3D(
  Vector3C center,
  double radius,
  Vector3C rotationAxis,
  double rotationAngle,
  ColorC color,
) => _module.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color);

/// See [RaylibCore.DrawTriangle3D].
void DrawTriangle3D(Vector3C v1, Vector3C v2, Vector3C v3, ColorC color) => _module.DrawTriangle3D(v1, v2, v3, color);

/// See [RaylibCore.DrawTriangleStrip3D].
void DrawTriangleStrip3D(
  Pointer<Vector3C> points,
  int pointCount,
  ColorC color,
) => _module.DrawTriangleStrip3D(points, pointCount, color);

/// See [RaylibCore.DrawCube].
void DrawCube(
  Vector3C position,
  double width,
  double height,
  double length,
  ColorC color,
) => _module.DrawCube(position, width, height, length, color);

/// See [RaylibCore.DrawCubeV].
void DrawCubeV(Vector3C position, Vector3C size, ColorC color) => _module.DrawCubeV(position, size, color);

/// See [RaylibCore.DrawCubeWires].
void DrawCubeWires(
  Vector3C position,
  double width,
  double height,
  double length,
  ColorC color,
) => _module.DrawCubeWires(position, width, height, length, color);

/// See [RaylibCore.DrawCubeWiresV].
void DrawCubeWiresV(Vector3C position, Vector3C size, ColorC color) => _module.DrawCubeWiresV(position, size, color);

/// See [RaylibCore.DrawSphere].
void DrawSphere(Vector3C centerPos, double radius, ColorC color) => _module.DrawSphere(centerPos, radius, color);

/// See [RaylibCore.DrawSphereEx].
void DrawSphereEx(
  Vector3C centerPos,
  double radius,
  int rings,
  int slices,
  ColorC color,
) => _module.DrawSphereEx(centerPos, radius, rings, slices, color);

/// See [RaylibCore.DrawSphereWires].
void DrawSphereWires(
  Vector3C centerPos,
  double radius,
  int rings,
  int slices,
  ColorC color,
) => _module.DrawSphereWires(centerPos, radius, rings, slices, color);

/// See [RaylibCore.DrawCylinder].
void DrawCylinder(
  Vector3C position,
  double radiusTop,
  double radiusBottom,
  double height,
  int slices,
  ColorC color,
) => _module.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCore.DrawCylinderEx].
void DrawCylinderEx(
  Vector3C startPos,
  Vector3C endPos,
  double startRadius,
  double endRadius,
  int sides,
  ColorC color,
) => _module.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCore.DrawCylinderWires].
void DrawCylinderWires(
  Vector3C position,
  double radiusTop,
  double radiusBottom,
  double height,
  int slices,
  ColorC color,
) => _module.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCore.DrawCylinderWiresEx].
void DrawCylinderWiresEx(
  Vector3C startPos,
  Vector3C endPos,
  double startRadius,
  double endRadius,
  int sides,
  ColorC color,
) => _module.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCore.DrawCapsule].
void DrawCapsule(
  Vector3C startPos,
  Vector3C endPos,
  double radius,
  int slices,
  int rings,
  ColorC color,
) => _module.DrawCapsule(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCore.DrawCapsuleWires].
void DrawCapsuleWires(
  Vector3C startPos,
  Vector3C endPos,
  double radius,
  int slices,
  int rings,
  ColorC color,
) => _module.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCore.DrawPlane].
void DrawPlane(Vector3C centerPos, Vector2C size, ColorC color) => _module.DrawPlane(centerPos, size, color);

/// See [RaylibCore.DrawRay].
void DrawRay(RayC ray, ColorC color) => _module.DrawRay(ray, color);

/// See [RaylibCore.DrawGrid].
void DrawGrid(int slices, double spacing) => _module.DrawGrid(slices, spacing);

/// See [RaylibCore.LoadModel].
ModelC LoadModel(Pointer<Char> fileName) => _module.LoadModel(fileName);

/// See [RaylibCore.LoadModelFromMesh].
ModelC LoadModelFromMesh(MeshC mesh) => _module.LoadModelFromMesh(mesh);

/// See [RaylibCore.IsModelValid].
bool IsModelValid(ModelC model) => _module.IsModelValid(model);

/// See [RaylibCore.UnloadModel].
void UnloadModel(ModelC model) => _module.UnloadModel(model);

/// See [RaylibCore.GetModelBoundingBox].
BoundingBoxC GetModelBoundingBox(ModelC model) => _module.GetModelBoundingBox(model);

/// See [RaylibCore.DrawModel].
void DrawModel(ModelC model, Vector3C position, double scale, ColorC tint) => _module.DrawModel(model, position, scale, tint);

/// See [RaylibCore.DrawModelEx].
void DrawModelEx(
  ModelC model,
  Vector3C position,
  Vector3C rotationAxis,
  double rotationAngle,
  Vector3C scale,
  ColorC tint,
) => _module.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCore.DrawModelWires].
void DrawModelWires(
  ModelC model,
  Vector3C position,
  double scale,
  ColorC tint,
) => _module.DrawModelWires(model, position, scale, tint);

/// See [RaylibCore.DrawModelWiresEx].
void DrawModelWiresEx(
  ModelC model,
  Vector3C position,
  Vector3C rotationAxis,
  double rotationAngle,
  Vector3C scale,
  ColorC tint,
) => _module.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCore.DrawBoundingBox].
void DrawBoundingBox(BoundingBoxC box, ColorC color) => _module.DrawBoundingBox(box, color);

/// See [RaylibCore.DrawBillboard].
void DrawBillboard(
  Camera3DC camera,
  TextureC texture,
  Vector3C position,
  double scale,
  ColorC tint,
) => _module.DrawBillboard(camera, texture, position, scale, tint);

/// See [RaylibCore.DrawBillboardRec].
void DrawBillboardRec(
  Camera3DC camera,
  TextureC texture,
  RectangleC source,
  Vector3C position,
  Vector2C size,
  ColorC tint,
) => _module.DrawBillboardRec(camera, texture, source, position, size, tint);

/// See [RaylibCore.DrawBillboardPro].
@Deprecated(
  "Broken by a dart:ffi bug: the trailing Color argument gets corrupted "
  "(or crashes) once the preceding float-only args exceed the CPU's 8 "
  "float registers. Use DrawBillboard, or wait for the fix. "
  "See dart-lang/sdk#63976."
)
void DrawBillboardPro(
  Camera3DC camera,
  TextureC texture,
  RectangleC source,
  Vector3C position,
  Vector3C up,
  Vector2C size,
  Vector2C origin,
  double rotation,
  ColorC tint,
) => _module.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint);

/// See [RaylibCore.UploadMesh].
void UploadMesh(Pointer<MeshC> mesh, bool dynamic) => _module.UploadMesh(mesh, dynamic);

/// See [RaylibCore.UpdateMeshBuffer].
void UpdateMeshBuffer(
  MeshC mesh,
  int index,
  Pointer<Void> data,
  int dataSize,
  int offset,
) => _module.UpdateMeshBuffer(mesh, index, data, dataSize, offset);

/// See [RaylibCore.UnloadMesh].
void UnloadMesh(MeshC mesh) => _module.UnloadMesh(mesh);

/// See [RaylibCore.DrawMesh].
void DrawMesh(MeshC mesh, MaterialC material, MatrixC transform) => _module.DrawMesh(mesh, material, transform);

/// See [RaylibCore.DrawMeshInstanced].
void DrawMeshInstanced(
  MeshC mesh,
  MaterialC material,
  Pointer<MatrixC> transforms,
  int instances,
) => _module.DrawMeshInstanced(mesh, material, transforms, instances);

/// See [RaylibCore.GetMeshBoundingBox].
BoundingBoxC GetMeshBoundingBox(MeshC mesh) => _module.GetMeshBoundingBox(mesh);

/// See [RaylibCore.GenMeshTangents].
void GenMeshTangents(Pointer<MeshC> mesh) => _module.GenMeshTangents(mesh);

/// See [RaylibCore.ExportMesh].
bool ExportMesh(MeshC mesh, Pointer<Char> fileName) => _module.ExportMesh(mesh, fileName);

/// See [RaylibCore.ExportMeshAsCode].
bool ExportMeshAsCode(MeshC mesh, Pointer<Char> fileName) => _module.ExportMeshAsCode(mesh, fileName);

/// See [RaylibCore.GenMeshPoly].
MeshC GenMeshPoly(int sides, double radius) => _module.GenMeshPoly(sides, radius);

/// See [RaylibCore.GenMeshPlane].
MeshC GenMeshPlane(double width, double length, int resX, int resZ) => _module.GenMeshPlane(width, length, resX, resZ);

/// See [RaylibCore.GenMeshCube].
MeshC GenMeshCube(double width, double height, double length) => _module.GenMeshCube(width, height, length);

/// See [RaylibCore.GenMeshSphere].
MeshC GenMeshSphere(double radius, int rings, int slices) => _module.GenMeshSphere(radius, rings, slices);

/// See [RaylibCore.GenMeshHemiSphere].
MeshC GenMeshHemiSphere(double radius, int rings, int slices) => _module.GenMeshHemiSphere(radius, rings, slices);

/// See [RaylibCore.GenMeshCylinder].
MeshC GenMeshCylinder(double radius, double height, int slices) => _module.GenMeshCylinder(radius, height, slices);

/// See [RaylibCore.GenMeshCone].
MeshC GenMeshCone(double radius, double height, int slices) => _module.GenMeshCone(radius, height, slices);

/// See [RaylibCore.GenMeshTorus].
MeshC GenMeshTorus(double radius, double size, int radSeg, int sides) => _module.GenMeshTorus(radius, size, radSeg, sides);

/// See [RaylibCore.GenMeshKnot].
MeshC GenMeshKnot(double radius, double size, int radSeg, int sides) => _module.GenMeshKnot(radius, size, radSeg, sides);

/// See [RaylibCore.GenMeshHeightmap].
MeshC GenMeshHeightmap(ImageC heightmap, Vector3C size) => _module.GenMeshHeightmap(heightmap, size);

/// See [RaylibCore.GenMeshCubicmap].
MeshC GenMeshCubicmap(ImageC cubicmap, Vector3C cubeSize) => _module.GenMeshCubicmap(cubicmap, cubeSize);

/// See [RaylibCore.LoadMaterials].
Pointer<MaterialC> LoadMaterials(
  Pointer<Char> fileName,
  Pointer<Int> materialCount,
) => _module.LoadMaterials(fileName, materialCount);

/// See [RaylibCore.LoadMaterialDefault].
MaterialC LoadMaterialDefault() => _module.LoadMaterialDefault();

/// See [RaylibCore.IsMaterialValid].
bool IsMaterialValid(MaterialC material) => _module.IsMaterialValid(material);

/// See [RaylibCore.UnloadMaterial].
void UnloadMaterial(MaterialC material) => _module.UnloadMaterial(material);

/// See [RaylibCore.SetMaterialTexture].
void SetMaterialTexture(
  Pointer<MaterialC> material,
  int mapType,
  TextureC texture,
) => _module.SetMaterialTexture(material, mapType, texture);

/// See [RaylibCore.SetModelMeshMaterial].
void SetModelMeshMaterial(Pointer<ModelC> model, int meshId, int materialId) => _module.SetModelMeshMaterial(model, meshId, materialId);

/// See [RaylibCore.LoadModelAnimations].
Pointer<ModelAnimationC> LoadModelAnimations(
  Pointer<Char> fileName,
  Pointer<Int> animCount,
) => _module.LoadModelAnimations(fileName, animCount);

/// See [RaylibCore.UpdateModelAnimation].
void UpdateModelAnimation(ModelC model, ModelAnimationC anim, double frame) => _module.UpdateModelAnimation(model, anim, frame);

/// See [RaylibCore.UpdateModelAnimationEx].
void UpdateModelAnimationEx(
  ModelC model,
  ModelAnimationC animA,
  double frameA,
  ModelAnimationC animB,
  double frameB,
  double blend,
) => _module.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend);

/// See [RaylibCore.UnloadModelAnimations].
void UnloadModelAnimations(
  Pointer<ModelAnimationC> animations,
  int animCount,
) => _module.UnloadModelAnimations(animations, animCount);

/// See [RaylibCore.IsModelAnimationValid].
bool IsModelAnimationValid(ModelC model, ModelAnimationC anim) => _module.IsModelAnimationValid(model, anim);

/// See [RaylibCore.CheckCollisionSpheres].
bool CheckCollisionSpheres(
  Vector3C center1,
  double radius1,
  Vector3C center2,
  double radius2,
) => _module.CheckCollisionSpheres(center1, radius1, center2, radius2);

/// See [RaylibCore.CheckCollisionBoxes].
bool CheckCollisionBoxes(BoundingBoxC box1, BoundingBoxC box2) => _module.CheckCollisionBoxes(box1, box2);

/// See [RaylibCore.CheckCollisionBoxSphere].
bool CheckCollisionBoxSphere(
  BoundingBoxC box,
  Vector3C center,
  double radius,
) => _module.CheckCollisionBoxSphere(box, center, radius);

/// See [RaylibCore.GetRayCollisionSphere].
RayCollisionC GetRayCollisionSphere(RayC ray, Vector3C center, double radius) => _module.GetRayCollisionSphere(ray, center, radius);

/// See [RaylibCore.GetRayCollisionBox].
RayCollisionC GetRayCollisionBox(RayC ray, BoundingBoxC box) => _module.GetRayCollisionBox(ray, box);

/// See [RaylibCore.GetRayCollisionMesh].
RayCollisionC GetRayCollisionMesh(RayC ray, MeshC mesh, MatrixC transform) => _module.GetRayCollisionMesh(ray, mesh, transform);

/// See [RaylibCore.GetRayCollisionTriangle].
RayCollisionC GetRayCollisionTriangle(
  RayC ray,
  Vector3C p1,
  Vector3C p2,
  Vector3C p3,
) => _module.GetRayCollisionTriangle(ray, p1, p2, p3);

/// See [RaylibCore.GetRayCollisionQuad].
RayCollisionC GetRayCollisionQuad(
  RayC ray,
  Vector3C p1,
  Vector3C p2,
  Vector3C p3,
  Vector3C p4,
) => _module.GetRayCollisionQuad(ray, p1, p2, p3, p4);

