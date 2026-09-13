part of '../../../raylib_dartified.dart';

final class MsfGifBufferC extends Struct {
  external Pointer<MsfGifBufferC> next;

  @Size()
  external int size;

  // `data` deliberately omitted
}

extension MsfGifBufferData on Pointer<MsfGifBufferC> {
  Pointer<Uint8> get dataPtr => cast<Uint8>() + sizeOf<MsfGifBufferC>();

  Uint8List get dataView => dataPtr.asTypedList(ref.size);
}

final class MsfGifResultC extends Struct {
  external Pointer<Void> data;
  
  @Size()
  external int dataSize;

  @Size()
  external int allocSize; // internal use

  external Pointer<Void> contextPointer; // internal use
}

// internal use
final class MsfCookedFrameC extends Struct {
  external Pointer<Uint32> pixels;
  
  @Int()
  external int depth, count, rbits, gbits, bbits;
}

typedef MsfGifFileWriteFuncC = Pointer<NativeFunction<MsfGifFileWriteFuncFunctionC>>;
typedef MsfGifFileWriteFuncFunctionC = Size Function(
  Pointer<Void> buffer,
  Size size,
  Size count,
  Pointer<Void> stream,
);

final class MsfGifStateC extends Struct {
  external MsfGifFileWriteFuncC fileWriteFunc;
  
  external Pointer<Void> fileWriteData;
  
  external MsfCookedFrameC previousFrame;
  
  external MsfCookedFrameC currentFrame;
  
  external Pointer<Uint16> lzwMem;
  
  external Pointer<MsfGifBufferC> listHead;
  
  external Pointer<MsfGifBufferC> listTail;
  
  @Int()
  external int width, height;
  
  external Pointer<Void> customAllocatorContext;
  
  @Int()
  external int framesSubmitted;
}