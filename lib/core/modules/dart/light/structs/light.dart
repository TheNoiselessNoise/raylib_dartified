part of '../../../../raylib.dart';

extension LightCPEx on Pointer<LightC> {
  Pointer<LightC> setC(LightC o) {
    ref.setC(o);
    return this;
  }

  Pointer<LightC> setD(LightD o) {
    ref.setD(o);
    return this;
  }

  LightD toD() => ref.toD(this);
}

extension LightCEx on LightC {
  LightC setC(LightC o) {
    type = o.type;
    enabled = o.enabled;
    position.setC(o.position);
    target.setC(o.target);
    color.setC(o.color);
    attenuation = o.attenuation;
    enabledLoc = o.enabledLoc;
    typeLoc = o.typeLoc;
    positionLoc = o.positionLoc;
    targetLoc = o.targetLoc;
    colorLoc = o.colorLoc;
    attenuationLoc = o.attenuationLoc;
    return this;
  }

  LightC setD(LightD o) {
    type = o.type.value;
    enabled = o.enabled;
    position.setD(o.position);
    target.setD(o.target);
    color.setD(o.color);
    attenuation = o.attenuation;
    enabledLoc = o.enabledLoc;
    typeLoc = o.typeLoc;
    positionLoc = o.positionLoc;
    targetLoc = o.targetLoc;
    colorLoc = o.colorLoc;
    attenuationLoc = o.attenuationLoc;
    return this;
  }

  LightD toD([Pointer<LightC>? ptr]) => .new(
    originalPointer: ptr,
    type: .fromValue(type),
    enabled: enabled,
    position: position.toD(),
    target: target.toD(),
    color: color.toD(),
    attenuation: attenuation,
    enabledLoc: enabledLoc,
    typeLoc: typeLoc,
    positionLoc: positionLoc,
    targetLoc: targetLoc,
    colorLoc: colorLoc,
    attenuationLoc: attenuationLoc,
  );
}

class LightD extends StructD<LightD, LightC> {
  LightType type;
  bool enabled;
  Vector3D position;
  Vector3D target;
  ColorD color;
  double attenuation;
  int enabledLoc;
  int typeLoc;
  int positionLoc;
  int targetLoc;
  int colorLoc;
  int attenuationLoc;

  LightD({
    super.originalPointer,
    this.type = .LIGHT_POINT,
    this.enabled = false,
    Vector3D? position,
    Vector3D? target,
    ColorD? color,
    this.attenuation = 0,
    this.enabledLoc = 0,
    this.typeLoc = 0,
    this.positionLoc = 0,
    this.targetLoc = 0,
    this.colorLoc = 0,
    this.attenuationLoc = 0,
  }) :
    position = position ?? .zero(),
    target = target ?? .zero(),
    color = color ?? .zero();

  factory LightD.zero() => .new();

  @override
  LightD setC(LightC o) {
    type = .fromValue(o.type);
    enabled = o.enabled;
    position.setC(o.position);
    target.setC(o.target);
    color.setC(o.color);
    attenuation = o.attenuation;
    enabledLoc = o.enabledLoc;
    typeLoc = o.typeLoc;
    positionLoc = o.positionLoc;
    targetLoc = o.targetLoc;
    colorLoc = o.colorLoc;
    attenuationLoc = o.attenuationLoc;
    return this;
  }

  @override
  LightD setD(LightD o) {
    originalPointer ??= o.originalPointer;
    type = o.type;
    enabled = o.enabled;
    position.setD(o.position);
    target.setD(o.target);
    color.setD(o.color);
    attenuation = o.attenuation;
    enabledLoc = o.enabledLoc;
    typeLoc = o.typeLoc;
    positionLoc = o.positionLoc;
    targetLoc = o.targetLoc;
    colorLoc = o.colorLoc;
    attenuationLoc = o.attenuationLoc;
    return this;
  }

  @override
  Pointer<LightC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.Light$.At(key, count);

  @override
  void allocateInto(RaylibTemp temp, Pointer<LightC> p, String key)
    => writeInto(p.ref);

  @override
  void writeInto(LightC p) {
    p.type = type.value;
    p.enabled = enabled;
    position.writeInto(p.position);
    target.writeInto(p.target);
    color.writeInto(p.color);
    p.attenuation = attenuation;
    p.enabledLoc = enabledLoc;
    p.typeLoc = typeLoc;
    p.positionLoc = positionLoc;
    p.targetLoc = targetLoc;
    p.colorLoc = colorLoc;
    p.attenuationLoc = attenuationLoc;
  }

  @override
  String signature() => '$structName(${type.name}, enabled: $enabled, position: $position, target: $target, ...)';

  @override
  LightD clone() => .new(
    originalPointer: originalPointer,
    type: type,
    enabled: enabled,
    position: position.clone(),
    target: target.clone(),
    color: color.clone(),
    attenuation: attenuation,
    enabledLoc: enabledLoc,
    typeLoc: typeLoc,
    positionLoc: positionLoc,
    targetLoc: targetLoc,
    colorLoc: colorLoc,
    attenuationLoc: attenuationLoc,
  );
}