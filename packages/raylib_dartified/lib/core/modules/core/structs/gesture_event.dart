part of '../../../raylib_dartified.dart';

enum GestureEventField with XFields {
  touchAction,
  pointCount,
  pointId,
  position,
}

/// Gesture event
final class GestureEvent extends XStruct<GestureEvent> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<GestureEvent> struct = .create(
    factory: GestureEvent.new,
    layout: .aligned<GestureEventField>({
      .touchAction: XInt(),
      .pointCount:  XInt(),
      .pointId:     XArray(XInt(), BASE_maxTouchPoints),
      .position:    XArray(XStructType(Vector2.struct), BASE_maxTouchPoints),
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<GestureEventField> _l = struct.layoutOf();

  /// Field descriptor for [touchAction].
  static final field_touchAction = _l.enumValue(.touchAction, TouchAction.fromValue);
  /// Field descriptor for [pointCount].
  static final field_pointCount = _l.integer<XInt>(.pointCount);
  /// Field descriptor for [pointId].
  static final field_pointId = _l.scalarArray<int, XInt>(.pointId);
  /// Field descriptor for [position].
  static final field_position = _l.structArray<Vector2>(.position);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    
  
  /// Number of components in the [pointId] and [position] arrays.
  static int get BASE_maxTouchPoints => RaylibConstants.MAX_TOUCH_POINTS;

  /// Number of components in the [pointId] and [position] arrays.
  int get maxTouchPoints => BASE_maxTouchPoints;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  TouchAction _touchAction;
  /// Touch action
  TouchAction get touchAction => _touchAction = field_touchAction.readOr(op, _touchAction);
  set touchAction(TouchAction value) => _touchAction = field_touchAction.writeOr(op, value);

  int _pointCount;
  /// Point count
  int get pointCount => _pointCount = field_pointCount.readOr(op, _pointCount);
  set pointCount(int value) => _pointCount = field_pointCount.writeOr(op, value);

  late final XLiveList<int, XInt> _pointId;
  /// Point Id
  XLiveList<int, XInt> get pointId => _pointId;
  set pointId(List<int> value) => _pointId.setOrAllocate(value);

  late final StructLiveListStruct<Vector2> _position;
  /// Position
  StructLiveListStruct<Vector2> get position => _position;
  set position(List<Vector2> value) => _position.setOrAllocate(value);

  GestureEvent({
    super.op,
    this._touchAction = .TOUCH_ACTION_DOWN,
    this._pointCount = 0,
    List<int>? pointId,
    List<Vector2>? position,
  }) {
    _pointId = field_pointId.live(() => op, pointId ?? .filled(field_pointId.codec.type.count, 0));
    _position = field_position.live(() => op, position ?? .generate(field_position.codec.type.count, (_) => .zero()));
  }

  factory GestureEvent.zero() => .new();

  @override
  GestureEvent setDart(GestureEvent o) {
    touchAction = o.touchAction;
    pointCount = o.pointCount;
    pointId = .from(o.pointId);
    position = .from(o.position);
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_touchAction.write(p, touchAction);
    field_pointCount.write(p, pointCount);
    pointId.writeInto(p);
    position.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    touchAction = field_touchAction.read(p);
    pointCount = field_pointCount.read(p);
    pointId.readFrom(p);
    position.readFrom(p);
  }

  @override
  String signature() => '$structName(touchAction: $touchAction, pointCount: $pointCount, pointId: ${pointId.length}, postion: ${position.length})';
}