part of '../../../../raylib_dartified.dart';

extension MsfGifResultCPEx on Pointer<MsfGifResultC> {
  MsfGifResultD toD() => ref.toD(this);
}

extension MsfGifResultCEx on MsfGifResultC {
  MsfGifResultC setC(MsfGifResultC o) => this;
  MsfGifResultD toD(Pointer<MsfGifResultC> ptr) => .new(ptr);
}

class MsfGifResultD extends StructDView<MsfGifResultC, MsfGifResultD> {
  Uint8List get data => ref.data.cast<Uint8>().asTypedList(dataSize);

  int get dataSize => ref.dataSize;

  MsfGifResultD(super.originalPointer);
  
  @override
  MsfGifResultC get ref => getOriginalPointer().ref;

  @override
  MsfGifResultD clone() => .new(getOriginalPointer());
}