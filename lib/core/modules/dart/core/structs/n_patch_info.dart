part of '../../../../raylib_dartified.dart';

extension NPatchInfoCPEx on Pointer<NPatchInfoC> {
  Pointer<NPatchInfoC> setC(NPatchInfoC o) { ref.setC(o); return this; }
  Pointer<NPatchInfoC> setD(NPatchInfoD o) { ref.setD(o); return this; }
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

class NPatchInfoD extends StructDLiteral<NPatchInfoC, NPatchInfoD> with NPatchInfoBase<
  NPatchInfoD,
  RectangleD
> {
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
    source.setD(o.source);
    left = o.left;
    top = o.top;
    right = o.right;
    bottom = o.bottom;
    layout = o.layout;
    return this;
  }

  @override
  getReference(Pointer<NPatchInfoC> p) => p.ref;

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