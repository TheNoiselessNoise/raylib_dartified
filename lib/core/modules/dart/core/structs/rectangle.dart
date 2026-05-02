part of '../../../../raylib.dart';

extension RectangleCLike on RectangleC {
  String format([int x0 = 0, int? y0, int? w0, int? h0])
    => '[ X:${x.toStringAsFixed(x0)}, Y:${y.toStringAsFixed(y0 ?? x0)}, W:${width.toStringAsFixed(w0 ?? x0)}, H:${height.toStringAsFixed(h0 ?? x0)} ]';
}

extension RectangleDLike on RectangleD {
  String format([int x0 = 0, int? y0, int? w0, int? h0])
    => '[ X:${x.toStringAsFixed(x0)}, Y:${y.toStringAsFixed(y0 ?? x0)}, W:${width.toStringAsFixed(w0 ?? x0)}, H:${height.toStringAsFixed(h0 ?? x0)} ]';
}

extension RectangleCPEx on Pointer<RectangleC> {
  Pointer<RectangleC> setC(RectangleC o) {
    ref.setC(o);
    return this;
  }

  Pointer<RectangleC> setD(RectangleD o) {
    ref.setD(o);
    return this;
  }

  Pointer<RectangleC> set(num x, num y, num width, num height) {
    ref.set(x, y, width, height);
    return this;
  }

  RectangleD toD() => ref.toD(this);

  String format([int x0 = 0, int? y0, int? w0, int? h0]) => ref.format(x0, y0, w0, h0);
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

class RectangleD extends StructDLiteral<RectangleD, RectangleC> {
  double x;
  double y;
  double width;
  double height;

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
    originalPointer ??= o.originalPointer;
    return set(o.x, o.y, o.width, o.height);
  }

  RectangleD set(num x, num y, num width, num height) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.width = width.toDouble();
    this.height = height.toDouble();
    return this;
  }

  @override
  Pointer<RectangleC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.Rectangle$.At(key, count);

  @override
  void allocateInto(RaylibTemp temp, Pointer<RectangleC> p, String key)
    => writeInto(p.ref);

  @override
  void writeInto(RectangleC p) {
    p.x = x;
    p.y = y;
    p.width = width;
    p.height = height;
  }

  List<double> toArray() => [x, y, width, height];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, w: ${width.f1}, h: ${height.f1})';

  @override
  RectangleD clone() => .new(
    originalPointer: originalPointer,
    x: x,
    y: y,
    width: width,
    height: height,
  );
}