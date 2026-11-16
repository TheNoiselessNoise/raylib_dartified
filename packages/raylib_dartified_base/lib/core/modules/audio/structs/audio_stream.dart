part of '../../../raylib_dartified_base.dart';

enum AudioStreamField with XFields {
  buffer,
  processor,
  sampleRate,
  sampleSize,
  channels,
}

/// AudioStream, custom audio stream
final class AudioStream extends XStruct<AudioStream> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<AudioStream> struct = .create(
    factory: AudioStream.new,
    layout: .aligned<AudioStreamField>({
      .buffer:     XPtrType(XOpaque()), // Pointer to internal data used by the audio system
      .processor:  XPtrType(XOpaque()), // Pointer to internal data processor, useful for audio effects
      .sampleRate: XUnsignedInt(), // Frequency (samples per second)
      .sampleSize: XUnsignedInt(), // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
      .channels:   XUnsignedInt(), // Number of channels (1-mono, 2-stereo, ...)
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<AudioStreamField> _l = struct.layoutOf();

  /// Field descriptor for [buffer].
  static final field_buffer = _l.ptrUnknown<XOpaque>(.buffer);
  /// Field descriptor for [processor].
  static final field_processor = _l.ptrUnknown<XOpaque>(.processor);
  /// Field descriptor for [sampleRate].
  static final field_sampleRate = _l.integer<XUnsignedInt>(.sampleRate);
  /// Field descriptor for [sampleSize].
  static final field_sampleSize = _l.integer<XUnsignedInt>(.sampleSize);
  /// Field descriptor for [channels].
  static final field_channels = _l.integer<XUnsignedInt>(.channels);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Pointer to internal data used by the audio system
  /// 
  /// `rAudioBuffer *buffer;`
  late final XLivePtrSync<XOpaque> _buffer = field_buffer.live(() => op);
  XPtr<XOpaque> get buffer => _buffer.derefPtr(safe: true);

  /// Pointer to internal data processor, useful for audio effects
  /// 
  /// `rAudioProcessor *processor;`
  late final XLivePtrSync<XOpaque> _processor = field_processor.live(() => op);
  XPtr<XOpaque> get processor => _processor.derefPtr(safe: true);

  int _sampleRate;
  /// Frequency (samples per second)
  int get sampleRate => _sampleRate = field_sampleRate.readOr(op, _sampleRate);
  set sampleRate(int value) => _sampleRate = field_sampleRate.writeOr(op, value);

  int _sampleSize;
  /// Bit depth (bits per sample): 8, 16, 32 (24 not supported)
  int get sampleSize => _sampleSize = field_sampleSize.readOr(op, _sampleSize);
  set sampleSize(int value) => _sampleSize = field_sampleSize.writeOr(op, value);

  int _channels;
  /// Number of channels (1-mono, 2-stereo, ...)
  int get channels => _channels = field_channels.readOr(op, _channels);
  set channels(int value) => _channels = field_channels.writeOr(op, value);

  AudioStream({
    super.op,
    this._sampleRate = 0,
    this._sampleSize = 0,
    this._channels = 0,
  });

  factory AudioStream.zero() => .new();

  @override
  AudioStream setDart(AudioStream o)
    => throw UnsupportedError('$runtimeType cannot support `setDart` method.');

  @override
  void structAllocateInto(XPtr p, String key) {
    field_buffer.allocate(p, '${key}_buffer');
    field_processor.allocate(p, '${key}_processor');
  }

  @override
  void structWriteInto(XPtr p) {
    _buffer.syncInto(p);
    _processor.syncInto(p);
    field_sampleRate.write(p, sampleRate);
    field_sampleSize.write(p, sampleSize);
    field_channels.write(p, channels);
  }

  @override
  void structReadFrom(XPtr p) {
    _buffer.syncFrom(p);
    _processor.syncFrom(p);
    sampleRate = field_sampleRate.read(p);
    sampleSize = field_sampleSize.read(p);
    channels = field_channels.read(p);
  }

  @override
  String signature() => '$structName(sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels)';
}