import 'dart:ffi';
import 'dart:typed_data';
import 'package:raylib_dartified/raylib_dartified.dart';

extension StringToRaylibC on String {
  Pointer<Char> get toC => String$.Value(this);
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

NativeLitAlloc<bool, Bool> get Bool$ => Temp.getAllocatorOrThrow();
NativeLitPtrAlloc<bool, Bool> get Ptr$Bool$ => Temp.getAllocatorOrThrow();

NativeLitIntAllocators<Int8, Int8List> get Int8$ => Temp.Int8$;
NativeLitIntAllocators<Uint8, Uint8List> get Uint8$ => Temp.Uint8$;
NativeLitIntAllocators<Int16, Int16List> get Int16$ => Temp.Int16$;
NativeLitIntAllocators<Uint16, Uint16List> get Uint16$ => Temp.Uint16$;
NativeLitIntAllocators<Int32, Int32List> get Int32$ => Temp.Int32$;
NativeLitIntAllocators<Uint32, Uint32List> get Uint32$ => Temp.Uint32$;
NativeLitIntAllocators<Int64, Int64List> get Int64$ => Temp.Int64$;
NativeLitIntAllocators<Uint64, Uint64List> get Uint64$ => Temp.Uint64$;
NativeLitFloatAllocators<Float, Float32List> get Float32$ => Temp.Float32$;
NativeLitFloatAllocators<Double, Float64List> get Float64$ => Temp.Float64$;
NativeLitIntAllocators<Int, Int32List> get Int$ => Temp.Int$;
NativeLitIntAllocators<UnsignedInt, Uint32List> get UnsignedInt$ => Temp.UnsignedInt$;
NativeLitIntAllocators<Char, Int8List> get Char$ => Temp.Char$;
NativeLitIntAllocators<UnsignedChar, Uint8List> get UnsignedChar$ => Temp.UnsignedChar$;
NativeLitIntAllocators<Short, Int16List> get Short$ => Temp.Short$;
NativeLitIntAllocators<UnsignedShort, Uint16List> get UnsignedShort$ => Temp.UnsignedShort$;
NativeLitFloatAllocators<Float, Float32List> get Float$ => Temp.Float$;
NativeLitFloatAllocators<Double, Float64List> get Double$ => Temp.Double$;

NativeStructAllocators<AutomationEventListC, AutomationEventListD> get AutomationEventList$ => Temp.AutomationEventList$;
NativeStructAllocators<AutomationEventC, AutomationEventD> get AutomationEvent$ => Temp.AutomationEvent$;
NativeStructAllocators<AudioStreamC, AudioStreamD> get AudioStream$ => Temp.AudioStream$;
NativeStructAllocators<BoneInfoC, BoneInfoD> get BoneInfo$ => Temp.BoneInfo$;
NativeStructAllocators<BoundingBoxC, BoundingBoxD> get BoundingBox$ => Temp.BoundingBox$;
NativeStructAllocators<Camera2DC, Camera2DD> get Camera2D$ => Temp.Camera2D$;
NativeStructAllocators<Camera3DC, Camera3DD> get Camera3D$ => Temp.Camera3D$;
NativeStructAllocators<ColorC, ColorD> get Color$ => Temp.Color$;
NativeStructAllocators<FilePathListC, FilePathListD> get FilePathList$ => Temp.FilePathList$;
NativeStructAllocators<FontC, FontD> get Font$ => Temp.Font$;
NativeStructAllocators<GestureEventC, GestureEventD> get GestureEvent$ => Temp.GestureEvent$;
NativeStructAllocators<GlyphInfoC, GlyphInfoD> get GlyphInfo$ => Temp.GlyphInfo$;
NativeStructAllocators<ImageC, ImageD> get Image$ => Temp.Image$;
NativeStructAllocators<LightC, LightD> get Light$ => Temp.Light$;
NativeStructAllocators<MaterialC, MaterialD> get Material$ => Temp.Material$;
NativeStructAllocators<MaterialMapC, MaterialMapD> get MaterialMap$ => Temp.MaterialMap$;
NativeStructAllocators<MatrixC, MatrixD> get Matrix$ => Temp.Matrix$;
NativeStructAllocators<MeshC, MeshD> get Mesh$ => Temp.Mesh$;
NativeStructAllocators<ModelC, ModelD> get Model$ => Temp.Model$;
NativeStructAllocators<ModelAnimationC, ModelAnimationD> get ModelAnimation$ => Temp.ModelAnimation$;
NativeStructAllocators<ModelSkeletonC, ModelSkeletonD> get ModelSkeleton$ => Temp.ModelSkeleton$;
NativeStructAllocators<MusicC, MusicD> get Music$ => Temp.Music$;
NativeStructAllocators<NPatchInfoC, NPatchInfoD> get NPatchInfo$ => Temp.NPatchInfo$;
NativeStructAllocators<QuaternionC, QuaternionD> get Quaternion$ => Temp.Quaternion$;
NativeStructAllocators<RectangleC, RectangleD> get Rectangle$ => Temp.Rectangle$;
NativeStructAllocators<RlDrawCallC, RlDrawCallD> get RlDrawCall$ => Temp.RlDrawCall$;
NativeStructAllocators<RlRenderBatchC, RlRenderBatchD> get RlRenderBatch$ => Temp.RlRenderBatch$;
NativeStructAllocators<RlVertexBufferC, RlVertexBufferD> get RlVertexBuffer$ => Temp.RlVertexBuffer$;
NativeStructAllocators<RayC, RayD> get Ray$ => Temp.Ray$;
NativeStructAllocators<RayCollisionC, RayCollisionD> get RayCollision$ => Temp.RayCollision$;
NativeStructAllocators<RenderTextureC, RenderTextureD> get RenderTexture$ => Temp.RenderTexture$;
NativeStructAllocators<ShaderC, ShaderD> get Shader$ => Temp.Shader$;
NativeStructAllocators<SoundC, SoundD> get Sound$ => Temp.Sound$;
NativeStructAllocators<TextureC, TextureD> get Texture$ => Temp.Texture$;
NativeStructAllocators<TransformC, TransformD> get Transform$ => Temp.Transform$;
NativeStructAllocators<Vector2C, Vector2D> get Vector2$ => Temp.Vector2$;
NativeStructAllocators<Vector3C, Vector3D> get Vector3$ => Temp.Vector3$;
NativeStructAllocators<Vector4C, Vector4D> get Vector4$ => Temp.Vector4$;
NativeStructAllocators<VrDeviceInfoC, VrDeviceInfoD> get VrDeviceInfo$ => Temp.VrDeviceInfo$;
NativeStructAllocators<VrStereoConfigC, VrStereoConfigD> get VrStereoConfig$ => Temp.VrStereoConfig$;
NativeStructAllocators<WaveC, WaveD> get Wave$ => Temp.Wave$;

double rand() => rl.rand();

double randC() => rl.randC();

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