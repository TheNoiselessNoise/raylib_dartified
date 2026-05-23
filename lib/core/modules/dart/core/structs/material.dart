part of '../../../../raylib_dartified.dart';

extension MaterialCPEx on Pointer<MaterialC> {
  Pointer<MaterialC> setC(MaterialC o) { ref.setC(o); return this; }
  Pointer<MaterialC> setD(MaterialD o) { ref.setD(o); return this; }
  MaterialD toD() => ref.toD(this);
}

extension MaterialCEx on MaterialC {
  int get paramsCount => MaterialBase.BASE_paramsCount;
  int get mapsCount => MaterialBase.BASE_mapsCount;

  MaterialC setC(MaterialC o) {
    shader = o.shader;
    maps = o.maps;
    for (int i = 0; i < paramsCount; i++) {
      params[i] = o.params[i];
    }
    return this;
  }

  MaterialC setD(MaterialD o) {
    shader.setD(o.shader);
    o.structOnOriginalPointer((p) => maps = p.ref.maps);
    if (maps.address != 0) {
      for (int i = 0; i < mapsCount; i++) {
        maps[i].setD(o.maps[i]);
      }
    }
    for (int i = 0; i < paramsCount; i++) {
      params[i] = o.params[i];
    }
    return this;
  }

  MaterialD toD([Pointer<MaterialC>? ptr]) => .new(
    originalPointer: ptr,
    shader: shader.toD(),
    maps: maps.address != 0
      ? .generate(mapsCount, (i) => (maps + i).toD())
      : [],
    params: .generate(paramsCount, (i) => params[i]),
  );
}

class MaterialD extends StructD<MaterialC, MaterialD> with MaterialBase<
  MaterialD,
  ShaderD,
  MaterialMapD,
  TextureD,
  ColorD
> {
  ShaderD _shader;
  @override get shader {
    structOnOriginalPointer((p) => _shader.nativeReadFrom(p.ref.shader));
    return _shader;
  }
  @override set shader(ShaderD value) {
    _shader = value;
    structOnOriginalPointer((p) => value.nativeWriteInto(p.ref.shader));
  }
  
  late NativeLiveListPointerStruct<MaterialMapC, MaterialMapD> _maps;
  @override get maps {
    structOnOriginalPointer((p) => _maps.ptr = p.ref.maps);
    return _maps;
  }
  @override set maps(List<MaterialMapD> value) {
    assert(value.length <= mapsCount);
    structOnOriginalPointer((p) => _maps.ptr = p.ref.maps);
    _maps.inner = value;
  }
  
  late NativeLiveListArrayFloat _params;
  @override get params {
    structOnOriginalPointer((p) => _params.ptr = p.ref.params);
    return _params;
  }
  @override set params(List<double> value) {
    assert(value.length <= paramsCount);
    structOnOriginalPointer((p) => _params.ptr = p.ref.params);
    _params.inner = value;
  }

  MaterialD({
    super.originalPointer,
    ShaderD? shader,
    List<MaterialMapD>? maps,
    List<double>? params,
  }) :
    _shader = shader ?? .zero()
  {
    _maps = .new(maps ?? [], originalPointer?.ref.maps);
    _params = .new(params ?? .filled(paramsCount, 0), originalPointer?.ref.params);
  }

  factory MaterialD.zero() => .new();

  @override
  MaterialD setD(MaterialD o) {
    shader.setD(o.shader);
    maps = o.maps.map((x) => x.clone()).toList();
    params = .from(o.params);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<MaterialC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<MaterialC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<MaterialC> p, String key) {
    p.ref.maps = temp.MaterialMap$.Array(maps, key: '${key}_maps');
  }

  @override
  void nativeWriteInto(MaterialC p) {
    shader.nativeWriteInto(p.shader);
    
    if (p.maps.address != 0) {
      for (int i = 0; i < maps.length; i++) {
        _maps.inner[i].nativeWriteInto((p.maps + i).ref);
      }
    }

    for (int i = 0; i < paramsCount; i++) {
      p.params[i] = _params.inner[i];
    }
  }

  @override
  void nativeReadFrom(MaterialC p) {
    structOnOriginalPointer((o) => o.ref.maps = p.maps);
    shader.nativeReadFrom(p.shader);
    if (p.maps.address != 0) maps = .generate(mapsCount, (i) => (p.maps + i).toD());
    params = .generate(paramsCount, (i) => p.params[i]);
  }

  @override
  MaterialD clone() => .new(
    originalPointer: originalPointer,
    shader: shader.clone(),
    maps: maps.map((x) => x.clone()).toList(),
    params: .from(params),
  );
}