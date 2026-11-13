part of '../raylib_dartified_unhinged.dart';

class InputSystem<T extends App<T>> extends AppSystem<T> {
  InputSystem(super.app);

  Map<String, int> _mouseMap = {};
  Map<String, bool> _mouseDown = {};
  Map<String, bool> _mousePressed = {};

  Map<String, bool> _codesCompleted = {};
  Map<String, int> _codesCorrectIndexes = {};

  Map<String, int> _keyMap = {};
  Map<String, bool> _keyDown = {};
  Map<String, bool> _keyPressed = {};
  Map<String, bool> _keyPressedRepeat = {};
  List<int> _keyPressedKeycodes = [];
  List<int> _keyPressedUnicodes = [];

  void mapMouse(String action, MouseButton mouseButton) {
    _mouseMap[action] = mouseButton.value;
    _mouseDown[action] = false;
    _mousePressed[action] = false;
  }

  void mapKey(String action, KeyboardKey key) {
    _keyMap[action] = key.value;
    _keyDown[action] = false;
    _keyPressed[action] = false;
    _keyPressedRepeat[action] = false;
  }

  void mapKeys(Map<String, KeyboardKey> keys)
    => keys.entries.forEach((e) => mapKey(e.key, e.value));

  void mapCode(String code) {
    _codesCompleted[code] = false;
    _codesCorrectIndexes[code] = 0;
  }

  void mapCodes(List<String> codes) => codes.forEach(mapCode);

  bool isMouseDown(String action) => _mouseDown[action] ?? false;
  bool isMouseUp(String action) => !isMouseDown(action);
  bool isMousePressed(String action) => _mousePressed[action] ?? false;
  bool isMouseReleased(String action) => !isMousePressed(action);

  bool isKeyDown(String action) => _keyDown[action] ?? false;
  bool isKeyUp(String action) => !isKeyDown(action);
  bool isKeyPressed(String action) => _keyPressed[action] ?? false;
  bool isKeyPressedRepeat(String action) => _keyPressedRepeat[action] ?? false;
  bool isKeyReleased(String action) => !isKeyPressed(action);
  List<int> keycodes() => _keyPressedKeycodes.toList();
  List<int> unicodes() => _keyPressedUnicodes.toList();

  bool isCodeCompleted(String code) => _codesCompleted[code] ?? false;

  @override
  @mustCallSuper
  void _doBeginFrame(double dt) {
    // Clear transient states from previous frame
    _keyPressed.clear();
    _keyPressedRepeat.clear();
    _mousePressed.clear();
    _keyPressedKeycodes.clear();
    _keyPressedUnicodes.clear();
    _poll();

    super._doBeginFrame(dt);
  }

  void _poll() {
    // --- Keys ---
    for (final entry in _keyMap.entries) {
      final v = KeyboardKey.fromValue(entry.value);
      _keyPressed[entry.key] = backend.input.isKeyPressed(v);
      _keyPressedRepeat[entry.key] = backend.input.isKeyPressedRepeat(v);
      _keyDown[entry.key] = backend.input.isKeyDown(v);
    }

    int key;
    while ((key = backend.input.getCharPressed()) != 0) {
      _keyPressedKeycodes.add(key);
    }

    int id;
    while ((id = backend.input.getKeyPressed()) != 0) {
      _keyPressedUnicodes.add(id);
    }

    // --- Mouse ---
    for (final entry in _mouseMap.entries) {
      final v = MouseButton.fromValue(entry.value);
      _mousePressed[entry.key] = backend.input.isMouseButtonPressed(v);
      _mouseDown[entry.key] = backend.input.isMouseButtonDown(v);
    }

    // --- Codes ---
    for (final c in _codesCompleted.entries) {
      final code = c.key;
      bool completed = _codesCompleted[code]!;
      int index = _codesCorrectIndexes[code]!;

      var keys = input.keycodes();
      while (keys.isNotEmpty) {
        final key = keys.removeAt(0);
        if (key == code[index].ch) index++;
        else index = 0;
      }
      if (index == code.length) {
        index = 0;
        completed = true;
      } else {
        completed = false;
      }

      _codesCompleted[code] = completed;
      _codesCorrectIndexes[code] = index;
    }
  }

  @override
  InputSystem<T> createInstance() {
    final c = InputSystem(app);
    c._mouseMap = .from(_mouseMap);
    c._mouseDown = .from(_mouseDown);
    c._mousePressed = .from(_mousePressed);
    c._keyMap = .from(_keyMap);
    c._keyDown = .from(_keyDown);
    c._keyPressed = .from(_keyPressed);
    c._keyPressedRepeat = .from(_keyPressedRepeat);
    c._keyPressedKeycodes = .from(_keyPressedKeycodes);
    c._keyPressedUnicodes = .from(_keyPressedUnicodes);
    c._codesCompleted = .from(_codesCompleted);
    c._codesCorrectIndexes = .from(_codesCorrectIndexes);
    return c;
  }
}