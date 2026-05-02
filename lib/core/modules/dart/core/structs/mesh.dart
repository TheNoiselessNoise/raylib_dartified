part of '../../../../raylib.dart';

extension MeshCLike on MeshC {
  int get verticesCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get texcoordsCount => vertexCount > 0 ? vertexCount * 2 : 0;
  int get texcoords2Count => vertexCount > 0 ? vertexCount * 2 : 0;
  int get normalsCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get tangentsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get colorsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get indicesCount => triangleCount > 0 ? triangleCount * 3 : 0;
  int get animVerticesCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get animNormalsCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get boneIdsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get boneWeightsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get boneMatricesCount => boneCount;
}

extension MeshDLike on MeshD {
  int get verticesCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get texcoordsCount => vertexCount > 0 ? vertexCount * 2 : 0;
  int get texcoords2Count => vertexCount > 0 ? vertexCount * 2 : 0;
  int get normalsCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get tangentsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get colorsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get indicesCount => triangleCount > 0 ? triangleCount * 3 : 0;
  int get animVerticesCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get animNormalsCount => vertexCount > 0 ? vertexCount * 3 : 0;
  int get boneIdsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get boneWeightsCount => vertexCount > 0 ? vertexCount * 4 : 0;
  int get boneMatricesCount => boneCount;
}

extension MeshCPEx on Pointer<MeshC> {
  Pointer<MeshC> setC(MeshC o) {
    ref.setC(o);
    return this;
  }

  Pointer<MeshC> setD(MeshD o) {
    ref.setD(o);
    return this;
  }

  MeshD toD() => ref.toD(this);
}

extension MeshCEx on MeshC {
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
    o.onOriginalPointer((p) {
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
    vboId: vboId.address != 0 ? .generate(9, (i) => (vboId + i).value) : [],
  );
}

class MeshD extends StructD<MeshD, MeshC> {
  int vertexCount;
  int triangleCount;
  int boneCount;
  List<double> vertices;
  List<double> texcoords;
  List<double> texcoords2;
  List<double> normals;
  List<double> tangents;
  List<int> colors;
  List<int> indices;
  List<double> animVertices;
  List<double> animNormals;
  List<int> boneIds;
  List<double> boneWeights;
  List<MatrixD> boneMatrices;
  int vaoId;
  List<int> vboId;

  MeshD({
    super.originalPointer,
    this.vertexCount = 0,
    this.triangleCount = 0,
    this.boneCount = 0,
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
    this.vaoId = 0,
    List<int>? vboId,
  }):
    vertices = vertices ?? [],
    texcoords = texcoords ?? [],
    texcoords2 = texcoords2 ?? [],
    normals = normals ?? [],
    tangents = tangents ?? [],
    colors = colors ?? [],
    indices = indices ?? [],
    animVertices = animVertices ?? [],
    animNormals = animNormals ?? [],
    boneIds = boneIds ?? [],
    boneWeights = boneWeights ?? [],
    boneMatrices = boneMatrices ?? [],
    vboId = vboId ?? [];

  factory MeshD.zero() => .new();

  @override
  MeshD setC(MeshC o) {
    onOriginalPointer((p) {
      p.ref.vertexCount = o.vertexCount;
      p.ref.triangleCount = o.triangleCount;
      p.ref.boneCount = o.boneCount;
      p.ref.vertices = o.vertices;
      p.ref.texcoords = o.texcoords;
      p.ref.texcoords2 = o.texcoords2;
      p.ref.normals = o.normals;
      p.ref.tangents = o.tangents;
      p.ref.colors = o.colors;
      p.ref.indices = o.indices;
      p.ref.animVertices = o.animVertices;
      p.ref.animNormals = o.animNormals;
      p.ref.boneIds = o.boneIds;
      p.ref.boneWeights = o.boneWeights;
      p.ref.boneMatrices = o.boneMatrices;
      p.ref.vboId = o.vboId;
    });
    vertexCount = o.vertexCount;
    triangleCount = o.triangleCount;
    boneCount = o.boneCount;
    vertices = vertexCount > 0 && o.vertices.address != 0 ? .generate(verticesCount, (i) => (o.vertices + i).value) : [];
    texcoords = vertexCount > 0 && o.texcoords.address != 0 ? .generate(texcoordsCount, (i) => (o.texcoords + i).value) : [];
    texcoords2 = vertexCount > 0 && o.texcoords2.address != 0 ? .generate(texcoords2Count, (i) => (o.texcoords2 + i).value) : [];
    normals = vertexCount > 0 && o.normals.address != 0 ? .generate(normalsCount, (i) => (o.normals + i).value) : [];
    tangents = vertexCount > 0 && o.tangents.address != 0 ? .generate(tangentsCount, (i) => (o.tangents + i).value) : [];
    colors = vertexCount > 0 && o.colors.address != 0 ? .generate(colorsCount, (i) => (o.colors + i).value) : [];
    indices = triangleCount > 0 && o.indices.address != 0 ? .generate(indicesCount, (i) => (o.indices + i).value) : [];
    animVertices = vertexCount > 0 && o.animVertices.address != 0 ? .generate(animVerticesCount, (i) => (o.animVertices + i).value) : [];
    animNormals = vertexCount > 0 && o.animNormals.address != 0 ? .generate(animNormalsCount, (i) => (o.animNormals + i).value) : [];
    boneIds = vertexCount > 0 && o.boneIds.address != 0 ? .generate(boneIdsCount, (i) => (o.boneIds + i).value) : [];
    boneWeights = vertexCount > 0 && o.boneWeights.address != 0 ? .generate(boneWeightsCount, (i) => (o.boneWeights + i).value) : [];
    boneMatrices = o.boneMatrices.address != 0 ? .generate(boneMatricesCount, (i) => (o.boneMatrices + i).toD()) : [];
    vaoId = o.vaoId;
    vboId = .generate(9, (i) => (o.vboId + i).value);
    return this;
  }

  @override
  MeshD setD(MeshD o) {
    originalPointer ??= o.originalPointer;
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
  Pointer<MeshC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.Mesh$.At(key, count);

  @override
  void syncInto(RaylibTemp temp, Pointer<MeshC> p, String key)
    => writeInto(p.ref);
  
  @override
  void allocateInto(RaylibTemp temp, Pointer<MeshC> p, String key) {
    p.ref.vertexCount = vertexCount;
    p.ref.triangleCount = triangleCount;
    p.ref.boneCount = boneCount;
    p.ref.vaoId = vaoId;

    p.ref.vertices = vertices.isNotEmpty ? temp.Float$.RawArray(vertices) : nullptr;
    p.ref.texcoords = texcoords.isNotEmpty ? temp.Float$.RawArray(texcoords) : nullptr;
    p.ref.texcoords2 = texcoords2.isNotEmpty ? temp.Float$.RawArray(texcoords2) : nullptr;
    p.ref.normals = normals.isNotEmpty ? temp.Float$.RawArray(normals) : nullptr;
    p.ref.tangents = tangents.isNotEmpty ? temp.Float$.RawArray(tangents) : nullptr;
    p.ref.colors = colors.isNotEmpty ? temp.UChar$.RawArray(colors) : nullptr;
    p.ref.indices = indices.isNotEmpty ? temp.UShort$.RawArray(indices) : nullptr;
    p.ref.animVertices = animVertices.isNotEmpty ? temp.Float$.RawArray(animVertices) : nullptr;
    p.ref.animNormals = animNormals.isNotEmpty ? temp.Float$.RawArray(animNormals) : nullptr;
    p.ref.boneIds = boneIds.isNotEmpty ? temp.UChar$.RawArray(boneIds) : nullptr;
    p.ref.boneWeights = boneWeights.isNotEmpty ? temp.Float$.RawArray(boneWeights) : nullptr;
    p.ref.boneMatrices = boneMatrices.isNotEmpty ? temp.Matrix$.RawArray(boneMatrices) : nullptr;
    p.ref.vboId = nullptr;
  }

  @override
  void writeInto(MeshC p) {
    p.vertexCount = vertexCount;
    p.triangleCount = triangleCount;
    p.triangleCount = triangleCount;
    p.boneCount = boneCount;
    p.vaoId = vaoId;

    onOriginalPointer((o) {
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
        p.vertices[i] = vertices[i];
      }
    }

    if (p.texcoords.address != 0) {
      for (int i = 0; i < texcoords.length; i++) {
        p.texcoords[i] = texcoords[i];
      }
    }

    if (p.texcoords2.address != 0) {
      for (int i = 0; i < texcoords2.length; i++) {
        p.texcoords2[i] = texcoords2[i];
      }
    }

    if (p.normals.address != 0) {
      for (int i = 0; i < normals.length; i++) {
        p.normals[i] = normals[i];
      }
    }

    if (p.tangents.address != 0) {
      for (int i = 0; i < tangents.length; i++) {
        p.tangents[i] = tangents[i];
      }
    }

    if (p.colors.address != 0) {
      for (int i = 0; i < colors.length; i++) {
        p.colors[i] = colors[i];
      }
    }

    if (p.indices.address != 0) {
      for (int i = 0; i < indices.length; i++) {
        p.indices[i] = indices[i];
      }
    }

    if (p.animVertices.address != 0) {
      for (int i = 0; i < animVertices.length; i++) {
        p.animVertices[i] = animVertices[i];
      }
    }

    if (p.animNormals.address != 0) {
      for (int i = 0; i < animNormals.length; i++) {
        p.animNormals[i] = animNormals[i];
      }
    }

    if (p.boneIds.address != 0) {
      for (int i = 0; i < boneIds.length; i++) {
        p.boneIds[i] = boneIds[i];
      }
    }

    if (p.boneWeights.address != 0) {
      for (int i = 0; i < boneWeights.length; i++) {
        p.boneWeights[i] = boneWeights[i];
      }
    }

    if (p.boneMatrices.address != 0) {
      for (int i = 0; i < boneMatrices.length; i++) {
        boneMatrices[i].writeInto((p.boneMatrices + i).ref);
      }
    }

    if (p.vboId.address != 0) {
      for (int i = 0; i < vboId.length; i++) {
        p.vboId[i] = vboId[i];
      }
    }
  }

  @override
  String signature() => '$structName(vertexCount: $vertexCount, triangleCount: $triangleCount, boneCount: $boneCount, vaoId: $vaoId)';

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