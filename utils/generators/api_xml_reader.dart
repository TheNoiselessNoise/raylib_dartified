import 'dart:io';
import 'package:xml/xml.dart';

extension on XmlElement {
  String getAttributeSafe(String name, {String? namespace}) {
    return getAttribute(name, namespace: namespace) ?? '<${name.toUpperCase()}>';
  }
}

sealed class RaylibApiReaderException implements Exception {
  final String message;

  const RaylibApiReaderException(this.message);

  @override
  String toString() => '$runtimeType: $message';
}

final class InvalidFilePathException extends RaylibApiReaderException {
  const InvalidFilePathException(super.message);
}

final class InvalidFileException extends RaylibApiReaderException {
  const InvalidFileException(super.message);
}

abstract final class Copyable<T extends Copyable<T>> {
  T copy();
}

final class RaylibApiDefine extends Copyable<RaylibApiDefine> {
  final String name;
  final String type;
  final String value;
  final String desc;

  RaylibApiDefine({
    required this.name,
    required this.type,
    required this.value,
    required this.desc,
  });

  @override
  RaylibApiDefine copy() => RaylibApiDefine(
    name: name,
    type: type,
    value: value,
    desc: desc,
  );
}

final class RaylibApiStructField extends Copyable<RaylibApiStructField> {
  final String name;
  final String type;
  final String desc;

  RaylibApiStructField({
    required this.name,
    required this.type,
    required this.desc,
  });

  @override
  RaylibApiStructField copy() => RaylibApiStructField(
    name: name,
    type: type,
    desc: desc,
  );
}

final class RaylibApiStruct extends Copyable<RaylibApiStruct> {
  final String name;
  final String desc;
  final List<RaylibApiStructField> fields;
  final bool isOpaque;
  final bool isCustom;

  RaylibApiStruct({
    required this.name,
    required this.desc,
    required this.fields,
    this.isOpaque = false,
    this.isCustom = false,
  });

  factory RaylibApiStruct.opaque(String name, [String? desc]) => RaylibApiStruct(
    name: name,
    desc: desc ?? '',
    fields: [],
    isOpaque: true,
  );

  @override
  RaylibApiStruct copy() => RaylibApiStruct(
    name: name,
    desc: desc,
    fields: fields.map((f) => f.copy()).toList(),
    isOpaque: isOpaque,
    isCustom: isCustom,
  );

  String get c => isCustom ? name : '${name}C';
  String get d => '${name}D';
  String get tempVar => '$c\$';
  String get ptrTempVar => 'Ptr\$$tempVar';
  String get tempKey => '$c\\\$';
  String get ptrTempKey => 'Ptr\\\$$tempKey';
  String get refMethod => 'rl.Temp.$tempVar.Ref';
  String get refListPtrMethod => 'rl.Temp.$ptrTempVar.Array';
  String get refListMethod => 'rl.Temp.$tempVar.Array';
  String get refCaptureMethod => 'rl.Temp.$tempVar.RefCapture';
  String get refUpdateMethod => 'rl.Temp.$tempVar.RefUpdate1';
  String get ptr => 'Pointer<$c>';
  String get ptrPtr => 'Pointer<Pointer<$c>>';
}

final class RaylibApiAlias extends Copyable<RaylibApiAlias> {
  final String type;
  final String name;
  final String desc;

  RaylibApiAlias({
    required this.type,
    required this.name,
    required this.desc,
  });

  @override
  RaylibApiAlias copy() => RaylibApiAlias(
    type: type,
    name: name,
    desc: desc,
  );
}

final class RaylibApiEnumValue extends Copyable<RaylibApiEnumValue> {
  final String name;
  final String integer;
  final String desc;

  RaylibApiEnumValue({
    required this.name,
    required this.integer,
    required this.desc,
  });

  @override
  RaylibApiEnumValue copy() => RaylibApiEnumValue(
    name: name,
    integer: integer,
    desc: desc,
  );
}

final class RaylibApiEnum extends Copyable<RaylibApiEnum> {
  final String name;
  final String desc;
  final List<RaylibApiEnumValue> values;

  RaylibApiEnum({
    required this.name,
    required this.desc,
    required this.values,
  });

  @override
  RaylibApiEnum copy() => RaylibApiEnum(
    name: name,
    desc: desc,
    values: values.map((v) => v.copy()).toList(),
  );
}

final class RaylibApiFunctionParam extends Copyable<RaylibApiFunctionParam> {
  final String type;
  final String name;
  final String desc;

  RaylibApiFunctionParam({
    required this.type,
    required this.name,
    required this.desc,
  });

  @override
  RaylibApiFunctionParam copy() => RaylibApiFunctionParam(
    type: type,
    name: name,
    desc: desc,
  );
}

final class RaylibApiFunction extends Copyable<RaylibApiFunction> {
  final String name;
  final String retType;
  final String desc;
  final List<RaylibApiFunctionParam> params;

  RaylibApiFunction({
    required this.name,
    required this.retType,
    required this.desc,
    required this.params,
  });

  @override
  RaylibApiFunction copy() => RaylibApiFunction(
    name: name,
    retType: retType,
    desc: desc,
    params: params.map((p) => p.copy()).toList(),
  );
}

final class RaylibApiCallback extends Copyable<RaylibApiCallback> {
  final String name;
  final String retType;
  final String desc;
  final List<RaylibApiFunctionParam> params;

  RaylibApiCallback({
    required this.name,
    required this.retType,
    required this.desc,
    required this.params,
  });

  @override
  RaylibApiCallback copy() => RaylibApiCallback(
    name: name,
    retType: retType,
    desc: desc,
    params: params.map((p) => p.copy()).toList(),
  );
}

final class RaylibApiReaderResult {
  final List<RaylibApiDefine> defines;
  final List<RaylibApiStruct> structs;
  final List<RaylibApiAlias> aliases;
  final List<RaylibApiEnum> enums;
  final List<RaylibApiFunction> functions;
  final List<RaylibApiCallback> callbacks;

  final Map<String, RaylibApiStruct> structMap = {};

  RaylibApiReaderResult({
    List<RaylibApiDefine>? defines,
    List<RaylibApiStruct>? structs,
    List<RaylibApiAlias>? aliases,
    List<RaylibApiEnum>? enums,
    List<RaylibApiFunction>? functions,
    List<RaylibApiCallback>? callbacks,
  }) :
    defines = defines ?? [],
    structs = structs ?? [],
    aliases = aliases ?? [],
    enums = enums ?? [],
    functions = functions ?? [],
    callbacks = callbacks ?? []
  { update(); }

  RaylibApiDefine? getDefine(String name)
     => defines.where((x) => x.name == name).firstOrNull;

  RaylibApiStruct? getStruct(String name) => structMap[name];

  RaylibApiAlias? getAlias(String name)
     => aliases.where((x) => x.name == name).firstOrNull;

  RaylibApiEnum? getEnum(String name)
     => enums.where((x) => x.name == name).firstOrNull;

  RaylibApiFunction? getFunction(String name)
     => functions.where((x) => x.name == name).firstOrNull;

  RaylibApiCallback? getCallback(String name)
     => callbacks.where((x) => x.name == name).firstOrNull;

  void update() {
    structMap.clear();

    // register structs
    for (final struct in structs) {
      structMap[struct.name] = struct;
    }

    // register aliases
    for (final alias in aliases) {
      if (!structMap.containsKey(alias.name)) {
        throw Exception('No struct ${alias.name} exist for alias ${alias.type}');
      }

      structMap[alias.type] = structMap[alias.name]!.copy();
    }
  }

  RaylibApiReaderResult copy() => .new(
    defines: .from(defines),
    structs: .from(structs),
    aliases: .from(aliases),
    enums: .from(enums),
    functions: .from(functions),
  );

  RaylibApiReaderResult merge(RaylibApiReaderResult o) => .new(
    defines: [...List.from(o.defines), ...List.from(defines)],
    structs: [...List.from(o.structs), ...List.from(structs)],
    aliases: [...List.from(o.aliases), ...List.from(aliases)],
    enums: [...List.from(o.enums), ...List.from(enums)],
    functions: [...List.from(o.functions), ...List.from(functions)],
  );
}

final class RaylibApiReader {
  final String path;
  late String _content;

  final RaylibApiReaderResult _result = .new(
    structs: [
      .opaque('rAudioBuffer', 'Audio buffer'),
      .opaque('rAudioProcessor', 'Audio processor'),
      .opaque('RlRenderBatch', 'RlRenderBatch'),
      .opaque('RlDrawCall', 'RlDrawCall'),
      .opaque('RlVertexBuffer', 'RlVertexBuffer'),
      .opaque('Light', 'Built-in Light'),
    ],
  );

  RaylibApiReader(this.path) {
    final file = File(path);

    if (!file.existsSync()) throw InvalidFilePathException(path);
    _content = file.readAsStringSync();
    _read();
  }

  RaylibApiReaderResult get result => _result;

  void _processChildren(XmlElement parent, void Function(String tag, XmlElement child) callback) {
    for (final child in parent.children) {
      if (child is! XmlElement) continue; // must be an element
      if (child.toString().trim().isEmpty) continue; // there can be empty elements
      callback(child.name.toString(), child);
    }
  }

  void _processDefines(XmlElement node) => _processChildren(node, (defineTag, define) {
    if (defineTag != 'Define') throw StateError('Invalid Define: $defineTag (should be: Define)');
    _result.defines.add(.new(
      name: define.getAttributeSafe('name'),
      type: define.getAttributeSafe('type'),
      value: define.getAttributeSafe('value'),
      desc: define.getAttributeSafe('desc'),
    ));
  });

  void _processStructs(XmlElement node) => _processChildren(node, (structTag, struct) {
    if (structTag != 'Struct') throw StateError('Invalid Struct: $structTag (should be: Struct)');
    
    final fields = <RaylibApiStructField>[];
    _processChildren(struct, (fieldTag, field) {
      if (fieldTag != 'Field') throw StateError('Invalid Struct Field: $fieldTag (should be: Field)');
      fields.add(.new(
        name: field.getAttributeSafe('name'),
        type: field.getAttributeSafe('type'),
        desc: field.getAttributeSafe('desc'),
      ));
    });

    _result.structs.add(.new(
      name: struct.getAttributeSafe('name'),
      desc: struct.getAttributeSafe('desc'),
      fields: fields,
    ));
  });

  void _processAliases(XmlElement node) => _processChildren(node, (aliasTag, alias) {
    if (aliasTag != 'Alias') throw StateError('Invalid Alias: $aliasTag (should be: Alias)');
    _result.aliases.add(.new(
      type: alias.getAttributeSafe('type'),
      name: alias.getAttributeSafe('name'),
      desc: alias.getAttributeSafe('desc'),
    ));
  });

  void _processEnums(XmlElement node) => _processChildren(node, (enumTag, enum_) {
    if (enumTag != 'Enum') throw StateError('Invalid Enum: $enumTag (should be: Enum)');
    
    final values = <RaylibApiEnumValue>[];
    _processChildren(enum_, (valueTag, value) {
      if (valueTag != 'Value') throw StateError('Invalid Enum Value: $valueTag (should be: Value)');
      values.add(.new(
        name: value.getAttributeSafe('name'),
        integer: value.getAttributeSafe('integer'),
        desc: value.getAttributeSafe('desc'),
      ));
    });

    _result.enums.add(.new(
      name: enum_.getAttributeSafe('name'),
      desc: enum_.getAttributeSafe('desc'),
      values: values,
    ));
  });

  void _processFunctions(XmlElement node) => _processChildren(node, (funcTag, func) {
    if (funcTag != 'Function') throw StateError('Invalid Function: $funcTag (should be: Function)');
    
    final params = <RaylibApiFunctionParam>[];
    _processChildren(func, (paramTag, param) {
      if (paramTag != 'Param') throw StateError('Invalid Function Param: $paramTag (should be: Param)');
      params.add(.new(
        type: param.getAttributeSafe('type'),
        name: param.getAttributeSafe('name'),
        desc: param.getAttributeSafe('desc'),
      ));
    });

    _result.functions.add(.new(
      name: func.getAttributeSafe('name'),
      retType: func.getAttributeSafe('retType'),
      desc: func.getAttributeSafe('desc'),
      params: params,
    ));
  });

  void _processCallbacks(XmlElement node) => _processChildren(node, (callbackTag, func) {
    if (callbackTag != 'Callback') throw StateError('Invalid Callback: $callbackTag (should be: Callback)');
    
    final params = <RaylibApiFunctionParam>[];
    _processChildren(func, (paramTag, param) {
      if (paramTag != 'Param') throw StateError('Invalid Function Param: $paramTag (should be: Param)');
      params.add(.new(
        type: param.getAttributeSafe('type'),
        name: param.getAttributeSafe('name'),
        desc: param.getAttributeSafe('desc'),
      ));
    });

    _result.callbacks.add(.new(
      name: func.getAttributeSafe('name'),
      retType: func.getAttributeSafe('retType'),
      desc: func.getAttributeSafe('desc'),
      params: params,
    ));
  });

  void _read() {
    final document = XmlDocument.parse(_content);

    final root = document.rootElement;

    if (root.name.toString() != 'raylibAPI') throw InvalidFileException('Unknown format (should be <raylibAPI>)');

    _processChildren(root, (childTag, child) {
      switch (childTag) {
        case 'Defines': _processDefines(child); break;
        case 'Structs': _processStructs(child); break;
        case 'Aliases': _processAliases(child); break;
        case 'Enums': _processEnums(child); break;
        case 'Functions': _processFunctions(child); break;
        case 'Callbacks': _processCallbacks(child); break;
        default: throw StateError('Unknown Raylib Type: ${child.name}');
      }
    });

    result.update();
  }
}