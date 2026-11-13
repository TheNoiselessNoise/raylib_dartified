part of '../../../raylib_dartified_base.dart';

enum RlDrawCallField with XFields {
  mode,
  vertexCount,
  vertexAlignment,
  textureId,
}

/// Draw call type
class RlDrawCall extends XStruct<RlDrawCall> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<RlDrawCall> struct = .create(
    factory: RlDrawCall.new,
    layout: .aligned<RlDrawCallField>({
      .mode:            XInt(), // Drawing mode: LINES, TRIANGLES, QUADS
      .vertexCount:     XInt(), // Number of vertex of the draw
      .vertexAlignment: XInt(), // Number of vertex required for index alignment (LINES, TRIANGLES)
      .textureId:       XUnsignedInt(), // Texture id to be used on the draw -> Use to create new draw call if changes
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<RlDrawCallField> _l = struct.layoutOf();

  /// Field descriptor for [mode].
  static final field_mode = _l.enumValue(.mode, RlDrawMode.fromValue);
  /// Field descriptor for [vertexCount].
  static final field_vertexCount = _l.integer<XInt>(.vertexCount);
  /// Field descriptor for [vertexAlignment].
  static final field_vertexAlignment = _l.integer<XInt>(.vertexAlignment);
  /// Field descriptor for [textureId].
  static final field_textureId = _l.integer<XUnsignedInt>(.textureId);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  RlDrawMode _mode;
  /// Drawing mode: LINES, TRIANGLES, QUADS
  RlDrawMode get mode => _mode = field_mode.readOr(op, _mode);
  set mode(RlDrawMode value) => _mode = field_mode.writeOr(op, value);

  int _vertexCount;
  /// Number of vertex of the draw
  int get vertexCount => _vertexCount = field_vertexCount.readOr(op, _vertexCount);
  set vertexCount(int value) => _vertexCount = field_vertexCount.writeOr(op, value);

  int _vertexAlignment;
  /// Number of vertex required for index alignment (LINES, TRIANGLES)
  int get vertexAlignment => _vertexAlignment = field_vertexAlignment.readOr(op, _vertexAlignment);
  set vertexAlignment(int value) => _vertexAlignment = field_vertexAlignment.writeOr(op, value);

  int _textureId;
  /// Texture id to be used on the draw -> Use to create new draw call if changes
  int get textureId => _textureId = field_textureId.readOr(op, _textureId);
  set textureId(int value) => _textureId = field_textureId.writeOr(op, value);
  
  RlDrawCall({
    super.op,
    RlDrawMode mode = .RL_NONE,
    int vertexCount = 0,
    int vertexAlignment = 0,
    int textureId = 0,
  }) :
    _mode = mode,
    _vertexCount = vertexCount,
    _vertexAlignment = vertexAlignment,
    _textureId = textureId;

  factory RlDrawCall.zero() => .new();

  @override
  RlDrawCall setDart(RlDrawCall o) {
    mode = o.mode;
    vertexCount = o.vertexCount;
    vertexAlignment = o.vertexAlignment;
    textureId = o.textureId;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_mode.write(p, mode);
    field_vertexCount.write(p, vertexCount);
    field_vertexAlignment.write(p, vertexAlignment);
    field_textureId.write(p, textureId);
  }

  @override
  void structReadFrom(XPtr p) {
    mode = field_mode.read(p);
    vertexCount = field_vertexCount.read(p);
    vertexAlignment = field_vertexAlignment.read(p);
    textureId = field_textureId.read(p);
  }

  @override
  String signature() => '$structName(mode: $mode, vertexCount: $vertexCount, textureId: $textureId)';
}