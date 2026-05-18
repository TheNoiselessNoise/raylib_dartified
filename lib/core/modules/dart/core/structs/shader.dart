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
    o.structOnOriginalPointer((p) {
      locs = p.ref.locs;
    });
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
  @override
  int id;
  
  @override
  List<int> locs;

  ShaderD({
    super.originalPointer,
    this.id = 0,
    List<int>? locs,
  }) :
    locs = locs ?? [];

  factory ShaderD.zero() => .new();

  @override
  ShaderD setC(ShaderC o) {
    structOnOriginalPointer((p) {
      p.ref.locs = o.locs;
    });
    id = o.id;
    locs = o.locs.address != 0
      ? .generate(shaderLocsCount, (i) => o.locs[i])
      : .filled(shaderLocsCount, 0);
    return this;
  }

  @override
  ShaderD setD(ShaderD o) {
    id = o.id;
    locs = .from(o.locs);
    return this;
  }

  @override
  getReference(Pointer<ShaderC> p) => p.ref;

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<ShaderC> p, String key) {
    p.ref.locs = temp.Int$.Array(locs, key: '${key}_locs');
  }

  @override
  void nativeWriteInto(ShaderC p) {
    p.id = id;

    structOnOriginalPointer((o) {
      p.locs = o.ref.locs;
    });

    if (p.locs.address != 0) {
      for (var i = 0; i < locs.length; i++) {
        p.locs[i] = locs[i];
      }
    }
  }

  @override
  ShaderD clone() => .new(
    originalPointer: originalPointer,
    id: id,
    locs: .from(locs),
  );
}