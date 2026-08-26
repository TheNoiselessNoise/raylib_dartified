part of '../../../raylib_dartified.dart';

// rlDrawCall

extension RlDrawCallCPEx on Pointer<RlDrawCallC> {
  RlDrawCallD toD() => ref.toD(this);
}

extension RlDrawCallCEx on RlDrawCallC {
  RlDrawCallD toD([Pointer<RlDrawCallC>? ptr]) => .new(
    op: RlDrawCallD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// rlRenderBatch

extension RlRenderBatchCPEx on Pointer<RlRenderBatchC> {
  RlRenderBatchD toD() => ref.toD(this);
}

extension RlRenderBatchCEx on RlRenderBatchC {
  RlRenderBatchD toD([Pointer<RlRenderBatchC>? ptr]) => .new(
    op: RlRenderBatchD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// rlVertexBuffer

extension RlVertexBufferCPEx on Pointer<RlVertexBufferC> {
  RlVertexBufferD toD() => ref.toD(this);
}

extension RlVertexBufferCEx on RlVertexBufferC {
  RlVertexBufferD toD([Pointer<RlVertexBufferC>? ptr]) => .new(
    op: RlVertexBufferD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}