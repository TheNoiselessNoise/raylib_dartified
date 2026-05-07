part of '../../../../raylib.dart';

extension BoneInfoCLike on BoneInfoC {
  int get nameLength => 32;
  String get nameString => name.toDartString(nameLength);
}

extension BoneInfoDLike on BoneInfoD {
  int get nameLength => 32;
}

extension BoneInfoCPEx on Pointer<BoneInfoC> {
  Pointer<BoneInfoC> setC(BoneInfoC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<BoneInfoC> setD(BoneInfoD o) {
    ref.setD(o);
    return this;
  }

  BoneInfoD toD() => ref.toD(this);
}

extension BoneInfoCEx on BoneInfoC {
  BoneInfoC setC(BoneInfoC o) {
    parent = o.parent;
    name = o.name;
    return this;
  }

  BoneInfoC setD(BoneInfoD o) {
    parent = o.parent;
    o.onOriginalPointer((p) {
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

class BoneInfoD extends StructDLiteral<BoneInfoD, BoneInfoC> {
  String name;
  int parent;

  BoneInfoD({
    super.originalPointer,
    this.name = '',
    this.parent = 0,
  });

  factory BoneInfoD.zero() => .new();

  @override
  BoneInfoD setC(BoneInfoC o) {
    onOriginalPointer((p) {
      p.ref.name = o.name;
    });
    parent = o.parent;
    name = o.name.toDartString(nameLength);
    return this;
  }

  @override
  BoneInfoD setD(BoneInfoD o) {
    originalPointer ??= o.originalPointer;
    name = o.name;
    parent = o.parent;
    return this;
  }

  @override
  Pointer<BoneInfoC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.BoneInfo$.At(key, count);

  @override
  void allocateInto(RaylibTemp temp, Pointer<BoneInfoC> p, String key)
    => writeInto(p.ref);

  @override
  void writeInto(BoneInfoC p) {
    p.name.setDartString(name, nameLength);
    p.parent = parent;
  }

  @override
  String signature() => '$structName(name: $name, parent: $parent)';

  @override
  BoneInfoD clone() => .new(
    originalPointer: originalPointer,
    name: name,
    parent: parent,
  );
}