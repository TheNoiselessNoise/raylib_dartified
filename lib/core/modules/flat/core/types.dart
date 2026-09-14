part of '../../../raylib_dartified.dart';

// AutomationEventList

extension AutomationEventListCPEx on Pointer<AutomationEventListC> {
  AutomationEventListD toDart() => ref.toDart(this);
}

extension AutomationEventListCEx on AutomationEventListC {
  AutomationEventListD toDart([Pointer<AutomationEventListC>? ptr]) => .new(
    op: AutomationEventListD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// AutomationEvent

extension AutomationEventCPEx on Pointer<AutomationEventC> {
  AutomationEventD toDart() => ref.toDart(this);
}

extension AutomationEventCEx on AutomationEventC {
  AutomationEventD toDart([Pointer<AutomationEventC>? ptr]) => .new(
    op: AutomationEventD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// BoneInfo

extension BoneInfoCPEx on Pointer<BoneInfoC> {
  BoneInfoD toDart() => ref.toDart(this);
}

extension BoneInfoCEx on BoneInfoC {
  BoneInfoD toDart([Pointer<BoneInfoC>? ptr]) => .new(
    op: BoneInfoD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// BoundingBox

extension BoundingBoxCPEx on Pointer<BoundingBoxC> {
  BoundingBoxD toDart() => ref.toDart(this);
}

extension BoundingBoxCEx on BoundingBoxC {
  BoundingBoxD toDart([Pointer<BoundingBoxC>? ptr]) => .new(
    op: BoundingBoxD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Camera2D

extension Camera2DCPEx on Pointer<Camera2DC> {
  Camera2DD toDart() => ref.toDart(this);
}

extension Camera2DCEx on Camera2DC {
  Camera2DD toDart([Pointer<Camera2DC>? ptr]) => .new(
    op: Camera2DD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Camera3D

extension Camera3DCPEx on Pointer<Camera3DC> {
  Camera3DD toDart() => ref.toDart(this);
}

extension Camera3DCEx on Camera3DC {
  Camera3DD toDart([Pointer<Camera3DC>? ptr]) => .new(
    op: Camera3DD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Color

extension ColorCPEx on Pointer<ColorC> {
  Pointer<ColorC> set(num r, num g, num b, num a) { ref.set(r, g, b, a); return this; }
  ColorD toDart() => ref.toDart(this);
}

extension ColorCEx on ColorC {
  ColorC set(num r, num g, num b, num a) {
    this.r = r.toInt();
    this.g = g.toInt();
    this.b = b.toInt();
    this.a = a.toInt();
    return this;
  }

  ColorD toDart([Pointer<ColorC>? ptr]) => .new(
    op: ColorD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// FilePathList

extension FilePathListCPEx on Pointer<FilePathListC> {
  FilePathListD toDart() => ref.toDart(this);
}

extension FilePathListCEx on FilePathListC {
  FilePathListD toDart([Pointer<FilePathListC>? ptr]) => .new(
    op: FilePathListD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Font

extension FontCPEx on Pointer<FontC> {
  FontD toDart() => ref.toDart(this);
}

extension FontCEx on FontC {
  FontD toDart([Pointer<FontC>? ptr]) => .new(
    op: FontD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// GestureEvent

extension GestureEventCPEx on Pointer<GestureEventC> {
  GestureEventD toDart() => ref.toDart(this);
}

extension GestureEventCEx on GestureEventC {
  GestureEventD toDart([Pointer<GestureEventC>? ptr]) => .new(
    op: GestureEventD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// GlyphInfo

extension GlyphInfoCPEx on Pointer<GlyphInfoC> {
  GlyphInfoD toDart() => ref.toDart(this);
}

extension GlyphInfoCEx on GlyphInfoC {
  GlyphInfoD toDart([Pointer<GlyphInfoC>? ptr]) => .new(
    op: GlyphInfoD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Image

extension ImageCPEx on Pointer<ImageC> {
  ImageD toDart() => ref.toDart(this);
}

extension ImageCEx on ImageC {
  ImageD toDart([Pointer<ImageC>? ptr]) => .new(
    op: ImageD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// MaterialMap

extension MaterialMapCPEx on Pointer<MaterialMapC> {
  MaterialMapD toDart() => ref.toDart(this);
}

extension MaterialMapCEx on MaterialMapC {
  MaterialMapD toDart([Pointer<MaterialMapC>? ptr]) => .new(
    op: MaterialMapD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Material

extension MaterialCPEx on Pointer<MaterialC> {
  MaterialD toDart() => ref.toDart(this);
}

extension MaterialCEx on MaterialC {
  MaterialD toDart([Pointer<MaterialC>? ptr]) => .new(
    op: MaterialD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Matrix

extension MatrixCPEx on Pointer<MatrixC> {
  MatrixD toDart() => ref.toDart(this);
}

extension MatrixCEx on MatrixC {
  MatrixD toDart([Pointer<MatrixC>? ptr]) => .new(
    op: MatrixD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Mesh

extension MeshCPEx on Pointer<MeshC> {
  MeshD toDart() => ref.toDart(this);
}

extension MeshCEx on MeshC {
  MeshD toDart([Pointer<MeshC>? ptr]) => .new(
    op: MeshD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// ModelAnimation

extension ModelAnimationCPEx on Pointer<ModelAnimationC> {
  ModelAnimationD toDart() => ref.toDart(this);
}

extension ModelAnimationCEx on ModelAnimationC {
  ModelAnimationD toDart([Pointer<ModelAnimationC>? ptr]) => .new(
    op: ModelAnimationD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// ModelSkeleton

extension ModelSkeletonCPEx on Pointer<ModelSkeletonC> {
  ModelSkeletonD toDart() => ref.toDart(this);
}

extension ModelSkeletonCEx on ModelSkeletonC {
  ModelSkeletonD toDart([Pointer<ModelSkeletonC>? ptr]) => .new(
    op: ModelSkeletonD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Model

extension ModelCPEx on Pointer<ModelC> {
  ModelD toDart() => ref.toDart(this);
}

extension ModelCEx on ModelC {
  ModelD toDart([Pointer<ModelC>? ptr]) => .new(
    op: ModelD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// NPatchInfo

extension NPatchInfoCPEx on Pointer<NPatchInfoC> {
  NPatchInfoD toDart() => ref.toDart(this);
}

extension NPatchInfoCEx on NPatchInfoC {
  NPatchInfoD toDart([Pointer<NPatchInfoC>? ptr]) => .new(
    op: NPatchInfoD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Quaternion

extension QuaternionCPEx on Pointer<QuaternionC> {
  QuaternionD toDart() => ref.toDart(this);
}

extension QuaternionCEx on QuaternionC {
  QuaternionD toDart([Pointer<QuaternionC>? ptr]) => .new(
    op: QuaternionD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// RayCollision

extension RayCollisionCPEx on Pointer<RayCollisionC> {
  RayCollisionD toDart() => ref.toDart(this);
}

extension RayCollisionCEx on RayCollisionC {
  RayCollisionD toDart([Pointer<RayCollisionC>? ptr]) => .new(
    op: RayCollisionD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Ray

extension RayCPEx on Pointer<RayC> {
  RayD toDart() => ref.toDart(this);
}

extension RayCEx on RayC {
  RayD toDart([Pointer<RayC>? ptr]) => .new(
    op: RayD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Rectangle

extension RectangleCPEx on Pointer<RectangleC> {
  RectangleD toDart() => ref.toDart(this);
}

extension RectangleCEx on RectangleC {
  RectangleD toDart([Pointer<RectangleC>? ptr]) => .new(
    op: RectangleD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// RenderTexture

extension RenderTextureCPEx on Pointer<RenderTextureC> {
  RenderTextureD toDart() => ref.toDart(this);
}

extension RenderTextureCEx on RenderTextureC {
  RenderTextureD toDart([Pointer<RenderTextureC>? ptr]) => .new(
    op: RenderTextureD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Shader

extension ShaderCPEx on Pointer<ShaderC> {
  ShaderD toDart() => ref.toDart(this);
}

extension ShaderCEx on ShaderC {
  ShaderD toDart([Pointer<ShaderC>? ptr]) => .new(
    op: ShaderD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Texture

extension TextureCPEx on Pointer<TextureC> {
  TextureD toDart() => ref.toDart(this);
}

extension TextureCEx on TextureC {
  TextureD toDart([Pointer<TextureC>? ptr]) => .new(
    op: TextureD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Transform

extension TransformCPEx on Pointer<TransformC> {
  TransformD toDart() => ref.toDart(this);
}

extension TransformCEx on TransformC {
  TransformD toDart([Pointer<TransformC>? ptr]) => .new(
    op: TransformD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Vector2

extension Vector2CPEx on Pointer<Vector2C> {
  Vector2D toDart() => ref.toDart(this);
}

extension Vector2CEx on Vector2C {
  Vector2D toDart([Pointer<Vector2C>? ptr]) => .new(
    op: Vector2D.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Vector3

extension Vector3CPEx on Pointer<Vector3C> {
  Vector3D toDart() => ref.toDart(this);
}

extension Vector3CEx on Vector3C {
  Vector3D toDart([Pointer<Vector3C>? ptr]) => .new(
    op: Vector3D.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Vector4

extension Vector4CPEx on Pointer<Vector4C> {
  Vector4D toDart() => ref.toDart(this);
}

extension Vector4CEx on Vector4C {
  Vector4D toDart([Pointer<Vector4C>? ptr]) => .new(
    op: Vector4D.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// VrDeviceInfo

extension VrDeviceInfoCPEx on Pointer<VrDeviceInfoC> {
  VrDeviceInfoD toDart() => ref.toDart(this);
}

extension VrDeviceInfoCEx on VrDeviceInfoC {
  VrDeviceInfoD toDart([Pointer<VrDeviceInfoC>? ptr]) => .new(
    op: VrDeviceInfoD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// VrStereoConfig

extension VrStereoConfigCPEx on Pointer<VrStereoConfigC> {
  VrStereoConfigD toDart() => ref.toDart(this);
}

extension VrStereoConfigCEx on VrStereoConfigC {
  VrStereoConfigD toDart([Pointer<VrStereoConfigC>? ptr]) => .new(
    op: VrStereoConfigD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// float16

// ignore: camel_case_extensions
extension float16CPEx on Pointer<float16C> {
  float16D toDart() => ref.toDart(this);
}

// ignore: camel_case_extensions
extension float16CEx on float16C {
  float16D toDart([Pointer<float16C>? ptr]) => .new(
    op: float16D.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// float3

// ignore: camel_case_extensions
extension float3CPEx on Pointer<float3C> {
  float3D toDart() => ref.toDart(this);
}

// ignore: camel_case_extensions
extension float3CEx on float3C {
  float3D toDart([Pointer<float3C>? ptr]) => .new(
    op: float3D.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}