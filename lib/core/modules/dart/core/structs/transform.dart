part of '../../../../raylib_dartified.dart';

extension TransformCPEx on Pointer<TransformC> {
  Pointer<TransformC> setC(TransformC o) { ref.setC(o); return this; }
  Pointer<TransformC> setD(TransformD o) { ref.setD(o); return this; }
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

class TransformD extends StructDLiteral<TransformC, TransformD> with TransformBase<
  TransformD,
  Vector3D,
  MatrixD,
  QuaternionD,
  Vector4D
> {
  @override
  Vector3D translation;
  
  @override
  QuaternionD rotation;
  
  @override
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
  TransformD setD(TransformD o) {
    translation.setD(o.translation);
    rotation.setD(o.rotation);
    scale.setD(o.scale);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<TransformC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<TransformC> p, int index) => p[index];

  @override
  void nativeWriteInto(TransformC p) {
    translation.nativeWriteInto(p.translation);
    rotation.nativeWriteInto(p.rotation);
    scale.nativeWriteInto(p.scale);
  }

  @override
  void nativeReadFrom(TransformC p) {
    translation.nativeReadFrom(p.translation);
    rotation.nativeReadFrom(p.rotation);
    scale.nativeReadFrom(p.scale);
  }

  @override
  TransformD clone() => .new(
    originalPointer: originalPointer,
    translation: translation.clone(),
    rotation: rotation.clone(),
    scale: scale,
  );
}