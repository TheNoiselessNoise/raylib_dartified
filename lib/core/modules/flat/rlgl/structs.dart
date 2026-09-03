part of '../../../raylib_dartified.dart';

// rlDrawCall

extension RlDrawCallCPEx on Pointer<RlDrawCallC> {
  RlDrawCallD toDart() => ref.toDart(this);
}

extension RlDrawCallCEx on RlDrawCallC {
  RlDrawCallD toDart([Pointer<RlDrawCallC>? ptr]) => .new(
    op: RlDrawCallD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// rlRenderBatch

extension RlRenderBatchCPEx on Pointer<RlRenderBatchC> {
  RlRenderBatchD toDart() => ref.toDart(this);
}

extension RlRenderBatchCEx on RlRenderBatchC {
  RlRenderBatchD toDart([Pointer<RlRenderBatchC>? ptr]) => .new(
    op: RlRenderBatchD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// rlVertexBuffer

extension RlVertexBufferCPEx on Pointer<RlVertexBufferC> {
  RlVertexBufferD toDart() => ref.toDart(this);
}

extension RlVertexBufferCEx on RlVertexBufferC {
  RlVertexBufferD toDart([Pointer<RlVertexBufferC>? ptr]) => .new(
    op: RlVertexBufferD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}