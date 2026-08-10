import 'dart:ffi';
import 'dart:typed_data';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibCoreD get _module => Raylib.instance.CoreD;

/// See [RaylibCoreD.InitWindow].
void InitWindow(
  num width,
  num height,
  String title,
) => _module.InitWindow(width, height, title);

/// See [RaylibCoreD.CloseWindow].
void CloseWindow() => _module.CloseWindow();

/// See [RaylibCoreD.WindowShouldClose].
bool WindowShouldClose() => _module.WindowShouldClose();

/// See [RaylibCoreD.IsWindowReady].
bool IsWindowReady() => _module.IsWindowReady();

/// See [RaylibCoreD.IsWindowFullscreen].
bool IsWindowFullscreen() => _module.IsWindowFullscreen();

/// See [RaylibCoreD.IsWindowHidden].
bool IsWindowHidden() => _module.IsWindowHidden();

/// See [RaylibCoreD.IsWindowMinimized].
bool IsWindowMinimized() => _module.IsWindowMinimized();

/// See [RaylibCoreD.IsWindowMaximized].
bool IsWindowMaximized() => _module.IsWindowMaximized();

/// See [RaylibCoreD.IsWindowFocused].
bool IsWindowFocused() => _module.IsWindowFocused();

/// See [RaylibCoreD.IsWindowResized].
bool IsWindowResized() => _module.IsWindowResized();

/// See [RaylibCoreD.IsWindowState].
bool IsWindowState(
  ConfigFlags flag,
) => _module.IsWindowState(flag);

/// See [RaylibCoreD.SetWindowState].
void SetWindowState(
  Iterable<ConfigFlags> flags,
) => _module.SetWindowState(flags);

/// See [RaylibCoreD.ClearWindowState].
void ClearWindowState(
  Iterable<ConfigFlags> flags,
) => _module.ClearWindowState(flags);

/// See [RaylibCoreD.ToggleFullscreen].
void ToggleFullscreen() => _module.ToggleFullscreen();

/// See [RaylibCoreD.ToggleBorderlessWindowed].
void ToggleBorderlessWindowed() => _module.ToggleBorderlessWindowed();

/// See [RaylibCoreD.MaximizeWindow].
void MaximizeWindow() => _module.MaximizeWindow();

/// See [RaylibCoreD.MinimizeWindow].
void MinimizeWindow() => _module.MinimizeWindow();

/// See [RaylibCoreD.RestoreWindow].
void RestoreWindow() => _module.RestoreWindow();

/// See [RaylibCoreD.SetWindowIcon].
void SetWindowIcon(
  ImageD image,
) => _module.SetWindowIcon(image);

/// See [RaylibCoreD.SetWindowIcons].
void SetWindowIcons(
  List<ImageD> images,
) => _module.SetWindowIcons(images);

/// See [RaylibCoreD.SetWindowTitle].
void SetWindowTitle(
  String title,
) => _module.SetWindowTitle(title);

/// See [RaylibCoreD.SetWindowPosition].
void SetWindowPosition(
  num x,
  num y,
) => _module.SetWindowPosition(x, y);

/// See [RaylibCoreD.SetWindowMonitor].
void SetWindowMonitor(
  num monitor,
) => _module.SetWindowMonitor(monitor);

/// See [RaylibCoreD.SetWindowMinSize].
void SetWindowMinSize(
  num width,
  num height,
) => _module.SetWindowMinSize(width, height);

/// See [RaylibCoreD.SetWindowMaxSize].
void SetWindowMaxSize(
  num width,
  num height,
) => _module.SetWindowMaxSize(width, height);

/// See [RaylibCoreD.SetWindowSize].
void SetWindowSize(
  num width,
  num height,
) => _module.SetWindowSize(width, height);

/// See [RaylibCoreD.SetWindowOpacity].
void SetWindowOpacity(
  num opacity,
) => _module.SetWindowOpacity(opacity);

/// See [RaylibCoreD.SetWindowFocused].
void SetWindowFocused() => _module.SetWindowFocused();

/// See [RaylibCoreD.GetScreenWidth].
int GetScreenWidth() => _module.GetScreenWidth();

/// See [RaylibCoreD.GetScreenHeight].
int GetScreenHeight() => _module.GetScreenHeight();

/// See [RaylibCoreD.GetRenderWidth].
int GetRenderWidth() => _module.GetRenderWidth();

/// See [RaylibCoreD.GetRenderHeight].
int GetRenderHeight() => _module.GetRenderHeight();

/// See [RaylibCoreD.GetMonitorCount].
int GetMonitorCount() => _module.GetMonitorCount();

/// See [RaylibCoreD.GetCurrentMonitor].
int GetCurrentMonitor() => _module.GetCurrentMonitor();

/// See [RaylibCoreD.GetMonitorPosition].
Vector2D GetMonitorPosition(
  num monitor,
) => _module.GetMonitorPosition(monitor);

/// See [RaylibCoreD.GetMonitorWidth].
int GetMonitorWidth(
  num monitor,
) => _module.GetMonitorWidth(monitor);

/// See [RaylibCoreD.GetMonitorHeight].
int GetMonitorHeight(
  num monitor,
) => _module.GetMonitorHeight(monitor);

/// See [RaylibCoreD.GetMonitorPhysicalWidth].
int GetMonitorPhysicalWidth(
  num monitor,
) => _module.GetMonitorPhysicalWidth(monitor);

/// See [RaylibCoreD.GetMonitorPhysicalHeight].
int GetMonitorPhysicalHeight(
  num monitor,
) => _module.GetMonitorPhysicalHeight(monitor);

/// See [RaylibCoreD.GetMonitorRefreshRate].
int GetMonitorRefreshRate(
  num monitor,
) => _module.GetMonitorRefreshRate(monitor);

/// See [RaylibCoreD.GetWindowPosition].
Vector2D GetWindowPosition() => _module.GetWindowPosition();

/// See [RaylibCoreD.GetWindowScaleDPI].
Vector2D GetWindowScaleDPI() => _module.GetWindowScaleDPI();

/// See [RaylibCoreD.GetMonitorName].
String GetMonitorName(
  num monitor,
) => _module.GetMonitorName(monitor);

/// See [RaylibCoreD.SetClipboardText].
void SetClipboardText(
  String text,
) => _module.SetClipboardText(text);

/// See [RaylibCoreD.GetClipboardText].
String GetClipboardText() => _module.GetClipboardText();

/// See [RaylibCoreD.GetClipboardImage].
ImageD GetClipboardImage() => _module.GetClipboardImage();

/// See [RaylibCoreD.EnableEventWaiting].
void EnableEventWaiting() => _module.EnableEventWaiting();

/// See [RaylibCoreD.DisableEventWaiting].
void DisableEventWaiting() => _module.DisableEventWaiting();

/// See [RaylibCoreD.ShowCursor].
void ShowCursor() => _module.ShowCursor();

/// See [RaylibCoreD.HideCursor].
void HideCursor() => _module.HideCursor();

/// See [RaylibCoreD.IsCursorHidden].
bool IsCursorHidden() => _module.IsCursorHidden();

/// See [RaylibCoreD.EnableCursor].
void EnableCursor() => _module.EnableCursor();

/// See [RaylibCoreD.DisableCursor].
void DisableCursor() => _module.DisableCursor();

/// See [RaylibCoreD.IsCursorOnScreen].
bool IsCursorOnScreen() => _module.IsCursorOnScreen();

/// See [RaylibCoreD.ClearBackground].
void ClearBackground(
  ColorD color,
) => _module.ClearBackground(color);

/// See [RaylibCoreD.BeginDrawing].
void BeginDrawing() => _module.BeginDrawing();

/// See [RaylibCoreD.EndDrawing].
void EndDrawing() => _module.EndDrawing();

/// See [RaylibCoreD.BeginMode2D].
void BeginMode2D(
  Camera2DD camera,
) => _module.BeginMode2D(camera);

/// See [RaylibCoreD.EndMode2D].
void EndMode2D() => _module.EndMode2D();

/// See [RaylibCoreD.BeginMode3D].
void BeginMode3D(
  Camera3DD camera,
) => _module.BeginMode3D(camera);

/// See [RaylibCoreD.EndMode3D].
void EndMode3D() => _module.EndMode3D();

/// See [RaylibCoreD.BeginTextureMode].
void BeginTextureMode(
  RenderTextureD target,
) => _module.BeginTextureMode(target);

/// See [RaylibCoreD.EndTextureMode].
void EndTextureMode() => _module.EndTextureMode();

/// See [RaylibCoreD.BeginShaderMode].
void BeginShaderMode(
  ShaderD shader,
) => _module.BeginShaderMode(shader);

/// See [RaylibCoreD.EndShaderMode].
void EndShaderMode() => _module.EndShaderMode();

/// See [RaylibCoreD.BeginBlendMode].
void BeginBlendMode(
  BlendMode mode,
) => _module.BeginBlendMode(mode);

/// See [RaylibCoreD.EndBlendMode].
void EndBlendMode() => _module.EndBlendMode();

/// See [RaylibCoreD.BeginScissorMode].
void BeginScissorMode(
  num x,
  num y,
  num width,
  num height,
) => _module.BeginScissorMode(x, y, width, height);

/// See [RaylibCoreD.EndScissorMode].
void EndScissorMode() => _module.EndScissorMode();

/// See [RaylibCoreD.BeginVrStereoMode].
void BeginVrStereoMode(
  VrStereoConfigD config,
) => _module.BeginVrStereoMode(config);

/// See [RaylibCoreD.EndVrStereoMode].
void EndVrStereoMode() => _module.EndVrStereoMode();

/// See [RaylibCoreD.LoadVrStereoConfig].
VrStereoConfigD LoadVrStereoConfig(
  VrDeviceInfoD device,
) => _module.LoadVrStereoConfig(device);

/// See [RaylibCoreD.UnloadVrStereoConfig].
void UnloadVrStereoConfig(
  VrStereoConfigD config,
) => _module.UnloadVrStereoConfig(config);

/// See [RaylibCoreD.LoadShader].
ShaderD LoadShader(
  String? vsFileName,
  String? fsFileName,
) => _module.LoadShader(vsFileName, fsFileName);

/// See [RaylibCoreD.LoadShaderFromMemory].
ShaderD LoadShaderFromMemory(
  String? vsCode,
  String? fsCode,
) => _module.LoadShaderFromMemory(vsCode, fsCode);

/// See [RaylibCoreD.IsShaderValid].
bool IsShaderValid(
  ShaderD shader,
) => _module.IsShaderValid(shader);

/// See [RaylibCoreD.GetShaderLocation].
int GetShaderLocation(
  ShaderD shader,
  String uniformName,
) => _module.GetShaderLocation(shader, uniformName);

/// See [RaylibCoreD.GetShaderLocationAttrib].
int GetShaderLocationAttrib(
  ShaderD shader,
  String attribName,
) => _module.GetShaderLocationAttrib(shader, attribName);

/// See [RaylibCoreD.SetShaderValue].
void SetShaderValue(
  ShaderD shader,
  num locIndex,
  List<num> value,
  ShaderUniformDataType uniformType,
) => _module.SetShaderValue(shader, locIndex, value, uniformType);

/// See [RaylibCoreD.SetShaderValueV].
void SetShaderValueV(
  ShaderD shader,
  num locIndex,
  List<num> value,
  ShaderUniformDataType uniformType,
  num count,
) => _module.SetShaderValueV(shader, locIndex, value, uniformType, count);

/// See [RaylibCoreD.SetShaderValueMatrix].
void SetShaderValueMatrix(
  ShaderD shader,
  num locIndex,
  MatrixD mat,
) => _module.SetShaderValueMatrix(shader, locIndex, mat);

/// See [RaylibCoreD.SetShaderValueTexture].
void SetShaderValueTexture(
  ShaderD shader,
  num locIndex,
  TextureD texture,
) => _module.SetShaderValueTexture(shader, locIndex, texture);

/// See [RaylibCoreD.UnloadShader].
void UnloadShader(
  ShaderD shader,
) => _module.UnloadShader(shader);

/// See [RaylibCoreD.GetScreenToWorldRay].
RayD GetScreenToWorldRay(
  Vector2D position,
  Camera3DD camera,
) => _module.GetScreenToWorldRay(position, camera);

/// See [RaylibCoreD.GetScreenToWorldRayEx].
RayD GetScreenToWorldRayEx(
  Vector2D position,
  Camera3DD camera,
  num width,
  num height,
) => _module.GetScreenToWorldRayEx(position, camera, width, height);

/// See [RaylibCoreD.GetWorldToScreen].
Vector2D GetWorldToScreen(
  Vector3D position,
  Camera3DD camera,
) => _module.GetWorldToScreen(position, camera);

/// See [RaylibCoreD.GetWorldToScreenEx].
Vector2D GetWorldToScreenEx(
  Vector3D position,
  Camera3DD camera,
  num width,
  num height,
) => _module.GetWorldToScreenEx(position, camera, width, height);

/// See [RaylibCoreD.GetWorldToScreen2D].
Vector2D GetWorldToScreen2D(
  Vector2D position,
  Camera2DD camera,
) => _module.GetWorldToScreen2D(position, camera);

/// See [RaylibCoreD.GetScreenToWorld2D].
Vector2D GetScreenToWorld2D(
  Vector2D position,
  Camera2DD camera,
) => _module.GetScreenToWorld2D(position, camera);

/// See [RaylibCoreD.GetCameraMatrix].
MatrixD GetCameraMatrix(
  Camera3DD camera,
) => _module.GetCameraMatrix(camera);

/// See [RaylibCoreD.GetCameraMatrix2D].
MatrixD GetCameraMatrix2D(
  Camera2DD camera,
) => _module.GetCameraMatrix2D(camera);

/// See [RaylibCoreD.SetTargetFPS].
void SetTargetFPS(
  num fps,
) => _module.SetTargetFPS(fps);

/// See [RaylibCoreD.GetFrameTime].
double GetFrameTime() => _module.GetFrameTime();

/// See [RaylibCoreD.GetTime].
double GetTime() => _module.GetTime();

/// See [RaylibCoreD.GetFPS].
int GetFPS() => _module.GetFPS();

/// See [RaylibCoreD.SwapScreenBuffer].
void SwapScreenBuffer() => _module.SwapScreenBuffer();

/// See [RaylibCoreD.PollInputEvents].
void PollInputEvents() => _module.PollInputEvents();

/// See [RaylibCoreD.WaitTime].
void WaitTime(
  num seconds,
) => _module.WaitTime(seconds);

/// See [RaylibCoreD.SetRandomSeed].
void SetRandomSeed(
  num seed,
) => _module.SetRandomSeed(seed);

/// See [RaylibCoreD.GetRandomValue].
int GetRandomValue(
  num min,
  num max,
) => _module.GetRandomValue(min, max);

/// See [RaylibCoreD.LoadRandomSequence].
List<int> LoadRandomSequence(
  num count,
  num min,
  num max,
) => _module.LoadRandomSequence(count, min, max);

/// See [RaylibCoreD.TakeScreenshot].
void TakeScreenshot(
  String fileName,
) => _module.TakeScreenshot(fileName);

/// See [RaylibCoreD.SetConfigFlags].
void SetConfigFlags(
  Iterable<ConfigFlags> flags,
) => _module.SetConfigFlags(flags);

/// See [RaylibCoreD.OpenURL].
void OpenURL(
  String url,
) => _module.OpenURL(url);

/// See [RaylibCoreD.TraceLog].
void TraceLog(
  TraceLogLevel logLevel,
  String text,
) => _module.TraceLog(logLevel, text);

/// See [RaylibCoreD.SetTraceLogLevel].
void SetTraceLogLevel(
  TraceLogLevel logLevel,
) => _module.SetTraceLogLevel(logLevel);

/// See [RaylibCoreD.SetTraceLogCallback].
void SetTraceLogCallback(
  TraceLogCallbackD callback,
) => _module.SetTraceLogCallback(callback);

/// See [RaylibCoreD.SetLoadFileDataCallback].
void SetLoadFileDataCallback(
  LoadFileDataCallbackD? callback
) => _module.SetLoadFileDataCallback(callback);

/// See [RaylibCoreD.SetSaveFileDataCallback].
void SetSaveFileDataCallback(
  SaveFileDataCallbackD? callback
) => _module.SetSaveFileDataCallback(callback);

/// See [RaylibCoreD.SetLoadFileTextCallback].
void SetLoadFileTextCallback(
  LoadFileTextCallbackD? callback
) => _module.SetLoadFileTextCallback(callback);

/// See [RaylibCoreD.SetSaveFileTextCallback].
void SetSaveFileTextCallback(
  SaveFileTextCallbackD? callback
) => _module.SetSaveFileTextCallback(callback);

/// See [RaylibCoreD.LoadFileData].
Uint8List LoadFileData(
  String fileName,
) => _module.LoadFileData(fileName);

/// See [RaylibCoreD.SaveFileData].
bool SaveFileData(
  String fileName,
  Uint8List data,
) => _module.SaveFileData(fileName, data);

/// See [RaylibCoreD.ExportDataAsCode].
bool ExportDataAsCode(
  Uint8List data,
  String fileName,
) => _module.ExportDataAsCode(data, fileName);

/// See [RaylibCoreD.LoadFileText].
String LoadFileText(
  String fileName,
) => _module.LoadFileText(fileName);

/// See [RaylibCoreD.SaveFileText].
bool SaveFileText(
  String fileName,
  String text,
) => _module.SaveFileText(fileName, text);

/// See [RaylibCoreD.FileRename].
int FileRename(
  String fileName,
  String fileRename,
) => _module.FileRename(fileName, fileRename);

/// See [RaylibCoreD.FileRemove].
int FileRemove(
  String fileName,
) => _module.FileRemove(fileName);

/// See [RaylibCoreD.FileCopy].
int FileCopy(
  String srcPath,
  String dstPath,
) => _module.FileCopy(srcPath, dstPath);

/// See [RaylibCoreD.FileMove].
int FileMove(
  String srcPath,
  String dstPath,
) => _module.FileMove(srcPath, dstPath);

/// See [RaylibCoreD.FileTextReplace].
int FileTextReplace(
  String fileName,
  String search,
  String replacement,
) => _module.FileTextReplace(fileName, search, replacement);

/// See [RaylibCoreD.FileTextFindIndex].
int FileTextFindIndex(
  String fileName,
  String search,
) => _module.FileTextFindIndex(fileName, search);

/// See [RaylibCoreD.FileExists].
bool FileExists(
  String fileName,
) => _module.FileExists(fileName);

/// See [RaylibCoreD.DirectoryExists].
bool DirectoryExists(
  String dirPath,
) => _module.DirectoryExists(dirPath);

/// See [RaylibCoreD.IsFileExtension].
bool IsFileExtension(
  String fileName,
  String ext,
) => _module.IsFileExtension(fileName, ext);

/// See [RaylibCoreD.GetFileLength].
int GetFileLength(
  String fileName,
) => _module.GetFileLength(fileName);

/// See [RaylibCoreD.GetFileExtension].
String GetFileExtension(
  String fileName,
) => _module.GetFileExtension(fileName);

/// See [RaylibCoreD.GetFileName].
String GetFileName(
  String filePath,
) => _module.GetFileName(filePath);

/// See [RaylibCoreD.GetFileNameWithoutExt].
String GetFileNameWithoutExt(
  String filePath,
) => _module.GetFileNameWithoutExt(filePath);

/// See [RaylibCoreD.GetDirectoryFileCount].
int GetDirectoryFileCount(
  String dirPath, 
) => _module.GetDirectoryFileCount(dirPath);

/// See [RaylibCoreD.GetDirectoryFileCountEx].
int GetDirectoryFileCountEx(
  String basePath,
  String filter,
  bool scanSubdirs,
) => _module.GetDirectoryFileCountEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreD.GetDirectoryPath].
String GetDirectoryPath(
  String filePath,
) => _module.GetDirectoryPath(filePath);

/// See [RaylibCoreD.GetPrevDirectoryPath].
String GetPrevDirectoryPath(
  String dirPath,
) => _module.GetPrevDirectoryPath(dirPath);

/// See [RaylibCoreD.GetWorkingDirectory].
String GetWorkingDirectory() => _module.GetWorkingDirectory();

/// See [RaylibCoreD.GetApplicationDirectory].
String GetApplicationDirectory() => _module.GetApplicationDirectory();

/// See [RaylibCoreD.MakeDirectory].
int MakeDirectory(
  String dirPath,
) => _module.MakeDirectory(dirPath);

/// See [RaylibCoreD.ChangeDirectory].
bool ChangeDirectory(
  String dir,
) => _module.ChangeDirectory(dir);

/// See [RaylibCoreD.IsPathFile].
bool IsPathFile(
  String path,
) => _module.IsPathFile(path);

/// See [RaylibCoreD.IsFileNameValid].
bool IsFileNameValid(
  String fileName,
) => _module.IsFileNameValid(fileName);

/// See [RaylibCoreD.LoadDirectoryFiles].
FilePathListD LoadDirectoryFiles(
  String dirPath,
) => _module.LoadDirectoryFiles(dirPath);

/// See [RaylibCoreD.LoadDirectoryFilesEx].
FilePathListD LoadDirectoryFilesEx(
  String basePath,
  String filter,
  bool scanSubdirs,
) => _module.LoadDirectoryFilesEx(basePath, filter, scanSubdirs);

/// See [RaylibCoreD.UnloadDirectoryFiles].
void UnloadDirectoryFiles(
  FilePathListD files,
) => _module.UnloadDirectoryFiles(files);

/// See [RaylibCoreD.IsFileDropped].
bool IsFileDropped() => _module.IsFileDropped();

/// See [RaylibCoreD.LoadDroppedFiles].
FilePathListD LoadDroppedFiles() => _module.LoadDroppedFiles();

/// See [RaylibCoreD.UnloadDroppedFiles].
void UnloadDroppedFiles(
  FilePathListD files,
) => _module.UnloadDroppedFiles(files);

/// See [RaylibCoreD.GetFileModTime].
int GetFileModTime(
  String fileName,
) => _module.GetFileModTime(fileName);

/// See [RaylibCoreD.CompressData].
Uint8List CompressData(
  Uint8List data,
) => _module.CompressData(data);

/// See [RaylibCoreD.DecompressData].
Uint8List DecompressData(
  Uint8List compData,
) => _module.DecompressData(compData);

/// See [RaylibCoreD.EncodeDataBase64].
Uint8List EncodeDataBase64(
  Uint8List data,
) => _module.EncodeDataBase64(data);

/// See [RaylibCoreD.DecodeDataBase64].
Uint8List DecodeDataBase64(
  Uint8List data,
) => _module.DecodeDataBase64(data);

/// See [RaylibCoreD.ComputeCRC32].
int ComputeCRC32(
  Uint8List data,
) => _module.ComputeCRC32(data);

/// See [RaylibCoreD.ComputeMD5].
Uint8List ComputeMD5(
  Uint8List data,
) => _module.ComputeMD5(data);

/// See [RaylibCoreD.ComputeSHA1].
Uint8List ComputeSHA1(
  Uint8List data,
) => _module.ComputeSHA1(data);

/// See [RaylibCoreD.ComputeSHA256].
Uint8List ComputeSHA256(
  Uint8List data,
) => _module.ComputeSHA256(data);

/// See [RaylibCoreD.LoadAutomationEventList].
AutomationEventListD LoadAutomationEventList(
  String? fileName,
) => _module.LoadAutomationEventList(fileName);

/// See [RaylibCoreD.UnloadAutomationEventList].
void UnloadAutomationEventList(
  AutomationEventListD list,
) => _module.UnloadAutomationEventList(list);

/// See [RaylibCoreD.ExportAutomationEventList].
bool ExportAutomationEventList(
  AutomationEventListD list,
  String fileName,
) => _module.ExportAutomationEventList(list, fileName);

/// See [RaylibCoreD.SetAutomationEventList].
void SetAutomationEventList(
  AutomationEventListD list,
) => _module.SetAutomationEventList(list);

/// See [RaylibCoreD.SetAutomationEventBaseFrame].
void SetAutomationEventBaseFrame(
  int frame,
) => _module.SetAutomationEventBaseFrame(frame);

/// See [RaylibCoreD.StartAutomationEventRecording].
void StartAutomationEventRecording() => _module.StartAutomationEventRecording();

/// See [RaylibCoreD.StopAutomationEventRecording].
void StopAutomationEventRecording() => _module.StopAutomationEventRecording();

/// See [RaylibCoreD.PlayAutomationEvent].
void PlayAutomationEvent(
  AutomationEventD event,
) => _module.PlayAutomationEvent(event);

/// See [RaylibCoreD.IsKeyPressed].
bool IsKeyPressed(
  KeyboardKey key,
) => _module.IsKeyPressed(key);

/// See [RaylibCoreD.IsKeyPressedRepeat].
bool IsKeyPressedRepeat(
  KeyboardKey key,
) => _module.IsKeyPressedRepeat(key);

/// See [RaylibCoreD.IsKeyDown].
bool IsKeyDown(
  KeyboardKey key,
) => _module.IsKeyDown(key);

/// See [RaylibCoreD.IsKeyReleased].
bool IsKeyReleased(
  KeyboardKey key,
) => _module.IsKeyReleased(key);

/// See [RaylibCoreD.IsKeyUp].
bool IsKeyUp(
  KeyboardKey key,
) => _module.IsKeyUp(key);

/// See [RaylibCoreD.GetKeyName].
String GetKeyName(
  KeyboardKey key,
) => _module.GetKeyName(key);

/// See [RaylibCoreD.GetKeyPressed].
int GetKeyPressed() => _module.GetKeyPressed();

/// See [RaylibCoreD.GetCharPressed].
int GetCharPressed() => _module.GetCharPressed();

/// See [RaylibCoreD.SetExitKey].
void SetExitKey(
  KeyboardKey key,
) => _module.SetExitKey(key);

/// See [RaylibCoreD.IsGamepadAvailable].
bool IsGamepadAvailable(
  num gamepad,
) => _module.IsGamepadAvailable(gamepad);

/// See [RaylibCoreD.GetGamepadName].
String GetGamepadName(
  num gamepad,
) => _module.GetGamepadName(gamepad);

/// See [RaylibCoreD.IsGamepadButtonPressed].
bool IsGamepadButtonPressed(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonPressed(gamepad, button);

/// See [RaylibCoreD.IsGamepadButtonDown].
bool IsGamepadButtonDown(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonDown(gamepad, button);

/// See [RaylibCoreD.IsGamepadButtonReleased].
bool IsGamepadButtonReleased(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonReleased(gamepad, button);

/// See [RaylibCoreD.IsGamepadButtonUp].
bool IsGamepadButtonUp(
  num gamepad,
  GamepadButton button,
) => _module.IsGamepadButtonUp(gamepad, button);

/// See [RaylibCoreD.GetGamepadButtonPressed].
GamepadButton GetGamepadButtonPressed() => _module.GetGamepadButtonPressed();

/// See [RaylibCoreD.GetGamepadAxisCount].
int GetGamepadAxisCount(
  num gamepad,
) => _module.GetGamepadAxisCount(gamepad);

/// See [RaylibCoreD.GetGamepadAxisMovement].
double GetGamepadAxisMovement(
  num gamepad,
  GamepadAxis axis,
) => _module.GetGamepadAxisMovement(gamepad, axis);

/// See [RaylibCoreD.SetGamepadMappings].
int SetGamepadMappings(
  String mappings,
) => _module.SetGamepadMappings(mappings);

/// See [RaylibCoreD.SetGamepadVibration].
void SetGamepadVibration(
  num gamepad,
  num leftMotor,
  num rightMotor,
  num duration,
) => _module.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration);

/// See [RaylibCoreD.IsMouseButtonPressed].
bool IsMouseButtonPressed(
  MouseButton button,
) => _module.IsMouseButtonPressed(button);

/// See [RaylibCoreD.IsMouseButtonDown].
bool IsMouseButtonDown(
  MouseButton button,
) => _module.IsMouseButtonDown(button);

/// See [RaylibCoreD.IsMouseButtonReleased].
bool IsMouseButtonReleased(
  MouseButton button,
) => _module.IsMouseButtonReleased(button);

/// See [RaylibCoreD.IsMouseButtonUp].
bool IsMouseButtonUp(
  MouseButton button,
) => _module.IsMouseButtonUp(button);

/// See [RaylibCoreD.GetMouseX].
int GetMouseX() => _module.GetMouseX();

/// See [RaylibCoreD.GetMouseY].
int GetMouseY() => _module.GetMouseY();

/// See [RaylibCoreD.GetMousePosition].
Vector2D GetMousePosition() => _module.GetMousePosition();

/// See [RaylibCoreD.GetMouseDelta].
Vector2D GetMouseDelta() => _module.GetMouseDelta();

/// See [RaylibCoreD.SetMousePosition].
void SetMousePosition(
  num x,
  num y,
) => _module.SetMousePosition(x, y);

/// See [RaylibCoreD.SetMouseOffset].
void SetMouseOffset(
  num offsetX,
  num offsetY,
) => _module.SetMouseOffset(offsetX, offsetY);

/// See [RaylibCoreD.SetMouseScale].
void SetMouseScale(
  num scaleX,
  num scaleY,
) => _module.SetMouseScale(scaleX, scaleY);

/// See [RaylibCoreD.GetMouseWheelMove].
double GetMouseWheelMove() => _module.GetMouseWheelMove();

/// See [RaylibCoreD.GetMouseWheelMoveV].
Vector2D GetMouseWheelMoveV() => _module.GetMouseWheelMoveV();

/// See [RaylibCoreD.SetMouseCursor].
void SetMouseCursor(
  MouseCursor cursor,
) => _module.SetMouseCursor(cursor);

/// See [RaylibCoreD.GetTouchX].
int GetTouchX() => _module.GetTouchX();

/// See [RaylibCoreD.GetTouchY].
int GetTouchY() => _module.GetTouchY();

/// See [RaylibCoreD.GetTouchPosition].
Vector2D GetTouchPosition(
  num index,
) => _module.GetTouchPosition(index);

/// See [RaylibCoreD.GetTouchPointId].
int GetTouchPointId(
  num index,
) => _module.GetTouchPointId(index);

/// See [RaylibCoreD.GetTouchPointCount].
int GetTouchPointCount() => _module.GetTouchPointCount();

/// See [RaylibCoreD.SetGesturesEnabled].
void SetGesturesEnabled(
  Iterable<Gesture> flags,
) => _module.SetGesturesEnabled(flags);

/// See [RaylibCoreD.IsGestureDetected].
bool IsGestureDetected(
  Gesture key,
) => _module.IsGestureDetected(key);

/// See [RaylibCoreD.GetGestureDetected].
Gesture GetGestureDetected() => _module.GetGestureDetected();

/// See [RaylibCoreD.GetGestureHoldDuration].
double GetGestureHoldDuration() => _module.GetGestureHoldDuration();

/// See [RaylibCoreD.GetGestureDragVector].
Vector2D GetGestureDragVector() => _module.GetGestureDragVector();

/// See [RaylibCoreD.GetGestureDragAngle].
double GetGestureDragAngle() => _module.GetGestureDragAngle();

/// See [RaylibCoreD.GetGesturePinchVector].
Vector2D GetGesturePinchVector() => _module.GetGesturePinchVector();

/// See [RaylibCoreD.GetGesturePinchAngle].
double GetGesturePinchAngle() => _module.GetGesturePinchAngle();

/// See [RaylibCoreD.ProcessGestureEvent].
void ProcessGestureEvent(
  GestureEventD event,
) => _module.ProcessGestureEvent(event);

/// See [RaylibCoreD.UpdateGestures].
void UpdateGestures() => _module.UpdateGestures();

/// See [RaylibCoreD.UpdateCamera].
void UpdateCamera(
  Camera3DD camera,
  CameraMode mode,
) => _module.UpdateCamera(camera, mode);

/// See [RaylibCoreD.UpdateCameraPro].
void UpdateCameraPro(
  Camera3DD camera,
  Vector3D movement,
  Vector3D rotation,
  num zoom,
) => _module.UpdateCameraPro(camera, movement, rotation, zoom);

/// See [RaylibCoreD.SetShapesTexture].
void SetShapesTexture(
  TextureD texture,
  RectangleD source,
) => _module.SetShapesTexture(texture, source);

/// See [RaylibCoreD.GetShapesTexture].
TextureD GetShapesTexture() => _module.GetShapesTexture();

/// See [RaylibCoreD.GetShapesTextureRectangle].
RectangleD GetShapesTextureRectangle() => _module.GetShapesTextureRectangle();

/// See [RaylibCoreD.DrawPixel].
void DrawPixel(
  num posX,
  num posY,
  ColorD color,
) => _module.DrawPixel(posX, posY, color);

/// See [RaylibCoreD.DrawPixelV].
void DrawPixelV(
  Vector2D position,
  ColorD color,
) => _module.DrawPixelV(position, color);

/// See [RaylibCoreD.DrawLine].
void DrawLine(
  num startPosX,
  num startPosY,
  num endPosX,
  num endPosY,
  ColorD color,
) => _module.DrawLine(startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreD.DrawLineV].
void DrawLineV(
  Vector2D startPos,
  Vector2D endPos,
  ColorD color,
) => _module.DrawLineV(startPos, endPos, color);

/// See [RaylibCoreD.DrawLineEx].
void DrawLineEx(
  Vector2D startPos,
  Vector2D endPos,
  num thick,
  ColorD color,
) => _module.DrawLineEx(startPos, endPos, thick, color);

/// See [RaylibCoreD.DrawLineStrip].
void DrawLineStrip(
  List<Vector2D> points,
  ColorD color,
) => _module.DrawLineStrip(points, color);

/// See [RaylibCoreD.DrawLineBezier].
void DrawLineBezier(
  Vector2D startPos,
  Vector2D endPos,
  num thick,
  ColorD color,
) => _module.DrawLineBezier(startPos, endPos, thick, color);

/// See [RaylibCoreD.DrawLineDashed].
void DrawLineDashed(
  Vector2D startPos,
  Vector2D endPos,
  num dashSize,
  num spaceSize,
  ColorD color,
) => _module.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color);

/// See [RaylibCoreD.DrawCircle].
void DrawCircle(
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.DrawCircle(centerX, centerY, radius, color);

/// See [RaylibCoreD.DrawCircleSector].
void DrawCircleSector(
  Vector2D center,
  num radius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawCircleSector(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreD.DrawCircleSectorLines].
void DrawCircleSectorLines(
  Vector2D center,
  num radius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color);

/// See [RaylibCoreD.DrawCircleGradient].
void DrawCircleGradient(
  Vector2D center,
  num radius,
  ColorD inner,
  ColorD outer,
) => _module.DrawCircleGradient(center, radius, inner, outer);

/// See [RaylibCoreD.DrawCircleV].
void DrawCircleV(
  Vector2D center,
  num radius,
  ColorD color,
) => _module.DrawCircleV(center, radius, color);

/// See [RaylibCoreD.DrawCircleLines].
void DrawCircleLines(
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.DrawCircleLines(centerX, centerY, radius, color);

/// See [RaylibCoreD.DrawCircleLinesV].
void DrawCircleLinesV(
  Vector2D center,
  num radius,
  ColorD color,
) => _module.DrawCircleLinesV(center, radius, color);

/// See [RaylibCoreD.DrawEllipse].
void DrawEllipse(
  num centerX,
  num centerY,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipse(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreD.DrawEllipseV].
void DrawEllipseV(
  Vector2D center,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipseV(center, radiusH, radiusV, color);

/// See [RaylibCoreD.DrawEllipseLines].
void DrawEllipseLines(
  num centerX,
  num centerY,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color);

/// See [RaylibCoreD.DrawEllipseLinesV].
void DrawEllipseLinesV(
  Vector2D center,
  num radiusH,
  num radiusV,
  ColorD color,
) => _module.DrawEllipseLinesV(center, radiusH, radiusV, color);

/// See [RaylibCoreD.DrawRing].
void DrawRing(
  Vector2D center,
  num innerRadius,
  num outerRadius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreD.DrawRingLines].
void DrawRingLines(
  Vector2D center,
  num innerRadius,
  num outerRadius,
  num startAngle,
  num endAngle,
  num segments,
  ColorD color,
) => _module.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color);

/// See [RaylibCoreD.DrawRectangle].
void DrawRectangle(
  num posX,
  num posY,
  num width,
  num height,
  ColorD color,
) => _module.DrawRectangle(posX, posY, width, height, color);

/// See [RaylibCoreD.DrawRectangleV].
void DrawRectangleV(
  Vector2D position,
  Vector2D size,
  ColorD color,
) => _module.DrawRectangleV(position, size, color);

/// See [RaylibCoreD.DrawRectangleRec].
void DrawRectangleRec(
  RectangleD rec,
  ColorD color,
) => _module.DrawRectangleRec(rec, color);

/// See [RaylibCoreD.DrawRectanglePro].
void DrawRectanglePro(
  RectangleD rec,
  Vector2D origin,
  num rotation,
  ColorD color,
) => _module.DrawRectanglePro(rec, origin, rotation, color);

/// See [RaylibCoreD.DrawRectangleGradientV].
void DrawRectangleGradientV(
  num posX,
  num posY,
  num width,
  num height,
  ColorD top,
  ColorD bottom,
) => _module.DrawRectangleGradientV(posX, posY, width, height, top, bottom);

/// See [RaylibCoreD.DrawRectangleGradientH].
void DrawRectangleGradientH(
  num posX,
  num posY,
  num width,
  num height,
  ColorD left,
  ColorD right,
) => _module.DrawRectangleGradientH(posX, posY, width, height, left, right);

/// See [RaylibCoreD.DrawRectangleGradientEx].
void DrawRectangleGradientEx(
  RectangleD rec,
  ColorD topLeft,
  ColorD bottomLeft,
  ColorD topRight,
  ColorD bottomRight,
) => _module.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight);

/// See [RaylibCoreD.DrawRectangleLines].
void DrawRectangleLines(
  num posX,
  num posY,
  num width,
  num height,
  ColorD color,
) => _module.DrawRectangleLines(posX, posY, width, height, color);

/// See [RaylibCoreD.DrawRectangleLinesEx].
void DrawRectangleLinesEx(
  RectangleD rec,
  num lineThick,
  ColorD color,
) => _module.DrawRectangleLinesEx(rec, lineThick, color);

/// See [RaylibCoreD.DrawRectangleRounded].
void DrawRectangleRounded(
  RectangleD rec,
  num roundness,
  num segments,
  ColorD color,
) => _module.DrawRectangleRounded(rec, roundness, segments, color);

/// See [RaylibCoreD.DrawRectangleRoundedLines].
void DrawRectangleRoundedLines(
  RectangleD rec,
  num roundness,
  num segments,
  ColorD color,
) => _module.DrawRectangleRoundedLines(rec, roundness, segments, color);

/// See [RaylibCoreD.DrawRectangleRoundedLinesEx].
void DrawRectangleRoundedLinesEx(
  RectangleD rec,
  num roundness,
  num segments,
  num lineThick,
  ColorD color,
) => _module.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color);

/// See [RaylibCoreD.DrawTriangle].
void DrawTriangle(
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.DrawTriangle(v1, v2, v3, color);

/// See [RaylibCoreD.DrawTriangleLines].
void DrawTriangleLines(
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.DrawTriangleLines(v1, v2, v3, color);

/// See [RaylibCoreD.DrawTriangleFan].
void DrawTriangleFan(
  List<Vector2D> points,
  ColorD color,
) => _module.DrawTriangleFan(points, color);

/// See [RaylibCoreD.DrawTriangleStrip].
void DrawTriangleStrip(
  List<Vector2D> points,
  ColorD color,
) => _module.DrawTriangleStrip(points, color);

/// See [RaylibCoreD.DrawPoly].
void DrawPoly(
  Vector2D center,
  num sides,
  num radius,
  num rotation,
  ColorD color,
) => _module.DrawPoly(center, sides, radius, rotation, color);

/// See [RaylibCoreD.DrawPolyLines].
void DrawPolyLines(
  Vector2D center,
  num sides,
  num radius,
  num rotation,
  ColorD color,
) => _module.DrawPolyLines(center, sides, radius, rotation, color);

/// See [RaylibCoreD.DrawPolyLinesEx].
void DrawPolyLinesEx(
  Vector2D center,
  num sides,
  num radius,
  num rotation,
  num lineThick,
  ColorD color,
) => _module.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color);

/// See [RaylibCoreD.DrawSplineLinear].
void DrawSplineLinear(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineLinear(points, thick, color);

/// See [RaylibCoreD.DrawSplineBasis].
void DrawSplineBasis(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineBasis(points, thick, color);

/// See [RaylibCoreD.DrawSplineCatmullRom].
void DrawSplineCatmullRom(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineCatmullRom(points, thick, color);

/// See [RaylibCoreD.DrawSplineBezierQuadratic].
void DrawSplineBezierQuadratic(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineBezierQuadratic(points, thick, color);

/// See [RaylibCoreD.DrawSplineBezierCubic].
void DrawSplineBezierCubic(
  List<Vector2D> points,
  num thick,
  ColorD color,
) => _module.DrawSplineBezierCubic(points, thick, color);

/// See [RaylibCoreD.DrawSplineSegmentLinear].
void DrawSplineSegmentLinear(
  Vector2D p1,
  Vector2D p2,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentLinear(p1, p2, thick, color);

/// See [RaylibCoreD.DrawSplineSegmentBasis].
void DrawSplineSegmentBasis(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreD.DrawSplineSegmentCatmullRom].
void DrawSplineSegmentCatmullRom(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color);

/// See [RaylibCoreD.DrawSplineSegmentBezierQuadratic].
void DrawSplineSegmentBezierQuadratic(
  Vector2D p1,
  Vector2D c2,
  Vector2D p3,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color);

/// See [RaylibCoreD.DrawSplineSegmentBezierCubic].
void DrawSplineSegmentBezierCubic(
  Vector2D p1,
  Vector2D c2,
  Vector2D c3,
  Vector2D p4,
  num thick,
  ColorD color,
) => _module.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color);

/// See [RaylibCoreD.GetSplinePointLinear].
Vector2D GetSplinePointLinear(
  Vector2D startPos,
  Vector2D endPos,
  num t,
) => _module.GetSplinePointLinear(startPos, endPos, t);

/// See [RaylibCoreD.GetSplinePointBasis].
Vector2D GetSplinePointBasis(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num t,
) => _module.GetSplinePointBasis(p1, p2, p3, p4, t);

/// See [RaylibCoreD.GetSplinePointCatmullRom].
Vector2D GetSplinePointCatmullRom(
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
  Vector2D p4,
  num t,
) => _module.GetSplinePointCatmullRom(p1, p2, p3, p4, t);

/// See [RaylibCoreD.GetSplinePointBezierQuad].
Vector2D GetSplinePointBezierQuad(
  Vector2D p1,
  Vector2D c2,
  Vector2D p3,
  num t,
) => _module.GetSplinePointBezierQuad(p1, c2, p3, t);

/// See [RaylibCoreD.GetSplinePointBezierCubic].
Vector2D GetSplinePointBezierCubic(
  Vector2D p1,
  Vector2D c2,
  Vector2D c3,
  Vector2D p4,
  num t,
) => _module.GetSplinePointBezierCubic(p1, c2, c3, p4, t);

/// See [RaylibCoreD.CheckCollisionRecs].
bool CheckCollisionRecs(
  RectangleD rec1,
  RectangleD rec2,
) => _module.CheckCollisionRecs(rec1, rec2);

/// See [RaylibCoreD.CheckCollisionCircles].
bool CheckCollisionCircles(
  Vector2D center1,
  num radius1,
  Vector2D center2,
  num radius2,
) => _module.CheckCollisionCircles(center1, radius1, center2, radius2);

/// See [RaylibCoreD.CheckCollisionCircleRec].
bool CheckCollisionCircleRec(
  Vector2D center,
  num radius,
  RectangleD rec,
) => _module.CheckCollisionCircleRec(center, radius, rec);

/// See [RaylibCoreD.CheckCollisionCircleLine].
bool CheckCollisionCircleLine(
  Vector2D center,
  num radius,
  Vector2D p1,
  Vector2D p2,
) => _module.CheckCollisionCircleLine(center, radius, p1, p2);

/// See [RaylibCoreD.CheckCollisionPointRec].
bool CheckCollisionPointRec(
  Vector2D point,
  RectangleD rec,
) => _module.CheckCollisionPointRec(point, rec);

/// See [RaylibCoreD.CheckCollisionPointCircle].
bool CheckCollisionPointCircle(
  Vector2D point,
  Vector2D center,
  num radius,
) => _module.CheckCollisionPointCircle(point, center, radius);

/// See [RaylibCoreD.CheckCollisionPointTriangle].
bool CheckCollisionPointTriangle(
  Vector2D point,
  Vector2D p1,
  Vector2D p2,
  Vector2D p3,
) => _module.CheckCollisionPointTriangle(point, p1, p2, p3);

/// See [RaylibCoreD.CheckCollisionPointLine].
bool CheckCollisionPointLine(
  Vector2D point,
  Vector2D p1,
  Vector2D p2,
  num threshold,
) => _module.CheckCollisionPointLine(point, p1, p2, threshold);

/// See [RaylibCoreD.CheckCollisionPointPoly].
bool CheckCollisionPointPoly(
  Vector2D point,
  List<Vector2D> points,
) => _module.CheckCollisionPointPoly(point, points);

/// See [RaylibCoreD.CheckCollisionLines].
(bool result, Vector2D collisionPoint) CheckCollisionLines(
  Vector2D startPos1,
  Vector2D endPos1,
  Vector2D startPos2,
  Vector2D endPos2,
) => _module.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2);

/// See [RaylibCoreD.GetCollisionRec].
RectangleD GetCollisionRec(
  RectangleD rec1,
  RectangleD rec2,
) => _module.GetCollisionRec(rec1, rec2);

/// See [RaylibCoreD.LoadImage].
ImageD LoadImage(
  String fileName,
) => _module.LoadImage(fileName);

/// See [RaylibCoreD.LoadImageRaw].
ImageD LoadImageRaw(
  String fileName,
  num width,
  num height,
  PixelFormat format,
  num headerSize,
) => _module.LoadImageRaw(fileName, width, height, format, headerSize);

/// See [RaylibCoreD.LoadImageAnim].
ImageD LoadImageAnim(
  String fileName,
) => _module.LoadImageAnim(fileName);

/// See [RaylibCoreD.LoadImageAnimFromMemory].
ImageD LoadImageAnimFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadImageAnimFromMemory(fileType, fileData);

/// See [RaylibCoreD.LoadImageFromMemory].
ImageD LoadImageFromMemory(
  String fileType,
  Uint8List fileData,
) => _module.LoadImageFromMemory(fileType, fileData);

/// See [RaylibCoreD.LoadImageFromTexture].
ImageD LoadImageFromTexture(
  TextureD texture,
) => _module.LoadImageFromTexture(texture);

/// See [RaylibCoreD.LoadImageFromScreen].
ImageD LoadImageFromScreen() => _module.LoadImageFromScreen();

/// See [RaylibCoreD.IsImageValid].
bool IsImageValid(
  ImageD image,
) => _module.IsImageValid(image);

/// See [RaylibCoreD.UnloadImage].
void UnloadImage(
  ImageD image,
) => _module.UnloadImage(image);

/// See [RaylibCoreD.ExportImage].
bool ExportImage(
  ImageD image,
  String fileName,
) => _module.ExportImage(image, fileName);

/// See [RaylibCoreD.ExportImageToMemory].
(Pointer<UnsignedChar> dataPtr, int dataSize) ExportImageToMemory(
  ImageD image,
  String fileType,
) => _module.ExportImageToMemory(image, fileType);

/// See [RaylibCoreD.ExportImageAsCode].
bool ExportImageAsCode(
  ImageD image,
  String fileName,
) => _module.ExportImageAsCode(image, fileName);

/// See [RaylibCoreD.GenImageColor].
ImageD GenImageColor(
  num width,
  num height,
  ColorD color,
) => _module.GenImageColor(width, height, color);

/// See [RaylibCoreD.GenImageGradientLinear].
ImageD GenImageGradientLinear(
  num width,
  num height,
  num direction,
  ColorD start,
  ColorD end,
) => _module.GenImageGradientLinear(width, height, direction, start, end);

/// See [RaylibCoreD.GenImageGradientRadial].
ImageD GenImageGradientRadial(
  num width,
  num height,
  num density,
  ColorD inner,
  ColorD outer,
) => _module.GenImageGradientRadial(width, height, density, inner, outer);

/// See [RaylibCoreD.GenImageGradientSquare].
ImageD GenImageGradientSquare(
  num width,
  num height,
  num density,
  ColorD inner,
  ColorD outer,
) => _module.GenImageGradientSquare(width, height, density, inner, outer);

/// See [RaylibCoreD.GenImageChecked].
ImageD GenImageChecked(
  num width,
  num height,
  num checksX,
  num checksY,
  ColorD col1,
  ColorD col2,
) => _module.GenImageChecked(width, height, checksX, checksY, col1, col2);

/// See [RaylibCoreD.GenImageWhiteNoise].
ImageD GenImageWhiteNoise(
  num width,
  num height,
  num factor,
) => _module.GenImageWhiteNoise(width, height, factor);

/// See [RaylibCoreD.GenImagePerlinNoise].
ImageD GenImagePerlinNoise(
  num width,
  num height,
  num offsetX,
  num offsetY,
  num scale,
) => _module.GenImagePerlinNoise(width, height, offsetX, offsetY, scale);

/// See [RaylibCoreD.GenImageCellular].
ImageD GenImageCellular(
  num width,
  num height,
  num tileSize,
) => _module.GenImageCellular(width, height, tileSize);

/// See [RaylibCoreD.GenImageText].
ImageD GenImageText(
  num width,
  num height,
  String text,
) => _module.GenImageText(width, height, text);

/// See [RaylibCoreD.ImageCopy].
ImageD ImageCopy(
  ImageD image,
) => _module.ImageCopy(image);

/// See [RaylibCoreD.ImageFromImage].
ImageD ImageFromImage(
  ImageD image,
  RectangleD rec,
) => _module.ImageFromImage(image, rec);

/// See [RaylibCoreD.ImageFromChannel].
ImageD ImageFromChannel(
  ImageD image,
  num selectedChannel,
) => _module.ImageFromChannel(image, selectedChannel);

/// See [RaylibCoreD.ImageText].
ImageD ImageText(
  String text,
  num fontSize,
  ColorD color,
) => _module.ImageText(text, fontSize, color);

/// See [RaylibCoreD.ImageTextEx].
ImageD ImageTextEx(
  FontD font,
  String text,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.ImageTextEx(font, text, fontSize, spacing, tint);

/// See [RaylibCoreD.ImageFormat].
void ImageFormat(
  ImageD image,
  PixelFormat newFormat,
) => _module.ImageFormat(image, newFormat);

/// See [RaylibCoreD.ImageToPOT].
void ImageToPOT(
  ImageD image,
  ColorD fill,
) => _module.ImageToPOT(image, fill);

/// See [RaylibCoreD.ImageCrop].
void ImageCrop(
  ImageD image,
  RectangleD crop,
) => _module.ImageCrop(image, crop);

/// See [RaylibCoreD.ImageAlphaCrop].
void ImageAlphaCrop(
  ImageD image,
  num threshold,
) => _module.ImageAlphaCrop(image, threshold);

/// See [RaylibCoreD.ImageAlphaClear].
void ImageAlphaClear(
  ImageD image,
  ColorD color,
  num threshold,
) => _module.ImageAlphaClear(image, color, threshold);

/// See [RaylibCoreD.ImageAlphaMask].
void ImageAlphaMask(
  ImageD image,
  ImageD alphaMask,
) => _module.ImageAlphaMask(image, alphaMask);

/// See [RaylibCoreD.ImageAlphaPremultiply].
void ImageAlphaPremultiply(
  ImageD image,
) => _module.ImageAlphaPremultiply(image);

/// See [RaylibCoreD.ImageBlurGaussian].
void ImageBlurGaussian(
  ImageD image,
  num blurSize,
) => _module.ImageBlurGaussian(image, blurSize);

/// See [RaylibCoreD.ImageKernelConvolution].
void ImageKernelConvolution(
  ImageD image,
  List<double> kernel,
) => _module.ImageKernelConvolution(image, kernel);

/// See [RaylibCoreD.ImageResize].
void ImageResize(
  ImageD image,
  num newWidth,
  num newHeight,
) => _module.ImageResize(image, newWidth, newHeight);

/// See [RaylibCoreD.ImageResizeNN].
void ImageResizeNN(
  ImageD image,
  num newWidth,
  num newHeight,
) => _module.ImageResizeNN(image, newWidth, newHeight);

/// See [RaylibCoreD.ImageResizeCanvas].
void ImageResizeCanvas(
  ImageD image,
  num newWidth,
  num newHeight,
  num offsetX,
  num offsetY,
  ColorD fill,
) => _module.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill);

/// See [RaylibCoreD.ImageMipmaps].
void ImageMipmaps(
  ImageD image,
) => _module.ImageMipmaps(image);

/// See [RaylibCoreD.ImageDither].
void ImageDither(
  ImageD image,
  num rBpp,
  num gBpp,
  num bBpp,
  num aBpp,
) => _module.ImageDither(image, rBpp, gBpp, bBpp, aBpp);

/// See [RaylibCoreD.ImageFlipVertical].
void ImageFlipVertical(
  ImageD image,
) => _module.ImageFlipVertical(image);

/// See [RaylibCoreD.ImageFlipHorizontal].
void ImageFlipHorizontal(
  ImageD image,
) => _module.ImageFlipHorizontal(image);

/// See [RaylibCoreD.ImageRotate].
void ImageRotate(
  ImageD image,
  num degrees,
) => _module.ImageRotate(image, degrees);

/// See [RaylibCoreD.ImageRotateCW].
void ImageRotateCW(
  ImageD image,
) => _module.ImageRotateCW(image);

/// See [RaylibCoreD.ImageRotateCCW].
void ImageRotateCCW(
  ImageD image,
) => _module.ImageRotateCCW(image);

/// See [RaylibCoreD.ImageColorTint].
void ImageColorTint(
  ImageD image,
  ColorD color,
) => _module.ImageColorTint(image, color);

/// See [RaylibCoreD.ImageColorInvert].
void ImageColorInvert(
  ImageD image,
) => _module.ImageColorInvert(image);

/// See [RaylibCoreD.ImageColorGrayscale].
void ImageColorGrayscale(
  ImageD image,
) => _module.ImageColorGrayscale(image);

/// See [RaylibCoreD.ImageColorContrast].
void ImageColorContrast(
  ImageD image,
  num contrast,
) => _module.ImageColorContrast(image, contrast);

/// See [RaylibCoreD.ImageColorBrightness].
void ImageColorBrightness(
  ImageD image,
  num brightness,
) => _module.ImageColorBrightness(image, brightness);

/// See [RaylibCoreD.ImageColorReplace].
void ImageColorReplace(
  ImageD image,
  ColorD color,
  ColorD replace,
) => _module.ImageColorReplace(image, color, replace);

/// See [RaylibCoreD.LoadImageColors].
List<ColorD> LoadImageColors(
  ImageD image,
) => _module.LoadImageColors(image);

/// See [RaylibCoreD.LoadImagePalette].
List<ColorD> LoadImagePalette(
  ImageD image,
  num maxPaletteSize,
) => _module.LoadImagePalette(image, maxPaletteSize);

/// See [RaylibCoreD.GetImageAlphaBorder].
RectangleD GetImageAlphaBorder(
  ImageD image,
  num threshold,
) => _module.GetImageAlphaBorder(image, threshold);

/// See [RaylibCoreD.GetImageColor].
ColorD GetImageColor(
  ImageD image,
  num x,
  num y,
) => _module.GetImageColor(image, x, y);

/// See [RaylibCoreD.ImageClearBackground].
void ImageClearBackground(
  ImageD dst,
  ColorD color,
) => _module.ImageClearBackground(dst, color);

/// See [RaylibCoreD.ImageDrawPixel].
void ImageDrawPixel(
  ImageD dst,
  num posX,
  num posY,
  ColorD color,
) => _module.ImageDrawPixel(dst, posX, posY, color);

/// See [RaylibCoreD.ImageDrawPixelV].
void ImageDrawPixelV(
  ImageD dst,
  Vector2D position,
  ColorD color,
) => _module.ImageDrawPixelV(dst, position, color);

/// See [RaylibCoreD.ImageDrawLine].
void ImageDrawLine(
  ImageD dst,
  num startPosX,
  num startPosY,
  num endPosX,
  num endPosY,
  ColorD color,
) => _module.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color);

/// See [RaylibCoreD.ImageDrawLineV].
void ImageDrawLineV(
  ImageD dst,
  Vector2D start,
  Vector2D end,
  ColorD color,
) => _module.ImageDrawLineV(dst, start, end, color);

/// See [RaylibCoreD.ImageDrawLineEx].
void ImageDrawLineEx(
  ImageD dst,
  Vector2D start,
  Vector2D end,
  num thick,
  ColorD color,
) => _module.ImageDrawLineEx(dst, start, end, thick, color);

/// See [RaylibCoreD.ImageDrawCircle].
void ImageDrawCircle(
  ImageD dst,
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.ImageDrawCircle(dst, centerX, centerY, radius, color);

/// See [RaylibCoreD.ImageDrawCircleV].
void ImageDrawCircleV(
  ImageD dst,
  Vector2D center,
  num radius,
  ColorD color,
) => _module.ImageDrawCircleV(dst, center, radius, color);

/// See [RaylibCoreD.ImageDrawCircleLines].
void ImageDrawCircleLines(
  ImageD dst,
  num centerX,
  num centerY,
  num radius,
  ColorD color,
) => _module.ImageDrawCircleLines(dst, centerX, centerY, radius, color);

/// See [RaylibCoreD.ImageDrawCircleLinesV].
void ImageDrawCircleLinesV(
  ImageD dst,
  Vector2D center,
  num radius,
  ColorD color,
) => _module.ImageDrawCircleLinesV(dst, center, radius, color);

/// See [RaylibCoreD.ImageDrawRectangle].
void ImageDrawRectangle(
  ImageD dst,
  num posX,
  num posY,
  num width,
  num height,
  ColorD color,
) => _module.ImageDrawRectangle(dst, posX, posY, width, height, color);

/// See [RaylibCoreD.ImageDrawRectangleV].
void ImageDrawRectangleV(
  ImageD dst,
  Vector2D position,
  Vector2D size,
  ColorD color,
) => _module.ImageDrawRectangleV(dst, position, size, color);

/// See [RaylibCoreD.ImageDrawRectangleRec].
void ImageDrawRectangleRec(
  ImageD dst,
  RectangleD rec,
  ColorD color,
) => _module.ImageDrawRectangleRec(dst, rec, color);

/// See [RaylibCoreD.ImageDrawRectangleLines].
void ImageDrawRectangleLines(
  ImageD dst,
  RectangleD rec,
  num thick,
  ColorD color,
) => _module.ImageDrawRectangleLines(dst, rec, thick, color);

/// See [RaylibCoreD.ImageDrawTriangle].
void ImageDrawTriangle(
  ImageD dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.ImageDrawTriangle(dst, v1, v2, v3, color);

/// See [RaylibCoreD.ImageDrawTriangleEx].
void ImageDrawTriangleEx(
  ImageD dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD c1,
  ColorD c2,
  ColorD c3,
) => _module.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3);

/// See [RaylibCoreD.ImageDrawTriangleLines].
void ImageDrawTriangleLines(
  ImageD dst,
  Vector2D v1,
  Vector2D v2,
  Vector2D v3,
  ColorD color,
) => _module.ImageDrawTriangleLines(dst, v1, v2, v3, color);

/// See [RaylibCoreD.ImageDrawTriangleFan].
void ImageDrawTriangleFan(
  ImageD dst,
  List<Vector2D> points,
  ColorD color,
) => _module.ImageDrawTriangleFan(dst, points, color);

/// See [RaylibCoreD.ImageDrawTriangleStrip].
void ImageDrawTriangleStrip(
  ImageD dst,
  List<Vector2D> points,
  ColorD color,
) => _module.ImageDrawTriangleStrip(dst, points, color);

/// See [RaylibCoreD.ImageDraw].
void ImageDraw(
  ImageD dst,
  ImageD src,
  RectangleD srcRec,
  RectangleD dstRec,
  ColorD tint,
) => _module.ImageDraw(dst, src, srcRec, dstRec, tint);

/// See [RaylibCoreD.ImageDrawText].
void ImageDrawText(
  ImageD dst,
  String text,
  num posX,
  num posY,
  num fontSize,
  ColorD color,
) => _module.ImageDrawText(dst, text, posX, posY, fontSize, color);

/// See [RaylibCoreD.ImageDrawTextEx].
void ImageDrawTextEx(
  ImageD dst,
  FontD font,
  String text,
  Vector2D position,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreD.LoadTexture].
TextureD LoadTexture(
  String fileName,
) => _module.LoadTexture(fileName);

/// See [RaylibCoreD.LoadTextureFromImage].
TextureD LoadTextureFromImage(
  ImageD image,
) => _module.LoadTextureFromImage(image);

/// See [RaylibCoreD.LoadTextureCubemap].
TextureD LoadTextureCubemap(
  ImageD image,
  CubemapLayout layout,
) => _module.LoadTextureCubemap(image, layout);

/// See [RaylibCoreD.LoadRenderTexture].
RenderTextureD LoadRenderTexture(
  num width,
  num height,
) => _module.LoadRenderTexture(width, height);

/// See [RaylibCoreD.IsTextureValid].
bool IsTextureValid(
  TextureD texture,
) => _module.IsTextureValid(texture);

/// See [RaylibCoreD.UnloadTexture].
void UnloadTexture(
  TextureD texture,
) => _module.UnloadTexture(texture);

/// See [RaylibCoreD.IsRenderTextureValid].
bool IsRenderTextureValid(
  RenderTextureD target,
) => _module.IsRenderTextureValid(target);

/// See [RaylibCoreD.UnloadRenderTexture].
void UnloadRenderTexture(
  RenderTextureD target,
) => _module.UnloadRenderTexture(target);

/// See [RaylibCoreD.UpdateTexture].
void UpdateTexture(
  TextureD texture,
  Uint8List pixels,
) => _module.UpdateTexture(texture, pixels);

/// See [RaylibCoreD.UpdateTextureRec].
void UpdateTextureRec(
  TextureD texture,
  RectangleD rec,
  Uint8List pixels,
) => _module.UpdateTextureRec(texture, rec, pixels);

/// See [RaylibCoreD.GenTextureMipmaps].
void GenTextureMipmaps(
  TextureD texture,
) => _module.GenTextureMipmaps(texture);

/// See [RaylibCoreD.SetTextureFilter].
void SetTextureFilter(
  TextureD texture,
  TextureFilter filter,
) => _module.SetTextureFilter(texture, filter);

/// See [RaylibCoreD.SetTextureWrap].
void SetTextureWrap(
  TextureD texture,
  TextureWrap wrap,
) => _module.SetTextureWrap(texture, wrap);

/// See [RaylibCoreD.DrawTexture].
void DrawTexture(
  TextureD texture,
  num posX,
  num posY,
  ColorD tint,
) => _module.DrawTexture(texture, posX, posY, tint);

/// See [RaylibCoreD.DrawTextureV].
void DrawTextureV(
  TextureD texture,
  Vector2D position,
  ColorD tint,
) => _module.DrawTextureV(texture, position, tint);

/// See [RaylibCoreD.DrawTextureEx].
void DrawTextureEx(
  TextureD texture,
  Vector2D position,
  num rotation,
  num scale,
  ColorD tint,
) => _module.DrawTextureEx(texture, position, rotation, scale, tint);

/// See [RaylibCoreD.DrawTextureRec].
void DrawTextureRec(
  TextureD texture,
  RectangleD source,
  Vector2D position,
  ColorD tint,
) => _module.DrawTextureRec(texture, source, position, tint);

/// See [RaylibCoreD.DrawTexturePro].
void DrawTexturePro(
  TextureD texture,
  RectangleD source,
  RectangleD dest,
  Vector2D origin,
  num rotation,
  ColorD tint,
) => _module.DrawTexturePro(texture, source, dest, origin, rotation, tint);

/// See [RaylibCoreD.DrawTextureNPatch].
void DrawTextureNPatch(
  TextureD texture,
  NPatchInfoD nPatchInfo,
  RectangleD dest,
  Vector2D origin,
  num rotation,
  ColorD tint,
) => _module.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint);

/// See [RaylibCoreD.ColorIsEqual].
bool ColorIsEqual(
  ColorD col1,
  ColorD col2,
) => _module.ColorIsEqual(col1, col2);

/// See [RaylibCoreD.Fade].
ColorD Fade(
  ColorD color,
  num alpha,
) => _module.Fade(color, alpha);

/// See [RaylibCoreD.ColorToInt].
int ColorToInt(
  ColorD color,
) => _module.ColorToInt(color);

/// See [RaylibCoreD.ColorNormalize].
Vector4D ColorNormalize(
  ColorD color,
) => _module.ColorNormalize(color);

/// See [RaylibCoreD.ColorFromNormalized].
ColorD ColorFromNormalized(
  Vector4D normalized,
) => _module.ColorFromNormalized(normalized);

/// See [RaylibCoreD.ColorToHSV].
Vector3D ColorToHSV(
  ColorD color,
) => _module.ColorToHSV(color);

/// See [RaylibCoreD.ColorFromHSV].
ColorD ColorFromHSV(
  num hue,
  num saturation,
  num value,
) => _module.ColorFromHSV(hue, saturation, value);

/// See [RaylibCoreD.ColorTint].
ColorD ColorTint(
  ColorD color,
  ColorD tint,
) => _module.ColorTint(color, tint);

/// See [RaylibCoreD.ColorBrightness].
ColorD ColorBrightness(
  ColorD color,
  num factor,
) => _module.ColorBrightness(color, factor);

/// See [RaylibCoreD.ColorContrast].
ColorD ColorContrast(
  ColorD color,
  num contrast,
) => _module.ColorContrast(color, contrast);

/// See [RaylibCoreD.ColorAlpha].
ColorD ColorAlpha(
  ColorD color,
  num alpha,
) => _module.ColorAlpha(color, alpha);

/// See [RaylibCoreD.ColorAlphaBlend].
ColorD ColorAlphaBlend(
  ColorD dst,
  ColorD src,
  ColorD tint,
) => _module.ColorAlphaBlend(dst, src, tint);

/// See [RaylibCoreD.ColorLerp].
ColorD ColorLerp(
  ColorD color1,
  ColorD color2,
  num factor,
) => _module.ColorLerp(color1, color2, factor);

/// See [RaylibCoreD.GetColor].
ColorD GetColor(
  num hexValue,
) => _module.GetColor(hexValue);

/// See [RaylibCoreD.GetPixelDataSize].
int GetPixelDataSize(
  num width,
  num height,
  PixelFormat format,
) => _module.GetPixelDataSize(width, height, format);

/// See [RaylibCoreD.GetFontDefault].
FontD GetFontDefault() => _module.GetFontDefault();

/// See [RaylibCoreD.LoadFont].
FontD LoadFont(
  String fileName,
) => _module.LoadFont(fileName);

/// See [RaylibCoreD.LoadFontEx].
FontD LoadFontEx(
  String fileName,
  num fontSize, [
    Int32List? codepoints,
    num? codePointCount
  ]
) => _module.LoadFontEx(fileName, fontSize, codepoints, codePointCount);

/// See [RaylibCoreD.LoadFontFromImage].
FontD LoadFontFromImage(
  ImageD image,
  ColorD key,
  num firstChar,
) => _module.LoadFontFromImage(image, key, firstChar);

/// See [RaylibCoreD.LoadFontFromMemory].
FontD LoadFontFromMemory(
  String fileType,
  Uint8List fileData,
  num fontSize,
  Int32List codepoints,
) => _module.LoadFontFromMemory(fileType, fileData, fontSize, codepoints);

/// See [RaylibCoreD.IsFontValid].
bool IsFontValid(
  FontD font,
) => _module.IsFontValid(font);

/// See [RaylibCoreD.LoadFontData].
List<GlyphInfoD> LoadFontData(
  Uint8List fileData,
  num fontSize,
  Int32List? codepoints,
  num? codepointCount,
  FontType type,
) => _module.LoadFontData(fileData, fontSize, codepoints, codepointCount, type);

/// See [RaylibCoreD.GenImageFontAtlas].
(ImageD image, List<RectangleD> glyphRecs) GenImageFontAtlas(
  List<GlyphInfoD> glyphs,
  num fontSize,
  num padding,
  num packMethod,
) => _module.GenImageFontAtlas(glyphs, fontSize, padding, packMethod);

/// See [RaylibCoreD.UnloadFontData].
void UnloadFontData(
  List<GlyphInfoD> glyphs,
) => _module.UnloadFontData(glyphs);

/// See [RaylibCoreD.UnloadFont].
void UnloadFont(
  FontD font,
) => _module.UnloadFont(font);

/// See [RaylibCoreD.ExportFontAsCode].
bool ExportFontAsCode(
  FontD font,
  String fileName,
) => _module.ExportFontAsCode(font, fileName);

/// See [RaylibCoreD.DrawFPS].
void DrawFPS(
  num posX,
  num posY,
) => _module.DrawFPS(posX, posY);

/// See [RaylibCoreD.DrawText].
void DrawText(
  String text,
  num posX,
  num posY,
  num fontSize,
  ColorD color,
) => _module.DrawText(text, posX, posY, fontSize, color);

/// See [RaylibCoreD.DrawTextEx].
void DrawTextEx(
  FontD font,
  String text,
  Vector2D position,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.DrawTextEx(font, text, position, fontSize, spacing, tint);

/// See [RaylibCoreD.DrawTextPro].
void DrawTextPro(
  FontD font,
  String text,
  Vector2D position,
  Vector2D origin,
  num rotation,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint);

/// See [RaylibCoreD.DrawTextCodepoint].
void DrawTextCodepoint(
  FontD font,
  num codepoint,
  Vector2D position,
  num fontSize,
  ColorD tint,
) => _module.DrawTextCodepoint(font, codepoint, position, fontSize, tint);

/// See [RaylibCoreD.DrawTextCodepoints].
void DrawTextCodepoints(
  FontD font,
  Int32List codepoints,
  Vector2D position,
  num fontSize,
  num spacing,
  ColorD tint,
) => _module.DrawTextCodepoints(font, codepoints, position, fontSize, spacing, tint);

/// See [RaylibCoreD.SetTextLineSpacing].
void SetTextLineSpacing(
  num spacing,
) => _module.SetTextLineSpacing(spacing);

/// See [RaylibCoreD.MeasureText].
int MeasureText(
  String text,
  num fontSize,
) => _module.MeasureText(text, fontSize);

/// See [RaylibCoreD.MeasureTextEx].
Vector2D MeasureTextEx(
  FontD font,
  String text,
  num fontSize,
  num spacing,
) => _module.MeasureTextEx(font, text, fontSize, spacing);

/// See [RaylibCoreD.MeasureTextCodepoints].
Vector2D MeasureTextCodepoints(
  FontD font,
  Int32List codepoints,
  num fontSize,
  num spacing,
) => _module.MeasureTextCodepoints(font, codepoints, fontSize, spacing);

/// See [RaylibCoreD.GetGlyphIndex].
int GetGlyphIndex(
  FontD font,
  num codepoint,
) => _module.GetGlyphIndex(font, codepoint);

/// See [RaylibCoreD.GetGlyphInfo].
GlyphInfoD GetGlyphInfo(
  FontD font,
  num codepoint,
) => _module.GetGlyphInfo(font, codepoint);

/// See [RaylibCoreD.GetGlyphAtlasRec].
RectangleD GetGlyphAtlasRec(
  FontD font,
  num codepoint,
) => _module.GetGlyphAtlasRec(font, codepoint);

/// See [RaylibCoreD.LoadUTF8].
String LoadUTF8(
  Int32List codepoints,
) => _module.LoadUTF8(codepoints);

/// See [RaylibCoreD.LoadCodepoints].
Int32List LoadCodepoints(
  String text,
) => _module.LoadCodepoints(text);

/// See [RaylibCoreD.GetCodepointCount].
int GetCodepointCount(
  String text,
) => _module.GetCodepointCount(text);

/// See [RaylibCoreD.GetCodepoint].
(int codepoint, int codepointSize) GetCodepoint(
  String text,
) => _module.GetCodepoint(text);

/// See [RaylibCoreD.GetCodepointNext].
(int codepoint, int codepointSize) GetCodepointNext(
  String text,
) => _module.GetCodepointNext(text);

/// See [RaylibCoreD.GetCodepointPrevious].
(int codepoint, int codepointSize) GetCodepointPrevious(
  String text,
) => _module.GetCodepointPrevious(text);

/// See [RaylibCoreD.CodepointToUTF8].
(String text, int size) CodepointToUTF8(
  num codepoint,
) => _module.CodepointToUTF8(codepoint);

/// See [RaylibCoreD.LoadTextLines].
List<String> LoadTextLines(
  String text,
) => _module.LoadTextLines(text);

/// See [RaylibCoreD.TextIsEqual].
bool TextIsEqual(
  String text1,
  String text2,
) => _module.TextIsEqual(text1, text2);

/// See [RaylibCoreD.TextLength].
int TextLength(
  String text,
) => _module.TextLength(text);

/// See [RaylibCoreD.TextSubtext].
String TextSubtext(
  String text,
  int position,
  int length,
) => _module.TextSubtext(text, position, length);

/// See [RaylibCoreD.TextRemoveSpaces].
String TextRemoveSpaces(
  String text,
) => _module.TextRemoveSpaces(text);

/// See [RaylibCoreD.GetTextBetween].
String GetTextBetween(
  String text,
  String begin,
  String end,
) => _module.GetTextBetween(text, begin, end);

/// See [RaylibCoreD.TextReplace].
String TextReplace(
  String text,
  String search,
  String replacement,
) => _module.TextReplace(text, search, replacement);

/// See [RaylibCoreD.TextReplaceBetween].
String TextReplaceBetween(
  String text,
  String begin,
  String end,
  String replacement,
) => _module.TextReplaceBetween(text, begin, end, replacement);

/// See [RaylibCoreD.TextInsert].
String TextInsert(
  String text,
  String insert,
  int position,
) => _module.TextInsert(text, insert, position);

/// See [RaylibCoreD.TextJoin].
String TextJoin(
  List<String> textList,
  String delimiter,
) => _module.TextJoin(textList, delimiter);

/// See [RaylibCoreD.TextSplit].
List<String> TextSplit(
  String text,
  String delimiter,
) => _module.TextSplit(text, delimiter);

/// See [RaylibCoreD.TextAppend].
String TextAppend(
  String text,
  String append,
) => _module.TextAppend(text, append);

/// See [RaylibCoreD.TextFindIndex].
int TextFindIndex(
  String text,
  String search,
) => _module.TextFindIndex(text, search);

/// See [RaylibCoreD.TextToUpper].
String TextToUpper(
  String text,
) => _module.TextToUpper(text);

/// See [RaylibCoreD.TextToLower].
String TextToLower(
  String text,
) => _module.TextToLower(text);

/// See [RaylibCoreD.TextToPascal].
String TextToPascal(
  String text,
) => _module.TextToPascal(text);

/// See [RaylibCoreD.TextToSnake].
String TextToSnake(
  String text,
) => _module.TextToSnake(text);

/// See [RaylibCoreD.TextToCamel].
String TextToCamel(
  String text,
) => _module.TextToCamel(text);

/// See [RaylibCoreD.TextToInteger].
int TextToInteger(
  String text,
) => _module.TextToInteger(text);

/// See [RaylibCoreD.TextToFloat].
double TextToFloat(
  String text,
) => _module.TextToFloat(text);

/// See [RaylibCoreD.DrawLine3D].
void DrawLine3D(
  Vector3D startPos,
  Vector3D endPos,
  ColorD color,
) => _module.DrawLine3D(startPos, endPos, color);

/// See [RaylibCoreD.DrawPoint3D].
void DrawPoint3D(
  Vector3D position,
  ColorD color,
) => _module.DrawPoint3D(position, color);

/// See [RaylibCoreD.DrawCircle3D].
void DrawCircle3D(
  Vector3D center,
  num radius,
  Vector3D rotationAxis,
  num rotationAngle,
  ColorD color,
) => _module.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color);

/// See [RaylibCoreD.DrawTriangle3D].
void DrawTriangle3D(
  Vector3D v1,
  Vector3D v2,
  Vector3D v3,
  ColorD color,
) => _module.DrawTriangle3D(v1, v2, v3, color);

/// See [RaylibCoreD.DrawTriangleStrip3D].
void DrawTriangleStrip3D(
  List<Vector3D> points,
  ColorD color,
) => _module.DrawTriangleStrip3D(points, color);

/// See [RaylibCoreD.DrawCube].
void DrawCube(
  Vector3D position,
  num width,
  num height,
  num length,
  ColorD color,
) => _module.DrawCube(position, width, height, length, color);

/// See [RaylibCoreD.DrawCubeV].
void DrawCubeV(
  Vector3D position,
  Vector3D size,
  ColorD color,
) => _module.DrawCubeV(position, size, color);

/// See [RaylibCoreD.DrawCubeWires].
void DrawCubeWires(
  Vector3D position,
  num width,
  num height,
  num length,
  ColorD color,
) => _module.DrawCubeWires(position, width, height, length, color);

/// See [RaylibCoreD.DrawCubeWiresV].
void DrawCubeWiresV(
  Vector3D position,
  Vector3D size,
  ColorD color,
) => _module.DrawCubeWiresV(position, size, color);

/// See [RaylibCoreD.DrawSphere].
void DrawSphere(
  Vector3D centerPos,
  num radius,
  ColorD color,
) => _module.DrawSphere(centerPos, radius, color);

/// See [RaylibCoreD.DrawSphereEx].
void DrawSphereEx(
  Vector3D centerPos,
  num radius,
  num rings,
  num slices,
  ColorD color,
) => _module.DrawSphereEx(centerPos, radius, rings, slices, color);

/// See [RaylibCoreD.DrawSphereWires].
void DrawSphereWires(
  Vector3D centerPos,
  num radius,
  num rings,
  num slices,
  ColorD color,
) => _module.DrawSphereWires(centerPos, radius, rings, slices, color);

/// See [RaylibCoreD.DrawCylinder].
void DrawCylinder(
  Vector3D position,
  num radiusTop,
  num radiusBottom,
  num height,
  num slices,
  ColorD color,
) => _module.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreD.DrawCylinderEx].
void DrawCylinderEx(
  Vector3D startPos,
  Vector3D endPos,
  num startRadius,
  num endRadius,
  num sides,
  ColorD color,
) => _module.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreD.DrawCylinderWires].
void DrawCylinderWires(
  Vector3D position,
  num radiusTop,
  num radiusBottom,
  num height,
  num slices,
  ColorD color,
) => _module.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color);

/// See [RaylibCoreD.DrawCylinderWiresEx].
void DrawCylinderWiresEx(
  Vector3D startPos,
  Vector3D endPos,
  num startRadius,
  num endRadius,
  num sides,
  ColorD color,
) => _module.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color);

/// See [RaylibCoreD.DrawCapsule].
void DrawCapsule(
  Vector3D startPos,
  Vector3D endPos,
  num radius,
  num slices,
  num rings,
  ColorD color,
) => _module.DrawCapsule(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreD.DrawCapsuleWires].
void DrawCapsuleWires(
  Vector3D startPos,
  Vector3D endPos,
  num radius,
  num slices,
  num rings,
  ColorD color,
) => _module.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color);

/// See [RaylibCoreD.DrawPlane].
void DrawPlane(
  Vector3D centerPos,
  Vector2D size,
  ColorD color,
) => _module.DrawPlane(centerPos, size, color);

/// See [RaylibCoreD.DrawRay].
void DrawRay(
  RayD ray,
  ColorD color,
) => _module.DrawRay(ray, color);

/// See [RaylibCoreD.DrawGrid].
void DrawGrid(
  num slices,
  num spacing,
) => _module.DrawGrid(slices, spacing);

/// See [RaylibCoreD.LoadModel].
ModelD LoadModel(
  String fileName,
) => _module.LoadModel(fileName);

/// See [RaylibCoreD.LoadModelFromMesh].
ModelD LoadModelFromMesh(
  MeshD mesh,
) => _module.LoadModelFromMesh(mesh);

/// See [RaylibCoreD.IsModelValid].
bool IsModelValid(
  ModelD model,
) => _module.IsModelValid(model);

/// See [RaylibCoreD.UnloadModel].
void UnloadModel(
  ModelD model,
) => _module.UnloadModel(model);

/// See [RaylibCoreD.GetModelBoundingBox].
BoundingBoxD GetModelBoundingBox(
  ModelD model,
) => _module.GetModelBoundingBox(model);

/// See [RaylibCoreD.DrawModel].
void DrawModel(
  ModelD model,
  Vector3D position,
  num scale,
  ColorD tint
) => _module.DrawModel(model, position, scale, tint);

/// See [RaylibCoreD.DrawModelEx].
void DrawModelEx(
  ModelD model,
  Vector3D position,
  Vector3D rotationAxis,
  num rotationAngle,
  Vector3D scale,
  ColorD tint,
) => _module.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreD.DrawModelWires].
void DrawModelWires(
  ModelD model,
  Vector3D position,
  num scale,
  ColorD tint,
) => _module.DrawModelWires(model, position, scale, tint);

/// See [RaylibCoreD.DrawModelWiresEx].
void DrawModelWiresEx(
  ModelD model,
  Vector3D position,
  Vector3D rotationAxis,
  num rotationAngle,
  Vector3D scale,
  ColorD tint,
) => _module.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint);

/// See [RaylibCoreD.DrawBoundingBox].
void DrawBoundingBox(
  BoundingBoxD box,
  ColorD color,
) => _module.DrawBoundingBox(box, color);

/// See [RaylibCoreD.DrawBillboard].
void DrawBillboard(
  Camera3DD camera,
  TextureD texture,
  Vector3D position,
  num scale,
  ColorD tint,
) => _module.DrawBillboard(camera, texture, position, scale, tint);

/// See [RaylibCoreD.DrawBillboardRec].
void DrawBillboardRec(
  Camera3DD camera,
  TextureD texture,
  RectangleD source,
  Vector3D position,
  Vector2D size,
  ColorD tint,
) => _module.DrawBillboardRec(camera, texture, source, position, size, tint);

/// See [RaylibCoreD.DrawBillboardPro].
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
  num rotation,
  ColorD tint,
) => _module.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint);

/// See [RaylibCoreD.UploadMesh].
void UploadMesh(
  MeshD mesh,
  bool dynamic,
) => _module.UploadMesh(mesh, dynamic);

/// See [RaylibCoreD.UpdateMeshBuffer].
void UpdateMeshBuffer(
  MeshD mesh,
  num index,
  TypedDataList data,
  num offset,
) => _module.UpdateMeshBuffer(mesh, index, data, offset);

/// See [RaylibCoreD.UnloadMesh].
void UnloadMesh(
  MeshD mesh,
) => _module.UnloadMesh(mesh);

/// See [RaylibCoreD.DrawMesh].
void DrawMesh(
  MeshD mesh,
  MaterialD material,
  MatrixD transform,
) => _module.DrawMesh(mesh, material, transform);

/// See [RaylibCoreD.DrawMeshInstanced].
void DrawMeshInstanced(
  MeshD mesh,
  MaterialD material,
  List<MatrixD> transforms,
) => _module.DrawMeshInstanced(mesh, material, transforms);

/// See [RaylibCoreD.GetMeshBoundingBox].
BoundingBoxD GetMeshBoundingBox(
  MeshD mesh,
) => _module.GetMeshBoundingBox(mesh);

/// See [RaylibCoreD.GenMeshTangents].
void GenMeshTangents(
  MeshD mesh,
) => _module.GenMeshTangents(mesh);

/// See [RaylibCoreD.ExportMesh].
bool ExportMesh(
  MeshD mesh,
  String fileName,
) => _module.ExportMesh(mesh, fileName);

/// See [RaylibCoreD.ExportMeshAsCode].
bool ExportMeshAsCode(
  MeshD mesh,
  String fileName,
) => _module.ExportMeshAsCode(mesh, fileName);

/// See [RaylibCoreD.GenMeshPoly].
MeshD GenMeshPoly(
  num sides,
  num radius,
) => _module.GenMeshPoly(sides, radius);

/// See [RaylibCoreD.GenMeshPlane].
MeshD GenMeshPlane(
  num width,
  num length,
  num resX,
  num resZ,
) => _module.GenMeshPlane(width, length, resX, resZ);

/// See [RaylibCoreD.GenMeshCube].
MeshD GenMeshCube(
  num width,
  num height,
  num length,
) => _module.GenMeshCube(width, height, length);

/// See [RaylibCoreD.GenMeshSphere].
MeshD GenMeshSphere(
  num radius,
  num rings,
  num slices,
) => _module.GenMeshSphere(radius, rings, slices);

/// See [RaylibCoreD.GenMeshHemiSphere].
MeshD GenMeshHemiSphere(
  num radius,
  num rings,
  num slices,
) => _module.GenMeshHemiSphere(radius, rings, slices);

/// See [RaylibCoreD.GenMeshCylinder].
MeshD GenMeshCylinder(
  num radius,
  num height,
  num slices,
) => _module.GenMeshCylinder(radius, height, slices);

/// See [RaylibCoreD.GenMeshCone].
MeshD GenMeshCone(
  num radius,
  num height,
  num slices,
) => _module.GenMeshCone(radius, height, slices);

/// See [RaylibCoreD.GenMeshTorus].
MeshD GenMeshTorus(
  num radius,
  num size,
  num radSeg,
  num sides,
) => _module.GenMeshTorus(radius, size, radSeg, sides);

/// See [RaylibCoreD.GenMeshKnot].
MeshD GenMeshKnot(
  num radius,
  num size,
  num radSeg,
  num sides,
) => _module.GenMeshKnot(radius, size, radSeg, sides);

/// See [RaylibCoreD.GenMeshHeightmap].
MeshD GenMeshHeightmap(
  ImageD heightmap,
  Vector3D size,
) => _module.GenMeshHeightmap(heightmap, size);

/// See [RaylibCoreD.GenMeshCubicmap].
MeshD GenMeshCubicmap(
  ImageD cubicmap,
  Vector3D cubeSize,
) => _module.GenMeshCubicmap(cubicmap, cubeSize);

/// See [RaylibCoreD.LoadMaterials].
List<MaterialD> LoadMaterials(
  String fileName,
) => _module.LoadMaterials(fileName);

/// See [RaylibCoreD.LoadMaterialDefault].
MaterialD LoadMaterialDefault() => _module.LoadMaterialDefault();

/// See [RaylibCoreD.IsMaterialValid].
bool IsMaterialValid(
  MaterialD material,
) => _module.IsMaterialValid(material);

/// See [RaylibCoreD.UnloadMaterial].
void UnloadMaterial(
  MaterialD material,
) => _module.UnloadMaterial(material);

/// See [RaylibCoreD.SetMaterialTexture].
void SetMaterialTexture(
  MaterialD material,
  MaterialMapIndex mapType,
  TextureD texture,
) => _module.SetMaterialTexture(material, mapType, texture);

/// See [RaylibCoreD.SetModelMeshMaterial].
void SetModelMeshMaterial(
  ModelD model,
  num meshId,
  num materialId,
) => _module.SetModelMeshMaterial(model, meshId, materialId);

/// See [RaylibCoreD.LoadModelAnimations].
NativeLiveListPointerStruct<ModelAnimationC, ModelAnimationD> LoadModelAnimations(
  String fileName,
) => _module.LoadModelAnimations(fileName);

/// See [RaylibCoreD.UpdateModelAnimation].
void UpdateModelAnimation(
  ModelD model,
  ModelAnimationD anim,
  num frame,
) => _module.UpdateModelAnimation(model, anim, frame);

/// See [RaylibCoreD.UpdateModelAnimationEx].
void UpdateModelAnimationEx(
  ModelD model,
  ModelAnimationD animA,
  num frameA,
  ModelAnimationD animB,
  num frameB,
  num blend,
) => _module.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend);

/// See [RaylibCoreD.UnloadModelAnimations].
void UnloadModelAnimations(
  NativeLiveListPointerStruct<ModelAnimationC, ModelAnimationD> animations,
) => _module.UnloadModelAnimations(animations);

/// See [RaylibCoreD.IsModelAnimationValid].
bool IsModelAnimationValid(
  ModelD model,
  ModelAnimationD anim,
) => _module.IsModelAnimationValid(model, anim);

/// See [RaylibCoreD.CheckCollisionSpheres].
bool CheckCollisionSpheres(
  Vector3D center1,
  num radius1,
  Vector3D center2,
  num radius2,
) => _module.CheckCollisionSpheres(center1, radius1, center2, radius2);

/// See [RaylibCoreD.CheckCollisionBoxes].
bool CheckCollisionBoxes(
  BoundingBoxD box1,
  BoundingBoxD box2,
) => _module.CheckCollisionBoxes(box1, box2);

/// See [RaylibCoreD.CheckCollisionBoxSphere].
bool CheckCollisionBoxSphere(
  BoundingBoxD box,
  Vector3D center,
  num radius,
) => _module.CheckCollisionBoxSphere(box, center, radius);

/// See [RaylibCoreD.GetRayCollisionSphere].
RayCollisionD GetRayCollisionSphere(
  RayD ray,
  Vector3D center,
  num radius,
) => _module.GetRayCollisionSphere(ray, center, radius);

/// See [RaylibCoreD.GetRayCollisionBox].
RayCollisionD GetRayCollisionBox(
  RayD ray,
  BoundingBoxD box,
) => _module.GetRayCollisionBox(ray, box);

/// See [RaylibCoreD.GetRayCollisionMesh].
RayCollisionD GetRayCollisionMesh(
  RayD ray,
  MeshD mesh,
  MatrixD transform,
) => _module.GetRayCollisionMesh(ray, mesh, transform);

/// See [RaylibCoreD.GetRayCollisionTriangle].
RayCollisionD GetRayCollisionTriangle(
  RayD ray,
  Vector3D p1,
  Vector3D p2,
  Vector3D p3,
) => _module.GetRayCollisionTriangle(ray, p1, p2, p3);

/// See [RaylibCoreD.GetRayCollisionQuad].
RayCollisionD GetRayCollisionQuad(
  RayD ray,
  Vector3D p1,
  Vector3D p2,
  Vector3D p3,
  Vector3D p4,
) => _module.GetRayCollisionQuad(ray, p1, p2, p3, p4);

