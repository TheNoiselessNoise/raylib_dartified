import 'package:raylib_dartified_web/raylib_dartified_web.dart';

RaylibCore get _module => Raylib.instance.module();

/// See [RaylibCore.InitWindow].
XF3<void> get InitWindow => _module.InitWindow;
/// See [RaylibCore.CloseWindow].
XF0<void> get CloseWindow => _module.CloseWindow;
/// See [RaylibCore.WindowShouldClose].
XF0<bool> get WindowShouldClose => _module.WindowShouldClose;
/// See [RaylibCore.IsWindowReady].
XF0<bool> get IsWindowReady => _module.IsWindowReady;
/// See [RaylibCore.IsWindowFullscreen].
XF0<bool> get IsWindowFullscreen => _module.IsWindowFullscreen;
/// See [RaylibCore.IsWindowHidden].
XF0<bool> get IsWindowHidden => _module.IsWindowHidden;
/// See [RaylibCore.IsWindowMinimized].
XF0<bool> get IsWindowMinimized => _module.IsWindowMinimized;
/// See [RaylibCore.IsWindowMaximized].
XF0<bool> get IsWindowMaximized => _module.IsWindowMaximized;
/// See [RaylibCore.IsWindowFocused].
XF0<bool> get IsWindowFocused => _module.IsWindowFocused;
/// See [RaylibCore.IsWindowResized].
XF0<bool> get IsWindowResized => _module.IsWindowResized;
/// See [RaylibCore.IsWindowState].
XF1<bool> get IsWindowState => _module.IsWindowState;
/// See [RaylibCore.SetWindowState].
XF1<void> get SetWindowState => _module.SetWindowState;
/// See [RaylibCore.ClearWindowState].
XF1<void> get ClearWindowState => _module.ClearWindowState;
/// See [RaylibCore.ToggleFullscreen].
XF0<void> get ToggleFullscreen => _module.ToggleFullscreen;
/// See [RaylibCore.ToggleBorderlessWindowed].
XF0<void> get ToggleBorderlessWindowed => _module.ToggleBorderlessWindowed;
/// See [RaylibCore.MaximizeWindow].
XF0<void> get MaximizeWindow => _module.MaximizeWindow;
/// See [RaylibCore.MinimizeWindow].
XF0<void> get MinimizeWindow => _module.MinimizeWindow;
/// See [RaylibCore.RestoreWindow].
XF0<void> get RestoreWindow => _module.RestoreWindow;
/// See [RaylibCore.SetWindowIcon].
XF1<void> get SetWindowIcon => _module.SetWindowIcon;
/// See [RaylibCore.SetWindowIcons].
XF2<void> get SetWindowIcons => _module.SetWindowIcons;
/// See [RaylibCore.SetWindowTitle].
XF1<void> get SetWindowTitle => _module.SetWindowTitle;
/// See [RaylibCore.SetWindowPosition].
XF2<void> get SetWindowPosition => _module.SetWindowPosition;
/// See [RaylibCore.SetWindowMonitor].
XF1<void> get SetWindowMonitor => _module.SetWindowMonitor;
/// See [RaylibCore.SetWindowMinSize].
XF2<void> get SetWindowMinSize => _module.SetWindowMinSize;
/// See [RaylibCore.SetWindowMaxSize].
XF2<void> get SetWindowMaxSize => _module.SetWindowMaxSize;
/// See [RaylibCore.SetWindowSize].
XF2<void> get SetWindowSize => _module.SetWindowSize;
/// See [RaylibCore.SetWindowOpacity].
XF1<void> get SetWindowOpacity => _module.SetWindowOpacity;
/// See [RaylibCore.SetWindowFocused].
XF0<void> get SetWindowFocused => _module.SetWindowFocused;
/// See [RaylibCore.GetWindowHandle].
XF0<XWasmPtr<XVoid>> get GetWindowHandle => _module.GetWindowHandle;
/// See [RaylibCore.GetScreenWidth].
XF0<int> get GetScreenWidth => _module.GetScreenWidth;
/// See [RaylibCore.GetScreenHeight].
XF0<int> get GetScreenHeight => _module.GetScreenHeight;
/// See [RaylibCore.GetRenderWidth].
XF0<int> get GetRenderWidth => _module.GetRenderWidth;
/// See [RaylibCore.GetRenderHeight].
XF0<int> get GetRenderHeight => _module.GetRenderHeight;
/// See [RaylibCore.GetMonitorCount].
XF0<int> get GetMonitorCount => _module.GetMonitorCount;
/// See [RaylibCore.GetCurrentMonitor].
XF0<int> get GetCurrentMonitor => _module.GetCurrentMonitor;
/// See [RaylibCore.GetMonitorPosition].
XF2<void> get GetMonitorPosition => _module.GetMonitorPosition;
/// See [RaylibCore.GetMonitorWidth].
XF1<int> get GetMonitorWidth => _module.GetMonitorWidth;
/// See [RaylibCore.GetMonitorHeight].
XF1<int> get GetMonitorHeight => _module.GetMonitorHeight;
/// See [RaylibCore.GetMonitorPhysicalWidth].
XF1<int> get GetMonitorPhysicalWidth => _module.GetMonitorPhysicalWidth;
/// See [RaylibCore.GetMonitorPhysicalHeight].
XF1<int> get GetMonitorPhysicalHeight => _module.GetMonitorPhysicalHeight;
/// See [RaylibCore.GetMonitorRefreshRate].
XF1<int> get GetMonitorRefreshRate => _module.GetMonitorRefreshRate;
/// See [RaylibCore.GetWindowPosition].
XF1<void> get GetWindowPosition => _module.GetWindowPosition;
/// See [RaylibCore.GetWindowScaleDPI].
XF1<void> get GetWindowScaleDPI => _module.GetWindowScaleDPI;
/// See [RaylibCore.GetMonitorName].
XF1<XWasmPtr<XChar>> get GetMonitorName => _module.GetMonitorName;
/// See [RaylibCore.SetClipboardText].
XF1<void> get SetClipboardText => _module.SetClipboardText;
/// See [RaylibCore.GetClipboardText].
XF0<XWasmPtr<XChar>> get GetClipboardText => _module.GetClipboardText;
/// See [RaylibCore.GetClipboardImage].
XF1<void> get GetClipboardImage => _module.GetClipboardImage;
/// See [RaylibCore.EnableEventWaiting].
XF0<void> get EnableEventWaiting => _module.EnableEventWaiting;
/// See [RaylibCore.DisableEventWaiting].
XF0<void> get DisableEventWaiting => _module.DisableEventWaiting;
/// See [RaylibCore.ShowCursor].
XF0<void> get ShowCursor => _module.ShowCursor;
/// See [RaylibCore.HideCursor].
XF0<void> get HideCursor => _module.HideCursor;
/// See [RaylibCore.IsCursorHidden].
XF0<bool> get IsCursorHidden => _module.IsCursorHidden;
/// See [RaylibCore.EnableCursor].
XF0<void> get EnableCursor => _module.EnableCursor;
/// See [RaylibCore.DisableCursor].
XF0<void> get DisableCursor => _module.DisableCursor;
/// See [RaylibCore.IsCursorOnScreen].
XF0<bool> get IsCursorOnScreen => _module.IsCursorOnScreen;
/// See [RaylibCore.ClearBackground].
XF1<void> get ClearBackground => _module.ClearBackground;
/// See [RaylibCore.BeginDrawing].
XF0<void> get BeginDrawing => _module.BeginDrawing;
/// See [RaylibCore.EndDrawing].
XF0<void> get EndDrawing => _module.EndDrawing;
/// See [RaylibCore.BeginMode2D].
XF1<void> get BeginMode2D => _module.BeginMode2D;
/// See [RaylibCore.EndMode2D].
XF0<void> get EndMode2D => _module.EndMode2D;
/// See [RaylibCore.BeginMode3D].
XF1<void> get BeginMode3D => _module.BeginMode3D;
/// See [RaylibCore.EndMode3D].
XF0<void> get EndMode3D => _module.EndMode3D;
/// See [RaylibCore.BeginTextureMode].
XF1<void> get BeginTextureMode => _module.BeginTextureMode;
/// See [RaylibCore.EndTextureMode].
XF0<void> get EndTextureMode => _module.EndTextureMode;
/// See [RaylibCore.BeginShaderMode].
XF1<void> get BeginShaderMode => _module.BeginShaderMode;
/// See [RaylibCore.EndShaderMode].
XF0<void> get EndShaderMode => _module.EndShaderMode;
/// See [RaylibCore.BeginBlendMode].
XF1<void> get BeginBlendMode => _module.BeginBlendMode;
/// See [RaylibCore.EndBlendMode].
XF0<void> get EndBlendMode => _module.EndBlendMode;
/// See [RaylibCore.BeginScissorMode].
XF4<void> get BeginScissorMode => _module.BeginScissorMode;
/// See [RaylibCore.EndScissorMode].
XF0<void> get EndScissorMode => _module.EndScissorMode;
/// See [RaylibCore.BeginVrStereoMode].
XF1<void> get BeginVrStereoMode => _module.BeginVrStereoMode;
/// See [RaylibCore.EndVrStereoMode].
XF0<void> get EndVrStereoMode => _module.EndVrStereoMode;
/// See [RaylibCore.LoadVrStereoConfig].
XF2<void> get LoadVrStereoConfig => _module.LoadVrStereoConfig;
/// See [RaylibCore.UnloadVrStereoConfig].
XF1<void> get UnloadVrStereoConfig => _module.UnloadVrStereoConfig;
/// See [RaylibCore.LoadShader].
XF3<void> get LoadShader => _module.LoadShader;
/// See [RaylibCore.LoadShaderFromMemory].
XF3<void> get LoadShaderFromMemory => _module.LoadShaderFromMemory;
/// See [RaylibCore.IsShaderValid].
XF1<bool> get IsShaderValid => _module.IsShaderValid;
/// See [RaylibCore.GetShaderLocation].
XF2<int> get GetShaderLocation => _module.GetShaderLocation;
/// See [RaylibCore.GetShaderLocationAttrib].
XF2<int> get GetShaderLocationAttrib => _module.GetShaderLocationAttrib;
/// See [RaylibCore.SetShaderValue].
XF4<void> get SetShaderValue => _module.SetShaderValue;
/// See [RaylibCore.SetShaderValueV].
XF5<void> get SetShaderValueV => _module.SetShaderValueV;
/// See [RaylibCore.SetShaderValueMatrix].
XF3<void> get SetShaderValueMatrix => _module.SetShaderValueMatrix;
/// See [RaylibCore.SetShaderValueTexture].
XF3<void> get SetShaderValueTexture => _module.SetShaderValueTexture;
/// See [RaylibCore.UnloadShader].
XF1<void> get UnloadShader => _module.UnloadShader;
/// See [RaylibCore.GetScreenToWorldRay].
XF3<void> get GetScreenToWorldRay => _module.GetScreenToWorldRay;
/// See [RaylibCore.GetScreenToWorldRayEx].
XF5<void> get GetScreenToWorldRayEx => _module.GetScreenToWorldRayEx;
/// See [RaylibCore.GetWorldToScreen].
XF3<void> get GetWorldToScreen => _module.GetWorldToScreen;
/// See [RaylibCore.GetWorldToScreenEx].
XF5<void> get GetWorldToScreenEx => _module.GetWorldToScreenEx;
/// See [RaylibCore.GetWorldToScreen2D].
XF3<void> get GetWorldToScreen2D => _module.GetWorldToScreen2D;
/// See [RaylibCore.GetScreenToWorld2D].
XF3<void> get GetScreenToWorld2D => _module.GetScreenToWorld2D;
/// See [RaylibCore.GetCameraMatrix].
XF2<void> get GetCameraMatrix => _module.GetCameraMatrix;
/// See [RaylibCore.GetCameraMatrix2D].
XF2<void> get GetCameraMatrix2D => _module.GetCameraMatrix2D;
/// See [RaylibCore.SetTargetFPS].
XF1<void> get SetTargetFPS => _module.SetTargetFPS;
/// See [RaylibCore.GetFrameTime].
XF0<double> get GetFrameTime => _module.GetFrameTime;
/// See [RaylibCore.GetTime].
XF0<double> get GetTime => _module.GetTime;
/// See [RaylibCore.GetFPS].
XF0<int> get GetFPS => _module.GetFPS;
/// See [RaylibCore.SwapScreenBuffer].
XF0<void> get SwapScreenBuffer => _module.SwapScreenBuffer;
/// See [RaylibCore.PollInputEvents].
XF0<void> get PollInputEvents => _module.PollInputEvents;
/// See [RaylibCore.WaitTime].
XF1<void> get WaitTime => _module.WaitTime;
/// See [RaylibCore.SetRandomSeed].
XF1<void> get SetRandomSeed => _module.SetRandomSeed;
/// See [RaylibCore.GetRandomValue].
XF2<int> get GetRandomValue => _module.GetRandomValue;
/// See [RaylibCore.LoadRandomSequence].
XF3<XWasmPtr<XInt>> get LoadRandomSequence => _module.LoadRandomSequence;
/// See [RaylibCore.UnloadRandomSequence].
XF1<void> get UnloadRandomSequence => _module.UnloadRandomSequence;
/// See [RaylibCore.TakeScreenshot].
XF1<void> get TakeScreenshot => _module.TakeScreenshot;
/// See [RaylibCore.SetConfigFlags].
XF1<void> get SetConfigFlags => _module.SetConfigFlags;
/// See [RaylibCore.OpenURL].
XF1<void> get OpenURL => _module.OpenURL;
/// See [RaylibCore.TraceLog].
XF2<void> get TraceLog => _module.TraceLog;
/// See [RaylibCore.SetTraceLogLevel].
XF1<void> get SetTraceLogLevel => _module.SetTraceLogLevel;
/// See [RaylibCore.SetTraceLogCallback].
XF1<void> get SetTraceLogCallback => _module.SetTraceLogCallback;
/// See [RaylibCore.SetLoadFileDataCallback].
XF1<void> get SetLoadFileDataCallback => _module.SetLoadFileDataCallback;
/// See [RaylibCore.SetSaveFileDataCallback].
XF1<void> get SetSaveFileDataCallback => _module.SetSaveFileDataCallback;
/// See [RaylibCore.SetLoadFileTextCallback].
XF1<void> get SetLoadFileTextCallback => _module.SetLoadFileTextCallback;
/// See [RaylibCore.SetSaveFileTextCallback].
XF1<void> get SetSaveFileTextCallback => _module.SetSaveFileTextCallback;
/// See [RaylibCore.LoadFileData].
XF2<XWasmPtr<XUnsignedChar>> get LoadFileData => _module.LoadFileData;
/// See [RaylibCore.UnloadFileData].
XF1<void> get UnloadFileData => _module.UnloadFileData;
/// See [RaylibCore.SaveFileData].
XF3<bool> get SaveFileData => _module.SaveFileData;
/// See [RaylibCore.ExportDataAsCode].
XF3<bool> get ExportDataAsCode => _module.ExportDataAsCode;
/// See [RaylibCore.LoadFileText].
XF1<XWasmPtr<XChar>> get LoadFileText => _module.LoadFileText;
/// See [RaylibCore.UnloadFileText].
XF1<void> get UnloadFileText => _module.UnloadFileText;
/// See [RaylibCore.SaveFileText].
XF2<bool> get SaveFileText => _module.SaveFileText;
/// See [RaylibCore.FileRename].
XF2<int> get FileRename => _module.FileRename;
/// See [RaylibCore.FileRemove].
XF1<int> get FileRemove => _module.FileRemove;
/// See [RaylibCore.FileCopy].
XF2<int> get FileCopy => _module.FileCopy;
/// See [RaylibCore.FileMove].
XF2<int> get FileMove => _module.FileMove;
/// See [RaylibCore.FileTextReplace].
XF3<int> get FileTextReplace => _module.FileTextReplace;
/// See [RaylibCore.FileTextFindIndex].
XF2<int> get FileTextFindIndex => _module.FileTextFindIndex;
/// See [RaylibCore.FileExists].
XF1<bool> get FileExists => _module.FileExists;
/// See [RaylibCore.DirectoryExists].
XF1<bool> get DirectoryExists => _module.DirectoryExists;
/// See [RaylibCore.IsFileExtension].
XF2<bool> get IsFileExtension => _module.IsFileExtension;
/// See [RaylibCore.GetFileLength].
XF1<int> get GetFileLength => _module.GetFileLength;
/// See [RaylibCore.GetFileExtension].
XF1<XWasmPtr<XChar>> get GetFileExtension => _module.GetFileExtension;
/// See [RaylibCore.GetFileName].
XF1<XWasmPtr<XChar>> get GetFileName => _module.GetFileName;
/// See [RaylibCore.GetFileNameWithoutExt].
XF1<XWasmPtr<XChar>> get GetFileNameWithoutExt => _module.GetFileNameWithoutExt;
/// See [RaylibCore.GetDirectoryFileCount].
XF1<int> get GetDirectoryFileCount => _module.GetDirectoryFileCount;
/// See [RaylibCore.GetDirectoryFileCountEx].
XF3<int> get GetDirectoryFileCountEx => _module.GetDirectoryFileCountEx;
/// See [RaylibCore.GetDirectoryPath].
XF1<XWasmPtr<XChar>> get GetDirectoryPath => _module.GetDirectoryPath;
/// See [RaylibCore.GetPrevDirectoryPath].
XF1<XWasmPtr<XChar>> get GetPrevDirectoryPath => _module.GetPrevDirectoryPath;
/// See [RaylibCore.GetWorkingDirectory].
XF0<XWasmPtr<XChar>> get GetWorkingDirectory => _module.GetWorkingDirectory;
/// See [RaylibCore.GetApplicationDirectory].
XF0<XWasmPtr<XChar>> get GetApplicationDirectory => _module.GetApplicationDirectory;
/// See [RaylibCore.MakeDirectory].
XF1<int> get MakeDirectory => _module.MakeDirectory;
/// See [RaylibCore.ChangeDirectory].
XF1<bool> get ChangeDirectory => _module.ChangeDirectory;
/// See [RaylibCore.IsPathFile].
XF1<bool> get IsPathFile => _module.IsPathFile;
/// See [RaylibCore.IsFileNameValid].
XF1<bool> get IsFileNameValid => _module.IsFileNameValid;
/// See [RaylibCore.LoadDirectoryFiles].
XF2<void> get LoadDirectoryFiles => _module.LoadDirectoryFiles;
/// See [RaylibCore.LoadDirectoryFilesEx].
XF4<void> get LoadDirectoryFilesEx => _module.LoadDirectoryFilesEx;
/// See [RaylibCore.UnloadDirectoryFiles].
XF1<void> get UnloadDirectoryFiles => _module.UnloadDirectoryFiles;
/// See [RaylibCore.IsFileDropped].
XF0<bool> get IsFileDropped => _module.IsFileDropped;
/// See [RaylibCore.LoadDroppedFiles].
XF1<void> get LoadDroppedFiles => _module.LoadDroppedFiles;
/// See [RaylibCore.UnloadDroppedFiles].
XF1<void> get UnloadDroppedFiles => _module.UnloadDroppedFiles;
/// See [RaylibCore.GetFileModTime].
XF1<int> get GetFileModTime => _module.GetFileModTime;
/// See [RaylibCore.CompressData].
XF3<XWasmPtr<XUnsignedChar>> get CompressData => _module.CompressData;
/// See [RaylibCore.DecompressData].
XF3<XWasmPtr<XUnsignedChar>> get DecompressData => _module.DecompressData;
/// See [RaylibCore.EncodeDataBase64].
XF3<XWasmPtr<XChar>> get EncodeDataBase64 => _module.EncodeDataBase64;
/// See [RaylibCore.DecodeDataBase64].
XF2<XWasmPtr<XUnsignedChar>> get DecodeDataBase64 => _module.DecodeDataBase64;
/// See [RaylibCore.ComputeCRC32].
XF2<int> get ComputeCRC32 => _module.ComputeCRC32;
/// See [RaylibCore.ComputeMD5].
XF2<XWasmPtr<XUnsignedInt>> get ComputeMD5 => _module.ComputeMD5;
/// See [RaylibCore.ComputeSHA1].
XF2<XWasmPtr<XUnsignedInt>> get ComputeSHA1 => _module.ComputeSHA1;
/// See [RaylibCore.ComputeSHA256].
XF2<XWasmPtr<XUnsignedInt>> get ComputeSHA256 => _module.ComputeSHA256;
/// See [RaylibCore.LoadAutomationEventList].
XF2<void> get LoadAutomationEventList => _module.LoadAutomationEventList;
/// See [RaylibCore.UnloadAutomationEventList].
XF1<void> get UnloadAutomationEventList => _module.UnloadAutomationEventList;
/// See [RaylibCore.ExportAutomationEventList].
XF2<bool> get ExportAutomationEventList => _module.ExportAutomationEventList;
/// See [RaylibCore.SetAutomationEventList].
XF1<void> get SetAutomationEventList => _module.SetAutomationEventList;
/// See [RaylibCore.SetAutomationEventBaseFrame].
XF1<void> get SetAutomationEventBaseFrame => _module.SetAutomationEventBaseFrame;
/// See [RaylibCore.StartAutomationEventRecording].
XF0<void> get StartAutomationEventRecording => _module.StartAutomationEventRecording;
/// See [RaylibCore.StopAutomationEventRecording].
XF0<void> get StopAutomationEventRecording => _module.StopAutomationEventRecording;
/// See [RaylibCore.PlayAutomationEvent].
XF1<void> get PlayAutomationEvent => _module.PlayAutomationEvent;
/// See [RaylibCore.IsKeyPressed].
XF1<bool> get IsKeyPressed => _module.IsKeyPressed;
/// See [RaylibCore.IsKeyPressedRepeat].
XF1<bool> get IsKeyPressedRepeat => _module.IsKeyPressedRepeat;
/// See [RaylibCore.IsKeyDown].
XF1<bool> get IsKeyDown => _module.IsKeyDown;
/// See [RaylibCore.IsKeyReleased].
XF1<bool> get IsKeyReleased => _module.IsKeyReleased;
/// See [RaylibCore.IsKeyUp].
XF1<bool> get IsKeyUp => _module.IsKeyUp;
/// See [RaylibCore.GetKeyName].
XF1<XWasmPtr<XChar>> get GetKeyName => _module.GetKeyName;
/// See [RaylibCore.GetKeyPressed].
XF0<int> get GetKeyPressed => _module.GetKeyPressed;
/// See [RaylibCore.GetCharPressed].
XF0<int> get GetCharPressed => _module.GetCharPressed;
/// See [RaylibCore.SetExitKey].
XF1<void> get SetExitKey => _module.SetExitKey;
/// See [RaylibCore.IsGamepadAvailable].
XF1<bool> get IsGamepadAvailable => _module.IsGamepadAvailable;
/// See [RaylibCore.GetGamepadName].
XF1<XWasmPtr<XChar>> get GetGamepadName => _module.GetGamepadName;
/// See [RaylibCore.IsGamepadButtonPressed].
XF2<bool> get IsGamepadButtonPressed => _module.IsGamepadButtonPressed;
/// See [RaylibCore.IsGamepadButtonDown].
XF2<bool> get IsGamepadButtonDown => _module.IsGamepadButtonDown;
/// See [RaylibCore.IsGamepadButtonReleased].
XF2<bool> get IsGamepadButtonReleased => _module.IsGamepadButtonReleased;
/// See [RaylibCore.IsGamepadButtonUp].
XF2<bool> get IsGamepadButtonUp => _module.IsGamepadButtonUp;
/// See [RaylibCore.GetGamepadButtonPressed].
XF0<int> get GetGamepadButtonPressed => _module.GetGamepadButtonPressed;
/// See [RaylibCore.GetGamepadAxisCount].
XF1<int> get GetGamepadAxisCount => _module.GetGamepadAxisCount;
/// See [RaylibCore.GetGamepadAxisMovement].
XF2<double> get GetGamepadAxisMovement => _module.GetGamepadAxisMovement;
/// See [RaylibCore.SetGamepadMappings].
XF1<int> get SetGamepadMappings => _module.SetGamepadMappings;
/// See [RaylibCore.SetGamepadVibration].
XF4<void> get SetGamepadVibration => _module.SetGamepadVibration;
/// See [RaylibCore.IsMouseButtonPressed].
XF1<bool> get IsMouseButtonPressed => _module.IsMouseButtonPressed;
/// See [RaylibCore.IsMouseButtonDown].
XF1<bool> get IsMouseButtonDown => _module.IsMouseButtonDown;
/// See [RaylibCore.IsMouseButtonReleased].
XF1<bool> get IsMouseButtonReleased => _module.IsMouseButtonReleased;
/// See [RaylibCore.IsMouseButtonUp].
XF1<bool> get IsMouseButtonUp => _module.IsMouseButtonUp;
/// See [RaylibCore.GetMouseX].
XF0<int> get GetMouseX => _module.GetMouseX;
/// See [RaylibCore.GetMouseY].
XF0<int> get GetMouseY => _module.GetMouseY;
/// See [RaylibCore.GetMousePosition].
XF1<void> get GetMousePosition => _module.GetMousePosition;
/// See [RaylibCore.GetMouseDelta].
XF1<void> get GetMouseDelta => _module.GetMouseDelta;
/// See [RaylibCore.SetMousePosition].
XF2<void> get SetMousePosition => _module.SetMousePosition;
/// See [RaylibCore.SetMouseOffset].
XF2<void> get SetMouseOffset => _module.SetMouseOffset;
/// See [RaylibCore.SetMouseScale].
XF2<void> get SetMouseScale => _module.SetMouseScale;
/// See [RaylibCore.GetMouseWheelMove].
XF0<double> get GetMouseWheelMove => _module.GetMouseWheelMove;
/// See [RaylibCore.GetMouseWheelMoveV].
XF1<void> get GetMouseWheelMoveV => _module.GetMouseWheelMoveV;
/// See [RaylibCore.SetMouseCursor].
XF1<void> get SetMouseCursor => _module.SetMouseCursor;
/// See [RaylibCore.GetTouchX].
XF0<int> get GetTouchX => _module.GetTouchX;
/// See [RaylibCore.GetTouchY].
XF0<int> get GetTouchY => _module.GetTouchY;
/// See [RaylibCore.GetTouchPosition].
XF2<void> get GetTouchPosition => _module.GetTouchPosition;
/// See [RaylibCore.GetTouchPointId].
XF1<int> get GetTouchPointId => _module.GetTouchPointId;
/// See [RaylibCore.GetTouchPointCount].
XF0<int> get GetTouchPointCount => _module.GetTouchPointCount;
/// See [RaylibCore.SetGesturesEnabled].
XF1<void> get SetGesturesEnabled => _module.SetGesturesEnabled;
/// See [RaylibCore.IsGestureDetected].
XF1<bool> get IsGestureDetected => _module.IsGestureDetected;
/// See [RaylibCore.GetGestureDetected].
XF0<int> get GetGestureDetected => _module.GetGestureDetected;
/// See [RaylibCore.GetGestureHoldDuration].
XF0<double> get GetGestureHoldDuration => _module.GetGestureHoldDuration;
/// See [RaylibCore.GetGestureDragVector].
XF1<void> get GetGestureDragVector => _module.GetGestureDragVector;
/// See [RaylibCore.GetGestureDragAngle].
XF0<double> get GetGestureDragAngle => _module.GetGestureDragAngle;
/// See [RaylibCore.GetGesturePinchVector].
XF1<void> get GetGesturePinchVector => _module.GetGesturePinchVector;
/// See [RaylibCore.GetGesturePinchAngle].
XF0<double> get GetGesturePinchAngle => _module.GetGesturePinchAngle;
/// See [RaylibCore.ProcessGestureEvent].
XF1<void> get ProcessGestureEvent => _module.ProcessGestureEvent;
/// See [RaylibCore.UpdateGestures].
XF0<void> get UpdateGestures => _module.UpdateGestures;
/// See [RaylibCore.UpdateCamera].
XF2<void> get UpdateCamera => _module.UpdateCamera;
/// See [RaylibCore.UpdateCameraPro].
XF4<void> get UpdateCameraPro => _module.UpdateCameraPro;
/// See [RaylibCore.SetShapesTexture].
XF2<void> get SetShapesTexture => _module.SetShapesTexture;
/// See [RaylibCore.GetShapesTexture].
XF1<void> get GetShapesTexture => _module.GetShapesTexture;
/// See [RaylibCore.GetShapesTextureRectangle].
XF1<void> get GetShapesTextureRectangle => _module.GetShapesTextureRectangle;
/// See [RaylibCore.DrawPixel].
XF3<void> get DrawPixel => _module.DrawPixel;
/// See [RaylibCore.DrawPixelV].
XF2<void> get DrawPixelV => _module.DrawPixelV;
/// See [RaylibCore.DrawLine].
XF5<void> get DrawLine => _module.DrawLine;
/// See [RaylibCore.DrawLineV].
XF3<void> get DrawLineV => _module.DrawLineV;
/// See [RaylibCore.DrawLineEx].
XF4<void> get DrawLineEx => _module.DrawLineEx;
/// See [RaylibCore.DrawLineStrip].
XF3<void> get DrawLineStrip => _module.DrawLineStrip;
/// See [RaylibCore.DrawLineBezier].
XF4<void> get DrawLineBezier => _module.DrawLineBezier;
/// See [RaylibCore.DrawLineDashed].
XF5<void> get DrawLineDashed => _module.DrawLineDashed;
/// See [RaylibCore.DrawCircle].
XF4<void> get DrawCircle => _module.DrawCircle;
/// See [RaylibCore.DrawCircleSector].
XF6<void> get DrawCircleSector => _module.DrawCircleSector;
/// See [RaylibCore.DrawCircleSectorLines].
XF6<void> get DrawCircleSectorLines => _module.DrawCircleSectorLines;
/// See [RaylibCore.DrawCircleGradient].
XF4<void> get DrawCircleGradient => _module.DrawCircleGradient;
/// See [RaylibCore.DrawCircleV].
XF3<void> get DrawCircleV => _module.DrawCircleV;
/// See [RaylibCore.DrawCircleLines].
XF4<void> get DrawCircleLines => _module.DrawCircleLines;
/// See [RaylibCore.DrawCircleLinesV].
XF3<void> get DrawCircleLinesV => _module.DrawCircleLinesV;
/// See [RaylibCore.DrawEllipse].
XF5<void> get DrawEllipse => _module.DrawEllipse;
/// See [RaylibCore.DrawEllipseV].
XF4<void> get DrawEllipseV => _module.DrawEllipseV;
/// See [RaylibCore.DrawEllipseLines].
XF5<void> get DrawEllipseLines => _module.DrawEllipseLines;
/// See [RaylibCore.DrawEllipseLinesV].
XF4<void> get DrawEllipseLinesV => _module.DrawEllipseLinesV;
/// See [RaylibCore.DrawRing].
XF7<void> get DrawRing => _module.DrawRing;
/// See [RaylibCore.DrawRingLines].
XF7<void> get DrawRingLines => _module.DrawRingLines;
/// See [RaylibCore.DrawRectangle].
XF5<void> get DrawRectangle => _module.DrawRectangle;
/// See [RaylibCore.DrawRectangleV].
XF3<void> get DrawRectangleV => _module.DrawRectangleV;
/// See [RaylibCore.DrawRectangleRec].
XF2<void> get DrawRectangleRec => _module.DrawRectangleRec;
/// See [RaylibCore.DrawRectanglePro].
XF4<void> get DrawRectanglePro => _module.DrawRectanglePro;
/// See [RaylibCore.DrawRectangleGradientV].
XF6<void> get DrawRectangleGradientV => _module.DrawRectangleGradientV;
/// See [RaylibCore.DrawRectangleGradientH].
XF6<void> get DrawRectangleGradientH => _module.DrawRectangleGradientH;
/// See [RaylibCore.DrawRectangleGradientEx].
XF5<void> get DrawRectangleGradientEx => _module.DrawRectangleGradientEx;
/// See [RaylibCore.DrawRectangleLines].
XF5<void> get DrawRectangleLines => _module.DrawRectangleLines;
/// See [RaylibCore.DrawRectangleLinesEx].
XF3<void> get DrawRectangleLinesEx => _module.DrawRectangleLinesEx;
/// See [RaylibCore.DrawRectangleRounded].
XF4<void> get DrawRectangleRounded => _module.DrawRectangleRounded;
/// See [RaylibCore.DrawRectangleRoundedLines].
XF4<void> get DrawRectangleRoundedLines => _module.DrawRectangleRoundedLines;
/// See [RaylibCore.DrawRectangleRoundedLinesEx].
XF5<void> get DrawRectangleRoundedLinesEx => _module.DrawRectangleRoundedLinesEx;
/// See [RaylibCore.DrawTriangle].
XF4<void> get DrawTriangle => _module.DrawTriangle;
/// See [RaylibCore.DrawTriangleLines].
XF4<void> get DrawTriangleLines => _module.DrawTriangleLines;
/// See [RaylibCore.DrawTriangleFan].
XF3<void> get DrawTriangleFan => _module.DrawTriangleFan;
/// See [RaylibCore.DrawTriangleStrip].
XF3<void> get DrawTriangleStrip => _module.DrawTriangleStrip;
/// See [RaylibCore.DrawPoly].
XF5<void> get DrawPoly => _module.DrawPoly;
/// See [RaylibCore.DrawPolyLines].
XF5<void> get DrawPolyLines => _module.DrawPolyLines;
/// See [RaylibCore.DrawPolyLinesEx].
XF6<void> get DrawPolyLinesEx => _module.DrawPolyLinesEx;
/// See [RaylibCore.DrawSplineLinear].
XF4<void> get DrawSplineLinear => _module.DrawSplineLinear;
/// See [RaylibCore.DrawSplineBasis].
XF4<void> get DrawSplineBasis => _module.DrawSplineBasis;
/// See [RaylibCore.DrawSplineCatmullRom].
XF4<void> get DrawSplineCatmullRom => _module.DrawSplineCatmullRom;
/// See [RaylibCore.DrawSplineBezierQuadratic].
XF4<void> get DrawSplineBezierQuadratic => _module.DrawSplineBezierQuadratic;
/// See [RaylibCore.DrawSplineBezierCubic].
XF4<void> get DrawSplineBezierCubic => _module.DrawSplineBezierCubic;
/// See [RaylibCore.DrawSplineSegmentLinear].
XF4<void> get DrawSplineSegmentLinear => _module.DrawSplineSegmentLinear;
/// See [RaylibCore.DrawSplineSegmentBasis].
XF6<void> get DrawSplineSegmentBasis => _module.DrawSplineSegmentBasis;
/// See [RaylibCore.DrawSplineSegmentCatmullRom].
XF6<void> get DrawSplineSegmentCatmullRom => _module.DrawSplineSegmentCatmullRom;
/// See [RaylibCore.DrawSplineSegmentBezierQuadratic].
XF5<void> get DrawSplineSegmentBezierQuadratic => _module.DrawSplineSegmentBezierQuadratic;
/// See [RaylibCore.DrawSplineSegmentBezierCubic].
XF6<void> get DrawSplineSegmentBezierCubic => _module.DrawSplineSegmentBezierCubic;
/// See [RaylibCore.GetSplinePointLinear].
XF4<void> get GetSplinePointLinear => _module.GetSplinePointLinear;
/// See [RaylibCore.GetSplinePointBasis].
XF6<void> get GetSplinePointBasis => _module.GetSplinePointBasis;
/// See [RaylibCore.GetSplinePointCatmullRom].
XF6<void> get GetSplinePointCatmullRom => _module.GetSplinePointCatmullRom;
/// See [RaylibCore.GetSplinePointBezierQuad].
XF5<void> get GetSplinePointBezierQuad => _module.GetSplinePointBezierQuad;
/// See [RaylibCore.GetSplinePointBezierCubic].
XF6<void> get GetSplinePointBezierCubic => _module.GetSplinePointBezierCubic;
/// See [RaylibCore.CheckCollisionRecs].
XF2<bool> get CheckCollisionRecs => _module.CheckCollisionRecs;
/// See [RaylibCore.CheckCollisionCircles].
XF4<bool> get CheckCollisionCircles => _module.CheckCollisionCircles;
/// See [RaylibCore.CheckCollisionCircleRec].
XF3<bool> get CheckCollisionCircleRec => _module.CheckCollisionCircleRec;
/// See [RaylibCore.CheckCollisionCircleLine].
XF4<bool> get CheckCollisionCircleLine => _module.CheckCollisionCircleLine;
/// See [RaylibCore.CheckCollisionPointRec].
XF2<bool> get CheckCollisionPointRec => _module.CheckCollisionPointRec;
/// See [RaylibCore.CheckCollisionPointCircle].
XF3<bool> get CheckCollisionPointCircle => _module.CheckCollisionPointCircle;
/// See [RaylibCore.CheckCollisionPointTriangle].
XF4<bool> get CheckCollisionPointTriangle => _module.CheckCollisionPointTriangle;
/// See [RaylibCore.CheckCollisionPointLine].
XF4<bool> get CheckCollisionPointLine => _module.CheckCollisionPointLine;
/// See [RaylibCore.CheckCollisionPointPoly].
XF3<bool> get CheckCollisionPointPoly => _module.CheckCollisionPointPoly;
/// See [RaylibCore.CheckCollisionLines].
XF5<bool> get CheckCollisionLines => _module.CheckCollisionLines;
/// See [RaylibCore.GetCollisionRec].
XF3<void> get GetCollisionRec => _module.GetCollisionRec;
/// See [RaylibCore.LoadImage].
XF2<void> get LoadImage => _module.LoadImage;
/// See [RaylibCore.LoadImageRaw].
XF6<void> get LoadImageRaw => _module.LoadImageRaw;
/// See [RaylibCore.LoadImageAnim].
XF3<void> get LoadImageAnim => _module.LoadImageAnim;
/// See [RaylibCore.LoadImageAnimFromMemory].
XF5<void> get LoadImageAnimFromMemory => _module.LoadImageAnimFromMemory;
/// See [RaylibCore.LoadImageFromMemory].
XF4<void> get LoadImageFromMemory => _module.LoadImageFromMemory;
/// See [RaylibCore.LoadImageFromTexture].
XF2<void> get LoadImageFromTexture => _module.LoadImageFromTexture;
/// See [RaylibCore.LoadImageFromScreen].
XF1<void> get LoadImageFromScreen => _module.LoadImageFromScreen;
/// See [RaylibCore.IsImageValid].
XF1<bool> get IsImageValid => _module.IsImageValid;
/// See [RaylibCore.UnloadImage].
XF1<void> get UnloadImage => _module.UnloadImage;
/// See [RaylibCore.ExportImage].
XF2<bool> get ExportImage => _module.ExportImage;
/// See [RaylibCore.ExportImageToMemory].
XF3<XWasmPtr<XUnsignedChar>> get ExportImageToMemory => _module.ExportImageToMemory;
/// See [RaylibCore.ExportImageAsCode].
XF2<bool> get ExportImageAsCode => _module.ExportImageAsCode;
/// See [RaylibCore.GenImageColor].
XF4<void> get GenImageColor => _module.GenImageColor;
/// See [RaylibCore.GenImageGradientLinear].
XF6<void> get GenImageGradientLinear => _module.GenImageGradientLinear;
/// See [RaylibCore.GenImageGradientRadial].
XF6<void> get GenImageGradientRadial => _module.GenImageGradientRadial;
/// See [RaylibCore.GenImageGradientSquare].
XF6<void> get GenImageGradientSquare => _module.GenImageGradientSquare;
/// See [RaylibCore.GenImageChecked].
XF7<void> get GenImageChecked => _module.GenImageChecked;
/// See [RaylibCore.GenImageWhiteNoise].
XF4<void> get GenImageWhiteNoise => _module.GenImageWhiteNoise;
/// See [RaylibCore.GenImagePerlinNoise].
XF6<void> get GenImagePerlinNoise => _module.GenImagePerlinNoise;
/// See [RaylibCore.GenImageCellular].
XF4<void> get GenImageCellular => _module.GenImageCellular;
/// See [RaylibCore.GenImageText].
XF4<void> get GenImageText => _module.GenImageText;
/// See [RaylibCore.ImageCopy].
XF2<void> get ImageCopy => _module.ImageCopy;
/// See [RaylibCore.ImageFromImage].
XF3<void> get ImageFromImage => _module.ImageFromImage;
/// See [RaylibCore.ImageFromChannel].
XF3<void> get ImageFromChannel => _module.ImageFromChannel;
/// See [RaylibCore.ImageText].
XF4<void> get ImageText => _module.ImageText;
/// See [RaylibCore.ImageTextEx].
XF6<void> get ImageTextEx => _module.ImageTextEx;
/// See [RaylibCore.ImageFormat].
XF2<void> get ImageFormat => _module.ImageFormat;
/// See [RaylibCore.ImageToPOT].
XF2<void> get ImageToPOT => _module.ImageToPOT;
/// See [RaylibCore.ImageCrop].
XF2<void> get ImageCrop => _module.ImageCrop;
/// See [RaylibCore.ImageAlphaCrop].
XF2<void> get ImageAlphaCrop => _module.ImageAlphaCrop;
/// See [RaylibCore.ImageAlphaClear].
XF3<void> get ImageAlphaClear => _module.ImageAlphaClear;
/// See [RaylibCore.ImageAlphaMask].
XF2<void> get ImageAlphaMask => _module.ImageAlphaMask;
/// See [RaylibCore.ImageAlphaPremultiply].
XF1<void> get ImageAlphaPremultiply => _module.ImageAlphaPremultiply;
/// See [RaylibCore.ImageBlurGaussian].
XF2<void> get ImageBlurGaussian => _module.ImageBlurGaussian;
/// See [RaylibCore.ImageKernelConvolution].
XF3<void> get ImageKernelConvolution => _module.ImageKernelConvolution;
/// See [RaylibCore.ImageResize].
XF3<void> get ImageResize => _module.ImageResize;
/// See [RaylibCore.ImageResizeNN].
XF3<void> get ImageResizeNN => _module.ImageResizeNN;
/// See [RaylibCore.ImageResizeCanvas].
XF6<void> get ImageResizeCanvas => _module.ImageResizeCanvas;
/// See [RaylibCore.ImageMipmaps].
XF1<void> get ImageMipmaps => _module.ImageMipmaps;
/// See [RaylibCore.ImageDither].
XF5<void> get ImageDither => _module.ImageDither;
/// See [RaylibCore.ImageFlipVertical].
XF1<void> get ImageFlipVertical => _module.ImageFlipVertical;
/// See [RaylibCore.ImageFlipHorizontal].
XF1<void> get ImageFlipHorizontal => _module.ImageFlipHorizontal;
/// See [RaylibCore.ImageRotate].
XF2<void> get ImageRotate => _module.ImageRotate;
/// See [RaylibCore.ImageRotateCW].
XF1<void> get ImageRotateCW => _module.ImageRotateCW;
/// See [RaylibCore.ImageRotateCCW].
XF1<void> get ImageRotateCCW => _module.ImageRotateCCW;
/// See [RaylibCore.ImageColorTint].
XF2<void> get ImageColorTint => _module.ImageColorTint;
/// See [RaylibCore.ImageColorInvert].
XF1<void> get ImageColorInvert => _module.ImageColorInvert;
/// See [RaylibCore.ImageColorGrayscale].
XF1<void> get ImageColorGrayscale => _module.ImageColorGrayscale;
/// See [RaylibCore.ImageColorContrast].
XF2<void> get ImageColorContrast => _module.ImageColorContrast;
/// See [RaylibCore.ImageColorBrightness].
XF2<void> get ImageColorBrightness => _module.ImageColorBrightness;
/// See [RaylibCore.ImageColorReplace].
XF3<void> get ImageColorReplace => _module.ImageColorReplace;
/// See [RaylibCore.LoadImageColors].
XF1<XStructPtr<Color>> get LoadImageColors => _module.LoadImageColors;
/// See [RaylibCore.LoadImagePalette].
XF3<XStructPtr<Color>> get LoadImagePalette => _module.LoadImagePalette;
/// See [RaylibCore.UnloadImageColors].
XF1<void> get UnloadImageColors => _module.UnloadImageColors;
/// See [RaylibCore.UnloadImagePalette].
XF1<void> get UnloadImagePalette => _module.UnloadImagePalette;
/// See [RaylibCore.GetImageAlphaBorder].
XF3<void> get GetImageAlphaBorder => _module.GetImageAlphaBorder;
/// See [RaylibCore.GetImageColor].
XF4<void> get GetImageColor => _module.GetImageColor;
/// See [RaylibCore.ImageClearBackground].
XF2<void> get ImageClearBackground => _module.ImageClearBackground;
/// See [RaylibCore.ImageDrawPixel].
XF4<void> get ImageDrawPixel => _module.ImageDrawPixel;
/// See [RaylibCore.ImageDrawPixelV].
XF3<void> get ImageDrawPixelV => _module.ImageDrawPixelV;
/// See [RaylibCore.ImageDrawLine].
XF6<void> get ImageDrawLine => _module.ImageDrawLine;
/// See [RaylibCore.ImageDrawLineV].
XF4<void> get ImageDrawLineV => _module.ImageDrawLineV;
/// See [RaylibCore.ImageDrawLineEx].
XF5<void> get ImageDrawLineEx => _module.ImageDrawLineEx;
/// See [RaylibCore.ImageDrawCircle].
XF5<void> get ImageDrawCircle => _module.ImageDrawCircle;
/// See [RaylibCore.ImageDrawCircleV].
XF4<void> get ImageDrawCircleV => _module.ImageDrawCircleV;
/// See [RaylibCore.ImageDrawCircleLines].
XF5<void> get ImageDrawCircleLines => _module.ImageDrawCircleLines;
/// See [RaylibCore.ImageDrawCircleLinesV].
XF4<void> get ImageDrawCircleLinesV => _module.ImageDrawCircleLinesV;
/// See [RaylibCore.ImageDrawRectangle].
XF6<void> get ImageDrawRectangle => _module.ImageDrawRectangle;
/// See [RaylibCore.ImageDrawRectangleV].
XF4<void> get ImageDrawRectangleV => _module.ImageDrawRectangleV;
/// See [RaylibCore.ImageDrawRectangleRec].
XF3<void> get ImageDrawRectangleRec => _module.ImageDrawRectangleRec;
/// See [RaylibCore.ImageDrawRectangleLines].
XF4<void> get ImageDrawRectangleLines => _module.ImageDrawRectangleLines;
/// See [RaylibCore.ImageDrawTriangle].
XF5<void> get ImageDrawTriangle => _module.ImageDrawTriangle;
/// See [RaylibCore.ImageDrawTriangleEx].
XF7<void> get ImageDrawTriangleEx => _module.ImageDrawTriangleEx;
/// See [RaylibCore.ImageDrawTriangleLines].
XF5<void> get ImageDrawTriangleLines => _module.ImageDrawTriangleLines;
/// See [RaylibCore.ImageDrawTriangleFan].
XF4<void> get ImageDrawTriangleFan => _module.ImageDrawTriangleFan;
/// See [RaylibCore.ImageDrawTriangleStrip].
XF4<void> get ImageDrawTriangleStrip => _module.ImageDrawTriangleStrip;
/// See [RaylibCore.ImageDraw].
XF5<void> get ImageDraw => _module.ImageDraw;
/// See [RaylibCore.ImageDrawText].
XF6<void> get ImageDrawText => _module.ImageDrawText;
/// See [RaylibCore.ImageDrawTextEx].
XF7<void> get ImageDrawTextEx => _module.ImageDrawTextEx;
/// See [RaylibCore.LoadTexture].
XF2<void> get LoadTexture => _module.LoadTexture;
/// See [RaylibCore.LoadTextureFromImage].
XF2<void> get LoadTextureFromImage => _module.LoadTextureFromImage;
/// See [RaylibCore.LoadTextureCubemap].
XF3<void> get LoadTextureCubemap => _module.LoadTextureCubemap;
/// See [RaylibCore.LoadRenderTexture].
XF3<void> get LoadRenderTexture => _module.LoadRenderTexture;
/// See [RaylibCore.IsTextureValid].
XF1<bool> get IsTextureValid => _module.IsTextureValid;
/// See [RaylibCore.UnloadTexture].
XF1<void> get UnloadTexture => _module.UnloadTexture;
/// See [RaylibCore.IsRenderTextureValid].
XF1<bool> get IsRenderTextureValid => _module.IsRenderTextureValid;
/// See [RaylibCore.UnloadRenderTexture].
XF1<void> get UnloadRenderTexture => _module.UnloadRenderTexture;
/// See [RaylibCore.UpdateTexture].
XF2<void> get UpdateTexture => _module.UpdateTexture;
/// See [RaylibCore.UpdateTextureRec].
XF3<void> get UpdateTextureRec => _module.UpdateTextureRec;
/// See [RaylibCore.GenTextureMipmaps].
XF1<void> get GenTextureMipmaps => _module.GenTextureMipmaps;
/// See [RaylibCore.SetTextureFilter].
XF2<void> get SetTextureFilter => _module.SetTextureFilter;
/// See [RaylibCore.SetTextureWrap].
XF2<void> get SetTextureWrap => _module.SetTextureWrap;
/// See [RaylibCore.DrawTexture].
XF4<void> get DrawTexture => _module.DrawTexture;
/// See [RaylibCore.DrawTextureV].
XF3<void> get DrawTextureV => _module.DrawTextureV;
/// See [RaylibCore.DrawTextureEx].
XF5<void> get DrawTextureEx => _module.DrawTextureEx;
/// See [RaylibCore.DrawTextureRec].
XF4<void> get DrawTextureRec => _module.DrawTextureRec;
/// See [RaylibCore.DrawTexturePro].
XF6<void> get DrawTexturePro => _module.DrawTexturePro;
/// See [RaylibCore.DrawTextureNPatch].
XF6<void> get DrawTextureNPatch => _module.DrawTextureNPatch;
/// See [RaylibCore.ColorIsEqual].
XF2<bool> get ColorIsEqual => _module.ColorIsEqual;
/// See [RaylibCore.Fade].
XF3<void> get Fade => _module.Fade;
/// See [RaylibCore.ColorToInt].
XF1<int> get ColorToInt => _module.ColorToInt;
/// See [RaylibCore.ColorNormalize].
XF2<void> get ColorNormalize => _module.ColorNormalize;
/// See [RaylibCore.ColorFromNormalized].
XF2<void> get ColorFromNormalized => _module.ColorFromNormalized;
/// See [RaylibCore.ColorToHSV].
XF2<void> get ColorToHSV => _module.ColorToHSV;
/// See [RaylibCore.ColorFromHSV].
XF4<void> get ColorFromHSV => _module.ColorFromHSV;
/// See [RaylibCore.ColorTint].
XF3<void> get ColorTint => _module.ColorTint;
/// See [RaylibCore.ColorBrightness].
XF3<void> get ColorBrightness => _module.ColorBrightness;
/// See [RaylibCore.ColorContrast].
XF3<void> get ColorContrast => _module.ColorContrast;
/// See [RaylibCore.ColorAlpha].
XF3<void> get ColorAlpha => _module.ColorAlpha;
/// See [RaylibCore.ColorAlphaBlend].
XF4<void> get ColorAlphaBlend => _module.ColorAlphaBlend;
/// See [RaylibCore.ColorLerp].
XF4<void> get ColorLerp => _module.ColorLerp;
/// See [RaylibCore.GetColor].
XF2<void> get GetColor => _module.GetColor;
/// See [RaylibCore.GetPixelColor].
XF3<void> get GetPixelColor => _module.GetPixelColor;
/// See [RaylibCore.SetPixelColor].
XF3<void> get SetPixelColor => _module.SetPixelColor;
/// See [RaylibCore.GetPixelDataSize].
XF3<int> get GetPixelDataSize => _module.GetPixelDataSize;
/// See [RaylibCore.GetFontDefault].
XF1<void> get GetFontDefault => _module.GetFontDefault;
/// See [RaylibCore.LoadFont].
XF2<void> get LoadFont => _module.LoadFont;
/// See [RaylibCore.LoadFontEx].
XF5<void> get LoadFontEx => _module.LoadFontEx;
/// See [RaylibCore.LoadFontFromImage].
XF4<void> get LoadFontFromImage => _module.LoadFontFromImage;
/// See [RaylibCore.LoadFontFromMemory].
XF7<void> get LoadFontFromMemory => _module.LoadFontFromMemory;
/// See [RaylibCore.IsFontValid].
XF1<bool> get IsFontValid => _module.IsFontValid;
/// See [RaylibCore.LoadFontData].
XF7<XStructPtr<GlyphInfo>> get LoadFontData => _module.LoadFontData;
/// See [RaylibCore.GenImageFontAtlas].
XF7<void> get GenImageFontAtlas => _module.GenImageFontAtlas;
/// See [RaylibCore.UnloadFontData].
XF2<void> get UnloadFontData => _module.UnloadFontData;
/// See [RaylibCore.UnloadFont].
XF1<void> get UnloadFont => _module.UnloadFont;
/// See [RaylibCore.ExportFontAsCode].
XF2<bool> get ExportFontAsCode => _module.ExportFontAsCode;
/// See [RaylibCore.DrawFPS].
XF2<void> get DrawFPS => _module.DrawFPS;
/// See [RaylibCore.DrawText].
XF5<void> get DrawText => _module.DrawText;
/// See [RaylibCore.DrawTextEx].
XF6<void> get DrawTextEx => _module.DrawTextEx;
/// See [RaylibCore.DrawTextPro].
XF8<void> get DrawTextPro => _module.DrawTextPro;
/// See [RaylibCore.DrawTextCodepoint].
XF5<void> get DrawTextCodepoint => _module.DrawTextCodepoint;
/// See [RaylibCore.DrawTextCodepoints].
XF7<void> get DrawTextCodepoints => _module.DrawTextCodepoints;
/// See [RaylibCore.SetTextLineSpacing].
XF1<void> get SetTextLineSpacing => _module.SetTextLineSpacing;
/// See [RaylibCore.MeasureText].
XF2<int> get MeasureText => _module.MeasureText;
/// See [RaylibCore.MeasureTextEx].
XF5<void> get MeasureTextEx => _module.MeasureTextEx;
/// See [RaylibCore.MeasureTextCodepoints].
XF6<void> get MeasureTextCodepoints => _module.MeasureTextCodepoints;
/// See [RaylibCore.GetGlyphIndex].
XF2<int> get GetGlyphIndex => _module.GetGlyphIndex;
/// See [RaylibCore.GetGlyphInfo].
XF3<void> get GetGlyphInfo => _module.GetGlyphInfo;
/// See [RaylibCore.GetGlyphAtlasRec].
XF3<void> get GetGlyphAtlasRec => _module.GetGlyphAtlasRec;
/// See [RaylibCore.LoadUTF8].
XF2<XWasmPtr<XChar>> get LoadUTF8 => _module.LoadUTF8;
/// See [RaylibCore.UnloadUTF8].
XF1<void> get UnloadUTF8 => _module.UnloadUTF8;
/// See [RaylibCore.LoadCodepoints].
XF2<XWasmPtr<XInt>> get LoadCodepoints => _module.LoadCodepoints;
/// See [RaylibCore.UnloadCodepoints].
XF1<void> get UnloadCodepoints => _module.UnloadCodepoints;
/// See [RaylibCore.GetCodepointCount].
XF1<int> get GetCodepointCount => _module.GetCodepointCount;
/// See [RaylibCore.GetCodepoint].
XF2<int> get GetCodepoint => _module.GetCodepoint;
/// See [RaylibCore.GetCodepointNext].
XF2<int> get GetCodepointNext => _module.GetCodepointNext;
/// See [RaylibCore.GetCodepointPrevious].
XF2<int> get GetCodepointPrevious => _module.GetCodepointPrevious;
/// See [RaylibCore.CodepointToUTF8].
XF2<XWasmPtr<XChar>> get CodepointToUTF8 => _module.CodepointToUTF8;
/// See [RaylibCore.LoadTextLines].
XF2<XWasmPtr<XPtrType<XChar>>> get LoadTextLines => _module.LoadTextLines;
/// See [RaylibCore.UnloadTextLines].
XF2<void> get UnloadTextLines => _module.UnloadTextLines;
/// See [RaylibCore.TextCopy].
XF2<int> get TextCopy => _module.TextCopy;
/// See [RaylibCore.TextIsEqual].
XF2<bool> get TextIsEqual => _module.TextIsEqual;
/// See [RaylibCore.TextLength].
XF1<int> get TextLength => _module.TextLength;
/// See [RaylibCore.TextFormat].
XF1<XWasmPtr<XChar>> get TextFormat => _module.TextFormat;
/// See [RaylibCore.TextSubtext].
XF3<XWasmPtr<XChar>> get TextSubtext => _module.TextSubtext;
/// See [RaylibCore.TextRemoveSpaces].
XF1<XWasmPtr<XChar>> get TextRemoveSpaces => _module.TextRemoveSpaces;
/// See [RaylibCore.GetTextBetween].
XF3<XWasmPtr<XChar>> get GetTextBetween => _module.GetTextBetween;
/// See [RaylibCore.TextReplace].
XF3<XWasmPtr<XChar>> get TextReplace => _module.TextReplace;
/// See [RaylibCore.TextReplaceAlloc].
XF3<XWasmPtr<XChar>> get TextReplaceAlloc => _module.TextReplaceAlloc;
/// See [RaylibCore.TextReplaceBetween].
XF4<XWasmPtr<XChar>> get TextReplaceBetween => _module.TextReplaceBetween;
/// See [RaylibCore.TextReplaceBetweenAlloc].
XF4<XWasmPtr<XChar>> get TextReplaceBetweenAlloc => _module.TextReplaceBetweenAlloc;
/// See [RaylibCore.TextInsert].
XF3<XWasmPtr<XChar>> get TextInsert => _module.TextInsert;
/// See [RaylibCore.TextInsertAlloc].
XF3<XWasmPtr<XChar>> get TextInsertAlloc => _module.TextInsertAlloc;
/// See [RaylibCore.TextJoin].
XF3<XWasmPtr<XChar>> get TextJoin => _module.TextJoin;
/// See [RaylibCore.TextSplit].
XF3<XWasmPtr<XPtrType<XChar>>> get TextSplit => _module.TextSplit;
/// See [RaylibCore.TextAppend].
XF3<void> get TextAppend => _module.TextAppend;
/// See [RaylibCore.TextFindIndex].
XF2<int> get TextFindIndex => _module.TextFindIndex;
/// See [RaylibCore.TextToUpper].
XF1<XWasmPtr<XChar>> get TextToUpper => _module.TextToUpper;
/// See [RaylibCore.TextToLower].
XF1<XWasmPtr<XChar>> get TextToLower => _module.TextToLower;
/// See [RaylibCore.TextToPascal].
XF1<XWasmPtr<XChar>> get TextToPascal => _module.TextToPascal;
/// See [RaylibCore.TextToSnake].
XF1<XWasmPtr<XChar>> get TextToSnake => _module.TextToSnake;
/// See [RaylibCore.TextToCamel].
XF1<XWasmPtr<XChar>> get TextToCamel => _module.TextToCamel;
/// See [RaylibCore.TextToInteger].
XF1<int> get TextToInteger => _module.TextToInteger;
/// See [RaylibCore.TextToFloat].
XF1<double> get TextToFloat => _module.TextToFloat;
/// See [RaylibCore.DrawLine3D].
XF3<void> get DrawLine3D => _module.DrawLine3D;
/// See [RaylibCore.DrawPoint3D].
XF2<void> get DrawPoint3D => _module.DrawPoint3D;
/// See [RaylibCore.DrawCircle3D].
XF5<void> get DrawCircle3D => _module.DrawCircle3D;
/// See [RaylibCore.DrawTriangle3D].
XF4<void> get DrawTriangle3D => _module.DrawTriangle3D;
/// See [RaylibCore.DrawTriangleStrip3D].
XF3<void> get DrawTriangleStrip3D => _module.DrawTriangleStrip3D;
/// See [RaylibCore.DrawCube].
XF5<void> get DrawCube => _module.DrawCube;
/// See [RaylibCore.DrawCubeV].
XF3<void> get DrawCubeV => _module.DrawCubeV;
/// See [RaylibCore.DrawCubeWires].
XF5<void> get DrawCubeWires => _module.DrawCubeWires;
/// See [RaylibCore.DrawCubeWiresV].
XF3<void> get DrawCubeWiresV => _module.DrawCubeWiresV;
/// See [RaylibCore.DrawSphere].
XF3<void> get DrawSphere => _module.DrawSphere;
/// See [RaylibCore.DrawSphereEx].
XF5<void> get DrawSphereEx => _module.DrawSphereEx;
/// See [RaylibCore.DrawSphereWires].
XF5<void> get DrawSphereWires => _module.DrawSphereWires;
/// See [RaylibCore.DrawCylinder].
XF6<void> get DrawCylinder => _module.DrawCylinder;
/// See [RaylibCore.DrawCylinderEx].
XF6<void> get DrawCylinderEx => _module.DrawCylinderEx;
/// See [RaylibCore.DrawCylinderWires].
XF6<void> get DrawCylinderWires => _module.DrawCylinderWires;
/// See [RaylibCore.DrawCylinderWiresEx].
XF6<void> get DrawCylinderWiresEx => _module.DrawCylinderWiresEx;
/// See [RaylibCore.DrawCapsule].
XF6<void> get DrawCapsule => _module.DrawCapsule;
/// See [RaylibCore.DrawCapsuleWires].
XF6<void> get DrawCapsuleWires => _module.DrawCapsuleWires;
/// See [RaylibCore.DrawPlane].
XF3<void> get DrawPlane => _module.DrawPlane;
/// See [RaylibCore.DrawRay].
XF2<void> get DrawRay => _module.DrawRay;
/// See [RaylibCore.DrawGrid].
XF2<void> get DrawGrid => _module.DrawGrid;
/// See [RaylibCore.LoadModel].
XF2<void> get LoadModel => _module.LoadModel;
/// See [RaylibCore.LoadModelFromMesh].
XF2<void> get LoadModelFromMesh => _module.LoadModelFromMesh;
/// See [RaylibCore.IsModelValid].
XF1<bool> get IsModelValid => _module.IsModelValid;
/// See [RaylibCore.UnloadModel].
XF1<void> get UnloadModel => _module.UnloadModel;
/// See [RaylibCore.GetModelBoundingBox].
XF2<void> get GetModelBoundingBox => _module.GetModelBoundingBox;
/// See [RaylibCore.DrawModel].
XF4<void> get DrawModel => _module.DrawModel;
/// See [RaylibCore.DrawModelEx].
XF6<void> get DrawModelEx => _module.DrawModelEx;
/// See [RaylibCore.DrawModelWires].
XF4<void> get DrawModelWires => _module.DrawModelWires;
/// See [RaylibCore.DrawModelWiresEx].
XF6<void> get DrawModelWiresEx => _module.DrawModelWiresEx;
/// See [RaylibCore.DrawBoundingBox].
XF2<void> get DrawBoundingBox => _module.DrawBoundingBox;
/// See [RaylibCore.DrawBillboard].
XF5<void> get DrawBillboard => _module.DrawBillboard;
/// See [RaylibCore.DrawBillboardRec].
XF6<void> get DrawBillboardRec => _module.DrawBillboardRec;
/// See [RaylibCore.DrawBillboardPro].
XF9<void> get DrawBillboardPro => _module.DrawBillboardPro;
/// See [RaylibCore.UploadMesh].
XF2<void> get UploadMesh => _module.UploadMesh;
/// See [RaylibCore.UpdateMeshBuffer].
XF5<void> get UpdateMeshBuffer => _module.UpdateMeshBuffer;
/// See [RaylibCore.UnloadMesh].
XF1<void> get UnloadMesh => _module.UnloadMesh;
/// See [RaylibCore.DrawMesh].
XF3<void> get DrawMesh => _module.DrawMesh;
/// See [RaylibCore.DrawMeshInstanced].
XF4<void> get DrawMeshInstanced => _module.DrawMeshInstanced;
/// See [RaylibCore.GetMeshBoundingBox].
XF2<void> get GetMeshBoundingBox => _module.GetMeshBoundingBox;
/// See [RaylibCore.GenMeshTangents].
XF1<void> get GenMeshTangents => _module.GenMeshTangents;
/// See [RaylibCore.ExportMesh].
XF2<bool> get ExportMesh => _module.ExportMesh;
/// See [RaylibCore.ExportMeshAsCode].
XF2<bool> get ExportMeshAsCode => _module.ExportMeshAsCode;
/// See [RaylibCore.GenMeshPoly].
XF3<void> get GenMeshPoly => _module.GenMeshPoly;
/// See [RaylibCore.GenMeshPlane].
XF5<void> get GenMeshPlane => _module.GenMeshPlane;
/// See [RaylibCore.GenMeshCube].
XF4<void> get GenMeshCube => _module.GenMeshCube;
/// See [RaylibCore.GenMeshSphere].
XF4<void> get GenMeshSphere => _module.GenMeshSphere;
/// See [RaylibCore.GenMeshHemiSphere].
XF4<void> get GenMeshHemiSphere => _module.GenMeshHemiSphere;
/// See [RaylibCore.GenMeshCylinder].
XF4<void> get GenMeshCylinder => _module.GenMeshCylinder;
/// See [RaylibCore.GenMeshCone].
XF4<void> get GenMeshCone => _module.GenMeshCone;
/// See [RaylibCore.GenMeshTorus].
XF5<void> get GenMeshTorus => _module.GenMeshTorus;
/// See [RaylibCore.GenMeshKnot].
XF5<void> get GenMeshKnot => _module.GenMeshKnot;
/// See [RaylibCore.GenMeshHeightmap].
XF3<void> get GenMeshHeightmap => _module.GenMeshHeightmap;
/// See [RaylibCore.GenMeshCubicmap].
XF3<void> get GenMeshCubicmap => _module.GenMeshCubicmap;
/// See [RaylibCore.LoadMaterials].
XF2<XStructPtr<Material>> get LoadMaterials => _module.LoadMaterials;
/// See [RaylibCore.LoadMaterialDefault].
XF1<void> get LoadMaterialDefault => _module.LoadMaterialDefault;
/// See [RaylibCore.IsMaterialValid].
XF1<bool> get IsMaterialValid => _module.IsMaterialValid;
/// See [RaylibCore.UnloadMaterial].
XF1<void> get UnloadMaterial => _module.UnloadMaterial;
/// See [RaylibCore.SetMaterialTexture].
XF3<void> get SetMaterialTexture => _module.SetMaterialTexture;
/// See [RaylibCore.SetModelMeshMaterial].
XF3<void> get SetModelMeshMaterial => _module.SetModelMeshMaterial;
/// See [RaylibCore.LoadModelAnimations].
XF2<XStructPtr<ModelAnimation>> get LoadModelAnimations => _module.LoadModelAnimations;
/// See [RaylibCore.UpdateModelAnimation].
XF3<void> get UpdateModelAnimation => _module.UpdateModelAnimation;
/// See [RaylibCore.UpdateModelAnimationEx].
XF6<void> get UpdateModelAnimationEx => _module.UpdateModelAnimationEx;
/// See [RaylibCore.UnloadModelAnimations].
XF2<void> get UnloadModelAnimations => _module.UnloadModelAnimations;
/// See [RaylibCore.IsModelAnimationValid].
XF2<bool> get IsModelAnimationValid => _module.IsModelAnimationValid;
/// See [RaylibCore.CheckCollisionSpheres].
XF4<bool> get CheckCollisionSpheres => _module.CheckCollisionSpheres;
/// See [RaylibCore.CheckCollisionBoxes].
XF2<bool> get CheckCollisionBoxes => _module.CheckCollisionBoxes;
/// See [RaylibCore.CheckCollisionBoxSphere].
XF3<bool> get CheckCollisionBoxSphere => _module.CheckCollisionBoxSphere;
/// See [RaylibCore.GetRayCollisionSphere].
XF4<void> get GetRayCollisionSphere => _module.GetRayCollisionSphere;
/// See [RaylibCore.GetRayCollisionBox].
XF3<void> get GetRayCollisionBox => _module.GetRayCollisionBox;
/// See [RaylibCore.GetRayCollisionMesh].
XF4<void> get GetRayCollisionMesh => _module.GetRayCollisionMesh;
/// See [RaylibCore.GetRayCollisionTriangle].
XF5<void> get GetRayCollisionTriangle => _module.GetRayCollisionTriangle;
/// See [RaylibCore.GetRayCollisionQuad].
XF6<void> get GetRayCollisionQuad => _module.GetRayCollisionQuad;