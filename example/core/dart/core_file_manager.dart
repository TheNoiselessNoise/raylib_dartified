// Custom example, there's no original equivalent
// Run it: dart run core_file_manager.dart
import '../../base.dart';
import 'package:path/path.dart' as path;

const int screenWidth = 900;
const int screenHeight = 600;

const int PANEL_WIDTH = 280;
const int TOOLBAR_HEIGHT = 40;
const int BREADCRUMB_HEIGHT = 30;
const int ITEM_HEIGHT = 24;
const int SEARCH_HEIGHT = 30;
const int SORT_BAR_HEIGHT = 24;
const List<String> IMAGE_EXTS = ['.png', '.jpg', '.gif'];
const List<String> BIN_EXTS = ['.exe', '.bin', '.so'];
const List<String> TEXT_EXTS = ['.txt', '.md' , '.yaml'];
const List<String> SHADER_EXTS = ['.fs', '.vs'];

// TODO: responsive

class DoubleClickDetector {
  final Raylib rl;

  DoubleClickDetector(this.rl);

  final Map<MouseButton, double> _lastClickTimes = {};
  final Map<MouseButton, int> _lastClickIndex = {};

  bool checkIndexed(MouseButton button, int index, [double? interval]) {
    if (rl.CoreD.IsMouseButtonPressed(button)) {
      final now = rl.CoreD.GetTime();
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

class TextBoxFocus {
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

class BetterTextBox {
  final Raylib rl;
  final TextBoxFocus focus;
  RectangleD rect;
  String oldText;
  String text;

  BetterTextBox(this.rl, this.focus, {
    RectangleD? rect,
    this.text = '',
  }) : oldText = text, rect = rect ?? .zero();

  bool get editMode => focus.has(this);
  bool get isNew => oldText != text;

  void _update() {
    final mouse = rl.CoreD.GetMousePosition();
    if (
      rl.CoreD.CheckCollisionPointRec(mouse, rect) &&
      rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)
    ) focus.claim(this);
  }

  void draw([RectangleD? newRect]) {
    _update();
    if (newRect != null) rect = newRect;
    final (_, newText) = rl.GuiD.GuiTextBox(rect, text, 255, editMode);
    oldText = text;
    text = newText;
  }
}

// ─── Colors ───────────────────────────────────────────────────────────────────

class Colors {
  static ColorD RAYWHITE  = .color(245, 245, 245, 255);
  static ColorD PANEL_BG  = .color(230, 230, 235, 255);
  static ColorD INFO_BG   = .color(220, 220, 228, 255);
  static ColorD SELECTED  = .color(100, 149, 237, 180);
  static ColorD HOVERED   = .color(200, 215, 240, 180);
  static ColorD DIR_COLOR = .color( 60, 120, 200, 255);
  static ColorD IMG_COLOR = .color(220, 130,  40, 255);
  static ColorD BIN_COLOR = .color(180,  60,  60, 255);
  static ColorD TXT_COLOR = .color( 80,  80,  80, 255);
  static ColorD SHD_COLOR = .color(150, 120, 220, 255);
  static ColorD DEF_COLOR = .color(120, 120, 120, 255);
  static ColorD CRUMB_ACT = .color( 40,  90, 180, 255);
  static ColorD CRUMB_SEP = .color(150, 150, 150, 255);
  static ColorD SORT_HDR  = .color(210, 210, 218, 255);
  static ColorD SORT_ACT  = .color(100, 149, 237, 255);
}

// ─── File info ────────────────────────────────────────────────────────────────

enum SortField { name, size, date }
enum SortDir   { asc, desc }

class FileEntry {
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

  bool get isImage => IMAGE_EXTS.contains(ext);

  String get modifiedString =>
    '${modified.year}-'
    '${modified.month.toString().padLeft(2,"0")}-'
    '${modified.day.toString().padLeft(2,"0")}';

  ColorD get color {
    if (isDir) return Colors.DIR_COLOR;
    if (IMAGE_EXTS.contains(ext)) return Colors.IMG_COLOR;
    if (BIN_EXTS.contains(ext)) return Colors.BIN_COLOR;
    if (TEXT_EXTS.contains(ext)) return Colors.TXT_COLOR;
    if (SHADER_EXTS.contains(ext)) return Colors.SHD_COLOR;
    return Colors.DEF_COLOR;
  }

  String get icon {
    if (isDir) return '[DIR]';
    if (IMAGE_EXTS.contains(ext)) return '[IMG]';
    if (BIN_EXTS.contains(ext)) return '[BIN]';
    if (TEXT_EXTS.contains(ext)) return '[TXT]';
    if (SHADER_EXTS.contains(ext)) return '[SHD]';
    return '[___]';
  }

  String get sizeLabel {
    if (isDir) return '--';
    if (size < 1024) return '$size B';
    if (size < 1024 * 1024) return '${(size / 1024).toStringAsFixed(1)} KB';
    return '${(size / (1024 * 1024)).toStringAsFixed(1)} MB';
  }
}

List<FileEntry> loadDirectory(Raylib rl, String dirPath) {
  try {
    final files = rl.CoreD.LoadDirectoryFiles(dirPath);
    final fileEntries = files.paths
      .map((e) {
        final filePath = path.normalize(e);
        return FileEntry(
          fullPath: filePath,
          name:     path.basename(filePath),
          isDir:    rl.CoreD.DirectoryExists(filePath),
          size:     rl.CoreD.GetFileLength(filePath),
          modified: .fromMillisecondsSinceEpoch(rl.CoreD.GetFileModTime(filePath)),
        );
      })
      .toList();
    rl.CoreD.UnloadDirectoryFiles(files);
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
    SortField.name => a.name.compareTo(b.name),
    SortField.size => a.size.compareTo(b.size),
    SortField.date => a.modified.compareTo(b.modified),
  };

  dirs.sort((a, b)  => dir == SortDir.asc ? cmp(a, b) : cmp(b, a));
  files.sort((a, b) => dir == SortDir.asc ? cmp(a, b) : cmp(b, a));
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

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, 'File Browser');
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  int selectedIdx = -1;
  int scrollOffset = 0;
  SortField sortField = SortField.name;
  SortDir sortDir = SortDir.asc;

  List<FileEntry> allEntries = [];
  List<FileEntry> visibleEntries = [];

  final dblclick = DoubleClickDetector(rl);
  final focus = TextBoxFocus();
  final pathBox = BetterTextBox(rl, focus, text: rl.CoreD.GetApplicationDirectory());
  final searchBox = BetterTextBox(rl, focus);

  void navigate(String path) {
    pathBox.text = path;
    selectedIdx = 0;
    scrollOffset = 0;
    allEntries = loadDirectory(rl, path);
  }

  void rebuildVisible() {
    var filtered = allEntries.where((e) {
      return searchBox.text.isEmpty ||
        e.name.toLowerCase().contains(searchBox.text.toLowerCase());
    }).toList();
    visibleEntries = sortEntries(filtered, sortField, sortDir);
  }

  navigate(pathBox.text);
  rebuildVisible();

  // Layout constants
  int listTop = TOOLBAR_HEIGHT + BREADCRUMB_HEIGHT + SEARCH_HEIGHT + SORT_BAR_HEIGHT;
  int listLeft = 0;
  int listW = screenWidth - PANEL_WIDTH;
  int listH = screenHeight - listTop;

  final Map<String, ImageD> cachedImages = {};
  final Map<String, TextureD> cachedTextures = {};

  ImageD getImageFromFile(String path, int width, int height) {
    if (cachedImages.containsKey(path)) return cachedImages[path]!;
    final image = rl.CoreD.LoadImage(path);
    rl.CoreD.ImageResize(image, width, height);
    cachedImages[path] = image;
    return image;
  }

  TextureD getTextureFromFile(String path, int width, int height) {
    if (cachedTextures.containsKey(path)) return cachedTextures[path]!;
    final image = getImageFromFile(path, width, height);
    final texture = rl.CoreD.LoadTextureFromImage(image);
    cachedTextures[path] = texture;
    return texture;
  }

  while (!rl.CoreD.WindowShouldClose()) {
    // Keyboard navigation
    if (!focus.isFocused) {
      if (rl.CoreD.IsKeyPressed(.KEY_UP)) {
        selectedIdx = (selectedIdx - 1).clamp(0, visibleEntries.length - 1);
        // scroll into view
        if (selectedIdx >= 0 && selectedIdx < scrollOffset)
          scrollOffset = selectedIdx;
      }

      if (rl.CoreD.IsKeyPressed(.KEY_DOWN)) {
        selectedIdx = (selectedIdx + 1).clamp(0, visibleEntries.length - 1);
        int maxVisible = listH ~/ ITEM_HEIGHT;
        if (selectedIdx >= scrollOffset + maxVisible)
          scrollOffset = selectedIdx - maxVisible + 1;
      }

      if (rl.CoreD.IsKeyPressed(.KEY_ENTER) && selectedIdx >= 0) {
        final entry = visibleEntries[selectedIdx];
        if (entry.isDir) { navigate(entry.fullPath); rebuildVisible(); }
      }

      if (rl.CoreD.IsKeyPressed(.KEY_BACKSPACE) && searchBox.text.isEmpty) {
        final parent = path.dirname(pathBox.text);
        if (parent != pathBox.text) { navigate(parent); rebuildVisible(); }
      }
    }

    // Mouse wheel scroll
    final wheel = rl.CoreD.GetMouseWheelMove();
    if (wheel != 0) {
      scrollOffset = (scrollOffset - wheel.toInt()).clamp(0, (visibleEntries.length - listH ~/ ITEM_HEIGHT).clamp(0, 999999));
    }

    rl.CoreD.BeginDrawing();
    rl.CoreD.ClearBackground(.RAYWHITE);

    int y = 0;

    // Toolbar (path text box + up button)
    {
      rl.CoreD.DrawRectangle(0, y, screenWidth, TOOLBAR_HEIGHT, Colors.PANEL_BG);

      final upPressed = rl.GuiD.GuiButton(.rect(4, y + 5, 60, TOOLBAR_HEIGHT - 10), 'Up').toBool();
      if (upPressed) {
        final parent = path.dirname(pathBox.text);
        if (parent != pathBox.text) { navigate(parent); rebuildVisible(); }
      }

      pathBox.draw(.rect(68, y + 5, screenWidth - PANEL_WIDTH - 72, TOOLBAR_HEIGHT - 10));

      if (pathBox.isNew) {
        if (rl.CoreD.DirectoryExists(pathBox.text)) {
          navigate(pathBox.text);
          rebuildVisible();
        }
      }
    }
    y += TOOLBAR_HEIGHT;

    // Breadcrumb bar
    {
      rl.CoreD.DrawRectangle(0, y, screenWidth - PANEL_WIDTH, BREADCRUMB_HEIGHT, Colors.PANEL_BG);
      int bx = 6;
      final crumbs = breadcrumbs(pathBox.text);
      for (int i = 0; i < crumbs.length; i++) {
        final label = i == 0 ? '/' : path.basename(crumbs[i]);

        final tw = rl.GuiD.GuiGetTextWidth(label) + 12;
        final pressed = rl.GuiD.GuiButton(.rect(bx, y + 4, tw, BREADCRUMB_HEIGHT - 8), label).toBool();
        if (pressed) { navigate(crumbs[i]); rebuildVisible(); }

        bx += tw + 2;
        if (i < crumbs.length - 1) bx += 3;
        if (bx > screenWidth - PANEL_WIDTH - 20) break;
      }
    }
    y += BREADCRUMB_HEIGHT;

    // Search bar
    {
      rl.CoreD.DrawRectangle(0, y, screenWidth - PANEL_WIDTH, SEARCH_HEIGHT, Colors.PANEL_BG);
      rl.CoreD.DrawText('Search:', 6, y + 8, 14, Colors.TXT_COLOR);
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
      rl.CoreD.DrawRectangle(0, y, screenWidth - PANEL_WIDTH, SORT_BAR_HEIGHT, Colors.SORT_HDR);

      final cols = [
        ('Name', SortField.name, listW - 160),
        ('Size', SortField.size, 80),
        ('Date', SortField.date, 80),
      ];

      int sx = listLeft;
      for (final (label, field, w) in cols) {
        final active = sortField == field;
        final btnText = active ? '$label ${sortDir == SortDir.asc ? "^" : "v"}' : label;
        final pressed = rl.GuiD.GuiButton(.rect(sx, y, w, SORT_BAR_HEIGHT), btnText).toBool();
        if (pressed) {
          if (sortField == field) {
            sortDir = sortDir == SortDir.asc ? SortDir.desc : SortDir.asc;
          } else {
            sortField = field;
            sortDir   = SortDir.asc;
          }
          rebuildVisible();
        }
        sx += w;
      }
    }
    y += SORT_BAR_HEIGHT;

    // File list
    {
      rl.CoreD.BeginScissorMode(listLeft, y, listW, listH);

      int maxVisible = listH ~/ ITEM_HEIGHT;
      int drawY = y;

      for (int i = scrollOffset; i < visibleEntries.length && i < scrollOffset + maxVisible + 1; i++) {
        final entry = visibleEntries[i];
        final RectangleD row = .rect(listLeft, drawY, listW, ITEM_HEIGHT);
        final mouse = rl.CoreD.GetMousePosition();
        final hovered = rl.CoreD.CheckCollisionPointRec(mouse, row);

        // row background
        if (i == selectedIdx) {
          rl.CoreD.DrawRectangleRec(row, Colors.SELECTED);
        } else if (hovered) {
          rl.CoreD.DrawRectangleRec(row, Colors.HOVERED);
        }

        // row action
        if (hovered && rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT)) {
          if (dblclick.checkIndexed(.MOUSE_BUTTON_LEFT, i) && entry.isDir) {
            navigate(entry.fullPath);
            rebuildVisible();
          } else {
            selectedIdx = i;
          }
        }

        // icon + name
        rl.CoreD.DrawText(entry.icon, listLeft + 4, drawY + 5, 13, entry.color);
        rl.CoreD.DrawText(entry.name, listLeft + 44, drawY + 5, 13, entry.color);

        // size column
        rl.CoreD.DrawText(entry.sizeLabel, listLeft + listW - 160, drawY + 5, 12, Colors.DEF_COLOR);

        // date column
        rl.CoreD.DrawText(entry.modifiedString, listLeft + listW - 80, drawY + 5, 12, Colors.DEF_COLOR);

        drawY += ITEM_HEIGHT;
      }

      rl.CoreD.EndScissorMode();
    }

    // Info panel
    {
      int px = screenWidth - PANEL_WIDTH;
      rl.CoreD.DrawRectangle(px, 0, PANEL_WIDTH, screenHeight, Colors.INFO_BG);
      rl.CoreD.DrawLine(px, 0, px, screenHeight, Colors.DEF_COLOR);

      int py = 8;
      rl.CoreD.DrawText('Info', px + 8, py, 16, Colors.CRUMB_ACT);
      py += 24;

      if (selectedIdx >= 0 && selectedIdx < visibleEntries.length) {
        final e = visibleEntries[selectedIdx];

        void row(String label, String value) {
          rl.CoreD.DrawText(label, px + 8,  py, 12, Colors.DEF_COLOR);
          rl.CoreD.DrawText(value, px + 8, py + 14, 13, Colors.TXT_COLOR);
          py += 34;
        }

        rl.CoreD.DrawText(e.icon, px + 8, py, 28, e.color);
        py += 36;

        row('Name', e.name);
        row('Type', e.isDir ? 'Directory' : (e.ext.isEmpty ? 'File' : e.ext));
        row('Size', e.sizeLabel);
        row('Modified', e.modifiedString);

        if (e.isDir) {
          py += 8;
          final openPressed = rl.GuiD.GuiButton(
            .rect(px + 8, py, PANEL_WIDTH - 16, 28),
            'Open',
          ).toBool();
          if (openPressed) { navigate(e.fullPath); rebuildVisible(); }
        }

        if (e.isImage) {
          py += 32;

          final texture = getTextureFromFile(e.fullPath, 256, 256);
          rl.CoreD.DrawTexture(texture, px + 8, py, .WHITE);
        }
      } else {
        rl.CoreD.DrawText('Select a file\nto see details.', px + 8, py, 13, Colors.DEF_COLOR);
      }

      // Keyboard hints
      int hy = screenHeight - 90;
      rl.CoreD.DrawText('Keys:', px + 8, hy, 12, Colors.DEF_COLOR);
      hy += 16;
      for (final hint in ['UP/DOWN - navigate', 'ENTER - open dir', 'BACKSPACE - go up']) {
        rl.CoreD.DrawText(hint, px + 8, hy, 11, Colors.DEF_COLOR);
        hy += 14;
      }
    }

    // Status bar
    {
      rl.CoreD.DrawText(
        '${visibleEntries.length} items'
        '${searchBox.text.isNotEmpty ? " (filtered)" : ""}',
        6, screenHeight - 18, 12, Colors.DEF_COLOR,
      );
    }

    focus.frameEnd(rl.CoreD.IsMouseButtonPressed(.MOUSE_BUTTON_LEFT));

    rl.CoreD.EndDrawing();
  }

  cachedImages.values.forEach(rl.CoreD.UnloadImage);
  cachedTextures.values.forEach(rl.CoreD.UnloadTexture);

  rl.CloseWindowAndDispose();
}