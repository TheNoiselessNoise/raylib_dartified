part of '../../../raylib_dartified.dart';

enum MsfGifResultField with XFields {
  data,
  dataSize,
  allocSize,
  contextPointer,
}

/// MsfGifResult
final class MsfGifResult extends XStruct<MsfGifResult> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<MsfGifResult> struct = .create(
    factory: MsfGifResult.new,
    layout: .aligned<MsfGifResultField>({
      .data:           XPtrType(XVoid()),
      .dataSize:       XSize(),
      .allocSize:      XSize(),
      .contextPointer: XPtrType(XVoid()),
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<MsfGifResultField> _l = struct.layoutOf();

  /// Field descriptor for [data].
  static final field_data = _l.ptrUnknown<XVoid>(.data);
  /// Field descriptor for [dataSize].
  static final field_dataSize = _l.integer<XSize>(.dataSize);
  /// Field descriptor for [allocSize].
  static final field_allocSize = _l.integer<XSize>(.allocSize);
  /// Field descriptor for [contextPointer].
  static final field_contextPointer = _l.ptrUnknown<XVoid>(.contextPointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  late final XLivePtrSync<XVoid> _data = field_data.live(() => op);
  XPtr<XVoid> get data => _data.derefPtr(safe: true);
  Uint8List get dataView => data.asView(dataSize);

  int get dataSize => field_dataSize.read(getOp());

  int get allocSize => field_allocSize.read(getOp());

  late final XLivePtrSync<XVoid> _contextPointer = field_contextPointer.live(() => op);
  XPtr<XVoid> get contextPointer => _contextPointer.derefPtr(safe: true);

  MsfGifResult({ super.op });

  factory MsfGifResult.zero() => .new();

  @override
  String signature() => '$structName(dataSize: $dataSize, allocSize: $allocSize)';
}