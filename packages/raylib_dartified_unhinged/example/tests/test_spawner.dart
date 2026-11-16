// Run it: dart run test_spawner.dart
import '_base.dart';

final class BallEntity extends Entity<G> {
  BallEntity(super.app) {
    add(CVelocity(app,
      velocity: .vec2(
        (rand() * 300) * (rand() < .5 ? 1 : -1),
        (rand() * 300) * (rand() < .5 ? 1 : -1)
      ),
      linearDamping: 0,
    ));
    add(CCircleCollider(app, tag: 'ball', radius: 8, debugDraw: true));
    add(CPhysicsBody(app, mass: 1.0, restitution: 1.0));
    add(COutOfBounds(app));
  }
}

final class SpawnerEntity extends Entity<G> {
  SpawnerEntity(super.app) {
    add(CTransform(app, position: screenSize.divideBy(2)));
    add(CAnyParticleEmitter(app, rate: 20, factory: createBall));
    add(CCircleCollider(app, tag: 'spawner', radius: 8, debugDraw: true));
  }

  BallEntity createBall() {
    final BallEntity ball = .new(app);

    // set the position to this spawner entity
    ball.add(transform!.clone());

    return ball;
  }
}

final class TestSpawnerScene extends DrawScene<G> {
  late SpawnerEntity spawner;

  TestSpawnerScene(super.app);

  @override
  void onStart() => addEntity(spawner = .new(app));

  @override
  void onPostDraw(double dt) {
    final ballCount = QueryEntity.On<BallEntity>().Count;
    final enabled = spawner.get<CAnyParticleEmitter<G>>()!.isEnabled;

    draw.text
      .print('Ball count: $ballCount', 20, 20, 20, .RED)
      .at(20, screenHeight - 60)
      .text('Press [SPACE] to toggle emitter.', .BLUE)
      .nl()
      .text('Enabled: ').text(enabled ? 'ON' : 'OFF', enabled ? .GREEN : .RED)
      .end();
  }

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_SPACE)) {
      QueryEntity.DoFirst<SpawnerEntity>((s) {
        s.get<CAnyParticleEmitter<G>>()!.toggleEnabled();
      });
    }
  }
}

typedef G = TestSpawner;

final class TestSpawner extends ExampleRaylibApp<G> {
  TestSpawner(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "game_test_spawner");
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(TestSpawnerScene(app));
  }
}

void main() => runExample((backend) => G(backend));
