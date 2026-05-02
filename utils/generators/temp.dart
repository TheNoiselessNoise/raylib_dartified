import 'dart:io';
import 'base.dart';
import 'api_xml_reader.dart';

enum TempGenNumType {
  none(''),
  int('int'),
  double('double')
  ;

  const TempGenNumType(this.dartType);
  final String dartType;
}

abstract class TempGenType extends Writable {
  final String type;
  final String value;
  final String? abbr;
  final bool generatePointerVariant;

  TempGenType({
    required this.type,
    required this.value,
    this.abbr,
    this.generatePointerVariant = true,
  });

  factory TempGenType.lit({
    required String type,
    String? abbr,
    required String value,
    TempGenNumType numType = .none,
    bool supportsTypedList = false,
    String? underlyingType,
  }) => TempGenLitType(
    type: type,
    abbr: abbr,
    value: value,
    numType: numType,
    supportsTypedList: supportsTypedList,
    underlyingType: underlyingType,
  );

  factory TempGenType.litTypedList({
    required String type,
    String? abbr,
    required String value,
    TempGenNumType numType = .none,
    String? underlyingType,
  }) => .lit(
    type: type,
    abbr: abbr,
    value: value,
    numType: numType,
    supportsTypedList: true,
    underlyingType: underlyingType,
  );

  factory TempGenType.litFloat(String type, {
    String? abbr,
    bool supportsTypedList = false,
    String? underlyingType,
  }) => TempGenLitType(
    type: type,
    abbr: abbr,
    value: 'num',
    numType: .double,
    supportsTypedList: supportsTypedList,
    underlyingType: underlyingType,
  );

  factory TempGenType.litFloatTypedList(String type, {
    String? abbr,
    String? underlyingType,
  }) => .litFloat(type,
    abbr: abbr,
    supportsTypedList: true,
    underlyingType: underlyingType,
  );

  factory TempGenType.litInt(String type, {
    String? abbr,
    bool supportsTypedList = false,
    String? underlyingType,
  }) => TempGenLitType(
    type: type,
    abbr: abbr,
    value: 'num',
    numType: .int,
    supportsTypedList: supportsTypedList,
    underlyingType: underlyingType,
  );

  factory TempGenType.litIntTypedList(String type, {
    String? abbr,
    String? underlyingType,
  }) => .litInt(type,
    abbr: abbr,
    supportsTypedList: true,
    underlyingType: underlyingType,
  );

  factory TempGenType.struct({
    required String type,
    String? abbr,
    required String value,
    bool generatePointerVariant = true,
  }) => TempGenStructLitType(
    type: type,
    abbr: abbr,
    value: value,
    generatePointerVariant: generatePointerVariant,
  );

  factory TempGenType.ptrLit({
    required String type,
    String? abbr,
    required String ptrRedir,
    required String value,
    TempGenNumType numType = .none,
    String? underlyingType,
  }) => TempGenLitPtrType(
    type: type,
    abbr: abbr,
    ptrRedir: ptrRedir,
    value: value,
    numType: numType,
    underlyingType: underlyingType,
  );

  factory TempGenType.ptrStruct({
    required String type,
    String? abbr,
    required String ptrRedir,
    required String value,
  }) => TempGenStructPtrType(
    type: type,
    abbr: abbr,
    ptrRedir: ptrRedir,
    value: value,
  );

  factory TempGenType.raylibStruct(String type, {
    bool generatePointerVariant = true,
  }) {
    final struct = RaylibApiStruct.opaque(type);
    return TempGenStructLitType(
      type: struct.c,
      abbr: type,
      value: struct.d,
      generatePointerVariant: generatePointerVariant,
    );
  }

  bool get isPointer => false;
  bool get isLit => false;
  bool get isStruct => false;
}

// --- Literal types ---

abstract class TempGenLiteralType extends TempGenType {
  final TempGenNumType numType;
  final String? underlyingType;

  TempGenLiteralType({
    required super.type,
    required super.value,
    this.numType = .none,
    super.abbr,
    super.generatePointerVariant,
    this.underlyingType,
  });

  TempGenLitPtrType get asPtrLit => .new(
    type: type,
    value: value,
    numType: numType,
    abbr: abbr ?? type,
    ptrRedir: abbr ?? type
  );

  @override
  bool get isLit => true;
}

final class TempGenLitType extends TempGenLiteralType {
  final bool supportsTypedList;

  TempGenLitType({
    required super.type,
    required super.value,
    super.abbr,
    super.generatePointerVariant,
    super.numType = .none,
    super.underlyingType,
    this.supportsTypedList = false,
  });

  String toNumType(String what) => switch (numType) {
    .none => what,
    .int => '$what.toInt()',
    .double => '$what.toDouble()',
  };
}

final class TempGenLitPtrType extends TempGenLiteralType {
  final String ptrRedir;

  TempGenLitPtrType({
    required super.type,
    required super.value,
    super.numType = .none,
    required this.ptrRedir,
    super.abbr,
    super.generatePointerVariant,
    super.underlyingType,
  });

  @override
  bool get isPointer => true;
}

// --- Struct types ---

abstract class TempGenStructType extends TempGenType {
  TempGenStructType({
    required super.type,
    required super.value,
    super.abbr,
    super.generatePointerVariant,
  });

  @override
  bool get isStruct => true;
}

final class TempGenStructLitType extends TempGenStructType {
  TempGenStructLitType({
    required super.type,
    required super.value,
    super.abbr,
    super.generatePointerVariant,
  });

  TempGenStructPtrType get asPtrStruct => .new(
    type: type,
    value: value,
    abbr: abbr ?? type,
    ptrRedir: abbr ?? type
  );
}

final class TempGenStructPtrType extends TempGenStructType {
  final String ptrRedir;

  TempGenStructPtrType({
    required super.type,
    required super.value,
    required this.ptrRedir,
    super.abbr,
    super.generatePointerVariant,
  });

  @override
  bool get isPointer => true;
}

class TempGenTypeWriter extends Writable {
  String allocatorInterface(TempGenType gen) => switch(gen) {
    TempGenLitType(supportsTypedList: true) => switch(gen.numType) {
      .int => 'RTempLitTypedIntListAlloc',
      .double => 'RTempLitTypedFloatListAlloc',
      .none => 'UNREACHABLE',
    },
    TempGenLitType() => 'RTempLitAlloc',
    TempGenLitPtrType() => 'RTempLitPtrAlloc',
    TempGenStructLitType() => 'RTempStructAlloc',
    TempGenStructPtrType() => 'RTempStructPtrAlloc',
    _ => 'UNREACHABLE',
  };

  String propName(TempGenType gen) {
    final realName = gen.abbr ?? gen.type;
    return gen.isPointer ? 'Ptr\$$realName\$' : '$realName\$';
  }

  String rdrPropName(TempGenType gen) => switch (gen) {
    TempGenLitPtrType() => '${gen.ptrRedir}\$',
    TempGenStructPtrType() => '${gen.ptrRedir}\$',
    _ => 'UNREACHABLE',
  };

  String allocatorProperty(TempGenType gen) => writeIsolated(() {
    if (gen is TempGenStructType) {
      pad('late ${allocatorInterface(gen)}<${gen.type}, ${gen.value}> ${propName(gen)};');
    } else {
      pad('late ${allocatorInterface(gen)}<${gen.value}, ${gen.type}> ${propName(gen)};');        
    }
  });

  String allocatorInitialization(TempGenType gen) => writeIsolated(() {
    String prop = propName(gen);
    String rdrProp = rdrPropName(gen);
    String type = gen.type;
    String ptr = 'Pointer<$type>';

    pad2ln('$prop = .new(this, r\'$prop\',');

    if (gen is TempGenStructType) {

      if (gen is TempGenStructPtrType) {
        pad3ln('allocatorFunc: ([count = 1]) => calloc<$ptr>(count),');
        pad3ln('printerFunc: (ptr) => \'We can\\\'t print Pointer<Pointer<$type>> at this level\',');
        pad3ln('valueFunc: $rdrProp.Value,');
        pad3ln('rawArrayFunc: $rdrProp.RawArray,');
        pad3ln('indexSetterFunc: (ptr, i, value) => ptr[i] = value,');
      } else {
        pad3ln('allocatorFunc: ([count = 1]) => calloc<$type>(count),');
        pad3ln('castFunc: (ptr) => ptr.cast<$type>(),');
        pad3ln('printerFunc: (ptr) => ptr.toD().signature(),');
        pad3ln('sizeOfFunc: () => sizeOf<$type>(),');
        pad3ln('indexerFunc: (ptr, i) => ptr[i],');
        pad3ln('writeIntoIndexedFunc: (ptr, i, v) => v.writeInto((ptr + i).ref),');
        pad3ln('writeIntoFunc: (ptr, v) => v.writeInto(ptr.ref),');
        pad3ln('setCFunc: (ptr, i, v) => ptr[i].setC(v),');
        pad3ln('indexSetterFunc: (ptr, i, v) => ptr[i] = v,');
      }

    } else if (gen is TempGenLiteralType) {

      if (gen is TempGenLitPtrType) {
        pad3ln('allocatorFunc: ([count = 1]) => calloc<$ptr>(count),');
        pad3ln('printerFunc: (ptr) => \'We can\\\'t print Pointer<Pointer<$type>> at this level\',');
        pad3ln('rawArrayFunc: $rdrProp.RawArray,');
      } else if (gen is TempGenLitType) {
        pad3ln('allocatorFunc: ([count = 1]) => calloc<$type>(count),');
        pad3ln('castFunc: (ptr) => ptr.cast<$type>(),');
        pad3ln('indexSetterFunc: (ptr, i, value) => ptr[i] = ${gen.toNumType('value')},');
        pad3ln('literalSetterFunc: (ptr, value) => ptr.value = ${gen.toNumType('value')},');
        pad3ln('sizeOfFunc: () => sizeOf<$type>(),');
        pad3ln('printerFunc: (ptr) => ptr.value.toString(),');

        if (gen.supportsTypedList) {
          if (gen.underlyingType != null) {
            pad3ln('asTypedList: (ptr, length) => ptr.cast<${gen.underlyingType}>().asTypedList(length),');
          } else {
            pad3ln('asTypedList: (ptr, length) => ptr.asTypedList(length),');
          }

          pad3ln('asDartList: (ptr, length) => $prop.asTypedList(ptr, length).toList().cast(),');
        }
      }
    }

    pad2(');');
  });

  String allocatorMapEntry(TempGenType gen) => writeIsolated(() {
    pad3('${propName(gen)}.name: ${propName(gen)},');
  });
}

class TempGen extends RaylibGenerator {
  final TempGenTypeWriter typeWriter = TempGenTypeWriter();
  final String templatePath;
  List<TempGenType> literalTypes;
  List<TempGenType> structTypes;
  bool ignoreApi;
  late String template;

  TempGen(super.api, {
    required this.templatePath,
    required this.literalTypes,
    required this.structTypes,
    this.ignoreApi = false,
  }) {
    if (!File(templatePath).existsSync()) {
      throw StateError('Invalid template file: $templatePath');
    }

    template = File(templatePath).readAsStringSync();
  }

  List<TempGenType> _prepareTypes() {
    final finalTypes = <TempGenType>[];

    for (final s in literalTypes) {
      finalTypes.add(s);
      if (s case TempGenLiteralType t)
        if (t.generatePointerVariant) finalTypes.add(t.asPtrLit);
    }

    if (!ignoreApi) {
      final apiTypes = <TempGenType>[];
      for (final struct in api.structs) {
        apiTypes.add(.struct(
          type: struct.c,
          value: struct.d,
          abbr: struct.name,
        ));
      }

      structTypes = [
        ...structTypes,
        ...apiTypes,
      ];
    }

    for (final s in structTypes) {
      finalTypes.add(s);
      if (s case TempGenStructLitType t)
        if (t.generatePointerVariant) finalTypes.add(t.asPtrStruct);
    }

    return finalTypes;
  }

  void run(File output) => output.writeAsStringSync(writeIsolated(() {
    write(template);

    final finalTypes = _prepareTypes();

    String allocatorsProperties = finalTypes
      .map(typeWriter.allocatorProperty)
      .join('\n');

    writeReplacement(replaceID('ALLOCATORS_PROPERTIES'), allocatorsProperties);

    String allocatorsInitialization = finalTypes
      .map(typeWriter.allocatorInitialization)
      .join('\n\n');
    
    writeReplacement(replaceID('ALLOCATORS_INITIALIZATION'), allocatorsInitialization);

    String allocatorsMapEntries = finalTypes
      .map(typeWriter.allocatorMapEntry)
      .join('\n');
    
    writeReplacement(replaceID('ALLOCATORS_MAP_ENTRIES'), allocatorsMapEntries);

    writeUpdate((newTemplate) {
      final splitId = replaceID('SPLIT');
      final splitIndex = newTemplate.indexOf(splitId);
      return newTemplate.substring(splitIndex + splitId.length);
    });
  }));
}