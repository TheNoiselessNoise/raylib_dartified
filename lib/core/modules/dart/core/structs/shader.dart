part of '../../../../raylib_dartified.dart';

extension ShaderCPEx on Pointer<ShaderC> {
  Pointer<ShaderC> setC(ShaderC o) { ref.setC(o); return this; }
  Pointer<ShaderC> setD(ShaderD o) { ref.setD(o); return this; }
  ShaderD toD() => ref.toD(this);
}

extension ShaderCEx on ShaderC {
  int get shaderLocsCount => ShaderBase.BASE_shaderLocsCount;

  ShaderC setC(ShaderC o) {
    id = o.id;
    locs = o.locs;
    return this;
  }

  ShaderC setD(ShaderD o) {
    id = o.id;
    o.structOnOp((p) => locs = p.ref.locs);
    if (locs.address != 0) {
      for (var i = 0; i < o.locs.length; i++) {
        locs[i] = o.locs[i];
      }
    }
    return this;
  }

  ShaderD toD([Pointer<ShaderC>? ptr]) => .new(
    originalPointer: ptr,
    id: id,
    locs: locs.address != 0
      ? .generate(shaderLocsCount, (i) => locs[i])
      : .filled(shaderLocsCount, 0),
  );
}

class ShaderD extends StructD<ShaderC, ShaderD> with ShaderBase<ShaderD> {
  int _id;
  @override get id {
    structOnOp((p) => _id = p.ref.id);
    return _id;
  }
  @override set id(int value) {
    _id = value;
    structOnOp((p) => p.ref.id = value);
  }
  
  late NativeLiveListPointerInt _locs;
  @override get locs {
    structOnOp((p) => _locs.ptr = p.ref.locs);
    return _locs;
  }
  @override set locs(List<int> value) {
    structOnOp((p) => _locs.ptr = p.ref.locs);
    _locs.inner = value;
  }

  ShaderD({
    super.originalPointer,
    int id = 0,
    List<int>? locs,
  }) :
    _id = id
  {
    _locs = .new(locs ?? .filled(shaderLocsCount, 0), originalPointer?.ref.locs);
  }

  factory ShaderD.zero() => .new();

  @override
  ShaderD setD(ShaderD o) {
    id = o.id;
    locs = .from(o.locs);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<ShaderC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<ShaderC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<ShaderC> p, String key) {
    p.ref.locs = temp.Int$.Array(locs, key: '${key}_locs');
  }

  @override
  void nativeWriteInto(ShaderC p) {
    p.id = id;

    structOnOp((o) => p.locs = o.ref.locs);

    if (p.locs.address != 0) {
      for (var i = 0; i < locs.length; i++) {
        p.locs[i] = _locs.inner[i];
      }
    }
  }

  @override
  void nativeReadFrom(ShaderC p) {
    id = p.id;
    locs = p.locs.address != 0
      ? .generate(shaderLocsCount, (i) => p.locs[i])
      : .filled(shaderLocsCount, 0);
  }

  @override
  ShaderD clone() => .new(
    originalPointer: originalPointer,
    id: id,
    locs: .from(locs),
  );
}