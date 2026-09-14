# Raylib for Dart (FFI)

A **Dart-first**, modular set of **FFI bindings for [raylib](https://www.raylib.com/)**.

This project exposes raylib through an idiomatic Dart API while staying close to the original C design. Most bindings are generated using `ffigen`, but this project goes significantly beyond raw `ffigen` output.

In short: **`ffigen` gives you the raw function table. This project gives you something you can actually use.**

<p align="center"><img src="raylib_dartified.png" width="128px"></p>

---

## Contents
- [Version 6.0](#version-60)
- [Platform Support](#platform-support)
- [Installation](#installation)
- [API Tiers](#api-tiers)
  - [Dart API](#dart-api)
  - [Flat API](#flat-api---backend-agnostic-low-level-api)
  - [FFI API](#ffi-api---full-native-control)
- [Abbreviated API](#abbreviated-api)
- [Writing Backend-Agnostic Apps](#writing-backend-agnostic-apps)
- [Safety Notes](#safety-notes)
- [Examples](#examples)
  - [Running Examples](#running-examples)
- [See Also](#see-also)
- [License](#license)
- [Acknowledgements](#acknowledgements)

---

# Version 6.0

Version 6.0 is a full rewrite of the binding layer around a backend-agnostic
core: a single `MemoryPointer<X extends RType>` abstraction replaces the
separate native (dart:ffi) and WASM struct implementations, collapsing what
was previously duplicated per-backend code.

> ⚠️ **Use 6.0 for new projects.** The 5.5 line was never truly
> backend-agnostic, native and WASM paths diverged in ways that made
> maintenance and correctness guarantees difficult. 5.5 remains published but receives no further development.

# Platform Support

| Platform | Status | Notes |
|---|:-:|---|
| **Linux** | ✅ | Primary development platform |
| **Windows** | ✅ | Should work out of the box |
| **macOS** | ❌ | See below |
| **Web** | ❌ | See [`raylib_dartified_web`](https://pub.dev/packages/raylib_dartified_web) instead |
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

# Installation

This package currently assumes you already have **raylib compiled** for your platform.

Place the compiled library somewhere in your project tree (or in a parent directory). The expected filenames are platform-specific:

| Platform | raylib | raygui (optional) |
|----------|--------|-------------------|
| Linux | `libraylib.so` | `libraygui.so` |
| Windows | `raylib.dll` | `raygui.dll` |
| macOS | `libraylib.dylib` | `libraygui.dylib` |

Then pass the folder path to `findRaylib`:

```dart
final rl = findRaylib('raylib-6.0_linux_amd64/lib');
```

`findRaylib` walks **up from the current working directory** until it finds a folder matching the given path. The path therefore does not need to be absolute.

If `raygui` is present in the same folder, it is loaded automatically. If it is not present, it is silently skipped.

For explicit control over library paths, use the `Raylib` constructor directly:

```dart
final rl = Raylib(
  core: '/absolute/path/to/libraylib.so',
  gui: '/absolute/path/to/libraygui.so', // optional
);
```

---

# API Tiers

This package provides three API layers. They all expose the same underlying raylib functionality, but offer different levels of abstraction and control.

| API | Memory | Backend | Style |
|-----|--------|---------|-------|
| **Dart** | Managed by Dart layer | Native + Web | Idiomatic Dart |
| **Flat** | Manual | Native + Web | Close to raylib C API |
| **FFI** | Manual | Native only | Direct FFI |

---

## Dart API

Provides idiomatic Dart types and objects which manage their own data and memory. Structs can exist as ordinary Dart values or act as live views over native/backend memory when needed.

The Dart API handles most pointer lifetimes, native struct layouts, null terminators, and other low-level details for you.

### ⚠️ Stability

The **Dart API** is convenient, but **not yet battle-tested at the level the Flat API is**. It's a comparatively young abstraction sitting on top of raw memory access, and it's the kind of thing where a subtle mistake in a single getter/setter can produce backend-specific memory corruption that's silent, hard to reproduce, and only shows up under certain conditions (particular platforms, particular allocation patterns, etc.).

**Recommendation:** for anything where correctness matters, performance matters, or anything touching raw pixel/buffer data, prefer the **Flat API**. It's intentionally modeled after `dart:ffi`'s direct pointer semantics (just platform-independent), which makes the memory access explicit and auditable rather than hidden behind wrapper abstractions. It's more verbose, but what you see is what actually happens.

If you hit a bug that smells like memory corruption (garbage data, platform-specific weirdness, things that work on native but not on WASM or vice versa) while using the **Dart API**, try reproducing it with the **Flat API** first, it's the more trustworthy baseline while **Dart API** matures.

### Usage

Each raylib module has a corresponding Dart counterpart, both accessible from the same `Raylib` instance via `module<T>()`:

| FFI | Flat | Dart |
|-----|------|------|
| `rl.module<RaylibCore>()` | `rl.module<RaylibCoreFlat>()` | `rl.module<RaylibCoreDart>()` |
| `rl.module<RaylibRlgl>()` | `rl.module<RaylibRlglFlat>()` | `rl.module<RaylibRlglDart>()` |
| `rl.module<RaylibGui>()` | `rl.module<RaylibGuiFlat>()` | `rl.module<RaylibGuiDart>()` |
| ... | ... | ... |

You are **not required to choose one API layer exclusively**. The layers can coexist, and it is perfectly valid to use the lower-level APIs when necessary.

See any `dart` example in `example/<category>/dart/`.

Or start here:

[core/dart/core_basic_window.dart](example/core/dart/core_basic_window.dart)

---

## Flat API - Backend-Agnostic Low-Level API

The **Flat API** is for when you want the raylib API to remain close to the original C interface, but you **do not want your code to depend on platform-specific pointer types**.

It exposes essentially the same flat, 1:1 function-oriented API as raylib, but replaces native `Pointer<T>` usage with the package's backend-independent `MemoryPointer` abstraction.

This makes the Flat API usable across both **native and web/WASM backends**.

For example:

```dart
final ptr = Int32$.Value(42);

print(ptr.value);

ptr.free();
```

The underlying memory implementation is supplied by the active backend. Native builds use FFI-backed memory, while web builds use the appropriate WASM memory implementation.

The Flat API therefore sits between the two other layers:

```text
        Dart API
High-level / backend-agnostic
            │
            ▼
        Flat API
Low-level / backend-agnostic
            │
            ▼
         FFI API
     Native / Pointer<T>
```

Use Flat when you want:

- raylib's original function-oriented API;
- direct control over memory and struct values;
- minimal abstraction over the C API;
- the ability to run the same code on native and web/WASM.

If you need actual `dart:ffi` `Pointer<T>` objects, use the FFI API instead.

See any `flat` example in `example/<category>/flat/`.

Or start here:

[core/flat/core_basic_window.dart](example/core/flat/core_basic_window.dart)

---

## FFI API - Full Native Control

If you really want to manage your own pointers and interact directly with the native FFI layer, you can.

This layer exposes raylib's native signatures essentially 1:1:

- `Pointer<T>`
- `ffi.Struct`
- manual allocation and freeing;
- direct interaction with the generated FFI bindings.

The trade-off is that this layer is **native-only** and ties your code directly to `dart:ffi`.

If you do not specifically need native FFI pointers, **prefer the Flat API instead**.

See any `ffi` example in `example/<category>/ffi/`.

Or start here:

[core/ffi/core_basic_window.dart](example/core/ffi/core_basic_window.dart)

---

# Abbreviated API

If you want raylib's functions without any namespacing, you can use one of the abbreviated APIs.

The `abbr/` variants expose the same three API tiers without requiring a module prefix:

- **`abbr/dart.dart`** - Idiomatic Dart API. Backend-agnostic.
- **`abbr/flat.dart`** - Flat raylib-style API using `MemoryPointer`. Backend-agnostic.
- **`abbr/ffi.dart`** - FFI API using native `Pointer<T>`. Native-only.

Pick **one** per file. Mixing abbreviated APIs in the same scope will cause name collisions.

### Dart

```dart
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  findRaylib('path/to/raylib');

  InitWindow(800, 600, 'Title');
  SetTargetFPS(60);

  // ... and so on, exactly like the raylib C API

  disposeRaylib();
}
```

### Flat

The same raylib-style API, but with backend-independent memory:

```dart
import 'package:raylib_dartified/abbr/flat.dart';

void main() {
  findRaylib('path/to/raylib');

  InitWindow(800, 600, 'Title'.toC);
  SetTargetFPS(60);

  final ptr = Int32$.Value(42);
  ptr.free();

  // ... and so on

  disposeRaylib();
}
```

### FFI

The same API directly against the native FFI layer:

```dart
import 'package:raylib_dartified/abbr/ffi.dart';

void main() {
  findRaylib('path/to/raylib');

  InitWindow(800, 600, 'Title'.toNativeUtf8().cast());
  SetTargetFPS(60);

  final ptr = calloc<Int32>()..value = 42;
  calloc.free(ptr);

  // ... and so on

  disposeRaylib();
}
```

---

# Writing Backend-Agnostic Apps

To write an app once and run it on both backends, implement
`RaylibAppBase` and let each backend's `runRaylib` drive the lifecycle.

See [api/dart/backend_agnostic.dart](example/api/dart/backend_agnostic.dart)

---

# Safety Notes

The lower you go in the API stack, the more responsibility you take for memory management.

- This is **not memory-safe Dart** when using the FFI layer.
- Passing invalid native pointers can crash the Dart VM.
- Manually allocated memory must be freed by its owner.
- Optional modules such as `Gui` are unavailable if their native library was not loaded.
- The Flat API removes platform-specific pointer types, but it still exposes manual memory management.

---

# Examples

This repository includes ported raylib examples rewritten to use the Dart APIs exposed here.

The examples closely follow the **original raylib examples**, making it easy to cross-reference the Dart implementation with the original C source.

Every example has a **Dart version**, while only selected examples also have **FFI** and **Flat** versions.

The reason is simple: the Dart versions remain close to the original raylib examples, while the lower-level APIs introduce memory-management and pointer-related details that would make the examples harder to cross-reference.

See the [example/](example/) directory for runnable examples.

> **Warning:** Some examples require the `resources/` directory from the original raylib source.  
> If so, copy the `resources/` folder into `example/<category>/`.

---

## Running Examples

Examples expect the following file to exist somewhere in the current directory or one of its parents:

```text
raylib-6.0_linux_amd64/lib/libraylib.so
```

Then run an example with:

```bash
dart run <example>
```

### Linux / Wayland

If you are running under Wayland but want to force X11:

```bash
WAYLAND_DISPLAY= XDG_SESSION_TYPE=x11 dart run <example>
```

---

# See Also

- [LIMITATIONS.md](LIMITATIONS.md)

---

# License

This project is released under the **zlib/libpng license**.

It contains bindings and rewritten components derived from [raylib](https://www.raylib.com/), which is also licensed under zlib.

See [LICENSE](LICENSE) for details.

---

# Acknowledgements

- [raylib](https://www.raylib.com/) by Ramon Santamaria
- Dart FFI
- `ffigen`

PRs, issues, and experiments are welcome.
