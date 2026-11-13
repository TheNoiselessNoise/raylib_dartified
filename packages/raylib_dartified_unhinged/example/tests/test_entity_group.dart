// dart run test_entity_group.dart
import '_base.dart';

class SimpleEntity extends Entity<G> {
  final int i;

  int get size => 42;

  SimpleEntity(super.app, this.i) {
    add(CLocalTransform(app, offset: .vec2(i * size, i * size)));
    add(CCircleCollider(app, radius: size / 2, debugDraw: true));
  }

  @override
  void onDraw(double dt) => onTransform((t) {
    DrawText('$id', t.position.x, t.position.y, 20, .RAYWHITE);
  });
}

// NOTE: constrain the group for only `SimpleEntity` types
//       you can still use generic type `AnyEntityGroup<G>`
class SimpleEntityGroup extends EntityGroup<G, SimpleEntity> {
  final int speed = 1;

  SimpleEntityGroup(super.app) {
    add(CTransform(app, position: screenSize.divideBy(2)));
    add(CVelocity(app, linearDamping: 10));
    add(CBoundsConstraint(app, area: .bounds(0, 0, screenHeight, screenWidth)));

    for (int i = 0; i < 4; i++) {
      addEntity(SimpleEntity(app, i));
    }
  }

  @override
  void onPostUpdate(double dt) => onVelocity((v) {
    if (IsKeyDown(.KEY_A)) v.velocity.x -= dt * speed;
    if (IsKeyDown(.KEY_D)) v.velocity.x += dt * speed;
    if (IsKeyDown(.KEY_W)) v.velocity.y -= dt * speed;
    if (IsKeyDown(.KEY_S)) v.velocity.y += dt * speed;
  });
}

class EmptyScene extends DrawScene<G> {
  EmptyScene(super.app);

  @override
  void onStart() {
    addEntity(SimpleEntityGroup(app));
  }
}

typedef G = EmptyGame;

class EmptyGame extends ExampleRaylibApp<G> {
  EmptyGame(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_entity_group");
    SetWindowMonitor(0);

    addScene(EmptyScene(this));
  }
}

void main() => runExample((backend) => G(backend));