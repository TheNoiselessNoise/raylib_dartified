export '../core/modules/core/abbr_consts.dart';
export '../core/modules/gui/abbr_consts.dart';
export '../core/modules/light/abbr_consts.dart';
export '../core/modules/rlgl/abbr_consts.dart';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

// Exports everything that can be used in backend specific code.

RaylibBase get _rl => RaylibBase.instance;

/// See [RaylibBase.registerModule].
T registerModule<T extends RaylibModule>(T module)
  => _rl.registerModule(module);

/// See [RaylibBase.module].
T getModule<T extends RaylibModule>()
  => _rl.module();

/// See [RaylibBase.dispose].
void disposeRaylib() => _rl.dispose();

/// See [RaylibBase.CloseWindowAndDispose].
void CloseWindowAndDispose() => _rl.CloseWindowAndDispose();