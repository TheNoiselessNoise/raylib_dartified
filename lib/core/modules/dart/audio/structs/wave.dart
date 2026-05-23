part of '../../../../raylib_dartified.dart';

extension WaveCPEx on Pointer<WaveC> {
  Pointer<WaveC> setC(WaveC o) { ref.setC(o); return this; }
  Pointer<WaveC> setD(WaveD o) { ref.setD(o); return this; }
  WaveD toD() => ref.toD(this);
}

class _WaveUtils {
  static ByteBuffer _bufferCopy(ByteBuffer data, int sampleSize) => switch (sampleSize) {
    8  => data.asUint8List().sublist(0).buffer,
    16 => data.asInt16List().sublist(0).buffer,
    32 => data.asFloat32List().sublist(0).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };

  static int _bufferLength(ByteBuffer data, int sampleSize)
    => data.lengthInBytes ~/ (sampleSize ~/ 8);

  static ByteBuffer _dataToBuffer(Pointer<Void> data, int sampleSize, int waveLength) => switch (sampleSize) {
    8  => data.cast<Uint8>().asTypedList(waveLength).sublist(0).buffer,
    16 => data.cast<Int16>().asTypedList(waveLength).sublist(0).buffer,
    32 => data.cast<Float>().asTypedList(waveLength).sublist(0).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };

  static ByteBuffer _dummyData(int sampleSize, int waveLength) => switch (sampleSize) {
    8  => Uint8List(waveLength).buffer,
    16  => Int16List(waveLength).buffer,
    32  => Float32List(waveLength).buffer,
    _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
  };
  
  static ByteBuffer _dataToBufferOrZero(Pointer<Void> data, int sampleSize, int waveLength)
    => data.address != 0
      ? _WaveUtils._dataToBuffer(data, sampleSize, waveLength)
      : _dummyData(sampleSize, waveLength);

  static void _dataSetList(Pointer<Void> dst, ByteBuffer src, int sampleSize, int waveLength) {
    if (dst.address == 0) return;
    final byteCount = waveLength * (sampleSize ~/ 8);
    final srcBytes = src.asUint8List(0, byteCount);
    dst.cast<Uint8>().asTypedList(byteCount).setAll(0, srcBytes);
  }
}

extension WaveCEx on WaveC {
  int get waveLength => WaveBase.BASE_waveLength(frameCount, channels);

  WaveC setC(WaveC o) {
    frameCount = o.frameCount;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    data = o.data;
    return this;
  }

  WaveC setD(WaveD o) {
    frameCount = o.frameCount;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    o.structOnOriginalPointer((p) => data = p.ref.data);
    if (data.address != 0) {
      _WaveUtils._dataSetList(data, o.data, sampleSize, waveLength);
    }
    return this;
  }

  WaveD toD([Pointer<WaveC>? ptr]) => .new(
    originalPointer: ptr,
    frameCount: frameCount,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
    data: _WaveUtils._dataToBufferOrZero(data, sampleSize, waveLength),
  );
}

class WaveD extends StructD<WaveC, WaveD> with WaveBase<WaveD> {
  @override
  int frameCount;
  
  @override
  int sampleRate;
  
  @override
  int sampleSize;
  
  @override
  int channels;
  
  @override
  late ByteBuffer data;

  WaveD({
    super.originalPointer,
    this.frameCount = 0,
    this.sampleRate = 0,
    this.sampleSize = 8,
    this.channels = 0,
    ByteBuffer? data,
  }) {
    this.data = data ?? _WaveUtils._dummyData(sampleSize, waveLength);
  }

  @override
  WaveD setD(WaveD o) {
    frameCount = o.frameCount;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    data = _WaveUtils._bufferCopy(o.data, sampleSize);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<WaveC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<WaveC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<WaveC> p, String key) {
    p.ref.data = switch (sampleSize) {
      8  => temp.Uint8$.Array(data.asUint8List(), key: '${key}_data').cast(),
      16 => temp.Int16$.Array(data.asInt16List(), key: '${key}_data').cast(),
      32 => temp.Float32$.Array(data.asFloat32List(), key: '${key}_data').cast(),
      _  => throw UnsupportedError('Unexpected sampleSize: $sampleSize'),
    };
  }

  @override
  void nativeWriteInto(WaveC p) {
    p.frameCount = frameCount;
    p.sampleRate = sampleRate;
    p.sampleSize = sampleSize;
    p.channels = channels;

    if (p.data.address != 0) {
      assert(waveLength <= _WaveUtils._bufferLength(data, sampleSize));
      _WaveUtils._dataSetList(p.data, data, sampleSize, waveLength);
    }
  }

  @override
  void nativeReadFrom(WaveC p) {
    structOnOriginalPointer((o) => o.ref.data = p.data);
    frameCount = p.frameCount;
    sampleRate = p.sampleRate;
    sampleSize = p.sampleSize;
    channels = p.channels;
    data = _WaveUtils._dataToBufferOrZero(p.data, sampleSize, waveLength);
  }

  @override
  WaveD clone() => .new(
    originalPointer: originalPointer,
    frameCount: frameCount,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
    data: _WaveUtils._bufferCopy(data, sampleSize),
  );
}