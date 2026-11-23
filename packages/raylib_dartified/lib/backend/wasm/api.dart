export 'package:raylib_dartified/raylib_dartified.dart';
export 'core/backend.dart';
export 'package:xffi_web_emscripten/xffi_web_emscripten.dart';

import 'dart:async';
import 'dart:js_interop';
import '';

@JS('dartMain')
external set _dartMain(JSFunction f);

@JS('requestAnimationFrame')
external void _requestAnimationFrame(JSFunction callback);

RaylibBackendImplementation createBackend() => WebBackend();

Map<RaylibSupportedLibs, XLibrarySource?> resolveRaylibLibs(String? folder) => const {};

final class WebBackend implements RaylibBackendImplementation {
  @override
  void start(Raylib rl, Map<RaylibSupportedLibs, XLibrarySource?> libs, void Function() ready) {
    _dartMain = ready.toJS;
  }

  @override
  void registerModules(Raylib rl) {
    // extensions
    rl.registerModule(RaylibMatrixExt(rl));
    rl.registerModule<RaylibMatrixFlatExt>(RaylibMatrixFlatExtWeb(rl));

    rl.registerModule(RaylibQuaternionExt(rl));
    rl.registerModule<RaylibQuaternionFlatExt>(RaylibQuaternionFlatExtWeb(rl));

    rl.registerModule(RaylibVector2Ext(rl));
    rl.registerModule<RaylibVector2FlatExt>(RaylibVector2FlatExtWeb(rl));

    rl.registerModule(RaylibVector3Ext(rl));
    rl.registerModule<RaylibVector3FlatExt>(RaylibVector3FlatExtWeb(rl));

    rl.registerModule(RaylibVector4Ext(rl));
    rl.registerModule<RaylibVector4FlatExt>(RaylibVector4FlatExtWeb(rl));

    // modules
    rl.registerModule(RaylibAudio(rl));
    rl.registerModule<RaylibAudioFlat>(RaylibAudioFlatWeb(rl));

    rl.registerModule(RaylibCamera(rl));
    rl.registerModule<RaylibCameraFlat>(RaylibCameraFlatWeb(rl));
    
    rl.registerModule(RaylibCore(rl));
    rl.registerModule<RaylibCoreFlat>(RaylibCoreFlatWeb(rl));
    
    rl.registerModule(RaylibGui(rl));
    rl.registerModule<RaylibGuiFlat>(RaylibGuiFlatWeb(rl));

    rl.registerModule(RaylibLight(rl));
    rl.registerModule<RaylibLightFlat>(RaylibLightFlatWeb(rl));

    rl.registerModule(RaylibMsfGif(rl));
    rl.registerModule<RaylibMsfGifFlat>(RaylibMsfGifFlatWeb(rl));
    
    rl.registerModule(RaylibRlgl(rl));
    rl.registerModule<RaylibRlglFlat>(RaylibRlglFlatWeb(rl));
  }

  @override
  Future<void> loop(Future<bool> Function() tick) {
    final done = Completer<void>();
    late final JSFunction cb;
    cb = ((JSAny _) {
      tick().then((go) {
        if (go) {
          _requestAnimationFrame(cb);
        } else {
          done.complete();
        }
      }, onError: done.completeError);
    }).toJS;
    _requestAnimationFrame(cb);
    return done.future;
  }
}