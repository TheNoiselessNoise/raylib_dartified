// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
// ignore_for_file: camel_case_types

part of '../../../raylib_dartified.dart';

enum float3Field with XFields {
  v,
}

/// Raylib's `float3` struct holding 3 `float` values
final class float3 extends XStruct<float3> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final XStructDef<float3> struct = .createValue(
    factory: float3.new,
    layout: .aligned<float3Field>({
      .v: XArray(XFloat(), 3),
    }),
  );

  /// Raw memory layout of this object.
  static final XLayout<float3Field> _l = struct.layoutOf();

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
  set v(List<double> value) => _v.setOrAllocate(value);

  float3({
    super.op,
    List<double>? v,
  }) {
    _v = field_v.live(() => op, v ?? .filled(field_v.codec.type.count, 0));
  }

  factory float3.zero() => .new();

  factory float3.float3(
    num v0,
    num v1,
    num v2,
  ) => .new(
    v: [
      v0.toDouble(),
      v1.toDouble(),
      v2.toDouble(),
    ],
  );

  @override
  float3 setDart(float3 o) {
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