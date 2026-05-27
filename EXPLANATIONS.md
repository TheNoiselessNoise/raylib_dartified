# EXPLANATIONS

This document describes why was some features changed or how to use certain features this API provides.

---

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

#### ✅ `rl.Temp.String$.Value()` or `rl.Temp.String$.ValueAt()`

For runtime and per-frame usage, use the temporary allocator:

```dart
rl.Core.DrawText(
  rl.Temp.String$.Value(text),
  50, 50, 30, rl.Color.RAYWHITE,
);
```

* Reuses native memory
* Avoids per-frame allocations
* Prevents memory leaks
* Is automatically freed when `rl.dispose()` is called

This is the **preferred and safest way** to pass strings to raylib during normal execution when using the raw FFI layer.

Or see `StringToRaylibC` extension from the [abbr.dart](./lib/abbr.dart) to make your life even more easier.
```dart
extension StringToRaylibC on String {
  Pointer<Char> get toC => Raylib.instance.Temp.String$.Value(this);
}
```

```dart
rl.Core.DrawText(
  text.toC,
  50, 50, 30, rl.Color.RAYWHITE,
);
```

### String slots

`rl.Temp.String$.Value()` uses a **rotating slot system**, it maintains a fixed number of native string buffers and cycles through them in order. The slot count is configured via `RaylibTempBaseOptions`:

```dart
final rl = Raylib(
  core: '/absolute/path/to/libraylib.so',
  gui: '/absolute/path/to/libraylib.so', // optional
  tempOptions: RaylibTempBaseOptions(
    stringCount: 4, // default
  ),
);
```

If you call `rl.Temp.String$.Value()` more times than `stringCount` at a single call site, earlier strings will be silently overwritten, the rotating index wraps around and reuses the same slot. For example, with `stringCount: 4`, a fifth `str()` call overwrites the buffer used by the first.

In practice, `rl.Temp.String$.Value()` alone is sufficient for the vast majority of use cases. The overwrite issue only arises when multiple strings need to be alive simultaneously within a single expression or function call, which is uncommon. `rl.Temp.String$.ValueAt()` is a low-level escape hatch for that specific situation and you will rarely need to reach for it.

When passing multiple strings to a single function call, you can use `rl.Temp.String$.ValueAt(key, [text])` to pin each string to a specific slot and avoid unintended overwrites:

```dart
rl.Core.DrawTextEx(
  font,
  rl.Temp.String$.ValueAt('label', label),
  rl.Temp.String$.ValueAt('suffix', suffix),
  fontSize, spacing, rl.Color.RAYWHITE,
);
```

## Why `*C` Structs No Longer Have Math Methods

The `*C` structs (`Vector2C`, `Vector3C`, `MatrixC`, etc.) previously exposed math methods such as `add`, `sub`, `scale`, `normalize`, and others, mirroring the full operation set available on the `*D` layer. These have been removed.

The reason is simple: `dart:ffi` `Struct` subclasses cannot use mixins, which means all math on the C side had to be maintained separately and kept in sync by hand forever. Every time the math logic changed, it had to be updated in two places with no compiler help to catch drift. That is a maintenance liability with no real payoff, since the C layer is never the right place to do math anyway.

All math, transformation, and utility logic now lives exclusively on the `*D` layer (`Vector2D`, `Vector3D`, `MatrixD`, etc.), which are proper Dart objects backed by a shared mixin hierarchy, a single source of truth for every mathematical operation.

The `*C` structs are now what they always should have been: dumb, flat data containers that sit at the FFI boundary.