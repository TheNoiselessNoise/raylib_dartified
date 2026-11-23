// dart run arkanoid_test.dart
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:raylib_dartified_unhinged/backends/raylib.dart';

/* =========================
  EVENTS
========================= */

final class BallHitBrick extends Event<G> {
  final Entity<G> ball;
  final Entity<G> brick;
  BallHitBrick(super.app, this.ball, this.brick);
}

final class BallLost extends Event<G> {
  final Entity<G> ball;
  BallLost(super.app, this.ball);
}

final class LevelComplete extends Event<G> {
  LevelComplete(super.app);
}

/* =========================
  IDENTIFIERS
========================= */

final class CIsPaddle extends Comp<G>    { CIsPaddle(super.app); }
final class CIsBall extends Comp<G>      { CIsBall(super.app); }
final class CIsBrick extends Comp<G>     { CIsBrick(super.app); }
final class CIsDestroyed extends Comp<G> { CIsDestroyed(super.app); }

/* =========================
  GAME
========================= */

// NOTE: you MUST have your own game class
//       this is the minimal example required
//       Take it as a namespace for your universe.
typedef G = Arkanoid;
final class Arkanoid extends App<G> {
  Arkanoid(super.backend);
}

final class ArkanoidInline extends UnhingedRaylibApp<G> {
  @override
  G create(UnhingedBackend backend) => G(backend).onSelf((app) {
    final rl = (backend as RaylibBackend).rl;

    final String K_q = 'q';
    final String K_r = 'r';
    final String K_left = 'left';
    final String K_right = 'right';
    final String K_up = 'up';
    final String K_down = 'down';

    app.input.mapKeys({
      K_q: .KEY_Q,
      K_r: .KEY_R,
      K_left: .KEY_A,
      K_right: .KEY_D,
      K_up: .KEY_W,
      K_down: .KEY_S,
    });

    app.listenOnInit((app) {
      InitWindow(800, 450, 'arkanoid_structure_first');
      SetWindowMonitor(0);
      SetTargetFPS(60);
    });

    /* =========================
      SCENE
    ========================= */

    app.addScene(DrawScene(app)
      .listenOnDrawBackground((scene, alpha) {
        DrawText('DUMB ARKANOID', 20, 20, 20, .WHITE);
        DrawFPS(50, app.screenHeight - 80);
      })
      .listenOnStart((scene) {
        scene.addSystem(CollisionResolverSystem(app));
        scene.addSystem(ScreenBounceSystem(app, bottom: false));

        /**
         * ARKANOID STATE & EVENT DISTRIBUTION ENTITY
         */

        scene.addEntity(
          Entity(app)
          .listenOnEvent((self, e) {
            if (e is EventCollision<G>) {
              final ballBrick = e.has<CIsBall, CIsBrick>();

              if (ballBrick != null) {
                final (ball, brick) = ballBrick;
                scene.emit(BallHitBrick(app, ball, brick), scope: .global);
              }
            }
          })
          .listenOnPostUpdate((self, dt) {
            // check if there are any bricks that have not been destroyed yet
            // if so, return
            if (scene.QueryEntity
              .With<CIsBrick>()
              .Except<CIsDestroyed>()
              .IsNotEmpty) return;

            // otherwise level completed
            scene.emit(LevelComplete(app), scope: .global);
          })
        );

        /**
         * PADDLE ENTITY
         */

        final varSpeed = VarNumKey<double>('speed');
        final varPoints = VarNumKey<int>('points');
        scene.addEntity(
          Entity(app)
          .add(CIsPaddle(app))
          .add(CTransform(app,
            position: .vec2(
              app.screenWidth / 2,
              app.screenHeight - 40,
            ),
          ))
          .add(CVelocity(app))
          .add(CPhysicsBody(app, mass: 0, restitution: 1))
          .add(CRectCollider(app,
            tag: 'paddle',
            size: .vec2(120, 20),
            debugDraw: true,
          ))
          .listenOnAdd((self, parent) {
            varSpeed.set(self, 600.0);
            varPoints.set(self, 0);
          })
          .listenOnPostUpdate((self, dt) => self.onVelocity((v) {
            v.velocity.x = 0;
            final speed = varSpeed.get(self);
            if (scene.input.isKeyDown(K_left)) v.velocity.x = -speed;
            if (scene.input.isKeyDown(K_right)) v.velocity.x = speed;
            if (scene.input.isKeyDown(K_up)) varSpeed.inc(self, 100*dt);
            if (scene.input.isKeyDown(K_down)) varSpeed.dec(self, 100*dt);
          }))
          .listenOnDraw((self, alpha) {
            final speed = varSpeed.get(self);
            final points = varPoints.get(self);
            DrawText('Speed: ${speed.f2}', 50, app.screenHeight - 160, 20, .WHITE);
            DrawText('Points: $points', 50, app.screenHeight - 140, 20, .WHITE);
          })
          .listenOnEvent((self, e) {
            if (e is BallLost) {
              varPoints.dec(self, 100);
            }
            if (e is BallHitBrick) {
              varPoints.inc(self, 10);
            }
          })
        );

        /**
         * BALL ENTITY
         */

        scene.addEntity(Entity(app)
          .add(CIsBall(app))
          .add(CTransform(app,
            position: .vec2(
              app.screenWidth / 2,
              app.screenHeight / 2,
            ),
          ))
          .add(CVelocity(app,
            velocity: .vec2(GetRandomValue(-100, 100), -300),
            linearDamping: 0,
          ))
          .add(CPhysicsBody(app, mass: 1.0, restitution: 1.0))
          .add(CCircleCollider(app, radius: 8, debugDraw: true))
          .add(COutOfBounds(app,
            then: (c) {
              c.entity.onTransform((t) => t.position.set(app.screenWidth / 2, app.screenHeight - 150));
              c.entity.onVelocity((v) => v.velocity.y = -v.velocity.y.abs());
            }
          ))
          .listenOnPostUpdate((self, dt) => self.onTransform((t) {
            if (scene.input.isKeyDown(K_r)) {
              self.onTransform((t) => t.position.set(app.screenWidth / 2, app.screenHeight - 150));
              self.onVelocity((v) => v.velocity.y = -v.velocity.y.abs());
            }
          }))
          .listenOnEvent((self, e) {
            if (e is BallHitBrick) {
              e.brick.add(CIsDestroyed(app));
              e.brick.disableAll();
              e.stopPropagation();
            }
          })
        );

        /**
         * BRICK ENTITIES
         */

        for (int y = 0; y < 4; y++) {
          for (int x = 0; x < 10; x++) {
            scene.addEntity(
              Entity(app)
              .onSelf((e) => e..name = 'BRICK_${e.id}')
              .add(CIsBrick(app))
              .add(CTransform(app,
                position: .vec2(80 + x * 65, 60 + y * 30)
              ))
              .add(CRectCollider(app,
                tag: 'brick',
                size: .vec2(60, 20),
                debugDraw: true,
                debugColor: .ORANGE,
              ))
              .add(CPhysicsBody(app, mass: 0, restitution: 1))
              .listenOnPostUpdate((self, dt) {
                self.on<CRectCollider<G>>((c) {
                  final frameCount = app.time.frameCount;
                  if (frameCount == 1 || frameCount % 100 == 0) {
                    c.debugColor = .color(
                      rl.random.nextInt(156) + 100,
                      rl.random.nextInt(156) + 100,
                      rl.random.nextInt(156) + 100,
                      rl.random.nextInt(156) + 100,
                    );
                  }
                });
              })
              .listenOnEvent((self, e) {
                if (e is LevelComplete) {
                  self.remove<CIsDestroyed>();
                  self.enableEverything();
                }
              })
            );
          }
        }
      }
    ));

    app.listenOnInput((self) {
      if (self.input.isKeyPressed(K_q)) {
        self.callback(() => app.exitApp = true);
      }
    });
  });
}

void main() => runRaylibApp(
  ArkanoidInline(),
  nativeLibPath: 'raylib-6.0_linux_amd64/lib'
);