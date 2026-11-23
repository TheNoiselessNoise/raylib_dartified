// dart run arkanoid_test.dart
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:raylib_dartified_unhinged/backends/raylib.dart';

typedef G = Arkanoid;

/* =========================
  EVENTS
========================= */

final class BallHitBrick extends Event<G> {
  final Entity<G> brick;
  BallHitBrick(super.app, this.brick);
}

final class BallLost extends Event<G> {
  BallLost(super.app);
}

final class MovePaddle extends Event<G> {
  final double axis; // -1..1
  MovePaddle(super.app, this.axis);
}

final class SpawnBall extends Event<G> {
  SpawnBall(super.app);
}

/* =========================
  PADDLE
========================= */

final class PaddleEntity extends Entity<G> {
  PaddleEntity(super.app);

  double speed = 600;

  @override
  void onAdd(_) {
    add(CTransform(app, position: .vec2(screenWidth / 2, screenHeight - 40)));
    add(CVelocity(app));
    add(CPhysicsBody(app, mass: 0, restitution: 1));
    add(CRectCollider(app,
      tag: 'paddle',
      size: .vec2(120, 20),
      debugDraw: true,
    ));
  }

  @override
  void onEvent(Event<G> e) {
    if (e is MovePaddle) {
      on<CVelocity<G>>((v) {
        v.velocity.x = e.axis * speed;
      });
    }
  }
}

/* =========================
  BALL
========================= */

final class BallEntity extends Entity<G> {
  BallEntity(super.app);

  @override
  void onAdd(_) {
    add(CTransform(app,
      position: sceneBounds.size.divideBy(2),
    ));
    add(CVelocity(app,
      velocity: .vec2(
        (rand() * 300) * (rand() < .5 ? 1 : -1),
        (rand() * 300) * (rand() < .5 ? 1 : -1)
      ),
      linearDamping: 0,
    ));
    add(CCircleCollider(app, tag: 'ball', radius: 8, debugDraw: true));
    add(CPhysicsBody(app, mass: 1.0, restitution: 1.0));
  }
}

/* =========================
  BRICK
========================= */

final class BrickEntity extends Entity<G> {
  final Vector2 position;

  BrickEntity(super.app, this.position);

  @override
  void onAdd(_) {
    add(CTransform(app, position: position));
    add(CRectCollider(app,
      tag: 'brick',
      size: .vec2(60, 20),
      debugDraw: true,
      debugColor: .ORANGE,
    ));
    add(CPhysicsBody(app, mass: 0, restitution: 1));
  }
}

/* =========================
  SYSTEMS
========================= */

final class PaddleInputSystem extends SceneSystem<G> {
  final String K_left = 'left';
  final String K_right = 'right';

  PaddleInputSystem(super.app);

  @override
  void onAdd(ECSBase<G> parent) {
    super.onAdd(parent);

    input.mapKey(K_left, .KEY_A);
    input.mapKey(K_right, .KEY_D);
  }

  @override
  void onPostUpdate(double dt) {
    double axis = 0;
    if (input.isKeyDown(K_left)) axis = -1;
    if (input.isKeyDown(K_right)) axis = 1;
    scene.QueryEntity.DoFirst<PaddleEntity>((p) => p.emit(MovePaddle(app, axis), scope: .scene));
  }
}

final class ArkanoidRulesSystem extends SceneSystem<G> {
  int score = 0;

  ArkanoidRulesSystem(super.app);

  @override
  void onEvent(Event<G> e) {
    if (e is EventCollision<G>) {
      final ballBrick = e.as<BallEntity, BrickEntity>();

      if (ballBrick != null) {
        final (ball, brick) = ballBrick;
        callback(() => scene.removeEntity(brick));
        score += 100;
      }
    }

    if (e is BallLost) {
      emit(SpawnBall(app), scope: .scene);
    }
  }

  @override
  void onPostDraw(double dt) {
    DrawText('Score: $score', 20, screenHeight - 40, 20, .WHITE);
  }
}

final class BallSpawnerSystem extends SceneSystem<G> {
  BallSpawnerSystem(super.app);

  @override
  void onEvent(Event<G> e) {
    if (e is SpawnBall) {
      scene.addEntity(BallEntity(app));
    }
  }
}

/* =========================
  SCENE
========================= */

final class ArkanoidScene extends DrawScene<G> {
  ArkanoidScene(super.app);

  @override
  void onStart() {
    addSystem(PaddleInputSystem(app));
    addSystem(CollisionResolverSystem(app));
    addSystem(ArkanoidRulesSystem(app));
    addSystem(BallSpawnerSystem(app));
    addSystem(ScreenBounceSystem(app));

    addEntity(PaddleEntity(app));
    emit(SpawnBall(app), scope: .scene); // start with a ball

    for (int y = 0; y < 4; y++) {
      for (int x = 0; x < 10; x++) {
        addEntity(BrickEntity(
          app,
          .vec2(80 + x * 65, 60 + y * 30),
        ));
      }
    }
  }

  @override
  void onDrawBackground() {
    DrawText(
      'EVENT-DRIVEN ARKANOID',
      20, 20, 20, .RAYWHITE,
    );
  }
}

/* =========================
  GAME
========================= */

final class Arkanoid extends App<G> {
  final String K_q = 'q';

  Arkanoid(super.backend);

  @override
  void onInit() {
    InitWindow(800, 450, 'arkanoid_structure_first');
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(ArkanoidScene(this));

    input.mapKey(K_q, .KEY_Q);
  }

  @override
  void onInput() {
    if (input.isKeyPressed(K_q)) {
      callback(() => app.exitApp = true);
    }
  }
}

final class ArkanoidEventDriven extends UnhingedRaylibApp<G> {
  @override
  G create(backend) => G(backend);

  @override
  bool shouldClose(Raylib rl) => app.shouldAppExit || super.shouldClose(rl);
}

void main() => runRaylibApp(
  ArkanoidEventDriven(),
  nativeLibPath: 'raylib-6.0_linux_amd64/lib'
);
