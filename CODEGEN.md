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
class MyModuleD extends RaylibModule {
  MyModuleD(super.rl);

  MyModule get _ffi => rl.module<MyModule>();

  // C: MyStruct CreateMyStruct(int x, float y)
  MyStructD CreateMyStruct(int x, double y) => run(
    () => 'CreateMyStruct($x, $y)',
    () => _ffi.CreateMyStruct(x, y).toD(),
  );

  // C: MyStruct SpecialMyStruct()
  MyStructD SpecialMyStruct() => run(
    () => 'SpecialMyStruct()',
    () => _ffi.SpecialMyStruct().toD(),
  );

  // C: void MutateMyStruct(MyStruct *s)
  void MutateMyStruct(MyStructD s) => run(
    () => 'MutateMyStruct($s)',
    () => _ffi.MutateMyStruct(rl.Temp.MyStruct$.Ref1(s)),
  );

  // C: void GetMyStruct(MyStruct *out)
  void GetMyStruct(MyStructD out) => run(
    () => 'GetMyStruct(out: $out)',
    () => _ffi.GetMyStruct(rl.Temp.MyStruct$.Ref1(out)),
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
MyStructD CreateMyStruct(int x, double y) => run(
  () => 'CreateMyStruct($x, $y)',
  () => _ffi.CreateMyStruct(x, y).toD(),
);
```

**[[ Mutated struct ]] > sync changes back after the call:**
```dart
void MutateMyStruct(MyStructD s) => run(
  () => 'MutateMyStruct($s)',
  () => rl.Temp.MyStruct$.RefUpdate1(s,
    (p) => _ffi.MutateMyStruct(p),
  ),
);
```

**[[ Returned struct ]] > capture and preserve `originalPointer`:**
```dart
MyStructD SpecialMyStruct() => run(
  () => 'SpecialMyStruct()',
  () => rl.Temp.MyStruct$.RefCapture(
    'SpecialMyStruct', // key identifying where this struct came from
    _ffi.SpecialMyStruct(),
  ),
);
```

**[[ Out parameter ]] > allocate, pass in, read back:**
```dart
MyStructD GetMyStruct() => run(
  () => 'GetMyStruct()',
  () {
    // 1) same slot reused across calls, fine if the result is consumed before the next call
    final ptr = rl.Temp.MyStruct$.At('GetMyStruct');
    // 2) unique slot per call, necessary if multiple results must coexist
    // final ptr = rl.Temp.MyStruct$.AtUnique('GetMyStruct');
    _ffi.GetMyStruct(ptr);
    return ptr.toD();
  },
);
```

When in doubt, read the original C header.