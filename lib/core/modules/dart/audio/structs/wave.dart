part of '../../../../raylib.dart';

extension WaveCLike on WaveC {
  int get dataLength {
    if (frameCount == 0 || channels == 0) return 0;
    return frameCount * channels;
  }
}

extension WaveDLike on WaveD {
  int get dataLength {
    if (frameCount == 0 || channels == 0) return 0;
    return frameCount * channels;
  }
}

extension WaveCPEx on Pointer<WaveC> {
  Pointer<WaveC> setC(WaveC o) {
    ref.setC(o);
    return this;
  }
  
  Pointer<WaveC> setD(WaveD o) {
    ref.setD(o);
    return this;
  }

  WaveD toD() => ref.toD(this);
}

extension WaveCEx on WaveC {
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
    o.structOnOriginalPointer((p) {
      data = p.ref.data;
    });
    if (data.address != 0) {
      for (int i = 0; i < dataLength; i++) {
        data.cast<Short>()[i] = o.data[i];
      }
    }
    return this;
  }

  WaveD toD([Pointer<WaveC>? ptr]) => .new(
    originalPointer: ptr,
    frameCount: frameCount,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
    data: data.address != 0
      ? .generate(dataLength, (i) => data.cast<Short>()[i])
      : [],
  );
}

class WaveD extends StructD<WaveC, WaveD> with WaveBase {
  @override
  int frameCount;
  
  @override
  int sampleRate;
  
  @override
  int sampleSize;
  
  @override
  int channels;
  
  @override
  List<int> data;

  WaveD({
    super.originalPointer,
    required this.frameCount,
    required this.sampleRate,
    required this.sampleSize,
    required this.channels,
    required this.data,
  });

  @override
  WaveD setC(WaveC o) {
    structOnOriginalPointer((p) {
      p.ref.data = o.data;
    });
    frameCount = o.frameCount;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    data = o.data.address != 0 ? .generate(dataLength, (i) => o.data.cast<Short>()[i]) : [];
    return this;
  }

  @override
  WaveD setD(WaveD o) {
    originalPointer ??= o.originalPointer;
    frameCount = o.frameCount;
    sampleRate = o.sampleRate;
    sampleSize = o.sampleSize;
    channels = o.channels;
    data = .from(o.data);
    return this;
  }

  @override
  nativeAllocator(RaylibTemp temp) => temp.Wave$;

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<WaveC> p, String key) {
    p.ref.data = temp.Short$.Array(data, key: '${key}_data').cast();
  }

  @override
  void nativeWriteInto(WaveC p) {
    p.frameCount = frameCount;
    p.sampleRate = sampleRate;
    p.sampleSize = sampleSize;
    p.channels = channels;

    if (p.data.address != 0) {
      assert(dataLength <= data.length);
      for (int i = 0; i < dataLength; i++) {
        p.data.cast<Short>()[i] = data[i];
      }
    }
  }

  @override
  String signature() => '$structName(frameCount: $frameCount, sampleRate: $sampleRate, sampleSize: $sampleSize, channels: $channels, data: $dataLength)';

  @override
  WaveD clone() => .new(
    originalPointer: originalPointer,
    frameCount: frameCount,
    sampleRate: sampleRate,
    sampleSize: sampleSize,
    channels: channels,
    data: .from(data),
  );
}