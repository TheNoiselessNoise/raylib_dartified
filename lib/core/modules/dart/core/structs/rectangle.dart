part of '../../../../raylib_dartified.dart';

extension RectangleCPEx on Pointer<RectangleC> {
  Pointer<RectangleC> setC(RectangleC o) { ref.setC(o); return this; }
  Pointer<RectangleC> setD(RectangleD o) { ref.setD(o); return this; }
  Pointer<RectangleC> set(num x, num y, num width, num height) { ref.set(x, y, width, height); return this; }
  RectangleD toD() => ref.toD(this);
}

extension RectangleCEx on RectangleC {
  RectangleC setC(RectangleC o) => set(o.x, o.y, o.width, o.height);

  RectangleC setD(RectangleD o) => set(o.x, o.y, o.width, o.height);

  RectangleC set(num x, num y, num width, num height) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.width = width.toDouble();
    this.height = height.toDouble();
    return this;
  }

  RectangleD toD([Pointer<RectangleC>? ptr]) => .new(
    originalPointer: ptr,
    x: x,
    y: y,
    width: width,
    height: height,
  );
}

class RectangleD extends StructDLiteral<RectangleC, RectangleD> with RectangleBase<RectangleD> {
  @override
  double x, y, width, height;

  RectangleD({
    super.originalPointer,
    this.x = 0,
    this.y = 0,
    this.width = 0,
    this.height = 0,
  });

  factory RectangleD.zero() => .new();

  factory RectangleD.rect(
    num x,
    num y,
    num width,
    num height,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    width: width.toDouble(),
    height: height.toDouble(),
  );

  @override
  RectangleD setC(RectangleC o) => set(o.x, o.y, o.width, o.height);

  @override
  RectangleD setD(RectangleD o) {
    return set(o.x, o.y, o.width, o.height);
  }

  @override
  getReference(Pointer<RectangleC> p) => p.ref;

  @override
  void nativeWriteInto(RectangleC p) {
    p.x = x;
    p.y = y;
    p.width = width;
    p.height = height;
  }


  @override
  RectangleD clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
    width: width,
    height: height,
  );
}