part of '../../../../raylib_dartified.dart';

extension RenderTextureCPEx on Pointer<RenderTextureC> {
  Pointer<RenderTextureC> setC(RenderTextureC o) { ref.setC(o); return this; }
  Pointer<RenderTextureC> setD(RenderTextureD o) { ref.setD(o); return this; }
  RenderTextureD toD() => ref.toD(this);
}

extension RenderTextureCEx on RenderTextureC {
  RenderTextureC setC(RenderTextureC o) {
    id = o.id;
    texture.setC(o.texture);
    depth.setC(o.depth);
    return this;
  }

  RenderTextureC setD(RenderTextureD o) {
    id = o.id;
    texture.setD(o.texture);
    depth.setD(o.depth);
    return this;
  }

  RenderTextureD toD([Pointer<RenderTextureC>? ptr]) => .new(
    originalPointer: ptr,
    id: id,
    texture: texture.toD(),
    depth: depth.toD(),
  );
}

class RenderTextureD extends StructDLiteral<RenderTextureC, RenderTextureD> with RenderTextureBase<
  RenderTextureD,
  TextureD
> {
  @override
  int id;
  
  @override
  TextureD texture;
  
  @override
  TextureD depth;

  RenderTextureD({
    super.originalPointer,
    this.id = 0,
    TextureD? texture,
    TextureD? depth,
  }) :
    texture = texture ?? .new(),
    depth = depth ?? .new();

  factory RenderTextureD.zero() => .new();

  @override
  RenderTextureD setD(RenderTextureD o) {
    id = o.id;
    texture = o.texture;
    depth = o.texture;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<RenderTextureC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<RenderTextureC> p, int index) => p[index];

  @override
  void nativeWriteInto(RenderTextureC p) {
    p.id = id;
    texture.nativeWriteInto(p.texture);
    depth.nativeWriteInto(p.depth);
  }

  @override
  void nativeReadFrom(RenderTextureC p) {
    id = p.id;
    texture.nativeReadFrom(p.texture);
    depth.nativeReadFrom(p.depth);
  }

  @override
  RenderTextureD clone() => .new(
    originalPointer: originalPointer,
    id: id,
    texture: texture.clone(),
    depth: depth.clone(),
  );
}