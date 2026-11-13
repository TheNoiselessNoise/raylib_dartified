import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';
import '../mocks.dart';

typedef G = TestApp;

class TestApp extends TestingApp<G> {
  TestApp(super.backend);
}

TestApp createTestApp() => .new(HeadlessBackend())..init();

void main() {
  group('External Hooks', () {
    bool? isEnabled;
    late G app;
    late SceneSystem<G> sceneSystem;

    void doOnEnabled(SceneSystem<G> sceneSystem) => isEnabled = sceneSystem.isEnabled;

    setUp(() {
      isEnabled = null;
      app = createTestApp();
      sceneSystem = app.testScene.sceneSystem;
    });

    test('Registration', () {
      sceneSystem.listenOnEnable(doOnEnabled);
      sceneSystem.setEnabled(false);
      expect(isEnabled, isFalse);
    });

    test('Clone', () {
      sceneSystem.listenOnEnable(doOnEnabled);
      final clonedSceneSystem = sceneSystem.clone();
      clonedSceneSystem.setEnabled(false);
      expect(isEnabled, isFalse);
    });

    test('Clone independence', () {
      sceneSystem.listenOnEnable(doOnEnabled);
      final clonedSceneSystem = sceneSystem.clone();
      sceneSystem.clearExternalHooks([sceneSystem.hookKey_onEnable]);
      clonedSceneSystem.setEnabled(false);
      expect(isEnabled, isFalse); // clone's hook should still fire
    });

    test('Unregister (by closure)', () {
      sceneSystem.listenOnEnable(doOnEnabled);
      sceneSystem.removeHook(sceneSystem.hookKey_onEnable, doOnEnabled);
      sceneSystem.setEnabled(false);
      expect(isEnabled, isNull);
    });

    test('Unregister (by key)', () {
      sceneSystem.listenOnEnable(doOnEnabled);
      sceneSystem.clearExternalHooks([sceneSystem.hookKey_onEnable]);
      sceneSystem.setEnabled(false);
      expect(isEnabled, isNull);
    });

    test('Unregister (by family)', () {
      sceneSystem.listenOnEnable(doOnEnabled);
      sceneSystem.clearExternalHookFamily('IsEnableable');
      sceneSystem.setEnabled(false);
      expect(isEnabled, isNull);
    });
  });
}
