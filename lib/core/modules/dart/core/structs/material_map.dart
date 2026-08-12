part of '../../../../raylib_dartified.dart';

extension MaterialMapCPEx on Pointer<MaterialMapC> {
  Pointer<MaterialMapC> setC(MaterialMapC o) { ref.setC(o); return this; }
  Pointer<MaterialMapC> setD(MaterialMapD o) { ref.setD(o); return this; }
  MaterialMapD toD() => ref.toD(this);
}

extension MaterialMapCEx on MaterialMapC {
  MaterialMapC setC(MaterialMapC o) {
    texture = o.texture;
    color = o.color;
    value = o.value;
    return this;
  }

  MaterialMapC setD(MaterialMapD o) {
    texture.setD(o.texture);
    color.setD(o.color);
    value = o.value;
    return this;
  }

  MaterialMapD toD([Pointer<MaterialMapC>? ptr]) => .new(
    originalPointer: ptr,
    texture: texture.toD(),
    color: color.toD(),
    value: value,
  );
}

class MaterialMapD extends StructD<MaterialMapC, MaterialMapD> with MaterialMapBase<
  MaterialMapD,
  TextureD,
  ColorD
> {
  TextureD _texture;
  @override get texture {
    structOnOp((p) => _texture.nativeReadFrom(p.ref.texture));
    return _texture;
  }
  @override set texture(TextureD value) {
    _texture = value;
    structOnOp((p) => value.nativeWriteInto(p.ref.texture));
  }

  ColorD _color;
  @override get color {
    structOnOp((p) => _color.nativeReadFrom(p.ref.color));
    return _color;
  }
  @override set color(ColorD value) {
    _color = value;
    structOnOp((p) => value.nativeWriteInto(p.ref.color));
  }
  
  double _value;
  @override get value {
    structOnOp((p) => _value = p.ref.value);
    return _value;
  }
  @override set value(double value) {
    _value = value;
    structOnOp((p) => p.ref.value = value);
  }
  
  MaterialMapD({
    super.originalPointer,
    TextureD? texture,
    ColorD? color,
    double value = 0,
  }) :
    _texture = texture ?? .zero(),
    _color = color ?? .zero(),
    _value = value;

  factory MaterialMapD.zero() => .new();

  @override
  MaterialMapD setD(MaterialMapD o) {
    texture.setD(o.texture); 
    color.setD(o.color); 
    value = o.value;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<MaterialMapC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<MaterialMapC> p, int index) => p[index];

  @override
  void nativeWriteInto(MaterialMapC p) {
    texture.nativeWriteInto(p.texture);
    color.nativeWriteInto(p.color);
    p.value = value;
  }

  @override
  void nativeReadFrom(MaterialMapC p) {
    texture.nativeReadFrom(p.texture); 
    color.nativeReadFrom(p.color); 
    value = p.value;
  }

  @override
  MaterialMapD clone() => .new(
    originalPointer: originalPointer,
    texture: texture.clone(),
    color: color.clone(),
    value: value,
  );
}