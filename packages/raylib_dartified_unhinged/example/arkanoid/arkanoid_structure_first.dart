// Run it: dart run arkanoid_structure_first.dart
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:raylib_dartified_unhinged/backends/raylib.dart';

/*
  A fully-featured Arkanoid clone built in the UNHINGED Framework.

  Features:
    > LEVELS - first 6 hand-crafted levels, then procedurally generated to infinity
    > BRICKS - each brick has health that drains on ball collision
    > CHEAT MODE - moves the original ball with ARROW KEYS instead of the paddle
    > GAME OVER - (M key) game over screen with submittable score to table of high-scores
    > PAUSE - (ENTER key) ability to pause a game
    > POWER UPS:
      > widenPaddle   - widens the paddle for easier multi-ball control
      > shortenPaddle - narrows the paddle (opposite of widenPaddle)
      > splitBalls    - duplicates every existing ball
      > upDamage      - increases all ball damage by 1

  Sections:
    > EVENTS             (Available events throughout the ECS system)
    > PADDLE             (Entity)
    > BALL               (Entity)
    > BRICK              (Entity)
    > POWER-UP           (Entity)
    > EVENT HANDLING     (SceneSystem) - centralized event dispatch
    > COLLISION RESOLVER (SceneSystem) - defines valid collisions and their outcomes
    > STATS              (SceneSystem) - tracks level, bricksDestroyed, etc.
    > GAME OVER SCENE    (Scene)       - scene for the game over screen
    > SCENE              (Scene)       - scene of the playable game
    > GAME               (App)         - entry point
*/

// WARNING: this example grew piecemeal alongside the framework itself rather
// than being written against a finished API, so don't read it as "the"
// idiomatic way to use UNHINGED.

/* =========================
  EVENTS
========================= */

final class BallHitBrickEvent extends Event<G> {
  final BallEntity ball;
  final BrickEntity brick;
  
  BallHitBrickEvent(super.app, this.ball, this.brick);
}

final class BallLostEvent extends Event<G> {
  final BallEntity ball;
  
  BallLostEvent(super.app, this.ball);
}

final class SpawnBallEvent extends Event<G> {
  SpawnBallEvent(super.app);
}

final class PowerUpCollectedEvent extends Event<G> {
  final PowerUpType type;
  final PaddleEntity paddle;

  PowerUpCollectedEvent(super.app, this.type, this.paddle);
}

final class LevelCompleteEvent extends Event<G> {
  LevelCompleteEvent(super.app);
}

/* =========================
  PADDLE
========================= */

final class PaddleEntity extends Entity<G> {
  static final String TAG = 'paddle'; 

  final String K_left = 'left';
  final String K_right = 'right';

  PaddleEntity(super.app);

  double speed = 600;
  Vector2 size = .vec2(120, 20);
  Color color = .GREEN;

  @override
  void onAdd(_) {
    add(CInput(app, keyMap: {
      K_left: .KEY_A,
      K_right: .KEY_D,
    }));
    add(CTransform(app, position: .vec2(sceneWidth / 2, sceneHeight - 40)));
    add(CVelocity(app));
    add(CPhysicsBody.kinematic(app));
    add(CRectCollider(app, tag: TAG, size: size));
  }

  @override
  void onPostUpdate(double dt) => onVelocity((v) {
    // `bounds` use any existing sized component in this case `CRectCollider`
    get<CRectCollider<G>>()?.size = size;

    v.velocity.x = 0;

    onTransform((t) {
      final rx = bounds!.width / 2;
      final atLeft = t.position.x <= rx;
      final atRight = t.position.x >= app.screenWidth - rx;

      if (input.isKeyDown(K_left)  && !atLeft)  v.velocity.x = -speed;
      if (input.isKeyDown(K_right) && !atRight) v.velocity.x =  speed;
    });
  });

  @override
  void onDraw(double dt) => DrawRectangleRec(bounds!.rectangle, color);
}

/* =========================
  BALL
========================= */

final class BallEntity extends Entity<G> {
  static final String TAG = 'ball'; 

  int damage = 1;
  late Vector2 position;
  late Vector2 initialVelocity;
  bool isCopy;

  BallEntity(super.app, {
    Vector2? position,
    Vector2? velocity,
    this.isCopy = false,
  }) {
    this.position = position ?? sceneBounds.size.divideBy(2);
    initialVelocity = velocity ?? .vec2(GetRandomValue(-100, 100), -300);
  }

  void reset() {
    transform!.position = sceneBounds.size.divideBy(2);
    velocity!.velocity = .vec2(GetRandomValue(-100, 100), -300);
  }

  @override
  void onAdd(_) {
    add(CTransform(app, position: position.copy()));
    add(CVelocity(app, velocity: initialVelocity, linearDamping: 0));
    add(CCircleCollider(app, tag: TAG, radius: 8, debugDraw: true));
    add(CPhysicsBody(app, mass: 1.0, restitution: 1.0));
    add(COutOfBounds(app, triggerOnce: false, then: (oob) => emit(BallLostEvent(app, this), scope: .scene)));
  }

  bool manualMode = false;
  double manualSpeed = 400;

  @override
  void onPostUpdate(double dt) {
    get<CCircleCollider<G>>()!.debugColor = manualMode ? .GOLD : .GREEN;

    if (manualMode) onVelocity((v) {
      v.velocity = .zero();
      if (IsKeyDown(.KEY_UP)) v.velocity.y = -manualSpeed;
      if (IsKeyDown(.KEY_DOWN)) v.velocity.y = manualSpeed;
      if (IsKeyDown(.KEY_LEFT)) v.velocity.x = -manualSpeed;
      if (IsKeyDown(.KEY_RIGHT)) v.velocity.x = manualSpeed;
    });
  }

  @override
  void onDraw(double dt) => onTransform((t) {
    final x = t.position.x;
    final y = t.position.y - 5;
    DrawText('$damage', x, y, 10, .WHITE);
  });
}

/* =========================
  BRICK
========================= */

final class BrickEntity extends Entity<G> {
  static final String TAG = 'brick'; 

  final Vector2 position;
  final Vector2 size;
  double maxHealth;
  late double health;
  Color color;

  BrickEntity(super.app, {
    required this.position,
    required this.size,
    required this.maxHealth,
    Color? color,
  }) :
    color = color ?? .ORANGE,
    health = maxHealth.roundToDouble();

  bool damage(int amount) {
    health -= amount;
    return health <= 0;
  }

  @override
  void onAdd(_) {
    add(CTransform(app, position: position.copy()));
    add(CRectCollider(app,
      tag: TAG,
      size: size,
      debugDraw: true,
      debugColor: color,
    ));
    add(CPhysicsBody(app, mass: 0, restitution: 1));
  }

  @override
  void onPostUpdate(double dt) => on<CRectCollider<G>>((c) {
    final value = RaylibFunctions.Remap(health, maxHealth, 0, 1, 0);
    c.debugColor = Fade(color, value);
  });

  @override
  void onDraw(double dt) => onTransform((t) {
    final x = t.position.x;
    final y = t.position.y - 5;
    DrawText(health.f0, x, y, 10, .WHITE);
  });
}

/* =========================
  POWER-UP
========================= */

extension on HasSceneAccess<G> {
  void _spawnExtraBalls() => scene.QueryEntity.DoForEachWith<CCollider<G>>((e, c) {
    if (e.collider?.tag != BallEntity.TAG) return;

    final pos = e.transform!.position;
    final vel = e.velocity!.velocity;

    callback(() => scene.addEntity(BallEntity(app,
      position: pos.copy(),
      velocity: .vec2(-vel.x, vel.y),
      isCopy: true,
    )));
  });

  void _upDamageForBalls() => scene.QueryEntity.DoForEach<BallEntity>((b) {
    b.damage++;
  });
}

enum PowerUpType {
  widenPaddle(1.2),
  shortenPaddle(0.3),
  splitBalls(2),
  upDamage(3);

  final double hardness;
  const PowerUpType(this.hardness);

  String get label => switch (this) {
    .widenPaddle => '+',
    .shortenPaddle => '-',
    .splitBalls => 'x2',
    .upDamage => 'DMG',
  };

  Color get color => switch (this) {
    .widenPaddle => .color(0xFF, 0x00, 0xFF, 0x88),
    .shortenPaddle => .color(0xFF, 0xFF, 0x44, 0x44),
    .splitBalls => .color(0xFF, 0x44, 0x88, 0xFF),
    .upDamage => .AZURE,
  };

  static PowerUpType random() {
    final items = values.toList();
    items.shuffle();
    return items.first;
  }
}

final class PowerUpBrick extends BrickEntity {
  final PowerUpType type;

  PowerUpBrick(super.app, {
    required super.position,
    required super.size,
    required super.maxHealth,
    required this.type,
  }) : super(color: type.color);
}

final class PickablePowerUp extends Entity<G> {
  static final String TAG = 'powerup';

  final PowerUpType type;
  final double speed = 150;
  final Vector2 position;

  PickablePowerUp(super.app, {
    required this.type,
    required this.position,
  });

  @override
  void onAdd(_) {
    add(CTransform(app, position: position.copy()));
    add(CVelocity(app)..velocity.y = speed);
    add(CRectCollider(app, tag: TAG, size: .vec2(24, 24), debugDraw: true, debugColor: type.color));
    add(CPhysicsBody.kinematic(app, restitution: 0));
    add(COutOfBounds(app, then: (_) => callback(() => scene.removeEntity(this))));
  }

  @override
  void onDraw(double dt) => onTransform((t) {
    DrawText(type.label, t.position.x - 6, t.position.y - 6, 14, type.color);
  });
}

/* =========================
  EVENT HANDLING
========================= */

final class ArkanoidEventHandler extends SceneSystem<G> {
  ArkanoidEventHandler(super.app);

  @override
  void onEvent(Event<G> e) {
    if (e is EventCollision<G>) {
      final ballBrick = e.as<BallEntity, BrickEntity>();

      if (ballBrick != null) {
        final (ball, brick) = ballBrick;

        statsSystem.ballHits++;
        emit(BallHitBrickEvent(app, ball, brick), scope: .scene);
      }

      e.stopPropagation();
    }

    if (e is BallLostEvent) {
      statsSystem.ballsLost++;
      if (e.ball.isCopy) {
        callback(() => scene.removeEntity(e.ball));
      } else {
        e.ball.reset();
        callback(() => app.setScene(gameOverScene));
      }
    }

    if (e is SpawnBallEvent) {
      callback(() => scene.addEntity(BallEntity(app)));
      e.stopPropagation();
    }

    if (e is PowerUpCollectedEvent) {
      switch (e.type) {
        case .widenPaddle:
          e.paddle.size = e.paddle.size.add(.vec2(10, 0));
        case .shortenPaddle:
          e.paddle.size = e.paddle.size.sub(.vec2(10, 0));
        case .splitBalls:
          _spawnExtraBalls();
        case .upDamage:
          _upDamageForBalls();
      }
      e.stopPropagation();
    }
  }
}

/* =========================
  COLLISION RESOLVER
========================= */

// NOTE: `CollisionResolverSystem` is really bad
final class ArkanoidCollisionResolver extends CollisionResolverSystem<G> {
  ArkanoidCollisionResolver(super.app);

  @override
  HookResult onBeforeCollision(ColliderCollision<G> collision) {
    if (collision.hasEntities<BallEntity, BallEntity>()) return .cancel;
    if (collision.hasEntities<PickablePowerUp, PickablePowerUp>()) return .cancel;
    if (collision.hasEntities<PickablePowerUp, BallEntity>()) return .cancel;
    if (collision.hasEntities<PickablePowerUp, BrickEntity>()) return .cancel;
    return .proceed;
  }

  @override
  void onAfterCollision(ColliderCollision<G> collision) {
    _handleBallBrick(collision);
    _handlePowerUpPaddle(collision);
  }

  void _handleBallBrick(ColliderCollision<G> collision) {
    final match = collision.asEntities<BallEntity, BrickEntity>();
    if (match == null) return;
    final (ball, brick) = match;

    if (brick.damage(ball.damage)) {
      statsSystem.bricksDestroyed++;
      statsSystem.score += statsSystem.level;
      
      if (brick is PowerUpBrick) {  
        brick.onTransform((t) {
          callback(() => scene.addEntity(PickablePowerUp(app,
            type: brick.type,
            position: t.position.copy(),
          )));
        });
      }

      callback(() => scene.removeEntity(brick));
      emit(BallHitBrickEvent(app, ball, brick), scope: .scene);

      if (statsSystem.isLevelComplete) {
        emit(LevelCompleteEvent(app), scope: .scene);
      }
    }
  }

  void _handlePowerUpPaddle(ColliderCollision<G> collision) {
    final match = collision.asEntities<PickablePowerUp, PaddleEntity>();
    if (match == null) return;
    final (powerUp, paddle) = match;

    statsSystem.score += (statsSystem.level * powerUp.type.hardness).round();
    emit(PowerUpCollectedEvent(app, powerUp.type, paddle), scope: .scene);
    callback(() => scene.removeEntity(powerUp));
  }
}

/* =========================
  STATS 
========================= */

extension on HasAppAccess<G> {
  ArkanoidStatsSystem get statsSystem => app.getSystem()!;
}

final class ArkanoidStatsSystem extends AppSystem<G> {
  bool cheatMode = false;
  final _cheatModeKey = 'CHEAT';

  ArkanoidStatsSystem(super.app) {
    input.mapCode(_cheatModeKey);
  }

  int ballsLost = 0;
  int ballHits = 0;
  int bricksDestroyed = 0;
  int bricksCurrentLevel = 0;
  int level = 1;
  int score = 0;

  final Color _textColor = .color(255, 255, 255, 50);

  bool get isLevelComplete => bricksDestroyed >= bricksCurrentLevel;

  final Map<String, int> highScores = {};
  void addHighScoreFor(String name) => highScores[name] = score;

  void drawTextLine(String text, int yStart, int fontSize, Color textColor) {
    final screen = sceneBounds.size;
    final w = MeasureText(text, fontSize);
    DrawText(text, screen.x / 2 - w / 2, screen.y / 2 - fontSize / 2 + yStart, fontSize, textColor);
  }

  @override
  void onBeginFrame(double dt) {
    if (app.scene != arkanoidScene) return;
    
    final screen = sceneBounds.size;

    int textY = 0;
    if (cheatMode) {
      drawTextLine('CHEAT MODE', textY+=0, 50, Fade(.GOLD, 0.1));
      drawTextLine('Use ARROW keys to move the ball', textY+=50, 20, Fade(.GOLD, 0.1));
    }

    if (app.gamePaused) {
      drawTextLine('GAME PAUSED', textY+=50, 50, .AZURE);
    }

    DrawText('LEVEL: $level', 20, screen.y - 140, 20, _textColor);
    DrawText('BALLS LOST: $ballsLost', 20, screen.y - 120, 20, _textColor);
    DrawText('BALL HITS: $ballHits', 20, screen.y - 100, 20, _textColor);
    DrawText('BRICKS: $bricksDestroyed/$bricksCurrentLevel', 20, screen.y - 80, 20, _textColor);
    DrawText('SCORE: $score', 20, screen.y - 60, 20, _textColor);
  }

  @override
  void onInput() {
    if (input.isCodeCompleted(_cheatModeKey)) {
      cheatMode = !cheatMode;
      _doCheatMode();
    }
  }

  void _doCheatMode() {
    scene.QueryEntity.DoForEach<BallEntity>((b) {
      if (b.isCopy) return;
      b.manualMode = cheatMode;
      if (!cheatMode) b.reset();
    });
  }
}

/* =========================
  GAME OVER SCENE
========================= */

final class ArkanoidGameOverWidget extends FWidget<G> {

  ArkanoidGameOverWidget(super.app);

  bool scoreSubmitted = false;
  bool showOnly = false;

  String textName = '';
  Color borderOverride = .GREEN;
  FShake<G>? errorText;

  void setError(String? error) => setState(() {
    errorText = null;
    if (error != null) {
      errorText = .new(app, child: FLabel(app, text: error, color: .RED));
    }
    borderOverride = errorText == null ? .GREEN : .RED;
    errorText?.shake();
  });

  @override
  void onPostUpdate(double dt) {
    if (showOnly && IsKeyPressed(.KEY_M)) {
      goToArkanoidScene();
    }
  }

  @override
  FWidget<G> build() {
    final sortedHighScores = statsSystem.highScores.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    return FCenter(app,
      vertical: true,
      child: FColumn(app,
        alignment: .center,
        gap: 8,
        children: [
          FContainer(app,
            backgroundColor: showOnly ? .BLUE : .RED,
            child: FRow(app,
              alignment: .center,
              children: [
                FPadding.LTRB(app, 8, 16, 8, 16,
                  child: FColumn(app,
                    alignment: .center,
                    children: [
                      FLabel(app, text: showOnly ? 'HIGH SCORES' : 'GAME OVER', color: .WHITE),
                    ],
                  ),
                ),
              ],
            ),
          ),

          FExpanded(app,
            child: FCenter(app,
              vertical: true,
              child: FColumn(app,
                alignment: .center,
                children: [
                  if (sortedHighScores.isEmpty) ...[
                    FLabel(app, text: 'NO RESULTS YET'),
                  ] else ...[
                    for (final (i, e) in sortedHighScores.indexed)
                      FLabel(app, text: '${i+1}. ${e.key} - ${e.value}'),
                  ],
                ],
              ),
            ),
          ),
          
          if (!showOnly && !scoreSubmitted) ...[
            FTextInput(app,
              size: .vec2(200, 50),
              maxLength: 8,
              initialText: textName,
              onChangedFn: (_, text) => textName = text,
              borderOverride: borderOverride,
              placeholder: 'Your name...',
            ),

            ?errorText,

            FPadding.LTRB(app, 0, 0, 0, 16,
              child: FButton(app,
                onClickFn: (_) {
                  if (textName.isEmpty) {
                    setError('Name cannot be empty!');
                  } else {
                    if (statsSystem.highScores.containsKey(textName)) {
                      setError('Name already exists!');
                    } else {
                      statsSystem.addHighScoreFor(textName);
                      scoreSubmitted = true;
                      setError(null);
                    }
                  }
                },
                usePendingSingleClickMethod: false,
                child: FPadding.all(app, 16,
                  child: FLabel(app, text: 'Submit'),
                ),
              ),
            ),
          ] else ...[
            FPadding.LTRB(app, 0, 0, 0, 16,
              child: FButton(app,
                onClickFn: (_) {
                  if (!showOnly) {
                    statsSystem.score = 0;
                    statsSystem.level = 1;
                    arkanoidScene.resetLevel();
                    arkanoidScene.setupLevel(level: statsSystem.level);
                  }
                  goToArkanoidScene();           
                },
                usePendingSingleClickMethod: false,
                child: FPadding.all(app, 16,
                  child: FLabel(app, text: 'Continue'),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  void goToArkanoidScene() {
    scoreSubmitted = false;
    showOnly = false;
    callback(() => app.setScene(arkanoidScene));
  }
}

extension on HasAppAccess<G> {
  ArkanoidGameOverScene get gameOverScene => app.getScene()!;
}

final class ArkanoidGameOverScene extends FWidgetScene<G> {
  static final String KEY = '$ArkanoidGameOverScene';

  late ArkanoidGameOverWidget gameOverWidget;

  ArkanoidGameOverScene(super.app) : super(key: KEY) {
    addEntity(gameOverWidget = ArkanoidGameOverWidget(app));
  }

  @override
  void onEnter() => gameOverWidget.rebuild();
}

/* =========================
  SCENE
========================= */

extension on HasAppAccess<G> {
  ArkanoidScene get arkanoidScene => app.getScene()!;
}

final class ArkanoidScene extends DrawScene<G> {
  static final String KEY = '$ArkanoidScene';

  ArkanoidScene(super.app) : super(key: KEY);

  final String title = 'STRUCTURE-FIRST ARKANOID';
  final int fontSize = 20;

  @override
  void onStart() {
    addSystem(ScreenBounceSystem(app, bottom: false));
    addSystem(ArkanoidCollisionResolver(app));
    addSystem(ArkanoidEventHandler(app));
    addEntity(PaddleEntity(app));
    addEntity(BallEntity(app));
    setupLevel(level: statsSystem.level);
  }

  @override
  void onEvent(Event<G> event) {
    if (event is LevelCompleteEvent) {
      resetLevel();
      setupLevel(level: ++statsSystem.level);
    }
  }

  void resetLevel() {
    statsSystem.bricksDestroyed = 0;
    statsSystem.bricksCurrentLevel = 0;

    // remove all existing bricks/powerups
    QueryEntity.DoForEach<BrickEntity>((e) => callback(() => scene.removeEntity(e)));

    // remove any ball copies and reset the initial ball
    QueryEntity.DoForEach<BallEntity>((e) {
      if (e.isCopy) callback(() => scene.removeEntity(e));
      else e.reset();
    });
  }

  void setupLevel({int level = 1}) {
    switch (level) {
      case 1: _setupLevel1();
      case 2: _setupLevel2();
      case 3: _setupLevel3();
      case 4: _setupLevel4();
      case 5: _setupLevel5();
      default: _setupRandomLevel(level);
    }
  }

  // Level 1: simple full grid, low health, no power-ups
  void _setupLevel1() {
    for (int y = 0; y < 3; y++) {
      for (int x = 0; x < 11; x++) {
        _addBrick(x, y, health: 1, color: .SKYBLUE);
      }
    }
  }

  // Level 2: checkerboard pattern
  void _setupLevel2() {
    for (int y = 0; y < 4; y++) {
      for (int x = 0; x < 11; x++) {
        if ((x + y) % 2 == 0) {
          _addBrick(x, y, health: 2, color: .GREEN);
        }
      }
    }
  }

  // Level 3: full grid, slightly tougher, first power-ups appear
  void _setupLevel3() {
    for (int y = 0; y < 4; y++) {
      for (int x = 0; x < 11; x++) {
        if (rand() > .85) {
          _addPowerUpBrick(x, y, healthMultiplier: 1.0);
        } else {
          _addBrick(x, y, health: 2, color: .ORANGE);
        }
      }
    }
  }

  // Level 4: diamond/rhombus shape
  void _setupLevel4() {
    const int cx = 5;
    const int cy = 2;
    for (int y = 0; y < 5; y++) {
      for (int x = 0; x < 11; x++) {
        if ((x - cx).abs() + (y - cy).abs() <= 4) {
          if (rand() > .80) {
            _addPowerUpBrick(x, y, healthMultiplier: 1.0);
          } else {
            _addBrick(x, y, health: 3, color: .VIOLET);
          }
        }
      }
    }
  }

  // Level 5: pyramid
  void _setupLevel5() {
    for (int y = 0; y < 5; y++) {
      final int start = y;
      final int end = 10 - y;
      for (int x = start; x <= end; x++) {
        if (rand() > .78) {
          _addPowerUpBrick(x, y, healthMultiplier: 1.5);
        } else {
          _addBrick(x, y, health: (3 + y).toDouble(), color: .RED);
        }
      }
    }
  }

  // Level 6+: random chaos, scales with level
  void _setupRandomLevel(int level) {
    final int rows = 3 + (level / 4).floor().clamp(0, 5);
    final int cols = 11;
    final double powerUpChance = (0.10 + level * 0.03).clamp(0.10, 0.45);
    final double skipChance = (0.05 + level * 0.02).clamp(0.0, 0.35);
    final double healthMult = 1.0 + (level - 6) * 0.2;

    // pick a random layout style each level
    final int style = (rand() * 4).toInt();

    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        bool place = switch (style) {
          0 => true, // full grid
          1 => (x + y) % 2 == 0, // checkerboard
          2 => (x - 5).abs() + (y - rows ~/ 2).abs() <= 3 + level % 3, // growing diamond
          3 => rand() > skipChance, // random gaps
          _ => true,
        };

        if (!place) continue;

        if (rand() < powerUpChance) {
          _addPowerUpBrick(x, y, healthMultiplier: healthMult);
        } else {
          final double health = 2 + level * 0.5;
          _addBrick(x, y, health: health, color: _levelColor(level));
        }
      }
    }
  }

  // ---- helpers ----

  void _addBrick(int x, int y, {required double health, required Color color}) {
    statsSystem.bricksCurrentLevel++;

    final Vector2 size = .vec2(60, 20);
    final Vector2 position = .vec2(80 + (x * size.x) + 5, 60 + (y * size.y) + 5);
    addEntity(BrickEntity(app,
      position: position,
      size: size,
      maxHealth: health,
      color: color,
    ));
  }

  void _addPowerUpBrick(int x, int y, {required double healthMultiplier}) {
    statsSystem.bricksCurrentLevel++;

    final Vector2 size = .vec2(60, 20);
    final Vector2 position = .vec2(80 + (x * size.x) + 5, 60 + (y * size.y) + 5);
    final PowerUpType type = .random();
    addEntity(PowerUpBrick(app,
      position: position,
      size: size,
      maxHealth: 10 * type.hardness * healthMultiplier,
      type: type,
    ));
  }

  final List<Color> _levelColors = [.RED, .ORANGE, .YELLOW, .GREEN, .SKYBLUE, .BLUE, .VIOLET, .PINK];
  Color _levelColor(int level) => _levelColors[level % _levelColors.length];

  @override
  void onDrawBackground() {
    DrawFPS(10, 10);

    final w = MeasureText(title, fontSize);
    DrawText(title, app.screenWidth - w - 10, 10, fontSize, .RAYWHITE);
  }
}

/* =========================
  GAME
========================= */

/// Shorthand alias for [Arkanoid], used throughout the codebase to reduce verbosity.
typedef G = Arkanoid;

/// The Arkanoid game application.
///
/// It really does not matter where you handle the window initialization.
/// Just make sure window is initialized before the first frame of [DrawScene].
final class Arkanoid extends App<G> {
  Arkanoid(super.backend);

  bool gamePaused = false;

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, 'arkanoid_structure_first');
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addSystem(ArkanoidStatsSystem(app));
    addScene(ArkanoidScene(app));
    addScene(ArkanoidGameOverScene(app));
  }

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_Q)) {
      callback(() => app.exitApp = true);
    }

    if (IsKeyPressed(.KEY_M) && scene != gameOverScene) {
      gameOverScene.gameOverWidget.scoreSubmitted = true;
      gameOverScene.gameOverWidget.showOnly = true;
      callback(() => setScene(gameOverScene));
    }

    if (IsKeyPressed(.KEY_ENTER)) {
      gamePaused = !gamePaused;
      time.setTimeScale(gamePaused ? 0 : 1);
    }
  }
}

/// Backend-agnostic entry point for the Arkanoid application.
///
/// Implements [UnhingedRaylibApp] to decouple app creation from the underlying
/// Raylib backend, allowing the same game to run on native and web.
final class ArkanoidStructureFirst extends UnhingedRaylibApp<G> {
  @override
  G create(backend) => G(backend);
}

void main() => runRaylibApp(
  ArkanoidStructureFirst(),
  nativeLibPath: 'raylib-6.0_linux_amd64/lib'
);
