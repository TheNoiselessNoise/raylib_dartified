import 'dart:io';
import 'generators/api_xml_reader.dart';
import 'generators/temp.dart';

void main() {
  Directory.current = File(Platform.script.toFilePath()).parent;

  if (!Directory.current.path.endsWith('utils')) {
    print('Please, run this inside <root>/utils folder!');
    exit(1);
  }

  final api = RaylibApiReader('./resources/raylib_api.xml').result;
  final tempOutput = File('./output/temp.dart');
  TempGen(api,
    templatePath: './templates/temp.dart',
    ignoreApi: true, // NOTE: generation from the XML is not completed yet (if it's even possible to some extent)
    literalTypes: [
      .lit(type: 'Bool', value: 'bool'),
      .litFloatTypedList('Float', typedList: 'Float32List'),
      .litFloatTypedList('Float', abbr: 'Float64', typedList: 'Float64List'),
      .litIntTypedList('Int', typedList: 'Int32List', underlyingType: 'Int32'),
      .litIntTypedList('UnsignedInt', typedList: 'Uint32List', underlyingType: 'Uint32'),
      .litIntTypedList('Int8', typedList: 'Int8List'),
      .litIntTypedList('Uint8', typedList: 'Uint8List'),
      .litIntTypedList('Int16', typedList: 'Int16List'),
      .litIntTypedList('Uint16', typedList: 'Uint16List'),
      .litIntTypedList('Int32', typedList: 'Int32List'),
      .litIntTypedList('Uint32', typedList: 'Uint32List'),
      .litIntTypedList('Int64', typedList: 'Int64List'),
      .litIntTypedList('Uint64', typedList: 'Uint64List'),
      .litIntTypedList('Char', typedList: 'Int8List', underlyingType: 'Int8'),
      .litIntTypedList('UnsignedChar', typedList: 'Uint8List', underlyingType: 'Uint8'),
      .litIntTypedList('UnsignedShort', typedList: 'Uint16List', underlyingType: 'Uint16'),
      .litIntTypedList('Short', typedList: 'Int16List', underlyingType: 'Int16'),
    ],

    structTypes: [
      .raylibStruct('AutomationEventList'),
      .raylibStruct('AutomationEvent'),
      .raylibStruct('AudioStream'),
      .raylibStruct('BoneInfo'),
      .raylibStruct('BoundingBox'),
      .raylibStruct('Camera2D'),
      .raylibStruct('Camera3D'),
      .raylibStruct('Color'),
      .raylibStruct('FilePathList'),
      .raylibStruct('Font'),
      .raylibStruct('GlyphInfo'),
      .raylibStruct('Image'),
      .raylibStruct('Light'),
      .raylibStruct('Material'),
      .raylibStruct('MaterialMap'),
      .raylibStruct('Matrix'),
      .raylibStruct('Mesh'),
      .raylibStruct('Model'),
      .raylibStruct('ModelAnimation'),
      .raylibStruct('Music'),
      .raylibStruct('NPatchInfo'),
      .raylibStruct('Quaternion'),
      .raylibStruct('Rectangle'),
      .raylibStruct('RlDrawCall'),
      .raylibStruct('RlRenderBatch'),
      .raylibStruct('RlVertexBuffer'),
      .raylibStruct('Ray'),
      .raylibStruct('RayCollision'),
      .raylibStruct('RenderTexture'),
      .raylibStruct('Shader'),
      .raylibStruct('Sound'),
      .raylibStruct('Texture'),
      .raylibStruct('Transform'),
      .raylibStruct('Vector2'),
      .raylibStruct('Vector3'),
      .raylibStruct('Vector4'),
      .raylibStruct('VrDeviceInfo'),
      .raylibStruct('VrStereoConfig'),
      .raylibStruct('Wave'),
    ],
  ).run(tempOutput);

  tempOutput.copySync('../lib/core/extensions/temp.dart');

  tempOutput.deleteSync();
}