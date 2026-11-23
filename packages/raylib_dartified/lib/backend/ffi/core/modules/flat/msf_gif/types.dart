part of '../../../backend.dart';

// MsfGifResult
extension MsfGifResultCPEx on Pointer<MsfGifResultC> { MsfGifResult toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension MsfGifResultCEx on MsfGifResultC { MsfGifResult toDart(Pointer<MsfGifResultC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }
// MsfGifState
extension MsfGifStateCPEx on Pointer<MsfGifStateC> { MsfGifState toDart() => .struct.ptr(XNativePtr(this)).ref; }
extension MsfGifStateCEx on MsfGifStateC { MsfGifState toDart(Pointer<MsfGifStateC> ptr) => .struct.ptr(XNativePtr(ptr..ref = this)).ref; }