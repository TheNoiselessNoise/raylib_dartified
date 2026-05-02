import 'api_xml_reader.dart';

class ParsedCType {
  final String ffiType;
  final String dartType;
  final int? arrayLength;

  ParsedCType({
    required this.ffiType,
    required this.dartType,
    this.arrayLength,
  });

  bool get isArray => arrayLength != null;

  factory ParsedCType.type(String ffiType, String dartType) => ParsedCType(
    ffiType: ffiType,
    dartType: dartType,
  );

  factory ParsedCType.array(String ffiType, int length) => ParsedCType(
    ffiType: ffiType,
    dartType: '',
    arrayLength: length,
  );

  factory ParsedCType.onlyDart(String dartType) => ParsedCType(
    ffiType: '',
    dartType: dartType,
  );

  String get ffi => isArray ? '@Array.multi([$arrayLength])' : '@$ffiType()';
  String get dart => isArray ? 'Array<$ffiType>' : dartType;
}

class TypeResolver {
  RaylibApiReaderResult api;

  TypeResolver(this.api);

  // <ctype, ffi & dart type>
  ParsedCType? parseBaseType(String type) => <String, ParsedCType>{
    // void
    'void':                   .type('Void',         'void'),

    // bool
    'bool':                   .type('Bool',          'bool'),

    // float / double
    'float':                  .type('Float',         'double'),
    'double':                 .type('Double',        'double'),

    // signed integers
    'char':                   .type('Char',          'int'),
    'short':                  .type('Short',         'int'),
    'short int':              .type('Short',         'int'),
    'int':                    .type('Int',           'int'),
    'long':                   .type('Long',          'int'),
    'long int':               .type('Long',          'int'),
    'long long':              .type('LongLong',      'int'),
    'long long int':          .type('LongLong',      'int'),

    // unsigned integers
    'unsigned char':          .type('UnsignedChar',  'int'),
    'unsigned short':         .type('UnsignedShort', 'int'),
    'unsigned short int':     .type('UnsignedShort', 'int'),
    'unsigned int':           .type('UnsignedInt',   'int'),
    'unsigned long':          .type('UnsignedLong',  'int'),
    'unsigned long int':      .type('UnsignedLong',  'int'),
    'unsigned long long':     .type('UnsignedLongLong', 'int'),
    'unsigned long long int': .type('UnsignedLongLong', 'int'),

    // stdint.h exact-width
    'int8_t':                 .type('Int8',          'int'),
    'int16_t':                .type('Int16',         'int'),
    'int32_t':                .type('Int32',         'int'),
    'int64_t':                .type('Int64',         'int'),
    'uint8_t':                .type('Uint8',         'int'),
    'uint16_t':               .type('Uint16',        'int'),
    'uint32_t':               .type('Uint32',        'int'),
    'uint64_t':               .type('Uint64',        'int'),

    // stddef.h / sys types
    'size_t':                 .type('Size',          'int'),
    'ssize_t':                .type('IntPtr',        'int'),
    'intptr_t':               .type('IntPtr',        'int'),
    'uintptr_t':              .type('UintPtr',       'int'),
    'ptrdiff_t':              .type('IntPtr',        'int'),
  }[type];

  String wrapPointer(String innerType, int ptrCount) => switch (ptrCount) {
    0 => innerType,
    1 => 'Pointer<$innerType>',
    2 => 'Pointer<Pointer<$innerType>>',
    _ => throw UnsupportedError('Unsupported pointer depth: $ptrCount'),
  };

  ParsedCType? parseType(String type) {
    // base type
    final baseType = parseBaseType(type);
    if (baseType != null) return baseType;

    final ptrCount = '*'.allMatches(type).length;
    final strippedType = type.replaceAll('*', '').trim();

    // struct (or pointer to struct)
    final struct = api.getStruct(type);
    if (struct != null) {
      return .onlyDart(wrapPointer(struct.c, ptrCount));
    }

    final enum_ = api.getEnum(type);
    if (enum_ != null) {
      return .onlyDart(enum_.name);
    }

    // base type pointer
    if (ptrCount > 0) {
      final base = parseBaseType(strippedType);
      if (base == null) throw UnsupportedError('BASEPTR $type: unknown base type');
      return .onlyDart(wrapPointer(base.ffiType, ptrCount));
    }

    // arrays
    final arrMatch = RegExp(r'^(.+)\[(\d+)\]$').firstMatch(type.trim());
    if (arrMatch != null) {
      final innerType = arrMatch.group(1)!.trim();
      final length = int.parse(arrMatch.group(2)!);
      final inner = parseType(innerType);
      if (inner == null) throw UnsupportedError('ARR $type: unknown inner type');
      return .array(inner.ffiType, length);
    }

    return null;
  }
}