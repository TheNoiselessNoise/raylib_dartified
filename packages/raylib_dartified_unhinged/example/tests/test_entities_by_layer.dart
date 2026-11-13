// Run it: dart run test_render_layers.dart

import '_base.dart';
import 'dart:math' as math;

typedef G = TestRenderLayerApp;

final _random = math.Random();

class CustomRenderLayer extends RenderLayer {
  final Color color;

  CustomRenderLayer(super.name, super.order, this.color);
}

final _allLayers = <CustomRenderLayer>[
  .new('background', 0, .WHITE),
  .new('world', 1, .YELLOW),
  .new('foreground', 2, .ORANGE),
  .new('ui', 3, .RED),
  .new('debug', 4, .AQUA),
  .new('particles', 5, .BLUE),
  .new('effects', 5, .MAGENTA),
  .new('overlay', 5, .PURPLE),
];

class LayerTestEntity extends Entity<G> {
  final int testId;

  double get areaLeft => 350.0;
  double get areaTop => 120.0;
  double get areaRight => screenWidth - 20.0;
  double get areaBottom => screenHeight - 120.0;
  
  LayerTestEntity(super.app, this.testId, String layer) {
    add(CTransform(app,
      position: .vec2(
        areaLeft + _random.nextDouble() * (areaRight - areaLeft),
        areaTop + _random.nextDouble() * (areaBottom - areaTop),
      ),
    ));

    add(CRenderLayer(app, layer: layer));
    add(CLayerTestVisual(app));
  }
}

class CLayerTestVisual extends Comp<G> {
  CLayerTestVisual(super.app);

  double _time = 0;

  @override
  void onPostUpdate(double dt) {
    _time += dt;
  }

  @override
  void onDraw(double dt) {
    final layer = entity.renderLayer.layer;
    final renderLayer = _allLayers.firstWhere((e) => e.name == layer);
    final pos = entity.worldPosition;
    final y = pos.y + math.sin(_time * 2 + entity.hashCode) * 5;
    DrawCircle(pos.x, y, 8, renderLayer.color);
  }
}

class TestRenderLayerScene extends DrawScene<G> {
  TestRenderLayerScene(super.app);

  int _nextId = 0;

  bool automaticChanges = true;
  bool validateEveryFrame = true;

  String? _validationError;

  int? selectedLayer;

  @override
  void onStart() {
    _spawn(500);

    task(IntervalTask(app,
      interval: 0.25,
      actionUpdate: (_, _) {
        if (!automaticChanges) return;

        _randomLayerChanges(25);
        _randomRemovals(5);
        _randomAdditions(5);
      },
    ));
  }

  void _spawn(int count) {
    for (int i = 0; i < count; i++) {
      callback(() => addEntity(LayerTestEntity(app, _nextId++, _randomLayer())));
    }
  }

  void _randomAdditions(int count) {
    for (int i = 0; i < count; i++) {
      callback(() => addEntity(LayerTestEntity(app, _nextId++, _randomLayer())));
    }
  }

  void _randomRemovals(int count) {
    final entities = [...getEntities()];

    entities.shuffle(_random);

    for (final entity in entities.take(count)) {
      entity.removeThis();
    }
  }

  void _randomLayerChanges(int count) {
    final entities = getEntities();

    for (int i = 0; i < count && entities.isNotEmpty; i++) {
      final entity = entities.elementAt(_random.nextInt(entities.length));

      final renderLayer = entity.get<CRenderLayer<G>>();

      if (renderLayer == null) {
        _validationError = '${entity.namedId} has no CRenderLayer';
        return;
      }

      renderLayer.layer = _randomLayer();
    }
  }

  String _randomLayer()
    => _allLayers[_random.nextInt(_allLayers.length)].name;

  void _validateIndex() {
    final sceneEntities = getEntities();

    final indexedEntities = <Entity<G>>{};

    int indexedCount = 0;

    for (final layer in _allLayers) {
      final bucket = getEntitiesInLayer(layer.name);

      indexedCount += bucket.length;

      for (final entity in bucket) {
        // Indexed entity must exist in the scene.
        if (!sceneEntities.contains(entity)) {
          _validationError =
            '${entity.namedId} is indexed but not in scene';
          return;
        }

        // Entity must have a render layer.
        final renderLayer = entity.get<CRenderLayer<G>>();

        if (renderLayer == null) {
          _validationError =
            '${entity.namedId} is in "$layer" '
            'but has no CRenderLayer';
          return;
        }

        // Entity must actually belong to this bucket.
        if (renderLayer.layer != layer.name) {
          _validationError =
            '${entity.namedId} is in "$layer" '
            'but says "${renderLayer.layer}"';
          return;
        }

        // Entity must not exist in another bucket too.
        if (!indexedEntities.add(entity)) {
          _validationError =
            '${entity.namedId} appears in multiple layer buckets';
          return;
        }
      }
    }

    // Every scene entity must have a CRenderLayer.
    for (final entity in sceneEntities) {
      final renderLayer = entity.get<CRenderLayer<G>>();

      if (renderLayer == null) {
        _validationError =
          '${entity.namedId} has no CRenderLayer';
        return;
      }

      // Every scene entity must exist in its expected bucket.
      final bucket = getEntitiesInLayer(renderLayer.layer);

      if (!bucket.contains(entity)) {
        _validationError =
          '${entity.namedId} is missing from '
          '"${renderLayer.layer}" bucket';
        return;
      }
    }

    // There must be exactly one bucket entry per scene entity.
    if (indexedCount != sceneEntities.length) {
      _validationError =
        'Indexed count $indexedCount != '
        'scene count ${sceneEntities.length}';
      return;
    }

    _validationError = null;
  }

  @override
  void onPostUpdate(double dt) {
    renderLayerOverride = selectedLayer != null
      ? _allLayers[selectedLayer!].name
      : null;

    if (validateEveryFrame) {
      _validateIndex();
    }
  }

  @override
  void onDrawForeground() {
    DrawRectangle(0, 0, screenWidth, screenHeight, .color(20, 20, 25, 255));

    _drawStatistics();
    _drawControls();

    if (_validationError != null) {
      _drawValidationError();
    }

    DrawFPS(screenWidth - 100, 50);
  }

  void _drawStatistics() {
    int y = 20;
    DrawText('ENTITY LAYER INDEX TEST', 20, y, 24, .WHITE);

    y += 40;
    DrawText('Entities: ${getEntities().length}', 20, y, 18, .WHITE);

    y += 25;
    DrawText('Automatic changes: $automaticChanges', 20, y, 18, .WHITE);

    y += 35;
    for (final (i, layer) in _allLayers.indexed) {
      final count = getEntitiesInLayer(layer.name).length;
      final selectedText = i == selectedLayer ? '[SELECTED] ' : '';
      DrawText('$selectedText${layer.name}: $count', 20, y, 18, .WHITE);
      y += 23;
    }
  }

  void _drawControls() {
    final y = screenHeight - 125;
    DrawText('[SPACE] automatic changes', 20, y, 18, .WHITE);
    DrawText('[A] +100    [R] -100    [M] move 1000', 20, y + 25, 18, .WHITE);
    DrawText('[V] validate ($validateEveryFrame)', 20, y + 50, 18, .WHITE);
    DrawText('[BACKSPACE] unset selected layer [LEFT]/[RIGHT] cycle layers', 20, y + 75, 18, .WHITE);
  }

  void _drawValidationError() {
    DrawText('INDEX ERROR', screenWidth - 250, 20, 24, .RED);
    DrawText(_validationError!, screenWidth - 400, 55, 16, .RED);
  }

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_SPACE)) {
      automaticChanges = !automaticChanges;
    }

    if (IsKeyPressed(.KEY_A)) {
      _randomAdditions(100);
      _validateIndex();
    }

    if (IsKeyPressed(.KEY_R)) {
      _randomRemovals(100);
      _validateIndex();
    }

    if (IsKeyPressed(.KEY_M)) {
      _randomLayerChanges(1000);
      _validateIndex();
    }

    if (IsKeyPressed(.KEY_V)) {
      validateEveryFrame = !validateEveryFrame;
    }

    if (IsKeyPressed(.KEY_BACKSPACE)) {
      selectedLayer = null;
    }

    if (IsKeyPressed(.KEY_LEFT)) {
      selectedLayer = ((selectedLayer ?? 0) - 1) % _allLayers.length;
    }

    if (IsKeyPressed(.KEY_RIGHT)) {
      selectedLayer = ((selectedLayer ?? -1) + 1) % _allLayers.length;
    }
  }
}

class TestRenderLayerApp extends ExampleRaylibApp<G> {
  TestRenderLayerApp(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, 'test_render_layer');
    SetTargetFPS(60);
    addScene(TestRenderLayerScene(app));

    renderer.layers.clear();
    for (final layer in _allLayers) {
      renderer.addLayer(layer);
    }
  }
}

void main() => runExample((backend) => G(backend));