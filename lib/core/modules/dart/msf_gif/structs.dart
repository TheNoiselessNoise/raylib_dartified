part of '../../../raylib_dartified.dart';

// final class MsfGifBuffer extends Struct {
//   external Pointer<MsfGifBuffer> next;

//   @Size()
//   external int size;

//   // `data` deliberately omitted
// }

// extension MsfGifBufferData on Pointer<MsfGifBuffer> {
//   Pointer<Uint8> get dataPtr => cast<Uint8>() + sizeOf<MsfGifBuffer>();

//   Uint8List get dataView => dataPtr.asTypedList(ref.size);
// }

// final class MsfGifResult extends Struct {
//   external Pointer<Void> data;
  
//   @Size()
//   external int dataSize;

//   @Size()
//   external int allocSize; // internal use

//   external Pointer<Void> contextPointer; // internal use
// }

// // internal use
// final class MsfCookedFrame extends Struct {
//   external Pointer<Uint32> pixels;
  
//   @Int()
//   external int depth, count, rbits, gbits, bbits;
// }

// typedef MsfGifFileWriteFuncFunction =
//   Size Function(
//     Pointer<Void> buffer,
//     Size size,
//     Size count,
//     Pointer<Void> stream,
//   );
// typedef MsfGifFileWriteFunc = Pointer<NativeFunction<MsfGifFileWriteFuncFunction>>;

// final class MsfGifState extends Struct {
//   external MsfGifFileWriteFunc fileWriteFunc;
  
//   external Pointer<Void> fileWriteData;
  
//   external MsfCookedFrame previousFrame;
  
//   external MsfCookedFrame currentFrame;
  
//   external Pointer<Uint16> lzwMem;
  
//   external Pointer<MsfGifBuffer> listHead;
  
//   external Pointer<MsfGifBuffer> listTail;
  
//   @Int()
//   external int width, height;
  
//   external Pointer<Void> customAllocatorContext;
  
//   @Int()
//   external int framesSubmitted;
// }