// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
// ignore_for_file: camel_case_types

part of '../../../raylib_dartified_base.dart';

enum float16Field with XFields {
  v,
}

/// Raylib's `float16` struct holding 16 `float` values
class float16 extends XStruct<float16> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructType<float16> struct = .createValue(
    factory: float16.new,
    layout: .aligned<float16Field>({
      .v: XArray(XFloat(), 16),
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<float16Field> _l = struct.layoutOf();

  /// Field descriptor for [v].
  static final field_v = _l.scalarArray<double, XFloat>(.v);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  late final XLiveList<double, XFloat> _v;
  XLiveList<double, XFloat> get v => _v;
  set v(List<double> value) => _v.inner = value;

  float16({
    super.op,
    List<double>? v,
  }) {
    _v = field_v.live(() => op, v ?? .filled(field_v.codec.type.count, 0));
  }

  factory float16.zero() => .new();

  factory float16.float16(
    num v0, num v1, num v2, num v3,
    num v4, num v5, num v6, num v7,
    num v8, num v9, num v10, num v11,
    num v12, num v13, num v14, num v15
  ) => .new(
    v: [
      v0, v1, v2, v3,
      v4, v5, v6, v7,
      v8, v9, v10, v11,
      v12, v13, v14, v15
    ].map((x) => x.toDouble()).toList(),
  );

  @override
  float16 setDart(float16 o) {
    v = .from(o.v);
    return this;
  }

  @override
  void structWriteInto(XPtr p) {
    v.writeInto(p);
  }

  @override
  void structReadFrom(XPtr p) {
    v.readFrom(p);
  }

  List<double> toArray() => v.materialize();

  @override
  String signature() => '$structName(${v.materialize().join(', ')})';
}