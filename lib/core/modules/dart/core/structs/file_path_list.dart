part of '../../../../raylib.dart';

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

class FilePathListD extends StructDView<FilePathListD, FilePathListC> {
  FilePathListD(super.originalPointer);

  int? _cachedCount;
  List<String> _cachedPaths = [];

  int get capacity => ref.capacity;
  int get count => ref.count;
  List<String> get paths {
    if (_cachedCount != count) {
      _cachedPaths = .generate(count, (i) => (ref.paths + i).value.toD);
    }
    return _cachedPaths;
  }

  @override
  FilePathListC get ref => getOriginalPointer().ref;

  @override
  String signature() => '$structName(capacity: $capacity, count: $count)';

  @override
  FilePathListD clone() => .new(getOriginalPointer());
}