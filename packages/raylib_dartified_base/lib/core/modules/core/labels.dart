part of '../../raylib_dartified_base.dart';

class _RaylibCoreDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibCoreDart.InitWindow].
  String InitWindow(
    num width,
    num height,
    String title,
  ) => 'InitWindow($width, $height, $title)';

  /// Label for [RaylibCoreDart.CloseWindow].
  String CloseWindow() => 'CloseWindow()';

  /// Label for [RaylibCoreDart.WindowShouldClose].
  String WindowShouldClose() => 'WindowShouldClose()';

  /// Label for [RaylibCoreDart.IsWindowReady].
  String IsWindowReady() => 'IsWindowReady()';

  /// Label for [RaylibCoreDart.IsWindowFullscreen].
  String IsWindowFullscreen() => 'IsWindowFullscreen()';

  /// Label for [RaylibCoreDart.IsWindowHidden].
  String IsWindowHidden() => 'IsWindowHidden()';
    
  /// Label for [RaylibCoreDart.IsWindowMinimized].
  String IsWindowMinimized() => 'IsWindowMinimized()';
    
  /// Label for [RaylibCoreDart.IsWindowMaximized].
  String IsWindowMaximized() => 'IsWindowMaximized()';
    
  /// Label for [RaylibCoreDart.IsWindowFocused].
  String IsWindowFocused() => 'IsWindowFocused()';
    
  /// Label for [RaylibCoreDart.IsWindowResized].
  String IsWindowResized() => 'IsWindowResized()';
    
  /// Label for [RaylibCoreDart.IsWindowState].
  String IsWindowState(
    ConfigFlags flag,
  ) => 'IsWindowState(${flag.name})';
    
  /// Label for [RaylibCoreDart.SetWindowState].
  String SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'SetWindowState(${EnumsAsFlagsOr(flags)})';
    
  /// Label for [RaylibCoreDart.ClearWindowState].
  String ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => 'ClearWindowState(${EnumsAsFlagsOr(flags)})';
    
  /// Label for [RaylibCoreDart.ToggleFullscreen].
  String ToggleFullscreen() => 'ToggleFullscreen()';
    
  /// Label for [RaylibCoreDart.ToggleBorderlessWindowed].
  String ToggleBorderlessWindowed() => 'ToggleBorderlessWindowed()';
    
  /// Label for [RaylibCoreDart.MaximizeWindow].
  String MaximizeWindow() => 'MaximizeWindow()';
    
  /// Label for [RaylibCoreDart.MinimizeWindow].
  String MinimizeWindow() => 'MinimizeWindow()';
    
  /// Label for [RaylibCoreDart.RestoreWindow].
  String RestoreWindow() => 'RestoreWindow()';
    
  /// Label for [RaylibCoreDart.SetWindowIcon].
  String SetWindowIcon(
    Image image,
  ) => 'SetWindowIcon($image)';
    
  /// Label for [RaylibCoreDart.SetWindowIcons].
  String SetWindowIcons(
    List<Image> images,
  ) => 'SetWindowIcons(${images.length})';
    
  /// Label for [RaylibCoreDart.SetWindowTitle].
  String SetWindowTitle(
    String title,
  ) => 'SetWindowTitle($title)';

  /// Label for [RaylibCoreDart.SetWindowPosition].
  String SetWindowPosition(
    num x,
    num y,
  ) => 'SetWindowPosition($x, $y)';
    
  /// Label for [RaylibCoreDart.SetWindowMonitor].
  String SetWindowMonitor(
    num monitor,
  ) => 'SetWindowMonitor($monitor)';
    
  /// Label for [RaylibCoreDart.SetWindowMinSize].
  String SetWindowMinSize(
    num width,
    num height,
  ) => 'SetWindowMinSize($width, $height)';

  /// Label for [RaylibCoreDart.SetWindowMaxSize].
  String SetWindowMaxSize(
    num width,
    num height,
  ) => 'SetWindowMaxSize($width, $height)';
    
  /// Label for [RaylibCoreDart.SetWindowSize].
  String SetWindowSize(
    num width,
    num height,
  ) => 'SetWindowSize($width, $height)';

  /// Label for [RaylibCoreDart.SetWindowOpacity].
  String SetWindowOpacity(
    num opacity,
  ) => 'SetWindowOpacity($opacity)';
    
  /// Label for [RaylibCoreDart.SetWindowFocused].
  String SetWindowFocused() => 'SetWindowFocused()';

  /// Label for [RaylibCoreDart.GetScreenWidth].
  String GetScreenWidth() => 'GetScreenWidth()';
    
  /// Label for [RaylibCoreDart.GetScreenHeight].
  String GetScreenHeight() => 'GetScreenHeight()';
    
  /// Label for [RaylibCoreDart.GetRenderWidth].
  String GetRenderWidth() => 'GetRenderWidth()';
    
  /// Label for [RaylibCoreDart.GetRenderHeight].
  String GetRenderHeight() => 'GetRenderHeight()';
    
  /// Label for [RaylibCoreDart.GetMonitorCount].
  String GetMonitorCount() => 'GetMonitorCount()';
    
  /// Label for [RaylibCoreDart.GetCurrentMonitor].
  String GetCurrentMonitor() => 'GetCurrentMonitor()';
    
  /// Label for [RaylibCoreDart.GetMonitorPosition].
  String GetMonitorPosition(
    num monitor,
  ) => 'GetMonitorPosition($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorWidth].
  String GetMonitorWidth(
    num monitor,
  ) => 'GetMonitorWidth($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorHeight].
  String GetMonitorHeight(
    num monitor,
  ) => 'GetMonitorHeight($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorPhysicalWidth].
  String GetMonitorPhysicalWidth(
    num monitor,
  ) => 'GetMonitorPhysicalWidth($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorPhysicalHeight].
  String GetMonitorPhysicalHeight(
    num monitor,
  ) => 'GetMonitorPhysicalHeight($monitor)';
    
  /// Label for [RaylibCoreDart.GetMonitorRefreshRate].
  String GetMonitorRefreshRate(
    num monitor,
  ) => 'GetMonitorRefreshRate($monitor)';
    
  /// Label for [RaylibCoreDart.GetWindowPosition].
  String GetWindowPosition() => 'GetWindowPosition()';
    
  /// Label for [RaylibCoreDart.GetWindowScaleDPI].
  String GetWindowScaleDPI() => 'GetWindowScaleDPI()';
    
  /// Label for [RaylibCoreDart.GetMonitorName].
  String GetMonitorName(
    num monitor,
  ) => 'GetMonitorName($monitor)';
    
  /// Label for [RaylibCoreDart.SetClipboardText].
  String SetClipboardText(
    String text,
  ) => 'SetClipboardText($text)';
    
  /// Label for [RaylibCoreDart.GetClipboardText].
  String GetClipboardText() => 'GetClipboardText()';

  /// Label for [RaylibCoreDart.GetClipboardImage].
  String GetClipboardImage() => 'GetClipboardImage()';
    
  /// Label for [RaylibCoreDart.EnableEventWaiting].
  String EnableEventWaiting() => 'EnableEventWaiting()';
    
  /// Label for [RaylibCoreDart.DisableEventWaiting].
  String DisableEventWaiting() => 'DisableEventWaiting()';
    
  /// Label for [RaylibCoreDart.ShowCursor].
  String ShowCursor() => 'ShowCursor()';
    
  /// Label for [RaylibCoreDart.HideCursor].
  String HideCursor() => 'HideCursor()';
    
  /// Label for [RaylibCoreDart.IsCursorHidden].
  String IsCursorHidden() => 'IsCursorHidden()';
    
  /// Label for [RaylibCoreDart.EnableCursor].
  String EnableCursor() => 'EnableCursor()';
    
  /// Label for [RaylibCoreDart.DisableCursor].
  String DisableCursor() => 'DisableCursor()';
    
  /// Label for [RaylibCoreDart.IsCursorOnScreen].
  String IsCursorOnScreen() => 'IsCursorOnScreen()';
    
  /// Label for [RaylibCoreDart.ClearBackground].
  String ClearBackground(
    Color color,
  ) => 'ClearBackground($color)';
    
  /// Label for [RaylibCoreDart.BeginDrawing].
  String BeginDrawing() => 'BeginDrawing()';
    
  /// Label for [RaylibCoreDart.EndDrawing].
  String EndDrawing() => 'EndDrawing()';
    
  /// Label for [RaylibCoreDart.BeginMode2D].
  String BeginMode2D(
    Camera2D camera,
  ) => 'BeginMode2D($camera)';

  /// Label for [RaylibCoreDart.EndMode2D].
  String EndMode2D() => 'EndMode2D()';
    
  /// Label for [RaylibCoreDart.BeginMode3D].
  String BeginMode3D(
    Camera3D camera,
  ) => 'BeginMode3D($camera)';

  /// Label for [RaylibCoreDart.EndMode3D].
  String EndMode3D() => 'EndMode3D()';
    
  /// Label for [RaylibCoreDart.BeginTextureMode].
  String BeginTextureMode(
    RenderTexture target,
  ) => 'BeginTextureMode($target)';
    
  /// Label for [RaylibCoreDart.EndTextureMode].
  String EndTextureMode() => 'EndTextureMode()';
    
  /// Label for [RaylibCoreDart.BeginShaderMode].
  String BeginShaderMode(
    Shader shader,
  ) => 'BeginShaderMode($shader)';
    
  /// Label for [RaylibCoreDart.EndShaderMode].
  String EndShaderMode() => 'EndShaderMode()';
    
  /// Label for [RaylibCoreDart.BeginBlendMode].
  String BeginBlendMode(
    BlendMode mode,
  ) => 'BeginBlendMode($mode)';
    
  /// Label for [RaylibCoreDart.EndBlendMode].
  String EndBlendMode() => 'EndBlendMode()';
    
  /// Label for [RaylibCoreDart.BeginScissorMode].
  String BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => 'BeginScissorMode($x, $y, $width, $height)';
    
  /// Label for [RaylibCoreDart.EndScissorMode].
  String EndScissorMode() => 'EndScissorMode()';
    
  /// Label for [RaylibCoreDart.BeginVrStereoMode].
  String BeginVrStereoMode(
    VrStereoConfig config,
  ) => 'BeginVrStereoMode($config)';
    
  /// Label for [RaylibCoreDart.EndVrStereoMode].
  String EndVrStereoMode() => 'EndVrStereoMode()';
    
  /// Label for [RaylibCoreDart.LoadVrStereoConfig].
  String LoadVrStereoConfig(
    VrDeviceInfo device,
  ) => 'LoadVrStereoConfig($device)';
    
  /// Label for [RaylibCoreDart.UnloadVrStereoConfig].
  String UnloadVrStereoConfig(
    VrStereoConfig config,
  ) => 'UnloadVrStereoConfig($config)';
    
  /// Label for [RaylibCoreDart.LoadShader].
  String LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => 'LoadShader($vsFileName, $fsFileName)';
    
  /// Label for [RaylibCoreDart.LoadShaderFromMemory].
  String LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => 'LoadShaderFromMemory($vsCode, $fsCode)';
    
  /// Label for [RaylibCoreDart.IsShaderValid].
  String IsShaderValid(
    Shader shader,
  ) => 'IsShaderValid($shader)';
    
  /// Label for [RaylibCoreDart.GetShaderLocation].
  String GetShaderLocation(
    Shader shader,
    String uniformName,
  ) => 'GetShaderLocation($shader, $uniformName)';
    
  /// Label for [RaylibCoreDart.GetShaderLocationAttrib].
  String GetShaderLocationAttrib(
    Shader shader,
    String attribName,
  ) => 'GetShaderLocationAttrib($shader, $attribName)';
  
  /// Label for [RaylibCoreDart.SetShaderValue].
  String SetShaderValue(
    Shader shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
  ) => SetShaderValueV(
    shader,
    locIndex,
    value,
    uniformType,
    1,
  );

  /// Label for [RaylibCoreDart.SetShaderValueV].
  String SetShaderValueV(
    Shader shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  ) => 'SetShaderValueV($shader, $locIndex, $value, ${uniformType.name}, $count)';
    
  /// Label for [RaylibCoreDart.SetShaderValueMatrix].
  String SetShaderValueMatrix(
    Shader shader,
    num locIndex,
    Matrix mat,
  ) => 'SetShaderValueMatrix($shader, $locIndex, $mat)';
    
  /// Label for [RaylibCoreDart.SetShaderValueTexture].
  String SetShaderValueTexture(
    Shader shader,
    num locIndex,
    Texture texture,
  ) => 'SetShaderValueTexture($shader, $locIndex, $texture)';
    
  /// Label for [RaylibCoreDart.UnloadShader].
  String UnloadShader(
    Shader shader,
  ) => 'UnloadShader($shader)';
    
  /// Label for [RaylibCoreDart.GetScreenToWorldRay].
  String GetScreenToWorldRay(
    Vector2 position,
    Camera3D camera,
  ) => 'GetScreenToWorldRay($position, $camera)';
    
  /// Label for [RaylibCoreDart.GetScreenToWorldRayEx].
  String GetScreenToWorldRayEx(
    Vector2 position,
    Camera3D camera,
    num width,
    num height,
  ) => 'GetScreenToWorldRayEx($position, $camera, $width, $height)';

  /// Label for [RaylibCoreDart.GetWorldToScreen].
  String GetWorldToScreen(
    Vector3 position,
    Camera3D camera,
  ) => 'GetWorldToScreen($position, $camera)';

  /// Label for [RaylibCoreDart.GetWorldToScreenEx].
  String GetWorldToScreenEx(
    Vector3 position,
    Camera3D camera,
    num width,
    num height,
  ) => 'GetWorldToScreenEx($position, $camera, $width, $height)';

  /// Label for [RaylibCoreDart.GetWorldToScreen2D].
  String GetWorldToScreen2D(
    Vector2 position,
    Camera2D camera,
  ) => 'GetWorldToScreen2D($position, $camera)';

  /// Label for [RaylibCoreDart.GetScreenToWorld2D].
  String GetScreenToWorld2D(
    Vector2 position,
    Camera2D camera,
  ) => 'GetScreenToWorld2D($position, $camera)';

  /// Label for [RaylibCoreDart.GetCameraMatrix].
  String GetCameraMatrix(
    Camera3D camera,
  ) => 'GetCameraMatrix($camera)';

  /// Label for [RaylibCoreDart.GetCameraMatrix2D].
  String GetCameraMatrix2D(
    Camera2D camera,
  ) => 'GetCameraMatrix2D($camera)';
    
  /// Label for [RaylibCoreDart.SetTargetFPS].
  String SetTargetFPS(
    num fps,
  ) => 'SetTargetFPS($fps)';

  /// Label for [RaylibCoreDart.GetFrameTime].
  String GetFrameTime() => 'GetFrameTime()';

  /// Label for [RaylibCoreDart.GetTime].
  String GetTime() => 'GetTime()';

  /// Label for [RaylibCoreDart.GetFPS].
  String GetFPS() => 'GetFPS()';

  /// Label for [RaylibCoreDart.SwapScreenBuffer].
  String SwapScreenBuffer() => 'SwapScreenBuffer()';

  /// Label for [RaylibCoreDart.PollInputEvents].
  String PollInputEvents() => 'PollInputEvents()';

  /// Label for [RaylibCoreDart.WaitTime].
  String WaitTime(
    num seconds,
  ) => 'WaitTime($seconds)';

  /// Label for [RaylibCoreDart.SetRandomSeed].
  String SetRandomSeed(
    num seed,
  ) => 'SetRandomSeed($seed)';

  /// Label for [RaylibCoreDart.GetRandomValue].
  String GetRandomValue(
    num min,
    num max,
  ) => 'GetRandomValue($min, $max)';
  
  /// Label for [RaylibCoreDart.LoadRandomSequence].
  String LoadRandomSequence(
    num count,
    num min,
    num max,
  ) => 'LoadRandomSequence($count, $min, $max)';
    
  /// Label for [RaylibCoreDart.TakeScreenshot].
  String TakeScreenshot(
    String fileName,
  ) => 'TakeScreenshot($fileName)';

  /// Label for [RaylibCoreDart.SetConfigFlags].
  String SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => 'SetConfigFlags(${EnumsAsFlagsOr(flags)})';

  /// Label for [RaylibCoreDart.OpenURL].
  String OpenURL(
    String url,
  ) => 'OpenURL($url)';

  /// Label for [RaylibCoreDart.TraceLog].
  String TraceLog(
    TraceLogLevel logLevel,
    String text,
  ) => 'TraceLog(${logLevel.name}, $text)';

  /// Label for [RaylibCoreDart.SetTraceLogLevel].
  String SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => 'SetTraceLogLevel(${logLevel.name})';

  /// Label for [RaylibCoreDart.SetTraceLogCallback].
  String SetTraceLogCallback(
    TraceLogCallbackBase? callback,
  ) => 'SetTraceLogCallback($callback)';
    
  /// Label for [RaylibCoreDart.SetLoadFileDataCallback].
  String SetLoadFileDataCallback(
    LoadFileDataCallbackBase? callback
  ) => 'SetLoadFileDataCallback($callback)';
    
  /// Label for [RaylibCoreDart.SetSaveFileDataCallback].
  String SetSaveFileDataCallback(
    SaveFileDataCallbackBase? callback
  ) => 'SetSaveFileDataCallback($callback)';
    
  /// Label for [RaylibCoreDart.SetLoadFileTextCallback].
  String SetLoadFileTextCallback(
    LoadFileTextCallbackBase? callback
  ) => 'SetLoadFileTextCallback($callback)';
    
  /// Label for [RaylibCoreDart.SetSaveFileTextCallback].
  String SetSaveFileTextCallback(
    SaveFileTextCallbackBase? callback
  ) => 'SetSaveFileTextCallback($callback)';
    
  /// Label for [RaylibCoreDart.LoadFileData].
  String LoadFileData(
    String fileName,
  ) => 'LoadFileData($fileName)';

  /// Label for [RaylibCoreDart.SaveFileData].
  String SaveFileData(
    String fileName,
    Uint8List data,
  ) => 'SaveFileData($fileName, data: ${data.length})';

  /// Label for [RaylibCoreDart.ExportDataAsCode].
  String ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => 'ExportDataAsCode(data: ${data.length}, $fileName)';

  /// Label for [RaylibCoreDart.LoadFileText].
  String LoadFileText(
    String fileName,
  ) => 'LoadFileText($fileName)';

  /// Label for [RaylibCoreDart.SaveFileText].
  String SaveFileText(
    String fileName,
    String text,
  ) => 'SaveFileText($fileName, $text)';

  /// Label for [RaylibCoreDart.FileRename].
  String FileRename(
    String fileName,
    String fileRename,
  ) => 'FileRename($fileName, $fileRename)';
  
  /// Label for [RaylibCoreDart.FileRemove].
  String FileRemove(
    String fileName,
  ) => 'FileRemove($fileName)';
  
  /// Label for [RaylibCoreDart.FileCopy].
  String FileCopy(
    String srcPath,
    String dstPath,
  ) => 'FileCopy($srcPath, $dstPath)';
  
  /// Label for [RaylibCoreDart.FileMove].
  String FileMove(
    String srcPath,
    String dstPath,
  ) => 'FileMove($srcPath, $dstPath)';
  
  /// Label for [RaylibCoreDart.FileTextReplace].
  String FileTextReplace(
    String fileName,
    String search,
    String replacement,
  ) => 'FileTextReplace($fileName, $search, $replacement)';
  
  /// Label for [RaylibCoreDart.FileTextFindIndex].
  String FileTextFindIndex(
    String fileName,
    String search,
  ) => 'FileTextFindIndex($fileName, $search)';

  /// Label for [RaylibCoreDart.FileExists].
  String FileExists(
    String fileName,
  ) => 'FileExists($fileName)';

  /// Label for [RaylibCoreDart.DirectoryExists].
  String DirectoryExists(
    String dirPath,
  ) => 'DirectoryExists($dirPath)';

  /// Label for [RaylibCoreDart.IsFileExtension].
  String IsFileExtension(
    String fileName,
    String ext,
  ) => 'IsFileExtension($fileName, $ext)';

  /// Label for [RaylibCoreDart.GetFileLength].
  String GetFileLength(
    String fileName,
  ) => 'GetFileLength($fileName)';

  /// Label for [RaylibCoreDart.GetFileExtension].
  String GetFileExtension(
    String fileName,
  ) => 'GetFileExtension($fileName)';

  /// Label for [RaylibCoreDart.GetFileName].
  String GetFileName(
    String filePath,
  ) => 'GetFileName($filePath)';

  /// Label for [RaylibCoreDart.GetFileNameWithoutExt].
  String GetFileNameWithoutExt(
    String filePath,
  ) => 'GetFileNameWithoutExt($filePath)';

  /// Label for [RaylibCoreDart.GetDirectoryFileCount].
  String GetDirectoryFileCount(
    String dirPath, 
  ) => 'GetDirectoryFileCount($dirPath)';
  
  /// Label for [RaylibCoreDart.GetDirectoryFileCountEx].
  String GetDirectoryFileCountEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'GetDirectoryFileCountEx($basePath, $filter, $scanSubdirs)';

  /// Label for [RaylibCoreDart.GetDirectoryPath].
  String GetDirectoryPath(
    String filePath,
  ) => 'GetDirectoryPath($filePath)';

  /// Label for [RaylibCoreDart.GetPrevDirectoryPath].
  String GetPrevDirectoryPath(
    String dirPath,
  ) => 'GetPrevDirectoryPath($dirPath)';

  /// Label for [RaylibCoreDart.GetWorkingDirectory].
  String GetWorkingDirectory() => 'GetWorkingDirectory()';

  /// Label for [RaylibCoreDart.GetApplicationDirectory].
  String GetApplicationDirectory() => 'GetApplicationDirectory()';

  /// Label for [RaylibCoreDart.MakeDirectory].
  String MakeDirectory(
    String dirPath,
  ) => 'MakeDirectory($dirPath)';

  /// Label for [RaylibCoreDart.ChangeDirectory].
  String ChangeDirectory(
    String dir,
  ) => 'ChangeDirectory($dir)';

  /// Label for [RaylibCoreDart.IsPathFile].
  String IsPathFile(
    String path,
  ) => 'IsPathFile($path)';

  /// Label for [RaylibCoreDart.IsFileNameValid].
  String IsFileNameValid(
    String fileName,
  ) => 'IsFileNameValid($fileName)';
    
  /// Label for [RaylibCoreDart.LoadDirectoryFiles].
  String LoadDirectoryFiles(
    String dirPath,
  ) => 'LoadDirectoryFiles($dirPath)';
    
  /// Label for [RaylibCoreDart.LoadDirectoryFilesEx].
  String LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => 'LoadDirectoryFilesEx($basePath, $filter, $scanSubdirs)';

  /// Label for [RaylibCoreDart.UnloadDirectoryFiles].
  String UnloadDirectoryFiles(
    FilePathList files,
  ) => 'UnloadDirectoryFiles($files)';

  /// Label for [RaylibCoreDart.IsFileDropped].
  String IsFileDropped() => 'IsFileDropped()';
    
  /// Label for [RaylibCoreDart.LoadDroppedFiles].
  String LoadDroppedFiles() => 'LoadDroppedFiles()';

  /// Label for [RaylibCoreDart.UnloadDroppedFiles].
  String UnloadDroppedFiles(
    FilePathList files,
  ) => 'UnloadDroppedFiles($files)';

  /// Label for [RaylibCoreDart.GetFileModTime].
  String GetFileModTime(
    String fileName,
  ) => 'GetFileModTime($fileName)';

  /// Label for [RaylibCoreDart.CompressData].
  String CompressData(
    Uint8List data,
  ) => 'CompressData(data: ${data.length})';

  /// Label for [RaylibCoreDart.DecompressData].
  String DecompressData(
    Uint8List compData,
  ) => 'DecompressData(compData: ${compData.length})';

  /// Label for [RaylibCoreDart.EncodeDataBase64].
  String EncodeDataBase64(
    Uint8List data,
  ) => 'EncodeDataBase64(data: ${data.length})';

  /// Label for [RaylibCoreDart.DecodeDataBase64].
  String DecodeDataBase64(
    Uint8List data,
  ) => 'DecodeDataBase64(data: ${data.length})';

  /// Label for [RaylibCoreDart.ComputeCRC32].
  String ComputeCRC32(
    Uint8List data,
  ) => 'ComputeCRC32(data: ${data.length})';

  /// Label for [RaylibCoreDart.ComputeMD5].
  String ComputeMD5(
    Uint8List data,
  ) => 'ComputeMD5(data: ${data.length})';

  /// Label for [RaylibCoreDart.ComputeSHA1].
  String ComputeSHA1(
    Uint8List data,
  ) => 'ComputeSHA1(data: ${data.length})';

  /// Label for [RaylibCoreDart.ComputeSHA256].
  String ComputeSHA256(
    Uint8List data,
  ) => 'ComputeSHA256(data: ${data.length})';
    
  /// Label for [RaylibCoreDart.LoadAutomationEventList].
  String LoadAutomationEventList(
    String? fileName,
  ) => 'LoadAutomationEventList($fileName)';
    
  /// Label for [RaylibCoreDart.UnloadAutomationEventList].
  String UnloadAutomationEventList(
    AutomationEventList list,
  ) => 'UnloadAutomationEventList($list)';
    
  /// Label for [RaylibCoreDart.ExportAutomationEventList].
  String ExportAutomationEventList(
    AutomationEventList list,
    String fileName,
  ) => 'ExportAutomationEventList($list, $fileName)';
    
  /// Label for [RaylibCoreDart.SetAutomationEventList].
  String SetAutomationEventList(
    AutomationEventList list,
  ) => 'SetAutomationEventList($list)';
    
  /// Label for [RaylibCoreDart.SetAutomationEventBaseFrame].
  String SetAutomationEventBaseFrame(
    int frame,
  ) => 'SetAutomationEventBaseFrame($frame)';
    
  /// Label for [RaylibCoreDart.StartAutomationEventRecording].
  String StartAutomationEventRecording() => 'StartAutomationEventRecording()';

  /// Label for [RaylibCoreDart.StopAutomationEventRecording].
  String StopAutomationEventRecording() => 'StopAutomationEventRecording()';
    
  /// Label for [RaylibCoreDart.PlayAutomationEvent].
  String PlayAutomationEvent(
    AutomationEvent event,
  ) => 'PlayAutomationEvent($event)';

  /// Label for [RaylibCoreDart.IsKeyPressed].
  String IsKeyPressed(
    KeyboardKey key,
  ) => 'IsKeyPressed($key)';

  /// Label for [RaylibCoreDart.IsKeyPressedRepeat].
  String IsKeyPressedRepeat(
    KeyboardKey key,
  ) => 'IsKeyPressedRepeat($key)';

  /// Label for [RaylibCoreDart.IsKeyDown].
  String IsKeyDown(
    KeyboardKey key,
  ) => 'IsKeyDown($key)';
  
  /// Label for [RaylibCoreDart.IsKeyReleased].
  String IsKeyReleased(
    KeyboardKey key,
  ) => 'IsKeyReleased($key)';
  
  /// Label for [RaylibCoreDart.IsKeyUp].
  String IsKeyUp(
    KeyboardKey key,
  ) => 'IsKeyUp($key)';

  /// Label for [RaylibCoreDart.GetKeyName].
  String GetKeyName(
    KeyboardKey key,
  ) => 'GetKeyName($key)';

  /// Label for [RaylibCoreDart.GetKeyPressed].
  String GetKeyPressed() => 'GetKeyPressed()';

  /// Label for [RaylibCoreDart.GetCharPressed].
  String GetCharPressed() => 'GetCharPressed()';

  /// Label for [RaylibCoreDart.SetExitKey].
  String SetExitKey(
    KeyboardKey key,
  ) => 'SetExitKey(${key.name})';

  /// Label for [RaylibCoreDart.IsGamepadAvailable].
  String IsGamepadAvailable(
    num gamepad,
  ) => 'IsGamepadAvailable($gamepad)';

  /// Label for [RaylibCoreDart.GetGamepadName].
  String GetGamepadName(
    num gamepad,
  ) => 'GetGamepadName($gamepad)';

  /// Label for [RaylibCoreDart.IsGamepadButtonPressed].
  String IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonPressed($gamepad, ${button.name})';

  /// Label for [RaylibCoreDart.IsGamepadButtonDown].
  String IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonDown($gamepad, ${button.name})';

  /// Label for [RaylibCoreDart.IsGamepadButtonReleased].
  String IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonReleased($gamepad, ${button.name})';

  /// Label for [RaylibCoreDart.IsGamepadButtonUp].
  String IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => 'IsGamepadButtonUp($gamepad, ${button.name})';

  /// Label for [RaylibCoreDart.GetGamepadButtonPressed].
  String GetGamepadButtonPressed() => 'GetGamepadButtonPressed()';

  /// Label for [RaylibCoreDart.GetGamepadAxisCount].
  String GetGamepadAxisCount(
    num gamepad,
  ) => 'GetGamepadAxisCount($gamepad)';

  /// Label for [RaylibCoreDart.GetGamepadAxisMovement].
  String GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => 'GetGamepadAxisMovement($gamepad, $axis)';

  /// Label for [RaylibCoreDart.SetGamepadMappings].
  String SetGamepadMappings(
    String mappings,
  ) => 'SetGamepadMappings($mappings)';
    
  /// Label for [RaylibCoreDart.SetGamepadVibration].
  String SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => 'SetGamepadVibration($gamepad, $leftMotor, $rightMotor, $duration)';

  /// Label for [RaylibCoreDart.IsMouseButtonPressed].
  String IsMouseButtonPressed(
    MouseButton button,
  ) => 'IsMouseButtonPressed(${button.name})';

  /// Label for [RaylibCoreDart.IsMouseButtonDown].
  String IsMouseButtonDown(
    MouseButton button,
  ) => 'IsMouseButtonDown(${button.name})';

  /// Label for [RaylibCoreDart.IsMouseButtonReleased].
  String IsMouseButtonReleased(
    MouseButton button,
  ) => 'IsMouseButtonReleased(${button.name})';

  /// Label for [RaylibCoreDart.IsMouseButtonUp].
  String IsMouseButtonUp(
    MouseButton button,
  ) => 'IsMouseButtonUp(${button.name})';

  /// Label for [RaylibCoreDart.GetMouseX].
  String GetMouseX() => 'GetMouseX()';

  /// Label for [RaylibCoreDart.GetMouseY].
  String GetMouseY() => 'GetMouseY()';

  /// Label for [RaylibCoreDart.GetMousePosition].
  String GetMousePosition() => 'GetMousePosition()';

  /// Label for [RaylibCoreDart.GetMouseDelta].
  String GetMouseDelta() => 'GetMouseDelta()';

  /// Label for [RaylibCoreDart.SetMousePosition].
  String SetMousePosition(
    num x,
    num y,
  ) => 'SetMousePosition($x, $y)';

  /// Label for [RaylibCoreDart.SetMouseOffset].
  String SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => 'SetMouseOffset($offsetX, $offsetY)';

  /// Label for [RaylibCoreDart.SetMouseScale].
  String SetMouseScale(
    num scaleX,
    num scaleY,
  ) => 'SetMouseScale($scaleX, $scaleY)';

  /// Label for [RaylibCoreDart.GetMouseWheelMove].
  String GetMouseWheelMove() => 'GetMouseWheelMove()';

  /// Label for [RaylibCoreDart.GetMouseWheelMoveV].
  String GetMouseWheelMoveV() => 'GetMouseWheelMoveV()';

  /// Label for [RaylibCoreDart.SetMouseCursor].
  String SetMouseCursor(
    MouseCursor cursor,
  ) => 'SetMouseCursor(${cursor.name})';

  /// Label for [RaylibCoreDart.GetTouchX].
  String GetTouchX() => 'GetTouchX()';

  /// Label for [RaylibCoreDart.GetTouchY].
  String GetTouchY() => 'GetTouchY()';

  /// Label for [RaylibCoreDart.GetTouchPosition].
  String GetTouchPosition(
    num index,
  ) => 'GetTouchPosition($index)';

  /// Label for [RaylibCoreDart.GetTouchPointId].
  String GetTouchPointId(
    num index,
  ) => 'GetTouchPointId($index)';

  /// Label for [RaylibCoreDart.GetTouchPointCount].
  String GetTouchPointCount() => 'GetTouchPointCount()';

  /// Label for [RaylibCoreDart.SetGesturesEnabled].
  String SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => 'SetGesturesEnabled($flags)';

  /// Label for [RaylibCoreDart.IsGestureDetected].
  String IsGestureDetected(
    Gesture key,
  ) => 'IsGestureDetected($key)';

  /// Label for [RaylibCoreDart.GetGestureDetected].
  String GetGestureDetected() => 'GetGestureDetected()';

  /// Label for [RaylibCoreDart.GetGestureHoldDuration].
  String GetGestureHoldDuration() => 'GetGestureHoldDuration()';

  /// Label for [RaylibCoreDart.GetGestureDragVector].
  String GetGestureDragVector() => 'GetGestureDragVector()';

  /// Label for [RaylibCoreDart.GetGestureDragAngle].
  String GetGestureDragAngle() => 'GetGestureDragAngle()';

  /// Label for [RaylibCoreDart.GetGesturePinchVector].
  String GetGesturePinchVector() => 'GetGesturePinchVector()';

  /// Label for [RaylibCoreDart.GetGesturePinchAngle].
  String GetGesturePinchAngle() => 'GetGesturePinchAngle()';

  /// Label for [RaylibCoreDart.ProcessGestureEvent].
  String ProcessGestureEvent(
    GestureEvent event,
  ) => 'ProcessGestureEvent($event)';
  
  /// Label for [RaylibCoreDart.UpdateGestures].
  String UpdateGestures() => 'UpdateGestures()';
    
  /// Label for [RaylibCoreDart.UpdateCamera].
  String UpdateCamera(
    Camera3D camera,
    CameraMode mode,
  ) => 'UpdateCamera($camera, $mode)';

  /// Label for [RaylibCoreDart.UpdateCameraPro].
  String UpdateCameraPro(
    Camera3D camera,
    Vector3 movement,
    Vector3 rotation,
    num zoom,
  ) => 'UpdateCameraPro($camera, $movement, $rotation, $zoom)';

  /// Label for [RaylibCoreDart.SetShapesTexture].
  String SetShapesTexture(
    Texture texture,
    Rectangle source,
  ) => 'SetShapesTexture($texture, $source)';

  /// Label for [RaylibCoreDart.GetShapesTexture].
  String GetShapesTexture() => 'GetShapesTexture()';

  /// Label for [RaylibCoreDart.GetShapesTextureRectangle].
  String GetShapesTextureRectangle() => 'GetShapesTextureRectangle()';

  /// Label for [RaylibCoreDart.DrawPixel].
  String DrawPixel(
    num posX,
    num posY,
    Color color,
  ) => 'DrawPixel($posX, $posY, $color)';

  /// Label for [RaylibCoreDart.DrawPixelV].
  String DrawPixelV(
    Vector2 position,
    Color color,
  ) => 'DrawPixelV($position, $color)';
    
  /// Label for [RaylibCoreDart.DrawLine].
  String DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    Color color,
  ) => 'DrawLine($startPosX, $startPosY, $endPosX, $endPosY, $color)';

  /// Label for [RaylibCoreDart.DrawLineV].
  String DrawLineV(
    Vector2 startPos,
    Vector2 endPos,
    Color color,
  ) => 'DrawLineV($startPos, $endPos, $color)';

  /// Label for [RaylibCoreDart.DrawLineEx].
  String DrawLineEx(
    Vector2 startPos,
    Vector2 endPos,
    num thick,
    Color color,
  ) => 'DrawLineEx($startPos, $endPos, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawLineStrip].
  String DrawLineStrip(
    List<Vector2> points,
    Color color,
  ) => 'DrawLineStrip(points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.DrawLineBezier].
  String DrawLineBezier(
    Vector2 startPos,
    Vector2 endPos,
    num thick,
    Color color,
  ) => 'DrawLineBezier($startPos, $endPos, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawLineDashed].
  String DrawLineDashed(
    Vector2 startPos,
    Vector2 endPos,
    num dashSize,
    num spaceSize,
    Color color,
  ) => 'DrawLineDashed($startPos, $endPos, $dashSize, $spaceSize, $color)';

  /// Label for [RaylibCoreDart.DrawCircle].
  String DrawCircle(
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => 'DrawCircle($centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreDart.DrawCircleSector].
  String DrawCircleSector(
    Vector2 center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => 'DrawCircleSector($center, $radius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawCircleSectorLines].
  String DrawCircleSectorLines(
    Vector2 center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => 'DrawCircleSectorLines($center, $radius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawCircleGradient].
  String DrawCircleGradient(
    Vector2 center,
    num radius,
    Color inner,
    Color outer,
  ) => 'DrawCircleGradient($center, $radius, $inner, $outer)';

  /// Label for [RaylibCoreDart.DrawCircleV].
  String DrawCircleV(
    Vector2 center,
    num radius,
    Color color,
  ) => 'DrawCircleV($center, $radius, $color)';

  /// Label for [RaylibCoreDart.DrawCircleLines].
  String DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => 'DrawCircleLines($centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreDart.DrawCircleLinesV].
  String DrawCircleLinesV(
    Vector2 center,
    num radius,
    Color color,
  ) => 'DrawCircleLinesV($center, $radius, $color)';
    
  /// Label for [RaylibCoreDart.DrawEllipse].
  String DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    Color color,
  ) => 'DrawEllipse($centerX, $centerY, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreDart.DrawEllipseV].
  String DrawEllipseV(
    Vector2 center,
    num radiusH,
    num radiusV,
    Color color,
  ) => 'DrawEllipse($center, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreDart.DrawEllipseLines].
  String DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    Color color,
  ) => 'DrawEllipseLines($centerX, $centerY, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreDart.DrawEllipseLinesV].
  String DrawEllipseLinesV(
    Vector2 center,
    num radiusH,
    num radiusV,
    Color color,
  ) => 'DrawEllipseLinesV($center, $radiusH, $radiusV, $color)';

  /// Label for [RaylibCoreDart.DrawRing].
  String DrawRing(
    Vector2 center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => 'DrawRing($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawRingLines].
  String DrawRingLines(
    Vector2 center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    Color color,
  ) => 'DrawRingLines($center, $innerRadius, $outerRadius, $startAngle, $endAngle, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawRectangle].
  String DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    Color color,
  ) => 'DrawRectangle($posX, $posY, $width, $height, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleV].
  String DrawRectangleV(
    Vector2 position,
    Vector2 size,
    Color color,
  ) => 'DrawRectangleV($position, $size, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleRec].
  String DrawRectangleRec(
    Rectangle rec,
    Color color,
  ) => 'DrawRectangleRec($rec, $color)';
    
  /// Label for [RaylibCoreDart.DrawRectanglePro].
  String DrawRectanglePro(
    Rectangle rec,
    Vector2 origin,
    num rotation,
    Color color,
  ) => 'DrawRectanglePro($rec, $origin, $rotation, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleGradientV].
  String DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    Color top,
    Color bottom,
  ) => 'DrawRectangleGradientV($posX, $posY, $width, $height, $top, $bottom)';

  /// Label for [RaylibCoreDart.DrawRectangleGradientH].
  String DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    Color left,
    Color right,
  ) => 'DrawRectangleGradientH($posX, $posY, $width, $height, $left, $right)';

  /// Label for [RaylibCoreDart.DrawRectangleGradientEx].
  String DrawRectangleGradientEx(
    Rectangle rec,
    Color topLeft,
    Color bottomLeft,
    Color topRight,
    Color bottomRight,
  ) => 'DrawRectangleGradientEx($rec, $topLeft, $bottomLeft, $topRight, $bottomRight)';

  /// Label for [RaylibCoreDart.DrawRectangleLines].
  String DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    Color color,
  ) => 'DrawRectangleLines($posX, $posY, $width, $height, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleLinesEx].
  String DrawRectangleLinesEx(
    Rectangle rec,
    num lineThick,
    Color color,
  ) => 'DrawRectangleLinesEx($rec, $lineThick, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleRounded].
  String DrawRectangleRounded(
    Rectangle rec,
    num roundness,
    num segments,
    Color color,
  ) => 'DrawRectangleRounded($rec, $roundness, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleRoundedLines].
  String DrawRectangleRoundedLines(
    Rectangle rec,
    num roundness,
    num segments,
    Color color,
  ) => 'DrawRectangleRoundedLines($rec, $roundness, $segments, $color)';

  /// Label for [RaylibCoreDart.DrawRectangleRoundedLinesEx].
  String DrawRectangleRoundedLinesEx(
    Rectangle rec,
    num roundness,
    num segments,
    num lineThick,
    Color color,
  ) => 'DrawRectangleRoundedLinesEx($rec, $roundness, $segments, $lineThick, $color)';
    
  /// Label for [RaylibCoreDart.DrawTriangle].
  String DrawTriangle(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => 'DrawTriangle($v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreDart.DrawTriangleLines].
  String DrawTriangleLines(
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => 'DrawTriangleLines($v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreDart.DrawTriangleFan].
  String DrawTriangleFan(
    List<Vector2> points,
    Color color,
  ) => 'DrawTriangleFan(points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.DrawTriangleStrip].
  String DrawTriangleStrip(
    List<Vector2> points,
    Color color,
  ) => 'DrawTriangleStrip(points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.DrawPoly].
  String DrawPoly(
    Vector2 center,
    num sides,
    num radius,
    num rotation,
    Color color,
  ) => 'DrawPoly($center, $sides, $radius, $rotation, $color)';

  /// Label for [RaylibCoreDart.DrawPolyLines].
  String DrawPolyLines(
    Vector2 center,
    num sides,
    num radius,
    num rotation,
    Color color,
  ) => 'DrawPolyLines($center, $sides, $radius, $rotation, $color)';

  /// Label for [RaylibCoreDart.DrawPolyLinesEx].
  String DrawPolyLinesEx(
    Vector2 center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    Color color,
  ) => 'DrawPolyLinesEx($center, $sides, $radius, $rotation, $lineThick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineLinear].
  String DrawSplineLinear(
    List<Vector2> points,
    num thick,
    Color color,
  ) => 'DrawSplineLinear(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineBasis].
  String DrawSplineBasis(
    List<Vector2> points,
    num thick,
    Color color,
  ) => 'DrawSplineBasis(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineCatmullRom].
  String DrawSplineCatmullRom(
    List<Vector2> points,
    num thick,
    Color color,
  ) => 'DrawSplineCatmullRom(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineBezierQuadratic].
  String DrawSplineBezierQuadratic(
    List<Vector2> points,
    num thick,
    Color color,
  ) => 'DrawSplineBezierQuadratic(points: ${points.length}, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineBezierCubic].
  String DrawSplineBezierCubic(
    List<Vector2> points,
    num thick,
    Color color,
  ) => 'DrawSplineBezierCubic(points: ${points.length}, $thick, $color)';
    
  /// Label for [RaylibCoreDart.DrawSplineSegmentLinear].
  String DrawSplineSegmentLinear(
    Vector2 p1,
    Vector2 p2,
    num thick,
    Color color,
  ) => 'DrawSplineSegmentLinear($p1, $p2, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineSegmentBasis].
  String DrawSplineSegmentBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num thick,
    Color color,
  ) => 'DrawSplineSegmentBasis($p1, $p2, $p3, $p4, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineSegmentCatmullRom].
  String DrawSplineSegmentCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num thick,
    Color color,
  ) => 'DrawSplineSegmentCatmullRom($p1, $p2, $p3, $p4, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineSegmentBezierQuadratic].
  String DrawSplineSegmentBezierQuadratic(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    num thick,
    Color color,
  ) => 'DrawSplineSegmentBezierQuadratic($p1, $c2, $p3, $thick, $color)';

  /// Label for [RaylibCoreDart.DrawSplineSegmentBezierCubic].
  String DrawSplineSegmentBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    num thick,
    Color color,
  ) => 'DrawSplineSegmentBezierCubic($p1, $c2, $c3, $p4, $thick, $color)';

  /// Label for [RaylibCoreDart.GetSplinePointLinear].
  String GetSplinePointLinear(
    Vector2 startPos,
    Vector2 endPos,
    num t,
  ) => 'GetSplinePointLinear($startPos, $endPos, $t)';

  /// Label for [RaylibCoreDart.GetSplinePointBasis].
  String GetSplinePointBasis(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num t,
  ) => 'GetSplinePointBasis($p1, $p2, $p3, $p4, $t)';
    
  /// Label for [RaylibCoreDart.GetSplinePointCatmullRom].
  String GetSplinePointCatmullRom(
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
    Vector2 p4,
    num t,
  ) => 'GetSplinePointCatmullRom($p1, $p2, $p3, $p4, $t)';

  /// Label for [RaylibCoreDart.GetSplinePointBezierQuad].
  String GetSplinePointBezierQuad(
    Vector2 p1,
    Vector2 c2,
    Vector2 p3,
    num t,
  ) => 'GetSplinePointBezierQuad($p1, $c2, $p3, $t)';

  /// Label for [RaylibCoreDart.GetSplinePointBezierCubic].
  String GetSplinePointBezierCubic(
    Vector2 p1,
    Vector2 c2,
    Vector2 c3,
    Vector2 p4,
    num t,
  ) => 'GetSplinePointBezierCubic($p1, $c2, $c3, $p4, $t)';

  /// Label for [RaylibCoreDart.CheckCollisionRecs].
  String CheckCollisionRecs(
    Rectangle rec1,
    Rectangle rec2,
  ) => 'CheckCollisionRecs($rec1, $rec2)';

  /// Label for [RaylibCoreDart.CheckCollisionCircles].
  String CheckCollisionCircles(
    Vector2 center1,
    num radius1,
    Vector2 center2,
    num radius2,
  ) => 'CheckCollisionCircles($center1, $radius1, $center2, $radius2)';

  /// Label for [RaylibCoreDart.CheckCollisionCircleRec].
  String CheckCollisionCircleRec(
    Vector2 center,
    num radius,
    Rectangle rec,
  ) => 'CheckCollisionCircleRec($center, $radius, $rec)';

  /// Label for [RaylibCoreDart.CheckCollisionCircleLine].
  String CheckCollisionCircleLine(
    Vector2 center,
    num radius,
    Vector2 p1,
    Vector2 p2,
  ) => 'CheckCollisionCircleLine($center, $radius, $p1, $p2)';

  /// Label for [RaylibCoreDart.CheckCollisionPointRec].
  String CheckCollisionPointRec(
    Vector2 point,
    Rectangle rec,
  ) => 'CheckCollisionPointRec($point, $rec)';
    
  /// Label for [RaylibCoreDart.CheckCollisionPointCircle].
  String CheckCollisionPointCircle(
    Vector2 point,
    Vector2 center,
    num radius,
  ) => 'CheckCollisionPointCircle($point, $center, $radius)';

  /// Label for [RaylibCoreDart.CheckCollisionPointTriangle].
  String CheckCollisionPointTriangle(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    Vector2 p3,
  ) => 'CheckCollisionPointTriangle($point, $p1, $p2, $p3)';

  /// Label for [RaylibCoreDart.CheckCollisionPointLine].
  String CheckCollisionPointLine(
    Vector2 point,
    Vector2 p1,
    Vector2 p2,
    num threshold,
  ) => 'CheckCollisionPointLine($point, $p1, $p2, $threshold)';

  /// Label for [RaylibCoreDart.CheckCollisionPointPoly].
  String CheckCollisionPointPoly(
    Vector2 point,
    List<Vector2> points,
  ) => 'CheckCollisionPointPoly($point, points: ${points.length})';

  /// Label for [RaylibCoreDart.CheckCollisionLines].
  String CheckCollisionLines(
    Vector2 startPos1,
    Vector2 endPos1,
    Vector2 startPos2,
    Vector2 endPos2,
  ) => 'CheckCollisionLines($startPos1, $endPos1, $startPos2, $endPos2)';

  /// Label for [RaylibCoreDart.GetCollisionRec].
  String GetCollisionRec(
    Rectangle rec1,
    Rectangle rec2,
  ) => 'GetCollisionRec($rec1, $rec2)';

  /// Label for [RaylibCoreDart.LoadImage].
  String LoadImage(
    String fileName,
  ) => 'LoadImage($fileName)';
    
  /// Label for [RaylibCoreDart.LoadImageRaw].
  String LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => 'LoadImageRaw($fileName, $width, $height, ${format.name}, $headerSize)';

  /// Label for [RaylibCoreDart.LoadImageAnim].
  String LoadImageAnim(
    String fileName,
  ) => 'LoadImageAnim($fileName)';

  /// Label for [RaylibCoreDart.LoadImageAnimFromMemory].
  String LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageAnimFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibCoreDart.LoadImageFromMemory].
  String LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => 'LoadImageFromMemory($fileType, fileData: ${fileData.length})';

  /// Label for [RaylibCoreDart.LoadImageFromTexture].
  String LoadImageFromTexture(
    Texture texture,
  ) => 'LoadImageFromTexture($texture)';

  /// Label for [RaylibCoreDart.LoadImageFromScreen].
  String LoadImageFromScreen() => 'LoadImageFromScreen()';

  /// Label for [RaylibCoreDart.IsImageValid].
  String IsImageValid(
    Image image,
  ) => 'IsImageValid($image)';

  /// Label for [RaylibCoreDart.UnloadImage].
  String UnloadImage(
    Image image,
  ) => 'UnloadImage($image)';

  /// Label for [RaylibCoreDart.ExportImage].
  String ExportImage(
    Image image,
    String fileName,
  ) => 'ExportImage($image, $fileName)';
    
  /// Label for [RaylibCoreDart.ExportImageToMemory].
  String ExportImageToMemory(
    Image image,
    String fileType,
  ) => 'ExportImageToMemory($image, $fileType)';

  /// Label for [RaylibCoreDart.ExportImageAsCode].
  String ExportImageAsCode(
    Image image,
    String fileName,
  ) => 'ExportImageAsCode($image, $fileName)';

  /// Label for [RaylibCoreDart.GenImageColor].
  String GenImageColor(
    num width,
    num height,
    Color color,
  ) => 'GenImageColor($width, $height, $color)';

  /// Label for [RaylibCoreDart.GenImageGradientLinear].
  String GenImageGradientLinear(
    num width,
    num height,
    num direction,
    Color start,
    Color end,
  ) => 'GenImageGradientLinear($width, $height, $direction, $start, $end)';

  /// Label for [RaylibCoreDart.GenImageGradientRadial].
  String GenImageGradientRadial(
    num width,
    num height,
    num density,
    Color inner,
    Color outer,
  ) => 'GenImageGradientRadial($width, $height, $density, $inner, $outer)';

  /// Label for [RaylibCoreDart.GenImageGradientSquare].
  String GenImageGradientSquare(
    num width,
    num height,
    num density,
    Color inner,
    Color outer,
  ) => 'GenImageGradientSquare($width, $height, $density, $inner, $outer)';

  /// Label for [RaylibCoreDart.GenImageChecked].
  String GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    Color col1,
    Color col2,
  ) => 'GenImageChecked($width, $height, $checksX, $checksY, $col1, $col2)';

  /// Label for [RaylibCoreDart.GenImageWhiteNoise].
  String GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => 'GenImageWhiteNoise($width, $height, $factor)';

  /// Label for [RaylibCoreDart.GenImagePerlinNoise].
  String GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => 'GenImagePerlinNoise($width, $height, $offsetX, $offsetY, $scale)';
    
  /// Label for [RaylibCoreDart.GenImageCellular].
  String GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => 'GenImageCellular($width, $height, $tileSize)';

  /// Label for [RaylibCoreDart.GenImageText].
  String GenImageText(
    num width,
    num height,
    String text,
  ) => 'GenImageText($width, $height, $text)';

  /// Label for [RaylibCoreDart.ImageCopy].
  String ImageCopy(
    Image image,
  ) => 'ImageCopy($image)';

  /// Label for [RaylibCoreDart.ImageFromImage].
  String ImageFromImage(
    Image image,
    Rectangle rec,
  ) => 'ImageFromImage($image, $rec)';

  /// Label for [RaylibCoreDart.ImageFromChannel].
  String ImageFromChannel(
    Image image,
    num selectedChannel,
  ) => 'ImageFromChannel($image, $selectedChannel)';

  /// Label for [RaylibCoreDart.ImageText].
  String ImageText(
    String text,
    num fontSize,
    Color color,
  ) => 'ImageText($text, $fontSize, $color)';

  /// Label for [RaylibCoreDart.ImageTextEx].
  String ImageTextEx(
    Font font,
    String text,
    num fontSize,
    num spacing,
    Color tint,
  ) => 'ImageTextEx($font, $text, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreDart.ImageFormat].
  String ImageFormat(
    Image image,
    PixelFormat newFormat,
  ) => 'ImageFormat($image, ${newFormat.name})';
    
  /// Label for [RaylibCoreDart.ImageToPOT].
  String ImageToPOT(
    Image image,
    Color fill,
  ) => 'ImageToPOT($image, $fill)';

  /// Label for [RaylibCoreDart.ImageCrop].
  String ImageCrop(
    Image image,
    Rectangle crop,
  ) => 'ImageCrop($image, $crop)';

  /// Label for [RaylibCoreDart.ImageAlphaCrop].
  String ImageAlphaCrop(
    Image image,
    num threshold,
  ) => 'ImageAlphaCrop($image, $threshold)';

  /// Label for [RaylibCoreDart.ImageAlphaClear].
  String ImageAlphaClear(
    Image image,
    Color color,
    num threshold,
  ) => 'ImageAlphaClear($image, $color, $threshold)';

  /// Label for [RaylibCoreDart.ImageAlphaMask].
  String ImageAlphaMask(
    Image image,
    Image alphaMask,
  ) => 'ImageAlphaMask($image, $alphaMask)';

  /// Label for [RaylibCoreDart.ImageAlphaPremultiply].
  String ImageAlphaPremultiply(
    Image image,
  ) => 'ImageAlphaPremultiply($image)';

  /// Label for [RaylibCoreDart.ImageBlurGaussian].
  String ImageBlurGaussian(
    Image image,
    num blurSize,
  ) => 'ImageBlurGaussian($image, $blurSize)';

  /// Label for [RaylibCoreDart.ImageKernelConvolution].
  String ImageKernelConvolution(
    Image image,
    List<double> kernel,
  ) => 'ImageKernelConvolution($image, kernel: ${kernel.length})';

  /// Label for [RaylibCoreDart.ImageResize].
  String ImageResize(
    Image image,
    num newWidth,
    num newHeight,
  ) => 'ImageResize($image, $newWidth, $newHeight)';

  /// Label for [RaylibCoreDart.ImageResizeNN].
  String ImageResizeNN(
    Image image,
    num newWidth,
    num newHeight,
  ) => 'ImageResizeNN($image, $newWidth, $newHeight)';
    
  /// Label for [RaylibCoreDart.ImageResizeCanvas].
  String ImageResizeCanvas(
    Image image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    Color fill,
  ) => 'ImageResizeCanvas($image, $newWidth, $newHeight, $offsetX, $offsetY, $fill)';

  /// Label for [RaylibCoreDart.ImageMipmaps].
  String ImageMipmaps(
    Image image,
  ) => 'ImageMipmaps($image)';

  /// Label for [RaylibCoreDart.ImageDither].
  String ImageDither(
    Image image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => 'ImageDither($image, $rBpp, $gBpp, $bBpp, $aBpp)';

  /// Label for [RaylibCoreDart.ImageFlipVertical].
  String ImageFlipVertical(
    Image image,
  ) => 'ImageFlipVertical($image)';

  /// Label for [RaylibCoreDart.ImageFlipHorizontal].
  String ImageFlipHorizontal(
    Image image,
  ) => 'ImageFlipHorizontal($image)';

  /// Label for [RaylibCoreDart.ImageRotate].
  String ImageRotate(
    Image image,
    num degrees,
  ) => 'ImageRotate($image, $degrees)';

  /// Label for [RaylibCoreDart.ImageRotateCW].
  String ImageRotateCW(
    Image image,
  ) => 'ImageRotateCW($image)';

  /// Label for [RaylibCoreDart.ImageRotateCCW].
  String ImageRotateCCW(
    Image image,
  ) => 'ImageRotateCCW($image)';
    
  /// Label for [RaylibCoreDart.ImageColorTint].
  String ImageColorTint(
    Image image,
    Color color,
  ) => 'ImageColorTint($image, $color)';

  /// Label for [RaylibCoreDart.ImageColorInvert].
  String ImageColorInvert(
    Image image,
  ) => 'ImageColorInvert($image)';

  /// Label for [RaylibCoreDart.ImageColorGrayscale].
  String ImageColorGrayscale(
    Image image,
  ) => 'ImageColorGrayscale($image)';

  /// Label for [RaylibCoreDart.ImageColorContrast].
  String ImageColorContrast(
    Image image,
    num contrast,
  ) => 'ImageColorContrast($image, $contrast)';

  /// Label for [RaylibCoreDart.ImageColorBrightness].
  String ImageColorBrightness(
    Image image,
    num brightness,
  ) => 'ImageColorBrightness($image, $brightness)';

  /// Label for [RaylibCoreDart.ImageColorReplace].
  String ImageColorReplace(
    Image image,
    Color color,
    Color replace,
  ) => 'ImageColorReplace($image, $color, $replace)';

  /// Label for [RaylibCoreDart.LoadImageColors].
  String LoadImageColors(
    Image image,
  ) => 'LoadImageColors($image)';
  
  /// Label for [RaylibCoreDart.LoadImagePalette].
  String LoadImagePalette(
    Image image,
    num maxPaletteSize,
  ) => 'LoadImagePalette($image, $maxPaletteSize)';

  /// Label for [RaylibCoreDart.GetImageAlphaBorder].
  String GetImageAlphaBorder(
    Image image,
    num threshold,
  ) => 'GetImageAlphaBorder($image, $threshold)';

  /// Label for [RaylibCoreDart.GetImageColor].
  String GetImageColor(
    Image image,
    num x,
    num y,
  ) => 'GetImageColor($image, $x, $y)';

  /// Label for [RaylibCoreDart.ImageClearBackground].
  String ImageClearBackground(
    Image dst,
    Color color,
  ) => 'ImageClearBackground($dst, $color)';

  /// Label for [RaylibCoreDart.ImageDrawPixel].
  String ImageDrawPixel(
    Image dst,
    num posX,
    num posY,
    Color color,
  ) => 'ImageDrawPixel($dst, $posX, $posY, $color)';

  /// Label for [RaylibCoreDart.ImageDrawPixelV].
  String ImageDrawPixelV(
    Image dst,
    Vector2 position,
    Color color,
  ) => 'ImageDrawPixelV($dst, $position, $color)';
    
  /// Label for [RaylibCoreDart.ImageDrawLine].
  String ImageDrawLine(
    Image dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    Color color,
  ) => 'ImageDrawLine($dst, $startPosX, $startPosY, $endPosX, $endPosY, $color)';

  /// Label for [RaylibCoreDart.ImageDrawLineV].
  String ImageDrawLineV(
    Image dst,
    Vector2 start,
    Vector2 end,
    Color color,
  ) => 'ImageDrawLineV($dst, $start, $end, $color)';

  /// Label for [RaylibCoreDart.ImageDrawLineEx].
  String ImageDrawLineEx(
    Image dst,
    Vector2 start,
    Vector2 end,
    num thick,
    Color color,
  ) => 'ImageDrawLineEx($dst, $start, $end, $thick, $color)';

  /// Label for [RaylibCoreDart.ImageDrawCircle].
  String ImageDrawCircle(
    Image dst,
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => 'ImageDrawCircle($dst, $centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreDart.ImageDrawCircleV].
  String ImageDrawCircleV(
    Image dst,
    Vector2 center,
    num radius,
    Color color,
  ) => 'ImageDrawCircleV($dst, $center, $radius, $color)';

  /// Label for [RaylibCoreDart.ImageDrawCircleLines].
  String ImageDrawCircleLines(
    Image dst,
    num centerX,
    num centerY,
    num radius,
    Color color,
  ) => 'ImageDrawCircleLines($dst, $centerX, $centerY, $radius, $color)';

  /// Label for [RaylibCoreDart.ImageDrawCircleLinesV].
  String ImageDrawCircleLinesV(
    Image dst,
    Vector2 center,
    num radius,
    Color color,
  ) => 'ImageDrawCircleLinesV($dst, $center, $radius, $color)';

  /// Label for [RaylibCoreDart.ImageDrawRectangle].
  String ImageDrawRectangle(
    Image dst,
    num posX,
    num posY,
    num width,
    num height,
    Color color,
  ) => 'ImageDrawRectangle($dst, $posX, $posY, $width, $height, $color)';
    
  /// Label for [RaylibCoreDart.ImageDrawRectangleV].
  String ImageDrawRectangleV(
    Image dst,
    Vector2 position,
    Vector2 size,
    Color color,
  ) => 'ImageDrawRectangleV($dst, $position, $size, $color)';

  /// Label for [RaylibCoreDart.ImageDrawRectangleRec].
  String ImageDrawRectangleRec(
    Image dst,
    Rectangle rec,
    Color color,
  ) => 'ImageDrawRectangleRec($dst, $rec, $color)';

  /// Label for [RaylibCoreDart.ImageDrawRectangleLines].
  String ImageDrawRectangleLines(
    Image dst,
    Rectangle rec,
    num thick,
    Color color,
  ) => 'ImageDrawRectangleLines($dst, $rec, $thick, $color)';

  /// Label for [RaylibCoreDart.ImageDrawTriangle].
  String ImageDrawTriangle(
    Image dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => 'ImageDrawTriangle($dst, $v1, $v2, $v3, $color)';

  /// Label for [RaylibCoreDart.ImageDrawTriangleEx].
  String ImageDrawTriangleEx(
    Image dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color c1,
    Color c2,
    Color c3,
  ) => 'ImageDrawTriangleEx($dst, $v1, $v2, $v3, $c1, $c2, $c3)';

  /// Label for [RaylibCoreDart.ImageDrawTriangleLines].
  String ImageDrawTriangleLines(
    Image dst,
    Vector2 v1,
    Vector2 v2,
    Vector2 v3,
    Color color,
  ) => 'ImageDrawTriangleLines($dst, $v1, $v2, $v3, $color)';
    
  /// Label for [RaylibCoreDart.ImageDrawTriangleFan].
  String ImageDrawTriangleFan(
    Image dst,
    List<Vector2> points,
    Color color,
  ) => 'ImageDrawTriangleFan($dst, points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.ImageDrawTriangleStrip].
  String ImageDrawTriangleStrip(
    Image dst,
    List<Vector2> points,
    Color color,
  ) => 'ImageDrawTriangleStrip($dst, points: ${points.length}, $color)';

  /// Label for [RaylibCoreDart.ImageDraw].
  String ImageDraw(
    Image dst,
    Image src,
    Rectangle srcRec,
    Rectangle dstRec,
    Color tint,
  ) => 'ImageDraw($dst, $src, $srcRec, $dstRec, $tint)';

  /// Label for [RaylibCoreDart.ImageDrawText].
  String ImageDrawText(
    Image dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    Color color,
  ) => 'ImageDrawText($dst, $text, $posX, $posY, $fontSize, $color)';

  /// Label for [RaylibCoreDart.ImageDrawTextEx].
  String ImageDrawTextEx(
    Image dst,
    Font font,
    String text,
    Vector2 position,
    num fontSize,
    num spacing,
    Color tint,
  ) => 'ImageDrawTextEx($dst, $font, $text, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreDart.LoadTexture].
  String LoadTexture(
    String fileName,
  ) => 'LoadTexture($fileName)';

  /// Label for [RaylibCoreDart.LoadTextureFromImage].
  String LoadTextureFromImage(
    Image image,
  ) => 'LoadTextureFromImage($image)';

  /// Label for [RaylibCoreDart.LoadTextureCubemap].
  String LoadTextureCubemap(
    Image image,
    CubemapLayout layout,
  ) => 'LoadTextureCubemap($image, $layout)';

  /// Label for [RaylibCoreDart.LoadRenderTexture].
  String LoadRenderTexture(
    num width,
    num height,
  ) => 'LoadRenderTexture($width, $height)';

  /// Label for [RaylibCoreDart.IsTextureValid].
  String IsTextureValid(
    Texture texture,
  ) => 'IsTextureValid($texture)';

  /// Label for [RaylibCoreDart.UnloadTexture].
  String UnloadTexture(
    Texture texture,
  ) => 'UnloadTexture($texture)';

  /// Label for [RaylibCoreDart.IsRenderTextureValid].
  String IsRenderTextureValid(
    RenderTexture target,
  ) => 'IsRenderTextureValid($target)';

  /// Label for [RaylibCoreDart.UnloadRenderTexture].
  String UnloadRenderTexture(
    RenderTexture target,
  ) => 'UnloadRenderTexture($target)';

  /// Label for [RaylibCoreDart.UpdateTexture].
  String UpdateTexture(
    Texture texture,
    Uint8List pixels,
  ) => 'UpdateTexture($texture, pixels: ${pixels.length})';
    
  /// Label for [RaylibCoreDart.UpdateTextureRec].
  String UpdateTextureRec(
    Texture texture,
    Rectangle rec,
    Uint8List pixels,
  ) => 'UpdateTextureRec($texture, $rec, pixels: ${pixels.length})';

  /// Label for [RaylibCoreDart.GenTextureMipmaps].
  String GenTextureMipmaps(
    Texture texture,
  ) => 'GenTextureMipmaps($texture)';

  /// Label for [RaylibCoreDart.SetTextureFilter].
  String SetTextureFilter(
    Texture texture,
    TextureFilter filter,
  ) => 'SetTextureFilter($texture, $filter)';

  /// Label for [RaylibCoreDart.SetTextureWrap].
  String SetTextureWrap(
    Texture texture,
    TextureWrap wrap,
  ) => 'SetTextureWrap($texture, $wrap)';

  /// Label for [RaylibCoreDart.DrawTexture].
  String DrawTexture(
    Texture texture,
    num posX,
    num posY,
    Color tint,
  ) => 'DrawTexture($texture, $posX, $posY, $tint)';

  /// Label for [RaylibCoreDart.DrawTextureV].
  String DrawTextureV(
    Texture texture,
    Vector2 position,
    Color tint,
  ) => 'DrawTextureV($texture, $position, $tint)';
    
  /// Label for [RaylibCoreDart.DrawTextureEx].
  String DrawTextureEx(
    Texture texture,
    Vector2 position,
    num rotation,
    num scale,
    Color tint,
  ) => 'DrawTextureEx($texture, $position, $rotation, $scale, $tint)';

  /// Label for [RaylibCoreDart.DrawTextureRec].
  String DrawTextureRec(
    Texture texture,
    Rectangle source,
    Vector2 position,
    Color tint,
  ) => 'DrawTextureRec($texture, $source, $position, $tint)';

  /// Label for [RaylibCoreDart.DrawTexturePro].
  String DrawTexturePro(
    Texture texture,
    Rectangle source,
    Rectangle dest,
    Vector2 origin,
    num rotation,
    Color tint,
  ) => 'DrawTexturePro($texture, $source, $dest, $origin, $rotation, $tint)';

  /// Label for [RaylibCoreDart.DrawTextureNPatch].
  String DrawTextureNPatch(
    Texture texture,
    NPatchInfo nPatchInfo,
    Rectangle dest,
    Vector2 origin,
    num rotation,
    Color tint,
  ) => 'DrawTextureNPatch($texture, $nPatchInfo, $dest, $origin, $rotation, $tint)';

  /// Label for [RaylibCoreDart.ColorIsEqual].
  String ColorIsEqual(
    Color col1,
    Color col2,
  ) => 'ColorIsEqual($col1, $col2)';

  /// Label for [RaylibCoreDart.Fade].
  String Fade(
    Color color,
    num alpha,
  ) => 'Fade($color, $alpha)';

  /// Label for [RaylibCoreDart.ColorToInt].
  String ColorToInt(
    Color color,
  ) => 'ColorToInt($color)';

  /// Label for [RaylibCoreDart.ColorNormalize].
  String ColorNormalize(
    Color color,
  ) => 'ColorNormalize($color)';

  /// Label for [RaylibCoreDart.ColorFromNormalized].
  String ColorFromNormalized(
    Vector4 normalized,
  ) => 'ColorFromNormalized($normalized)';

  /// Label for [RaylibCoreDart.ColorToHSV].
  String ColorToHSV(
    Color color,
  ) => 'ColorToHSV($color)';

  /// Label for [RaylibCoreDart.ColorFromHSV].
  String ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => 'ColorFromHSV($hue, $saturation, $value)';

  /// Label for [RaylibCoreDart.ColorTint].
  String ColorTint(
    Color color,
    Color tint,
  ) => 'ColorTint($color, $tint)';

  /// Label for [RaylibCoreDart.ColorBrightness].
  String ColorBrightness(
    Color color,
    num factor,
  ) => 'ColorBrightness($color, $factor)';

  /// Label for [RaylibCoreDart.ColorContrast].
  String ColorContrast(
    Color color,
    num contrast,
  ) => 'ColorContrast($color, $contrast)';

  /// Label for [RaylibCoreDart.ColorAlpha].
  String ColorAlpha(
    Color color,
    num alpha,
  ) => 'ColorAlpha($color, $alpha)';

  /// Label for [RaylibCoreDart.ColorAlphaBlend].
  String ColorAlphaBlend(
    Color dst,
    Color src,
    Color tint,
  ) => 'ColorAlphaBlend($dst, $src, $tint)';

  /// Label for [RaylibCoreDart.ColorLerp].
  String ColorLerp(
    Color color1,
    Color color2,
    num factor,
  ) => 'ColorLerp($color1, $color2, $factor)';

  /// Label for [RaylibCoreDart.GetColor].
  String GetColor(
    num hexValue,
  ) => 'GetColor($hexValue)';

  /// Label for [RaylibCoreDart.GetPixelDataSize].
  String GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => 'GetPixelDataSize($width, $height, $format)';

  /// Label for [RaylibCoreDart.GetFontDefault].
  String GetFontDefault() => 'GetFontDefault()';

  /// Label for [RaylibCoreDart.LoadFont].
  String LoadFont(
    String fileName,
  ) => 'LoadFont($fileName)';
    
  /// Label for [RaylibCoreDart.LoadFontEx].
  String LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codepointCount,
    ]
  ) => 'LoadFontEx($fileName, $fontSize, codepoints: ${codepointCount ?? codepoints?.length})';

  /// Label for [RaylibCoreDart.LoadFontFromImage].
  String LoadFontFromImage(
    Image image,
    Color key,
    num firstChar,
  ) => 'LoadFontFromImage($image, $key, $firstChar)';

  /// Label for [RaylibCoreDart.LoadFontFromMemory].
  String LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => 'LoadFontFromMemory($fileType, fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints.length})';

  /// Label for [RaylibCoreDart.IsFontValid].
  String IsFontValid(
    Font font,
  ) => 'IsFontValid($font)';

  /// Label for [RaylibCoreDart.LoadFontData].
  String LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) => 'LoadFontData(fileData: ${fileData.length}, $fontSize, codepoints: ${codepoints?.length}, $type)';

  /// Label for [RaylibCoreDart.GenImageFontAtlas].
  String GenImageFontAtlas(
    List<GlyphInfo> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => 'GenImageFontAtlas(glyphs: ${glyphs.length}, $fontSize, $padding, $packMethod)';

  /// Label for [RaylibCoreDart.UnloadFontData].
  String UnloadFontData(
    List<GlyphInfo> glyphs,
  ) => 'UnloadFontData(glyphs: ${glyphs.length})';
    
  /// Label for [RaylibCoreDart.UnloadFont].
  String UnloadFont(
    Font font,
  ) => 'UnloadFont($font)';

  /// Label for [RaylibCoreDart.ExportFontAsCode].
  String ExportFontAsCode(
    Font font,
    String fileName,
  ) => 'ExportFontAsCode($font, $fileName)';

  /// Label for [RaylibCoreDart.DrawFPS].
  String DrawFPS(
    num posX,
    num posY,
  ) => 'DrawFPS($posX, $posY)';

  /// Label for [RaylibCoreDart.DrawText].
  String DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    Color color,
  ) => 'DrawText($text, $posX, $posY, $fontSize, $color)';

  /// Label for [RaylibCoreDart.DrawTextEx].
  String DrawTextEx(
    Font font,
    String text,
    Vector2 position,
    num fontSize,
    num spacing,
    Color tint,
  ) => 'DrawTextEx($font, $text, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreDart.DrawTextPro].
  String DrawTextPro(
    Font font,
    String text,
    Vector2 position,
    Vector2 origin,
    num rotation,
    num fontSize,
    num spacing,
    Color tint,
  ) => 'DrawTextPro($font, $text, $position, $origin, $rotation, $fontSize, $spacing, $tint)';
    
  /// Label for [RaylibCoreDart.DrawTextCodepoint].
  String DrawTextCodepoint(
    Font font,
    num codepoint,
    Vector2 position,
    num fontSize,
    Color tint,
  ) => 'DrawTextCodepoint($font, $codepoint, $position, $fontSize, $tint)';

  /// Label for [RaylibCoreDart.DrawTextCodepoints].
  String DrawTextCodepoints(
    Font font,
    Int32List codepoints,
    Vector2 position,
    num fontSize,
    num spacing,
    Color tint,
  ) => 'DrawTextCodepoints($font, codepoints: ${codepoints.length}, $position, $fontSize, $spacing, $tint)';

  /// Label for [RaylibCoreDart.SetTextLineSpacing].
  String SetTextLineSpacing(
    num spacing,
  ) => 'SetTextLineSpacing($spacing)';

  /// Label for [RaylibCoreDart.MeasureText].
  String MeasureText(
    String text,
    num fontSize,
  ) => 'MeasureText($text, $fontSize)';
    
  /// Label for [RaylibCoreDart.MeasureTextEx].
  String MeasureTextEx(
    Font font,
    String text,
    num fontSize,
    num spacing,
  ) => 'MeasureTextEx($font, $text, $fontSize, $spacing)';

  /// Label for [RaylibCoreDart.MeasureTextCodepoints].
  String MeasureTextCodepoints(
    Font font,
    Int32List codepoints,
    num fontSize,
    num spacing,
  ) => 'MeasureTextCodepoints($font, ${codepoints.length}, $fontSize, $spacing)';

  /// Label for [RaylibCoreDart.GetGlyphIndex].
  String GetGlyphIndex(
    Font font,
    num codepoint,
  ) => 'GetGlyphIndex($font, $codepoint)';

  /// Label for [RaylibCoreDart.GetGlyphInfo].
  String GetGlyphInfo(
    Font font,
    num codepoint,
  ) => 'GetGlyphInfo($font, $codepoint)';

  /// Label for [RaylibCoreDart.GetGlyphAtlasRec].
  String GetGlyphAtlasRec(
    Font font,
    num codepoint,
  ) => 'GetGlyphAtlasRec($font, $codepoint)';
    
  /// Label for [RaylibCoreDart.LoadUTF8].
  String LoadUTF8(
    Int32List codepoints,
  ) => 'LoadUTF8(codepoints: ${codepoints.length})';

  /// Label for [RaylibCoreDart.LoadCodepoints].
  String LoadCodepoints(
    String text,
  ) => 'LoadCodepoints($text)';

  /// Label for [RaylibCoreDart.GetCodepointCount].
  String GetCodepointCount(
    String text,
  ) => 'GetCodepointCount($text)';

  /// Label for [RaylibCoreDart.GetCodepoint].
  String GetCodepoint(
    String text,
  ) => 'GetCodepoint($text)';

  /// Label for [RaylibCoreDart.GetCodepointNext].
  String GetCodepointNext(
    String text,
  ) => 'GetCodepointNext($text)';

  /// Label for [RaylibCoreDart.GetCodepointPrevious].
  String GetCodepointPrevious(
    String text,
  ) => 'GetCodepointPrevious($text)';

  /// Label for [RaylibCoreDart.CodepointToUTF8].
  String CodepointToUTF8(
    num codepoint,
  ) => 'CodepointToUTF8($codepoint)';

  /// Label for [RaylibCoreDart.LoadTextLines].
  String LoadTextLines(
    String text,
  ) => 'LoadTextLines($text)';
  
  /// Label for [RaylibCoreDart.TextIsEqual].
  String TextIsEqual(
    String text1,
    String text2,
  ) => 'TextIsEqual($text1, $text2)';

  /// Label for [RaylibCoreDart.TextLength].
  String TextLength(
    String text,
  ) => 'TextLength($text)';

  /// Label for [RaylibCoreDart.TextFormat].
  String TextFormat(
    String text, [
      List<Object?> args = const [],
    ]
  ) => 'TextFormat($text, $args)';

  /// Label for [RaylibCoreDart.TextSubtext].
  String TextSubtext(
    String text,
    int position,
    int length,
  ) => 'TextSubtext($text, $position, $length)';

  /// Label for [RaylibCoreDart.TextRemoveSpaces].
  String TextRemoveSpaces(
    String text,
  ) => 'TextRemoveSpaces($text)';

  /// Label for [RaylibCoreDart.GetTextBetween].
  String GetTextBetween(
    String text,
    String begin,
    String end,
  ) => 'GetTextBetween($text, $begin, $end)';

  /// Label for [RaylibCoreDart.TextReplace].
  String TextReplace(
    String text,
    String search,
    String replacement,
  ) => 'TextReplace($text, $search, $replacement)';

  /// Label for [RaylibCoreDart.TextReplaceBetween].
  String TextReplaceBetween(
    String text,
    String begin,
    String end,
    String replacement,
  ) => 'TextReplaceBetween($text, $begin, $end, $replacement)';

  /// Label for [RaylibCoreDart.TextInsert].
  String TextInsert(
    String text,
    String insert,
    int position,
  ) => 'TextInsert($text, $insert, $position)';

  /// Label for [RaylibCoreDart.TextJoin].
  String TextJoin(
    List<String> textList,
    String delimiter,
  ) => 'TextJoin(textList: ${textList.length}, $delimiter)';

  /// Label for [RaylibCoreDart.TextSplit].
  String TextSplit(
    String text,
    String delimiter,
  ) => 'TextSplit($text, $delimiter)';

  /// Label for [RaylibCoreDart.TextAppend].
  String TextAppend(
    String text,
    String append,
  ) => 'TextAppend($text, $append)';

  /// Label for [RaylibCoreDart.TextFindIndex].
  String TextFindIndex(
    String text,
    String search,
  ) => 'TextFindIndex($text, $search)';

  /// Label for [RaylibCoreDart.TextToUpper].
  String TextToUpper(
    String text,
  ) => 'TextToUpper($text)';
  
  /// Label for [RaylibCoreDart.TextToLower].
  String TextToLower(
    String text,
  ) => 'TextToLower($text)';
  
  /// Label for [RaylibCoreDart.TextToPascal].
  String TextToPascal(
    String text,
  ) => 'TextToPascal($text)';
  
  /// Label for [RaylibCoreDart.TextToSnake].
  String TextToSnake(
    String text,
  ) => 'TextToSnake($text)';
  
  /// Label for [RaylibCoreDart.TextToCamel].
  String TextToCamel(
    String text,
  ) => 'TextToCamel($text)';

  /// Label for [RaylibCoreDart.TextToInteger].
  String TextToInteger(
    String text,
  ) => 'TextToInteger($text)';
  
  /// Label for [RaylibCoreDart.TextToFloat].
  String TextToFloat(
    String text,
  ) => 'TextToFloat($text)';
    
  /// Label for [RaylibCoreDart.DrawLine3D].
  String DrawLine3D(
    Vector3 startPos,
    Vector3 endPos,
    Color color,
  ) => 'DrawLine3D($startPos, $endPos, $color)';
    
  /// Label for [RaylibCoreDart.DrawPoint3D].
  String DrawPoint3D(
    Vector3 position,
    Color color,
  ) => 'DrawPoint3D($position, $color)';
    
  /// Label for [RaylibCoreDart.DrawCircle3D].
  String DrawCircle3D(
    Vector3 center,
    num radius,
    Vector3 rotationAxis,
    num rotationAngle,
    Color color,
  ) => 'DrawCircle3D($center, $radius, $rotationAxis, $rotationAngle, $color)';
    
  /// Label for [RaylibCoreDart.DrawTriangle3D].
  String DrawTriangle3D(
    Vector3 v1,
    Vector3 v2,
    Vector3 v3,
    Color color,
  ) => 'DrawTriangle3D($v1, $v2, $v3, $color)';
    
  /// Label for [RaylibCoreDart.DrawTriangleStrip3D].
  String DrawTriangleStrip3D(
    List<Vector3> points,
    Color color,
  ) => 'DrawTriangleStrip3D(points: ${points.length}, $color)';
    
  /// Label for [RaylibCoreDart.DrawCube].
  String DrawCube(
    Vector3 position,
    num width,
    num height,
    num length,
    Color color,
  ) => 'DrawCube($position, $width, $height, $length, $color)';
    
  /// Label for [RaylibCoreDart.DrawCubeV].
  String DrawCubeV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => 'DrawCubeV($position, $size, $color)';
    
  /// Label for [RaylibCoreDart.DrawCubeWires].
  String DrawCubeWires(
    Vector3 position,
    num width,
    num height,
    num length,
    Color color,
  ) => 'DrawCubeWires($position, $width, $height, $length, $color)';
    
  /// Label for [RaylibCoreDart.DrawCubeWiresV].
  String DrawCubeWiresV(
    Vector3 position,
    Vector3 size,
    Color color,
  ) => 'DrawCubeWiresV($position, $size, $color)';
    
  /// Label for [RaylibCoreDart.DrawSphere].
  String DrawSphere(
    Vector3 centerPos,
    num radius,
    Color color,
  ) => 'DrawSphere($centerPos, $radius, $color)';
    
  /// Label for [RaylibCoreDart.DrawSphereEx].
  String DrawSphereEx(
    Vector3 centerPos,
    num radius,
    num rings,
    num slices,
    Color color,
  ) => 'DrawSphereEx($centerPos, $radius, $rings, $slices, $color)';
    
  /// Label for [RaylibCoreDart.DrawSphereWires].
  String DrawSphereWires(
    Vector3 centerPos,
    num radius,
    num rings,
    num slices,
    Color color,
  ) => 'DrawSphereWires($centerPos, $radius, $rings, $slices, $color)';
    
  /// Label for [RaylibCoreDart.DrawCylinder].
  String DrawCylinder(
    Vector3 position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    Color color,
  ) => 'DrawCylinder($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  /// Label for [RaylibCoreDart.DrawCylinderEx].
  String DrawCylinderEx(
    Vector3 startPos,
    Vector3 endPos,
    num startRadius,
    num endRadius,
    num sides,
    Color color,
  ) => 'DrawCylinderEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  /// Label for [RaylibCoreDart.DrawCylinderWires].
  String DrawCylinderWires(
    Vector3 position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    Color color,
  ) => 'DrawCylinderWires($position, $radiusTop, $radiusBottom, $height, $slices, $color)';
    
  /// Label for [RaylibCoreDart.DrawCylinderWiresEx].
  String DrawCylinderWiresEx(
    Vector3 startPos,
    Vector3 endPos,
    num startRadius,
    num endRadius,
    num sides,
    Color color,
  ) => 'DrawCylinderWiresEx($startPos, $endPos, $startRadius, $endRadius, $sides, $color)';
    
  /// Label for [RaylibCoreDart.DrawCapsule].
  String DrawCapsule(
    Vector3 startPos,
    Vector3 endPos,
    num radius,
    num slices,
    num rings,
    Color color,
  ) => 'DrawCapsule($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  /// Label for [RaylibCoreDart.DrawCapsuleWires].
  String DrawCapsuleWires(
    Vector3 startPos,
    Vector3 endPos,
    num radius,
    num slices,
    num rings,
    Color color,
  ) => 'DrawCapsuleWires($startPos, $endPos, $radius, $slices, $rings, $color)';
    
  /// Label for [RaylibCoreDart.DrawPlane].
  String DrawPlane(
    Vector3 centerPos,
    Vector2 size,
    Color color,
  ) => 'DrawPlane($centerPos, $size, $color)';
    
  /// Label for [RaylibCoreDart.DrawRay].
  String DrawRay(
    Ray ray,
    Color color,
  ) => 'DrawRay($ray, $color)';
    
  /// Label for [RaylibCoreDart.DrawGrid].
  String DrawGrid(
    num slices,
    num spacing,
  ) => 'DrawGrid($slices, $spacing)';
    
  /// Label for [RaylibCoreDart.LoadModel].
  String LoadModel(
    String fileName,
  ) => 'LoadModel($fileName)';
    
  /// Label for [RaylibCoreDart.LoadModelFromMesh].
  String LoadModelFromMesh(
    Mesh mesh,
  ) => 'LoadModelFromMesh($mesh)';
    
  /// Label for [RaylibCoreDart.IsModelValid].
  String IsModelValid(
    Model model,
  ) => 'IsModelValid($model)';
    
  /// Label for [RaylibCoreDart.UnloadModel].
  String UnloadModel(
    Model model,
  ) => 'UnloadModel($model)';
    
  /// Label for [RaylibCoreDart.GetModelBoundingBox].
  String GetModelBoundingBox(
    Model model,
  ) => 'GetModelBoundingBox($model)';
    
  /// Label for [RaylibCoreDart.DrawModel].
  String DrawModel(
    Model model,
    Vector3 position,
    num scale,
    Color tint
  ) => 'DrawModel($model, $position, $scale, $tint)';
    
  /// Label for [RaylibCoreDart.DrawModelEx].
  String DrawModelEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    num rotationAngle,
    Vector3 scale,
    Color tint,
  ) => 'DrawModelEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  /// Label for [RaylibCoreDart.DrawModelWires].
  String DrawModelWires(
    Model model,
    Vector3 position,
    num scale,
    Color tint,
  ) => 'DrawModelWires($model, $position, $scale, $tint)';
    
  /// Label for [RaylibCoreDart.DrawModelWiresEx].
  String DrawModelWiresEx(
    Model model,
    Vector3 position,
    Vector3 rotationAxis,
    num rotationAngle,
    Vector3 scale,
    Color tint,
  ) => 'DrawModelWiresEx($model, $position, $rotationAxis, $rotationAngle, $scale, $tint)';
    
  /// Label for [RaylibCoreDart.DrawBoundingBox].
  String DrawBoundingBox(
    BoundingBox box,
    Color color,
  ) => 'DrawBoundingBox($box, $color)';

  /// Label for [RaylibCoreDart.DrawBillboard].
  String DrawBillboard(
    Camera3D camera,
    Texture texture,
    Vector3 position,
    num scale,
    Color tint,
  ) => 'DrawBillboard($camera, $texture, $position, $scale, $tint)';

  /// Label for [RaylibCoreDart.DrawBillboardRec].
  String DrawBillboardRec(
    Camera3D camera,
    Texture texture,
    Rectangle source,
    Vector3 position,
    Vector2 size,
    Color tint,
  ) => 'DrawBillboardRec($camera, $texture, $source, $position, $size, $tint)';

  /// Label for [RaylibCoreDart.DrawBillboardPro].
  String DrawBillboardPro(
    Camera3D camera,
    Texture texture,
    Rectangle source,
    Vector3 position,
    Vector3 up,
    Vector2 size,
    Vector2 origin,
    num rotation,
    Color tint,
  ) => 'DrawBillboardPro($camera, $texture, $source, $position, $up, $size, $origin, $rotation, $tint)';
  
  /// Label for [RaylibCoreDart.UploadMesh].
  String UploadMesh(
    Mesh mesh,
    bool dynamic,
  ) => 'UploadMesh($mesh, $dynamic)';
    
  /// Label for [RaylibCoreDart.UpdateMeshBuffer].
  String UpdateMeshBuffer(
    Mesh mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => 'UpdateMeshBuffer($mesh, $index, data: ${data.length}, $offset)';
    
  /// Label for [RaylibCoreDart.UnloadMesh].
  String UnloadMesh(
    Mesh mesh,
  ) => 'UnloadMesh($mesh)';
    
  /// Label for [RaylibCoreDart.DrawMesh].
  String DrawMesh(
    Mesh mesh,
    Material material,
    Matrix transform,
  ) => 'DrawMesh($mesh, $material, transform: $transform)';
    
  /// Label for [RaylibCoreDart.DrawMeshInstanced].
  String DrawMeshInstanced(
    Mesh mesh,
    Material material,
    List<Matrix> transforms,
  ) => 'DrawMeshInstanced($mesh, $material, transforms: ${transforms.length})';
    
  /// Label for [RaylibCoreDart.GetMeshBoundingBox].
  String GetMeshBoundingBox(
    Mesh mesh,
  ) => 'GetMeshBoundingBox($mesh)';
    
  /// Label for [RaylibCoreDart.GenMeshTangents].
  String GenMeshTangents(
    Mesh mesh,
  ) => 'GenMeshTangents($mesh)';
    
  /// Label for [RaylibCoreDart.ExportMesh].
  String ExportMesh(
    Mesh mesh,
    String fileName,
  ) => 'ExportMesh($mesh, $fileName)';
    
  /// Label for [RaylibCoreDart.ExportMeshAsCode].
  String ExportMeshAsCode(
    Mesh mesh,
    String fileName,
  ) => 'ExportMeshAsCode($mesh, $fileName)';
    
  /// Label for [RaylibCoreDart.GenMeshPoly].
  String GenMeshPoly(
    num sides,
    num radius,
  ) => 'GenMeshPoly($sides, $radius)';
    
  /// Label for [RaylibCoreDart.GenMeshPlane].
  String GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => 'GenMeshPlane($width, $length, $resX, $resZ)';
    
  /// Label for [RaylibCoreDart.GenMeshCube].
  String GenMeshCube(
    num width,
    num height,
    num length,
  ) => 'GenMeshCube($width, $height, $length)';
    
  /// Label for [RaylibCoreDart.GenMeshSphere].
  String GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshSphere($radius, $rings, $slices)';
    
  /// Label for [RaylibCoreDart.GenMeshHemiSphere].
  String GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => 'GenMeshHemiSphere($radius, $rings, $slices)';
    
  /// Label for [RaylibCoreDart.GenMeshCylinder].
  String GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCylinder($radius, $height, $slices)';
    
  /// Label for [RaylibCoreDart.GenMeshCone].
  String GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => 'GenMeshCone($radius, $height, $slices)';
    
  /// Label for [RaylibCoreDart.GenMeshTorus].
  String GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshTorus($radius, $size, $radSeg, $sides)';
    
  /// Label for [RaylibCoreDart.GenMeshKnot].
  String GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => 'GenMeshKnot($radius, $size, $radSeg, $sides)';
    
  /// Label for [RaylibCoreDart.GenMeshHeightmap].
  String GenMeshHeightmap(
    Image heightmap,
    Vector3 size,
  ) => 'GenMeshHeightmap($heightmap, $size)';
    
  /// Label for [RaylibCoreDart.GenMeshCubicmap].
  String GenMeshCubicmap(
    Image cubicmap,
    Vector3 cubeSize,
  ) => 'GenMeshCubicmap($cubicmap, $cubeSize)';
    
  /// Label for [RaylibCoreDart.LoadMaterials].
  String LoadMaterials(
    String fileName,
  ) => 'LoadMaterials($fileName)';
    
  /// Label for [RaylibCoreDart.LoadMaterialDefault].
  String LoadMaterialDefault() => 'LoadMaterialDefault()';
    
  /// Label for [RaylibCoreDart.IsMaterialValid].
  String IsMaterialValid(
    Material material,
  ) => 'IsMaterialValid($material)';
    
  /// Label for [RaylibCoreDart.UnloadMaterial].
  String UnloadMaterial(
    Material material,
  ) => 'UnloadMaterial($material)';
    
  /// Label for [RaylibCoreDart.SetMaterialTexture].
  String SetMaterialTexture(
    Material material,
    MaterialMapIndex mapType,
    Texture texture,
  ) => 'SetMaterialTexture($material, ${mapType.name}, $texture)';
    
  /// Label for [RaylibCoreDart.SetModelMeshMaterial].
  String SetModelMeshMaterial(
    Model model,
    num meshId,
    num materialId,
  ) => 'SetModelMeshMaterial($model, $meshId, $materialId)';
    
  /// Label for [RaylibCoreDart.LoadModelAnimations].
  String LoadModelAnimations(
    String fileName,
  ) => 'LoadModelAnimations($fileName)';
    
  /// Label for [RaylibCoreDart.UpdateModelAnimation].
  String UpdateModelAnimation(
    Model model,
    ModelAnimation anim,
    num frame,
  ) => 'UpdateModelAnimation($model, $anim, $frame)';

  /// Label for [RaylibCoreDart.UpdateModelAnimationEx].
  String UpdateModelAnimationEx(
    Model model,
    ModelAnimation animA,
    num frameA,
    ModelAnimation animB,
    num frameB,
    num blend,
  ) => 'UpdateModelAnimationEx($model, $animA, $frameA, $animB, $frameB, $blend)';
    
  /// Label for [RaylibCoreDart.UnloadModelAnimations].
  String UnloadModelAnimations(
    List<ModelAnimation> animations,
  ) => 'UnloadModelAnimations(animations: ${animations.length})';
    
  /// Label for [RaylibCoreDart.IsModelAnimationValid].
  String IsModelAnimationValid(
    Model model,
    ModelAnimation anim,
  ) => 'IsModelAnimationValid($model, $anim)';
    
  /// Label for [RaylibCoreDart.CheckCollisionSpheres].
  String CheckCollisionSpheres(
    Vector3 center1,
    num radius1,
    Vector3 center2,
    num radius2,
  ) => 'CheckCollisionSpheres($center1, $radius1, $center2, $radius2)';
    
  /// Label for [RaylibCoreDart.CheckCollisionBoxes].
  String CheckCollisionBoxes(
    BoundingBox box1,
    BoundingBox box2,
  ) => 'CheckCollisionBoxes($box1, $box2)';
    
  /// Label for [RaylibCoreDart.CheckCollisionBoxSphere].
  String CheckCollisionBoxSphere(
    BoundingBox box,
    Vector3 center,
    num radius,
  ) => 'CheckCollisionBoxSphere($box, $center, $radius)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionSphere].
  String GetRayCollisionSphere(
    Ray ray,
    Vector3 center,
    num radius,
  ) => 'GetRayCollisionSphere($ray, $center, $radius)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionBox].
  String GetRayCollisionBox(
    Ray ray,
    BoundingBox box,
  ) => 'GetRayCollisionBox($ray, $box)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionMesh].
  String GetRayCollisionMesh(
    Ray ray,
    Mesh mesh,
    Matrix transform,
  ) => 'GetRayCollisionMesh($ray, $mesh, $transform)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionTriangle].
  String GetRayCollisionTriangle(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
  ) => 'GetRayCollisionTriangle($ray, $p1, $p2, $p3)';
    
  /// Label for [RaylibCoreDart.GetRayCollisionQuad].
  String GetRayCollisionQuad(
    Ray ray,
    Vector3 p1,
    Vector3 p2,
    Vector3 p3,
    Vector3 p4,
  ) => 'GetRayCollisionQuad($ray, $p1, $p2, $p3, $p4)';
  
}
