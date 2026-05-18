// ignore_for_file: camel_case_types

part of '../../../raylib_dartified.dart';

final class RlVertexBufferC extends Struct {
  @Int()
  external int elementCount;

  external Pointer<Float> vertices;

  external Pointer<Float> texcoords;

  external Pointer<Float> normals;

  external Pointer<UnsignedChar> colors;

  external Pointer<UnsignedInt> indices;

  @UnsignedInt()
  external int vaoId;

  @Array.multi([5])
  external Array<UnsignedInt> vboId;
}

final class RlDrawCallC extends Struct {
  @Int()
  external int mode;

  @Int()
  external int vertexCount;

  @Int()
  external int vertexAlignment;

  @UnsignedInt()
  external int textureId;
}

final class RlRenderBatchC extends Struct {
  @Int()
  external int bufferCount;

  @Int()
  external int currentBuffer;

  external Pointer<RlVertexBufferC> vertexBuffer;

  external Pointer<RlDrawCallC> draws;

  @Int()
  external int drawCounter;

  @Float()
  external double currentDepth;
}