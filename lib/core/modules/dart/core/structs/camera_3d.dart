part of '../../../../raylib.dart';

extension Camera3DCPEx on Pointer<Camera3DC> {
  Pointer<Camera3DC> setC(Camera3DC o) {
    ref.setC(o);
    return this;
  }

  Pointer<Camera3DC> setD(Camera3DD o) {
    ref.setD(o);
    return this;
  }

  Camera3DD toD() => ref.toD(this);
}

extension Camera3DCEx on Camera3DC {
  Camera3DC setC(Camera3DC o) {
    position.setC(o.position);
    target.setC(o.target);
    up.setC(o.up);
    fovy = o.fovy;
    projection = o.projection;
    return this;
  }

  Camera3DC setD(Camera3DD o) {
    position.setD(o.position);
    target.setD(o.target);
    up.setD(o.up);
    fovy = o.fovy;
    projection = o.projection.value;
    return this;
  }

  Camera3DD toD([Pointer<Camera3DC>? ptr]) => .new(
    originalPointer: ptr,
    position: position.toD(),
    target: target.toD(),
    up: up.toD(),
    fovy: fovy,
    projection: .fromValue(projection),
  );
}

class Camera3DD extends StructDLiteral<Camera3DD, Camera3DC> {
  Vector3D position;
  Vector3D target;
  Vector3D up;
  double fovy;
  CameraProjection projection;

  Camera3DD({
    super.originalPointer,
    Vector3D? position,
    Vector3D? target,
    Vector3D? up,
    this.fovy = 45,
    this.projection = .CAMERA_PERSPECTIVE,
  }) :
    position = position ?? .zero(),
    target = target ?? .zero(),
    up = up ?? .zero();

  factory Camera3DD.zero() => .new();

  @override
  Camera3DD setC(Camera3DC o) {
    position.setC(o.position);
    target.setC(o.target);
    up.setC(o.up);
    fovy = o.fovy;
    projection = .fromValue(o.projection);
    return this;
  }

  @override
  Camera3DD setD(Camera3DD o) {
    originalPointer ??= o.originalPointer;
    position.setD(o.position);
    target.setD(o.target);
    up.setD(o.up);
    fovy = o.fovy;
    projection = o.projection;
    return this;
  }

  @override
  Pointer<Camera3DC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.Camera3D$.At(key, count);

  @override
  void allocateInto(RaylibTemp temp, Pointer<Camera3DC> p, String key)
    => writeInto(p.ref);

  @override
  void writeInto(Camera3DC p) {
    position.writeInto(p.position);
    target.writeInto(p.target);
    up.writeInto(p.up);
    p.fovy = fovy;
    p.projection = projection.value;
  }

  @override
  String signature() => '$structName(position: $position, target: $target, up: $up, fovy: $fovy, projection: ${projection.name})';

  @override
  Camera3DD clone() => .new(
    originalPointer: originalPointer,
    position: position.clone(),
    target: target.clone(),
    up: up.clone(),
    fovy: fovy,
    projection: projection,
  );
}