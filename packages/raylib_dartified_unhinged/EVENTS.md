# Events

Events are the primary mechanism for cross-cutting communication in the framework.

## Emit vs Dispatch

- **`emit`** => queues the event for processing at the end of the current frame. Safe to call from anywhere, including during update loops.
- **`dispatch`** => processes the event immediately and synchronously. Use with care; dispatching during iteration can cause unexpected ordering.

## Scopes

| Scope | Receivers |
|---|---|
| `root` | App > AppSystems |
| `rootAndLocal` | `root` & `local` |
| `global` | `root` & `scene` |
| `globalNoEntities` | `root` & `sceneOnly` |
| `scene` | Scene > SceneSystems > Entities > Components |
| `sceneOnly` | Scene > SceneSystems |
| `local` | Emitter and its children only (see below, "children" depends on emitter type) |
| `self` | Emitter only, no propagation |

## Propagation by Emitter (`local` or `rootAndLocal` scopes)

`rootAndLocal` is the default scope for all emitters. What counts as a "child" depends on the emitter type, propagation does **not** bubble up through the App/Scene hierarchy:

| Emitter | Propagates to |
|---|---|
| `App` | App **(itself)**, AppSystems |
| `AppSystem` | AppSystem **(itself only)** |
| `Scene` | Scene **(itself)**, SceneSystems |
| `SceneSystem` | SceneSystem **(itself only)** |
| `Entity` | Entity **(itself)**, all Components (even nested) |
| `Component` | Component **(itself)**, all Components (even nested) |

## Stopping Propagation

Call `event.stopPropagation()` at any point to halt further delivery.

## Event Origin

Every event carries an `origin` field pointing to the node that originally `emitted/dispatched` it. This is set automatically on first `emit/dispatch` and never overwritten. Useful for filtering inside handlers:

```dart
@override
void onEvent(Event<T> event) {
  if (event.origin is Enemy<T>) {
    // only care about events from enemies
  }
}
```

## Priority

Events in the queue are sorted by `priority` (higher value = processed first). Events with equal priority are processed in insertion order.

## Custom Events

Extend `Event<T>` to carry additional data:

```dart
class DamageEvent<T extends App<T>> extends Event<T> {
  final int amount;
  final Entity<T> source;

  DamageEvent(super.app, {required this.amount, required this.source});
}
```

Emit it from any node:

```dart
entity.emit(DamageEvent(app, amount: 42, source: attacker));
```

Handle it anywhere (depends on `scope`):

```dart
@override
void onEvent(Event<T> event) {
  if (event is DamageEvent<T>) {
    health -= event.amount;
  }
}
```