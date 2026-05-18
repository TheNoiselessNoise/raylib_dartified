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
    o.structOnOriginalPointer((p) {
      name = p.ref.name;
    });
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
  BoneInfoD setC(BoneInfoC o) {
    structOnOriginalPointer((p) {
      p.ref.name = o.name;
    });
    parent = o.parent;
    name = o.name.toDartString(nameLength);
    return this;
  }

  @override
  BoneInfoD setD(BoneInfoD o) {
    name = o.name;
    parent = o.parent;
    return this;
  }

  @override
  getReference(Pointer<BoneInfoC> p) => p.ref;

  @override
  void nativeWriteInto(BoneInfoC p) {
    p.name.setDartString(name, nameLength);
    p.parent = parent;
  }

  @override
  BoneInfoD clone() => .new(
    originalPointer: originalPointer,
    name: name,
    parent: parent,
  );
}