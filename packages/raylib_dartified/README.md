# Raylib Dartified

<img src="raylib_dartified.png" width="128px">

**Dart bindings for [raylib](https://www.raylib.com/), with native and WebAssembly backends.**

Raylib Dartified brings raylib's functionality to Dart through a shared, backend-independent API. It provides both low-level access to raylib and a more Dart-idiomatic interface, with separate implementations for native platforms and the web.

# Contents
- [Platform Support](#platform-support)
- [API Tiers](#api-tiers)
- [Installation & Setup](#installation--setup)
- [Examples](#examples)
- [Module revisions](#module-revisions)
- [See Also](#see-also)
- [License](#license)
- [Acknowledgements](#acknowledgements)

# Platform Support

| Platform | Status | Notes |
|---|:-:|---|
| **Linux** | ✅ | Primary development platform |
| **Windows** | ✅ | Should work out of the box |
| **macOS** | ❌ | See below |
| **Web** | ✅ | Requires a browser with WebAssembly and WebGL support, all modern browsers should qualify. |
| **Android** | ❓ | Not tested |
| **iOS** | ❓ | Not tested, likely blocked |

---

### macOS

macOS is currently **not supported** due to a fundamental limitation of the Dart standalone runtime.

Raylib (like most windowing/graphics libraries) requires OpenGL context creation and the main event loop to run on the OS main thread. In Flutter, this is somewhat worked around via platform channels, but in pure Dart FFI, the Dart VM does not run on the system's main thread, and there is no OS-level `DispatchQueue` or `NSRunLoop` set up. This causes crashes like:

> NSWindow should only be instantiated on the main thread!

This is a [known issue in the Dart SDK](https://github.com/dart-lang/sdk/issues/38315) and is not something that can be fixed at the binding layer. A native shim that bootstraps the macOS event loop and schedules Dart execution accordingly would be required, which is currently out of scope.

---

### Android / iOS

These platforms have not been tested.

- **Android** - Raylib has official Android support and Dart FFI works on Android (dynamic libraries only, no static linking). In theory, this could work, but significant platform-specific setup (NDK, CMake, Activity lifecycle integration) would be required. Untested and unsupported for now.
- **iOS** - Doubly blocked: raylib itself [does not have official iOS support](https://github.com/raysan5/raylib/discussions/2681) (there is an open PR with a community `rcore_ios.c` attempt), and Dart FFI on iOS shares the same main-thread issue as macOS. Not expected to work.

# API Tiers

These bindings provide three API layers. They all expose the same underlying raylib functionality, but offer different levels of abstraction and control.

| API | Memory | Backend | Style |
|-----|--------|---------|-------|
| **Dart** | Managed | Native + Web | Idiomatic Dart |
| **Flat** | Manual | Native + Web | Low Level |
|*<ins>BACKEND SPECIFIC</ins>*||||
| **FFI** | Manual | Native only | Direct FFI |
| **WASM** | Manual | Web only | Direct JS + WASM |

### ⚠️ Stability

The **Dart API** is convenient, but **not yet battle-tested**. It's a comparatively young abstraction sitting on top of raw memory access, and it's the kind of thing where a subtle mistake in a single getter/setter can produce backend-specific memory corruption that's silent, hard to reproduce, and only shows up under certain conditions (particular platforms, particular allocation patterns, etc.).

If you hit a bug that smells like memory corruption (garbage data, platform-specific weirdness, things that work on native but not on WASM or vice versa) while using the **Dart API**, try reproducing it with the **Flat API** first, it's the more trustworthy baseline while **Dart API** matures.

### Usage

Each raylib module has a corresponding `Dart` and `Flat` counterpart, both accessible from the same `Raylib` instance via `module<T>()`:

| FFI / WASM | Flat | Dart |
|:-----:|:------:|:------:|
| `RaylibCore` | `RaylibCoreFlat` | `RaylibCoreDart` |
| `RaylibRlgl` | `RaylibRlglFlat` | `RaylibRlglDart` |
| `RaylibGui` | `RaylibGuiFlat` | `RaylibGuiDart` |
| ... | ... | ... |

The `Dart` and `Flat` APIs are backend-agnostic and can be used interchangeably within the same application, allowing you to mix both API tiers as needed.

The `FFI` and `WASM` APIs, however, are platform-specific. Using either directly ties your application to its respective backend and prevents cross-platform compilation.

See any `dart` example in `example/<category>/dart/`.

Or start here: [core/dart/core_basic_window.dart](example/core/dart/core_basic_window.dart)

# Installation & Setup

## Native

Native platforms require raylib to be compiled for your target platform. Place the libraries somewhere in your project tree:

| Platform | raylib | <RaylibSupportedLibs.id> |
|:---:|:---:|:---:|
| Linux | `libraylib.so` | `lib<id>.so` |
| Windows | `raylib.dll` | `<id>.dll` |
| macOS | `libraylib.dylib` | `lib<id>.dylib` |

Use `resolveRaylibLibs()` to locate them:

```dart
void main() => Raylib(
  libs: resolveRaylibLibs('raylib-6.0_linux_amd64/lib'),
  main: (rl) {
    // Your application
  },
);
```

The resolver searches upward from the current working directory, so the path doesn't need to be absolute. raygui is optional and will be loaded automatically if found.

You can also specify library paths explicitly using the `libs` parameter:

```dart
Raylib(
  libs: {
    .raylib: .path('/path/to/libraylib.so'),
    .raygui: .path('/path/to/libraygui.so'),
  },
);
```

## Web / WASM

### Prerequisites

- [Emscripten (emsdk)](https://emscripten.org/docs/getting_started/downloads.html) installed and sourced
- `git`, `cmake`, and `dart` available on your PATH

### Setup

Download and build raylib for WASM:

```sh
dart run raylib_dartified:setup
```

This only needs to be done once.

### Build

Compile your application:

```sh
dart run raylib_dartified:build --entry=lib/main.dart
```

The output is written to `build/` in your current directory.

Native library resolution is not required on Web/WASM.

# Examples

Ported original raylib examples rewritten to use the APIs exposed here.

The examples closely follow the **original raylib examples**, making it easy to cross-reference the Dart implementation with the original C source.

See the [example/](example/) directory for runnable examples.

> **Warning:** Some examples require the `resources/` directory from the original raylib source.  

> **NATIVE:** Copy the `resources/` folder into `example/<category>/`. Examples expect the `resources/` folder to be located in their parent directory.

> **WEB**: Just copy-paste the `resources/` folder into your project folder or provide `--resources=<path>` option to the `raylib_dartified:build` utility.

---

## Module revisions

Some modules are sourced from external projects rather than the official
raylib repository. The following table records the exact upstream revision
used for each package version.

|Package | Module | Upstream | Revision |
|:---:|:---:|:---:|:---:|
|6.0.5|  *  | [raylib](https://github.com/raysan5/raylib) | `dbc56a87da87d973a9c5baa4e7438a9d20121d28` |
|6.0.5| Gui | [raygui](https://github.com/raysan5/raygui) | `30e303400781d3ef6e81f01e1b95cdf3b19386df` |
|___|___|___|___|

# See Also

- [LIMITATIONS.md](LIMITATIONS.md)
- [SHADER_CONVERSION.md](SHADER_CONVERSION.md)

# License

This project is released under the **zlib/libpng license**.

It contains bindings and rewritten components derived from [raylib](https://www.raylib.com/), which is also licensed under zlib.

See [LICENSE](LICENSE) for details.

# Acknowledgements

- [raylib](https://www.raylib.com/) by Ramon Santamaria
- Dart FFI
- `ffigen`

PRs, issues, and experiments are welcome.