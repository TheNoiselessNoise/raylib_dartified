part of '../../../raylib_dartified.dart';

enum VrStereoConfigField with XFields {
  projection,
  viewOffset,
  leftLensCenter,
  rightLensCenter,
  leftScreenCenter,
  rightScreenCenter,
  scale,
  scaleIn,
}

/// VrStereoConfig, VR stereo rendering configuration for simulator
final class VrStereoConfig extends XStruct<VrStereoConfig> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<VrStereoConfig> struct = .create(
    factory: VrStereoConfig.new,
    layout: .aligned<VrStereoConfigField>({
      .projection:        XArray(XStructType(Matrix.struct), BASE_paramsCount), // VR projection matrices (per eye)
      .viewOffset:        XArray(XStructType(Matrix.struct), BASE_paramsCount), // VR view offset matrices (per eye)
      .leftLensCenter:    XArray(XFloat(), BASE_paramsCount), // VR left lens center
      .rightLensCenter:   XArray(XFloat(), BASE_paramsCount), // VR right lens center
      .leftScreenCenter:  XArray(XFloat(), BASE_paramsCount), // VR left screen center
      .rightScreenCenter: XArray(XFloat(), BASE_paramsCount), // VR right screen center
      .scale:             XArray(XFloat(), BASE_paramsCount), // VR distortion scale
      .scaleIn:           XArray(XFloat(), BASE_paramsCount), // VR distortion scale in
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<VrStereoConfigField> _l = struct.layoutOf();

  /// Field descriptor for [projection].
  static final field_projection = _l.structArray<Matrix>(.projection);
  /// Field descriptor for [viewOffset].
  static final field_viewOffset = _l.structArray<Matrix>(.viewOffset);
  /// Field descriptor for [leftLensCenter].
  static final field_leftLensCenter = _l.scalarArray<double, XFloat>(.leftLensCenter);
  /// Field descriptor for [rightLensCenter].
  static final field_rightLensCenter = _l.scalarArray<double, XFloat>(.rightLensCenter);
  /// Field descriptor for [leftScreenCenter].
  static final field_leftScreenCenter = _l.scalarArray<double, XFloat>(.leftScreenCenter);
  /// Field descriptor for [rightScreenCenter].
  static final field_rightScreenCenter = _l.scalarArray<double, XFloat>(.rightScreenCenter);
  /// Field descriptor for [scale].
  static final field_scale = _l.scalarArray<double, XFloat>(.scale);
  /// Field descriptor for [scaleIn].
  static final field_scaleIn = _l.scalarArray<double, XFloat>(.scaleIn);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [projection], [viewOffset], [leftLensCenter], [rightLensCenter], [leftScreenCenter], [rightScreenCenter], [scale] and [scaleIn] arrays.
  static int get BASE_paramsCount => 2;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  late final StructLiveListStruct<Matrix> _projection;
  /// VR projection matrices (per eye)
  StructLiveListStruct<Matrix> get projection => _projection;
  set projection(List<Matrix> value) => _projection.setOrAllocate(value);
  
  late final StructLiveListStruct<Matrix> _viewOffset;
  /// VR view offset matrices (per eye)
  StructLiveListStruct<Matrix> get viewOffset => _viewOffset;
  set viewOffset(List<Matrix> value) => _viewOffset.setOrAllocate(value);
  
  late final XLiveList<double, XFloat> _leftLensCenter;
  /// VR left lens center
  XLiveList<double, XFloat> get leftLensCenter => _leftLensCenter;
  set leftLensCenter(List<double> value) => _leftLensCenter.setOrAllocate(value);
  
  late final XLiveList<double, XFloat> _rightLensCenter;
  /// VR right lens center
  XLiveList<double, XFloat> get rightLensCenter => _rightLensCenter;
  set rightLensCenter(List<double> value) => _rightLensCenter.setOrAllocate(value);
  
  late final XLiveList<double, XFloat> _leftScreenCenter;
  /// VR left screen center
  XLiveList<double, XFloat> get leftScreenCenter => _leftScreenCenter;
  set leftScreenCenter(List<double> value) => _leftScreenCenter.setOrAllocate(value);
  
  late final XLiveList<double, XFloat> _rightScreenCenter;
  /// VR right screen center
  XLiveList<double, XFloat> get rightScreenCenter => _rightScreenCenter;
  set rightScreenCenter(List<double> value) => _rightScreenCenter.setOrAllocate(value);
  
  late final XLiveList<double, XFloat> _scale;
  /// VR distortion scale
  XLiveList<double, XFloat> get scale => _scale;
  set scale(List<double> value) => _scale.setOrAllocate(value);
  
  late final XLiveList<double, XFloat> _scaleIn;
  /// VR distortion scale in
  XLiveList<double, XFloat> get scaleIn => _scaleIn;
  set scaleIn(List<double> value) => _scaleIn.setOrAllocate(value);

  VrStereoConfig({
    super.op,
    List<Matrix>? projection,
    List<Matrix>? viewOffset,
    List<double>? leftLensCenter,
    List<double>? rightLensCenter,
    List<double>? leftScreenCenter,
    List<double>? rightScreenCenter,
    List<double>? scale,
    List<double>? scaleIn,
  }) {
    _projection = field_projection.live(() => op, projection ?? .generate(field_projection.codec.type.count, (_) => .zero()));
    _viewOffset = field_viewOffset.live(() => op, viewOffset ?? .generate(field_viewOffset.codec.type.count, (_) => .zero()));
    _leftLensCenter = field_leftLensCenter.live(() => op, leftLensCenter ?? .filled(field_leftLensCenter.codec.type.count, 0));
    _rightLensCenter = field_rightLensCenter.live(() => op, rightLensCenter ?? .filled(field_rightLensCenter.codec.type.count, 0));
    _leftScreenCenter = field_leftScreenCenter.live(() => op, leftScreenCenter ?? .filled(field_leftScreenCenter.codec.type.count, 0));
    _rightScreenCenter = field_rightScreenCenter.live(() => op, rightScreenCenter ?? .filled(field_rightScreenCenter.codec.type.count, 0));
    _scale = field_scale.live(() => op, scale ?? .filled(field_scale.codec.type.count, 0));
    _scaleIn = field_scaleIn.live(() => op, scaleIn ?? .filled(field_scaleIn.codec.type.count, 0));
  }

  factory VrStereoConfig.zero() => .new();

  @override
  VrStereoConfig setDart(VrStereoConfig o) {
    projection = .from(o.projection);
    viewOffset = .from(o.viewOffset);
    leftLensCenter = .from(o.leftLensCenter);
    rightLensCenter = .from(o.rightLensCenter);
    leftScreenCenter = .from(o.leftScreenCenter);
    rightScreenCenter = .from(o.rightScreenCenter);
    scale = .from(o.scale);
    scaleIn = .from(o.scaleIn);
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    projection.writeInto(p);
    viewOffset.writeInto(p);
    leftLensCenter.writeInto(p);
    rightLensCenter.writeInto(p);
    leftScreenCenter.writeInto(p);
    rightScreenCenter.writeInto(p);
    scale.writeInto(p);
    scaleIn.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    _projection.readFrom(p);
    _viewOffset.readFrom(p);
    _leftLensCenter.readFrom(p);
    _rightLensCenter.readFrom(p);
    _leftScreenCenter.readFrom(p);
    _rightScreenCenter.readFrom(p);
    _scale.readFrom(p);
    _scaleIn.readFrom(p);
  }

  @override
  String signature() => '$structName()';
}