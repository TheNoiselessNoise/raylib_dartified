part of '../../../../raylib.dart';

extension Camera2DCPEx on Pointer<Camera2DC> {
  Pointer<Camera2DC> setC(Camera2DC o) {
    ref.setC(o);
    return this;
  }

  Pointer<Camera2DC> setD(Camera2DD o) {
    ref.setD(o);
    return this;
  }

  Camera2DD toD() => ref.toD(this);
}

extension Camera2DCEx on Camera2DC {
  Camera2DC setC(Camera2DC o) {
    target.setC(o.target);
    offset.setC(o.offset);
    rotation = o.rotation;
    zoom = o.zoom;
    return this;
  }

  Camera2DC setD(Camera2DD o) {
    target.setD(o.target);
    offset.setD(o.offset);
    rotation = o.rotation;
    zoom = o.zoom;
    return this;
  }

  Camera2DD toD([Pointer<Camera2DC>? ptr]) => .new(
    originalPointer: ptr,
    offset: offset.toD(),
    target: target.toD(),
    rotation: rotation,
    zoom: zoom,
  );
}

class Camera2DD extends StructDLiteral<Camera2DD, Camera2DC> with Camera2DBase {
  @override
  Vector2D offset;
  
  @override
  Vector2D target;
  
  @override
  double rotation;
  
  @override
  double zoom;

  Camera2DD({
    super.originalPointer,
    Vector2D? offset,
    Vector2D? target,
    this.rotation = 0,
    this.zoom = 0,
  }) :
    offset = offset ?? .zero(),
    target = target ?? .zero();

  factory Camera2DD.zero() => .new();

  @override
  Camera2DD setC(Camera2DC o) {
    offset.setC(o.offset);
    target.setC(o.target);
    rotation = o.rotation;
    zoom = o.zoom;
    return this;
  }

  @override
  Camera2DD setD(Camera2DD o) {
    originalPointer ??= o.originalPointer;
    offset.setD(o.offset);
    target.setD(o.target);
    rotation = o.rotation;
    zoom = o.zoom;
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Camera2D$;

  @override
  void nativeWriteInto(Camera2DC p) {
    offset.nativeWriteInto(p.offset);
    target.nativeWriteInto(p.target);
    p.rotation = rotation;
    p.zoom = zoom;
  }

  @override
  String signature() => '$structName(offset: $offset, target: $target, rotation: $rotation, zoom: $zoom)';
  
  @override
  Camera2DD clone() => .new(
    originalPointer: originalPointer,
    offset: offset.clone(),
    target: target.clone(),
    rotation: rotation,
    zoom: zoom,
  );
}