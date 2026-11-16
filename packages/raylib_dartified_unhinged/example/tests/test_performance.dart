// dart run test_performance.dart
import '_base.dart';

final class PerformanceScene extends DrawScene<G> {
  PerformanceScene(super.app);

  int ballCount = 1000;

  /*
    At 60 FPS.

    gridCellSize = 48, enableEventEmitting = false
      > enableCollision = true  // ~28 FPS with 1000 balls
      > enableCollision = false // ~58 FPS with 1000 balls

    gridCellSize = 48, enableEventEmitting = true
      > enableCollision = true  // ~22 FPS with 1000 balls
      > enableCollision = false // ~58 FPS with 1000 balls
  */

  @override
  void onStart() {
    addSystem(CollisionResolverSystem(app,
      gridCellSize: 48,
      enableEventEmitting: true,
    ));
    addSystem(ScreenBounceSystem(app, bottom: true));

    /**
     * BALL ENTITY
     */

    for (int x = 0; x < ballCount; x++) {
      addEntity(Entity(app)
        .add(CTransform(app,
          position: .vec2(
            app.screenWidth / 2 + ((rand() * 200) * (rand() < .5 ? 1 : -1)),
            app.screenHeight / 2 + ((rand() * 200) * (rand() < .5 ? 1 : -1)),
          ),
        ))
        .add(CVelocity(app,
          velocity: .vec2(
            (rand() * 220) * (rand() < .5 ? 1 : -1),
            (rand() * 260) * (rand() < .5 ? 1 : -1)
          ),
          linearDamping: .05,
        ))
        .add(CPhysicsBody(app, mass: 1.0, restitution: 0.0))
        .add(CCircleCollider(app,
          tag: 'ball',
          radius: 8,
          debugDraw: true,
          enableCollision: true,
        ))
      );
    }
  }

  @override
  void onEvent(Event<G> event) => event.stopPropagation();

  @override
  void onDrawBackground() {
    DrawText(
      'PERFORMANCE TEST',
      20, 20, 20, .RAYWHITE,
    );

    final pad = 10;
    final x = 50;
    final fs = 20;
    final y = app.screenHeight - 100;
    final text = 'Ball Count: $ballCount';
    final textw = MeasureText(text, fs);

    DrawRectangle(x - pad, y - pad, textw + pad * 2, fs * 2 + pad * 2, Fade(.BLUE, 0.5));
    DrawText(text, x, y, fs, .WHITE);
    DrawFPS(x, y + fs);
  }
}

typedef G = PerformanceTest;

final class PerformanceTest extends ExampleRaylibApp<G> {
  PerformanceTest(super.backend);

  @override
  void onInit() {
    InitWindow(800, 450, "test_performance");
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(PerformanceScene(app));
  }
}

void main() => runExample((backend) => G(backend));
