part of '../../../raylib_dartified.dart';

// MsfGifResult

extension MsfGifResultCPEx on Pointer<MsfGifResultC> {
  MsfGifResultD toDart() => ref.toDart(this);
}

extension MsfGifResultCEx on MsfGifResultC {
  MsfGifResultD toDart([Pointer<MsfGifResultC>? ptr]) => .new(
    op: MsfGifResultD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// MsfGifState

extension MsfGifStateCPEx on Pointer<MsfGifStateC> {
  MsfGifStateD toDart() => ref.toDart(this);
}

extension MsfGifStateCEx on MsfGifStateC {
  MsfGifStateD toDart([Pointer<MsfGifStateC>? ptr]) => .new(
    op: MsfGifStateD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}