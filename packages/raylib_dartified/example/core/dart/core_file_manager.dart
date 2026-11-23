// Custom example, there's no original equivalent
import '../../_example/dart.dart';
import 'package:path/path.dart' as path;

const int screenWidth = 900;
const int screenHeight = 600;

const int PANEL_WIDTH = 280;
const int TOOLBAR_HEIGHT = 40;
const int BREADCRUMB_HEIGHT = 30;
const int ITEM_HEIGHT = 24;
const int SEARCH_HEIGHT = 30;
const int SORT_BAR_HEIGHT = 24;

enum FileType {
  audio('AUD', ['.ogg', '.mp3']),
  image('IMG', ['.png', '.jpg', '.gif']),
  binary('BIN', ['.exe', '.bin', '.so']),
  text('TXT', ['.txt', '.md' , '.yaml']),
  shader('SHD', ['.fs', '.vs']),
  unknown('UNK'),
  ;

  const FileType(this.shortName, [this.extensions = const []]);
  final String shortName;
  final List<String> extensions;

  static FileType fromExtension(String ext)
    => values.where((e) => e.extensions.contains(ext)).firstOrNull ?? .unknown;
}

final class DoubleClickDetector {
  final Map<MouseButton, double> _lastClickTimes = {};
  final Map<MouseButton, int> _lastClickIndex = {};

  bool checkIndexed(MouseButton button, int index, [double? interval]) {
    if (IsMouseButtonPressed(button)) {
      final now = GetTime();
      final lastTime  = _lastClickTimes.putIfAbsent(button, () => -1);
      final lastIndex = _lastClickIndex.putIfAbsent(button, () => -1);
      _lastClickTimes[button] = now;
      _lastClickIndex[button] = index;
      return (now - lastTime) < (interval ?? 0.5) && lastIndex == index;
    }

    return false;
  }

  bool check(MouseButton button, [double? interval])
    => checkIndexed(button, 0, interval);
}

final class TextBoxFocus {
  BetterTextBox? current;
  bool _claimedThisFrame = false;

  void claim(BetterTextBox box) {
    current = box;
    _claimedThisFrame = true;
  }

  void frameEnd(bool mousePressed) {
    if (mousePressed && !_claimedThisFrame) current = null;
    _claimedThisFrame = false;
  }

  bool has(BetterTextBox box) => current == box;

  bool get isFocused => current != null;
}

final class BetterTextBox {
  final TextBoxFocus focus;
  Rectangle rect;
  String oldText;
  String text;

  BetterTextBox(this.focus, {
    Rectangle? rect,
    this.text = '',
  }) : oldText = text, rect = rect ?? .zero();

  bool get editMode => focus.has(this);
  bool get isNew => oldText != text;

  void _update() {
    final mouse = GetMousePosition();
    if (
      CheckCollisionPointRec(mouse, rect) &&
      IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)
    ) focus.claim(this);
  }

  void draw([Rectangle? newRect]) {
    _update();
    if (newRect != null) rect = newRect;
    final (_, newText) = GuiTextBox(rect, text, 255, editMode);
    oldText = text;
    text = newText;
  }
}

final class Colors {
  static Color RAYWHITE  = .color(245, 245, 245, 255);
  static Color PANEL_BG  = .color(230, 230, 235, 255);
  static Color INFO_BG   = .color(220, 220, 228, 255);
  static Color SELECTED  = .color(100, 149, 237, 180);
  static Color HOVERED   = .color(200, 215, 240, 180);
  static Color DIR_COLOR = .color( 60, 120, 200, 255);
  static Color AUD_COLOR = .color(130,  40, 220, 255);
  static Color IMG_COLOR = .color(220, 130,  40, 255);
  static Color BIN_COLOR = .color(180,  60,  60, 255);
  static Color TXT_COLOR = .color( 80,  80,  80, 255);
  static Color SHD_COLOR = .color(150, 120, 220, 255);
  static Color DEF_COLOR = .color(120, 120, 120, 255);
  static Color CRUMB_ACT = .color( 40,  90, 180, 255);
  static Color CRUMB_SEP = .color(150, 150, 150, 255);
  static Color SORT_HDR  = .color(210, 210, 218, 255);
  static Color SORT_ACT  = .color(100, 149, 237, 255);
}

enum SortField { name, size, date }
enum SortDir   { asc, desc }

final class FileEntry {
  final String fullPath;
  final String name;
  final bool   isDir;
  final int    size;       // bytes
  final DateTime modified;

  FileEntry({
    required this.fullPath,
    required this.name,
    required this.isDir,
    required this.size,
    required this.modified,
  });

  String get ext => isDir ? '' : path.extension(name).toLowerCase();

  late final FileType type = .fromExtension(ext);

  String get modifiedString =>
    '${modified.year}-'
    '${modified.month.toString().padLeft(2,"0")}-'
    '${modified.day.toString().padLeft(2,"0")}';

  Color get color {
    if (isDir) return Colors.DIR_COLOR;
    return switch (type) {
      .audio => Colors.AUD_COLOR,
      .image => Colors.IMG_COLOR,
      .binary => Colors.BIN_COLOR,
      .text => Colors.TXT_COLOR,
      .shader => Colors.SHD_COLOR,
      .unknown => Colors.DEF_COLOR,
    };
  }

  String get icon => isDir ? '[DIR]' : '[${type.shortName}]';

  String get sizeLabel {
    if (isDir) return '--';
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

List<FileEntry> loadDirectory(String dirPath) {
  try {
    final files = LoadDirectoryFiles(dirPath);
    final fileEntries = files.paths
      .map((e) {
        final filePath = path.normalize(e);
        return FileEntry(
          fullPath: filePath,
          name:     path.basename(filePath),
          isDir:    DirectoryExists(filePath),
          size:     GetFileLength(filePath),
          modified: .fromMillisecondsSinceEpoch(GetFileModTime(filePath)),
        );
      })
      .toList();
    UnloadDirectoryFiles(files);
    return fileEntries;
  } catch (_) {
    return [];
  }
}

List<FileEntry> sortEntries(
  List<FileEntry> entries,
  SortField field,
  SortDir dir,
) {
  final dirs  = entries.where((e) => e.isDir).toList();
  final files = entries.where((e) => !e.isDir).toList();

  int cmp(FileEntry a, FileEntry b) => switch (field) {
    .name => a.name.compareTo(b.name),
    .size => a.size.compareTo(b.size),
    .date => a.modified.compareTo(b.modified),
  };

  dirs.sort((a, b)  => dir == .asc ? cmp(a, b) : cmp(b, a));
  files.sort((a, b) => dir == .asc ? cmp(a, b) : cmp(b, a));
  return [...dirs, ...files]; // dirs always first
}

List<String> breadcrumbs(String filePath) {
  final parts = path.split(path.normalize(filePath));
  final result = <String>[];
  for (int i = 0; i < parts.length; i++) {
    result.add(path.joinAll(parts.sublist(0, i + 1)));
  }
  return result;
}

int selectedIdx = -1;
int scrollOffset = 0;
SortField sortField = .name;
SortDir sortDir = .asc;

List<FileEntry> allEntries = [];
List<FileEntry> visibleEntries = [];

late DoubleClickDetector dblclick;
late TextBoxFocus focus;
late BetterTextBox pathBox;
late BetterTextBox searchBox;

// Layout constants
int listTop = TOOLBAR_HEIGHT + BREADCRUMB_HEIGHT + SEARCH_HEIGHT + SORT_BAR_HEIGHT;
int listLeft = 0;
int listW = screenWidth - PANEL_WIDTH;
int listH = screenHeight - listTop;

final Map<String, Music> cachedSounds = {};
final Map<String, Image> cachedImages = {};
final Map<String, Texture> cachedTextures = {};

Music? _currentPlayingMusic;
String? _currentPlayingMusicPath;
bool _currentMusicPause = false;

void UpdateMusicPlayer() {
  final m = _currentPlayingMusic;
  if (m != null) UpdateMusicStream(m);
}

String _formatMusicDuration(double seconds) {
  final s = seconds.floor();
  return '${s ~/ 60}:${(s % 60).toString().padLeft(2, '0')}';
}

void navigate(String path) {
  pathBox.text = path;
  selectedIdx = 0;
  scrollOffset = 0;
  allEntries = loadDirectory(path);
}

void rebuildVisible() {
  var filtered = allEntries.where((e) {
    return searchBox.text.isEmpty ||
      e.name.toLowerCase().contains(searchBox.text.toLowerCase());
  }).toList();
  visibleEntries = sortEntries(filtered, sortField, sortDir);
}

Image getImageFromFile(String path, int width, int height) {
  if (cachedImages.containsKey(path)) return cachedImages[path]!;
  final image = LoadImage(path);
  ImageResize(image, width, height);
  return cachedImages[path] = image;
}

Texture getTextureFromFile(String path, int width, int height) {
  if (cachedTextures.containsKey(path)) return cachedTextures[path]!;
  final image = getImageFromFile(path, width, height);
  final texture = LoadTextureFromImage(image);
  return cachedTextures[path] = texture;
}

Music getMusicFromFile(String path) {
  if (cachedSounds.containsKey(path)) return cachedSounds[path]!;
  final music = LoadMusicStream(path);
  return cachedSounds[path] = music;
}

void main() => runExample(
  init: (_) {
    InitWindow(screenWidth, screenHeight, "File Browser");
    InitAudioDevice();
    SetAudioStreamBufferSizeDefault(4096);
    SetTargetFPS(60);

    dblclick = DoubleClickDetector();
    focus = TextBoxFocus();
    pathBox = BetterTextBox(focus, text: GetApplicationDirectory());
    searchBox = BetterTextBox(focus);

    navigate(pathBox.text);
    rebuildVisible();
  },
  loop: (_) async {
    UpdateMusicPlayer();

    // Keyboard navigation
    if (!focus.isFocused) {
      if (IsKeyPressed(.KEY_UP)) {
        selectedIdx = (selectedIdx - 1).clamp(0, visibleEntries.length - 1);
        // scroll into view
        if (selectedIdx >= 0 && selectedIdx < scrollOffset)
          scrollOffset = selectedIdx;
      }

      if (IsKeyPressed(.KEY_DOWN)) {
        selectedIdx = (selectedIdx + 1).clamp(0, visibleEntries.length - 1);
        int maxVisible = listH ~/ ITEM_HEIGHT;
        if (selectedIdx >= scrollOffset + maxVisible)
          scrollOffset = selectedIdx - maxVisible + 1;
      }

      if (IsKeyPressed(.KEY_ENTER) && selectedIdx >= 0) {
        final entry = visibleEntries[selectedIdx];
        if (entry.isDir) { navigate(entry.fullPath); rebuildVisible(); }
      }

      if (IsKeyPressed(.KEY_BACKSPACE) && searchBox.text.isEmpty) {
        final parent = path.dirname(pathBox.text);
        if (parent != pathBox.text) { navigate(parent); rebuildVisible(); }
      }
    }

    // Mouse wheel scroll
    final wheel = GetMouseWheelMove();
    if (wheel != 0) {
      scrollOffset = (scrollOffset - wheel.toInt()).clamp(0, (visibleEntries.length - listH ~/ ITEM_HEIGHT).clamp(0, 999999));
    }

    BeginDrawing();
    ClearBackground(.RAYWHITE);

    int y = 0;

    // Toolbar (path text box + up button)
    {
      DrawRectangle(0, y, screenWidth, TOOLBAR_HEIGHT, Colors.PANEL_BG);

      final upPressed = GuiButton(.rect(4, y + 5, 60, TOOLBAR_HEIGHT - 10), 'Up') != .RESULT_NONE;
      if (upPressed) {
        final parent = path.dirname(pathBox.text);
        if (parent != pathBox.text) { navigate(parent); rebuildVisible(); }
      }

      pathBox.draw(.rect(68, y + 5, screenWidth - PANEL_WIDTH - 72, TOOLBAR_HEIGHT - 10));

      if (pathBox.isNew) {
        if (DirectoryExists(pathBox.text)) {
          navigate(pathBox.text);
          rebuildVisible();
        }
      }
    }
    y += TOOLBAR_HEIGHT;

    // Breadcrumb bar
    {
      DrawRectangle(0, y, screenWidth - PANEL_WIDTH, BREADCRUMB_HEIGHT, Colors.PANEL_BG);
      int bx = 6;
      final crumbs = breadcrumbs(pathBox.text);
      for (int i = 0; i < crumbs.length; i++) {
        final label = i == 0 ? '/' : path.basename(crumbs[i]);

        final tw = GuiGetTextWidth(label) + 12;
        final pressed = GuiButton(.rect(bx, y + 4, tw, BREADCRUMB_HEIGHT - 8), label) != .RESULT_NONE;
        if (pressed) { navigate(crumbs[i]); rebuildVisible(); }

        bx += tw + 2;
        if (i < crumbs.length - 1) bx += 3;
        if (bx > screenWidth - PANEL_WIDTH - 20) break;
      }
    }
    y += BREADCRUMB_HEIGHT;

    // Search bar
    {
      DrawRectangle(0, y, screenWidth - PANEL_WIDTH, SEARCH_HEIGHT, Colors.PANEL_BG);
      DrawText('Search:', 6, y + 8, 14, Colors.TXT_COLOR);
      searchBox.draw(.rect(62, y + 4, screenWidth - PANEL_WIDTH - 66, SEARCH_HEIGHT - 8));
      if (searchBox.isNew) {
        selectedIdx = -1;
        scrollOffset = 0;
        rebuildVisible();
      }
    }
    y += SEARCH_HEIGHT;

    // Sort bar
    {
      DrawRectangle(0, y, screenWidth - PANEL_WIDTH, SORT_BAR_HEIGHT, Colors.SORT_HDR);

      final cols = <(String, SortField, int)>[
        ('Name', .name, listW - 160),
        ('Size', .size, 80),
        ('Date', .date, 80),
      ];

      int sx = listLeft;
      for (final (label, field, w) in cols) {
        final active = sortField == field;
        final btnText = active ? '$label ${sortDir == .asc ? "^" : "v"}' : label;
        final pressed = GuiButton(.rect(sx, y, w, SORT_BAR_HEIGHT), btnText) != .RESULT_NONE;
        if (pressed) {
          if (sortField == field) {
            sortDir = sortDir == .asc ? .desc : .asc;
          } else {
            sortField = field;
            sortDir   = .asc;
          }
          rebuildVisible();
        }
        sx += w;
      }
    }
    y += SORT_BAR_HEIGHT;

    // File list
    {
      BeginScissorMode(listLeft, y, listW, listH);

      int maxVisible = listH ~/ ITEM_HEIGHT;
      int drawY = y;

      for (int i = scrollOffset; i < visibleEntries.length && i < scrollOffset + maxVisible + 1; i++) {
        final entry = visibleEntries[i];
        final Rectangle row = .rect(listLeft, drawY, listW, ITEM_HEIGHT);
        final mouse = GetMousePosition();
        final hovered = CheckCollisionPointRec(mouse, row);

        // row background
        if (i == selectedIdx) {
          DrawRectangleRec(row, Colors.SELECTED);
        } else if (hovered) {
          DrawRectangleRec(row, Colors.HOVERED);
        }

        // row action
        if (hovered && IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
          if (dblclick.checkIndexed(.MOUSE_BUTTON_LEFT, i) && entry.isDir) {
            navigate(entry.fullPath);
            rebuildVisible();
          } else {
            selectedIdx = i;
          }
        }

        // icon + name
        DrawText(entry.icon, listLeft + 4, drawY + 5, 13, entry.color);
        DrawText(entry.name, listLeft + 44, drawY + 5, 13, entry.color);

        // size column
        DrawText(entry.sizeLabel, listLeft + listW - 160, drawY + 5, 12, Colors.DEF_COLOR);

        // date column
        DrawText(entry.modifiedString, listLeft + listW - 80, drawY + 5, 12, Colors.DEF_COLOR);

        drawY += ITEM_HEIGHT;
      }

      EndScissorMode();
    }

    // Info panel
    {
      int px = screenWidth - PANEL_WIDTH;
      DrawRectangle(px, 0, PANEL_WIDTH, screenHeight, Colors.INFO_BG);
      DrawLine(px, 0, px, screenHeight, Colors.DEF_COLOR);

      int py = 8;
      DrawText('Info', px + 8, py, 16, Colors.CRUMB_ACT);
      py += 24;

      if (selectedIdx >= 0 && selectedIdx < visibleEntries.length) {
        final e = visibleEntries[selectedIdx];

        void row(String label, String value) {
          DrawText(label, px + 8,  py, 12, Colors.DEF_COLOR);
          DrawText(value, px + 8, py + 14, 13, Colors.TXT_COLOR);
          py += 34;
        }

        DrawText(e.icon, px + 8, py, 28, e.color);
        py += 36;

        row('Name', e.name);
        row('Type', e.isDir ? 'Directory' : (e.ext.isEmpty ? 'File' : e.ext));
        row('Size', e.sizeLabel);
        row('Modified', e.modifiedString);

        if (e.isDir) {
          py += 8;
          final openPressed = GuiButton(.rect(px + 8, py, PANEL_WIDTH - 16, 28), 'Open') != .RESULT_NONE;
          if (openPressed) { navigate(e.fullPath); rebuildVisible(); }
        }

        DrawFileDescription(e, px, py);
      } else {
        DrawText('Select a file\nto see details.', px + 8, py, 13, Colors.DEF_COLOR);
      }

      // Keyboard hints
      int hy = screenHeight - 90;
      DrawText('Keys:', px + 8, hy, 12, Colors.DEF_COLOR);
      hy += 16;
      for (final hint in ['UP/DOWN - navigate', 'ENTER - open dir', 'BACKSPACE - go up']) {
        DrawText(hint, px + 8, hy, 11, Colors.DEF_COLOR);
        hy += 14;
      }
    }

    // Status bar
    {
      DrawText(
        '${visibleEntries.length} items'
        '${searchBox.text.isNotEmpty ? " (filtered)" : ""}',
        6, screenHeight - 18, 12, Colors.DEF_COLOR,
      );
    }

    focus.frameEnd(IsMouseButtonPressed(.MOUSE_BUTTON_LEFT));

    EndDrawing();
  },
  close: (_) {
    cachedSounds.values.forEach(UnloadMusicStream);
    cachedImages.values.forEach(UnloadImage);
    cachedTextures.values.forEach(UnloadTexture);

    CloseWindow();
  },
);

void DrawFileDescription(FileEntry file, int px, int py) {
  py += 32;

  switch (file.type) {
    case .image: {
      final texture = getTextureFromFile(file.fullPath, 256, 256);
      DrawTexture(texture, px + 8, py, .WHITE);
    }
    case .audio: {
      final music = getMusicFromFile(file.fullPath);
      final isCurrent = _currentPlayingMusicPath == file.fullPath;
      final isPlaying = isCurrent && IsMusicStreamPlaying(music);
      final length = GetMusicTimeLength(music);
      final played = isCurrent ? GetMusicTimePlayed(music) : 0.0;

      final int barX = px + 8;
      final int barW = PANEL_WIDTH - 16;

      final Rectangle btn = .rect(barX, py, 64, 24);
      final Rectangle bar = .rect(barX, py + 40, barW, 8);
      final Rectangle barHit = .rect(bar.x, bar.y - 6, bar.width, bar.height + 12);

      final mouse = GetMousePosition();

      // play / pause button
      if (IsMouseButtonPressed(.MOUSE_BUTTON_LEFT) && CheckCollisionPointRec(mouse, btn)) {
        if (isPlaying) {
          PauseMusicStream(music);
          _currentMusicPause = true;
        } else if (isCurrent && _currentMusicPause) {
          ResumeMusicStream(music);
          _currentMusicPause = false;
        } else {
          final prev = _currentPlayingMusic;
          if (prev != null && !isCurrent) StopMusicStream(prev);
          _currentPlayingMusic = music;
          _currentPlayingMusicPath = file.fullPath;
          _currentMusicPause = false;
          PlayMusicStream(music); // starts from the beginning
        }
      }

      // seek by click/drag
      if (isCurrent && length > 0 && IsMouseButtonDown(.MOUSE_BUTTON_LEFT) && CheckCollisionPointRec(mouse, barHit)) {
        final t = ((mouse.x - bar.x) / bar.width).clamp(0.0, 1.0);
        SeekMusicStream(music, t * length);
      }

      // draw
      DrawRectangleRec(btn, .DARKGRAY);
      DrawText(isPlaying ? "Pause" : "Play", barX + 8, py + 4, 16, .WHITE);

      DrawRectangleRec(bar, .GRAY);
      final fill = length > 0 ? (played / length).clamp(0.0, 1.0) : 0.0;
      DrawRectangle(barX, py + 40, (barW * fill).round(), 8, .SKYBLUE);

      DrawText("${_formatMusicDuration(played)} / ${_formatMusicDuration(length)}", barX, py + 56, 10, .GRAY);
    }
    case _: {}
  }
}