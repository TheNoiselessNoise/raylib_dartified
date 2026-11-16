part of '../../../raylib_dartified_base.dart';

enum MusicField with XFields {
  stream,
  frameCount,
  looping,
  ctxType,
  ctxData,
}

/// Music, audio stream, anything longer than ~10 seconds should be streamed
final class Music extends XStruct<Music> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Music> struct = .create(
    factory: Music.new,
    layout: .aligned<MusicField>({
      .stream:     XStructType(AudioStream.struct), // Audio stream
      .frameCount: XUnsignedInt(), // Total number of frames (considering channels)
      .looping:    XBool(), // Music looping enable
      .ctxType:    XInt(), // Type of music context (audio filetype)
      .ctxData:    XPtrType(XVoid()), // Audio context data, depends on type
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<MusicField> _l = struct.layoutOf();

  /// Field descriptor for [stream].
  static final field_stream = _l.struct<AudioStream>(.stream);
  /// Field descriptor for [frameCount].
  static final field_frameCount = _l.integer<XUnsignedInt>(.frameCount);
  /// Field descriptor for [looping].
  static final field_looping = _l.boolean(.looping);
  /// Field descriptor for [ctxType].
  static final field_ctxType = _l.enumValue(.ctxType, MusicContextType.fromValue);
  /// Field descriptor for [ctxData].
  static final field_ctxData = _l.ptrUnknown<XVoid>(.ctxData);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  AudioStream _stream;
  /// Audio stream
  AudioStream get stream => _stream = field_stream.readOr(op, _stream);
  set stream(AudioStream value) => _stream = field_stream.writeOr(op, value);
  
  int _frameCount;
  /// Total number of frames (considering channels)
  int get frameCount => _frameCount = field_frameCount.readOr(op, _frameCount);
  set frameCount(int value) => _frameCount = field_frameCount.writeOr(op, value);

  bool _looping;
  /// Music looping enable
  bool get looping => _looping = field_looping.readOr(op, _looping);
  set looping(bool value) => _looping = field_looping.writeOr(op, value);

  MusicContextType _ctxType;
  /// Type of music context (audio filetype)
  MusicContextType get ctxType => _ctxType = field_ctxType.readOr(op, _ctxType);
  set ctxType(MusicContextType value) => _ctxType = field_ctxType.writeOr(op, value);

  /// Audio context data, depends on type
  /// 
  /// `void *ctxData;`
  late final XLivePtrSync<XVoid> _ctxData = field_ctxData.live(() => op);
  XPtr<XVoid> get ctxData => _ctxData.derefPtr(safe: true);

  Music({
    super.op,
    AudioStream? stream,
    this._frameCount = 0,
    this._looping = false,
    this._ctxType = .MUSIC_AUDIO_NONE,
  }) :
    _stream = stream ?? .zero();

  factory Music.zero() => .new();

  @override
  Music setDart(Music o)
    => throw UnsupportedError('$runtimeType cannot support `setDart` method.');

  @override
  void structAllocateInto(XPtr p, String key) {
    field_ctxData.allocate(p, '${key}_ctxData');
  }

  @override
  void structWriteInto(XPtr p) {
    field_stream.write(p, stream);
    field_frameCount.write(p, frameCount);
    field_looping.write(p, looping);
    field_ctxType.write(p, ctxType);
    _ctxData.syncInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    stream = field_stream.read(p);
    frameCount = field_frameCount.read(p);
    looping = field_looping.read(p);
    ctxType = field_ctxType.read(p);
    _ctxData.syncFrom(p);
  }

  @override
  String signature() => '$structName(stream: $stream, frameCount: $frameCount, looping: $looping, ctxType: $ctxType)';  
}