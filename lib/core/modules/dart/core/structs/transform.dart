part of '../../../../raylib.dart';

extension TransformCPEx on Pointer<TransformC> {
  Pointer<TransformC> setC(TransformC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<TransformC> setD(TransformD o) {
    ref.setD(o);
    return this;
  }

  TransformD toD() => ref.toD(this);
}

extension TransformCEx on TransformC {
  TransformC setC(TransformC o) {
    translation.setC(o.translation);
    rotation.setC(o.rotation);
    scale.setC(o.scale);
    return this;
  }

  TransformC setD(TransformD o) {
    translation.setD(o.translation);
    rotation.setD(o.rotation);
    scale.setD(o.scale);
    return this;
  }

  TransformD toD([Pointer<TransformC>? ptr]) => .new(
    originalPointer: ptr,
    translation: translation.toD(),
    rotation: rotation.toD(),
    scale: scale.toD(),
  );
}

class TransformD extends StructDLiteral<TransformD, TransformC> {
  Vector3D translation;
  QuaternionD rotation;
  Vector3D scale;

  TransformD({
    super.originalPointer,
    Vector3D? translation,
    QuaternionD? rotation,
    Vector3D? scale,
  }) :
    translation = translation ?? .zero(),
    rotation = rotation ?? .zero(),
    scale = scale ?? .zero();

  factory TransformD.zero() => .new();

  @override
  TransformD setC(TransformC o) {
    translation.setC(o.translation);
    rotation.setC(o.rotation);
    scale.setC(o.scale);
    return this;
  }

  @override
  TransformD setD(TransformD o) {
    originalPointer ??= o.originalPointer;
    translation.setD(o.translation);
    rotation.setD(o.rotation);
    scale.setD(o.scale);
    return this;
  }

  @override
  Pointer<TransformC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.Transform$.At(key, count);

  @override
  void allocateInto(RaylibTemp temp, Pointer<TransformC> p, String key)
    => writeInto(p.ref);

  @override
  void writeInto(TransformC p) {
    translation.writeInto(p.translation);
    rotation.writeInto(p.rotation);
    scale.writeInto(p.scale);
  }

  @override
  String signature() => '$structName(translation: $translation, rotation: $rotation, scale: $scale)';

  @override
  TransformD clone() => .new(
    originalPointer: originalPointer,
    translation: translation.clone(),
    rotation: rotation.clone(),
    scale: scale,
  );
}