part of '../../../../raylib.dart';

extension RlVertexBufferCLike on RlVertexBufferC {
  int get vboIdCount => 5;
  int get verticesCount => elementCount > 0 ? elementCount * 3 : 0;
  int get texcoordsCount => elementCount > 0 ? elementCount * 2 : 0;
  int get normalsCount => elementCount > 0 ? elementCount * 3 : 0;
  int get colorsCount => elementCount > 0 ? elementCount * 4 : 0;
  int get indicesCount => elementCount;
}

extension RlVertexBufferCPEx on Pointer<RlVertexBufferC> {
  Pointer<RlVertexBufferC> setC(RlVertexBufferC o) {
    ref.setC(o);
    return this;
  }

  Pointer<RlVertexBufferC> setD(RlVertexBufferD o) {
    ref.setD(o);
    return this;
  }

  RlVertexBufferD toD() => ref.toD(this);
}

extension RlVertexBufferCEx on RlVertexBufferC {
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

class RlVertexBufferD extends StructD<RlVertexBufferC, RlVertexBufferD> with RlVertexBufferBase {
  @override
  int elementCount;

  @override
  List<double> vertices;

  @override
  List<double> texcoords;

  @override
  List<double> normals;

  @override
  List<int> colors;

  @override
  List<int> indices;

  @override
  int vaoId;

  @override
  List<int> vboId;

  RlVertexBufferD({
    super.originalPointer,
    this.elementCount = 0,
    List<double>? vertices,
    List<double>? texcoords,
    List<double>? normals,
    List<int>? colors,
    List<int>? indices,
    this.vaoId = 0,
    List<int>? vboId,
  }) :
    vertices = vertices ?? [],
    texcoords = texcoords ?? [],
    normals = normals ?? [],
    colors = colors ?? [],
    indices = indices ?? [],
    vboId = vboId ?? [];

  factory RlVertexBufferD.zero() => .new();

  @override
  RlVertexBufferD setC(RlVertexBufferC o) {
    structOnOriginalPointer((p) {
      p.ref.vertices = o.vertices;
      p.ref.texcoords = o.texcoords;
      p.ref.normals = o.normals;
      p.ref.colors = o.colors;
      p.ref.indices = o.indices;
    });
    elementCount = o.elementCount;
    vertices = o.vertices.address != 0
      ? .generate(o.verticesCount, (i) => o.vertices[i].toDouble())
      : [];
    texcoords = o.texcoords.address != 0
      ? .generate(o.texcoordsCount, (i) => o.texcoords[i].toDouble())
      : [];
    normals = o.normals.address != 0
      ? .generate(o.normalsCount, (i) => o.normals[i].toDouble())
      : [];
    colors = o.colors.address != 0
      ? .generate(o.colorsCount, (i) => o.colors[i])
      : [];
    indices = o.indices.address != 0
      ? .generate(o.indicesCount, (i) => o.indices[i])
      : [];
    vaoId = o.vaoId;
    vboId = .generate(vboIdCount, (i) => o.vboId[i]);
    return this;
  }

  @override
  RlVertexBufferD setD(RlVertexBufferD o) {
    originalPointer ??= o.originalPointer;
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
  nativeAllocator(RaylibTemp temp) => temp.RlVertexBuffer$;

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<RlVertexBufferC> p, String key) {
    p.ref.vertices = temp.Float$.Array(vertices, key: '${key}_vertices');
    p.ref.texcoords = temp.Float$.Array(texcoords, key: '${key}_texcoords');
    p.ref.normals = temp.Float$.Array(normals, key: '${key}_normals');
    p.ref.colors = temp.UnsignedChar$.Array(colors, key: '${key}_colors');
    p.ref.indices = temp.UnsignedInt$.Array(indices, key: '${key}_indices');
  }

  @override
  void nativeWriteInto(RlVertexBufferC p) {
    p.elementCount = elementCount;
    p.vaoId = vaoId;
    for (var i = 0; i < vboIdCount; i++) p.vboId[i] = vboId[i];
    for (var i = 0; i < vertices.length; i++) p.vertices[i] = vertices[i];
    for (var i = 0; i < texcoords.length; i++) p.texcoords[i] = texcoords[i];
    for (var i = 0; i < normals.length; i++) p.normals[i] = normals[i];
    for (var i = 0; i < colors.length; i++) p.colors[i] = colors[i];
    for (var i = 0; i < indices.length; i++) p.indices[i] = indices[i];
  }

  @override
  String signature() => '$structName(elementCount: $elementCount, vaoId: $vaoId, vboId: $vboId)';

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