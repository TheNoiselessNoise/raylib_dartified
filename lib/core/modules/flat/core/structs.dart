part of '../../../raylib_dartified.dart';

// AutomationEventList

extension AutomationEventListCPEx on Pointer<AutomationEventListC> {
  AutomationEventListD toD() => ref.toD(this);
}

extension AutomationEventListCEx on AutomationEventListC {
  AutomationEventListD toD([Pointer<AutomationEventListC>? ptr]) => .new(
    op: AutomationEventListD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// AutomationEvent

extension AutomationEventCPEx on Pointer<AutomationEventC> {
  AutomationEventD toD() => ref.toD(this);
}

extension AutomationEventCEx on AutomationEventC {
  AutomationEventD toD([Pointer<AutomationEventC>? ptr]) => .new(
    op: AutomationEventD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// BoneInfo

extension BoneInfoCPEx on Pointer<BoneInfoC> {
  BoneInfoD toD() => ref.toD(this);
}

extension BoneInfoCEx on BoneInfoC {
  BoneInfoD toD([Pointer<BoneInfoC>? ptr]) => .new(
    op: BoneInfoD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// BoundingBox

extension BoundingBoxCPEx on Pointer<BoundingBoxC> {
  BoundingBoxD toD() => ref.toD(this);
}

extension BoundingBoxCEx on BoundingBoxC {
  BoundingBoxD toD([Pointer<BoundingBoxC>? ptr]) => .new(
    op: BoundingBoxD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Camera2D

extension Camera2DCPEx on Pointer<Camera2DC> {
  Camera2DD toD() => ref.toD(this);
}

extension Camera2DCEx on Camera2DC {
  Camera2DD toD([Pointer<Camera2DC>? ptr]) => .new(
    op: Camera2DD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Camera3D

extension Camera3DCPEx on Pointer<Camera3DC> {
  Camera3DD toD() => ref.toD(this);
}

extension Camera3DCEx on Camera3DC {
  Camera3DD toD([Pointer<Camera3DC>? ptr]) => .new(
    op: Camera3DD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
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
    op: ColorD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// FilePathList

extension FilePathListCPEx on Pointer<FilePathListC> {
  FilePathListD toD() => ref.toD(this);
}

extension FilePathListCEx on FilePathListC {
  FilePathListD toD([Pointer<FilePathListC>? ptr]) => .new(
    op: FilePathListD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Font

extension FontCPEx on Pointer<FontC> {
  FontD toD() => ref.toD(this);
}

extension FontCEx on FontC {
  FontD toD([Pointer<FontC>? ptr]) => .new(
    op: FontD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// GestureEvent

extension GestureEventCPEx on Pointer<GestureEventC> {
  GestureEventD toD() => ref.toD(this);
}

extension GestureEventCEx on GestureEventC {
  GestureEventD toD([Pointer<GestureEventC>? ptr]) => .new(
    op: GestureEventD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// GlyphInfo

extension GlyphInfoCPEx on Pointer<GlyphInfoC> {
  GlyphInfoD toD() => ref.toD(this);
}

extension GlyphInfoCEx on GlyphInfoC {
  GlyphInfoD toD([Pointer<GlyphInfoC>? ptr]) => .new(
    op: GlyphInfoD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Image

extension ImageCPEx on Pointer<ImageC> {
  ImageD toD() => ref.toD(this);
}

extension ImageCEx on ImageC {
  ImageD toD([Pointer<ImageC>? ptr]) => .new(
    op: ImageD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// MaterialMap

extension MaterialMapCPEx on Pointer<MaterialMapC> {
  MaterialMapD toD() => ref.toD(this);
}

extension MaterialMapCEx on MaterialMapC {
  MaterialMapD toD([Pointer<MaterialMapC>? ptr]) => .new(
    op: MaterialMapD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Material

extension MaterialCPEx on Pointer<MaterialC> {
  MaterialD toD() => ref.toD(this);
}

extension MaterialCEx on MaterialC {
  MaterialD toD([Pointer<MaterialC>? ptr]) => .new(
    op: MaterialD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Matrix

extension MatrixCPEx on Pointer<MatrixC> {
  MatrixD toD() => ref.toD(this);
}

extension MatrixCEx on MatrixC {
  MatrixD toD([Pointer<MatrixC>? ptr]) => .new(
    op: MatrixD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Mesh

extension MeshCPEx on Pointer<MeshC> {
  MeshD toD() => ref.toD(this);
}

extension MeshCEx on MeshC {
  MeshD toD([Pointer<MeshC>? ptr]) => .new(
    op: MeshD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// ModelAnimation

extension ModelAnimationCPEx on Pointer<ModelAnimationC> {
  ModelAnimationD toD() => ref.toD(this);
}

extension ModelAnimationCEx on ModelAnimationC {
  ModelAnimationD toD([Pointer<ModelAnimationC>? ptr]) => .new(
    op: ModelAnimationD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// ModelSkeleton

extension ModelSkeletonCPEx on Pointer<ModelSkeletonC> {
  ModelSkeletonD toD() => ref.toD(this);
}

extension ModelSkeletonCEx on ModelSkeletonC {
  ModelSkeletonD toD([Pointer<ModelSkeletonC>? ptr]) => .new(
    op: ModelSkeletonD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Model

extension ModelCPEx on Pointer<ModelC> {
  ModelD toD() => ref.toD(this);
}

extension ModelCEx on ModelC {
  ModelD toD([Pointer<ModelC>? ptr]) => .new(
    op: ModelD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// NPatchInfo

extension NPatchInfoCPEx on Pointer<NPatchInfoC> {
  NPatchInfoD toD() => ref.toD(this);
}

extension NPatchInfoCEx on NPatchInfoC {
  NPatchInfoD toD([Pointer<NPatchInfoC>? ptr]) => .new(
    op: NPatchInfoD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Quaternion

extension QuaternionCPEx on Pointer<QuaternionC> {
  QuaternionD toD() => ref.toD(this);
}

extension QuaternionCEx on QuaternionC {
  QuaternionD toD([Pointer<QuaternionC>? ptr]) => .new(
    op: QuaternionD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// RayCollision

extension RayCollisionCPEx on Pointer<RayCollisionC> {
  RayCollisionD toD() => ref.toD(this);
}

extension RayCollisionCEx on RayCollisionC {
  RayCollisionD toD([Pointer<RayCollisionC>? ptr]) => .new(
    op: RayCollisionD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Ray

extension RayCPEx on Pointer<RayC> {
  RayD toD() => ref.toD(this);
}

extension RayCEx on RayC {
  RayD toD([Pointer<RayC>? ptr]) => .new(
    op: RayD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Rectangle

extension RectangleCPEx on Pointer<RectangleC> {
  RectangleD toD() => ref.toD(this);
}

extension RectangleCEx on RectangleC {
  RectangleD toD([Pointer<RectangleC>? ptr]) => .new(
    op: RectangleD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// RenderTexture

extension RenderTextureCPEx on Pointer<RenderTextureC> {
  RenderTextureD toD() => ref.toD(this);
}

extension RenderTextureCEx on RenderTextureC {
  RenderTextureD toD([Pointer<RenderTextureC>? ptr]) => .new(
    op: RenderTextureD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Shader

extension ShaderCPEx on Pointer<ShaderC> {
  ShaderD toD() => ref.toD(this);
}

extension ShaderCEx on ShaderC {
  ShaderD toD([Pointer<ShaderC>? ptr]) => .new(
    op: ShaderD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Texture

extension TextureCPEx on Pointer<TextureC> {
  TextureD toD() => ref.toD(this);
}

extension TextureCEx on TextureC {
  TextureD toD([Pointer<TextureC>? ptr]) => .new(
    op: TextureD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Transform

extension TransformCPEx on Pointer<TransformC> {
  TransformD toD() => ref.toD(this);
}

extension TransformCEx on TransformC {
  TransformD toD([Pointer<TransformC>? ptr]) => .new(
    op: TransformD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Vector2

extension Vector2CPEx on Pointer<Vector2C> {
  Vector2D toD() => ref.toD(this);
}

extension Vector2CEx on Vector2C {
  Vector2D toD([Pointer<Vector2C>? ptr]) => .new(
    op: Vector2D.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Vector3

extension Vector3CPEx on Pointer<Vector3C> {
  Vector3D toD() => ref.toD(this);
}

extension Vector3CEx on Vector3C {
  Vector3D toD([Pointer<Vector3C>? ptr]) => .new(
    op: Vector3D.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Vector4

extension Vector4CPEx on Pointer<Vector4C> {
  Vector4D toD() => ref.toD(this);
}

extension Vector4CEx on Vector4C {
  Vector4D toD([Pointer<Vector4C>? ptr]) => .new(
    op: Vector4D.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// VrDeviceInfo

extension VrDeviceInfoCPEx on Pointer<VrDeviceInfoC> {
  VrDeviceInfoD toD() => ref.toD(this);
}

extension VrDeviceInfoCEx on VrDeviceInfoC {
  VrDeviceInfoD toD([Pointer<VrDeviceInfoC>? ptr]) => .new(
    op: VrDeviceInfoD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// VrStereoConfig

extension VrStereoConfigCPEx on Pointer<VrStereoConfigC> {
  VrStereoConfigD toD() => ref.toD(this);
}

extension VrStereoConfigCEx on VrStereoConfigC {
  VrStereoConfigD toD([Pointer<VrStereoConfigC>? ptr]) => .new(
    op: VrStereoConfigD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}