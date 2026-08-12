part of '../../../../raylib_dartified.dart';

extension MsfGifStateCPEx on Pointer<MsfGifStateC> {
  Pointer<MsfGifStateC> setC(MsfGifStateC o) => this;
  Pointer<MsfGifStateC> setD(MsfGifStateD o) => this;
  MsfGifStateD toD() => ref.toD(this);
}

extension MsfGifStateCEx on MsfGifStateC {
  MsfGifStateC setC(MsfGifStateC o) => this;
  MsfGifStateC setD(MsfGifStateD o) => this;
  MsfGifStateD toD([Pointer<MsfGifStateC>? ptr]) => .new(originalPointer: ptr);
}

class MsfGifStateD extends StructD<MsfGifStateC, MsfGifStateD> {
  int _width = 0;
  int get width {
    structOnOp((p) => _width = p.ref.width);
    return _width;
  }

  int _height = 0;
  int get height {
    structOnOp((p) => _height = p.ref.height);
    return _height;
  }

  int _framesSubmitted = 0;
  int get framesSubmitted {
    structOnOp((p) => _framesSubmitted = p.ref.framesSubmitted);
    return _framesSubmitted;
  }

  MsfGifStateD({ super.originalPointer });

  factory MsfGifStateD.zero() => .new();

  @override
  MsfGifStateD setD(MsfGifStateD o) => this;

  @override
  nativeGetIndexedReference(Pointer<MsfGifStateC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<MsfGifStateC> p, int index) => p[index];

  @override
  void nativeWriteInto(MsfGifStateC p) {
    p.width = width;
    p.height = height;
    p.framesSubmitted = framesSubmitted;
  }

  @override
  void nativeReadFrom(MsfGifStateC p) {
    _width = p.width;
    _height = p.height;
    _framesSubmitted = p.framesSubmitted;
  }

  @override
  MsfGifStateD clone() => .new(originalPointer: originalPointer);
}