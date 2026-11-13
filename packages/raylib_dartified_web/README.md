# Raylib for Dart (WASM)

A **Dart-first**, modular **WASM bindings for [raylib](https://www.raylib.com/)** via Emscripten.

This project exposes raylib in an idiomatic Dart API targeting the browser via WebAssembly. Raylib is compiled with Emscripten and bridged to Dart through JS interop and a shared linear memory interface.

<p align="center"><img src="raylib_dartified.png" width="128px"></p>

---

## Contents
- [Platform Support](#platform-support)
- [Build](#build)
- [API Tiers](#api-tiers)
  - [Dart API](#dart-api)
  - [Flat API](#flat-api---backend-agnostic-low-level-api)
  - [WASM API](#wasm-api---full-web-control)
- [Abbreviated API](#abbreviated-api)
- [Writing Backend-Agnostic Apps](#writing-backend-agnostic-apps)
- [Safety Notes](#safety-notes)
- [Examples](#examples)
- [See Also](#see-also)
- [License](#license)
- [Acknowledgements](#acknowledgements)

---

# Platform Support

Web only. Requires a browser with WebAssembly and WebGL support, all modern browsers SHOULD qualify.

> For native platforms (Linux, Windows, etc.), see [`raylib_dartified`](https://pub.dev/packages/raylib_dartified).

# Build

### Prerequisites

- [Emscripten (emsdk)](https://emscripten.org/docs/getting_started/downloads.html) installed and sourced
- `git`, `cmake`, and `dart` on your PATH

### First-time setup

Downloads and builds raylib and setups everything for WASM via emscripten:

```sh
dart run raylib_dartified_web:setup
```

This only needs to run once.

### Building your project

```sh
dart run raylib_dartified_web:build --entry=lib/main.dart
```

Output is written to `build/` in your current directory.

# API Tiers

This package provides three API layers. They all expose the same underlying raylib functionality, but offer different levels of abstraction and control.

| API | Memory | Backend | Style |
|-----|--------|---------|-------|
| **Dart** | Managed by Dart layer | Native + Web | Idiomatic Dart |
| **Flat** | Manual | Native + Web | Close to raylib C API |
| **WASM** | Manual | Web only | Direct WASM |

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

| WASM | Flat | Dart |
|------|------|------|
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

It exposes essentially the same flat, 1:1 function-oriented API as raylib, but replaces WASM `int` usage with the package's backend-independent `XPtr` abstraction.

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
        WASM API
        Web / int
```

Use Flat when you want:

- raylib's original function-oriented API;
- direct control over memory and struct values;
- minimal abstraction over the C API;
- the ability to run the same code on native and web/WASM.

If you want to play with actual WASM side, use the WASM API instead.

See any `flat` example in `example/<category>/flat/`.

Or start here:

[core/flat/core_basic_window.dart](example/core/flat/core_basic_window.dart)

---

## WASM API - Full Web Control

If you really want to manage your own memory and interact directly with the
WASM linear memory layer, you can.

This layer exposes raylib's native signatures essentially 1:1:

- `XWasmPtr<T>` - wraps WASM's `int` pointer
- `WasmSize` - correct type sizes, including pointer-width-dependent ones
- `WasmMemory` - read, write, allocate, free, heaps... you name it
- manual allocation and freeing;
- direct interaction with the generated WASM bindings.

The trade-off is that this layer is **web-only** and ties your code directly
to the WASM memory implementation.

If you do not specifically need WASM pointers, **prefer the Flat API
instead**.

See any `wasm` example in `example/<category>/wasm/`.

Or start here:

[core/wasm/core_basic_window.dart](example/core/wasm/core_basic_window.dart)

---

# Abbreviated API

If you want raylib's functions without any namespacing, you can use one of the abbreviated APIs.

The `abbr/` variants expose the same three API tiers without requiring a module prefix:

- **`abbr/dart.dart`** - Idiomatic Dart API. Backend-agnostic.
- **`abbr/flat.dart`** - Flat raylib-style API using `XPtr`. Backend-agnostic.
- **`abbr/wasm.dart`** - WASM API. Web-only.

Pick **one** per file. Mixing abbreviated APIs in the same scope will cause name collisions.

### Dart

```dart
import 'package:raylib_dartified_web/abbr/dart.dart';

void main() => Raylib((_) {
  InitWindow(800, 600, 'Title');
  SetTargetFPS(60);

  // ... and so on, exactly like the raylib C API
});
```

### Flat

The same raylib-style API, but with backend-independent memory:

```dart
import 'package:raylib_dartified_web/abbr/flat.dart';

void main() => Raylib((_) {
  InitWindow(800, 600, 'Title'.toC);
  SetTargetFPS(60);

  final ptr = Int32$.Value(42);
  ptr.free();

  // ... and so on
});
```

### WASM

The same API directly against the WASM layer:

```dart
import 'dart:js_interop';
import 'package:raylib_dartified_web/abbr/wasm.dart';

void main() => Raylib((_) {
  InitWindow(800.toJS, 600.toJS, 'Title'.toC);
  SetTargetFPS(60.toJS);

  final ptr = WasmMemory.malloc(WasmSize.Int32);
  WasmMemory.writeInt32(ptr, 42);
  WasmMemory.free(ptr);

  // ... and so on
});
```

## Build

### Prerequisites

- [Emscripten (emsdk)](https://emscripten.org/docs/getting_started/downloads.html) installed and sourced
- `git`, `cmake`, and `dart` on your PATH

### First-time setup

Downloads and builds raylib + raygui for WASM via emscripten:

```sh
dart run raylib_dartified_web:setup
```

This only needs to run once.

### Building your project

```sh
dart run raylib_dartified_web:build --entry=lib/main.dart
```

Output is written to `build/` in your current directory.

---

# Writing Backend-Agnostic Apps

To write an app once and run it on both backends, implement
`RaylibAppBase` and let each backend's `runRaylib` drive the lifecycle.

See [api/dart/backend_agnostic.dart](example/api/dart/backend_agnostic.dart)

# Safety Notes

The lower you go in the API stack, the more responsibility you take for memory management.

- This is **not memory-safe Dart** when using the WASM linear memory directly.
- Passing invalid offsets or malformed structs will produce undefined behavior or crashes.
- Manually allocated memory must be freed by its owner.
- Optional modules such as `Gui` are unavailable if excluded in build.
- The Flat API removes platform-specific pointer types, but it still exposes manual memory management.

# Examples

This repository includes ported raylib examples rewritten to use the Dart APIs exposed here.

The examples closely follow the **original raylib examples**, making it easy to cross-reference the Dart implementation with the original C source.

Every example has a **Dart version**, while only selected examples also have **WASM** and **Flat** versions.

The reason is simple: the Dart versions remain close to the original raylib examples, while the lower-level APIs introduce memory-management and pointer-related details that would make the examples harder to cross-reference.

See the [example/](example/) directory for runnable examples.

> WARNING: Some examples require `resources/` from the original Raylib source.  
> In that case just copy-paste the `resources/` folder into your project folder or provide `--raylib-resources=<path>` option to the `raylib_dartified_web:build` utility.

# See Also

- [LIMITATIONS.md](LIMITATIONS.md)
- [SHADER_CONVERSION.md](SHADER_CONVERSION.md)

# License

This project is released under the **zlib/libpng license**.

It contains bindings and rewritten components derived from **raylib**, which is also licensed under zlib.

See [LICENSE](LICENSE) for details.

# Acknowledgements

* [raylib](https://www.raylib.com/) by Ramon Santamaria
* Dart & Emscripten

PRs, issues, and experiments are welcome.