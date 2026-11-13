part of '../../../raylib_dartified_base.dart';

enum SoundField with XFields {
  stream,
  frameCount,
}

/// Sound
class Sound extends XStruct<Sound> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<Sound> struct = .create(
    factory: Sound.new,
    layout: .aligned<SoundField>({
      .stream:     XRawStruct(AudioStream.struct), // Audio stream
      .frameCount: XUnsignedInt(), // Total number of frames (considering channels)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<SoundField> _l = struct.layoutOf();

  /// Field descriptor for [stream].
  static final field_stream = _l.struct<AudioStream>(.stream);
  /// Field descriptor for [frameCount].
  static final field_frameCount = _l.integer<XUnsignedInt>(.frameCount);

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

  Sound({
    super.op,
    AudioStream? stream,
    int frameCount = 0,
  }) :
    _stream = stream ?? .zero(),
    _frameCount = frameCount;

  factory Sound.zero() => .new();

  @override
  Sound setDart(Sound o) {
    stream.setDart(o.stream);
    frameCount = o.frameCount;
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    field_stream.write(p, stream);
    field_frameCount.write(p, frameCount);
  }

  @override
  void structReadFrom(XPtr p) {
    stream = field_stream.read(p);
    frameCount = field_frameCount.read(p);
  }

  @override
  String signature() => '$structName(stream: $stream, frameCount: $frameCount)';
}