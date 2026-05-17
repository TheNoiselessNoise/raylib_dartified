part of '../../../../raylib.dart';

extension RenderTextureCPEx on Pointer<RenderTextureC> {
  Pointer<RenderTextureC> setC(RenderTextureC o) {
    ref.setC(o);
    return this;
  }

  Pointer<RenderTextureC> setD(RenderTextureD o) {
    ref.setD(o);
    return this;
  }

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

class RenderTextureD extends StructDLiteral<RenderTextureC, RenderTextureD> with RenderTextureBase {
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
  RenderTextureD setC(RenderTextureC o) {
    id = o.id;
    texture.setC(o.texture);
    depth.setC(o.depth);
    return this;
  }

  @override
  RenderTextureD setD(RenderTextureD o) {
    originalPointer ??= o.originalPointer;
    id = o.id;
    texture = o.texture;
    depth = o.texture;
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.RenderTexture$;

  @override
  void nativeWriteInto(RenderTextureC p) {
    p.id = id;
    texture.nativeWriteInto(p.texture);
    depth.nativeWriteInto(p.depth);
  }

  @override
  String signature() => '$structName(id: $id, texture: $texture, depth: $depth)';

  @override
  RenderTextureD clone() => .new(
    originalPointer: originalPointer,
    id: id,
    texture: texture.clone(),
    depth: depth.clone(),
  );
}