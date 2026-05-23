part of '../../../../raylib_dartified.dart';

extension RlVertexBufferCPEx on Pointer<RlVertexBufferC> {
  Pointer<RlVertexBufferC> setC(RlVertexBufferC o) { ref.setC(o); return this; }
  Pointer<RlVertexBufferC> setD(RlVertexBufferD o) { ref.setD(o); return this; }
  RlVertexBufferD toD() => ref.toD(this);
}

extension RlVertexBufferCEx on RlVertexBufferC {
  int get verticesCount => RlVertexBufferBase.BASE_verticesCount(elementCount);
  int get texcoordsCount => RlVertexBufferBase.BASE_texcoordsCount(elementCount);
  int get normalsCount => RlVertexBufferBase.BASE_normalsCount(elementCount);
  int get colorsCount => RlVertexBufferBase.BASE_colorsCount(elementCount);
  int get indicesCount => RlVertexBufferBase.BASE_indicesCount(elementCount);
  int get vboIdCount => RlVertexBufferBase.BASE_vboIdCount;

  RlVertexBufferC setC(RlVertexBufferC o) {
    elementCount = o.elementCount;
    vertices = o.vertices;
    texcoords = o.texcoords;
    normals = o.normals;
    colors = o.colors;
    indices = o.indices;
    vaoId = o.vaoId;
    for (var i = 0; i < vboIdCount; i++) {
      vboId[i] = o.vboId[i];
    }
    return this;
  }

  RlVertexBufferC setD(RlVertexBufferD o) {
    elementCount = o.elementCount;
    o.structOnOriginalPointer((p) {
      vertices = p.ref.vertices;
      texcoords = p.ref.texcoords;
      normals = p.ref.normals;
      colors = p.ref.colors;
      indices = p.ref.indices;
    });
    if (vertices.address != 0) {
      for (var i = 0; i < o.vertices.length; i++) {
        vertices[i]  = o.vertices[i];
      }
    }
    if (texcoords.address != 0) {
      for (var i = 0; i < o.texcoords.length; i++) {
        texcoords[i] = o.texcoords[i];
      }
    }
    if (normals.address != 0) {
      for (var i = 0; i < o.normals.length; i++) {
        normals[i] = o.normals[i];
      }
    }
    if (colors.address != 0) {
      for (var i = 0; i < o.colors.length; i++) {
        colors[i]  = o.colors[i];
      }
    }
    if (indices.address != 0) {
      for (var i = 0; i < o.indices.length; i++) {
        indices[i] = o.indices[i];
      }
    }
    vaoId = o.vaoId;
    for (var i = 0; i < vboIdCount; i++) {
      vboId[i] = o.vboId[i];
    }
    return this;
  }

  RlVertexBufferD toD([Pointer<RlVertexBufferC>? ptr]) => .new(
    originalPointer: ptr,
    elementCount: elementCount,
    vertices: vertices.address != 0
      ? .generate(verticesCount, (i) => vertices[i].toDouble())
      : [],
    texcoords: texcoords.address != 0
      ? .generate(texcoordsCount, (i) => texcoords[i].toDouble())
      : [],
    normals: normals.address != 0
      ? .generate(normalsCount, (i) => normals[i].toDouble())
      : [],
    colors: colors.address != 0
      ? .generate(colorsCount, (i) => colors[i])
      : [],
    indices: indices.address != 0
      ? .generate(indicesCount, (i) => indices[i])
      : [],
    vaoId: vaoId,
    vboId: .generate(vboIdCount, (i) => vboId[i]),
  );
}

class RlVertexBufferD extends StructD<RlVertexBufferC, RlVertexBufferD> with RlVertexBufferBase<RlVertexBufferD> {
  int _elementCount;
  @override get elementCount {
    structOnOriginalPointer((p) => _elementCount = p.ref.elementCount);
    return _elementCount;
  }
  @override set elementCount(int value) {
    _elementCount = value;
    structOnOriginalPointer((p) => p.ref.elementCount = value);
  }

  late NativeLiveListPointerFloat _vertices;
  @override get vertices {
    structOnOriginalPointer((p) => _vertices.ptr = p.ref.vertices);
    return _vertices;
  }
  @override set vertices(List<double> value) {
    assert(value.length <= verticesCount);
    structOnOriginalPointer((p) => _vertices.ptr = p.ref.vertices);
    _vertices.inner = value;
  }

  late NativeLiveListPointerFloat _texcoords;
  @override get texcoords {
    structOnOriginalPointer((p) => _texcoords.ptr = p.ref.texcoords);
    return _texcoords;
  }
  @override set texcoords(List<double> value) {
    assert(value.length <= texcoordsCount);
    structOnOriginalPointer((p) => _texcoords.ptr = p.ref.texcoords);
    _texcoords.inner = value;
  }

  late NativeLiveListPointerFloat _normals;
  @override get normals {
    structOnOriginalPointer((p) => _normals.ptr = p.ref.normals);
    return _normals;
  }
  @override set normals(List<double> value) {
    assert(value.length <= normalsCount);
    structOnOriginalPointer((p) => _normals.ptr = p.ref.normals);
    _normals.inner = value;
  }

  late NativeLiveListPointerUnsignedChar _colors;
  @override get colors {
    structOnOriginalPointer((p) => _colors.ptr = p.ref.colors);
    return _colors;
  }
  @override set colors(List<int> value) {
    assert(value.length <= colorsCount);
    structOnOriginalPointer((p) => _colors.ptr = p.ref.colors);
    _colors.inner = value;
  }

  late NativeLiveListPointerUnsignedInt _indices;
  @override get indices {
    structOnOriginalPointer((p) => _indices.ptr = p.ref.indices);
    return _indices;
  }
  @override set indices(List<int> value) {
    assert(value.length <= indicesCount);
    structOnOriginalPointer((p) => _indices.ptr = p.ref.indices);
    _indices.inner = value;
  }

  int _vaoId;
  @override get vaoId {
    structOnOriginalPointer((p) => _vaoId = p.ref.vaoId);
    return _vaoId;
  }
  @override set vaoId(int value) {
    _vaoId = value;
    structOnOriginalPointer((p) => p.ref.vaoId = value);
  }

  late NativeLiveListArrayUnsignedInt _vboId;
  @override get vboId {
    structOnOriginalPointer((p) => _vboId.ptr = p.ref.vboId);
    return _vboId;
  }
  @override set vboId(List<int> value) {
    assert(value.length <= vboIdCount);
    structOnOriginalPointer((p) => _vboId.ptr = p.ref.vboId);
    _vboId.inner = value;
  }

  RlVertexBufferD({
    super.originalPointer,
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
    _vertices = .new(vertices ?? [], originalPointer?.ref.vertices);
    _texcoords = .new(texcoords ?? [], originalPointer?.ref.texcoords);
    _normals = .new(normals ?? [], originalPointer?.ref.normals);
    _colors = .new(colors ?? [], originalPointer?.ref.colors);
    _indices = .new(indices ?? [], originalPointer?.ref.indices);
    _vboId = .new(vboId ?? [], originalPointer?.ref.vboId);
  }

  factory RlVertexBufferD.zero() => .new();

  @override
  RlVertexBufferD setD(RlVertexBufferD o) {
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
  nativeGetIndexedReference(Pointer<RlVertexBufferC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<RlVertexBufferC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<RlVertexBufferC> p, String key) {
    p.ref.vertices = temp.Float32$.Array(vertices, key: '${key}_vertices');
    p.ref.texcoords = temp.Float32$.Array(texcoords, key: '${key}_texcoords');
    p.ref.normals = temp.Float32$.Array(normals, key: '${key}_normals');
    p.ref.colors = temp.UnsignedChar$.Array(colors, key: '${key}_colors');
    p.ref.indices = temp.UnsignedInt$.Array(indices, key: '${key}_indices');
  }

  @override
  void nativeWriteInto(RlVertexBufferC p) {
    p.elementCount = elementCount;
    p.vaoId = vaoId;

    for (var i = 0; i < vboIdCount; i++) {
      p.vboId[i] = _vboId.inner[i];
    }

    if (p.vertices.address != 0) {
      for (var i = 0; i < vertices.length; i++) {
        p.vertices[i] = _vertices.inner[i];
      }
    }

    if (p.texcoords.address != 0) {
      for (var i = 0; i < texcoords.length; i++) {
        p.texcoords[i] = _texcoords.inner[i];
      }
    }

    if (p.normals.address != 0) {
      for (var i = 0; i < normals.length; i++) {
        p.normals[i] = _normals.inner[i];
      }
    }

    if (p.colors.address != 0) {
      for (var i = 0; i < colors.length; i++) {
        p.colors[i] = _colors.inner[i];
      }
    }

    if (p.indices.address != 0) {
      for (var i = 0; i < indices.length; i++) {
        p.indices[i] = _indices.inner[i];
      }
    }
  }

  @override
  void nativeReadFrom(RlVertexBufferC p) {
    structOnOriginalPointer((o) {
      o.ref.vertices = p.vertices;
      o.ref.texcoords = p.texcoords;
      o.ref.normals = p.normals;
      o.ref.colors = p.colors;
      o.ref.indices = p.indices;
    });
    elementCount = p.elementCount;
    vertices = p.vertices.address != 0
      ? .generate(p.verticesCount, (i) => p.vertices[i].toDouble())
      : [];
    texcoords = p.texcoords.address != 0
      ? .generate(p.texcoordsCount, (i) => p.texcoords[i].toDouble())
      : [];
    normals = p.normals.address != 0
      ? .generate(p.normalsCount, (i) => p.normals[i].toDouble())
      : [];
    colors = p.colors.address != 0
      ? .generate(p.colorsCount, (i) => p.colors[i])
      : [];
    indices = p.indices.address != 0
      ? .generate(p.indicesCount, (i) => p.indices[i])
      : [];
    vaoId = p.vaoId;
    vboId = .generate(vboIdCount, (i) => p.vboId[i]);
  }

  @override
  RlVertexBufferD clone() => .new(
    originalPointer: originalPointer,
    elementCount: elementCount,
    vertices: .from(vertices),
    texcoords: .from(texcoords),
    normals: .from(normals),
    colors: .from(colors),
    indices: .from(indices),
    vaoId: vaoId,
    vboId: .from(vboId),
  );
}