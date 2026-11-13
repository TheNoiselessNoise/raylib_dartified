# Raylib Dartified

**Dart bindings for [raylib](https://www.raylib.com/), with native and WebAssembly backends.**

Raylib Dartified brings raylib's functionality to Dart through a shared, backend-independent API. It provides both low-level access to raylib and a more Dart-idiomatic interface, with separate implementations for native platforms and the web.

The project is organized as a monorepo containing the shared foundation, platform implementations, and an optional ECS framework integration.

| Package | Description |
| --- | --- |
| [`raylib_dartified_base`](packages/raylib_dartified_base) | Shared API, data structures, memory abstractions, and backend-independent functionality. |
| [`raylib_dartified`](packages/raylib_dartified) | Native implementation using Dart FFI. |
| [`raylib_dartified_web`](packages/raylib_dartified_web) | Web implementation using Emscripten and WebAssembly. |
| [`raylib_dartified_unhinged`](packages/raylib_dartified_unhinged) | Integration with the UNHINGED ECS framework. |