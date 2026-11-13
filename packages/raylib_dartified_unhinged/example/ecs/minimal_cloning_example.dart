// Run it: dart run minimal_cloning_example.dart
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';

typedef G = MinimalCloningExampleApp;

class MyScene extends Scene<G> {
  int intValue = 0;
  double doubleValue = 0;

  MyScene(super.app);

  // NOTE: [CLONING], copy of this object
  @override
  MyScene createInstance() {
    final scene = MyScene(app);
    scene.intValue = intValue;
    scene.doubleValue = doubleValue;
    return scene;
  }
}

// NOTE: [CLONING], simple policy
class MyAppCloningPolicy extends ClonePolicy<G> {
  @override
  bool allow(CloneKind kind, { ECSBase<G>? owner, Object? payload }) {
    // we are currently cloning a `scene`
    if (kind == .scene) {
      // `owner` in this case is `MinimalCloningExampleApp`

      // and it is our `MyScene` instance
      if (payload case MyScene myScene) {
        return myScene.intValue <= 100;
      }
    }

    // otherwise allow the default
    return super.allow(kind, owner: owner, payload: payload);
  }
}

class MinimalCloningExampleApp extends App<G> {
  MinimalCloningExampleApp(super.backend);

  @override
  void onInit() {
    if (!isClone) addScene(MyScene(app));
  }

  MyScene get myScene => getScene()!;

  // NOTE: [CLONING], copy of this object
  @override
  G createInstance() => .new(backend);
}

void main() {
  final app = G(HeadlessBackend())..init();

  // set random state
  app.myScene.intValue = 42;
  app.myScene.doubleValue = 3.14;

  // === TEST #1 ===
  // create clone of the entire app
  // if no cloning policy is provided, cloning behaves like default
  // `ClonePolicy.allow` implementation (everything except identity)
  final appClone = app.clone()..init();

  assert(app.myScene.intValue == appClone.myScene.intValue);
  assert(app.myScene.doubleValue == appClone.myScene.doubleValue);

  print('=== TEST #1 ===');
  print('${app.myScene.intValue} == ${appClone.myScene.intValue}');
  print('${app.myScene.doubleValue} == ${appClone.myScene.doubleValue}');

  // === TEST #2 ===
  // create a direct clone of a scene 
  // if no cloning policy is provided, cloning behaves like default
  // `ClonePolicy.allow` implementation (everything except identity)
  final MyScene sceneClone = app.myScene.clone();

  assert(app.myScene.intValue == sceneClone.intValue);
  assert(app.myScene.doubleValue == sceneClone.doubleValue);

  print('\n=== TEST #2 ===');
  print('${app.myScene.intValue} == ${sceneClone.intValue}');
  print('${app.myScene.doubleValue} == ${sceneClone.doubleValue}');

  // === TEST #3 ===
  // test our `MyAppCloningPolicy`
  app.myScene.intValue = 101; // bigger than 100
  // we use our custom `MyAppCloningPolicy` policy
  final appCloneWithPolicy = app.clone(MyAppCloningPolicy());
  // we expect no `MyScene` scene to exist
  assert(appCloneWithPolicy.getScene<MyScene>() == null);

  print('\n=== TEST #3 ===');
  print('`MyScene` existence (should be `null`) == ${appCloneWithPolicy.getScene<MyScene>()}');
}