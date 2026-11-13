// Run it: dart run test_object_descriptors.dart
import '_base.dart';

class TestEntity extends Entity<G> {
  TestEntity(super.app) {
    add(CTransform(app, position: sceneBounds.size.divideBy(2)));
    add(CRectCollider(app, debugDraw: true, debugColor: .RED, size: .vec2(50, 50), enableRotation: true));
  }
}

class TestObjectDescriptorsScene extends FWidgetScene<G> {
  late TestEntity testEntity;

  TestObjectDescriptorsScene(super.app) {
    addEntity(testEntity = .new(app));
  }

  @override
  void onInput() => testEntity.onTransform((t) {
    final int moveSpeed = 3;
    if (IsKeyDown(.KEY_UP)) t.position.y -= moveSpeed;
    if (IsKeyDown(.KEY_DOWN)) t.position.y += moveSpeed;
    if (IsKeyDown(.KEY_LEFT)) t.position.x -= moveSpeed;
    if (IsKeyDown(.KEY_RIGHT)) t.position.x += moveSpeed;

    final double scaleSpeed = .1;
    if (IsKeyDown(.KEY_W)) t.scale.y += scaleSpeed;
    if (IsKeyDown(.KEY_S)) t.scale.y -= scaleSpeed;
    if (IsKeyDown(.KEY_A)) t.scale.x -= scaleSpeed;
    if (IsKeyDown(.KEY_D)) t.scale.x += scaleSpeed;

    final double rotSpeed = .1;
    if (IsKeyDown(.KEY_Q)) t.rotation -= rotSpeed;
    if (IsKeyDown(.KEY_E)) t.rotation += rotSpeed;
  });

  @override
  void onDrawBackground() {
    final textDraw = draw.text
      .at(10, 10)
      .text('=== ${testEntity.namedId} ===');

    for (final comp in testEntity.getComponents()) {
      if (comp is CRectCollider) continue;

      final compDesc = comp.getObjectDescriptor();

      textDraw.nl().text('  == ${comp.namedId} ==');

      for (final cd in compDesc.fields.entries) {
        textDraw.nl().text('    ${cd.key} => ${cd.value.asString()}');
      }
    }

    textDraw.end();
  }
}

typedef G = TestObjectDescriptorsApp;

class TestObjectDescriptorsApp extends ExampleRaylibApp<G> {
  TestObjectDescriptorsApp(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_object_descriptors");
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(TestObjectDescriptorsScene(app));
  }
}

void main() => runExample((backend) => G(backend));
