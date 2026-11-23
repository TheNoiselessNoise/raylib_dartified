export '../core/abbr/consts.dart';
export '../raylib_dartified.dart';
import 'package:raylib_dartified/raylib_dartified.dart';

// Exports everything that can be shared across all layers.

Raylib get _rl => Raylib.instance;

/// See [Raylib.rand].
double rand() => _rl.rand();

/// See [Raylib.randC].
double randC() => _rl.randC();

/// See [Raylib.registerModule].
T registerModule<T extends XPackageModule<Raylib>>(T module)
  => _rl.registerModule(module);

/// See [Raylib.module].
T getModule<T extends XPackageModule<Raylib>>()
  => _rl.module();