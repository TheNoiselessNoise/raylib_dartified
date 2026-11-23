part of '../../../raylib_dartified.dart';

enum AutomationEventField with XFields {
  frame,
  type,
  params,
}

/// Automation event
final class AutomationEvent extends XStruct<AutomationEvent> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<AutomationEvent> struct = .create(
    factory: AutomationEvent.new,
    layout: .aligned<AutomationEventField>({
      .frame:  XUnsignedInt(), // Event frame
      .type:   XUnsignedInt(), // Event type (AutomationEventType)
      .params: XArray(XInt(), BASE_paramsCount), // Event parameters (if required)
    }),
  );
  
  /// Raw memory layout of this object.
  static final XLayout<AutomationEventField> _l = struct.layoutOf();

  /// Field descriptor for [frame].
  static final field_frame = _l.integer<XUnsignedInt>(.frame);
  /// Field descriptor for [type].
  static final field_type = _l.enumValue(.type, AutomationEventType.fromValue);
  /// Field descriptor for [params].
  static final field_params = _l.scalarArray<int, XInt>(.params);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [params] array.
  static int get BASE_paramsCount => 4;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _frame;
  /// Event frame
  int get frame => _frame = field_frame.readOr(op, _frame);
  set frame(int value) => _frame = field_frame.writeOr(op, value);

  AutomationEventType _type;
  /// Event type
  AutomationEventType get type => _type = field_type.readOr(op, _type);
  set type(AutomationEventType value) => _type = field_type.writeOr(op, value);

  late final XLiveList<int, XInt> _params;
  /// Event parameters (if required)
  XLiveList<int, XInt> get params => _params;
  set params(List<int> value) => _params.setOrAllocate(value);

  AutomationEvent({
    super.op,
    this._frame = 0,
    this._type = .EVENT_NONE,
    List<int>? params,
  }) {
    _params = field_params.live(
      () => op,
      .filled(field_params.codec.type.count, 0),
    );
  }

  factory AutomationEvent.zero() => .new();

  @override
  AutomationEvent setDart(AutomationEvent o) {
    frame = o.frame;
    type = o.type;
    params = .from(o.params);
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_frame.write(p, frame);
    field_type.write(p, type);
    params.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    frame = field_frame.read(p);
    type = field_type.read(p);
    params.readFrom(p);
  }

  @override
  String signature() => '$structName(frame: $frame, type: $type, params: $params)';
}