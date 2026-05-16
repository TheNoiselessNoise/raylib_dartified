part of '../../../raylib.dart';

// NOTE: va_list is unsolved computer science problem
// typedef TraceLogCallbackFunction =
//     Void Function(
//       Int logLevel,
//       Pointer<Char> text,
//       Pointer<__va_list_tag> args,
//     );
// typedef TraceLogCallback =
//     Pointer<NativeFunction<TraceLogCallbackFunction>>;
typedef LoadFileDataCallbackFunctionC =
    Pointer<UnsignedChar> Function(
      Pointer<Char> fileName,
      Pointer<Int> dataSize,
    );
typedef LoadFileDataCallbackC =
    Pointer<NativeFunction<LoadFileDataCallbackFunctionC>>;
typedef SaveFileDataCallbackFunctionC =
    Bool Function(
      Pointer<Char> fileName,
      Pointer<Void> data,
      Int dataSize,
    );
typedef SaveFileDataCallbackC =
    Pointer<NativeFunction<SaveFileDataCallbackFunctionC>>;
typedef LoadFileTextCallbackFunctionC =
    Pointer<Char> Function(Pointer<Char> fileName);
typedef LoadFileTextCallbackC =
    Pointer<NativeFunction<LoadFileTextCallbackFunctionC>>;
typedef SaveFileTextCallbackFunctionC =
    Bool Function(
      Pointer<Char> fileName,
      Pointer<Char> text,
    );
typedef SaveFileTextCallbackC =
    Pointer<NativeFunction<SaveFileTextCallbackFunctionC>>;
typedef AudioCallbackFunctionC =
    Void Function(Pointer<Void> bufferData, UnsignedInt frames);
typedef AudioCallbackC = Pointer<NativeFunction<AudioCallbackFunctionC>>;

final class ColorC extends Struct {
  @UnsignedChar()
  external int r;

  @UnsignedChar()
  external int g;

  @UnsignedChar()
  external int b;

  @UnsignedChar()
  external int a;
}

final class RectangleC extends Struct {
  @Float()
  external double x;

  @Float()
  external double y;

  @Float()
  external double width;

  @Float()
  external double height;
}

final class Vector2C extends Struct {
  @Float()
  external double x;

  @Float()
  external double y;
}

final class Vector3C extends Struct {
  @Float()
  external double x;

  @Float()
  external double y;

  @Float()
  external double z;
}

final class Vector4C extends Struct {
  @Float()
  external double x;

  @Float()
  external double y;

  @Float()
  external double z;

  @Float()
  external double w;
}

final class QuaternionC extends Struct {
  @Float()
  external double x;

  @Float()
  external double y;

  @Float()
  external double z;

  @Float()
  external double w;
}

final class MatrixC extends Struct {
  @Float()
  external double m0;

  @Float()
  external double m4;

  @Float()
  external double m8;

  @Float()
  external double m12;

  @Float()
  external double m1;

  @Float()
  external double m5;

  @Float()
  external double m9;

  @Float()
  external double m13;

  @Float()
  external double m2;

  @Float()
  external double m6;

  @Float()
  external double m10;

  @Float()
  external double m14;

  @Float()
  external double m3;

  @Float()
  external double m7;

  @Float()
  external double m11;

  @Float()
  external double m15;
}

final class BoundingBoxC extends Struct {
  external Vector3C min;

  external Vector3C max;
}

final class NPatchInfoC extends Struct {
  external RectangleC source;

  @Int()
  external int left;

  @Int()
  external int top;

  @Int()
  external int right;

  @Int()
  external int bottom;

  @Int()
  external int layout;
}

final class RayC extends Struct {
  external Vector3C position;

  external Vector3C direction;
}

final class RayCollisionC extends Struct {
  @Bool()
  external bool hit;

  @Float()
  external double distance;

  external Vector3C point;

  external Vector3C normal;
}

final class ImageC extends Struct {
  external Pointer<Void> data;

  @Int()
  external int width;

  @Int()
  external int height;

  @Int()
  external int mipmaps;

  @Int()
  external int format;
}

final class TextureC extends Struct {
  @UnsignedInt()
  external int id;

  @Int()
  external int width;

  @Int()
  external int height;

  @Int()
  external int mipmaps;

  @Int()
  external int format;
}

final class RenderTextureC extends Struct {
  @UnsignedInt()
  external int id;

  external TextureC texture;

  external TextureC depth;
}

final class GlyphInfoC extends Struct {
  @Int()
  external int value;

  @Int()
  external int offsetX;

  @Int()
  external int offsetY;

  @Int()
  external int advanceX;

  external ImageC image;
}

final class FontC extends Struct {
  @Int()
  external int baseSize;

  @Int()
  external int glyphCount;

  @Int()
  external int glyphPadding;

  external TextureC texture;

  external Pointer<RectangleC> recs;

  external Pointer<GlyphInfoC> glyphs;
}

final class Camera3DC extends Struct {
  external Vector3C position;

  external Vector3C target;

  external Vector3C up;

  @Float()
  external double fovy;

  @Int()
  external int projection;
}

final class Camera2DC extends Struct {
  external Vector2C offset;

  external Vector2C target;

  @Float()
  external double rotation;

  @Float()
  external double zoom;
}

final class MeshC extends Struct {
  @Int()
  external int vertexCount;

  @Int()
  external int triangleCount;

  external Pointer<Float> vertices;

  external Pointer<Float> texcoords;

  external Pointer<Float> texcoords2;

  external Pointer<Float> normals;

  external Pointer<Float> tangents;

  external Pointer<UnsignedChar> colors;

  external Pointer<UnsignedShort> indices;

  external Pointer<Float> animVertices;

  external Pointer<Float> animNormals;

  external Pointer<UnsignedChar> boneIds;

  external Pointer<Float> boneWeights;

  external Pointer<MatrixC> boneMatrices;

  @Int()
  external int boneCount;

  @UnsignedInt()
  external int vaoId;

  external Pointer<UnsignedInt> vboId;
}

final class ShaderC extends Struct {
  @UnsignedInt()
  external int id;

  external Pointer<Int> locs;
}

final class MaterialMapC extends Struct {
  external TextureC texture;

  external ColorC color;

  @Float()
  external double value;
}

final class MaterialC extends Struct {
  external ShaderC shader;

  external Pointer<MaterialMapC> maps;

  @Array.multi([4])
  external Array<Float> params;
}

final class TransformC extends Struct {
  external Vector3C translation;

  external QuaternionC rotation;

  external Vector3C scale;
}

final class BoneInfoC extends Struct {
  @Array.multi([32])
  external Array<Char> name;

  @Int()
  external int parent;
}

final class ModelC extends Struct {
  external MatrixC transform;

  @Int()
  external int meshCount;

  @Int()
  external int materialCount;

  external Pointer<MeshC> meshes;

  external Pointer<MaterialC> materials;

  external Pointer<Int> meshMaterial;

  @Int()
  external int boneCount;

  external Pointer<BoneInfoC> bones;

  external Pointer<TransformC> bindPose;
}

final class ModelAnimationC extends Struct {
  @Int()
  external int boneCount;

  @Int()
  external int frameCount;

  external Pointer<BoneInfoC> bones;

  external Pointer<Pointer<TransformC>> framePoses;

  @Array.multi([32])
  external Array<Char> name;
}

final class VrDeviceInfoC extends Struct {
  @Int()
  external int hResolution;

  @Int()
  external int vResolution;

  @Float()
  external double hScreenSize;

  @Float()
  external double vScreenSize;

  @Float()
  external double eyeToScreenDistance;

  @Float()
  external double lensSeparationDistance;

  @Float()
  external double interpupillaryDistance;

  @Array.multi([4])
  external Array<Float> lensDistortionValues;

  @Array.multi([4])
  external Array<Float> chromaAbCorrection;
}

final class VrStereoConfigC extends Struct {
  @Array.multi([2])
  external Array<MatrixC> projection;

  @Array.multi([2])
  external Array<MatrixC> viewOffset;

  @Array.multi([2])
  external Array<Float> leftLensCenter;

  @Array.multi([2])
  external Array<Float> rightLensCenter;

  @Array.multi([2])
  external Array<Float> leftScreenCenter;

  @Array.multi([2])
  external Array<Float> rightScreenCenter;

  @Array.multi([2])
  external Array<Float> scale;

  @Array.multi([2])
  external Array<Float> scaleIn;
}

final class FilePathListC extends Struct {
  @UnsignedInt()
  external int capacity;

  @UnsignedInt()
  external int count;

  external Pointer<Pointer<Char>> paths;
}

final class AutomationEventC extends Struct {
  @UnsignedInt()
  external int frame;

  @UnsignedInt()
  external int type;

  @Array.multi([4])
  external Array<Int> params;
}

final class AutomationEventListC extends Struct {
  @UnsignedInt()
  external int capacity;

  @UnsignedInt()
  external int count;

  external Pointer<AutomationEventC> events;
}