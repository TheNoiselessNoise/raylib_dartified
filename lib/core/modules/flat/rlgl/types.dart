part of '../../../raylib_dartified.dart';

// rlDrawCall

extension RlDrawCallCPEx on Pointer<RlDrawCallC> {
  RlDrawCall toDart() => ref.toDart(this);
}

extension RlDrawCallCEx on RlDrawCallC {
  RlDrawCall toDart([Pointer<RlDrawCallC>? ptr]) => .new(
    op: RlDrawCall.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// rlRenderBatch

extension RlRenderBatchCPEx on Pointer<RlRenderBatchC> {
  RlRenderBatch toDart() => ref.toDart(this);
}

extension RlRenderBatchCEx on RlRenderBatchC {
  RlRenderBatch toDart([Pointer<RlRenderBatchC>? ptr]) => .new(
    op: RlRenderBatch.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// rlVertexBuffer

extension RlVertexBufferCPEx on Pointer<RlVertexBufferC> {
  RlVertexBuffer toDart() => ref.toDart(this);
}

extension RlVertexBufferCEx on RlVertexBufferC {
  RlVertexBuffer toDart([Pointer<RlVertexBufferC>? ptr]) => .new(
    op: RlVertexBuffer.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}