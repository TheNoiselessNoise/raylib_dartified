part of '../../../../raylib_dartified.dart';

extension RlRenderBatchCPEx on Pointer<RlRenderBatchC> {
  Pointer<RlRenderBatchC> setC(RlRenderBatchC o) { ref.setC(o); return this; }
  Pointer<RlRenderBatchC> setD(RlRenderBatchD o) { ref.setD(o); return this; }
  RlRenderBatchD toD() => ref.toD(this);
}

extension RlRenderBatchCEx on RlRenderBatchC {
  RlRenderBatchC setC(RlRenderBatchC o) {
    bufferCount = o.bufferCount;
    currentBuffer = o.currentBuffer;
    vertexBuffer = o.vertexBuffer;
    draws = o.draws;
    drawCounter = o.drawCounter;
    currentDepth = o.currentDepth;
    return this;
  }

  RlRenderBatchC setD(RlRenderBatchD o) {
    bufferCount = o.bufferCount;
    currentBuffer = o.currentBuffer;
    o.structOnOp((p) {
      vertexBuffer = p.ref.vertexBuffer;
      draws = p.ref.draws;
    });
    if (vertexBuffer.address != 0) {
      for (var i = 0; i < o.vertexBuffer.length; i++) {
        vertexBuffer[i].setD(o.vertexBuffer[i]);
      }
    }
    if (draws.address != 0) {
      for (var i = 0; i < o.draws.length; i++) {
        draws[i].setD(o.draws[i]);
      }
    }
    drawCounter = o.drawCounter;
    currentDepth = o.currentDepth;
    return this;
  }

  RlRenderBatchD toD([Pointer<RlRenderBatchC>? ptr]) => .new(
    originalPointer: ptr,
    bufferCount: bufferCount,
    currentBuffer: currentBuffer,
    vertexBuffer: vertexBuffer.address != 0
      ? .generate(bufferCount, (i) => vertexBuffer[i].toD(vertexBuffer + i))
      : [],
    draws: draws.address != 0
      ? .generate(drawCounter, (i) => draws[i].toD(draws + i))
      : [],
    drawCounter: drawCounter,
    currentDepth: currentDepth,
  );
}

class RlRenderBatchD extends StructD<RlRenderBatchC, RlRenderBatchD> with RlRenderBatchBase<
  RlRenderBatchD,
  RlVertexBufferD,
  RlDrawCallD
> {
  int _bufferCount;
  @override get bufferCount {
    structOnOp((p) => _bufferCount = p.ref.bufferCount);
    return _bufferCount;
  }
  @override set bufferCount(int value) {
    _bufferCount = value;
    structOnOp((p) => p.ref.bufferCount = value);
  }
  
  int _currentBuffer;
  @override get currentBuffer {
    structOnOp((p) => _currentBuffer = p.ref.currentBuffer);
    return _currentBuffer;
  }
  @override set currentBuffer(int value) {
    _currentBuffer = value;
    structOnOp((p) => p.ref.currentBuffer = value);
  }
  
  late NativeLiveListPointerStruct<RlVertexBufferC, RlVertexBufferD> _vertexBuffer;
  @override get vertexBuffer {
    structOnOp((p) => _vertexBuffer.ptr = p.ref.vertexBuffer);
    return _vertexBuffer;
  }
  @override set vertexBuffer(List<RlVertexBufferD> value) {
    structOnOp((p) => _vertexBuffer.ptr = p.ref.vertexBuffer);
    _vertexBuffer.inner = value;
  }
  
  late NativeLiveListPointerStruct<RlDrawCallC, RlDrawCallD> _draws;
  @override get draws {
    structOnOp((p) => _draws.ptr = p.ref.draws);
    return _draws;
  }
  @override set draws(List<RlDrawCallD> value) {
    structOnOp((p) => _draws.ptr = p.ref.draws);
    _draws.inner = value;
  }
  
  int _drawCounter;
  @override get drawCounter {
    structOnOp((p) => _drawCounter = p.ref.drawCounter);
    return _drawCounter;
  }
  @override set drawCounter(int value) {
    _drawCounter = value;
    structOnOp((p) => p.ref.drawCounter = value);
  }
  
  double _currentDepth;
  @override get currentDepth {
    structOnOp((p) => _currentDepth = p.ref.currentDepth);
    return _currentDepth;
  }
  @override set currentDepth(double value) {
    _currentDepth = value;
    structOnOp((p) => p.ref.currentDepth = value);
  }

  RlRenderBatchD({
    super.originalPointer,
    int bufferCount = 0,
    int currentBuffer = 0,
    List<RlVertexBufferD>? vertexBuffer,
    List<RlDrawCallD>? draws,
    int drawCounter = 0,
    double currentDepth = 0,
  }) :
    _bufferCount = bufferCount,
    _currentBuffer = currentBuffer,
    _drawCounter = drawCounter,
    _currentDepth = currentDepth
  {
    _vertexBuffer = .new(vertexBuffer ?? [], originalPointer?.ref.vertexBuffer);
    _draws = .new(draws ?? [], originalPointer?.ref.draws);
  }

  factory RlRenderBatchD.zero() => .new();

  @override
  RlRenderBatchD setD(RlRenderBatchD o) {
    bufferCount = o.bufferCount;
    currentBuffer = o.currentBuffer;
    vertexBuffer = o.vertexBuffer.map((e) => e.clone()).toList();
    draws = o.draws.map((e) => e.clone()).toList();
    drawCounter = o.drawCounter;
    currentDepth = o.currentDepth;
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<RlRenderBatchC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<RlRenderBatchC> p, int index) => p[index];

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<RlRenderBatchC> p, String key) {
    p.ref.vertexBuffer = temp.RlVertexBuffer$.Array(vertexBuffer, key: '${key}_vbufs');
    p.ref.draws = temp.RlDrawCall$.Array(draws, key: '${key}_draws');
  }

  @override
  void nativeWriteInto(RlRenderBatchC p) {
    p.bufferCount = bufferCount;
    p.currentBuffer = currentBuffer;
    p.drawCounter = drawCounter;
    p.currentDepth = currentDepth;

    if (p.vertexBuffer.address != 0) {
      for (var i = 0; i < vertexBuffer.length; i++) {
        _vertexBuffer.inner[i].nativeWriteInto((p.vertexBuffer + i).ref);
      }
    }

    if (p.draws.address != 0) {
      for (var i = 0; i < draws.length; i++) {
        _draws.inner[i].nativeWriteInto((p.draws + i).ref);
      }
    }
  }

  @override
  void nativeReadFrom(RlRenderBatchC p) {
    structOnOp((o) {
      o.ref.vertexBuffer = p.vertexBuffer;
      o.ref.draws = p.draws;
    });
    bufferCount = p.bufferCount;
    currentBuffer = p.currentBuffer;
    vertexBuffer = p.vertexBuffer.address != 0
      ? .generate(p.bufferCount, (i) => p.vertexBuffer[i].toD(p.vertexBuffer + i))
      : [];
    draws = p.draws.address != 0
      ? .generate(p.drawCounter, (i) => p.draws[i].toD(p.draws + i))
      : [];
    drawCounter = p.drawCounter;
    currentDepth = p.currentDepth;
  }

  @override
  RlRenderBatchD clone() => .new(
    originalPointer: originalPointer,
    bufferCount: bufferCount,
    currentBuffer: currentBuffer,
    vertexBuffer: vertexBuffer.map((e) => e.clone()).toList(),
    draws: draws.map((e) => e.clone()).toList(),
    drawCounter: drawCounter,
    currentDepth: currentDepth,
  );
}