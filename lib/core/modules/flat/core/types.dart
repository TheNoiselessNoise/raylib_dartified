part of '../../../raylib_dartified.dart';

// AutomationEventList

extension AutomationEventListCPEx on Pointer<AutomationEventListC> {
  AutomationEventList toDart() => ref.toDart(this);
}

extension AutomationEventListCEx on AutomationEventListC {
  AutomationEventList toDart([Pointer<AutomationEventListC>? ptr]) => .new(
    op: AutomationEventList.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// AutomationEvent

extension AutomationEventCPEx on Pointer<AutomationEventC> {
  AutomationEvent toDart() => ref.toDart(this);
}

extension AutomationEventCEx on AutomationEventC {
  AutomationEvent toDart([Pointer<AutomationEventC>? ptr]) => .new(
    op: AutomationEvent.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// BoneInfo

extension BoneInfoCPEx on Pointer<BoneInfoC> {
  BoneInfo toDart() => ref.toDart(this);
}

extension BoneInfoCEx on BoneInfoC {
  BoneInfo toDart([Pointer<BoneInfoC>? ptr]) => .new(
    op: BoneInfo.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// BoundingBox

extension BoundingBoxCPEx on Pointer<BoundingBoxC> {
  BoundingBox toDart() => ref.toDart(this);
}

extension BoundingBoxCEx on BoundingBoxC {
  BoundingBox toDart([Pointer<BoundingBoxC>? ptr]) => .new(
    op: BoundingBox.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Camera2D

extension Camera2DCPEx on Pointer<Camera2DC> {
  Camera2D toDart() => ref.toDart(this);
}

extension Camera2DCEx on Camera2DC {
  Camera2D toDart([Pointer<Camera2DC>? ptr]) => .new(
    op: Camera2D.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Camera3D

extension Camera3DCPEx on Pointer<Camera3DC> {
  Camera3D toDart() => ref.toDart(this);
}

extension Camera3DCEx on Camera3DC {
  Camera3D toDart([Pointer<Camera3DC>? ptr]) => .new(
    op: Camera3D.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Color

extension ColorCPEx on Pointer<ColorC> {
  Pointer<ColorC> set(num r, num g, num b, num a) { ref.set(r, g, b, a); return this; }
  Color toDart() => ref.toDart(this);
}

extension ColorCEx on ColorC {
  ColorC set(num r, num g, num b, num a) {
    this.r = r.toInt();
    this.g = g.toInt();
    this.b = b.toInt();
    this.a = a.toInt();
    return this;
  }

  Color toDart([Pointer<ColorC>? ptr]) => .new(
    op: Color.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// FilePathList

extension FilePathListCPEx on Pointer<FilePathListC> {
  FilePathList toDart() => ref.toDart(this);
}

extension FilePathListCEx on FilePathListC {
  FilePathList toDart([Pointer<FilePathListC>? ptr]) => .new(
    op: FilePathList.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Font

extension FontCPEx on Pointer<FontC> {
  Font toDart() => ref.toDart(this);
}

extension FontCEx on FontC {
  Font toDart([Pointer<FontC>? ptr]) => .new(
    op: Font.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// GestureEvent

extension GestureEventCPEx on Pointer<GestureEventC> {
  GestureEvent toDart() => ref.toDart(this);
}

extension GestureEventCEx on GestureEventC {
  GestureEvent toDart([Pointer<GestureEventC>? ptr]) => .new(
    op: GestureEvent.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// GlyphInfo

extension GlyphInfoCPEx on Pointer<GlyphInfoC> {
  GlyphInfo toDart() => ref.toDart(this);
}

extension GlyphInfoCEx on GlyphInfoC {
  GlyphInfo toDart([Pointer<GlyphInfoC>? ptr]) => .new(
    op: GlyphInfo.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Image

extension ImageCPEx on Pointer<ImageC> {
  Image toDart() => ref.toDart(this);
}

extension ImageCEx on ImageC {
  Image toDart([Pointer<ImageC>? ptr]) => .new(
    op: Image.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// MaterialMap

extension MaterialMapCPEx on Pointer<MaterialMapC> {
  MaterialMap toDart() => ref.toDart(this);
}

extension MaterialMapCEx on MaterialMapC {
  MaterialMap toDart([Pointer<MaterialMapC>? ptr]) => .new(
    op: MaterialMap.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Material

extension MaterialCPEx on Pointer<MaterialC> {
  Material toDart() => ref.toDart(this);
}

extension MaterialCEx on MaterialC {
  Material toDart([Pointer<MaterialC>? ptr]) => .new(
    op: Material.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Matrix

extension MatrixCPEx on Pointer<MatrixC> {
  Matrix toDart() => ref.toDart(this);
}

extension MatrixCEx on MatrixC {
  Matrix toDart([Pointer<MatrixC>? ptr]) => .new(
    op: Matrix.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Mesh

extension MeshCPEx on Pointer<MeshC> {
  Mesh toDart() => ref.toDart(this);
}

extension MeshCEx on MeshC {
  Mesh toDart([Pointer<MeshC>? ptr]) => .new(
    op: Mesh.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// ModelAnimation

extension ModelAnimationCPEx on Pointer<ModelAnimationC> {
  ModelAnimation toDart() => ref.toDart(this);
}

extension ModelAnimationCEx on ModelAnimationC {
  ModelAnimation toDart([Pointer<ModelAnimationC>? ptr]) => .new(
    op: ModelAnimation.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// ModelSkeleton

extension ModelSkeletonCPEx on Pointer<ModelSkeletonC> {
  ModelSkeleton toDart() => ref.toDart(this);
}

extension ModelSkeletonCEx on ModelSkeletonC {
  ModelSkeleton toDart([Pointer<ModelSkeletonC>? ptr]) => .new(
    op: ModelSkeleton.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Model

extension ModelCPEx on Pointer<ModelC> {
  Model toDart() => ref.toDart(this);
}

extension ModelCEx on ModelC {
  Model toDart([Pointer<ModelC>? ptr]) => .new(
    op: Model.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// NPatchInfo

extension NPatchInfoCPEx on Pointer<NPatchInfoC> {
  NPatchInfo toDart() => ref.toDart(this);
}

extension NPatchInfoCEx on NPatchInfoC {
  NPatchInfo toDart([Pointer<NPatchInfoC>? ptr]) => .new(
    op: NPatchInfo.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Quaternion

extension QuaternionCPEx on Pointer<QuaternionC> {
  Quaternion toDart() => ref.toDart(this);
}

extension QuaternionCEx on QuaternionC {
  Quaternion toDart([Pointer<QuaternionC>? ptr]) => .new(
    op: Quaternion.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// RayCollision

extension RayCollisionCPEx on Pointer<RayCollisionC> {
  RayCollision toDart() => ref.toDart(this);
}

extension RayCollisionCEx on RayCollisionC {
  RayCollision toDart([Pointer<RayCollisionC>? ptr]) => .new(
    op: RayCollision.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Ray

extension RayCPEx on Pointer<RayC> {
  Ray toDart() => ref.toDart(this);
}

extension RayCEx on RayC {
  Ray toDart([Pointer<RayC>? ptr]) => .new(
    op: Ray.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Rectangle

extension RectangleCPEx on Pointer<RectangleC> {
  Rectangle toDart() => ref.toDart(this);
}

extension RectangleCEx on RectangleC {
  Rectangle toDart([Pointer<RectangleC>? ptr]) => .new(
    op: Rectangle.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// RenderTexture

extension RenderTextureCPEx on Pointer<RenderTextureC> {
  RenderTexture toDart() => ref.toDart(this);
}

extension RenderTextureCEx on RenderTextureC {
  RenderTexture toDart([Pointer<RenderTextureC>? ptr]) => .new(
    op: RenderTexture.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Shader

extension ShaderCPEx on Pointer<ShaderC> {
  Shader toDart() => ref.toDart(this);
}

extension ShaderCEx on ShaderC {
  Shader toDart([Pointer<ShaderC>? ptr]) => .new(
    op: Shader.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Texture

extension TextureCPEx on Pointer<TextureC> {
  Texture toDart() => ref.toDart(this);
}

extension TextureCEx on TextureC {
  Texture toDart([Pointer<TextureC>? ptr]) => .new(
    op: Texture.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Transform

extension TransformCPEx on Pointer<TransformC> {
  Transform toDart() => ref.toDart(this);
}

extension TransformCEx on TransformC {
  Transform toDart([Pointer<TransformC>? ptr]) => .new(
    op: Transform.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Vector2

extension Vector2CPEx on Pointer<Vector2C> {
  Vector2 toDart() => ref.toDart(this);
}

extension Vector2CEx on Vector2C {
  Vector2 toDart([Pointer<Vector2C>? ptr]) => .new(
    op: Vector2.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Vector3

extension Vector3CPEx on Pointer<Vector3C> {
  Vector3 toDart() => ref.toDart(this);
}

extension Vector3CEx on Vector3C {
  Vector3 toDart([Pointer<Vector3C>? ptr]) => .new(
    op: Vector3.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// Vector4

extension Vector4CPEx on Pointer<Vector4C> {
  Vector4 toDart() => ref.toDart(this);
}

extension Vector4CEx on Vector4C {
  Vector4 toDart([Pointer<Vector4C>? ptr]) => .new(
    op: Vector4.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// VrDeviceInfo

extension VrDeviceInfoCPEx on Pointer<VrDeviceInfoC> {
  VrDeviceInfo toDart() => ref.toDart(this);
}

extension VrDeviceInfoCEx on VrDeviceInfoC {
  VrDeviceInfo toDart([Pointer<VrDeviceInfoC>? ptr]) => .new(
    op: VrDeviceInfo.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// VrStereoConfig

extension VrStereoConfigCPEx on Pointer<VrStereoConfigC> {
  VrStereoConfig toDart() => ref.toDart(this);
}

extension VrStereoConfigCEx on VrStereoConfigC {
  VrStereoConfig toDart([Pointer<VrStereoConfigC>? ptr]) => .new(
    op: VrStereoConfig.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// float16

// ignore: camel_case_extensions
extension float16CPEx on Pointer<float16C> {
  float16 toDart() => ref.toDart(this);
}

// ignore: camel_case_extensions
extension float16CEx on float16C {
  float16 toDart([Pointer<float16C>? ptr]) => .new(
    op: float16.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// float3

// ignore: camel_case_extensions
extension float3CPEx on Pointer<float3C> {
  float3 toDart() => ref.toDart(this);
}

// ignore: camel_case_extensions
extension float3CEx on float3C {
  float3 toDart([Pointer<float3C>? ptr]) => .new(
    op: float3.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}