part of '../raylib_dartified_unhinged.dart';

enum RenderLayers {
  background(0),
  world(1),
  foreground(2),
  ui(3),
  debug(4);

  const RenderLayers(this.order);
  final int order;
}

class RenderLayer {
  final String name;
  final int order;

  RenderLayer(this.name, this.order);
}

class Renderer<T extends App<T>> extends AppService<T> {
  List<RenderLayer> layers = [];

  Renderer(super.app) {
    layers.addAll([
      RenderLayer(RenderLayers.background.name, RenderLayers.background.order),
      RenderLayer(RenderLayers.world.name, RenderLayers.world.order),
      RenderLayer(RenderLayers.foreground.name, RenderLayers.foreground.order),
      RenderLayer(RenderLayers.ui.name, RenderLayers.ui.order),
      RenderLayer(RenderLayers.debug.name, RenderLayers.debug.order),
    ]);

    layers = layers.sortedBy((l) => l.order);
  }

  void addLayer(RenderLayer layer) {
    layers.add(layer);
    layers = layers.sortedBy((l) => l.order);
  }

  String _activeLayer = RenderLayers.background.name;
  String get activeLayer => _activeLayer;
  void setLayer(String name) => _activeLayer = name;
}