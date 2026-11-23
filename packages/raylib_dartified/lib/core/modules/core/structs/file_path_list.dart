part of '../../../raylib_dartified.dart';

enum FilePathListField with XFields {
  count,
  paths,
}

/// File path list
final class FilePathList extends XStruct<FilePathList> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<FilePathList> struct = .create(
    factory: FilePathList.new,
    layout: .aligned<FilePathListField>({
      .count: XUnsignedInt(), // Filepaths entries count
      .paths: XPtrType(XPtrType(XChar())), // Filepaths entries
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<FilePathListField> _l = struct.layoutOf();

  /// Field descriptor for [count].
  static final field_count = _l.integer<XUnsignedInt>(.count);
  /// Field descriptor for [paths].
  static final field_paths = _l.ptrAny<XPtrType<XChar>>(.paths);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Filepaths entries count
  int get count => field_count.read(getOp());

  /// Filepaths entries
  List<String> get paths => getOp()
    .readPtr<XPtrType<XChar>>(_l.offset(.paths))
    .readStringArray(count);
  
  FilePathList({ super.op });

  factory FilePathList.zero() => .new();

  @override
  String signature() => '$structName(count: $count)';
}