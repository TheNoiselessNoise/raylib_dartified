part of '../../../raylib_dartified.dart';

enum MsfGifCookedFrameField with XFields {
  pixels,
  depth,
  count,
  rbits,
  gbits,
  bbits,
}

enum MsfGifStateField with XFields {
  fileWriteFunc,
  fileWriteData,
  previousFrame,
  currentFrame,
  lzwMem,
  listHead,
  listTail,
  width,
  height,
  customAllocatorContext,
  framesSubmitted,
}

final class _MsfGifCookedFrame extends XStruct<_MsfGifCookedFrame> {
  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<_MsfGifCookedFrame> struct = .create(
    factory: _MsfGifCookedFrame.new,
    layout: .aligned<MsfGifCookedFrameField>({
      .pixels: XPtrType(XUint32()),
      .depth:  XInt(),
      .count:  XInt(),
      .rbits:  XInt(),
      .gbits:  XInt(),
      .bbits:  XInt(),
    }),
  );

  _MsfGifCookedFrame({super.op});
}

/// MsfGifState
final class MsfGifState extends XStruct<MsfGifState> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<MsfGifState> struct = .create(
    factory: MsfGifState.new,
    layout: .aligned<MsfGifStateField>({
      .fileWriteFunc:          XPtrType(XFunction<MsfGifFileWriteCallbackBase>()),
      .fileWriteData:          XPtrType(XVoid()),
      .previousFrame:          XStructType(_MsfGifCookedFrame.struct),
      .currentFrame:           XStructType(_MsfGifCookedFrame.struct),
      .lzwMem:                 XPtrType(XInt16()),
      .listHead:               XPtrType(XOpaque()),
      .listTail:               XPtrType(XOpaque()),
      .width:                  XInt(),
      .height:                 XInt(),
      .customAllocatorContext: XPtrType(XVoid()),
      .framesSubmitted:        XInt(),
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<MsfGifStateField> _l = struct.layoutOf();

  /// Field descriptor for [width].
  static final field_width = _l.integer<XInt>(.width);
  /// Field descriptor for [height].
  static final field_height = _l.integer<XInt>(.height);
  /// Field descriptor for [framesSubmitted].
  static final field_framesSubmitted = _l.integer<XInt>(.framesSubmitted);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int get width => field_width.readOr(op, 0);
  
  int get height => field_height.readOr(op, 0);
  
  int get framesSubmitted => field_framesSubmitted.readOr(op, 0);

  MsfGifState({ super.op });

  factory MsfGifState.zero() => .new();

  @override
  String signature() => '$structName(width: $width, height: $height, framesSubmitted: $framesSubmitted)';
}