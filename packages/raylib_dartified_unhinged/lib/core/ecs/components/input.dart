part of '../../raylib_dartified_unhinged.dart';

class CInput<T extends App<T>> extends Comp<T> {
  Map<String, MouseButton> mouseMap;
  Map<String, KeyboardKey> keyMap;

  CInput(super.app, {
    super.populateDefaults,
    Map<String, MouseButton>? mouseMap,
    Map<String, KeyboardKey>? keyMap,
  }) :
    mouseMap = mouseMap ?? {},
    keyMap = keyMap ?? {};

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('mouseMap', ObjectFieldDescriptor.value(
      () => mouseMap,
      (v) => mouseMap = .from(v),
    ));

    descriptor.addField('keyMap', ObjectFieldDescriptor.value(
      () => keyMap,
      (v) => keyMap = .from(v),
    ));
  }

  @override
  void onAdd(ECSBase<T> parent) {
    mouseMap.forEach((action, code) => input.mapMouse(action, code));
    keyMap.forEach((action, code) => input.mapKey(action, code));
  }

  void mapMouse(String action, MouseButton mouseButton)
    => input.mapMouse(action, mouseButton);

  void mapKey(String action, KeyboardKey key)
    => input.mapKey(action, key);

  // clone

  @override
  CInput<T> createInstance() => .new(app);

  // state

  @override
  CInputSnapshot<T> createSnapshot() {
    final snapshot = CInputSnapshot<T>(namedId);
    snapshot.mouseMap = .from(mouseMap);
    snapshot.keyMap = .from(keyMap);
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CInputSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    mouseMap = .from(snapshot.mouseMap);
    keyMap = .from(snapshot.keyMap);
  }

  // persistence

  static const typeId = '__comp__CInput';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'mouseMap': mouseMap.map((k, v) => .new(k, v.value)),
    'keyMap': keyMap.map((k, v) => .new(k, v.value)),
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final mouseMapData = data.getMap<int>('mouseMap');
    for (final e in mouseMapData.entries) {
      mouseMap[e.key] = .fromValue(e.value);
    }

    final keyMapData = data.getMap<int>('keyMap');
    for (final e in keyMapData.entries) {
      keyMap[e.key] = .fromValue(e.value);
    }
  }
}

class CInputSnapshot<T extends App<T>> extends CompSnapshot<T, CInput<T>> {
  late Map<String, MouseButton> mouseMap;
  late Map<String, KeyboardKey> keyMap;
  
  CInputSnapshot(super.id);

  @override
  CInput<T> createInstance(T app) => .new(app);
}