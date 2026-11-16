part of '../../../raylib_dartified_base.dart';

enum AutomationEventListField with XFields {
  capacity,
  count,
  events,
}

/// Automation event list
final class AutomationEventList extends XStruct<AutomationEventList> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<AutomationEventList> struct = .create(
    factory: AutomationEventList.new,
    layout: .aligned<AutomationEventListField>({
      .capacity: XUnsignedInt(), // Events max entries (MAX_AUTOMATION_EVENTS)
      .count:    XUnsignedInt(), // Events entries count
      .events:   XPtrType(XStructType(AutomationEvent.struct)), // Events entries
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<AutomationEventListField> _l = struct.layoutOf();

  /// Field descriptor for [capacity].
  static final field_capacity = _l.integer<XUnsignedInt>(.capacity);
  /// Field descriptor for [count].
  static final field_count = _l.integer<XUnsignedInt>(.count);
  /// Field descriptor for [events].
  static final field_events = _l.ptrStructArray<AutomationEvent>(.events);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Events max entries (MAX_AUTOMATION_EVENTS)
  int get capacity => field_capacity.read(getOp());
  
  /// Events entries count
  int get count => field_count.read(getOp());

  /// Events entries
  List<AutomationEvent> get events => field_events.readCount(getOp(), count);

  AutomationEventList({ super.op });

  factory AutomationEventList.zero() => .new();

  @override
  String signature() => '$structName(count: $count)';
}
