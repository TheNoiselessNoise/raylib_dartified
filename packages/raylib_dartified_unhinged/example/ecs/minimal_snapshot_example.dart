// Run it: dart run minimal_snapshot_example.dart
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';

typedef G = MinimalSnapshotExampleApp;

class MyScene extends Scene<G> {
  int intValue = 0;
  double doubleValue = 0;

  MyScene(super.app);

  // NOTE: [SNAPSHOT], instance of a snapshot
  @override
  MySceneSnapshot createSnapshot() {
    MySceneSnapshot snapshot = .new(namedId);
    snapshot.intValue = intValue;
    snapshot.doubleValue = doubleValue;
    return snapshot;
  }

  // NOTE: [SNAPSHOT], restoring a snapshot data
  @override
  void restoreSnapshot(MySceneSnapshot snapshot) {
    super.restoreSnapshot(snapshot);
    intValue = snapshot.intValue;
    doubleValue = snapshot.doubleValue;
  }
}

// NOTE: [SNAPSHOT], snapshot instance
class MySceneSnapshot extends SceneSnapshot<G, MyScene> {
  late int intValue;
  late double doubleValue;

  MySceneSnapshot(super.id);

  // NOTE: [SNAPSHOT], bare instance
  @override
  MyScene createInstance(G app) => .new(app);
}

class MinimalSnapshotExampleApp extends App<G> {
  MinimalSnapshotExampleApp(super.backend) {
    addScene(MyScene(app));
  }

  MyScene get myScene => getScene()!;
}

void main() {
  final app = G(HeadlessBackend());

  int expectedIntValue = 42;
  double expectedDoubleValue = 3.14;

  // set random state
  app.myScene.intValue = expectedIntValue;
  app.myScene.doubleValue = expectedDoubleValue;

  // capture current snapshot
  final appSnapshot = app.captureSnapshot();

  // set different state
  app.myScene.intValue = 999;
  app.myScene.doubleValue = 999.999;

  // restore the snapshot

  // NOTE: `restoreSnapshot` updates the live scene in place (matched by id)
  // rather than replacing it. If ids in the snapshot don't match anything currently
  // live, or vice versa, behavior is governed by the snapshot's onMissing/onExtra
  // policy (skip/recreate, keep/remove).
  app.restoreSnapshot(appSnapshot);
  
  assert(app.myScene.intValue == expectedIntValue);
  assert(app.myScene.doubleValue == expectedDoubleValue);

  print('${app.myScene.intValue} == $expectedIntValue');
  print('${app.myScene.doubleValue} == $expectedDoubleValue');
}