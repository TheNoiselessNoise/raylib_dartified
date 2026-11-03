part of '../../../raylib_dartified.dart';

// MsfGifResult

extension MsfGifResultCPEx on Pointer<MsfGifResultC> {
  MsfGifResult toDart() => .new(
    op: MsfGifResult.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension MsfGifResultCEx on MsfGifResultC {
  MsfGifResult toDart(Pointer<MsfGifResultC> ptr) => .new(
    op: MsfGifResult.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}

// MsfGifState

extension MsfGifStateCPEx on Pointer<MsfGifStateC> {
  MsfGifState toDart() => .new(
    op: MsfGifState.struct.ptr(NativeMemoryPointer(this)),
  );
}

extension MsfGifStateCEx on MsfGifStateC {
  MsfGifState toDart(Pointer<MsfGifStateC> ptr) => .new(
    op: MsfGifState.struct.ptr(NativeMemoryPointer(ptr..ref = this)),
  );
}