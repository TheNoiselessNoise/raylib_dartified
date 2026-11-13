# UNHINGED_HACKS.md

Useful things that aren't really "the architecture", just some tricks the
architecture happens to make possible.

---

## Global shortcuts via `extension on HasAppAccess<G>`

`HasAppAccess` is mixed into `ECSBase`, the common ancestor of every
class in the framework, `App`, `AppSystem`, `Scene`, `SceneSystem`,
`Entity`, `Comp`, `Event`, and `Task` all have it. Every one of these
takes `app` as a constructor parameter, so the moment you create one,
`MyEvent(app)`, `MyTask(app)`, whatever, it already has full access to
the rest of the ECS. Nothing needs to be threaded through afterward.

Define the extension once:

```dart
extension on HasAppAccess<G> {
  MyScene get myScene => app.getScene()!;
  void doSomething() => myScene.doSomething();
}
```

...and call `myScene` or `doSomething()` from an `Entity`, a `Comp`, a
`SceneSystem`, or even a freshly constructed `Event`/`Task` that hasn't
been emitted or scheduled yet, it doesn't matter where the object sits
in the tree, or whether it's in the tree at all. The scene getter above
is just one example; the same pattern works for any singleton, system,
or scene hanging off `app`. Since every class shares the same base and
the same constructor contract, you write the lookup logic once and it's
available everywhere in the framework.
