## CODEGEN

This project includes a **very dumb and messy codegen** that reads C headers
and generates the full Dart FFI binding stack — C module, D-layer module, struct mirrors,
and extension registration — with zero magic and zero dependencies beyond `ffigen` and a
`StringBuffer`.

It is not a framework. It is not a library. It is a messy Dart utility that reads headers,
visits declarations, and writes strings. It works, but don't expect pretty internals.
If it breaks, you read it and fix it.

It handles the basic stuff well. If your C code does anything unusual, **you are required
to check the output and adjust manually.**

---

### How to use (WIP, but roughly)

Using simple custom example [C library](./utils/resources/mylib/src/).

1) Build the dynamic library [build.sh](./utils/resources/mylib/build.sh)\
   `$ chmod +x build.sh`\
   `$ ./build.sh`
2) Codegen the module [generate.dart](./utils/resources/mylib/generate.dart)\
   `$ dart run generate.dart`
3) Test the module [mylib_test.dart](./utils/resources/mylib/mylib_test.dart)\
   `$ dart run mylib_test.dart`

---

### What gets generated

Given a C header, the codegen produces a D-layer module that looks roughly like this:

```dart
class MyModuleD extends RaylibModuleD {
  MyModuleD(super.rl);

  MyModule get _ffi => rl.module<MyModule>();

  MyStructD CreateMyStruct(int x, double y) => run(
    () => 'CreateMyStruct(x, y)',
    () => _ffi.CreateMyStruct(x, y).toD(),
  );

  void MutateMyStruct(MyStructD s) => run(
    () => 'MutateMyStruct(s)',
    () => _ffi.MutateMyStruct(refMyStruct1(s).ref),
  );

  void GetMyStruct(MyStructD out) => run(
    () => 'GetMyStruct(out: $out)',
    () => _ffi.GetMyStruct(refMyStruct1(out)),
  );
}
```

This is the happy path. The codegen has no way to know:

- whether a function **mutates** a provided struct in-place
- whether a returned struct should be **captured** (preserving its `originalPointer`,
  owned by the library) or immediately **converted** to its D-layer mirror
- whether a `Pointer<Struct>` argument is an **out parameter** — uninitialized going in,
  meaningful coming out

Any function with a `Pointer<Struct>` argument or return type is marked with a
`// TODO: Needs manual check` comment in the generated output.

The four cases are:

**[[ Returned struct ]] > convert immediately** (codegen default):
```dart
() => _ffi.CreateMyStruct(x, y).toD(),
```

**[[ Mutated struct ]] > sync changes back after the call:**
```dart
() => refUpdateMyStruct(s, (p) => _ffi.MutateMyStruct(p)),
```

**[[ Returned struct ]] > capture and preserve `originalPointer`:**
```dart
() => refCaptureMyStruct(
  'SpecialMyStruct', // key identifying where this struct came from
  _ffi.SpecialMyStruct(),
),
```

**[[ Out parameter ]] > allocate, pass in, read back:**
```dart
// C: void GetMyStruct(MyStruct *out)
MyStructD GetMyStruct() => run(
  () => 'GetMyStruct()',
  () {
    final ptr = refMyStruct1();
    _ffi.GetMyStruct(ptr);
    return ptr.toD();
  },
);
```

When in doubt, read the original C header.