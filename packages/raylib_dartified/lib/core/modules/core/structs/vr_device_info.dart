part of '../../../raylib_dartified.dart';

enum VrDeviceInfoField with XFields {
  hResolution,
  vResolution,
  hScreenSize,
  vScreenSize,
  eyeToScreenDistance,
  lensSeparationDistance,
  interpupillaryDistance,
  lensDistortionValues,
  chromaAbCorrection,
}

/// VrDeviceInfo, Head-Mounted-Display device parameters
final class VrDeviceInfo extends XStruct<VrDeviceInfo> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<VrDeviceInfo> struct = .create(
    factory: VrDeviceInfo.new,
    layout: .aligned<VrDeviceInfoField>({
      .hResolution:            XInt(), // Horizontal resolution in pixels
      .vResolution:            XInt(), // Vertical resolution in pixels
      .hScreenSize:            XFloat(), // Horizontal size in meters
      .vScreenSize:            XFloat(), // Vertical size in meters
      .eyeToScreenDistance:    XFloat(), // Distance between eye and display in meters
      .lensSeparationDistance: XFloat(), // Lens separation distance in meters
      .interpupillaryDistance: XFloat(), // IPD (distance between pupils) in meters
      .lensDistortionValues:   XArray(XFloat(), BASE_paramsCount), // Lens distortion constant parameters
      .chromaAbCorrection:     XArray(XFloat(), BASE_paramsCount), // Chromatic aberration correction parameters
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<VrDeviceInfoField> _l = struct.layoutOf();

  /// Field descriptor for [hResolution].
  static final field_hResolution = _l.integer<XInt>(.hResolution);
  /// Field descriptor for [vResolution].
  static final field_vResolution = _l.integer<XInt>(.vResolution);
  /// Field descriptor for [hScreenSize].
  static final field_hScreenSize = _l.float<XFloat>(.hScreenSize);
  /// Field descriptor for [vScreenSize].
  static final field_vScreenSize = _l.float<XFloat>(.vScreenSize);
  /// Field descriptor for [eyeToScreenDistance].
  static final field_eyeToScreenDistance = _l.float<XFloat>(.eyeToScreenDistance);
  /// Field descriptor for [lensSeparationDistance].
  static final field_lensSeparationDistance = _l.float<XFloat>(.lensSeparationDistance);
  /// Field descriptor for [interpupillaryDistance].
  static final field_interpupillaryDistance = _l.float<XFloat>(.interpupillaryDistance);
  /// Field descriptor for [lensDistortionValues].
  static final field_lensDistortionValues = _l.scalarArray<double, XFloat>(.lensDistortionValues);
  /// Field descriptor for [chromaAbCorrection].
  static final field_chromaAbCorrection = _l.scalarArray<double, XFloat>(.chromaAbCorrection);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [lensDistortionValues] and [chromaAbCorrection] arrays.
  static int get BASE_paramsCount => 4;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _hResolution;
  /// Horizontal resolution in pixels
  int get hResolution => _hResolution = field_hResolution.readOr(op, _hResolution);
  set hResolution(int value) => _hResolution = field_hResolution.writeOr(op, value);

  int _vResolution;
  /// Vertical resolution in pixels
  int get vResolution => _vResolution = field_vResolution.readOr(op, _vResolution);
  set vResolution(int value) => _vResolution = field_vResolution.writeOr(op, value);

  double _hScreenSize;
  /// Horizontal size in meters
  double get hScreenSize => _hScreenSize = field_hScreenSize.readOr(op, _hScreenSize);
  set hScreenSize(double value) => _hScreenSize = field_hScreenSize.writeOr(op, value);

  double _vScreenSize;
  /// Vertical size in meters
  double get vScreenSize => _vScreenSize = field_vScreenSize.readOr(op, _vScreenSize);
  set vScreenSize(double value) => _vScreenSize = field_vScreenSize.writeOr(op, value);

  double _eyeToScreenDistance;
  /// Distance between eye and display in meters
  double get eyeToScreenDistance => _eyeToScreenDistance = field_eyeToScreenDistance.readOr(op, _eyeToScreenDistance);
  set eyeToScreenDistance(double value) => _eyeToScreenDistance = field_eyeToScreenDistance.writeOr(op, value);

  double _lensSeparationDistance;
  /// Lens separation distance in meters
  double get lensSeparationDistance => _lensSeparationDistance = field_lensSeparationDistance.readOr(op, _lensSeparationDistance);
  set lensSeparationDistance(double value) => _lensSeparationDistance = field_lensSeparationDistance.writeOr(op, value);

  double _interpupillaryDistance;
  /// IPD (distance between pupils) in meters
  double get interpupillaryDistance => _interpupillaryDistance = field_interpupillaryDistance.readOr(op, _interpupillaryDistance);
  set interpupillaryDistance(double value) => _interpupillaryDistance = field_interpupillaryDistance.writeOr(op, value);

  late final XLiveList<double, XFloat> _lensDistortionValues;
  /// Lens distortion constant parameters
  XLiveList<double, XFloat> get lensDistortionValues => _lensDistortionValues;
  set lensDistortionValues(List<double> value) => _lensDistortionValues.setOrAllocate(value);

  late final XLiveList<double, XFloat> _chromaAbCorrection;
  /// Chromatic aberration correction parameters
  XLiveList<double, XFloat> get chromaAbCorrection => _chromaAbCorrection;
  set chromaAbCorrection(List<double> value) => _chromaAbCorrection.setOrAllocate(value);

  VrDeviceInfo({
    super.op,
    this._hResolution = 0,
    this._vResolution = 0,
    this._hScreenSize = 0,
    this._vScreenSize = 0,
    this._eyeToScreenDistance = 0,
    this._lensSeparationDistance = 0,
    this._interpupillaryDistance = 0,
    List<double>? lensDistortionValues,
    List<double>? chromaAbCorrection,
  }) {
    _lensDistortionValues = field_lensDistortionValues.live(() => op,
      lensDistortionValues ?? .filled(field_lensDistortionValues.codec.type.count, 0)
    );

    _chromaAbCorrection = field_chromaAbCorrection.live(() => op,
      chromaAbCorrection ?? .filled(field_chromaAbCorrection.codec.type.count, 0)
    );
  }

  factory VrDeviceInfo.zero() => .new();

  @override
  VrDeviceInfo setDart(VrDeviceInfo o) {
    hResolution = o.hResolution;
    vResolution = o.vResolution;
    hScreenSize = o.hScreenSize;
    vScreenSize = o.vScreenSize;
    eyeToScreenDistance = o.eyeToScreenDistance;
    lensSeparationDistance = o.lensSeparationDistance;
    interpupillaryDistance = o.interpupillaryDistance;
    lensDistortionValues = .from(o.lensDistortionValues);
    chromaAbCorrection = .from(o.chromaAbCorrection);
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_hResolution.write(p, hResolution);
    field_vResolution.write(p, vResolution);
    field_hScreenSize.write(p, hScreenSize);
    field_vScreenSize.write(p, vScreenSize);
    field_eyeToScreenDistance.write(p, eyeToScreenDistance);
    field_lensSeparationDistance.write(p, lensSeparationDistance);
    field_interpupillaryDistance.write(p, interpupillaryDistance);
    lensDistortionValues.writeInto(p);
    chromaAbCorrection.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    hResolution = field_hResolution.read(p);
    vResolution = field_vResolution.read(p);
    hScreenSize = field_hScreenSize.read(p);
    vScreenSize = field_vScreenSize.read(p);
    eyeToScreenDistance = field_eyeToScreenDistance.read(p);
    lensSeparationDistance = field_lensSeparationDistance.read(p);
    interpupillaryDistance = field_interpupillaryDistance.read(p);
    lensDistortionValues.readFrom(p);
    chromaAbCorrection.readFrom(p);
  }

  @override
  String signature() => '$structName(res: ${hResolution}x$vResolution, screen: ${hScreenSize}x$vScreenSize)';
}