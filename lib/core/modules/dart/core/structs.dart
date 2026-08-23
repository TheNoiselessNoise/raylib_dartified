part of '../../../raylib_dartified.dart';

// AutomationEventList

extension AutomationEventListCPEx on Pointer<AutomationEventListC> {
  AutomationEventListD toD() => ref.toD(this);
}

extension AutomationEventListCEx on AutomationEventListC {
  AutomationEventListD toD([Pointer<AutomationEventListC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
  );
}

// AutomationEvent

extension AutomationEventCPEx on Pointer<AutomationEventC> {
  AutomationEventD toD() => ref.toD(this);
}

extension AutomationEventCEx on AutomationEventC {
  int get paramsCount => AutomationEventD.BASE_paramsCount;

  AutomationEventD toD([Pointer<AutomationEventC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    frame: frame,
    type: .fromValue(type),
    params: .generate(paramsCount, (i) => params[i]),
  );
}

// BoneInfo

extension BoneInfoCPEx on Pointer<BoneInfoC> {
  BoneInfoD toD() => ref.toD(this);
}

extension BoneInfoCEx on BoneInfoC {
  int get nameLength => BoneInfoD.BASE_nameLength;

  BoneInfoD toD([Pointer<BoneInfoC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    name: name.toDartString(nameLength),
    parent: parent,
  );
}

// BoundingBox

extension BoundingBoxCPEx on Pointer<BoundingBoxC> {
  BoundingBoxD toD() => ref.toD(this);
}

extension BoundingBoxCEx on BoundingBoxC {
  BoundingBoxD toD([Pointer<BoundingBoxC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    min: min.toD(),
    max: max.toD(),
  );
}

// Camera2D

extension Camera2DCPEx on Pointer<Camera2DC> {
  Camera2DD toD() => ref.toD(this);
}

extension Camera2DCEx on Camera2DC {
  Camera2DD toD([Pointer<Camera2DC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    offset: offset.toD(),
    target: target.toD(),
    rotation: rotation,
    zoom: zoom,
  );
}

// Camera3D

extension Camera3DCPEx on Pointer<Camera3DC> {
  Camera3DD toD() => ref.toD(this);
}

extension Camera3DCEx on Camera3DC {
  Camera3DD toD([Pointer<Camera3DC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    position: position.toD(),
    target: target.toD(),
    up: up.toD(),
    fovy: fovy,
    projection: .fromValue(projection),
  );
}

// Color

extension ColorCPEx on Pointer<ColorC> {
  Pointer<ColorC> set(num r, num g, num b, num a) { ref.set(r, g, b, a); return this; }
  ColorD toD() => ref.toD(this);
}

extension ColorCEx on ColorC {
  ColorC set(num r, num g, num b, num a) {
    this.r = r.toInt();
    this.g = g.toInt();
    this.b = b.toInt();
    this.a = a.toInt();
    return this;
  }

  ColorD toD([Pointer<ColorC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    r: r,
    g: g,
    b: b,
    a: a,
  );
}

// FilePathList

extension FilePathListCPEx on Pointer<FilePathListC> {
  FilePathListD toD() => ref.toD(this);
}

extension FilePathListCEx on FilePathListC {
  FilePathListD toD([Pointer<FilePathListC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
  );
}

// Font

extension FontCPEx on Pointer<FontC> {
  FontD toD() => ref.toD(this);
}

extension FontCEx on FontC {
  FontD toD([Pointer<FontC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    baseSize: baseSize,
    glyphCount: glyphCount,
    glyphPadding: glyphPadding,
    texture: texture.toD(),
    recs: .generate(glyphCount, (i) => (recs + i).toD()),
    glyphs: .generate(glyphCount, (i) => (glyphs + i).toD()),
  );
}

// GestureEvent

extension GestureEventCPEx on Pointer<GestureEventC> {
  GestureEventD toD() => ref.toD(this);
}

extension GestureEventCEx on GestureEventC {
  int get maxTouchPoints => GestureEventD.BASE_maxTouchPoints;

  GestureEventD toD([Pointer<GestureEventC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    touchAction: .fromValue(touchAction),
    pointCount: pointCount,
    pointId: .generate(maxTouchPoints, (i) => pointId[i]),
    position: .generate(maxTouchPoints, (i) => position[i].toD()),
  );
}

// GlyphInfo

extension GlyphInfoCPEx on Pointer<GlyphInfoC> {
  GlyphInfoD toD() => ref.toD(this);
}

extension GlyphInfoCEx on GlyphInfoC {
  GlyphInfoD toD([Pointer<GlyphInfoC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    value: value,
    offsetX: offsetX,
    offsetY: offsetY,
    advanceX: advanceX,
    image: image.toD(),
  );
}

// Image

extension ImageCPEx on Pointer<ImageC> {
  ImageD toD() => ref.toD(this);
}

extension ImageCEx on ImageC {
  int get bytesPerPixel => ImageD.BASE_bytesPerPixel(.fromValue(format));
  // NOTE: 1 frame (which is wrong, but we can't do anything about that, can we???)
  int get dataLength => ImageD.BASE_dataLength(frameSize, 1);
  int get frameSize => ImageD.BASE_frameSize(width, height, .fromValue(format));

  ImageD toD([Pointer<ImageC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    data: .fromList(data.cast<Uint8>().asTypedList(ptr?.ref.dataLength ?? dataLength)),
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: .fromValue(ptr?.ref.format ?? format),
  );
}

// MaterialMap

extension MaterialMapCPEx on Pointer<MaterialMapC> {
  MaterialMapD toD() => ref.toD(this);
}

extension MaterialMapCEx on MaterialMapC {
  MaterialMapD toD([Pointer<MaterialMapC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    texture: texture.toD(),
    color: color.toD(),
    value: value,
  );
}

// Material

extension MaterialCPEx on Pointer<MaterialC> {
  MaterialD toD() => ref.toD(this);
}

extension MaterialCEx on MaterialC {
  int get paramsCount => MaterialD.BASE_paramsCount;
  int get mapsCount => MaterialD.BASE_mapsCount;

  MaterialD toD([Pointer<MaterialC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    shader: shader.toD(),
    maps: maps.address != 0
      ? .generate(mapsCount, (i) => (maps + i).toD())
      : [],
    params: .generate(paramsCount, (i) => params[i]),
  );
}

// Matrix

extension MatrixCPEx on Pointer<MatrixC> {
  MatrixD toD() => ref.toD(this);
}

extension MatrixCEx on MatrixC {
  MatrixD toD([Pointer<MatrixC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    m0: m0, m1: m1, m2: m2, m3: m3,
    m4: m4, m5: m5, m6: m6, m7: m7,
    m8: m8, m9: m9, m10: m10, m11: m11,
    m12: m12, m13: m13, m14: m14, m15: m15,
  );
}

// Mesh

extension MeshCPEx on Pointer<MeshC> {
  MeshD toD() => ref.toD(this);
}

extension MeshCEx on MeshC {
  int get verticesCount => MeshD.BASE_verticesCount(vertexCount);
  int get texcoordsCount => MeshD.BASE_texcoordsCount(vertexCount);
  int get texcoords2Count => MeshD.BASE_texcoords2Count(vertexCount);
  int get normalsCount => MeshD.BASE_normalsCount(vertexCount);
  int get tangentsCount => MeshD.BASE_tangentsCount(vertexCount);
  int get colorsCount => MeshD.BASE_colorsCount(vertexCount);
  int get indicesCount => MeshD.BASE_indicesCount(triangleCount);
  int get boneIndicesCount => MeshD.BASE_boneIndicesCount(vertexCount);
  int get boneWeightsCount => MeshD.BASE_boneWeightsCount(vertexCount);
  int get animVerticesCount => MeshD.BASE_animVerticesCount(vertexCount);
  int get animNormalsCount => MeshD.BASE_animNormalsCount(vertexCount);
  int get vboIdCount => MeshD.BASE_vboIdCount;

  MeshD toD([Pointer<MeshC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
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
    boneIndices: boneIndices.address != 0 ? .generate(boneIndicesCount, (i) => (boneIndices + i).value) : [],
    boneWeights: boneWeights.address != 0 ? .generate(boneWeightsCount, (i) => (boneWeights + i).value) : [],
    animVertices: animVertices.address != 0 ? .generate(animVerticesCount, (i) => (animVertices + i).value) : [],
    animNormals: animNormals.address != 0 ? .generate(animNormalsCount, (i) => (animNormals + i).value) : [],
    vaoId: vaoId,
    vboId: vboId.address != 0 ? .generate(vboIdCount, (i) => (vboId + i).value) : [],
  );
}

// ModelAnimation

extension ModelAnimationCPEx on Pointer<ModelAnimationC> {
  ModelAnimationD toD() => ref.toD(this);
}

extension ModelAnimationCEx on ModelAnimationC {
  int get nameLength => ModelAnimationD.BASE_nameLength;

  ModelAnimationD toD([Pointer<ModelAnimationC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    keyframePoses: .generate(keyframeCount, (i) =>
      .generate(boneCount, (j) => (keyframePoses[i] + j).toD())
    ),
    name: name.toDartString(nameLength),
  );
}

// ModelSkeleton

extension ModelSkeletonCPEx on Pointer<ModelSkeletonC> {
  ModelSkeletonD toD() => ref.toD(this);
}

extension ModelSkeletonCEx on ModelSkeletonC {
  ModelSkeletonD toD([Pointer<ModelSkeletonC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    bones: .generate(boneCount, (i) => (bones + i).toD()),
    bindPose: .generate(boneCount, (i) =>  (bindPose + i).toD()),
  );
}

// Model

extension ModelCPEx on Pointer<ModelC> {
  ModelD toD() => ref.toD(this);
}

extension ModelCEx on ModelC {
  ModelD toD([Pointer<ModelC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    transform: transform.toD(),
    meshes: .generate(meshCount, (i) => (meshes + i).toD()),
    materials: .generate(materialCount, (i) => (materials + i).toD()),
    meshMaterial: .generate(meshCount, (i) => meshMaterial[i]),
    skeleton: skeleton.toD(),
    currentPose: .generate(skeleton.boneCount, (i) => (currentPose + i).toD()),
    boneMatrices: .generate(skeleton.boneCount, (i) => (boneMatrices + i).toD()),
  );
}

// NPatchInfo

extension NPatchInfoCPEx on Pointer<NPatchInfoC> {
  NPatchInfoD toD() => ref.toD(this);
}

extension NPatchInfoCEx on NPatchInfoC {
  NPatchInfoD toD([Pointer<NPatchInfoC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    source: source.toD(),
    left: left,
    top: top,
    right: right,
    bottom: bottom,
    layout: .fromValue(layout),
  );
}

// Quaternion

extension QuaternionCPEx on Pointer<QuaternionC> {
  Pointer<QuaternionC> set(num x, num y, num z, num w) {
    ref.set(x, y, z, w);
    return this;
  }
  QuaternionD toD() => ref.toD(this);
}

extension QuaternionCEx on QuaternionC {
  QuaternionC set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  QuaternionD toD([Pointer<QuaternionC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    x: x,
    y: y,
    z: z,
    w: w,
  );
}

// RayCollision

extension RayCollisionCPEx on Pointer<RayCollisionC> {
  RayCollisionD toD() => ref.toD(this);
}

extension RayCollisionCEx on RayCollisionC {
  RayCollisionD toD([Pointer<RayCollisionC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    hit: hit,
    distance: distance,
    point: point.toD(),
    normal: normal.toD()
  );
}

// Ray

extension RayCPEx on Pointer<RayC> {
  RayD toD() => ref.toD(this);
}

extension RayCEx on RayC {
  RayD toD([Pointer<RayC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    position: position.toD(),
    direction: direction.toD(),
  );
}

// Rectangle

extension RectangleCPEx on Pointer<RectangleC> {
  Pointer<RectangleC> set(num x, num y, num width, num height) { ref.set(x, y, width, height); return this; }
  RectangleD toD() => ref.toD(this);
}

extension RectangleCEx on RectangleC {
  RectangleC set(num x, num y, num width, num height) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.width = width.toDouble();
    this.height = height.toDouble();
    return this;
  }

  RectangleD toD([Pointer<RectangleC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    x: x,
    y: y,
    width: width,
    height: height,
  );
}

// RenderTexture

extension RenderTextureCPEx on Pointer<RenderTextureC> {
  RenderTextureD toD() => ref.toD(this);
}

extension RenderTextureCEx on RenderTextureC {
  RenderTextureD toD([Pointer<RenderTextureC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    id: id,
    texture: texture.toD(),
    depth: depth.toD(),
  );
}

// Shader

extension ShaderCPEx on Pointer<ShaderC> {
  ShaderD toD() => ref.toD(this);
}

extension ShaderCEx on ShaderC {
  int get shaderLocsCount => ShaderD.BASE_shaderLocsCount;

  ShaderD toD([Pointer<ShaderC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    id: id,
    locs: locs.address != 0
      ? .generate(shaderLocsCount, (i) => locs[i])
      : .filled(shaderLocsCount, 0),
  );
}

// Texture

extension TextureCPEx on Pointer<TextureC> {
  TextureD toD() => ref.toD(this);
}

extension TextureCEx on TextureC {
  TextureD toD([Pointer<TextureC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    id: id,
    width: width,
    height: height,
    mipmaps: mipmaps,
    format: .fromValue(format),
  );
}

// Transform

extension TransformCPEx on Pointer<TransformC> {
  TransformD toD() => ref.toD(this);
}

extension TransformCEx on TransformC {
  TransformD toD([Pointer<TransformC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    translation: translation.toD(),
    rotation: rotation.toD(),
    scale: scale.toD(),
  );
}

// Vector2

extension Vector2CPEx on Pointer<Vector2C> {
  Pointer<Vector2C> set(num x, num y) { ref.set(x, y); return this; }
  Vector2D toD() => ref.toD(this);
}

extension Vector2CEx on Vector2C {
  Vector2C set(num x, num y) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    return this;
  }

  Vector2D toD([Pointer<Vector2C>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    x: x,
    y: y,
  );
}

// Vector3

extension Vector3CPEx on Pointer<Vector3C> {
  Pointer<Vector3C> set(num x, num y, num z) { ref.set(x, y, z); return this; }
  Vector3D toD() => ref.toD(this);
}

extension Vector3CEx on Vector3C {
  Vector3C set(num x, num y, num z) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    return this;
  }

  Vector3D toD([Pointer<Vector3C>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    x: x,
    y: y,
    z: z,
  );
}

// Vector4

extension Vector4CPEx on Pointer<Vector4C> {
  Pointer<Vector4C> set(num x, num y, num z, num w) { ref.set(x, y, z, w); return this; }
  Vector4D toD() => ref.toD(this);
}

extension Vector4CEx on Vector4C {
  Vector4C set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  Vector4D toD([Pointer<Vector4C>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    x: x,
    y: y,
    z: z,
    w: w,
  );
}

// VrDeviceInfo

extension VrDeviceInfoCPEx on Pointer<VrDeviceInfoC> {
  VrDeviceInfoD toD() => ref.toD(this);
}

extension VrDeviceInfoCEx on VrDeviceInfoC {
  int get paramsCount => VrDeviceInfoD.BASE_paramsCount;

  VrDeviceInfoD toD([Pointer<VrDeviceInfoC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    hResolution: hResolution,
    vResolution: vResolution,
    hScreenSize: hScreenSize,
    vScreenSize: vScreenSize,
    eyeToScreenDistance: eyeToScreenDistance,
    lensSeparationDistance: lensSeparationDistance,
    interpupillaryDistance: interpupillaryDistance,
    lensDistortionValues: .generate(paramsCount, (i) => lensDistortionValues[i]),
    chromaAbCorrection: .generate(paramsCount, (i) => chromaAbCorrection[i]),
  );
}

// VrStereoConfig

extension VrStereoConfigCPEx on Pointer<VrStereoConfigC> {
  VrStereoConfigD toD() => ref.toD(this);
}

extension VrStereoConfigCEx on VrStereoConfigC {
  int get paramsCount => VrStereoConfigD.BASE_paramsCount;

  VrStereoConfigD toD([Pointer<VrStereoConfigC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    projection: .generate(paramsCount, (i) => projection[i].toD()),
    viewOffset: .generate(paramsCount, (i) => viewOffset[i].toD()),
    leftLensCenter: .generate(paramsCount, (i) => leftLensCenter[i]),
    rightLensCenter: .generate(paramsCount, (i) => rightLensCenter[i]),
    leftScreenCenter: .generate(paramsCount, (i) => leftScreenCenter[i]),
    rightScreenCenter: .generate(paramsCount, (i) => rightScreenCenter[i]),
    scale: .generate(paramsCount, (i) => scale[i]),
    scaleIn: .generate(paramsCount, (i) => scaleIn[i]),
  );
}