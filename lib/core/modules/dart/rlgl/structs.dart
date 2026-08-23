part of '../../../raylib_dartified.dart';

// rlDrawCall

extension RlDrawCallCPEx on Pointer<RlDrawCallC> {
  RlDrawCallD toD() => ref.toD(this);
}

extension RlDrawCallCEx on RlDrawCallC {
  RlDrawCallD toD([Pointer<RlDrawCallC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    mode: .fromValue(mode),
    vertexCount: vertexCount,
    vertexAlignment: vertexAlignment,
    textureId: textureId,
  );
}

// rlRenderBatch

extension RlRenderBatchCPEx on Pointer<RlRenderBatchC> {
  RlRenderBatchD toD() => ref.toD(this);
}

extension RlRenderBatchCEx on RlRenderBatchC {
  RlRenderBatchD toD([Pointer<RlRenderBatchC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
    bufferCount: bufferCount,
    currentBuffer: currentBuffer,
    vertexBuffer: vertexBuffer.address != 0
      ? .generate(bufferCount, (i) => vertexBuffer[i].toD(vertexBuffer + i))
      : [],
    draws: draws.address != 0
      ? .generate(drawCounter, (i) => draws[i].toD(draws + i))
      : [],
    drawCounter: drawCounter,
    currentDepth: currentDepth,
  );
}

// rlVertexBuffer

extension RlVertexBufferCPEx on Pointer<RlVertexBufferC> {
  RlVertexBufferD toD() => ref.toD(this);
}

extension RlVertexBufferCEx on RlVertexBufferC {
  int get verticesCount => RlVertexBufferD.BASE_verticesCount(elementCount);
  int get texcoordsCount => RlVertexBufferD.BASE_texcoordsCount(elementCount);
  int get normalsCount => RlVertexBufferD.BASE_normalsCount(elementCount);
  int get colorsCount => RlVertexBufferD.BASE_colorsCount(elementCount);
  int get indicesCount => RlVertexBufferD.BASE_indicesCount(elementCount);
  int get vboIdCount => RlVertexBufferD.BASE_vboIdCount;

  RlVertexBufferD toD([Pointer<RlVertexBufferC>? ptr]) => .new(
    op: NativeMemoryPointer.orNull(ptr),
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