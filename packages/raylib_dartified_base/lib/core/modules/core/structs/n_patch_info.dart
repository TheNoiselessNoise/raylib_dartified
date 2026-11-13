part of '../../../raylib_dartified_base.dart';

enum NPatchInfoField with XFields {
  source,
  left,
  top,
  right,
  bottom,
  layout,
}

/// NPatchInfo, n-patch layout info
class NPatchInfo extends XStruct<NPatchInfo> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<NPatchInfo> struct = .createValue(
    factory: NPatchInfo.new,
    layout: .aligned<NPatchInfoField>({
      .source: XRawStruct(Rectangle.struct), // Texture source rectangle
      .left:   XInt(), // Left border offset
      .top:    XInt(), // Top border offset
      .right:  XInt(), // Right border offset
      .bottom: XInt(), // Bottom border offset
      .layout: XInt(), // Layout of the n-patch: 3x3, 1x3 or 3x1
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<NPatchInfoField> _l = struct.layoutOf();

  /// Field descriptor for [source].
  static final field_source = _l.struct<Rectangle>(.source);
  /// Field descriptor for [left].
  static final field_left = _l.integer<XInt>(.left);
  /// Field descriptor for [top].
  static final field_top = _l.integer<XInt>(.top);
  /// Field descriptor for [right].
  static final field_right = _l.integer<XInt>(.right);
  /// Field descriptor for [bottom].
  static final field_bottom = _l.integer<XInt>(.bottom);
  /// Field descriptor for [layout].
  static final field_layout = _l.enumValue(.layout, NPatchLayout.fromValue);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Rectangle _source;
  /// Texture source rectangle
  Rectangle get source => _source = field_source.readOr(op, _source);
  set source(Rectangle value) => _source = field_source.writeOr(op, value);

  int _left;
  /// Left border offset
  int get left => _left = field_left.readOr(op, _left);
  set left(int value) => _left = field_left.writeOr(op, value);

  int _top;
  /// Top border offset
  int get top => _top = field_top.readOr(op, _top);
  set top(int value) => _top = field_top.writeOr(op, value);

  int _right;
  /// Right border offset
  int get right => _right = field_right.readOr(op, _right);
  set right(int value) => _right = field_right.writeOr(op, value);

  int _bottom;
  /// Bottom border offset
  int get bottom => _bottom = field_bottom.readOr(op, _bottom);
  set bottom(int value) => _bottom = field_bottom.writeOr(op, value);

  NPatchLayout _layout;
  /// Layout of the n-patch: 3x3, 1x3 or 3x1
  NPatchLayout get layout => _layout = field_layout.readOr(op, _layout);
  set layout(NPatchLayout value) => _layout = field_layout.writeOr(op, value);

  NPatchInfo({
    super.op,
    Rectangle? source,
    int left = 0,
    int top = 0,
    int right = 0,
    int bottom = 0,
    NPatchLayout layout = .NPATCH_NINE_PATCH,
  }) :
    _source = source ?? .new(),
    _left = left,
    _top = top,
    _right = right,
    _bottom = bottom,
    _layout = layout;

  factory NPatchInfo.zero() => .new();

  @override
  NPatchInfo setDart(NPatchInfo o) {
    source.setDart(o.source);
    left = o.left;
    top = o.top;
    right = o.right;
    bottom = o.bottom;
    layout = o.layout;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_source.write(p, source);
    field_left.write(p, left);
    field_top.write(p, top);
    field_right.write(p, right);
    field_bottom.write(p, bottom);
    field_layout.write(p, layout);
  }

  @override
  void structReadFrom(XPtr p) {
    source = field_source.read(p);
    left = field_left.read(p);
    top = field_top.read(p);
    right = field_right.read(p);
    bottom = field_bottom.read(p);
    layout = field_layout.read(p);
  }

  @override
  String signature() => '$structName(source: $source, left: $left, top: $top, right: $right, bottom: $bottom, layout: $layout)';
}