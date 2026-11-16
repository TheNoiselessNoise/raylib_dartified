// Run it: dart run test_animator.dart
import '_base.dart';

final class PlayerEntity extends Entity<G> {
  final String K_up = 'up';
  final String K_down = 'down';
  final String K_left = 'left';
  final String K_right = 'right';
  final String K_rotL = 'rotL';
  final String K_rotR = 'rotR';

  PlayerEntity(super.app);

  int get frameWidth => 128;
  double get rotationSpeed => 100;
  double get speed => 1000;

  @override
  void onAdd(_) {
    add(CInput(app,
      keyMap: {
        K_up: .KEY_W, K_down: .KEY_S,
        K_left: .KEY_A, K_right: .KEY_D,
        K_rotL: .KEY_LEFT, K_rotR: .KEY_RIGHT,
      },
    ));

    add(CTransform(app,
      position: screenSize.divideBy(2),
    ));

    add(CVelocity(app, linearDamping: 10));

    add(CAnimator.fromGroup(app,
      groupPath: 'resources',
      animationNames: [
        'scarfy'
      ],
      frameWidth: frameWidth,
      initialAnimation: 'scarfy',
      extension: 'png',
      postAnimation: (anim) => anim..paddingX = 1,
    ));

    add(CRectCollider(app,
      tag: 'player',
      size: .vec2(frameWidth, frameWidth),
      debugDraw: true,
      debugColor: .RED,
      enableRotation: true,
    ));

    add(CCircleCollider(app,
      tag: 'player',
      radius: frameWidth/2,
      debugDraw: true,
      debugColor: .GREEN,
    ));
  }

  @override
  void onPostUpdate(double dt) => on<CVelocity<G>>((velocity) {
    if (input.isKeyDown(K_left)) velocity.velocity.x -= dt * speed;
    if (input.isKeyDown(K_right)) velocity.velocity.x += dt * speed;
    if (input.isKeyDown(K_up)) velocity.velocity.y -= dt * speed;
    if (input.isKeyDown(K_down)) velocity.velocity.y += dt * speed;
    
    // Rotation
    velocity.angularVelocity = 0;
    if (input.isKeyDown(K_rotL)) velocity.angularVelocity = -rotationSpeed * dt;
    if (input.isKeyDown(K_rotR)) velocity.angularVelocity = rotationSpeed * dt;
  });
}

final class MyScene extends DrawScene<G> {
  late PlayerEntity player; 

  MyScene(super.app);

  @override
  void onStart() {
    addSystem(GravitySystem(app));
    addSystem(ScreenBounceSystem(app));

    player = PlayerEntity(app);
    addEntity(player);
  }

  @override
  void onDrawBackground() {
    DrawText(
      'Press <O> - <P> to change FPS modes',
      20, 10, 20, .RAYWHITE,
    );

    DrawText(
      'Press <K> - <L> to change animation (if more available)',
      20, 30, 20, .RAYWHITE,
    );

    DrawText(
      'Press <N> - <M> to change time scale',
      20, 50, 20, .RAYWHITE,
    );

    player.on<CTransform<G>>((transform) {
      DrawText(
        'Position: ${transform.position}',
        20, app.screenHeight - 130, 20, .RAYWHITE,
      );
    });

    player.on<CVelocity<G>>((velocity) {
      DrawText(
        'Velocity: ${velocity.velocity}',
        20, app.screenHeight - 110, 20, .RAYWHITE,
      );
    });

    player.on<CAnimator<G>>((animator) {
      DrawText(
        'Animation: ${animator.currentAnimName}',
        20, app.screenHeight - 90, 20, .RAYWHITE,
      );
    });

    DrawText(
      'Time scale: ${app.time.timeScale.f1}',
      20, app.screenHeight - 70, 20, .RAYWHITE,
    );

    DrawText(
      'Screen: $screenSize',
      20, app.screenHeight - 50, 20, .RAYWHITE,
    );

    DrawText(
      'FPS: ${app.time.fps}',
      20, app.screenHeight - 30, 20, .RAYWHITE,
    );
  }

  List<int> fpsModes = [60, 30, 20, 10];
  int currentFpsMode = 0;

  @override
  void onInput() {
    // animations with not fixed frameDuration should update according to FPS
    if (IsKeyPressed(.KEY_P)) {
      currentFpsMode = (currentFpsMode + 1) % fpsModes.length;
      app.time.setFPS(fpsModes[currentFpsMode]);
    }

    if (IsKeyPressed(.KEY_O)) {
      currentFpsMode = (currentFpsMode - 1) % fpsModes.length;
      app.time.setFPS(fpsModes[currentFpsMode]);
    }

    if (IsKeyPressed(.KEY_L)) {
      player.on<CAnimator<G>>((a) => a.playNextAnimation());
    }

    if (IsKeyPressed(.KEY_K)) {
      player.on<CAnimator<G>>((a) => a.playPrevAnimation());
    }

    if (IsKeyPressed(.KEY_N)) {
      app.time.updateTimeScale((ts) => ts - 0.1);
    }

    if (IsKeyPressed(.KEY_M)) {
      app.time.updateTimeScale((ts) => ts + 0.1);
    }
  }
}

typedef G = MyGame;

final class MyGame extends ExampleRaylibApp<G> {
  MyGame(super.backend);

  @override
  Vector2 get screenSize => .vec2(800, 450);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_animator");
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(MyScene(this));
  }

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_Q)) {
      callback(() => app.exit());
    }

    if (IsKeyPressed(.KEY_D)) {
      final player = scene.QueryEntity.On<PlayerEntity>().First;
      print(player.getAll<CCollider<G>>());
    }

    if (IsKeyPressed(.KEY_SPACE)) {
      final player = scene.QueryEntity.On<PlayerEntity>().First;
      scene.removeEntity(player);
      time.setFPS(30);
    }
  }
}

void main() => runExample((backend) => G(backend));