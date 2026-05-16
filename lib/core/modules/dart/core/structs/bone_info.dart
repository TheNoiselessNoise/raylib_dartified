part of '../../../../raylib.dart';

extension BoneInfoCLike on BoneInfoC {
  int get nameLength => 32;
  String get nameString => name.toDartString(nameLength);
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
    o.nativeOnOriginalPointer((p) {
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

class BoneInfoD extends StructDLiteral<BoneInfoD, BoneInfoC> with BoneInfoBase {
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
    nativeOnOriginalPointer((p) {
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
  nativeAllocator(RaylibTemp temp) => temp.BoneInfo$;

  @override
  void nativeWriteInto(BoneInfoC p) {
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