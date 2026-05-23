# CHEATSHEET

> **C layer** = raw FFI bindings &nbsp;/&nbsp; **D layer** = idiomatic Dart (hides pointers)

Reference: [raylib C cheatsheet](https://www.raylib.com/cheatsheet/cheatsheet.html)

---

## 01 Temp

### Preallocated pointers `[C layer]`

`rl.Temp` preallocates some typed pointers.
Use these when you need to hold a pointer across calls; use the convenience
shorthands (`vec21`, `vec22`, …) for one-off arguments to C functions.

```dart
// verbose - named slot
final p = rl.Temp.Vector2$.At('myVec');
p.ref.set(1.0, 2.0);
CallFunction(p.ref);

// shorthand - inline (pre-allocated)
CallFunction(rl.Temp.vec21(1.0, 2.0));

// from an existing C struct
CallFunction(rl.Temp.vec21C(myVec2C));

// from a D object
CallFunction(rl.Temp.vec21D(myVec2D));
```

```dart
// allocate N elements in a named slot
final arr = rl.Temp.Vector2$.At('points', 8);
arr[0].set(0, 0);
arr[1].set(100, 0);

// free a specific slot early (optional - auto-freed on dispose)
rl.Temp.Vector2$.Free('points');
```

> **NOTE** Pre-allocated shorthands are numbered: `vec21`, `vec22`, etc.
> Don't hold references across frames - they're overwritten on next use.

---

### StructD `[D layer]`

D-layer structs are plain Dart objects - just instantiate them normally. No pointer handling required.

```dart
// create a D-layer struct like any Dart object
final myColor = ColorD(r: 255, g: 128, b: 0, a: 255);
```

If you ever need explicit C backing (e.g. for FFI interop outside the D-layer), you can allocate it manually - but this is rarely (if ever) needed:

```dart
final ptr = myColor.toC(rl.Temp, 'myColor');
// or
final ptr = rl.Temp.Color$.Value(myColor, 'myColor');
// or
final ptr = rl.Temp.Color$.At('myColor').setD(myColor);
```

```dart
// overwrite D object's fields from a C struct
myColorD.setC(someColorC);

// overwrite from another D object (preserves originalPointer if null)
myColorD.setD(otherColorD);

// clone - literal clone, same field values, points to same originalPointer
final clone = myColorD.clone();

// copy - independent, same field values, originalPointer == null
final copy = myColorD.copy();
```

---

### Lifecycle & disposal `[both]`

```dart
// all slots freed automatically
rl.dispose();

// or individually
rl.Temp.Color$.Free('myColor');

// debug: print every alloc/free event
rl.Temp.debugFree(true);
rl.Temp.debugSync(true);
```

> **WARN** Strings require at least **4** preallocated slots.
> Pass `RaylibTempOptions(stringCount: N)` to `Raylib` if you need more.

---

## 02 Callbacks

### Class form - stateful `[D layer]`

```dart
class MyAudioCallback extends AudioCallbackD {
  int frameCount = 0; // stateful - survives across calls

  @override
  get function => (buffer, frames) {
    frameCount += frames;
    // write into buffer...
  };
}

final cb = MyAudioCallback();
rl.AudioD.AttachAudioMixedProcessor(cb);

// optional - also auto-detached on dispose()
rl.AudioD.DetachAudioMixedProcessor(cb);
```

### Factory form - inline `[D layer]`

```dart
// optional `name` parameter for debug output
final AudioCallbackD cb = .function(/*name: 'MyMixer', */(buffer, frames) {
  // do something
});

rl.AudioD.AttachAudioMixedProcessor(cb);
rl.AudioD.DetachAudioMixedProcessor(cb); // optional
```

> **NOTE** Keep a reference to the callback object alive for as long as it's attached.
> If it's GC'd, the native side will call a dangling pointer.

---

## 03 Modules

### Built-in access `[both]`

```dart
rl.Core   // C bindings
rl.CoreD  // D layer (idiomatic Dart, hides pointers)
rl.Audio  rl.AudioD
rl.Rlgl   rl.RlglD
rl.Camera rl.CameraD
rl.Light  rl.LightD
rl.Gui    rl.GuiD // only if dynGui was loaded

rl.Vector // Vector math
rl.Matrix // Matrix math
rl.Quat   // Quaternion math
rl.Color  // Color constants
rl.Ease   // Easing functions
rl.Temp   // Allocator
```

> **NOTE** Accessing `rl.Gui` / `rl.GuiD` without loading the GUI dynamic library
> throws `LateInitializationError` - that's expected.

---

### User modules `[D layer]`

```dart
class MyPhysicsModule extends RaylibModule<Raylib> {
  MyPhysicsModule(super.rl);

  void simulate(double dt) { /* ... */ }

  @override
  void load() {
    // setup
  }

  @override
  void dispose() {
    super.dispose();
    // cleanup
  }
}
```

```dart
final physics = MyPhysicsModule(rl);
rl.registerModule(physics);   // lifecycle managed by rl

// Option A - hold your own reference (simplest)
physics.simulate(dt);

// Option B - look up by type
rl.module<MyPhysicsModule>().simulate(dt);

// Option C - extension for rl.Physics ergonomics
extension MyModules on Raylib {
  MyPhysicsModule get Physics => module<MyPhysicsModule>();
}
// then: rl.Physics.simulate(dt);
```

---

## 04 Custom Structs (hellhole)

Each struct requires two types (`XC` - FFI, `XD` - Dart mirror) plus two extensions
and one Temp registration.

| Piece | What it does | Required? |
|---|---|---|
| `XC extends Struct` | FFI memory layout - fields annotated with C types | yes |
| `extension XCEx on XC` | `setC` / `setD` / `toD` on the value | yes |
| `extension XCPEx on Pointer<XC>` | same helpers, pointer-receiver form | yes |
| `XD extends StructDLiteral<XD, XC>` | Dart-side mirror; owns fields, clones, serializes to C | yes |
| Temp registration | registers `NativeStructAlloc` so Temp can manage slots | only if using `rl.Temp` |

### XC - FFI struct + extensions `[C layer]`

```dart
final class MyInt extends Struct {
  @Int() external int value;
}

extension MyIntCEx on MyIntC {
  MyIntC setC(MyIntC o) { value = o.value; return this; };
  MyIntC setD(MyIntD o) { value = o.value; return this; };
  MyIntD toD([Pointer<MyIntC>? ptr]) => .new(originalPointer: ptr, value: value);
}

extension MyIntCPEx on Pointer<MyIntC> {
  Pointer<MyIntC> setC(MyIntC o) { ref.setC(o); return this; }
  Pointer<MyIntC> setD(MyIntD o) { ref.setD(o); return this; }
  MyIntD toD() => ref.toD(this);
}
```

### XD - Dart mirror `[D layer]`

```dart
class MyIntD extends StructDLiteral<MyIntD, MyIntC> {
  int value;

  MyIntD({super.originalPointer, this.value = 0});
  factory MyIntD.zero() => .new();

  @override
  MyIntD setD(MyIntD o) {
    value = o.value;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<MyIntC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<MyIntC> p, int index) => p[index];

  @override
  void nativeWriteInto(MyIntC p) { p.value = value; }

  @override
  void nativeReadFrom(MyIntC p) { value = p.value; }

  @override
  String signature() => 'MyInt(value: $value)';

  @override
  MyIntD clone() => .new(
    originalPointer: originalPointer,
    value: value,
  );
}
```

### Temp registration `[both]`

Call once after constructing `Raylib`, before entering the game loop.

```dart
void registerMyInt(Raylib rl) {
  // key must match what allocatePointer() uses - convention: TypeName$
  String name = 'MyInt\$';

  // literally copy-pastable
  // for `Pointer<MyInt>` allocations
  final alloc = RTempStructAlloc<MyInt, MyIntD>(rl.Temp, name,
    byteSize:        sizeOf<MyInt>(),
    allocatorFunc:   ([count = 1]) => calloc<MyInt>(count),
    refFunc:         (ptr)         => ptr.ref,
    setRefFunc:      (ptr, v)      => ptr..ref = v,
    pointerToStruct: (ptr)         => ptr.toD(),
    printerFunc:     (ptr)         => ptr.toD().signature(),
    setCFunc:        (ptr, i, v)   => ptr[i].setC(v),
    indexerFunc:     (ptr, i)      => ptr[i],
    indexSetterFunc: (ptr, i, v)   => ptr[i] = v,
    updateFunc:      (ptr, source) => source.nativeReadFrom(ptr.ref),
  );

  rl.Temp.registerAllocator(name, alloc);

  // for `Pointer<Pointer<MyInt>>` allocations
  name = 'Ptr\$MyInt\$';
  final allocPtr = RTempStructPtrAlloc<MyInt, MyIntD>(rl.Temp, name,
    allocatorFunc: ([count = 1]) => calloc<Pointer<MyInt>>(count),
    valueFunc: alloc.Value,
    rawArrayFunc: alloc.RawArray,
  );

  rl.Temp.registerAllocator(name, allocPtr);
}
```

> **NOTE** The key string (`'MyInt$'`) must match exactly between `registerAllocator`
> and `allocatePointer`.

---

## 05 Custom C Modules/Libraries (even bigger hellhole)

See [CODEGEN.md](CODEGEN.md)

(essentially it ***TRIES*** to do everything above automatically)
