import 'dart:ffi';
import 'dart:typed_data';
import 'package:raylib_dartified/raylib_dartified.dart';

extension StringToRaylibC on String {
  Pointer<Char> get toC => Raylib.instance.Temp.String$.Value(this);
}

Raylib get rl => Raylib.instance;

T registerModule<T extends RaylibModule>(T Function(Raylib rl) moduleLoader)
  => rl.registerModule<T>(moduleLoader(rl));

T module<T extends RaylibModule>() => rl.module<T>();

void disposeRaylib() => rl.dispose();

void CloseWindowAndDispose() => rl.CloseWindowAndDispose();

RaylibTemp get Temp => rl.Temp;

NativeTypedDataListAlloc get TypedDataList$ => Temp.TypedDataList$;

NativeStringAlloc get String$ => Temp.String$;

NativeLitAlloc<bool, Bool> get Bool$ => Temp.Bool$;
NativeLitPtrAlloc<bool, Bool> get Ptr$Bool$ => Temp.Ptr$Bool$;

NativeLitIntAlloc<Int8, Int8List> get Int8$ => Temp.Int8$;
NativeLitPtrAlloc<int, Int8> get Ptr$Int8$ => Temp.Ptr$Int8$;
NativeLitIntAlloc<Uint8, Uint8List> get Uint8$ => Temp.Uint8$;
NativeLitPtrAlloc<int, Uint8> get Ptr$Uint8$ => Temp.Ptr$Uint8$;
NativeLitIntAlloc<Int16, Int16List> get Int16$ => Temp.Int16$;
NativeLitPtrAlloc<int, Int16> get Ptr$Int16$ => Temp.Ptr$Int16$;
NativeLitIntAlloc<Uint16, Uint16List> get Uint16$ => Temp.Uint16$;
NativeLitPtrAlloc<int, Uint16> get Ptr$Uint16$ => Temp.Ptr$Uint16$;
NativeLitIntAlloc<Int32, Int32List> get Int32$ => Temp.Int32$;
NativeLitPtrAlloc<int, Int32> get Ptr$Int32$ => Temp.Ptr$Int32$;
NativeLitIntAlloc<Uint32, Uint32List> get Uint32$ => Temp.Uint32$;
NativeLitPtrAlloc<int, Uint32> get Ptr$Uint32$ => Temp.Ptr$Uint32$;
NativeLitIntAlloc<Int64, Int64List> get Int64$ => Temp.Int64$;
NativeLitPtrAlloc<int, Int64> get Ptr$Int64$ => Temp.Ptr$Int64$;
NativeLitIntAlloc<Uint64, Uint64List> get Uint64$ => Temp.Uint64$;
NativeLitPtrAlloc<int, Uint64> get Ptr$Uint64$ => Temp.Ptr$Uint64$;
NativeLitFloatAlloc<Float, Float32List> get Float32$ => Temp.Float32$;
NativeLitPtrAlloc<double, Float> get Ptr$Float32$ => Temp.Ptr$Float32$;
NativeLitFloatAlloc<Double, Float64List> get Float64$ => Temp.Float64$;
NativeLitPtrAlloc<double, Double> get Ptr$Float64$ => Temp.Ptr$Float64$;

NativeLitIntAlloc<Int, Int32List> get Int$ => Temp.Int$;
NativeLitPtrAlloc<int, Int> get Ptr$Int$ => Temp.Ptr$Int$;
NativeLitIntAlloc<UnsignedInt, Uint32List> get UnsignedInt$ => Temp.UnsignedInt$;
NativeLitPtrAlloc<int, UnsignedInt> get Ptr$UnsignedInt$ => Temp.Ptr$UnsignedInt$;
NativeLitIntAlloc<Char, Int8List> get Char$ => Temp.Char$;
NativeLitPtrAlloc<int, Char> get Ptr$Char$ => Temp.Ptr$Char$;
NativeLitIntAlloc<UnsignedChar, Uint8List> get UnsignedChar$ => Temp.UnsignedChar$;
NativeLitPtrAlloc<int, UnsignedChar> get Ptr$UnsignedChar$ => Temp.Ptr$UnsignedChar$;
NativeLitIntAlloc<Short, Int16List> get Short$ => Temp.Short$;
NativeLitPtrAlloc<int, Short> get Ptr$Short$ => Temp.Ptr$Short$;
NativeLitIntAlloc<UnsignedShort, Uint16List> get UnsignedShort$ => Temp.UnsignedShort$;
NativeLitPtrAlloc<int, UnsignedShort> get Ptr$UnsignedShort$ => Temp.Ptr$UnsignedShort$;

NativeStructAlloc<AutomationEventListC, AutomationEventListD> get AutomationEventList$ => Temp.AutomationEventList$;
NativeStructPtrAlloc<AutomationEventListC, AutomationEventListD> get Ptr$AutomationEventList$ => Temp.Ptr$AutomationEventList$;
NativeStructAlloc<AutomationEventC, AutomationEventD> get AutomationEvent$ => Temp.AutomationEvent$;
NativeStructPtrAlloc<AutomationEventC, AutomationEventD> get Ptr$AutomationEvent$ => Temp.Ptr$AutomationEvent$;
NativeStructAlloc<AudioStreamC, AudioStreamD> get AudioStream$ => Temp.AudioStream$;
NativeStructPtrAlloc<AudioStreamC, AudioStreamD> get Ptr$AudioStream$ => Temp.Ptr$AudioStream$;
NativeStructAlloc<BoneInfoC, BoneInfoD> get BoneInfo$ => Temp.BoneInfo$;
NativeStructPtrAlloc<BoneInfoC, BoneInfoD> get Ptr$BoneInfo$ => Temp.Ptr$BoneInfo$;
NativeStructAlloc<BoundingBoxC, BoundingBoxD> get BoundingBox$ => Temp.BoundingBox$;
NativeStructPtrAlloc<BoundingBoxC, BoundingBoxD> get Ptr$BoundingBox$ => Temp.Ptr$BoundingBox$;
NativeStructAlloc<Camera2DC, Camera2DD> get Camera2D$ => Temp.Camera2D$;
NativeStructPtrAlloc<Camera2DC, Camera2DD> get Ptr$Camera2D$ => Temp.Ptr$Camera2D$;
NativeStructAlloc<Camera3DC, Camera3DD> get Camera3D$ => Temp.Camera3D$;
NativeStructPtrAlloc<Camera3DC, Camera3DD> get Ptr$Camera3D$ => Temp.Ptr$Camera3D$;
NativeStructAlloc<ColorC, ColorD> get Color$ => Temp.Color$;
NativeStructPtrAlloc<ColorC, ColorD> get Ptr$Color$ => Temp.Ptr$Color$;
NativeStructAlloc<FilePathListC, FilePathListD> get FilePathList$ => Temp.FilePathList$;
NativeStructPtrAlloc<FilePathListC, FilePathListD> get Ptr$FilePathList$ => Temp.Ptr$FilePathList$;
NativeStructAlloc<FontC, FontD> get Font$ => Temp.Font$;
NativeStructPtrAlloc<FontC, FontD> get Ptr$Font$ => Temp.Ptr$Font$;
NativeStructAlloc<GestureEventC, GestureEventD> get GestureEvent$ => Temp.GestureEvent$;
NativeStructPtrAlloc<GestureEventC, GestureEventD> get Ptr$GestureEvent$ => Temp.Ptr$GestureEvent$;
NativeStructAlloc<GlyphInfoC, GlyphInfoD> get GlyphInfo$ => Temp.GlyphInfo$;
NativeStructPtrAlloc<GlyphInfoC, GlyphInfoD> get Ptr$GlyphInfo$ => Temp.Ptr$GlyphInfo$;
NativeStructAlloc<ImageC, ImageD> get Image$ => Temp.Image$;
NativeStructPtrAlloc<ImageC, ImageD> get Ptr$Image$ => Temp.Ptr$Image$;
NativeStructAlloc<LightC, LightD> get Light$ => Temp.Light$;
NativeStructPtrAlloc<LightC, LightD> get Ptr$Light$ => Temp.Ptr$Light$;
NativeStructAlloc<MaterialC, MaterialD> get Material$ => Temp.Material$;
NativeStructPtrAlloc<MaterialC, MaterialD> get Ptr$Material$ => Temp.Ptr$Material$;
NativeStructAlloc<MaterialMapC, MaterialMapD> get MaterialMap$ => Temp.MaterialMap$;
NativeStructPtrAlloc<MaterialMapC, MaterialMapD> get Ptr$MaterialMap$ => Temp.Ptr$MaterialMap$;
NativeStructAlloc<MatrixC, MatrixD> get Matrix$ => Temp.Matrix$;
NativeStructPtrAlloc<MatrixC, MatrixD> get Ptr$Matrix$ => Temp.Ptr$Matrix$;
NativeStructAlloc<MeshC, MeshD> get Mesh$ => Temp.Mesh$;
NativeStructPtrAlloc<MeshC, MeshD> get Ptr$Mesh$ => Temp.Ptr$Mesh$;
NativeStructAlloc<ModelC, ModelD> get Model$ => Temp.Model$;
NativeStructPtrAlloc<ModelC, ModelD> get Ptr$Model$ => Temp.Ptr$Model$;
NativeStructAlloc<ModelAnimationC, ModelAnimationD> get ModelAnimation$ => Temp.ModelAnimation$;
NativeStructPtrAlloc<ModelAnimationC, ModelAnimationD> get Ptr$ModelAnimation$ => Temp.Ptr$ModelAnimation$;
NativeStructAlloc<ModelSkeletonC, ModelSkeletonD> get ModelSkeleton$ => Temp.ModelSkeleton$;
NativeStructPtrAlloc<ModelSkeletonC, ModelSkeletonD> get Ptr$ModelSkeleton$ => Temp.Ptr$ModelSkeleton$;
NativeStructAlloc<MusicC, MusicD> get Music$ => Temp.Music$;
NativeStructPtrAlloc<MusicC, MusicD> get Ptr$Music$ => Temp.Ptr$Music$;
NativeStructAlloc<NPatchInfoC, NPatchInfoD> get NPatchInfo$ => Temp.NPatchInfo$;
NativeStructPtrAlloc<NPatchInfoC, NPatchInfoD> get Ptr$NPatchInfo$ => Temp.Ptr$NPatchInfo$;
NativeStructAlloc<QuaternionC, QuaternionD> get Quaternion$ => Temp.Quaternion$;
NativeStructPtrAlloc<QuaternionC, QuaternionD> get Ptr$Quaternion$ => Temp.Ptr$Quaternion$;
NativeStructAlloc<RectangleC, RectangleD> get Rectangle$ => Temp.Rectangle$;
NativeStructPtrAlloc<RectangleC, RectangleD> get Ptr$Rectangle$ => Temp.Ptr$Rectangle$;
NativeStructAlloc<RlDrawCallC, RlDrawCallD> get RlDrawCall$ => Temp.RlDrawCall$;
NativeStructPtrAlloc<RlDrawCallC, RlDrawCallD> get Ptr$RlDrawCall$ => Temp.Ptr$RlDrawCall$;
NativeStructAlloc<RlRenderBatchC, RlRenderBatchD> get RlRenderBatch$ => Temp.RlRenderBatch$;
NativeStructPtrAlloc<RlRenderBatchC, RlRenderBatchD> get Ptr$RlRenderBatch$ => Temp.Ptr$RlRenderBatch$;
NativeStructAlloc<RlVertexBufferC, RlVertexBufferD> get RlVertexBuffer$ => Temp.RlVertexBuffer$;
NativeStructPtrAlloc<RlVertexBufferC, RlVertexBufferD> get Ptr$RlVertexBuffer$ => Temp.Ptr$RlVertexBuffer$;
NativeStructAlloc<RayC, RayD> get Ray$ => Temp.Ray$;
NativeStructPtrAlloc<RayC, RayD> get Ptr$Ray$ => Temp.Ptr$Ray$;
NativeStructAlloc<RayCollisionC, RayCollisionD> get RayCollision$ => Temp.RayCollision$;
NativeStructPtrAlloc<RayCollisionC, RayCollisionD> get Ptr$RayCollision$ => Temp.Ptr$RayCollision$;
NativeStructAlloc<RenderTextureC, RenderTextureD> get RenderTexture$ => Temp.RenderTexture$;
NativeStructPtrAlloc<RenderTextureC, RenderTextureD> get Ptr$RenderTexture$ => Temp.Ptr$RenderTexture$;
NativeStructAlloc<ShaderC, ShaderD> get Shader$ => Temp.Shader$;
NativeStructPtrAlloc<ShaderC, ShaderD> get Ptr$Shader$ => Temp.Ptr$Shader$;
NativeStructAlloc<SoundC, SoundD> get Sound$ => Temp.Sound$;
NativeStructPtrAlloc<SoundC, SoundD> get Ptr$Sound$ => Temp.Ptr$Sound$;
NativeStructAlloc<TextureC, TextureD> get Texture$ => Temp.Texture$;
NativeStructPtrAlloc<TextureC, TextureD> get Ptr$Texture$ => Temp.Ptr$Texture$;
NativeStructAlloc<TransformC, TransformD> get Transform$ => Temp.Transform$;
NativeStructPtrAlloc<TransformC, TransformD> get Ptr$Transform$ => Temp.Ptr$Transform$;
NativeStructAlloc<Vector2C, Vector2D> get Vector2$ => Temp.Vector2$;
NativeStructPtrAlloc<Vector2C, Vector2D> get Ptr$Vector2$ => Temp.Ptr$Vector2$;
NativeStructAlloc<Vector3C, Vector3D> get Vector3$ => Temp.Vector3$;
NativeStructPtrAlloc<Vector3C, Vector3D> get Ptr$Vector3$ => Temp.Ptr$Vector3$;
NativeStructAlloc<Vector4C, Vector4D> get Vector4$ => Temp.Vector4$;
NativeStructPtrAlloc<Vector4C, Vector4D> get Ptr$Vector4$ => Temp.Ptr$Vector4$;
NativeStructAlloc<VrDeviceInfoC, VrDeviceInfoD> get VrDeviceInfo$ => Temp.VrDeviceInfo$;
NativeStructPtrAlloc<VrDeviceInfoC, VrDeviceInfoD> get Ptr$VrDeviceInfo$ => Temp.Ptr$VrDeviceInfo$;
NativeStructAlloc<VrStereoConfigC, VrStereoConfigD> get VrStereoConfig$ => Temp.VrStereoConfig$;
NativeStructPtrAlloc<VrStereoConfigC, VrStereoConfigD> get Ptr$VrStereoConfig$ => Temp.Ptr$VrStereoConfig$;
NativeStructAlloc<WaveC, WaveD> get Wave$ => Temp.Wave$;
NativeStructPtrAlloc<WaveC, WaveD> get Ptr$Wave$ => Temp.Ptr$Wave$;

Pointer<Void> realloc(Pointer<Void> oldPtr, int oldSize, int newSize)
  => Temp.Utils.realloc(oldPtr, oldSize, newSize);

void memset(Pointer<Void> ptr, int value, int size)
  => Temp.Utils.memset(ptr, value, size);

void memcpy(Pointer<Void> dest, Pointer<Void> src, int n)
  => Temp.Utils.memcpy(dest, src, n);

int memcmp(Pointer<Void> a, Pointer<Void> b, int n)
  => Temp.Utils.memcmp(a, b, n);

int strlen(Pointer<Void> ptr)
  => Temp.Utils.strlen(ptr);

int strcmp(Pointer<Void> a, Pointer<Void> b)
  => Temp.Utils.strcmp(a, b);

void strcpy(Pointer<Void> dest, Pointer<Void> src)
  => Temp.Utils.strcpy(dest, src);

void strncpy(Pointer<Void> dest, Pointer<Void> src, int n)
  => Temp.Utils.strncpy(dest, src, n);

int strnlen(Pointer<Void> ptr, int maxLen)
  => Temp.Utils.strnlen(ptr, maxLen);

void strncat(Pointer<Void> dest, Pointer<Void> src, int n)
  => Temp.Utils.strncat(dest, src, n);

Pointer<Void> strstr(Pointer<Void> haystack, Pointer<Void> needle)
  => Temp.Utils.strstr(haystack, needle);