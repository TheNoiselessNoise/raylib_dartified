# CHEATSHEET

Reference: [raylib C cheatsheet](https://www.raylib.com/cheatsheet/cheatsheet.html)

---

## 01 Temp

### Preallocated pointers

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

### StructD

D-layer structs are plain Dart objects - just instantiate them normally. No pointer handling required.

```dart
// create a D-layer struct like any Dart object
final myColor = ColorD(r: 255, g: 128, b: 0, a: 255);
```

If you ever need explicit C backing (e.g. for FFI interop outside the D-layer), you can allocate it manually - but this is rarely (if ever) needed:

```dart
final ptr = rl.Temp.Color$.Value(myColor, 'myColor');
// or
final ptr = rl.Temp.Color$.At('myColor').setD(myColor);
```

```dart
// overwrite from another D object
myColorD.setD(otherColorD);

// clone - literal clone, same field values, points to same originalPointer
final clone = myColorD.clone();

// copy - independent, same field values, originalPointer == null
final copy = myColorD.copy();
```

---

### Lifecycle & disposal

```dart
// all slots freed automatically
rl.dispose();

// or individually
rl.Temp.Color$.Free('myColor');

// debug: print every alloc/free event
rl.Temp.debugFree(true);
rl.Temp.debugSync(true);
```

---

## 02 Callbacks

### Class form - stateful

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

### Factory form - inline

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

### Factory form - inline friendly function (where available)

Some callbacks provide a `.friendly` factory that accepts regular Dart types,
handling pointer conversion automatically at the callsite.

```dart
final SaveFileTextCallbackD cb = .friendly((fileName, text) {
  // fileName and text are already Dart Strings
  // return bool directly
  return true;
});
```

> **NOTE**: Not all callbacks have a `.friendly` factory, only those where the
> raw parameter or return type have a natural Dart equivalent and can be meaningfully converted.

---

## 03 Modules

### Built-in access

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

### User modules

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
