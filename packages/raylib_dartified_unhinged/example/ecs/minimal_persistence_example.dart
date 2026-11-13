// Run it: dart run minimal_persistence_example.dart
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';

typedef G = MinimalPersistenceExampleApp;

class MyScene extends Scene<G> {
  int intValue = 0;
  double doubleValue = 0;

  // NOTE: [PERSISTENCE], `populateDefaults` argument for factory
  MyScene(super.app, { super.populateDefaults });
  
  // NOTE: [PERSISTENCE], for factory registration
  static String get typeId => '$MyScene';
  
  // NOTE: [PERSISTENCE], for factory lookup
  @override
  String get persistentTypeId => typeId;

  // NOTE: [PERSISTENCE], JSON data to store
  @override
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'intValue': intValue,
    'doubleValue': doubleValue,
  };

  // NOTE: [PERSISTENCE], JSON data to read
  @override
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);
    intValue = data.getInt('intValue');
    doubleValue = data.getDouble('doubleValue');
  }
}

class MinimalPersistenceExampleApp extends App<G> {
  MinimalPersistenceExampleApp(super.backend, {
    super.populateDefaults,
  }) {
    // NOTE: [PERSISTENCE], factory registration
    factories.scene.register(MyScene.typeId, MyScene.new);

    if (populateDefaults) {
      addScene(MyScene(app));
    }
  }

  MyScene get myScene => getScene()!;
}

void main() {
  final app = G(HeadlessBackend());

  // set random state
  app.myScene.intValue = 42;
  app.myScene.doubleValue = 3.14;

  // capture current state
  final appData = app.getPersistableData();

  // ... (optional) encrypt the JSON, store to file, ...

  // ... (optional) read from file, decrypt the JSON, ...

  // new empty app
  final newApp = G(HeadlessBackend(), populateDefaults: false);

  // restore the state
  
  // NOTE: `restorePersistableData` recreates instances
  // via their factory, then adds them to the parent exactly like manual
  // construction would (App.addScene, Scene.addEntity, ...).
  //
  // It does not clear existing state first, call it on an empty instance,
  // or clean up yourself beforehand.
  newApp.restorePersistableData(.new(appData));

  assert(app.myScene.intValue == newApp.myScene.intValue);
  assert(app.myScene.doubleValue == newApp.myScene.doubleValue);

  print('${app.myScene.intValue} == ${newApp.myScene.intValue}');
  print('${app.myScene.doubleValue} == ${newApp.myScene.doubleValue}');
}