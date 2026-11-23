part of '../../../raylib_dartified.dart';

enum MaterialField with XFields {
  shader,
  maps,
  params,
}

/// Material, includes shader and maps
final class Material extends XStruct<Material> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Material> struct = .create(
    factory: Material.new,
    layout: .aligned<MaterialField>({
      .shader: XStructType(Shader.struct), // Material shader
      .maps:   XPtrType(XArray(XStructType(MaterialMap.struct), BASE_mapsCount)), // Material maps array (MAX_MATERIAL_MAPS)
      .params: XArray(XFloat(), BASE_paramsCount), // Material generic parameters (if required)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<MaterialField> _l = struct.layoutOf();

  /// Field descriptor for [shader].
  static final field_shader = _l.struct<Shader>(.shader);
  /// Field descriptor for [maps].
  static final field_maps = _l.ptrStructFixedArray<MaterialMap>(.maps);
  /// Field descriptor for [params].
  static final field_params = _l.scalarArray<double, XFloat>(.params);

  static final _mapsKey = 'maps';

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [maps] buffer.
  static int get BASE_mapsCount => RaylibConstants.MAX_MATERIAL_MAPS;

  /// Number of components in the [params] array.
  static int get BASE_paramsCount => 4;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Shader _shader;
  /// Material shader
  Shader get shader => _shader = field_shader.readOr(op, _shader);
  set shader(Shader value) => _shader = field_shader.writeOr(op, value);

  late final StructLiveListStruct<MaterialMap> _maps;
  /// Material maps array (MAX_MATERIAL_MAPS)
  StructLiveListStruct<MaterialMap> get maps => _maps;
  set maps(List<MaterialMap> value) => _maps.setOrAllocate(value, key: _mapsKey);

  late final XLiveList<double, XFloat> _params;
  /// Material generic parameters (if required)
  XLiveList<double, XFloat> get params => _params;
  set params(List<double> value) => _params.setOrAllocate(value);

  Material({
    super.op,
    Shader? shader,
    List<MaterialMap>? maps,
    List<double>? params,
  }) :
    _shader = shader ?? .zero()
  {
    _maps = field_maps.live(() => op, maps ?? .generate(BASE_mapsCount, (_) => .zero()));
    _params = field_params.live(() => op, params ?? .filled(field_params.codec.type.count, 0));
  }

  factory Material.zero() => .new();

  @override
  Material setDart(Material o) {
    shader.setDart(o.shader);
    maps = o.maps.map((x) => x.clone()).toList();
    params = .from(o.params);
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    field_maps.allocate(p, '$key:$_mapsKey', count: BASE_mapsCount);
  }

  @override
  void structWriteInto(XPtr p) {
    field_shader.write(p, shader);
    maps.writeInto(p);
    params.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    shader = field_shader.read(p);
    maps.readFrom(p, count: BASE_mapsCount);
    params.readFrom(p);
  }

  @override
  String signature() => '$structName(shader: $shader, maps: ${maps.length}, params: ${params.join(', ')})';
}