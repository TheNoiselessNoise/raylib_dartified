part of '../../../backend.dart';

// rlDrawCall
extension RlDrawCallCPEx on Pointer<RlDrawCallC> { RlDrawCall toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension RlDrawCallCEx on RlDrawCallC { RlDrawCall toDart(Pointer<RlDrawCallC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }
// rlRenderBatch
extension RlRenderBatchCPEx on Pointer<RlRenderBatchC> { RlRenderBatch toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension RlRenderBatchCEx on RlRenderBatchC { RlRenderBatch toDart(Pointer<RlRenderBatchC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }
// rlVertexBuffer
extension RlVertexBufferCPEx on Pointer<RlVertexBufferC> { RlVertexBuffer toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension RlVertexBufferCEx on RlVertexBufferC { RlVertexBuffer toDart(Pointer<RlVertexBufferC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }