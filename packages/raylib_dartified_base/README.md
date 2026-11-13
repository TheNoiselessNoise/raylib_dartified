# raylib_dartified_base

Platform interface package for the `raylib_dartified` package family.

Defines the shared API surface (types, structs, abstract flat-call
modules) that platform implementations bind to. This package is **not**
fully backend-agnostic: it defines primitives a platform must supply
itself, since pointer representation and native call dispatch differ
between native (`dart:ffi`) and WebAssembly (linear memory).

## For platform implementors

A platform implementation must provide:

- `RaylibBase` => platform specific `Raylib` class implementation
- `XPtr<X extends XType>` => pointer abstraction backed by whatever memory
  model the platform uses (FFI pointer vs. WASM linear memory offset).
- A concrete flat module for each of the following, extending the
  matching abstract type defined here and exposed via `RaylibBase`:

  | Extension | Abstract type |
  |---|---|
  | Matrix ext. | `RaylibMatrixFlatExt<R>` |
  | Quaternion ext. | `RaylibQuaternionFlatExt<R>` |
  | Vector2 ext. | `RaylibVector2FlatExt<R>` |
  | Vector3 ext. | `RaylibVector3FlatExt<R>` |
  | Vector4 ext. | `RaylibVector4FlatExt<R>` |

  | Module | Abstract type |
  |---|---|
  | Audio | `RaylibAudioFlat<R>` |
  | Camera | `RaylibCameraFlat<R>` |
  | Core | `RaylibCoreFlat<R>` |
  | Gui | `RaylibGuiFlat<R>` |
  | Light | `RaylibLightFlat<R>` |
  | MsfGif | `RaylibMsfGifFlat<R>` |
  | Rlgl | `RaylibRlglFlat<R>` |

See [raylib_dartified](https://github.com/TheNoiselessNoise/raylib_dartified) (FFI) and [raylib_dartified_web](https://github.com/TheNoiselessNoise/raylib_dartified_web) (WASM) for
reference implementations.

## Module revisions

Some modules are sourced from external projects rather than the official
raylib repository. The following table records the exact upstream revision
used for each package version.

| Package | Module | Upstream | Revision |
|---|---|---|---|
| 6.0.0 | * | [raylib](https://github.com/raysan5/raylib) | `dbc56a87da87d973a9c5baa4e7438a9d20121d28` |
| 6.0.0 | Gui | [raygui](https://github.com/raysan5/raygui) | `30e303400781d3ef6e81f01e1b95cdf3b19386df` |

## License

This project is released under the **zlib/libpng license**.

It contains rewritten components derived from **raylib**, which is also licensed under zlib.

See [LICENSE](LICENSE) for details.