part of 'raylib_dartified_web.dart';

@JS('dartMain')
external set _dartMain(JSFunction f);

@JS('requestAnimationFrame')
external void _requestAnimationFrame(JSFunction callback);

/// Base class for WASM-backed Raylib modules.
///
/// Arity and (sort of) type-checked `cwrap` bindings.
abstract class RaylibModuleWasm extends RaylibModule<Raylib> with WasmBindings {
  RaylibModuleWasm(super.rl);
}

final class Raylib extends RaylibBase {
  static Raylib get instance => RaylibBase.getInstance();

  @override
  void logInfo(Object? message) => console.log('[Raylib] $message');
  
  @override
  void logWarn(Object? message) => console.warn('[Raylib] $message');

  @override
  void logError(Object? message) => console.error('[Raylib] $message');

  Raylib(void Function(Raylib) dartMain, {
    super.random,
    super.silent,
  }) {
    _dartMain = (() {
      boot();
      _init();
      dartMain(this);
    }).toJS;
  }

  void _init() {
    // extensions
    registerModule(RaylibMatrixExt(this));
    registerModule<RaylibMatrixFlatExt>(RaylibMatrixExtFlatWeb(this));

    registerModule(RaylibQuaternionExt(this));
    registerModule<RaylibQuaternionFlatExt>(RaylibQuaternionExtFlatWeb(this));

    registerModule(RaylibVector2Ext(this));
    registerModule<RaylibVector2FlatExt>(RaylibVector2ExtFlatWeb(this));

    registerModule(RaylibVector3Ext(this));
    registerModule<RaylibVector3FlatExt>(RaylibVector3ExtFlatWeb(this));

    registerModule(RaylibVector4Ext(this));
    registerModule<RaylibVector4FlatExt>(RaylibVector4ExtFlatWeb(this));

    // modules
    registerModule(RaylibAudio(this));
    registerModule<RaylibAudioFlat>(RaylibAudioFlatWeb(this));

    registerModule(RaylibCamera(this));
    registerModule<RaylibCameraFlat>(RaylibCameraFlatWeb(this));
    
    registerModule(RaylibCore(this));
    registerModule<RaylibCoreFlat>(RaylibCoreFlatWeb(this));
    
    registerModule(RaylibGui(this));
    registerModule<RaylibGuiFlat>(RaylibGuiFlatWeb(this));

    registerModule(RaylibLight(this));
    registerModule<RaylibLightFlat>(RaylibLightFlatWeb(this));

    registerModule(RaylibMsfGif(this));
    registerModule<RaylibMsfGifFlat>(RaylibMsfGifFlatWeb(this));
    
    registerModule(RaylibRlgl(this));
    registerModule<RaylibRlglFlat>(RaylibRlglFlatWeb(this));
  }

  bool _canceled = false;
  void cancelMainLoop() => _canceled = true;

  void setMainLoop(FutureOr<void> Function() loop) {
    late final void Function(JSAny) tick;

    void scheduleNext() => _requestAnimationFrame(tick.toJS);

    tick = (JSAny _) {
      if (_canceled) {
        _canceled = false;
        return;
      }

      final result = loop();
      
      if (result is Future<void>) {
        result.then((_) {
          if (!_canceled) {
            scheduleNext();
          } else {
            _canceled = false;
          }
        });
      } else {
        scheduleNext();
      }
    };

    scheduleNext();
  }
}

/// Runs [app] on the wasm raylib backend until it closes.
///
/// Set [silent] to suppress [Raylib]'s init/dispose log output.
/// 
/// [nativeLibPath] is ignored on the web backend.
void runRaylib(RaylibAppBase<Raylib> app, {
  String? nativeLibPath,
  bool silent = false,
}) => Raylib(silent: silent, (rl) {
  app.init(rl);
  rl.setMainLoop(() async {
    if (app.shouldClose(rl)) {
      rl.cancelMainLoop();
      app.close(rl);
      app.dispose(rl);
      return;
    }
    await app.loop(rl);
  });
});