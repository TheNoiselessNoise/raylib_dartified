# UNHINGED Framework

UNHINGED is an ECS-like framework written in Dart and built exclusively on top of [raylib_dartified](https://pub.dev/packages?q=raylib_dartified) package family.

This framework is not a game engine.

It is a **deterministic playground for constructing realities out of data, structure, and controlled execution.**

## Platform Support

UNHINGED automatically selects the right backend at compile time.

| Platform | Status | Backend | Notes |
|---|:-:|---|---|
| **Linux** | ✅ | Native | Primary development platform |
| **Windows** | ✅ | Native | Should work out of the box |
| **macOS** | ❌ | Native | See [`raylib_dartified`](https://pub.dev/packages/raylib_dartified) for details |
| **Web** | ✅ | Web (WASM) | Requires WebAssembly + WebGL support; all modern browsers should qualify |
| **Android** | ❓ | Native | Not tested |
| **iOS** | ❓ | Native | Not tested, likely blocked |

## What “UNHINGED” actually means

UNHINGED does **NOT** mean chaotic or unpredictable.

It means:

> **There are no artificial safety rails between you and the runtime.**

Everything is:

* deterministic
* explicit
* interceptable
* overrideable

But also:

> **You are fully capable of breaking your own invariants if you choose to.**

The framework does not protect you from yourself. It stays consistent while allowing you to do so.

---

## Features

- **Nothing is abstract, so nothing is forced into one shape.** Neither `Entity` nor `Comp` or other structures are an abstract base class. Identity can come from subclassing, from composition, or from both layered on top of each other at once.

- **Same tree, your choice of grain.** Want a directory to *be* a group of entities? Fine, `EntityGroup` will hold it. Want the whole structure to live as nested component state on a single inert host entity instead? Also fine. UNHINGED doesn't care which side of the Entity/Component line you build on, because it refuses to believe there's a load-bearing line there in the first place.

- **An event system.** Re-entry-safe. Symmetric propagation. Scoped emission.

- **Tasks for "do this later" and "do this for a while."** `DelayTask` fires once after a given delay. `DurationTask` runs continuously across a span of time, so you've got a hook on every tick for as long as it's active, not just at the end. Neither needs you to hand-roll a timer and a flag.

- **`callback`, say "later," mean the end of this frame.** The simple, useful one: defer a function call until the current frame finishes, instead of writing a one-shot flag and checking it in `onUpdate` like an animal.

- **A drawer full of components so you don't reinvent the basics.** Want an entity that bounces off the walls? Wraps around the screen edge-to-edge? There's a growing shelf of ready-made components for exactly that sort of "I know I'm not the first person who needed this" behavior, check what's available before you write it yourself.

- **Queries, for when "give me everything" isn't good enough.** Two flavors: entity queries (over a scene or group) and component queries (over an entity or component), a real filter system for "find me the things that match this," instead of manually looping and squinting at a list every time.

- **Snapshots at whatever granularity you ask for.** `captureSnapshot` / `restoreSnapshot` are two distinct operations, not one method doing two jobs. Snapshot a single component or the entire App, same machinery either way. `SnapshotMissingPolicy`/`SnapshotExtraPolicy` for when reality and the snapshot disagree about what should exist.

- **Clone whatever you want, at whatever depth you want.** Clone a component, an entity, or the entire app, same verb, different scope. This is not the same thing as a snapshot: a snapshot captures ***state*** to restore ***that same object*** back to a prior point in time; a clone produces a brand-new, independent object with its own identity, walking away from the original the moment it's made. `ClonePolicy` is how you keep that from getting out of hand, constrain exactly what gets carried over and what gets left behind.

- **A widget layer that's there when you want it and absent when you don't.** `FWidget`/`FRow`/`FColumn`/`FExpanded` and friends give you Flutter-shaped, constraint-based layout with reference-identity reconciliation on rebuild, but it's a layer *on top of* the ECS, not a tax the ECS makes you pay. Drop to `DrawScene` and raw draw calls any time the widget layer is more ceremony than help.

- **And much more...** discover yourself.

---

## Structures

**App** => The root of your reality. If something does not exist inside an App, it does not exist at all.

**AppSystem** => Logic that governs the reality as a whole. Use it when something needs to happen at the highest level, before the world itself gets a chance to act.

**Scene** => A contained slice of reality. Entities are born here, live here, and cease to exist here.

**SceneSystem** => Like an AppSystem, but scoped to a single Scene. The laws of physics, if you will, but only for this particular world.

**Entity** => A thing that exists. Nothing more, nothing less. On its own, an Entity is just a presence, shapeless, purposeless. Components are what give it meaning.

**Component** => The substance of existence. Components describe what an Entity ***is***, what it ***has***, and why it ***matters***. They can be attached to Entities, but also to other Components, because reality is rarely flat.

**Event** => Something happened. An Event is not a record of the past, but an active force, it carries the same reach into reality as the things that caused it, because in this framework even a happening can act.

**Task** => Something will happen. A Task is intent given form, deferred but not powerless, holding the same access to existence as anything else, so that what is ***about to be*** is never less real than what ***already is***.

**Query** => Reality does not answer on its own, you must ask it. A Query does not change what exists, it only asks what is, what something has, or what something does, so that the asker may act with understanding instead of guesswork.

---

## Entities

At the bottom of everything, an `Entity` is a container. It doesn't know what it is, only what it has, components, hooks, maybe nothing at all.

That's the floor, not a rule about how you have to build. Identity is yours to construct, and you have three ways to do it, freely mixable:

### **By class.**
---
Subclass `Entity` directly and let the type system carry the identity:
```dart
final class Turret extends Entity<MyApp> { ... }
```
  `QueryEntity.On<Turret>()` works exactly the way you'd expect, because a `Turret` *is* one, all the way down, no component required to tell it what it is.

### **By composition.**
---
Take a plain, nameless entity, a crate, a barrel, whatever, and attach a `Health` component to it. It can now take damage. No class, no `Damageable` interface, nothing committed to ahead of time. Strip the component back off and it can't anymore.

### **By both, layered.**
---
A `Wraith` can be a class *and* a container of components *and*, several steps down, just an `Entity` that has no opinion about any of it:
```dart
  class Wraith extends AnyEntityGroup<MyApp> {
    Wraith() {
      addComp(Health(666));
      addComp(AIController(haunting));
    }
  }
```
  The class gives it a name and a queryable type. The components give it the parts that make it actually do something.

`Entity` itself isn't even `abstract`. Nothing stops you from instantiating a bare one and bolting hooks onto it directly, at which point it behaves like a "classed" entity without ever having been given a class. Even the floor is optional.

Nothing here is enforced. The framework doesn't care whether your boss is a `Wraith` class, a bare `Entity` with hooks stapled on, or a pile of components on something nameless. It only ever asks: *what does this thing have right now*, never *what is it supposed to be*.
 
---

## Components

A Component is a **fact about an Entity**, a piece of truth attached to something that exists.

Some facts are tangible. A position in space. A velocity. A measure of health. Others are pure identity, a declaration that this Entity is a `Player`, an `Enemy`, something `Selected`, something `Networked`.

An empty Component carries no data, but it is not empty of meaning. It is a **statement of existence**, proof that this Entity is something in particular.

And because reality is compositional, Components can have Components of their own.

Like `Entity`, the base `Comp` class isn't `abstract` either. You can instantiate a bare one, attach hooks to it, and it'll do real work without ever being given a name:

```dart
final varId = VarKey<String>('id');
entity.addComp(Comp<MyApp>(app).onSelf((c) => varId.set(c, 'myComp')));
entity.QueryComp.Where((c) => varId.get(c) == 'myComp').First;
```

The one thing you give up (same as bare `Entity`) is querying by type, since there is no type, only an instance of `Comp` that happens to know a fact about itself. What you get back is identification by whatever you decide identity means this time, a var, a tag, a closure, anything you can check at runtime. It's unhinged, in the literal sense, untethered from the convenience of a name. But it's still a fact about an Entity. It's just a fact that had to introduce itself.

---

## Hooks
 
Hooks exist for one reason:
 
> **Sometimes you need to break the rules on purpose.**

Or more mildly:

> **To allow controlled escape from the default execution rules.**
 
Every hook starts with word `listen`, because reality does not announce itself. You have to listen for it.
 
Hooks are not decoration.

They are explicit interception points into the simulation pipeline.

---

## Performance is a Choice

This framework optimizes for:

> **correctness, clarity, and controllable flexibility over enforced optimization**

If you need:

* lock-free scheduling
* cache-optimal ECS
* massive entity counts

You are solving a different problem space.

---

## Physics

This table describes a common vocabulary, not a required design.
The provided physics components and systems are meant to be extended, replaced, or ignored entirely.
If your game needs different rules, define new components, write new systems, and let behavior emerge from composition rather than inheritance.

| CTransform | CCollider | CPhysicsBody | CVelocity | ...Behavior...             |
|-----------|----------|-------------|----------|----------------------|
| ✅        | ✅       | ✅          | ✅       | Normal dynamic body  |
| ✅        | ✅       | ✅          | ❌       | Pushable, but frozen |
| ✅        | ✅       | ❌          | ❌       | Sensor / trigger     |
| ✅        | ❌       | ✅          | ✅       | Ghost mover          |
| ❌        | ✴️       | ✴️          | ✴️       | Non-existent         |

---

## Final Note

If this framework feels powerful, flexible, and slightly dangerous:

That is correct.

> It is not unstable. It is simply unprotected.

You are not guided through a safe path.

You are given a system and full authority over how safely you use it.

---

## See Also

- [EVENTS.md](EVENTS.md)
- [UNHINGED_HACKS.md](UNHINGED_HACKS.md)
- [WIDGETS.md](WIDGETS.md)

---

## Status

Experimental. APIs will change. Ideas will evolve.
