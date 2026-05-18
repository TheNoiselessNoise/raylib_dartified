# Raylib for Dart (FFI)

A **Dart-first**, modular set of **FFI bindings for [raylib](https://www.raylib.com/)**.

> &nbsp;   
> ⚠️ **Stability warning**
>
> You should **not rely on regular git pulls or updates** to be non-breaking. If you use this project, consider vendoring or pinning a specific commit.
>
> The API is **not stabilized**. Method signatures, type names, and module boundaries are subject to change without deprecation cycles. This applies especially to the `D` (Dart) layer, which is newer and less battle-tested than the raw FFI bindings.
>
> In particular, the `D` (Dart) layer may still contain **undetected memory safety issues** - dangling pointers, double-free bugs, or ownership ambiguity that has not yet surfaced. The fact that all provided examples run correctly is not proof that the `D` layer is safe or correct in general. If you are doing anything non-trivial, audit the relevant `D` wrappers before trusting them.
> &nbsp;

This project exposes raylib in an idiomatic Dart API while staying very close to the original C design. Most bindings are generated using `ffigen`, but this project goes significantly beyond a raw `ffigen` output.

In short: `ffigen` gets you the raw function table. This project gives you something you can actually use.

<p align="center"><img src="raylib_dartified.png" width="128px"></p>

## Platform Support

| Platform | Status | Notes |
|---|:-:|---|
| **Linux** | ✅ | Primary development platform |
| **Windows** | ✅ | Should work out of the box |
| **macOS** | ❌ | See below |
| **Web** | 🧪 | Under investigation |
| **Android** | ❓ | Not tested |
| **iOS** | ❓ | Not tested, likely blocked |

---

### macOS

macOS is currently **not supported** due to a fundamental limitation of the Dart standalone runtime.

Raylib (like most windowing/graphics libraries) requires OpenGL context creation and the main event loop to run on the OS main thread. In Flutter, this is somewhat worked around via platform channels, but in pure Dart FFI, the Dart VM does not run on the system's main thread, and there is no OS-level `DispatchQueue` or `NSRunLoop` set up. This causes crashes like:

> NSWindow should only be instantiated on the main thread!

This is a [known issue in the Dart SDK](https://github.com/dart-lang/sdk/issues/38315) and is not something that can be fixed at the binding layer. A native shim that bootstraps the macOS event loop and schedules Dart execution accordingly would be required, which is currently out of scope.

---

### Web

Web support is being actively explored. Raylib itself compiles to WebAssembly via Emscripten, but bridging that with Dart FFI (which doesn't support Wasm interop in the traditional sense) requires a non-trivial approach. Some ideas are currently being prototyped.

---

### Android / iOS

These platforms have not been tested.

- **Android** - Raylib has official Android support and Dart FFI works on Android (dynamic libraries only, no static linking). In theory, this could work, but significant platform-specific setup (NDK, CMake, Activity lifecycle integration) would be required. Untested and unsupported for now.
- **iOS** - Doubly blocked: raylib itself [does not have official iOS support](https://github.com/raysan5/raylib/discussions/2681) (there is an open PR with a community `rcore_ios.c` attempt), and Dart FFI on iOS shares the same main-thread issue as macOS. Not expected to work.

## Installation

This package currently assumes you already have **raylib compiled** for your platform.

Place the compiled library in a folder anywhere in your project tree (or a parent directory). The expected filenames are platform-specific:

| Platform | raylib | raygui (optional) |
|----------|--------|-------------------|
| Linux    | `libraylib.so` | `libraygui.so` |
| Windows  | `raylib.dll` | `raygui.dll` |
| macOS    | `libraylib.dylib` | `libraygui.dylib` |

Then pass the folder path to `findRaylib`:

```dart
final rl = findRaylib('raylib-5.5_linux_amd64/lib');
```

This walks **up from the current working directory** until it finds a folder matching that name, so the path is relative and does not need to be absolute. If `raygui` is present in the same folder it will be loaded automatically; if not, it is silently skipped.

For explicit control over paths, use `Raylib` constructor directly:

```dart
final rl = Raylib(
  core: '/absolute/path/to/libraylib.so',
  gui: '/absolute/path/to/libraygui.so', // optional
);
```

## The `D` (Dart) API - Recommended Starting Point

The **`D` wrappers** are the recommended way to use this library. They provide idiomatic, Dart-friendly objects that own their data, manage their own memory, and free you from thinking about pointer lifetimes, null terminators, and native struct layout.

Each raw FFI module has a corresponding `D` counterpart accessible on the same `Raylib` instance. For example:

| Raw FFI | D layer |
|---------|---------|
| `rl.Core` | `rl.CoreD` |
| `rl.Rlgl` | `rl.RlglD` |
| `rl.Gui` | `rl.GuiD` |

You are **not forced to pick one or the other** - both layers are available simultaneously and it is perfectly normal to mix them. The `D` layer covers the common case well, but sometimes the raw layer is the right tool:

```dart
// `rl.CoreD.IsKeyPressed` works directly with KeyboardKey enum,
// so we can't pass an arbitrary int - fall back to raw FFI in this case
rl.Core.IsKeyPressed('Z'.codeUnitAt(0))
```

See any `dart` example in `example/<category>/dart/`.

Or start here: [core/dart/core_basic_window.dart](example/core/dart/core_basic_window.dart)

## Raw FFI API - For When You Want Full Control

If you really want to manage your own pointers, squeeze every nanosecond out of the hot path, or stay as close as possible to the original C raylib API, the raw FFI layer is still fully available and is what the `D` wrappers are built on top of.

It is also the right choice if you are porting existing C raylib examples directly - the mapping is almost 1:1.

### Quick Start (Raw FFI)

See any `c` example in `example/<category>/c/`.

Or start here: [core/c/core_basic_window.dart](example/core/c/core_basic_window.dart)

### Advanced Loading & `RaylibTemp`

Native allocations are unavoidable when working with FFI. This project introduces **`RaylibTemp`**, a managed temporary memory pool designed for high-performance, short-lived native structs.

#### Why `RaylibTemp` exists

* Avoids repeated `calloc` / `free`
* Prevents memory leaks
* Makes FFI-heavy loops predictable and fast
* Allows both **rotating** (only for Strings) and **named** pointer slots

### String Handling

Raylib expects **null-terminated UTF-8 C strings**. Dart strings **are not automatically managed** when passed through FFI, so string handling requires special care.

Any call that converts a Dart `String` into a native pointer **allocates native memory**. Dart **DOES NOT** track or free this memory for you.

#### ❌ `.toUnsafeC()`

```dart
'Hello'.toUnsafeC()
```

* Allocates a new native UTF-8 string
* **Does NOT free it automatically**
* Safe only for **one-time or startup calls**
* **Must not be used inside loops or per-frame code**

This method exists purely for convenience and quick experiments.

#### ✅ `rl.Temp.str()` or `rl.Temp.strAt()`

For runtime and per-frame usage, use the temporary allocator:

```dart
rl.Core.DrawText(
  rl.Temp.str(text),
  50, 50, 30, rl.C.RAYWHITE,
);
```

* Reuses native memory
* Avoids per-frame allocations
* Prevents memory leaks
* Is automatically freed when `rl.dispose()` is called

This is the **preferred and safest way** to pass strings to raylib during normal execution when using the raw FFI layer.

### String slots

`rl.Temp.str()` uses a **rotating slot system**, it maintains a fixed number of native string buffers and cycles through them in order. The slot count is configured via `RaylibTempOptions`:

```dart
final rl = Raylib(
  core: '/absolute/path/to/libraylib.so',
  gui: '/absolute/path/to/libraylib.so', // optional
  tempOptions: RaylibTempOptions(
    stringCount: 4, // default
  ),
);
```

If you call `rl.Temp.str()` more times than `stringCount` at a single call site, earlier strings will be silently overwritten, the rotating index wraps around and reuses the same slot. For example, with `stringCount: 4`, a fifth `str()` call overwrites the buffer used by the first.

In practice, `rl.Temp.str()` alone is sufficient for the vast majority of use cases. The overwrite issue only arises when multiple strings need to be alive simultaneously within a single expression or function call, which is uncommon. `rl.Temp.strAt()` is a low-level escape hatch for that specific situation and you will rarely need to reach for it.

When passing multiple strings to a single function call, you can use `rl.Temp.strAt(key, [text])` to pin each string to a specific slot and avoid unintended overwrites:

```dart
rl.Core.DrawTextEx(
  font,
  rl.Temp.strAt('label', label),
  rl.Temp.strAt('suffix', suffix),
  fontSize, spacing, rl.C.RAYWHITE,
);
```

## abbr.dart

Since only one Raylib instance is allowed at a time, `abbr.dart` lets you skip one layer of namespacing and save some keystrokes. The `Raylib` instance remains accessible via `Raylib.instance`:

```dart
import 'package:raylib_dartified/raylib.dart';
import 'package:raylib_dartified/abbr.dart';

void main() {
  // Either of these works:
  findRaylib('path/to/raylib');
  // Raylib(
  //   core: '/absolute/path/to/libraylib.so',
  // )

  CoreD.InitWindow(800, 600, 'Title');
  // ... and so on

  disposeRaylib();
}
```

## Why `*C` Structs No Longer Have Math Methods

The `*C` structs (`Vector2C`, `Vector3C`, `MatrixC`, etc.) previously exposed math methods such as `add`, `sub`, `scale`, `normalize`, and others, mirroring the full operation set available on the `*D` layer. These have been removed.

The reason is simple: `dart:ffi` `Struct` subclasses cannot use mixins, which means all math on the C side had to be maintained separately and kept in sync by hand forever. Every time the math logic changed, it had to be updated in two places with no compiler help to catch drift. That is a maintenance liability with no real payoff, since the C layer is never the right place to do math anyway.

All math, transformation, and utility logic now lives exclusively on the `*D` layer (`Vector2D`, `Vector3D`, `MatrixD`, etc.), which are proper Dart objects backed by a shared mixin hierarchy, a single source of truth for every mathematical operation.

The `*C` structs are now what they always should have been: dumb, flat data containers that sit at the FFI boundary and expose only three operations: `setC`, `setD`, and `toD`.

The intended pattern is:

```dart
// read from C, work in D, write back
someCPtr.ref.setD(someCPtr.ref.toD().add(otherVec).scale(0.5));
```

## Safety Notes

* This is **not memory-safe Dart** - you are responsible for correct usage when using the raw FFI layer
* Passing invalid pointers will crash the VM
* `Gui` and other optional modules will be uninitialized if not loaded
* The `D` wrappers handle most of this for you - use them if in doubt

If you want guardrails, build them on top of this layer - or just use the `D` API.

## Examples

This repository includes **ported raylib examples**, rewritten to use the Dart FFI API exposed here.

The examples closely follow the **original raylib examples**, making it easy to cross-reference C code with Dart FFI usage.

Each example exists in **two versions**:

- **Raw FFI version** - written against `rl.Core`, `rl.Temp`, and the low-level pointer-based API. Useful for understanding what the `D` layer is doing under the hood, or for direct comparison with the original C source.
- **`D` layer version** - written against `D` modules (like `rl.CoreD`) and the Dart-managed wrapper types. Useful for understanding idiomatic usage and how to avoid manual memory management in practice.

Reading both versions of the same example side by side is the fastest way to understand the tradeoffs between the two layers.

These examples are the **recommended starting point** to understand real-world usage, correct memory handling, and idiomatic patterns for this binding.

See the [example/](example/) directory for runnable code.

> WARNING: Some examples require `resources/` from the original Raylib source.   
> In that case just copy-paste the `resources/` folder into `example/<category>/`

## Running examples

```
dart run <example>
```

**[LINUX]** Under wayland using X11:
```
WAYLAND_DISPLAY= XDG_SESSION_TYPE=x11 dart run <example>
```

## See Also

- [CHEATSHEET.md](CHEATSHEET.md)
- [CODEGEN.md](CODEGEN.md)
- [LIMITATIONS.md](LIMITATIONS.md)

## License

This project is released under the **zlib/libpng license**.

It contains bindings and rewritten components derived from **raylib**, which is also licensed under zlib.

See [LICENSE](LICENSE) for details.

## Acknowledgements

* [raylib](https://www.raylib.com/) by Ramon Santamaria
* Dart FFI & `ffigen`

PRs, issues, and experiments are welcome.