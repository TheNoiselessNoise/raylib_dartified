part of '../../../../raylib_dartified.dart';

extension FilePathListCPEx on Pointer<FilePathListC> {
  Pointer<FilePathListC> setC(FilePathListC o) => this;
  Pointer<FilePathListC> setD(FilePathListD o) => this;
  FilePathListD toD() => ref.toD(this);
}

extension FilePathListCEx on FilePathListC {
  FilePathListC setC(FilePathListC o) => this;
  FilePathListC setD(FilePathListD o) => this;
  FilePathListD toD(Pointer<FilePathListC> ptr) => .new(ptr);
}

class FilePathListD extends StructDView<FilePathListC, FilePathListD> with FilePathListBase<FilePathListD> {
  FilePathListD(super.originalPointer);

  int? _cachedCount;
  List<String> _cachedPaths = [];

  @override
  int get capacity => ref.capacity;
  
  @override
  int get count => ref.count;
  
  @override
  List<String> get paths {
    if (_cachedCount != count) {
      _cachedCount = count;
      _cachedPaths = .generate(count, (i) => (ref.paths + i).value.toD);
    }
    return _cachedPaths;
  }

  @override
  FilePathListC get ref => getOriginalPointer().ref;

  @override
  FilePathListD clone() => .new(getOriginalPointer());
}