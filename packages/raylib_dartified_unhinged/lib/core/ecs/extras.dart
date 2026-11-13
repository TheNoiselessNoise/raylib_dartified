part of '../raylib_dartified_unhinged.dart';

class Grid2DPosition<T extends App<T>, E extends Entity<T>> {
  final int x;
  final int y;
  final E entity;

  const Grid2DPosition(this.x, this.y, this.entity);
}

typedef AnyGrid2D<T extends App<T>> = Grid2D<T, Entity<T>>;

abstract class Grid2D<T extends App<T>, E extends Entity<T>> extends EntityGroup<T, E> {
  int width;
  int height;
  late List<List<Grid2DPosition<T, E>>> _grid;

  Grid2D(super.app, {
    num width = 8,
    num height = 8,
  }) :
    width = width.toInt(),
    height = height.toInt();

  E createEntity(int x, int y);

  E _createEntity(int x, int y) {
    final entity = createEntity(x, y);
    addEntity(entity);
    return entity;
  }

  List<(int, int)> positions() => [
    for (int y = 0; y < _grid.length; y++)
      for (int x = 0; x < _grid[y].length; x++)
        (x, y)
  ];

  bool isValidPosition(int x, int y) {
    return y >= 0 && y < _grid.length && x >= 0 && x < _grid[y].length;
  }

  E at(int x, int y) {
    if (y < 0 || y >= _grid.length) throw StateError('Invalid Y position into the grid: $y');
    if (x < 0 || x >= _grid[y].length) throw StateError('Invalid X position into the grid[$y]: $x');
    return _grid[y][x].entity;
  }

  void iterate(void Function(int x, int y, E entity) callback) {
    for (int y = 0; y < _grid.length; y++) {
      for (int x = 0; x < _grid[y].length; x++) {
        callback(x, y, _grid[y][x].entity);
      }
    }
  }

  void iterateNeighbors(
    void Function(int x, int y, E entity, List<Grid2DPosition<T, E>> neighbors) callback, {
    int minOffsetX = -1,
    int maxOffsetX = 1,
    int minOffsetY = -1,
    int maxOffsetY = 1,
  }) => iterate((x, y, e) {
    List<Grid2DPosition<T, E>> neighbors = [];
    iterateNeighborsAt(x, y, (nx, ny, n) => neighbors.add(.new(nx, ny, n)),
      minOffsetX: minOffsetX,
      maxOffsetX: maxOffsetX,
      minOffsetY: minOffsetY,
      maxOffsetY: maxOffsetY,
    );
    callback(x, y, e, neighbors);
  });

  void iterateNeighborsAt(int x, int y, void Function(int x, int y, E entity) callback, {
    int minOffsetX = -1,
    int maxOffsetX = 1,
    int minOffsetY = -1,
    int maxOffsetY = 1,
  }) {
    for (int oy = minOffsetY; oy <= maxOffsetY; oy++) {
      for (int ox = minOffsetX; ox <= maxOffsetX; ox++) {
        if (ox == 0 && oy == 0) continue;
        final nx = x + ox;
        final ny = y + oy;
        if (!isValidPosition(nx, ny)) continue;
        callback(nx, ny, at(nx, ny));
      }
    }
  }

  void initialize() => _grid = .generate(height,
    (y) => .generate(width,
      (x) => .new(x, y, _createEntity(x, y))
    )
  );
}