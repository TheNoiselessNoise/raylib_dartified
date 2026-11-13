// Run it: dart run mc.dart
// Texture from https://github.com/Minesweeper-World/MS-Texture
import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:raylib_dartified_unhinged/backends/raylib/backend.dart';
import 'package:raylib_dartified_unhinged/backends/raylib/abbr.dart';

// WARNING: this example grew piecemeal alongside the framework itself rather
// than being written against a finished API, so don't read it as "the"
// idiomatic way to use UNHINGED.

typedef G = Minesweeper;

class CellRevealedEvent extends Event<G> {
  final Cell cell;
  CellRevealedEvent(super.app, this.cell);
}

class CellFlaggedEvent extends Event<G> {
  final Cell cell;
  CellFlaggedEvent(super.app, this.cell);
}

class GameOverEvent extends Event<G> {
  final bool won;
  GameOverEvent(super.app, this.won);
}

enum CellTile {
  num1(0, 0),
  num2(1, 0),
  num3(2, 0),
  num4(3, 0),

  num5(0, 1),
  num6(1, 1),
  num7(2, 1),
  num8(3, 1),

  num0(0, 2),
  cell(1, 2),
  flagged(2, 2),
  wrongBomb(3, 2),

  questionMark(0, 3),
  questionMarkCell(1, 3),
  revealedBomb(2, 3),
  explodedBomb(3, 3),
  ;

  final int col, row;
  const CellTile(this.col, this.row);
}

enum MinesweeperDifficulty {
  Beginner((9, 9), 10),
  Intermediate((16, 16), 40),
  Expert((30, 16), 99);

  const MinesweeperDifficulty(this.gridSize, this.bombCount);
  final (int, int) gridSize;
  final int bombCount;
}

class CellGrid2D extends Grid2D<G, Cell> {
  CellGrid2D(super.app, {
    super.width,
    super.height,
  });

  @override
  Cell createEntity(int x, int y) {
    final cellSize = msState.cellSize;
    final offset = msState.gridOffset;
    return .new(app, x, y, .rect(
      offset.x + cellSize.x * x,
      offset.y + cellSize.y * y,
      cellSize.x,
      cellSize.y,
    ));
  }

  void revealAllBombs() {
    iterate((x, y, cell) {
      if (cell.isBomb && cell.hidden) cell.hidden = false;
    });
  }

  void reveal(int x, int y, {
    bool usingFlags = false,
    bool withNeighbors = false,
    int depth = 0,
  }) {
    final cell = at(x, y);
    
    // revealing neighbors based on neighbor flags
    if (!cell.hidden && usingFlags) {
      int neighborFlags = 0;
      iterateNeighborsAt(x, y, (nx, ny, n) {
        if (n.flagged) neighborFlags++;
      });

      // only if the number of neighbor flags equals my value
      if (neighborFlags == cell.value) {
        // reveal the direct non-flagged neighbors
        iterateNeighborsAt(x, y, (nx, ny, n) {
          if (!n.flagged) reveal(nx, ny,
            usingFlags: false,
            withNeighbors: true,
            depth: 0
          );
        });
      }

      return;
    }
    
    // revealing current + (empty) neighbors
    final wasHidden = cell.hidden;
    cell.hidden = false;
    if (wasHidden && cell.isBomb && depth == 0) cell.exploded = true;
    if (wasHidden) emit(CellRevealedEvent(app, cell), scope: .scene);
    if (!wasHidden && depth > 0) return;
    if (cell.isBomb || !withNeighbors) return;
    if (cell.value > 0) return;
    iterateNeighborsAt(x, y, (nx, ny, n) => reveal(nx, ny,
      usingFlags: false,
      withNeighbors: true,
      depth: depth + 1
    ));
  }
}

class Cell extends Entity<G> {
  final int x;
  final int y;
  final Rectangle rect;
  int value = 0; // 0-8 = cell, -1 bomb

  bool get isBomb => value == -1;

  // state
  bool hidden = true;
  bool flagged = false;
  bool hovered = false;
  bool exploded = false; // true only for the specific mine that was clicked

  Cell(super.app, this.x, this.y, this.rect);

  Color get valueColor => switch(value) {
    1 => .BLUE,
    2 => .GREEN,
    3 => .RED,
    4 => .DARKBLUE,
    5 => .DARKRED,
    6 => .CYAN,
    7 => .BLACK,
    8 => .GRAY,
    _ => .BLACK,
  };

  @override
  void onPostUpdate(double dz) {
    if (msState.gameOver) return;

    hovered = CheckCollisionPointRec(backend.mouse.position, rect);

    if (hovered) {
      if (hidden && backend.mouse.btnRight.pressed) {
        flagged = !flagged;
        emit(CellFlaggedEvent(app, this), scope: .scene);
      } else if (!flagged && backend.mouse.btnLeft.pressed) {
        grid.reveal(x, y);
      } else if (!flagged && backend.mouse.btnMiddle.pressed) {
        if (hidden) {
          grid.reveal(x, y, withNeighbors: true);
        } else {
          grid.reveal(x, y, usingFlags: true);
        }
      }
    }
  }

  @override
  void onDraw(double dt) {
    final CellTile tile = switch ((hidden, flagged, isBomb, exploded, value)) {
      (true, true, _, _, _)    => .flagged,
      (true, _, _, _, _)       => .cell,
      (_, _, true, true, _)    => .explodedBomb,
      (_, _, true, false, _)   => .revealedBomb,
      (false, _, _, _, 0)      => .num0,
      (false, _, _, _, 1)      => .num1,
      (false, _, _, _, 2)      => .num2,
      (false, _, _, _, 3)      => .num3,
      (false, _, _, _, 4)      => .num4,
      (false, _, _, _, 5)      => .num5,
      (false, _, _, _, 6)      => .num6,
      (false, _, _, _, 7)      => .num7,
      (false, _, _, _, 8)      => .num8,
      _                        => .cell,
    };

    final atlasSize = backend.assets.atlasTileSize;
    final Rectangle src = .rect(
      tile.col * atlasSize.y,
      tile.row * atlasSize.x,
      atlasSize.x,
      atlasSize.y
    );
    DrawTexturePro(backend.assets.atlas, src, rect, .vec2(0, 0), 0, .WHITE);
  }
}

extension on HasAppAccess<G> {
  MainMenuScene get mainMenuScene => app.getScene()!;
  // ignore: unused_element
  void goToMainMenu() => app.callback(() => app.setScene(mainMenuScene));

  SettingsScene get settingsScene => app.getScene()!;
  void goToSettings() => app.callback(() => app.setScene(settingsScene));

  MinesweeperScene get msScene => app.getScene()!;
  void goToMS() => app.callback(() => app.setScene(msScene));

  MinesweeperStateSystem get msState => msScene.getSystem()!;
  CellGrid2D get grid => msState.grid!;
}

class MinesweeperStateSystem extends SceneSystem<G> {
  int flaggedBombs = 0;
  int revealedSafeCells = 0;
  
  bool started = false;
  bool gameOver = false;
  bool won = false;
  DateTime startTime = .now();
  DateTime endTime = .now();

  MinesweeperDifficulty difficulty = .Beginner;
  
  late Vector2 gridSize = .vec2(
    difficulty.gridSize.$1,
    difficulty.gridSize.$2,
  );

  final int fixedCellSize = 32;
  final int headerHeight = 70;
  final int headerPadding = 12;
  final int gridMargin = 16;

  Vector2 get cellSize {
    final availableWidth = sceneWidth - gridMargin * 2;
    final availableHeight = sceneHeight - headerHeight - gridMargin * 2;

    final maxByWidth = availableWidth ~/ gridSize.x;
    final maxByHeight = availableHeight ~/ gridSize.y;

    final size = [fixedCellSize, maxByWidth, maxByHeight].reduce((a, b) => a < b ? a : b);
    return .vec2(size, size);
  }

  Vector2 get gridPixelSize => .vec2(
    gridSize.x * cellSize.x,
    gridSize.y * cellSize.y,
  );

  Vector2 get gridOffset {
    final availableHeight = sceneHeight - headerHeight;
    return .vec2(
      ((sceneWidth - gridPixelSize.x) / 2).round(),
      headerHeight + ((availableHeight - gridPixelSize.y) / 2).round(),
    );
  }

  late int bombCount = difficulty.bombCount;
  late int fontSize = cellSize.x ~/ 3;

  CellGrid2D? grid;

  MinesweeperStateSystem(super.app);

  final int MAX_SECONDS = 99999;
  final int MAX_MILLIS = 999;

  int get seconds {
    if (!started) return 0;
    final now = gameOver ? endTime : DateTime.now();
    final secs = now.difference(startTime).inSeconds;
    return secs >= MAX_SECONDS ? MAX_SECONDS : secs;
  }

  String get secondsString => seconds.toString().padLeft(MAX_SECONDS.toString().length, '0');

  int get millis {
    if (!started) return 0;
    final now = gameOver ? endTime : DateTime.now();
    final millis = now.difference(startTime).inMilliseconds;
    return millis > MAX_MILLIS ? millis % MAX_MILLIS : millis;
  }

  String get millisString => millis.toString().padLeft(MAX_MILLIS.toString().length, '0');

  // Remaining unflagged bombs, classic-Minesweeper style. Can go negative
  // if the player over-flags, which is intentional (matches the original).
  int get remainingFlags => bombCount - flaggedBombs;

  String get remainingFlagsString {
    final neg = remainingFlags < 0;
    final n = remainingFlags.abs().toString().padLeft(neg ? 2 : 3, '0');
    return neg ? '-$n' : n;
  }

  bool get _won {
    final safeCells = gridSize.x * gridSize.y - bombCount;
    return revealedSafeCells >= safeCells && flaggedBombs >= bombCount;
  }

  @override
  void onEvent(Event<G> event) {
    if (gameOver) return;

    if (!started && (event is CellFlaggedEvent || event is CellRevealedEvent)) {
      started = true;
      startTime = .now();
    }

    if (event is CellFlaggedEvent && event.cell.isBomb) {
      flaggedBombs += event.cell.flagged ? 1 : -1;
    }

    if (event is CellRevealedEvent) {
      if (event.cell.isBomb) {
        gameOver = true;
        won = false;
        endTime = .now();
        emit(GameOverEvent(app, false), scope: .scene);
        return;
      }
      revealedSafeCells++;
    }

    if (_won) {
      gameOver = true;
      won = true;
      endTime = .now();
      emit(GameOverEvent(app, true), scope: .scene);
    }
  }
}

class MinesweeperScene extends DrawScene<G> {
  MinesweeperScene(super.app) {
    addSystem(MinesweeperStateSystem(app));
  }

  @override
  void onEvent(Event<G> event) {
    if (event is GameOverEvent && !event.won) {
      msState.grid?.revealAllBombs();
    }
  }

  void initLevel() {
    if (msState.grid != null) removeEntity(msState.grid!);

    // reset round state so a fresh grid starts from zero
    msState.started = false;
    msState.gameOver = false;
    msState.won = false;
    msState.startTime = .now();
    msState.endTime = .now();
    msState.flaggedBombs = 0;
    msState.revealedSafeCells = 0;

    msState.grid = CellGrid2D(app,
      width: msState.gridSize.x,
      height: msState.gridSize.y,
    )..initialize();

    // prepare bombs
    final positions = msState.grid!.positions();
    positions.shuffle(rl.random);
    for (final (x, y) in positions.take(msState.bombCount)) {
      msState.grid!.at(x, y).value = -1;
    }

    // count bombs
    msState.grid!.iterateNeighbors((x, y, cell, neighbors) {
      if (cell.isBomb) return;
      cell.value = neighbors.where((n) => n.entity.isBomb).length;
    });

    addEntity(msState.grid!);
  }

  void drawHeader() {
    final gridOffset = msState.gridOffset;
    final gridPixelSize = msState.gridPixelSize;

    const int padding = 3;
    const int digitWidth = 20;
    const int digitHeight = 50;
    const int dotSize = 5;

    // vertically center the digit row within the header band
    final int digitY = ((msState.headerHeight - digitHeight) / 2).round();

    // clock
    {
      final text = msState.secondsString;
      num x = gridOffset.x + msState.headerPadding;
      int y = digitY;

      draw.digital.text(
        x, y, digitWidth, digitHeight,
        text,
        null,
        .color(30, 0, 0, 255),
        .color(255, 0, 0, 255),
        digitPadding: padding,
      );

      x += text.length * digitWidth + (text.length * padding);
      final dotY = y + digitHeight - dotSize;

      DrawRectangle(
        x, dotY,
        dotSize, dotSize,
        .color(255, 0, 0, 255)
      );

      x += dotSize + padding;

      draw.digital.text(
        x, digitY, digitWidth, digitHeight,
        msState.millisString,
        null,
        .color(30, 0, 0, 255),
        .color(255, 0, 0, 255),
        digitPadding: padding,
      );
    }

    // remaining-flags
    {
      final text = msState.remainingFlagsString;
      final width = text.length * digitWidth + (text.length - 1) * padding;
      final x = gridOffset.x + gridPixelSize.x - msState.headerPadding - width;

      draw.digital.text(
        x, digitY, digitWidth, digitHeight,
        text,
        null,
        .color(30, 0, 0, 255),
        .color(255, 0, 0, 255),
        digitPadding: padding,
      );
    }
  }

  void drawGameOverOverlay() {
    if (!msState.gameOver) return;

    final gridOffset = msState.gridOffset;
    final gridPixelSize = msState.gridPixelSize;

    DrawRectangle(
      gridOffset.x, gridOffset.y,
      gridPixelSize.x, gridPixelSize.y,
      .color(0, 0, 0, 140),
    );

    final message = msState.won ? 'YOU WIN!' : 'BOOM!';
    final hint = 'press R to restart';

    final msgSize = MeasureText(message, 40);
    final hintSize = MeasureText(hint, 20);

    final centerX = gridOffset.x + gridPixelSize.x ~/ 2;
    final centerY = gridOffset.y + gridPixelSize.y ~/ 2;

    DrawText(
      message,
      centerX - msgSize ~/ 2, centerY - 30,
      40,
      msState.won ? .color(80, 220, 100, 255) : .color(220, 60, 60, 255),
    );

    DrawText(
      hint,
      centerX - hintSize ~/ 2, centerY + 20,
      20,
      .color(230, 230, 230, 255),
    );
  }

  @override
  void onPostUpdate(double dt) {
    if (msState.gameOver && IsKeyPressed(.KEY_R)) {
      initLevel();
    }
  }

  @override
  void onPostDraw(double dt) {
    drawHeader();
    drawGameOverOverlay();
  }
}

class MainMenuScene extends FWidgetScene<G> {
  MainMenuScene(super.app);

  @override
  void onStart() {
    addEntity(
      FCenter(app,
        vertical: true,
        child: FColumn(app,
          gap: 8,
          alignment: .center,
          children: [
            FButton(app,
              onClickFn: (_) => goToSettings(),
              child: FPadding.symmetric(app, 16, 32,
                child: FLabel(app, text: "Start"),
              ),
            ),
            FButton(app,
              onClickFn: (_) => callback(() => app.exitApp = true),
              child: FPadding.symmetric(app, 16, 32,
                child: FLabel(app, text: "Quit"),
              ),
            ),
          ],
        ),
      )
    );
  }
}

class ChooseDifficultyWidget extends FWidget<G> {
  ChooseDifficultyWidget(super.app);

  void _prepareLevel(MinesweeperDifficulty diff) {
    msState.bombCount = diff.bombCount;
    msState.gridSize = .vec2(diff.gridSize.$1, diff.gridSize.$2);
    msScene.initLevel();
    goToMS();
  }

  FWidget<G> buildDifficultyWidget(MinesweeperDifficulty diff) {
    return FRow(app,
      alignment: .center,
      gap: 32,
      children: [
        FSized(app,
          heightMode: .flexible,
          width: 150,
          child: FLabel(app,
            alignment: .center,
            text: '${diff.gridSize.$1}x${diff.gridSize.$2} | ${diff.bombCount}',
          ),
        ),
        FButton(app,
          onClickFn: (_) => _prepareLevel(diff),
          child: FPadding.symmetric(app, 16, 32,
            child: FLabel(app, text: diff.name),
          ),
        ),
      ],
    );
  }

  @override
  FWidget<G> build() => FCenter(app,
    child: FPadding.all(app, 32,
      child: FColumn(app,
        alignment: .start,
        gap: 8,
        children: [
          FExpanded(app,
            child: FLabel(app, text: 'Choose a difficulty'),
          ),

          for (final diff in MinesweeperDifficulty.values) ...[
            buildDifficultyWidget(diff),
          ],
        ],
      ),
    ),
  );
}

class SettingsScene extends FWidgetScene<G> {
  late final ChooseDifficultyWidget widget;
  
  SettingsScene(super.app) {
    addEntity(widget = .new(app));
  }

  @override
  void onEnter() => widget.rebuild();
}

extension on AssetManager {
  Vector2 get atlasTileSize => .vec2(16, 16);
  Texture get atlas => texture('xp.png').asset;
}

class Minesweeper extends App<G> {
  Minesweeper(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "Minesweeper");
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(MainMenuScene(app));
    addScene(SettingsScene(app));
    addScene(MinesweeperScene(app));
  }
}

class UnhingedBridge extends UnhingedRaylibApp<G> {
  @override
  G create(RaylibBackend backend) => G(backend);
}

void main() => runRaylib(
  UnhingedBridge(),
  nativeLibPath: 'raylib-6.0_linux_amd64/lib',
);