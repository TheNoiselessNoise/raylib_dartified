part of '../../../raylib_dartified.dart';

enum WaveField with XFields {
  frameCount,
  sampleRate,
  sampleSize,
  channels,
  data,
}

/// Wave, audio wave data
final class Wave extends XStruct<Wave> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<Wave> struct = .create(
    factory: Wave.new,
    layout: .aligned<WaveField>({
      .frameCount: XUnsignedInt(), // Total number of frames (considering channels)
      .sampleRate: XUnsignedInt(), // Frequency (samples per second)
      .sampleSize: XUnsignedInt(), // Bit depth (bits per sample): 8, 16, 32 (24 not supported)
      .channels:   XUnsignedInt(), // Number of channels (1-mono, 2-stereo, ...)
      .data:       XPtrType(XVoid()), // Buffer data pointer
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<WaveField> _l = struct.layoutOf();

  /// Field descriptor for [frameCount].
  static final field_frameCount = _l.integer<XUnsignedInt>(.frameCount);
  /// Field descriptor for [sampleRate].
  static final field_sampleRate = _l.integer<XUnsignedInt>(.sampleRate);
  /// Field descriptor for [sampleSize].
  static final field_sampleSize = _l.integer<XUnsignedInt>(.sampleSize);
  /// Field descriptor for [channels].
  static final field_channels = _l.integer<XUnsignedInt>(.channels);
  /// Field descriptor for [data].
  static final field_data = _l.ptrUnknown<XVoid>(.data);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Computes the total number of samples for a wave with the given
  /// [frameCount] and [channels], i.e. `frameCount * channels`.
  ///
  /// Returns 0 if either argument is 0.
  static int BASE_waveLength(int frameCount, int channels) {
    if (frameCount == 0 || channels == 0) return 0;
    return frameCount * channels;
  }

  /// Total number of samples across all channels, derived from
  /// [frameCount] and [channels].
  int get waveLength => BASE_waveLength(frameCount, channels);

  /// Total number of samples the [dataBuffer] buffer can hold, derived from
  /// its byte length and [sampleSize].
  int get bufferLength => dataBuffer.lengthInBytes ~/ (sampleSize ~/ 8);

  // ░██     ░██ ░██████████░██████░██           ░██████   
  // ░██     ░██     ░██      ░██  ░██          ░██   ░██  
  // ░██     ░██     ░██      ░██  ░██         ░██         
  // ░██     ░██     ░██      ░██  ░██          ░████████  
  // ░██     ░██     ░██      ░██  ░██                 ░██ 
  //  ░██   ░██      ░██      ░██  ░██          ░██   ░██  
  //   ░██████       ░██    ░██████░██████████   ░██████   

  static ByteBuffer BASE_bufferCopy(ByteBuffer data, int sampleSize) => switch (sampleSize) {
    8  => data.asUint8List().sublist(0).buffer,
    16 => data.asInt16List().sublist(0).buffer,
    32 => data.asFloat32List().sublist(0).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };

  static int BASE_bufferLength(ByteBuffer data, int sampleSize)
    => data.lengthInBytes ~/ (sampleSize ~/ 8);

  static ByteBuffer BASE_dummyData(int sampleSize, int dataLength) => switch (sampleSize) {
    8  => Uint8List(dataLength).buffer,
    16  => Int16List(dataLength).buffer,
    32  => Float32List(dataLength).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };
  
  static void BASE_dataSetList(XPtr ptr, ByteBuffer src, int sampleSize, int dataLength) {
    final byteCount = dataLength * (sampleSize ~/ 8);
    final srcBytes = src.asUint8List(0, byteCount);
    ptr.cast<XUint8>().writeArray(srcBytes);
  }

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _frameCount;
  /// Total number of frames (considering channels)
  int get frameCount => _frameCount = field_frameCount.readOr(op, _frameCount);
  set frameCount(int value) => _frameCount = field_frameCount.writeOr(op, value);
  
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

  /// Buffer data pointer
  /// 
  /// `void *data;`
  late final XLivePtrSync<XVoid> _data = field_data.live(() => op);
  XPtr<XVoid> get data => _data.derefPtr(safe: true);

  late ByteBuffer _dataBuffer;
  /// Raw audio buffer data
  ByteBuffer get dataBuffer => op == null ? _dataBuffer : switch (sampleSize) {
    8  => data.asCopy<Uint8List>(waveLength).buffer,
    16 => data.asCopy<Int16List>(waveLength).buffer,
    32 => data.asCopy<Float32List>(waveLength).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };

  bool _isNew = true;

  Wave({
    super.op,
    this._frameCount = 0,
    this._sampleRate = 0,
    this._sampleSize = 8, // NOTE: we can't have it as `0` due to `BASE_dummyData`
    this._channels = 0,
    ByteBuffer? data,
  }) {
    _isNew = false;
    _dataBuffer = data ?? BASE_dummyData(sampleSize, waveLength);
  }

  factory Wave.zero() => .new();

  @override
  Wave setDart(Wave o) {
    frameCount = o.frameCount;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    _dataBuffer = BASE_bufferCopy(o.dataBuffer, sampleSize);
    return this;
  }

  @override
  void structAllocateInto(XPtr p, String key) {
    field_data.allocate(p, '${key}_data', count: _dataBuffer.lengthInBytes);
  }

  @override
  void structWriteInto(XPtr p) {
    field_frameCount.write(p, frameCount);
    field_sampleRate.write(p, sampleRate);
    field_sampleSize.write(p, sampleSize);
    field_channels.write(p, channels);
    _data.syncInto(p);

    if (!data.isNull && _isNew) {
      _isNew = false;
      assert(waveLength <= BASE_bufferLength(dataBuffer, sampleSize));
      BASE_dataSetList(data, dataBuffer, sampleSize, waveLength);
    }
  }

  @override
  void structReadFrom(XPtr p) {
    frameCount = field_frameCount.read(p);
    sampleRate = field_sampleRate.read(p);
    sampleSize = field_sampleSize.read(p);
    channels = field_channels.read(p);
    _data.syncFrom(p);
    // NOTE: no need to sync `dataBuffer` here, it's already live
  }

  @override
  String signature() => '$structName(frameCount: $frameCount, sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels, waveLength: $waveLength)';
}