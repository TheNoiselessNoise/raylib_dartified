part of '../../../raylib_dartified.dart';

// rlDrawCall

extension RlDrawCallCPEx on Pointer<RlDrawCallC> {
  RlDrawCall toDart() => .new(
    op: RlDrawCall.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension RlDrawCallCEx on RlDrawCallC {
  RlDrawCall toDart(Pointer<RlDrawCallC> ptr) => .new(
    op: RlDrawCall.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}

// rlRenderBatch

extension RlRenderBatchCPEx on Pointer<RlRenderBatchC> {
  RlRenderBatch toDart() => .new(
    op: RlRenderBatch.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension RlRenderBatchCEx on RlRenderBatchC {
  RlRenderBatch toDart(Pointer<RlRenderBatchC> ptr) => .new(
    op: RlRenderBatch.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}

// rlVertexBuffer

extension RlVertexBufferCPEx on Pointer<RlVertexBufferC> {
  RlVertexBuffer toDart() => .new(
    op: RlVertexBuffer.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension RlVertexBufferCEx on RlVertexBufferC {
  RlVertexBuffer toDart(Pointer<RlVertexBufferC> ptr) => .new(
    op: RlVertexBuffer.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}