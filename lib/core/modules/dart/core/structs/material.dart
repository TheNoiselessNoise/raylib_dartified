part of '../../../../raylib.dart';

extension MaterialCLike on MaterialC {
  int get paramCount => 4;
  int get mapCount => Raylib.instance.MAX_MATERIAL_MAPS;
}

extension MaterialCPEx on Pointer<MaterialC> {
  Pointer<MaterialC> setC(MaterialC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<MaterialC> setD(MaterialD o) {
    ref.setD(o);
    return this;
  }

  MaterialD toD() => ref.toD(this);
}

extension MaterialCEx on MaterialC {
  MaterialC setC(MaterialC o) {
    shader = o.shader;
    maps = o.maps;
    for (int i = 0; i < paramCount; i++) {
      params[i] = o.params[i];
    }
    return this;
  }

  MaterialC setD(MaterialD o) {
    shader.setD(o.shader);
    o.nativeOnOriginalPointer((p) {
      maps = p.ref.maps;
    });
    if (maps.address != 0) {
      for (int i = 0; i < mapCount; i++) {
        maps[i].setD(o.maps[i]);
      }
    }
    for (int i = 0; i < paramCount; i++) {
      params[i] = o.params[i];
    }
    return this;
  }

  MaterialD toD([Pointer<MaterialC>? ptr]) => .new(
    originalPointer: ptr,
    shader: shader.toD(),
    maps: maps.address != 0
      ? .generate(mapCount, (i) => (maps + i).toD())
      : [],
    params: .generate(paramCount, (i) => params[i]),
  );
}

class MaterialD extends StructD<MaterialD, MaterialC> with MaterialBase {
  @override
  ShaderD shader;
  
  @override
  List<MaterialMapD> maps;
  
  @override
  late List<double> params;

  MaterialD({
    super.originalPointer,
    ShaderD? shader,
    List<MaterialMapD>? maps,
    List<double>? params,
  }) :
    shader = shader ?? .zero(),
    maps = maps ?? []
  {
    this.params = params ?? .filled(paramCount, 0);
  }

  factory MaterialD.zero() => .new();

  @override
  MaterialD setC(MaterialC o) {
    nativeOnOriginalPointer((p) {
      p.ref.maps = o.maps;
    });
    shader.setC(o.shader);
    maps = o.maps.address != 0 ? .generate(mapCount, (i) => o.maps[i].toD()) : [];
    params = .generate(paramCount, (i) => o.params[i]);
    return this;
  }

  @override
  MaterialD setD(MaterialD o) {
    originalPointer ??= o.originalPointer;
    shader.setD(o.shader);
    maps = o.maps.map((x) => x.clone()).toList();
    params = .from(o.params);
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Material$;

  @override
  void nativeAllocateInto(RaylibTemp temp, Pointer<MaterialC> p, String key) {
    p.ref.maps = temp.MaterialMap$.Array(maps, key: '${key}_maps');
  }

  @override
  void nativeWriteInto(MaterialC p) {
    shader.nativeWriteInto(p.shader);
    
    if (p.maps.address != 0) {
      if (maps.isNotEmpty) {
        for (int i = 0; i < maps.length; i++) {
          maps[i].nativeWriteInto((p.maps + i).ref);
        }
      } else {
        p.maps = nullptr;
      }
    }

    for (int i = 0; i < paramCount; i++) {
      p.params[i] = params[i];
    }
  }

  @override
  String signature() => '$structName(shader: $shader, maps: ${maps.length}, params: ${params.join(', ')})';

  @override
  MaterialD clone() => .new(
    originalPointer: originalPointer,
    shader: shader.clone(),
    maps: maps.map((x) => x.clone()).toList(),
    params: .from(params),
  );
}