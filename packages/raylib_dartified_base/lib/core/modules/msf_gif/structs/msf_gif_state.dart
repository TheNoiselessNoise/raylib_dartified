part of '../../../raylib_dartified_base.dart';

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

class _MsfGifCookedFrame extends XStruct<_MsfGifCookedFrame> {
  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<_MsfGifCookedFrame> struct = .create(
    factory: _MsfGifCookedFrame.new,
    layout: .aligned<MsfGifCookedFrameField>({
      .pixels: XRawPtr(XUint32()),
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
class MsfGifState extends XStruct<MsfGifState> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<MsfGifState> struct = .create(
    factory: MsfGifState.new,
    layout: .aligned<MsfGifStateField>({
      .fileWriteFunc:          XRawPtr(XFunction<MsfGifFileWriteCallbackBase>()),
      .fileWriteData:          XRawPtr(XVoid()),
      .previousFrame:          XRawStruct(_MsfGifCookedFrame.struct),
      .currentFrame:           XRawStruct(_MsfGifCookedFrame.struct),
      .lzwMem:                 XRawPtr(XInt16()),
      .listHead:               XRawPtr(XOpaque()),
      .listTail:               XRawPtr(XOpaque()),
      .width:                  XInt(),
      .height:                 XInt(),
      .customAllocatorContext: XRawPtr(XVoid()),
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