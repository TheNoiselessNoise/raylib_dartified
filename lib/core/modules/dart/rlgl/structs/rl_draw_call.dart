part of '../../../../raylib.dart';

extension RlDrawCallCPEx on Pointer<RlDrawCallC> {
  Pointer<RlDrawCallC> setC(RlDrawCallC o) {
    ref.setC(o);
    return this;
  }

  Pointer<RlDrawCallC> setD(RlDrawCallD o) {
    ref.setD(o);
    return this;
  }

  RlDrawCallD toD() => ref.toD(this);
}

extension RlDrawCallCEx on RlDrawCallC {
  RlDrawCallC setC(RlDrawCallC o) {
    mode = o.mode;
    vertexCount = o.vertexCount;
    vertexAlignment = o.vertexAlignment;
    textureId = o.textureId;
    return this;
  }

  RlDrawCallC setD(RlDrawCallD o) {
    mode = o.mode;
    vertexCount = o.vertexCount;
    vertexAlignment = o.vertexAlignment;
    textureId = o.textureId;
    return this;
  }

  RlDrawCallD toD([Pointer<RlDrawCallC>? ptr]) => .new(
    originalPointer: ptr,
    mode: mode,
    vertexCount: vertexCount,
    vertexAlignment: vertexAlignment,
    textureId: textureId,
  );
}

class RlDrawCallD extends StructD<RlDrawCallC, RlDrawCallD> with RlDrawCallBase {
  @override
  int mode;
  
  @override
  int vertexCount;
  
  @override
  int vertexAlignment;
  
  @override
  int textureId;

  RlDrawCallD({
    super.originalPointer,
    this.mode = 0,
    this.vertexCount = 0,
    this.vertexAlignment = 0,
    this.textureId = 0,
  });

  factory RlDrawCallD.zero() => .new();

  @override
  RlDrawCallD setC(RlDrawCallC o) {
    mode = o.mode;
    vertexCount = o.vertexCount;
    vertexAlignment = o.vertexAlignment;
    textureId = o.textureId;
    return this;
  }

  @override
  RlDrawCallD setD(RlDrawCallD o) {
    originalPointer ??= o.originalPointer;
    mode = o.mode;
    vertexCount = o.vertexCount;
    vertexAlignment = o.vertexAlignment;
    textureId = o.textureId;
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.RlDrawCall$;

  @override
  void nativeWriteInto(RlDrawCallC p) {
    p.mode = mode;
    p.vertexCount = vertexCount;
    p.vertexAlignment = vertexAlignment;
    p.textureId = textureId;
  }

  @override
  String signature() => '$structName(mode: $mode, vertexCount: $vertexCount, textureId: $textureId)';

  @override
  RlDrawCallD clone() => .new(
    originalPointer: originalPointer,
    mode: mode,
    vertexCount: vertexCount,
    vertexAlignment: vertexAlignment,
    textureId: textureId,
  );
}