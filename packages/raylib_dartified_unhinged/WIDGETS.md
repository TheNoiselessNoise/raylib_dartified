# WIDGETS.md

Notes on `FWidget` usage: build, rebuild, and child lifecycle.

## Basics

`FWidget` is one class for both "stateless" and "stateful" usage, there's no
separate base class for each. What you return from `build()` decides which
one you're doing, per call.

```dart
class CounterWidget extends FWidget<G> {
  int count = 0;

  CounterWidget(super.app);

  @override
  FWidget<G> build() => FRow(app,
    gap: 8,
    children: [
      FLabel(app, fontSize: 14, text: 'COUNT: $count'),
      FButton(app,
        onClickFn: (_) => setState(() => ++count),
        child: FLabel(app, text: "++COUNT"),
      ),
    ],
  );
}
```

Every call to `build()` here returns a brand-new `FRow` tree. That's the
"stateless" pattern, fine, normal, the common case.

## Reusing a child widget across rebuilds

Sometimes you want a child to persist across rebuilds of its parent, keep its own state (`count`, in `CounterWidget` above) instead of getting
torn down and recreated every time the parent rebuilds.

To do that, hold a reference to the child and return *that same instance*
from `build()` instead of constructing a new one:

```dart
class ParentWidget extends FWidget<G> {
  late CounterWidget counter;

  ParentWidget(super.app) {
    counter = CounterWidget(app);
  }

  @override
  FWidget<G> build() => counter; // <-- reused, not rebuilt
}
```

Each call to `ParentWidget.build()` returns the same object `counter` every time. `counter.count` survives
across `ParentWidget.rebuild()` calls, pressing the button, then
rebuilding the parent, does not reset the counter.
