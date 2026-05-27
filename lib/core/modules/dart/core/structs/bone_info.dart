part of '../../../../raylib_dartified.dart';

extension BoneInfoCPEx on Pointer<BoneInfoC> {
  Pointer<BoneInfoC> setC(BoneInfoC o) { ref.setC(o); return this; }
  Pointer<BoneInfoC> setD(BoneInfoD o) { ref.setD(o); return this; }
  BoneInfoD toD() => ref.toD(this);
}

extension BoneInfoCEx on BoneInfoC {
  int get nameLength => BoneInfoBase.BASE_nameLength;
  String get nameString => name.toDartString(nameLength);

  BoneInfoC setC(BoneInfoC o) {
    parent = o.parent;
    name = o.name;
    return this;
  }

  BoneInfoC setD(BoneInfoD o) {
    parent = o.parent;
    o.structOnOp((p) => name = p.ref.name);
    return this;
  }

  BoneInfoD toD([Pointer<BoneInfoC>? ptr]) => .new(
    originalPointer: ptr,
    name: name.toDartString(nameLength),
    parent: parent,
  );
}

class BoneInfoD extends StructDLiteral<BoneInfoC, BoneInfoD> with BoneInfoBase<BoneInfoD> {
  @override
  String name;

  @override
  int parent;

  BoneInfoD({
    super.originalPointer,
    this.name = '',
    this.parent = 0,
  });

  factory BoneInfoD.zero() => .new();

  @override
  BoneInfoD setD(BoneInfoD o) {
    name = o.name;
    parent = o.parent;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<BoneInfoC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<BoneInfoC> p, int index) => p[index];

  @override
  void nativeWriteInto(BoneInfoC p) {
    p.name.setDartString(name, nameLength);
    p.parent = parent;
  }

  @override
  void nativeReadFrom(BoneInfoC p) {
    structOnOp((o) => o.ref.name = p.name);
    parent = p.parent;
    name = p.name.toDartString(nameLength);
  }

  @override
  BoneInfoD clone() => .new(
    originalPointer: originalPointer,
    name: name,
    parent: parent,
  );
}