part of '../../../raylib_dartified.dart';

// MsfGifResult

extension MsfGifResultCPEx on Pointer<MsfGifResultC> {
  MsfGifResultD toD() => ref.toD(this);
}

extension MsfGifResultCEx on MsfGifResultC {
  MsfGifResultD toD([Pointer<MsfGifResultC>? ptr]) => .new(
    op: MsfGifResultD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}

// MsfGifState

extension MsfGifStateCPEx on Pointer<MsfGifStateC> {
  MsfGifStateD toD() => ref.toD(this);
}

extension MsfGifStateCEx on MsfGifStateC {
  MsfGifStateD toD([Pointer<MsfGifStateC>? ptr]) => .new(
    op: MsfGifStateD.pointer(NativeMemoryPointer.orNull(ptr?..ref = this)),
  );
}