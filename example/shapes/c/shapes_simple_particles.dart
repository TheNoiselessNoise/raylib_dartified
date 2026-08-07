// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_simple_particles.c
// Run it: dart run shapes_simple_particles.dart
import 'dart:ffi';
import 'dart:math' as math;
import 'package:ffi/ffi.dart';
import '../../base_c.dart';

const int screenWidth = 800;
const int screenHeight = 450;
const int MAX_PARTICLES = 3000;

enum ParticleType {
  WATER,
  SMOKE,
  FIRE;

  ParticleType get prev => switch (this) {
    FIRE => SMOKE,
    SMOKE => WATER,
    WATER => FIRE,
  };

  ParticleType get next => switch (this) {
    WATER => SMOKE,
    SMOKE => FIRE,
    FIRE => WATER,
  };

  static ParticleType fromValue(int value) => switch (value) {
    0 => WATER,
    1 => SMOKE,
    2 => FIRE,
    _ => throw ArgumentError('Unknown value for $ParticleType: $value'),
  };
}

final class Particle extends Struct {
  @Int()
  external int type;
  external Vector2C position;
  external Vector2C velocity;
  @Float()
  external double radius;
  external ColorC color;
  @Float()
  external double lifeTime;
  @Bool()
  external bool alive;
}

final class CircularBuffer extends Struct {
  @Int()
  external int head;
  @Int()
  external int tail;
  external Pointer<Particle> buffer;
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_simple_particles".toC);
  SetTargetFPS(60);

  final particles = calloc<Particle>(MAX_PARTICLES);
  final circularBuffer = calloc<CircularBuffer>();
  circularBuffer.ref.buffer = particles;

  int emissionRate = -2;
  ParticleType currentType = .WATER;
  final emitterPosition = Vector2$.AtUnique().set(screenWidth/2.0, screenHeight/2.0);

  int frameCount = 0;
  while (!WindowShouldClose())
  {
    frameCount++;
    
    if (emissionRate < 0)
    {
      if (frameCount%-emissionRate == 0) EmitParticle(circularBuffer, emitterPosition.ref, currentType);
    }
    else
    {
      for (int i = 0; i <= emissionRate; i++) EmitParticle(circularBuffer, emitterPosition.ref, currentType);
    }

    // Update the parameters of each particle
    UpdateParticles(circularBuffer, screenWidth, screenHeight);

    // Remove dead particles from the circular buffer
    UpdateCircularBuffer(circularBuffer);

    // Change Particle Emission Rate (UP/DOWN arrows)
    if (IsKeyPressed(KeyboardKey.KEY_UP.value)) emissionRate++;
    if (IsKeyPressed(KeyboardKey.KEY_DOWN.value)) emissionRate--;

    // Change Particle Type (LEFT/RIGHT arrows)
    if (IsKeyPressed(KeyboardKey.KEY_RIGHT.value)) currentType = currentType.next;
    if (IsKeyPressed(KeyboardKey.KEY_LEFT.value)) currentType = currentType.prev;

    if (IsMouseButtonDown(MouseButton.MOUSE_BUTTON_LEFT.value)) emitterPosition.ref = GetMousePosition();

    BeginDrawing();

      ClearBackground(RAYWHITE);

      // Call the function with a loop to draw all particles
      DrawParticles(circularBuffer);

      // Draw UI and Instructions
      DrawRectangle(5, 5, 315, 75, Fade(SKYBLUE, 0.5));
      DrawRectangleLines(5, 5, 315, 75, BLUE);

      DrawText("CONTROLS:".toC, 15, 15, 10, BLACK);
      DrawText("UP/DOWN: Change Particle Emission Rate".toC, 15, 35, 10, BLACK);
      DrawText("LEFT/RIGHT: Change Particle Type (Water, Smoke, Fire)".toC, 15, 55, 10, BLACK);

      if (emissionRate < 0) DrawText("Particles every ${-emissionRate} frames | Type: ${currentType.name}".toC, 15, 95, 10, DARKGRAY);
      else DrawText("${emissionRate + 1} Particles per frame | Type: ${currentType.name}".toC, 15, 95, 10, DARKGRAY);

      DrawFPS(screenWidth - 80, 10);

    EndDrawing();
  }

  calloc.free(particles);
  calloc.free(circularBuffer);

  CloseWindowAndDispose();
}

void EmitParticle(Pointer<CircularBuffer> circularBuffer, Vector2C emitterPosition, ParticleType type)
{
  final newParticle = AddToCircularBuffer(circularBuffer);

  // If buffer is full, newParticle is NULL
  if (newParticle != nullptr)
  {
    // Fill particle properties
    newParticle.ref.position = emitterPosition;
    newParticle.ref.alive = true;
    newParticle.ref.lifeTime = 0.0;
    newParticle.ref.type = type.index;
    double speed = (rl.randC()%10)/5.0;
    switch (type)
    {
      case .WATER:
      {
        newParticle.ref.radius = 5.0;
        newParticle.ref.color = BLUE;
      }
      case .SMOKE:
      {
        newParticle.ref.radius = 7.0;
        newParticle.ref.color = GRAY;
      }
      case .FIRE:
      {
        newParticle.ref.radius = 10.0;
        newParticle.ref.color = YELLOW;
        speed /= 10.0;
      }
    }

    final direction = rl.randC()%360;
    newParticle.ref.velocity.set(
      speed*math.cos(direction*rl.DEG2RAD),
      speed*math.sin(direction*rl.DEG2RAD)
    );
  }
}

Pointer<Particle> AddToCircularBuffer(Pointer<CircularBuffer> circularBuffer)
{
  Pointer<Particle> particle = nullptr;

  // Check if buffer full
  if (((circularBuffer.ref.head + 1)%MAX_PARTICLES) != circularBuffer.ref.tail)
  {
    // Add new particle to the head position and advance head
    particle = circularBuffer.ref.buffer + circularBuffer.ref.head;
    circularBuffer.ref.head = (circularBuffer.ref.head + 1)%MAX_PARTICLES;
  }

  return particle;
}

void UpdateParticles(Pointer<CircularBuffer> circularBuffer, int screenWidth, int screenHeight)
{
  for (int i = circularBuffer.ref.tail; i != circularBuffer.ref.head; i = (i + 1)%MAX_PARTICLES)
  {
    // Update particle life and positions
    circularBuffer.ref.buffer[i].lifeTime += 1.0/60.0; // 60 FPS -> 1/60 seconds per frame

    switch (ParticleType.fromValue(circularBuffer.ref.buffer[i].type))
    {
      case .WATER:
      {
        circularBuffer.ref.buffer[i].position.x += circularBuffer.ref.buffer[i].velocity.x;
        circularBuffer.ref.buffer[i].velocity.y += 0.2;   // Gravity
        circularBuffer.ref.buffer[i].position.y += circularBuffer.ref.buffer[i].velocity.y;
      }
      case .SMOKE:
      {
        circularBuffer.ref.buffer[i].position.x += circularBuffer.ref.buffer[i].velocity.x;
        circularBuffer.ref.buffer[i].velocity.y -= 0.05;  // Upwards
        circularBuffer.ref.buffer[i].position.y += circularBuffer.ref.buffer[i].velocity.y;
        circularBuffer.ref.buffer[i].radius += 0.5;       // Increment radius: smoke expands
        circularBuffer.ref.buffer[i].color.a -= 4;         // Decrement alpha: smoke fades

        // If alpha transparent, particle dies
        if (circularBuffer.ref.buffer[i].color.a < 4) circularBuffer.ref.buffer[i].alive = false;
      }
      case .FIRE:
      {
        // Add a little horizontal oscillation to fire particles
        circularBuffer.ref.buffer[i].position.x += circularBuffer.ref.buffer[i].velocity.x + math.cos(circularBuffer.ref.buffer[i].lifeTime*215.0);
        circularBuffer.ref.buffer[i].velocity.y -= 0.05;  // Upwards
        circularBuffer.ref.buffer[i].position.y += circularBuffer.ref.buffer[i].velocity.y;
        circularBuffer.ref.buffer[i].radius -= 0.15;      // Decrement radius: fire shrinks
        circularBuffer.ref.buffer[i].color.g -= 3;         // Decrement green: fire turns reddish starting from yellow

        // If radius too small, particle dies
        if (circularBuffer.ref.buffer[i].radius <= 0.02) circularBuffer.ref.buffer[i].alive = false;
      }
    }

    // Disable particle when out of screen
    final center = circularBuffer.ref.buffer[i].position;
    final radius = circularBuffer.ref.buffer[i].radius;

    if (
      (center.x < -radius) || (center.x > (screenWidth + radius)) ||
      (center.y < -radius) || (center.y > (screenHeight + radius))
    ) {
      circularBuffer.ref.buffer[i].alive = false;
    }
  }
}

void UpdateCircularBuffer(Pointer<CircularBuffer> circularBuffer)
{
  // Update circular buffer: advance tail over dead particles
  while ((circularBuffer.ref.tail != circularBuffer.ref.head) && !circularBuffer.ref.buffer[circularBuffer.ref.tail].alive)
  {
    circularBuffer.ref.tail = (circularBuffer.ref.tail + 1)%MAX_PARTICLES;
  }
}

void DrawParticles(Pointer<CircularBuffer> circularBuffer)
{
  for (int i = circularBuffer.ref.tail; i != circularBuffer.ref.head; i = (i + 1)%MAX_PARTICLES)
  {
    if (circularBuffer.ref.buffer[i].alive)
    {
      DrawCircleV(
        circularBuffer.ref.buffer[i].position,
        circularBuffer.ref.buffer[i].radius,
        circularBuffer.ref.buffer[i].color
      );
    }
  }
}
