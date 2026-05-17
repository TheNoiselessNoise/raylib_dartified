part of '../../../../raylib.dart';

extension NPatchInfoCPEx on Pointer<NPatchInfoC> {
  Pointer<NPatchInfoC> setC(NPatchInfoC o) {
    ref.setC(o);
    return this;
  }

  Pointer<NPatchInfoC> setD(NPatchInfoD o) {
    ref.setD(o);
    return this;
  }

  Pointer<NPatchInfoC> set(
    num x, num y, num width, num height,
    num left, num top, num right, num bottom,
    int layout,
  ) {
    ref.set(
      x, y, width, height,
      left, top, right, bottom,
      layout,
    );
    return this;
  }

  NPatchInfoD toD() => ref.toD(this);
}

extension NPatchInfoCEx on NPatchInfoC {
  NPatchInfoC setC(NPatchInfoC o) {
    source.setC(o.source);
    left = o.left;
    top = o.top;
    right = o.right;
    bottom = o.bottom;
    layout = o.layout;
    return this;
  }

  NPatchInfoC setD(NPatchInfoD o) {
    source.setD(o.source);
    left = o.left;
    top = o.top;
    right = o.right;
    bottom = o.bottom;
    layout = o.layout.value;
    return this;
  }

  NPatchInfoC set(
    num x, num y, num width, num height,
    num left, num top, num right, num bottom,
    int layout,
  ) {
    source.set(x, y, width, height);
    this.left = left.toInt();
    this.top = top.toInt();
    this.right = right.toInt();
    this.bottom = bottom.toInt();
    this.layout = layout;
    return this;
  }

  NPatchInfoD toD([Pointer<NPatchInfoC>? ptr]) => .new(
    originalPointer: ptr,
    source: source.toD(),
    left: left,
    top: top,
    right: right,
    bottom: bottom,
    layout: .fromValue(layout),
  );
}

class NPatchInfoD extends StructDLiteral<NPatchInfoC, NPatchInfoD> with NPatchInfoBase {
  @override
  RectangleD source;
  
  @override
  int left;
  
  @override
  int top;
  
  @override
  int right;
  
  @override
  int bottom;
  
  @override
  NPatchLayout layout;

  NPatchInfoD({
    super.originalPointer,
    RectangleD? source,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
    this.layout = .NPATCH_NINE_PATCH,
  }) :
    source = source ?? .new();

  factory NPatchInfoD.zero() => .new();

  @override
  NPatchInfoD setC(NPatchInfoC o) {
    source.setC(o.source);
    left = o.left;
    top = o.top;
    right = o.right;
    bottom = o.bottom;
    layout = .fromValue(o.layout);
    return this;
  }

  @override
  NPatchInfoD setD(NPatchInfoD o) {
    originalPointer ??= o.originalPointer;
    source.setD(o.source);
    left = o.left;
    top = o.top;
    right = o.right;
    bottom = o.bottom;
    layout = o.layout;
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.NPatchInfo$;

  @override
  void nativeWriteInto(NPatchInfoC p) {
    source.nativeWriteInto(p.source);
    p.left = left;
    p.top = top;
    p.right = right;
    p.bottom = bottom;
    p.layout = layout.value;
  }

  @override
  String signature() => '$structName(source: $source, left: $left, top: $top, right: $right, bottom: $bottom, layout: $layout)';

  @override
  NPatchInfoD clone() => .new(
    originalPointer: originalPointer,
    source: source.clone(),
    left: left,
    top: top,
    right: right,
    bottom: bottom,
    layout: layout,
  );
}