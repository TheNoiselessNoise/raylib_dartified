// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/shapes/shapes_simple_particles.c
// Run it: dart run shapes_simple_particles.dart
import 'dart:math' as math;
import '../../base_dart.dart';

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

class Particle {
  ParticleType type = .FIRE;
  Vector2D position = .zero();
  Vector2D velocity = .zero();
  double radius = 0;
  ColorD color = .zero();
  double lifeTime = 0;
  bool alive = false;
}

class CircularBuffer {
  int head = 0;
  int tail = 0;
  List<Particle> buffer = [];
}

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  InitWindow(screenWidth, screenHeight, "shapes_simple_particles");
  SetTargetFPS(60);

  final List<Particle> particles = .generate(MAX_PARTICLES, (_) => .new());
  final CircularBuffer circularBuffer = .new();
  circularBuffer.buffer = particles;

  int emissionRate = -2;
  ParticleType currentType = .WATER;
  Vector2D emitterPosition = .vec2(screenWidth/2.0, screenHeight/2.0);

  int frameCount = 0;
  while (!WindowShouldClose())
  {
    frameCount++;

    if (emissionRate < 0)
    {
      if (frameCount%-emissionRate == 0) EmitParticle(circularBuffer, emitterPosition, currentType);
    }
    else
    {
      for (int i = 0; i <= emissionRate; i++) EmitParticle(circularBuffer, emitterPosition, currentType);
    }

    // Update the parameters of each particle
    UpdateParticles(circularBuffer, screenWidth, screenHeight);

    // Remove dead particles from the circular buffer
    UpdateCircularBuffer(circularBuffer);

    // Change Particle Emission Rate (UP/DOWN arrows)
    if (IsKeyPressed(.KEY_UP)) emissionRate++;
    if (IsKeyPressed(.KEY_DOWN)) emissionRate--;

    // Change Particle Type (LEFT/RIGHT arrows)
    if (IsKeyPressed(.KEY_RIGHT)) currentType = currentType.next;
    if (IsKeyPressed(.KEY_LEFT)) currentType = currentType.prev;

    if (IsMouseButtonDown(.MOUSE_BUTTON_LEFT)) emitterPosition = GetMousePosition();

    BeginDrawing();

      ClearBackground(.RAYWHITE);

      // Call the function with a loop to draw all particles
      DrawParticles(circularBuffer);

      // Draw UI and Instructions
      DrawRectangle(5, 5, 315, 75, Fade(.SKYBLUE, 0.5));
      DrawRectangleLines(5, 5, 315, 75, .BLUE);

      DrawText("CONTROLS:", 15, 15, 10, .BLACK);
      DrawText("UP/DOWN: Change Particle Emission Rate", 15, 35, 10, .BLACK);
      DrawText("LEFT/RIGHT: Change Particle Type (Water, Smoke, Fire)", 15, 55, 10, .BLACK);

      if (emissionRate < 0) DrawText("Particles every ${-emissionRate} frames | Type: ${currentType.name}", 15, 95, 10, .DARKGRAY);
      else DrawText("${emissionRate + 1} Particles per frame | Type: ${currentType.name}", 15, 95, 10, .DARKGRAY);

      DrawFPS(screenWidth - 80, 10);

    EndDrawing();
  }

  CloseWindowAndDispose();
}

void EmitParticle(CircularBuffer circularBuffer, Vector2D emitterPosition, ParticleType type)
{
  final newParticle = AddToCircularBuffer(circularBuffer);

  // If buffer is full, newParticle is NULL
  if (newParticle != null)
  {
    // Fill particle properties
    newParticle.position = emitterPosition.copy();
    newParticle.alive = true;
    newParticle.lifeTime = 0.0;
    newParticle.type = type;
    double speed = (rl.randC()%10)/5.0;
    switch (type)
    {
      case .WATER:
      {
        newParticle.radius = 5.0;
        newParticle.color = .BLUE.copy();
      }
      case .SMOKE:
      {
        newParticle.radius = 7.0;
        newParticle.color = .GRAY.copy();
      }
      case .FIRE:
      {
        newParticle.radius = 10.0;
        newParticle.color = .YELLOW.copy();
        speed /= 10.0;
      }
    }

    final direction = rl.randC()%360;
    newParticle.velocity.set(
      speed*math.cos(direction*rl.DEG2RAD),
      speed*math.sin(direction*rl.DEG2RAD)
    );
  }
}

Particle? AddToCircularBuffer(CircularBuffer circularBuffer)
{
  Particle? particle;

  // Check if buffer full
  if (((circularBuffer.head + 1)%MAX_PARTICLES) != circularBuffer.tail)
  {
    // Add new particle to the head position and advance head
    particle = circularBuffer.buffer[circularBuffer.head];
    circularBuffer.head = (circularBuffer.head + 1)%MAX_PARTICLES;
  }

  return particle;
}

void UpdateParticles(CircularBuffer circularBuffer, int screenWidth, int screenHeight)
{
  for (int i = circularBuffer.tail; i != circularBuffer.head; i = (i + 1)%MAX_PARTICLES)
  {
    // Update particle life and positions
    circularBuffer.buffer[i].lifeTime += 1.0/60.0; // 60 FPS -> 1/60 seconds per frame

    switch (circularBuffer.buffer[i].type)
    {
      case .WATER:
      {
        circularBuffer.buffer[i].position.x += circularBuffer.buffer[i].velocity.x;
        circularBuffer.buffer[i].velocity.y += 0.2;   // Gravity
        circularBuffer.buffer[i].position.y += circularBuffer.buffer[i].velocity.y;
      }
      case .SMOKE:
      {
        circularBuffer.buffer[i].position.x += circularBuffer.buffer[i].velocity.x;
        circularBuffer.buffer[i].velocity.y -= 0.05;  // Upwards
        circularBuffer.buffer[i].position.y += circularBuffer.buffer[i].velocity.y;
        circularBuffer.buffer[i].radius += 0.5;       // Increment radius: smoke expands
        circularBuffer.buffer[i].color.a -= 4;         // Decrement alpha: smoke fades

        // If alpha transparent, particle dies
        if (circularBuffer.buffer[i].color.a < 4) circularBuffer.buffer[i].alive = false;
      }
      case .FIRE:
      {
        // Add a little horizontal oscillation to fire particles
        circularBuffer.buffer[i].position.x += circularBuffer.buffer[i].velocity.x + math.cos(circularBuffer.buffer[i].lifeTime*215.0);
        circularBuffer.buffer[i].velocity.y -= 0.05;  // Upwards
        circularBuffer.buffer[i].position.y += circularBuffer.buffer[i].velocity.y;
        circularBuffer.buffer[i].radius -= 0.15;      // Decrement radius: fire shrinks
        circularBuffer.buffer[i].color.g -= 3;         // Decrement green: fire turns reddish starting from yellow

        // If radius too small, particle dies
        if (circularBuffer.buffer[i].radius <= 0.02) circularBuffer.buffer[i].alive = false;
      }
    }

    // Disable particle when out of screen
    final center = circularBuffer.buffer[i].position;
    final radius = circularBuffer.buffer[i].radius;

    if (
      (center.x < -radius) || (center.x > (screenWidth + radius)) ||
      (center.y < -radius) || (center.y > (screenHeight + radius))
    ) {
      circularBuffer.buffer[i].alive = false;
    }
  }
}

void UpdateCircularBuffer(CircularBuffer circularBuffer)
{
  // Update circular buffer: advance tail over dead particles
  while ((circularBuffer.tail != circularBuffer.head) && !circularBuffer.buffer[circularBuffer.tail].alive)
  {
    circularBuffer.tail = (circularBuffer.tail + 1)%MAX_PARTICLES;
  }
}

void DrawParticles(CircularBuffer circularBuffer)
{
  for (int i = circularBuffer.tail; i != circularBuffer.head; i = (i + 1)%MAX_PARTICLES)
  {
    if (circularBuffer.buffer[i].alive)
    {
      DrawCircleV(
        circularBuffer.buffer[i].position,
        circularBuffer.buffer[i].radius,
        circularBuffer.buffer[i].color
      );
    }
  }
}
