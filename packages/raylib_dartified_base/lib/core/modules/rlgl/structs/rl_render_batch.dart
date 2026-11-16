part of '../../../raylib_dartified_base.dart';

enum RlRenderBatchField with XFields {
  bufferCount,
  currentBuffer,
  vertexBuffer,
  draws,
  drawCounter,
  currentDepth,
}

/// rlRenderBatch type
final class RlRenderBatch extends XStruct<RlRenderBatch> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<RlRenderBatch> struct = .create(
    factory: RlRenderBatch.new,
    layout: .aligned<RlRenderBatchField>({
      .bufferCount:   XInt(), // Number of vertex buffers (multi-buffering support)
      .currentBuffer: XInt(), // Current buffer tracking in case of multi-buffering
      .vertexBuffer:  XPtrType(XStructType(RlVertexBuffer.struct)), // Dynamic buffer(s) for vertex data
      .draws:         XPtrType(XStructType(RlDrawCall.struct)), // Draw calls array, depends on textureId
      .drawCounter:   XInt(), // Draw calls counter
      .currentDepth:  XFloat(), // Current depth value for next draw
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<RlRenderBatchField> _l = struct.layoutOf();
  
  /// Field descriptor for [bufferCount].
  static final field_bufferCount = _l.integer<XInt>(.bufferCount);
  /// Field descriptor for [currentBuffer].
  static final field_currentBuffer = _l.integer<XInt>(.currentBuffer);
  /// Field descriptor for [vertexBuffer].
  static final field_vertexBuffer = _l.ptrStructArray<RlVertexBuffer>(.vertexBuffer);
  /// Field descriptor for [draws].
  static final field_draws = _l.ptrStructArray<RlDrawCall>(.draws);
  /// Field descriptor for [drawCounter].
  static final field_drawCounter = _l.integer<XInt>(.drawCounter);
  /// Field descriptor for [currentDepth].
  static final field_currentDepth = _l.float<XFloat>(.currentDepth);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _bufferCount;
  /// Number of vertex buffers (multi-buffering support)
  int get bufferCount => _bufferCount = field_bufferCount.readOr(op, _bufferCount);
  set bufferCount(int value) => _bufferCount = field_bufferCount.writeOr(op, value);

  int _currentBuffer;
  /// Current buffer tracking in case of multi-buffering
  int get currentBuffer => _currentBuffer = field_currentBuffer.readOr(op, _currentBuffer);
  set currentBuffer(int value) => _currentBuffer = field_currentBuffer.writeOr(op, value);

  late final StructLiveListStruct<RlVertexBuffer> _vertexBuffer;
  /// Dynamic buffer(s) for vertex data
  StructLiveListStruct<RlVertexBuffer> get vertexBuffer => _vertexBuffer;
  set vertexBuffer(List<RlVertexBuffer> value) => _vertexBuffer.inner = value;

  late final StructLiveListStruct<RlDrawCall> _draws;
  /// Draw calls array, depends on textureId
  StructLiveListStruct<RlDrawCall> get draws => _draws;
  set draws(List<RlDrawCall> value) => _draws.inner = value;

  int _drawCounter;
  /// Draw calls counter
  int get drawCounter => _drawCounter = field_drawCounter.readOr(op, _drawCounter);
  set drawCounter(int value) => _drawCounter = field_drawCounter.writeOr(op, value);
  
  double _currentDepth;
  /// Current depth value for next draw
  double get currentDepth => _currentDepth = field_currentDepth.readOr(op, _currentDepth);
  set currentDepth(double value) => _currentDepth = field_currentDepth.writeOr(op, value);
  
  RlRenderBatch({
    super.op,
    this._bufferCount = 0,
    this._currentBuffer = 0,
    List<RlVertexBuffer>? vertexBuffer,
    List<RlDrawCall>? draws,
    this._drawCounter = 0,
    this._currentDepth = 0,
  }) {
    _vertexBuffer = field_vertexBuffer.live(() => op, vertexBuffer ?? []);
    _draws = field_draws.live(() => op, draws ?? []);
  }

  factory RlRenderBatch.zero() => .new();

  @override
  RlRenderBatch setDart(RlRenderBatch o) {
    bufferCount = o.bufferCount;
    currentBuffer = o.currentBuffer;
    vertexBuffer = o.vertexBuffer.map((e) => e.clone()).toList();
    draws = o.draws.map((e) => e.clone()).toList();
    drawCounter = o.drawCounter;
    currentDepth = o.currentDepth;
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    field_vertexBuffer.allocate(p, '${key}_vertexBuffer', count: bufferCount);
    field_draws.allocate(p, '${key}_draws', count: bufferCount);
  }

  @override
  void structWriteInto(XPtr p) {
    field_bufferCount.write(p, bufferCount);
    field_currentBuffer.write(p, currentBuffer);
    vertexBuffer.writeInto(p);
    draws.writeInto(p);
    field_drawCounter.write(p, drawCounter);
    field_currentDepth.write(p, currentDepth);
  }

  @override
  void structReadFrom(XPtr p) {
    bufferCount = field_bufferCount.read(p);
    currentBuffer = field_currentBuffer.read(p);
    vertexBuffer.readFrom(p, count: bufferCount);
    draws.readFrom(p, count: bufferCount);
    drawCounter = field_drawCounter.read(p);
    currentDepth = field_currentDepth.read(p);
  }

  @override
  String signature() => '$structName(bufferCount: $bufferCount, currentBuffer: $currentBuffer, drawCounter: $drawCounter, currentDepth: $currentDepth)';
}