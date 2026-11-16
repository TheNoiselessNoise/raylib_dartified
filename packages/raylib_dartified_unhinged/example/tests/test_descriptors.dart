// Run it: dart run test_descriptors.dart
import '_base.dart';

final class MyEntity extends Entity<G> {
  MyEntity(super.app) {
    add(CTransform(app));
  }
}

final class TestDescriptorsScene extends DrawScene<G> {
  late MyEntity origEntity;

  TestDescriptorsScene(super.app);

  @override
  void onStart() => addEntity(origEntity = MyEntity(app));

  final int fontSize = 20;

  @override
  void onDraw(double dt) {
    draw.component.entityTree(origEntity, 10, 10, fontSize);

    final objDesc = origEntity.transform!.getObjectDescriptor();

    for (final (i, fieldDesc) in objDesc.fields.entries.indexed) {
      draw.text
        .at(10, i * 20 + fontSize * 4)
        .text('${fieldDesc.key} = ${fieldDesc.value.asString()}')
        .end();
    }
  }
}

typedef G = TestDescriptorsApp;

final class TestDescriptorsApp extends ExampleRaylibApp<G> {
  TestDescriptorsApp(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_descriptors");
    addScene(TestDescriptorsScene(app));
  }
}

void main() => runExample((backend) => G(backend));
