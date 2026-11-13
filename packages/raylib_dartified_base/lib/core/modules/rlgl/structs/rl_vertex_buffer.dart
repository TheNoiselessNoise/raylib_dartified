part of '../../../raylib_dartified_base.dart';

enum RlVertexBufferField with XFields {
  elementCount,
  vertices,
  texcoords,
  normals,
  colors,
  indices,
  vaoId,
  vboId,
}

/// RLGL Vertex buffer
class RlVertexBuffer extends XStruct<RlVertexBuffer> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<RlVertexBuffer> struct = .create(
    factory: RlVertexBuffer.new,
    layout: .aligned<RlVertexBufferField>({
      .elementCount: XInt(), // Number of elements in the buffer (QUADS)
      .vertices:     XRawPtr(XFloat()), // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
      .texcoords:    XRawPtr(XFloat()), // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
      .normals:      XRawPtr(XFloat()), // Vertex normal (XYZ - 3 components per vertex) (shader-location = 2)
      .colors:       XRawPtr(XUnsignedChar()), // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
      .indices: switch (currentMemoryPlatform.type) {
        .native   => XRawPtr(XUnsignedInt()), // Vertex indices (in case vertex data comes indexed) (6 indices per quad)
        .web      => XRawPtr(XUnsignedShort()), // Vertex indices (in case vertex data comes indexed) (6 indices per quad)
      },
      .vaoId:        XUnsignedInt(), // OpenGL Vertex Array Object id
      .vboId:        XArray(XUnsignedInt(), BASE_vboIdCount), // OpenGL Vertex Buffer Objects id (5 types of vertex data)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<RlVertexBufferField> _l = struct.layoutOf();

  /// Field descriptor for [elementCount].
  static final field_elementCount = _l.integer<XInt>(.elementCount);
  /// Field descriptor for [vertices].
  static final field_vertices = _l.ptrScalarArray<double, XFloat>(.vertices);
  /// Field descriptor for [texcoords].
  static final field_texcoords = _l.ptrScalarArray<double, XFloat>(.texcoords);
  /// Field descriptor for [normals].
  static final field_normals = _l.ptrScalarArray<double, XFloat>(.normals);
  /// Field descriptor for [colors].
  static final field_colors = _l.ptrScalarArray<int, XUnsignedChar>(.colors);
  /// Field descriptor for [indices].
  static final XPtrArrayField<int, XTypeIntLike> field_indices = switch (currentMemoryPlatform.type) {
    .native => _l.ptrScalarArray<int, XUnsignedInt>(.indices),
    .web    => _l.ptrScalarArray<int, XUnsignedShort>(.indices),
  };
  /// Field descriptor for [vaoId].
  static final field_vaoId = _l.integer<XUnsignedInt>(.vaoId);
  /// Field descriptor for [vboId].
  static final field_vboId = _l.scalarArray<int, XUnsignedInt>(.vboId);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [vertices] buffer.
  static int BASE_verticesCount(int elementCount) => elementCount > 0 ? elementCount * 3 : 0;
  
  /// Number of components in the [vertices] buffer.
  int get verticesCount => BASE_verticesCount(elementCount);

  /// Number of components in the [texcoords] buffer.
  static int BASE_texcoordsCount(int elementCount) => elementCount > 0 ? elementCount * 2 : 0;
  
  /// Number of components in the [texcoords] buffer.
  int get texcoordsCount => BASE_texcoordsCount(elementCount);

  /// Number of components in the [normals] buffer.
  static int BASE_normalsCount(int elementCount) => elementCount > 0 ? elementCount * 3 : 0;
  
  /// Number of components in the [normals] buffer.
  int get normalsCount => BASE_normalsCount(elementCount);

  /// Number of components in the [colors] buffer.
  static int BASE_colorsCount(int elementCount) => elementCount > 0 ? elementCount * 4 : 0;
  
  /// Number of components in the [colors] buffer.
  int get colorsCount => BASE_colorsCount(elementCount);

  /// Number of components in the [indices] buffer.
  static int BASE_indicesCount(int elementCount) => elementCount > 0 ? elementCount * 6 : 0;

  /// Number of components in the [indices] buffer.
  int get indicesCount => BASE_indicesCount(elementCount);
  
  /// Number of components in the [vboId] array.
  static int get BASE_vboIdCount => 5;

  /// Number of components in the [vboId] array.
  int get vboIdCount => BASE_vboIdCount;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _elementCount;
  /// Number of elements in the buffer (QUADS)
  int get elementCount => _elementCount = field_elementCount.readOr(op, _elementCount);
  set elementCount(int value) => _elementCount = field_elementCount.writeOr(op, value);

  late final XLiveList<double, XFloat> _vertices;
  /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
  XLiveList<double, XFloat> get vertices => _vertices;
  set vertices(List<double> value) => _vertices.inner = value;

  late final XLiveList<double, XFloat> _texcoords;
  /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
  XLiveList<double, XFloat> get texcoords => _texcoords;
  set texcoords(List<double> value) => _texcoords.inner = value;

  late final XLiveList<double, XFloat> _normals;
  /// Vertex normal (XYZ - 3 components per vertex) (shader-location = 2)
  XLiveList<double, XFloat> get normals => _normals;
  set normals(List<double> value) => _normals.inner = value;

  late final XLiveList<int, XUnsignedChar> _colors;
  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  XLiveList<int, XUnsignedChar> get colors => _colors;
  set colors(List<int> value) => _colors.inner = value;
  
  late final XLiveList<int, XTypeIntLike> _indices;
  /// Vertex indices (in case vertex data comes indexed) (6 indices per quad)
  XLiveList<int, XTypeIntLike> get indices => _indices;
  set indices(List<int> value) => _indices.inner = value;

  int _vaoId;
  /// OpenGL Vertex Array Object id
  int get vaoId => _vaoId = field_vaoId.readOr(op, _vaoId);
  set vaoId(int value) => _vaoId = field_vaoId.writeOr(op, value);
  
  late final XLiveList<int, XUnsignedInt> _vboId;
  /// OpenGL Vertex Buffer Objects id (5 types of vertex data)
  XLiveList<int, XUnsignedInt> get vboId => _vboId;
  set vboId(List<int> value) => _vboId.inner = value;

  RlVertexBuffer({
    super.op,
    int elementCount = 0,
    List<double>? vertices,
    List<double>? texcoords,
    List<double>? normals,
    List<int>? colors,
    List<int>? indices,
    int vaoId = 0,
    List<int>? vboId,
  }) :
    _elementCount = elementCount,
    _vaoId = vaoId
  {
    _vertices = field_vertices.live(() => op, vertices ?? .filled(verticesCount, 0));
    _texcoords = field_texcoords.live(() => op, texcoords ?? .filled(texcoordsCount, 0));
    _normals = field_normals.live(() => op, normals ?? .filled(normalsCount, 0));
    _colors = field_colors.live(() => op, colors ?? .filled(colorsCount, 0));
    _indices = field_indices.live(() => op, indices ?? .filled(indicesCount, 0));
    _vboId = field_vboId.live(() => op, vboId ?? .filled(vboIdCount, 0));
  }

  factory RlVertexBuffer.zero() => .new();

  @override
  RlVertexBuffer setDart(RlVertexBuffer o) {
    elementCount = o.elementCount;
    vertices = .from(o.vertices);
    texcoords = .from(o.texcoords);
    normals = .from(o.normals);
    colors = .from(o.colors);
    indices = .from(o.indices);
    vaoId = o.vaoId;
    vboId = .from(o.vboId);
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    field_vertices.allocate(p, '${key}_vertices', count: verticesCount, raw: true);
    field_texcoords.allocate(p, '${key}_texcoords', count: texcoordsCount, raw: true);
    field_normals.allocate(p, '${key}_normals', count: normalsCount, raw: true);
    field_colors.allocate(p, '${key}_colors', count: colorsCount, raw: true);
    field_indices.allocate(p, '${key}_indices', count: indicesCount, raw: true);
  }

  @override
  void structWriteInto(XPtr p) {
    field_elementCount.write(p, elementCount);
    vertices.writeInto(p);
    texcoords.writeInto(p);
    normals.writeInto(p);
    colors.writeInto(p);
    indices.writeInto(p);
    field_vaoId.write(p, vaoId);
    vboId.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    elementCount = field_elementCount.read(p);
    vertices.readFrom(p, count: verticesCount);
    texcoords.readFrom(p, count: texcoordsCount);
    normals.readFrom(p, count: normalsCount);
    colors.readFrom(p, count: colorsCount);
    indices.readFrom(p, count: indicesCount);
    vaoId = field_vaoId.read(p);
    vboId.readFrom(p, count: vboIdCount);
  }

  @override
  String signature() => '$structName(elementCount: $elementCount, vaoId: $vaoId, vboId: $vboId)';
}