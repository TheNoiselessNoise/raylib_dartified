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
    o.structOnOriginalPointer((p) {
      vertexBuffer = p.ref.vertexBuffer;
      draws = p.ref.draws;
    });
    if (vertexBuffer.address != 0) {
      for (var i = 0; i < o.vertexBuffers.length; i++) {
        vertexBuffer[i].setD(o.vertexBuffers[i]);
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
    vertexBuffers: vertexBuffer.address != 0
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
  @override
  int bufferCount;
  
  @override
  int currentBuffer;
  
  @override
  List<RlVertexBufferD> vertexBuffers;
  
  @override
  List<RlDrawCallD> draws;
  
  @override
  int drawCounter;
  
  @override
  double currentDepth;

  RlRenderBatchD({
    super.originalPointer,
    this.bufferCount = 0,
    this.currentBuffer = 0,
    List<RlVertexBufferD>? vertexBuffers,
    List<RlDrawCallD>? draws,
    this.drawCounter = 0,
    this.currentDepth = 0,
  }) :
    vertexBuffers = vertexBuffers ?? [],
    draws = draws ?? [];

  factory RlRenderBatchD.zero() => .new();

  @override
  RlRenderBatchD setC(RlRenderBatchC o) {
    structOnOriginalPointer((p) {
      p.ref.vertexBuffer = o.vertexBuffer;
      p.ref.draws = o.draws;
    });
    bufferCount = o.bufferCount;
    currentBuffer = o.currentBuffer;
    vertexBuffers = o.vertexBuffer.address != 0
      ? .generate(o.bufferCount, (i) => o.vertexBuffer[i].toD(o.vertexBuffer + i))
      : [];
    draws = o.draws.address != 0
      ? .generate(o.drawCounter, (i) => o.draws[i].toD(o.draws + i))
      : [];
    drawCounter = o.drawCounter;
    currentDepth = o.currentDepth;
    return this;
  }

  @override
  RlRenderBatchD setD(RlRenderBatchD o) {
    bufferCount = o.bufferCount;
    currentBuffer = o.currentBuffer;
    vertexBuffers = o.vertexBuffers.map((e) => e.clone()).toList();
    draws = o.draws.map((e) => e.clone()).toList();
    drawCounter = o.drawCounter;
    currentDepth = o.currentDepth;
    return this;
  }

  @override
  getReference(Pointer<RlRenderBatchC> p) => p.ref;

  @override
  void structAllocateInto(RaylibTemp temp, Pointer<RlRenderBatchC> p, String key) {
    p.ref.vertexBuffer = temp.RlVertexBuffer$.Array(vertexBuffers, key: '${key}_vbufs');
    p.ref.draws = temp.RlDrawCall$.Array(draws, key: '${key}_draws');
  }

  @override
  void nativeWriteInto(RlRenderBatchC p) {
    p.bufferCount = bufferCount;
    p.currentBuffer = currentBuffer;
    p.drawCounter = drawCounter;
    p.currentDepth = currentDepth;
    for (var i = 0; i < vertexBuffers.length; i++) {
      vertexBuffers[i].nativeWriteInto((p.vertexBuffer + i).ref);
    }
    for (var i = 0; i < draws.length; i++) {
      draws[i].nativeWriteInto((p.draws + i).ref);
    }
  }

  @override
  RlRenderBatchD clone() => .new(
    originalPointer: originalPointer,
    bufferCount: bufferCount,
    currentBuffer: currentBuffer,
    vertexBuffers: vertexBuffers.map((e) => e.clone()).toList(),
    draws: draws.map((e) => e.clone()).toList(),
    drawCounter: drawCounter,
    currentDepth: currentDepth,
  );
}