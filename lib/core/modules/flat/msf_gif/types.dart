part of '../../../raylib_dartified.dart';

// MsfGifResult

extension MsfGifResultCPEx on Pointer<MsfGifResultC> {
  MsfGifResult toDart() => ref.toDart(this);
}

extension MsfGifResultCEx on MsfGifResultC {
  MsfGifResult toDart([Pointer<MsfGifResultC>? ptr]) => .new(
    op: MsfGifResult.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// MsfGifState

extension MsfGifStateCPEx on Pointer<MsfGifStateC> {
  MsfGifState toDart() => ref.toDart(this);
}

extension MsfGifStateCEx on MsfGifStateC {
  MsfGifState toDart([Pointer<MsfGifStateC>? ptr]) => .new(
    op: MsfGifState.struct.ptr(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}