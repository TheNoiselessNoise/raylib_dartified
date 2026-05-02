// ignore_for_file: camel_case_types, camel_case_extensions

part of '../../../../raylib.dart';

extension RlRenderBatchCPEx on Pointer<RlRenderBatchC> {
  Pointer<RlRenderBatchC> setC(RlRenderBatchC o) {
    ref.setC(o);
    return this;
  }

  Pointer<RlRenderBatchC> setD(RlRenderBatchD o) {
    ref.setD(o);
    return this;
  }

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
    o.onOriginalPointer((p) {
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

class RlRenderBatchD extends StructD<RlRenderBatchD, RlRenderBatchC> {
  int bufferCount;
  int currentBuffer;
  List<RlVertexBufferD> vertexBuffers;
  List<RlDrawCallD> draws;
  int drawCounter;
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
    onOriginalPointer((p) {
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
    originalPointer ??= o.originalPointer;
    bufferCount = o.bufferCount;
    currentBuffer = o.currentBuffer;
    vertexBuffers = o.vertexBuffers.map((e) => e.clone()).toList();
    draws = o.draws.map((e) => e.clone()).toList();
    drawCounter = o.drawCounter;
    currentDepth = o.currentDepth;
    return this;
  }

  @override
  Pointer<RlRenderBatchC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => temp.RlRenderBatch$.At(key, count);

  @override
  void syncInto(RaylibTemp temp, Pointer<RlRenderBatchC> p, String key)
    => writeInto(p.ref);

  @override
  void allocateInto(RaylibTemp temp, Pointer<RlRenderBatchC> p, String key) {
    p.ref.bufferCount = bufferCount;
    p.ref.currentBuffer = currentBuffer;
    p.ref.drawCounter = drawCounter;
    p.ref.currentDepth = currentDepth;

    p.ref.vertexBuffer = temp.RlVertexBuffer$.Array(vertexBuffers, key: '${key}_vbufs');
    p.ref.draws = temp.RlDrawCall$.Array(draws, key: '${key}_draws');
  }

  @override
  void writeInto(RlRenderBatchC p) {
    p.bufferCount = bufferCount;
    p.currentBuffer = currentBuffer;
    p.drawCounter = drawCounter;
    p.currentDepth = currentDepth;
    for (var i = 0; i < vertexBuffers.length; i++) {
      vertexBuffers[i].writeInto((p.vertexBuffer + i).ref);
    }
    for (var i = 0; i < draws.length; i++) {
      draws[i].writeInto((p.draws + i).ref);
    }
  }

  @override
  String signature() => '$structName(bufferCount: $bufferCount, currentBuffer: $currentBuffer, drawCounter: $drawCounter, currentDepth: $currentDepth)';

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