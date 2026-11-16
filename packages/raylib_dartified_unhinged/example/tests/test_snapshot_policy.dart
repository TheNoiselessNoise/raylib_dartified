// Run it: dart run test_snapshot_policy.dart
import '_base.dart';

final class Comp1 extends Comp<G> {
  Comp1(super.app);

  // NOTE: required for correctly returning appropriate type `Comp1`
  @override
  Comp1Snapshot createSnapshot() => .new(namedId);
}

// NOTE: custom component needs custom snapshot, even if empty
//       for proper "snapshotting"
final class Comp1Snapshot extends CompSnapshot<G, Comp1> {
  Comp1Snapshot(super.sourceId);

  @override
  Comp1 createInstance(G app) => .new(app);
}

final class Comp2 extends Comp<G> {
  Comp2(super.app);

  // NOTE: required for correctly returning appropriate type `Comp2`
  @override
  Comp2Snapshot createSnapshot() => .new(namedId);
}

// NOTE: custom component needs custom snapshot, even if empty
//       for proper "snapshotting"
final class Comp2Snapshot extends CompSnapshot<G, Comp2> {
  Comp2Snapshot(super.sourceId);

  @override
  Comp2 createInstance(G app) => .new(app);
}

final class MyEntity extends Entity<G> {
  MyEntity(super.app) { reset(); }

  void reset() {
    removeAll<Comp1>();
    add(Comp1(app));

    removeAll<Comp2>();
    add(Comp2(app));
  }
}

extension on SnapshotExtraPolicy {
  SnapshotExtraPolicy get flipped => switch (this) {
    .keep => .remove,
    .remove => .keep,
  };
}

extension on SnapshotMissingPolicy {
  SnapshotMissingPolicy get flipped => switch (this) {
    .skip => .recreate,
    .recreate => .skip,
  };
}

final class TestSnapshotPolicyScene extends DrawScene<G> {
  late MyEntity origEntity;

  TestSnapshotPolicyScene(super.app);

  @override
  void onStart() => addEntity(origEntity = MyEntity(app));

  final int fontSize = 20;
  SnapshotExtraPolicy extraPolicy = .keep;
  SnapshotMissingPolicy missingPolicy = .skip;

  void doSnapshot() {
    final snap = origEntity.captureSnapshot();
    snap.onExtra = extraPolicy;
    snap.onMissing = missingPolicy;

    final comps = origEntity.getComponents();
    if (missingPolicy == .recreate && (comps.length == 1 && comps.last is! CRenderLayer<G>)) {
      origEntity.removeExact(comps.last);
    }

    if (extraPolicy == .remove && missingPolicy == .skip) {
      if (snap.componentSnapshots.isNotEmpty && snap.componentSnapshots.last is! CRenderLayerSnapshot<G>) {
        snap.componentSnapshots.removeLast();
      }
    }

    origEntity.restoreSnapshot(snap);
  }

  void doReset() => origEntity.reset();

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_UP)) extraPolicy = extraPolicy.flipped;
    if (IsKeyPressed(.KEY_DOWN)) extraPolicy = extraPolicy.flipped;
    if (IsKeyPressed(.KEY_LEFT)) missingPolicy = missingPolicy.flipped;
    if (IsKeyPressed(.KEY_RIGHT)) missingPolicy = missingPolicy.flipped;
    if (IsKeyPressed(.KEY_SPACE)) doSnapshot();
    if (IsKeyPressed(.KEY_R)) doReset();
  }

  @override
  void onDraw(double dt) {
    DrawText('Original Entity:', 10, 10, fontSize, .ORANGE);
    draw.component.entityTree(origEntity, 10, 40, fontSize);
    
    final explanation = draw.text
      .at(10, sceneHeight / 2)
      .size(20)
      .text('EXPLANATION:', .AZURE)
      .nl()
      .text('Extra Policy: ', .WHITE)
      .text(extraPolicy.name, .ORANGE)
      .gap(32)
      .text('Missing Policy: ', .WHITE)
      .text(missingPolicy.name, .ORANGE)
      .nl()
      .nl();
    
    switch (extraPolicy) {
      case .keep:
        switch (missingPolicy) {
          case .recreate:
            explanation
              .text('(will remove last component from entity for test)', .RED)
              .nl()
              .text('Live entries not in the snapshot are left as-is;', .WHITE)
              .nl()
              .text('snapshot entries with no live match are recreated', .WHITE)
              .nl()
              .text('and re-added.', .WHITE);
          case .skip:
            explanation
              .text('Live entries not in the snapshot are left as-is;', .WHITE)
              .nl()
              .text('snapshot entries with no live match are ignored.', .WHITE);
        }
      case .remove:
        switch (missingPolicy) {
          case .recreate:
            explanation
              .text('(will remove last component from entity for test)', .RED)
              .nl()
              .text('Live entries not in the snapshot are removed;', .WHITE)
              .nl()
              .text('snapshot entries with no live match are recreated', .WHITE)
              .nl()
              .text('and re-added.', .WHITE);
          case .skip:
            explanation
              .text('(will remove last component snapshot from snapshot for test)', .RED)
              .nl()
              .text('Live entries not in the snapshot are removed;', .WHITE)
              .nl()
              .text('snapshot entries with no live match are ignored.', .WHITE);
        }
    }

    explanation.end();

    draw.text
      .at(10, sceneHeight - 30)
      .size(14)
      .text('[UP/DOWN]: ', .ORANGE)
      .text('Extra Policy', .WHITE)
      .gap(16)
      .text('[LEFT/RIGHT]: ', .ORANGE)
      .text('Missing Policy', .WHITE)
      .gap(16)
      .text('[SPACE]: ', .ORANGE)
      .text('Snapshot', .WHITE)
      .gap(16)
      .text('[R]: ', .ORANGE)
      .text('Reset', .WHITE)
      .end();
  }
}

typedef G = TestSnapshotPolicyApp;

final class TestSnapshotPolicyApp extends ExampleRaylibApp<G> {
  TestSnapshotPolicyApp(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_snapshot_policy");
    addScene(TestSnapshotPolicyScene(app));
  }
}

void main() => runExample((backend) => G(backend));
