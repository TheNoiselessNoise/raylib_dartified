part of '../../../raylib_dartified.dart';

enum BoneInfoField with XFields {
  name,
  parent,
}

/// Bone, skeletal animation bone
final class BoneInfo extends XStruct<BoneInfo> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<BoneInfo> struct = .createValue(
    factory: BoneInfo.new,
    layout: .aligned<BoneInfoField>({
      .name:   XArray(XChar(), BASE_nameLength), // Bone name
      .parent: XInt(), // Bone parent
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<BoneInfoField> _l = struct.layoutOf();

  /// Field descriptor for [name].
  static final field_name = _l.stringAsCharArray<XChar>(.name);
  /// Field descriptor for [parent].
  static final field_parent = _l.integer<XInt>(.parent);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Size of the native [name] buffer.
  static int get BASE_nameLength => 32;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  String _name;
  /// Bone name
  String get name => _name = field_name.readOr(op, _name);
  set name(String value) => _name = field_name.writeOr(op, value);
  
  int _parent;
  /// Bone parent
  int get parent => _parent = field_parent.readOr(op, _parent);
  set parent(int value) => _parent = field_parent.writeOr(op, value);

  BoneInfo({
    super.op,
    this._name = '',
    this._parent = 0,
  });

  factory BoneInfo.zero() => .new();

  @override
  BoneInfo setDart(BoneInfo o) {
    name = o.name;
    parent = o.parent;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_name.write(p, name);
    field_parent.write(p, parent);
  }

  @override
  void structReadFrom(XPtr p) {
    name = field_name.readBounded(p, BASE_nameLength);
    parent = field_parent.read(p);
  }

  @override
  String signature() => '$structName(name: $name, parent: $parent)';
}