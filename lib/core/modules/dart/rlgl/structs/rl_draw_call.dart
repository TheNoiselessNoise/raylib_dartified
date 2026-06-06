part of '../../../../raylib_dartified.dart';

extension RlDrawCallCPEx on Pointer<RlDrawCallC> {
  Pointer<RlDrawCallC> setC(RlDrawCallC o) { ref.setC(o); return this; }
  Pointer<RlDrawCallC> setD(RlDrawCallD o) { ref.setD(o); return this; }
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
    mode = o.mode.value;
    vertexCount = o.vertexCount;
    vertexAlignment = o.vertexAlignment;
    textureId = o.textureId;
    return this;
  }

  RlDrawCallD toD([Pointer<RlDrawCallC>? ptr]) => .new(
    originalPointer: ptr,
    mode: .fromValue(mode),
    vertexCount: vertexCount,
    vertexAlignment: vertexAlignment,
    textureId: textureId,
  );
}

class RlDrawCallD extends StructD<RlDrawCallC, RlDrawCallD> with RlDrawCallBase<RlDrawCallD> {
  RlDrawMode _mode;
  @override get mode {
    structOnOp((p) => _mode = .fromValue(p.ref.mode));
    return _mode;
  }
  @override set mode(RlDrawMode value) {
    _mode = value;
    structOnOp((p) => p.ref.mode = value.value);
  }
  
  int _vertexCount;
  @override get vertexCount {
    structOnOp((p) => _vertexCount = p.ref.vertexCount);
    return _vertexCount;
  }
  @override set vertexCount(int value) {
    _vertexCount = value;
    structOnOp((p) => p.ref.vertexCount = value);
  }
  
  int _vertexAlignment;
  @override get vertexAlignment {
    structOnOp((p) => _vertexAlignment = p.ref.vertexAlignment);
    return _vertexAlignment;
  }
  @override set vertexAlignment(int value) {
    _vertexAlignment = value;
    structOnOp((p) => p.ref.vertexAlignment = value);
  }
  
  int _textureId;
  @override get textureId {
    structOnOp((p) => _textureId = p.ref.textureId);
    return _textureId;
  }
  @override set textureId(int value) {
    _textureId = value;
    structOnOp((p) => p.ref.textureId = value);
  }

  RlDrawCallD({
    super.originalPointer,
    RlDrawMode mode = RlDrawMode.RL_NONE,
    int vertexCount = 0,
    int vertexAlignment = 0,
    int textureId = 0,
  }) :
    _mode = mode,
    _vertexCount = vertexCount,
    _vertexAlignment = vertexAlignment,
    _textureId = textureId;

  factory RlDrawCallD.zero() => .new();

  @override
  RlDrawCallD setD(RlDrawCallD o) {
    mode = o.mode;
    vertexCount = o.vertexCount;
    vertexAlignment = o.vertexAlignment;
    textureId = o.textureId;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<RlDrawCallC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<RlDrawCallC> p, int index) => p[index];

  @override
  void nativeWriteInto(RlDrawCallC p) {
    p.mode = mode.value;
    p.vertexCount = vertexCount;
    p.vertexAlignment = vertexAlignment;
    p.textureId = textureId;
  }

  @override
  void nativeReadFrom(RlDrawCallC p) {
    mode = .fromValue(p.mode);
    vertexCount = p.vertexCount;
    vertexAlignment = p.vertexAlignment;
    textureId = p.textureId;
  }

  @override
  RlDrawCallD clone() => .new(
    originalPointer: originalPointer,
    mode: mode,
    vertexCount: vertexCount,
    vertexAlignment: vertexAlignment,
    textureId: textureId,
  );
}