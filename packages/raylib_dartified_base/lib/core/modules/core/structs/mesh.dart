part of '../../../raylib_dartified_base.dart';

enum MeshField with XFields {
  vertexCount,
  triangleCount,
  vertices,
  texcoords,
  texcoords2,
  normals,
  tangents,
  colors,
  indices,
  boneCount,
  boneIndices,
  boneWeights,
  animVertices,
  animNormals,
  vaoId,
  vboId,
}

/// Mesh, vertex data and vao/vbo
class Mesh extends XStruct<Mesh> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<Mesh> struct = .create(
    factory: Mesh.new,
    layout: .aligned<MeshField>({
      .vertexCount:   XInt(), // Number of vertices stored in arrays
      .triangleCount: XInt(), // Number of triangles stored (indexed or not)

      // Vertex attributes data
      .vertices:      XRawPtr(XFloat()), // Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
      .texcoords:     XRawPtr(XFloat()), // Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
      .texcoords2:    XRawPtr(XFloat()), // Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
      .normals:       XRawPtr(XFloat()), // Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
      .tangents:      XRawPtr(XFloat()), // Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
      .colors:        XRawPtr(XUnsignedChar()), // Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
      .indices:       XRawPtr(XUnsignedShort()), // Vertex indices (in case vertex data comes indexed)

      // Skin data for animation
      .boneCount:     XInt(), // Number of bones (MAX: 256 bones)
      .boneIndices:   XRawPtr(XUnsignedChar()), // Vertex bone indices, up to 4 bones influence by vertex (skinning) (shader-location = 6)
      .boneWeights:   XRawPtr(XFloat()), // Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)

      // Runtime animation vertex data (CPU skinning)
      // NOTE: In case of GPU skinning, not used, pointers are NULL
      .animVertices:  XRawPtr(XFloat()), // Animated vertex positions (after bones transformations)
      .animNormals:   XRawPtr(XFloat()), // Animated normals (after bones transformations)

      // OpenGL identifiers
      .vaoId:         XUnsignedInt(), // OpenGL Vertex Array Object id
      .vboId:         XRawPtr(XUnsignedInt()), // OpenGL Vertex Buffer Objects id (default vertex data)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<MeshField> _l = struct.layoutOf();

  /// Field descriptor for [vertexCount].
  static final field_vertexCount = _l.integer<XInt>(.vertexCount);
  /// Field descriptor for [triangleCount].
  static final field_triangleCount = _l.integer<XInt>(.triangleCount);
  /// Field descriptor for [vertices].
  static final field_vertices = _l.ptrScalarArray<double, XFloat>(.vertices);
  /// Field descriptor for [texcoords].
  static final field_texcoords = _l.ptrScalarArray<double, XFloat>(.texcoords);
  /// Field descriptor for [texcoords2].
  static final field_texcoords2 = _l.ptrScalarArray<double, XFloat>(.texcoords2);
  /// Field descriptor for [normals].
  static final field_normals = _l.ptrScalarArray<double, XFloat>(.normals);
  /// Field descriptor for [tangents].
  static final field_tangents = _l.ptrScalarArray<double, XFloat>(.tangents);
  /// Field descriptor for [colors].
  static final field_colors = _l.ptrScalarArray<int, XUnsignedChar>(.colors);
  /// Field descriptor for [indices].
  static final field_indices = _l.ptrScalarArray<int, XUnsignedShort>(.indices);
  /// Field descriptor for [boneCount].
  static final field_boneCount = _l.integer<XInt>(.boneCount);
  /// Field descriptor for [boneIndices].
  static final field_boneIndices = _l.ptrScalarArray<int, XUnsignedChar>(.boneIndices);
  /// Field descriptor for [boneWeights].
  static final field_boneWeights = _l.ptrScalarArray<double, XFloat>(.boneWeights);
  /// Field descriptor for [animVertices].
  static final field_animVertices = _l.ptrScalarArray<double, XFloat>(.animVertices);
  /// Field descriptor for [animNormals].
  static final field_animNormals = _l.ptrScalarArray<double, XFloat>(.animNormals);
  /// Field descriptor for [vaoId].
  static final field_vaoId = _l.integer<XUnsignedInt>(.vaoId);
  /// Field descriptor for [vboId].
  static final field_vboId = _l.ptrScalarArray<int, XUnsignedInt>(.vboId);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [vertices] buffer.
  static int BASE_verticesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the [vertices] buffer.
  int get verticesCount => BASE_verticesCount(vertexCount);

  /// Number of components in the [texcoords] buffer.
  static int BASE_texcoordsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 2 : 0;

  /// Number of components in the [texcoords] buffer.
  int get texcoordsCount => BASE_texcoordsCount(vertexCount);

  /// Number of components in the [texcoords2] buffer.
  static int BASE_texcoords2Count(int vertexCount) => vertexCount > 0 ? vertexCount * 2 : 0;

  /// Number of components in the [texcoords2] buffer.
  int get texcoords2Count => BASE_texcoords2Count(vertexCount);

  /// Number of components in the [normals] buffer.
  static int BASE_normalsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the [normals] buffer.
  int get normalsCount => BASE_normalsCount(vertexCount);

  /// Number of components in the [tangents] buffer.
  static int BASE_tangentsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the [tangents] buffer.
  int get tangentsCount => BASE_tangentsCount(vertexCount);

  /// Number of components in the [colors] buffer.
  static int BASE_colorsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the [colors] buffer.
  int get colorsCount => BASE_colorsCount(vertexCount);

  /// Number of components in the [indices] buffer.
  static int BASE_indicesCount(int triangleCount) => triangleCount > 0 ? triangleCount * 3 : 0;

  /// Number of components in the [indices] buffer.
  int get indicesCount => BASE_indicesCount(triangleCount);

  /// Number of components in the [boneIndices] buffer.
  static int BASE_boneIndicesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the [boneIndices] buffer.
  int get boneIndicesCount => BASE_boneIndicesCount(vertexCount);

  /// Number of components in the [boneWeights] buffer.
  static int BASE_boneWeightsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 4 : 0;

  /// Number of components in the [boneWeights] buffer.
  int get boneWeightsCount => BASE_boneWeightsCount(vertexCount);

  /// Number of components in the [animVertices] buffer.
  static int BASE_animVerticesCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the [animVertices] buffer.
  int get animVerticesCount => BASE_animVerticesCount(vertexCount);

  /// Number of components in the [animNormals] buffer.
  static int BASE_animNormalsCount(int vertexCount) => vertexCount > 0 ? vertexCount * 3 : 0;

  /// Number of components in the [animNormals] buffer.
  int get animNormalsCount => BASE_animNormalsCount(vertexCount);

  /// Number of components in the [vboId] buffer.
  static int get BASE_vboIdCount => RaylibConfig.maxMeshVertexBuffers;

  /// Number of components in the [vboId] buffer.
  int get vboIdCount => BASE_vboIdCount;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _vertexCount;
  /// Number of vertices stored in arrays
  int get vertexCount => _vertexCount = field_vertexCount.readOr(op, _vertexCount);
  set vertexCount(int value) => _vertexCount = field_vertexCount.writeOr(op, value);

  int _triangleCount;
  /// Number of triangles stored (indexed or not)
  int get triangleCount => _triangleCount = field_triangleCount.readOr(op, _triangleCount);
  set triangleCount(int value) => _triangleCount = field_triangleCount.writeOr(op, value);
  
  // Vertex attributes data
  
  late final XLiveList<double, XFloat> _vertices;
  /// Vertex position (XYZ - 3 components per vertex) (shader-location = 0)
  XLiveList<double, XFloat> get vertices => _vertices;
  set vertices(List<double> value) => _vertices.inner = value;
  
  late final XLiveList<double, XFloat> _texcoords;
  /// Vertex texture coordinates (UV - 2 components per vertex) (shader-location = 1)
  XLiveList<double, XFloat> get texcoords => _texcoords;
  set texcoords(List<double> value) => _texcoords.inner = value;

  late final XLiveList<double, XFloat> _texcoords2;
  /// Vertex texture second coordinates (UV - 2 components per vertex) (shader-location = 5)
  XLiveList<double, XFloat> get texcoords2 => _texcoords2;
  set texcoords2(List<double> value) => _texcoords2.inner = value;

  late final XLiveList<double, XFloat> _normals;
  /// Vertex normals (XYZ - 3 components per vertex) (shader-location = 2)
  XLiveList<double, XFloat> get normals => _normals;
  set normals(List<double> value) => _normals.inner = value;

  late final XLiveList<double, XFloat> _tangents;
  /// Vertex tangents (XYZW - 4 components per vertex) (shader-location = 4)
  XLiveList<double, XFloat> get tangents => _tangents;
  set tangents(List<double> value) => _tangents.inner = value;

  late final XLiveList<int, XUnsignedChar> _colors;
  /// Vertex colors (RGBA - 4 components per vertex) (shader-location = 3)
  XLiveList<int, XUnsignedChar> get colors => _colors;
  set colors(List<int> value) => _colors.inner = value;

  late final XLiveList<int, XUnsignedShort> _indices;
  /// Vertex indices (in case vertex data comes indexed)
  XLiveList<int, XUnsignedShort> get indices => _indices;
  set indices(List<int> value) => _indices.inner = value;

  // Skin data for animation

  int _boneCount;
  // Number of bones (MAX: 256 bones)
  int get boneCount => _boneCount = field_boneCount.readOr(op, _boneCount);
  set boneCount(int value) => _boneCount = field_boneCount.writeOr(op, value);

  late final XLiveList<int, XUnsignedChar> _boneIndices;
  /// Vertex bone indices, up to 4 bones influence by vertex (skinning) (shader-location = 6)
  XLiveList<int, XUnsignedChar> get boneIndices => _boneIndices;
  set boneIndices(List<int> value) => _boneIndices.inner = value;
  
  late final XLiveList<double, XFloat> _boneWeights;
  /// Vertex bone weight, up to 4 bones influence by vertex (skinning) (shader-location = 7)
  XLiveList<double, XFloat> get boneWeights => _boneWeights;
  set boneWeights(List<double> value) => _boneWeights.inner = value;

  // Animation vertex data

  late final XLiveList<double, XFloat> _animVertices;
  /// Animated vertex positions (after bones transformations)
  XLiveList<double, XFloat> get animVertices => _animVertices;
  set animVertices(List<double> value) => _animVertices.inner = value;

  late final XLiveList<double, XFloat> _animNormals;
  /// Animated normals (after bones transformations)
  XLiveList<double, XFloat> get animNormals => _animNormals;
  set animNormals(List<double> value) => _animNormals.inner = value;

  int _vaoId;
  /// OpenGL Vertex Array Object id
  int get vaoId => _vaoId = field_vaoId.readOr(op, _vaoId);
  set vaoId(int value) => _vaoId = field_vaoId.writeOr(op, value);

  late final XLiveList<int, XUnsignedInt> _vboId;
  /// OpenGL Vertex Buffer Objects id (default vertex data)
  XLiveList<int, XUnsignedInt> get vboId => _vboId;
  set vboId(List<int> value) => _vboId.inner = value;

  Mesh({
    super.op,
    int vertexCount = 0,
    int triangleCount = 0,
    int boneCount = 0,
    List<double>? vertices,
    List<double>? texcoords,
    List<double>? texcoords2,
    List<double>? normals,
    List<double>? tangents,
    List<int>? colors,
    List<int>? indices,
    List<int>? boneIndices,
    List<double>? boneWeights,
    List<double>? animVertices,
    List<double>? animNormals,
    int vaoId = 0,
    List<int>? vboId,
  }) :
    _vertexCount = vertexCount,
    _triangleCount = triangleCount,
    _boneCount = boneCount,
    _vaoId = vaoId
  {
    _vertices = field_vertices.live(() => op, vertices ?? []);
    _texcoords = field_texcoords.live(() => op, texcoords ?? []);
    _texcoords2 = field_texcoords2.live(() => op, texcoords2 ?? []);
    _normals = field_normals.live(() => op, normals ?? []);
    _tangents = field_tangents.live(() => op, tangents ?? []);
    _colors = field_colors.live(() => op, colors ?? []);
    _indices = field_indices.live(() => op, indices ?? []);
    _boneIndices = field_boneIndices.live(() => op, boneIndices ?? []);
    _boneWeights = field_boneWeights.live(() => op, boneWeights ?? []);
    _animVertices = field_animVertices.live(() => op, animVertices ?? []);
    _animNormals = field_animNormals.live(() => op, animNormals ?? []);
    _vboId = field_vboId.live(() => op, vboId ?? []);
  }

  factory Mesh.zero() => .new();

  @override
  Mesh setDart(Mesh o) {
    vertexCount = o.vertexCount;
    triangleCount = o.triangleCount;
    boneCount = o.boneCount;
    vertices = .from(o.vertices);
    texcoords = .from(o.texcoords);
    texcoords2 = .from(o.texcoords2);
    normals = .from(o.normals);
    tangents = .from(o.tangents);
    colors = .from(o.colors);
    indices = .from(o.indices);
    boneCount = o.boneCount;
    boneIndices = .from(o.boneIndices);
    boneWeights = .from(o.boneWeights);
    animVertices = .from(o.animVertices);
    animNormals = .from(o.animNormals);
    vaoId = o.vaoId;
    vboId = .from(o.vboId);
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    if (vertices.isNotEmpty) field_vertices.allocate(p, '${key}_vertices', count: verticesCount, raw: true);
    if (texcoords.isNotEmpty) field_texcoords.allocate(p, '${key}_texcoords', count: texcoordsCount, raw: true);
    if (texcoords2.isNotEmpty) field_texcoords2.allocate(p, '${key}_texcoords2', count: texcoords2Count, raw: true);
    if (normals.isNotEmpty) field_normals.allocate(p, '${key}_normals', count: normalsCount, raw: true);
    if (tangents.isNotEmpty) field_tangents.allocate(p, '${key}_tangents', count: tangentsCount, raw: true);
    if (colors.isNotEmpty) field_colors.allocate(p, '${key}_colors', count: colorsCount, raw: true);
    if (indices.isNotEmpty) field_indices.allocate(p, '${key}_indices', count: indicesCount, raw: true);
    if (animVertices.isNotEmpty) field_animVertices.allocate(p, '${key}_animVertices', count: animVerticesCount, raw: true);
    if (animNormals.isNotEmpty) field_animNormals.allocate(p, '${key}_animNormals', count: animNormalsCount, raw: true);
    if (!RaylibConfig.SUPPORT_GPU_SKINNING) {
      if (boneIndices.isNotEmpty) field_boneIndices.allocate(p, '${key}_boneIndices', count: boneIndicesCount, raw: true);
      if (boneWeights.isNotEmpty) field_boneWeights.allocate(p, '${key}_boneWeights', count: boneWeightsCount, raw: true);
    }
  }

  @override
  void structWriteInto(XPtr p) {
    field_vertexCount.write(p, vertexCount);
    field_triangleCount.write(p, triangleCount);
    vertices.writeInto(p, vertices.inner);
    texcoords.writeInto(p, texcoords.inner);
    texcoords2.writeInto(p, texcoords2.inner);
    normals.writeInto(p, normals.inner);
    tangents.writeInto(p, tangents.inner);
    colors.writeInto(p, colors.inner);
    indices.writeInto(p, indices.inner);
    field_boneCount.write(p, boneCount);
    boneIndices.writeInto(p, boneIndices.inner);
    boneWeights.writeInto(p, boneWeights.inner);
    animVertices.writeInto(p, animVertices.inner);
    animNormals.writeInto(p, animNormals.inner);
    field_vaoId.write(p, vaoId);
    vboId.writeInto(p, vboId.inner);
  }

  @override
  void structReadFrom(XPtr p) {
    vertexCount = field_vertexCount.read(p);
    triangleCount = field_triangleCount.read(p);
    vertices.readFrom(p, count: verticesCount);
    texcoords.readFrom(p, count: texcoordsCount);
    texcoords2.readFrom(p, count: texcoords2Count);
    normals.readFrom(p, count: normalsCount);
    tangents.readFrom(p, count: tangentsCount);
    colors.readFrom(p, count: colorsCount);
    indices.readFrom(p, count: indicesCount);
    boneCount = field_boneCount.read(p);
    boneIndices.readFrom(p, count: boneIndicesCount);
    boneWeights.readFrom(p, count: boneWeightsCount);
    animVertices.readFrom(p, count: animVerticesCount);
    animNormals.readFrom(p, count: animNormalsCount);
    vaoId = field_vaoId.read(p);
    vboId.readFrom(p, count: vboIdCount);
  }

  @override
  String signature() => '$structName(vertexCount: $vertexCount, triangleCount: $triangleCount, boneCount: $boneCount, vaoId: $vaoId)';
}