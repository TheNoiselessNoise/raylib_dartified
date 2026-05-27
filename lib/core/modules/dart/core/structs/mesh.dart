part of '../../../../raylib_dartified.dart';

extension MeshCPEx on Pointer<MeshC> {
  Pointer<MeshC> setC(MeshC o) { ref.setC(o); return this; }
  Pointer<MeshC> setD(MeshD o) { ref.setD(o); return this; }
  MeshD toD() => ref.toD(this);
}

extension MeshCEx on MeshC {
  int get verticesCount => MeshBase.BASE_verticesCount(vertexCount);
  int get texcoordsCount => MeshBase.BASE_texcoordsCount(vertexCount);
  int get texcoords2Count => MeshBase.BASE_texcoords2Count(vertexCount);
  int get normalsCount => MeshBase.BASE_normalsCount(vertexCount);
  int get tangentsCount => MeshBase.BASE_tangentsCount(vertexCount);
  int get colorsCount => MeshBase.BASE_colorsCount(vertexCount);
  int get indicesCount => MeshBase.BASE_indicesCount(triangleCount);
  int get animVerticesCount => MeshBase.BASE_animVerticesCount(vertexCount);
  int get animNormalsCount => MeshBase.BASE_animNormalsCount(vertexCount);
  int get boneIdsCount => MeshBase.BASE_boneIdsCount(vertexCount);
  int get boneWeightsCount => MeshBase.BASE_boneWeightsCount(vertexCount);
  int get boneMatricesCount => MeshBase.BASE_boneMatricesCount(boneCount);
  int get vboIdCount => MeshBase.BASE_vboIdCount;

  MeshC setC(MeshC o) {
    vertexCount = o.vertexCount;
    triangleCount = o.triangleCount;
    vertices = o.vertices;
    texcoords = o.texcoords;
    texcoords2 = o.texcoords2;
    normals = o.normals;
    tangents = o.tangents;
    colors = o.colors;
    indices = o.indices;
    animVertices = o.animVertices;
    animNormals = o.animNormals;
    boneIds = o.boneIds;
    boneWeights = o.boneWeights;
    boneMatrices = o.boneMatrices;
    boneCount = o.boneCount;
    vaoId = o.vaoId;
    vboId = o.vboId;
    return this;
  }

  MeshC setD(MeshD o) {
    o.structOnOp((p) {
      vertexCount = p.ref.vertexCount;
      triangleCount = p.ref.triangleCount;
      vertices = p.ref.vertices;
      texcoords = p.ref.texcoords;
      texcoords2 = p.ref.texcoords2;
      normals = p.ref.normals;
      tangents = p.ref.tangents;
      colors = p.ref.colors;
      indices = p.ref.indices;
      animVertices = p.ref.animVertices;
      animNormals = p.ref.animNormals;
      boneIds = p.ref.boneIds;
      boneWeights = p.ref.boneWeights;
      boneMatrices = p.ref.boneMatrices;
      boneCount = p.ref.boneCount;
      vaoId = p.ref.vaoId;
      vboId = p.ref.vboId;
    });
    return this;
  }

  MeshD toD([Pointer<MeshC>? ptr]) => .new(
    originalPointer: ptr,
    vertexCount: vertexCount,
    triangleCount: triangleCount,
    boneCount: boneCount,
    vertices: vertices.address != 0 ? .generate(verticesCount, (i) => (vertices + i).value) : [],
    texcoords: texcoords.address != 0 ? .generate(texcoordsCount, (i) => (texcoords + i).value) : [],
    texcoords2: texcoords2.address != 0 ? .generate(texcoords2Count, (i) => (texcoords2 + i).value) : [],
    normals: normals.address != 0 ? .generate(normalsCount, (i) => (normals + i).value) : [],
    tangents: tangents.address != 0 ? .generate(tangentsCount, (i) => (tangents + i).value) : [],
    colors: colors.address != 0 ? .generate(colorsCount, (i) => (colors + i).value) : [],
    indices: indices.address != 0 ? .generate(indicesCount, (i) => (indices + i).value) : [],
    animVertices: animVertices.address != 0 ? .generate(animVerticesCount, (i) => (animVertices + i).value) : [],
    animNormals: animNormals.address != 0 ? .generate(animNormalsCount, (i) => (animNormals + i).value) : [],
    boneIds: boneIds.address != 0 ? .generate(boneIdsCount, (i) => (boneIds + i).value) : [],
    boneWeights: boneWeights.address != 0 ? .generate(boneWeightsCount, (i) => (boneWeights + i).value) : [],
    boneMatrices: boneMatrices.address != 0 ? .generate(boneMatricesCount, (i) => (boneMatrices + i).toD()) : [],
    vaoId: vaoId,
    vboId: vboId.address != 0 ? .generate(vboIdCount, (i) => (vboId + i).value) : [],
  );
}

class MeshD extends StructD<MeshC, MeshD> with MeshBase<
  MeshD,
  MatrixD,
  Vector3D,
  QuaternionD,
  Vector4D
> {
  int _vertexCount;
  @override get vertexCount {
    structOnOp((p) => _vertexCount = p.ref.vertexCount);
    return _vertexCount;
  }
  @override set vertexCount(int value) {
    _vertexCount = value;
    structOnOp((p) => p.ref.vertexCount = value);
  }
  
  int _triangleCount;
  @override get triangleCount {
    structOnOp((p) => _triangleCount = p.ref.triangleCount);
    return _triangleCount;
  }
  @override set triangleCount(int value) {
    _triangleCount = value;
    structOnOp((p) => p.ref.triangleCount = value);
  }
  
  int _boneCount;
  @override get boneCount {
    structOnOp((p) => _boneCount = p.ref.boneCount);
    return _boneCount;
  }
  @override set boneCount(int value) {
    _boneCount = value;
    structOnOp((p) => p.ref.boneCount = value);
  }
  
  late NativeLiveListPointerFloat _vertices;
  @override get vertices {
    structOnOp((p) => _vertices.ptr = p.ref.vertices);
    return _vertices;
  }
  @override set vertices(List<double> value) {
    assert(value.length <= verticesCount);
    structOnOp((p) => _vertices.ptr = p.ref.vertices);
    _vertices.inner = value;
  }
  
  late NativeLiveListPointerFloat _texcoords;
  @override get texcoords {
    structOnOp((p) => _texcoords.ptr = p.ref.texcoords);
    return _texcoords;
  }
  @override set texcoords(List<double> value) {
    assert(value.length <= texcoordsCount);
    structOnOp((p) => _texcoords.ptr = p.ref.texcoords);
    _texcoords.inner = value;
  }
  
  late NativeLiveListPointerFloat _texcoords2;
  @override get texcoords2 {
    structOnOp((p) => _texcoords2.ptr = p.ref.texcoords2);
    return _texcoords2;
  }
  @override set texcoords2(List<double> value) {
    assert(value.length <= texcoords2Count);
    structOnOp((p) => _texcoords2.ptr = p.ref.texcoords2);
    _texcoords2.inner = value;
  }
  
  late NativeLiveListPointerFloat _normals;
  @override get normals {
    structOnOp((p) => _normals.ptr = p.ref.normals);
    return _normals;
  }
  @override set normals(List<double> value) {
    assert(value.length <= normalsCount);
    structOnOp((p) => _normals.ptr = p.ref.normals);
    _normals.inner = value;
  }
  
  late NativeLiveListPointerFloat _tangents;
  @override get tangents {
    structOnOp((p) => _tangents.ptr = p.ref.tangents);
    return _tangents;
  }
  @override set tangents(List<double> value) {
    assert(value.length <= tangentsCount);
    structOnOp((p) => _tangents.ptr = p.ref.tangents);
    _tangents.inner = value;
  }
  
  late NativeLiveListPointerUnsignedChar _colors;
  @override get colors {
    structOnOp((p) => _colors.ptr = p.ref.colors);
    return _colors;
  }
  @override set colors(List<int> value) {
    assert(value.length <= colorsCount);
    structOnOp((p) => _colors.ptr = p.ref.colors);
    _colors.inner = value;
  }
  
  late NativeLiveListPointerUnsignedShort _indices;
  @override get indices {
    structOnOp((p) => _indices.ptr = p.ref.indices);
    return _indices;
  }
  @override set indices(List<int> value) {
    assert(value.length <= indicesCount);
    structOnOp((p) => _indices.ptr = p.ref.indices);
    _indices.inner = value;
  }
  
  late NativeLiveListPointerFloat _animVertices;
  @override get animVertices {
    structOnOp((p) => _animVertices.ptr = p.ref.animVertices);
    return _animVertices;
  }
  @override set animVertices(List<double> value) {
    assert(value.length <= animVerticesCount);
    structOnOp((p) => _animVertices.ptr = p.ref.animVertices);
    _animVertices.inner = value;
  }
  
  late NativeLiveListPointerFloat _animNormals;
  @override get animNormals {
    structOnOp((p) => _animNormals.ptr = p.ref.animNormals);
    return _animNormals;
  }
  @override set animNormals(List<double> value) {
    assert(value.length <= animNormalsCount);
    structOnOp((p) => _animNormals.ptr = p.ref.animNormals);
    _animNormals.inner = value;
  }
  
  late NativeLiveListPointerUnsignedChar _boneIds;
  @override get boneIds {
    structOnOp((p) => _boneIds.ptr = p.ref.boneIds);
    return _boneIds;
  }
  @override set boneIds(List<int> value) {
    assert(value.length <= boneIdsCount);
    structOnOp((p) => _boneIds.ptr = p.ref.boneIds);
    _boneIds.inner = value;
  }
  
  late NativeLiveListPointerFloat _boneWeights;
  @override get boneWeights {
    structOnOp((p) => _boneWeights.ptr = p.ref.boneWeights);
    return _boneWeights;
  }
  @override set boneWeights(List<double> value) {
    assert(value.length <= boneWeightsCount);
    structOnOp((p) => _boneWeights.ptr = p.ref.boneWeights);
    _boneWeights.inner = value;
  }
  
  late NativeLiveListPointerStruct<MatrixC, MatrixD> _boneMatrices;
  @override get boneMatrices {
    structOnOp((p) => _boneMatrices.ptr = p.ref.boneMatrices);
    return _boneMatrices;
  }
  @override set boneMatrices(List<MatrixD> value) {
    assert(value.length <= boneMatricesCount);
    structOnOp((p) => _boneMatrices.ptr = p.ref.boneMatrices);
    _boneMatrices.inner = value;
  }
  
  int _vaoId;
  @override get vaoId {
    structOnOp((p) => _vaoId = p.ref.vaoId);
    return _vaoId;
  }
  @override set vaoId(int value) {
    _vaoId = value;
    structOnOp((p) => p.ref.vaoId = value);
  }
  
  late NativeLiveListPointerUnsignedInt _vboId;
  @override get vboId {
    structOnOp((p) => _vboId.ptr = p.ref.vboId);
    return _vboId;
  }
  @override set vboId(List<int> value) {
    assert(value.length <= vboIdCount);
    structOnOp((p) => _vboId.ptr = p.ref.vboId);
    _vboId.inner = value;
  }

  MeshD({
    super.originalPointer,
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
    List<double>? animVertices,
    List<double>? animNormals,
    List<int>? boneIds,
    List<double>? boneWeights,
    List<MatrixD>? boneMatrices,
    int vaoId = 0,
    List<int>? vboId,
  }) :
    _vertexCount = vertexCount,
    _triangleCount = triangleCount,
    _boneCount = boneCount,
    _vaoId = vaoId
  {
    _vertices = .new(vertices ?? [], originalPointer?.ref.vertices);
    _texcoords = .new(texcoords ?? [], originalPointer?.ref.texcoords);
    _texcoords2 = .new(texcoords2 ?? [], originalPointer?.ref.texcoords2);
    _normals = .new(normals ?? [], originalPointer?.ref.normals);
    _tangents = .new(tangents ?? [], originalPointer?.ref.tangents);
    _colors = .new(colors ?? [], originalPointer?.ref.colors);
    _indices = .new(indices ?? [], originalPointer?.ref.indices);
    _animVertices = .new(animVertices ?? [], originalPointer?.ref.animVertices);
    _animNormals = .new(animNormals ?? [], originalPointer?.ref.animNormals);
    _boneIds = .new(boneIds ?? [], originalPointer?.ref.boneIds);
    _boneWeights = .new(boneWeights ?? [], originalPointer?.ref.boneWeights);
    _boneMatrices = .new(boneMatrices ?? [], originalPointer?.ref.boneMatrices);
    _vboId = .new(vboId ?? [], originalPointer?.ref.vboId);
  }

  factory MeshD.zero() => .new();

  @override
  MeshD setD(MeshD o) {
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
    animVertices = .from(o.animVertices);
    animNormals = .from(o.animNormals);
    boneIds = .from(o.boneIds);
    boneWeights = .from(o.boneWeights);
    boneMatrices = o.boneMatrices.map((x) => x.clone()).toList();
    vaoId = o.vaoId;
    vboId = .from(o.vboId);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<MeshC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<MeshC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<MeshC> p, String key) {
    p.ref.vertices = vertices.isNotEmpty ? temp.Float32$.RawArray(vertices) : nullptr;
    p.ref.texcoords = texcoords.isNotEmpty ? temp.Float32$.RawArray(texcoords) : nullptr;
    p.ref.texcoords2 = texcoords2.isNotEmpty ? temp.Float32$.RawArray(texcoords2) : nullptr;
    p.ref.normals = normals.isNotEmpty ? temp.Float32$.RawArray(normals) : nullptr;
    p.ref.tangents = tangents.isNotEmpty ? temp.Float32$.RawArray(tangents) : nullptr;
    p.ref.colors = colors.isNotEmpty ? temp.UnsignedChar$.RawArray(colors) : nullptr;
    p.ref.indices = indices.isNotEmpty ? temp.UnsignedShort$.RawArray(indices) : nullptr;
    p.ref.animVertices = animVertices.isNotEmpty ? temp.Float32$.RawArray(animVertices) : nullptr;
    p.ref.animNormals = animNormals.isNotEmpty ? temp.Float32$.RawArray(animNormals) : nullptr;
    p.ref.boneIds = boneIds.isNotEmpty ? temp.UnsignedChar$.RawArray(boneIds) : nullptr;
    p.ref.boneWeights = boneWeights.isNotEmpty ? temp.Float32$.RawArray(boneWeights) : nullptr;
    p.ref.boneMatrices = boneMatrices.isNotEmpty ? temp.Matrix$.RawArray(boneMatrices) : nullptr;
    p.ref.vboId = nullptr;
  }

  @override
  void nativeWriteInto(MeshC p) {
    p.vertexCount = vertexCount;
    p.triangleCount = triangleCount;
    p.triangleCount = triangleCount;
    p.boneCount = boneCount;
    p.vaoId = vaoId;

    structOnOp((o) {
      p.vertexCount = o.ref.vertexCount;
      p.triangleCount = o.ref.triangleCount;
      p.triangleCount = o.ref.triangleCount;
      p.boneCount = o.ref.boneCount;
      p.vaoId = o.ref.vaoId;

      p.vertices = o.ref.vertices;
      p.texcoords = o.ref.texcoords;
      p.texcoords2 = o.ref.texcoords2;
      p.normals = o.ref.normals;
      p.tangents = o.ref.tangents;
      p.colors = o.ref.colors;
      p.indices = o.ref.indices;
      p.animVertices = o.ref.animVertices;
      p.animNormals = o.ref.animNormals;
      p.boneIds = o.ref.boneIds;
      p.boneWeights = o.ref.boneWeights;
      p.boneMatrices = o.ref.boneMatrices;
      p.vboId = o.ref.vboId;
    });

    if (p.vertices.address != 0) {
      for (int i = 0; i < vertices.length; i++) {
        p.vertices[i] = _vertices.inner[i];
      }
    }

    if (p.texcoords.address != 0) {
      for (int i = 0; i < texcoords.length; i++) {
        p.texcoords[i] = _texcoords.inner[i];
      }
    }

    if (p.texcoords2.address != 0) {
      for (int i = 0; i < texcoords2.length; i++) {
        p.texcoords2[i] = _texcoords2.inner[i];
      }
    }

    if (p.normals.address != 0) {
      for (int i = 0; i < normals.length; i++) {
        p.normals[i] = _normals.inner[i];
      }
    }

    if (p.tangents.address != 0) {
      for (int i = 0; i < tangents.length; i++) {
        p.tangents[i] = _tangents.inner[i];
      }
    }

    if (p.colors.address != 0) {
      for (int i = 0; i < colors.length; i++) {
        p.colors[i] = _colors.inner[i];
      }
    }

    if (p.indices.address != 0) {
      for (int i = 0; i < indices.length; i++) {
        p.indices[i] = _indices.inner[i];
      }
    }

    if (p.animVertices.address != 0) {
      for (int i = 0; i < animVertices.length; i++) {
        p.animVertices[i] = _animVertices.inner[i];
      }
    }

    if (p.animNormals.address != 0) {
      for (int i = 0; i < animNormals.length; i++) {
        p.animNormals[i] = _animNormals.inner[i];
      }
    }

    if (p.boneIds.address != 0) {
      for (int i = 0; i < boneIds.length; i++) {
        p.boneIds[i] = _boneIds.inner[i];
      }
    }

    if (p.boneWeights.address != 0) {
      for (int i = 0; i < boneWeights.length; i++) {
        p.boneWeights[i] = _boneWeights.inner[i];
      }
    }

    if (p.boneMatrices.address != 0) {
      for (int i = 0; i < boneMatrices.length; i++) {
        _boneMatrices.inner[i].nativeWriteInto((p.boneMatrices + i).ref);
      }
    }

    if (p.vboId.address != 0) {
      for (int i = 0; i < vboId.length; i++) {
        p.vboId[i] = _vboId.inner[i];
      }
    }
  }

  @override
  void nativeReadFrom(MeshC p) {
    structOnOp((o) {
      o.ref.vertexCount = p.vertexCount;
      o.ref.triangleCount = p.triangleCount;
      o.ref.boneCount = p.boneCount;
      o.ref.vertices = p.vertices;
      o.ref.texcoords = p.texcoords;
      o.ref.texcoords2 = p.texcoords2;
      o.ref.normals = p.normals;
      o.ref.tangents = p.tangents;
      o.ref.colors = p.colors;
      o.ref.indices = p.indices;
      o.ref.animVertices = p.animVertices;
      o.ref.animNormals = p.animNormals;
      o.ref.boneIds = p.boneIds;
      o.ref.boneWeights = p.boneWeights;
      o.ref.boneMatrices = p.boneMatrices;
      o.ref.vboId = p.vboId;
    });
    vertexCount = p.vertexCount;
    triangleCount = p.triangleCount;
    boneCount = p.boneCount;
    if (vertexCount > 0 && p.vertices.address != 0) vertices = .generate(verticesCount, (i) => (p.vertices + i).value);
    if (vertexCount > 0 && p.texcoords.address != 0) texcoords = .generate(texcoordsCount, (i) => (p.texcoords + i).value);
    if (vertexCount > 0 && p.texcoords2.address != 0) texcoords2 = .generate(texcoords2Count, (i) => (p.texcoords2 + i).value);
    if (vertexCount > 0 && p.normals.address != 0) normals = .generate(normalsCount, (i) => (p.normals + i).value);
    if (vertexCount > 0 && p.tangents.address != 0) tangents = .generate(tangentsCount, (i) => (p.tangents + i).value);
    if (vertexCount > 0 && p.colors.address != 0) colors = .generate(colorsCount, (i) => (p.colors + i).value);
    if (triangleCount > 0 && p.indices.address != 0) indices = .generate(indicesCount, (i) => (p.indices + i).value);
    if (vertexCount > 0 && p.animVertices.address != 0) animVertices = .generate(animVerticesCount, (i) => (p.animVertices + i).value);
    if (vertexCount > 0 && p.animNormals.address != 0) animNormals = .generate(animNormalsCount, (i) => (p.animNormals + i).value);
    if (vertexCount > 0 && p.boneIds.address != 0) boneIds = .generate(boneIdsCount, (i) => (p.boneIds + i).value);
    if (vertexCount > 0 && p.boneWeights.address != 0) boneWeights = .generate(boneWeightsCount, (i) => (p.boneWeights + i).value);
    if (p.boneMatrices.address != 0) boneMatrices = .generate(boneMatricesCount, (i) => (p.boneMatrices + i).toD());
    vaoId = p.vaoId;
    if (p.vboId.address != 0) vboId = .generate(vboIdCount, (i) => (p.vboId + i).value);
  }

  @override
  MeshD clone() => .new(
    originalPointer: originalPointer,
    vertexCount: vertexCount,
    triangleCount: triangleCount,
    boneCount: boneCount,
    vertices: .from(vertices),
    texcoords: .from(texcoords),
    texcoords2: .from(texcoords2),
    normals: .from(normals),
    tangents: .from(tangents),
    colors: .from(colors),
    indices: .from(indices),
    animVertices: .from(animVertices),
    animNormals: .from(animNormals),
    boneIds: .from(boneIds),
    boneWeights: .from(boneWeights),
    boneMatrices: boneMatrices.map((x) => x.clone()).toList(),
    vaoId: vaoId,
    vboId: .from(vboId),
  );
}