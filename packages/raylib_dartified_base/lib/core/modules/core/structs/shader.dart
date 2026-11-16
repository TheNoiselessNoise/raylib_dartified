part of '../../../raylib_dartified_base.dart';

enum ShaderField with XFields {
  id,
  locs,
}

/// Shader
final class Shader extends XStruct<Shader> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Shader> struct = .create(
    factory: Shader.new,
    layout: .aligned<ShaderField>({
      .id:   XUnsignedInt(), // Shader program id
      .locs: XPtrType(XArray(XInt(), BASE_shaderLocsCount)), // Shader locations array (RL_MAX_SHADER_LOCATIONS)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<ShaderField> _l = struct.layoutOf();

  /// Field descriptor for [id].
  static final field_id = _l.integer<XUnsignedInt>(.id);
  /// Field descriptor for [locs].
  static final field_locs = _l.ptrScalarFixedArray<int, XInt>(.locs);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [locs] buffer.
  static int get BASE_shaderLocsCount => RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _id;
  /// Shader program id
  int get id => _id = field_id.readOr(op, _id);
  set id(int value) => _id = field_id.writeOr(op, value);

  late final XLiveList<int, XInt> _locs;
  /// Shader locations array (RL_MAX_SHADER_LOCATIONS)
  XLiveList<int, XInt> get locs => _locs;
  set locs(List<int> value) => _locs.inner = value;

  Shader({
    super.op,
    this._id = 0,
    List<int>? locs,
  }) {
    _locs = field_locs.live(() => op, locs ?? .filled(BASE_shaderLocsCount, 0));
  }

  factory Shader.zero() => .new();

  @override
  Shader setDart(Shader o) {
    id = o.id;
    locs = .from(o.locs);
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    field_locs.allocate(p, '${key}_locs', count: BASE_shaderLocsCount);
  }

  @override
  void structWriteInto(XPtr p) {
    field_id.write(p, id);
    locs.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    id = field_id.read(p);
    locs.readFrom(p, count: BASE_shaderLocsCount);
  }

  @override
  String signature() => '$structName(id: $id, locs: ${locs.join(', ')})';
}