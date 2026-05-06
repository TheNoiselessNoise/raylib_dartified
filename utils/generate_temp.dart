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
      .litFloatTypedList('Float'),
      .litIntTypedList('Int', underlyingType: 'Int32'),
      .litIntTypedList('UnsignedInt', underlyingType: 'Uint32'),
      .litIntTypedList('Int8'),
      .litIntTypedList('Uint8'),
      .litIntTypedList('Int16'),
      .litIntTypedList('Uint16'),
      .litIntTypedList('Int32'),
      .litIntTypedList('Uint32'),
      .litIntTypedList('Int64'),
      .litIntTypedList('Uint64'),
      .litIntTypedList('Char', underlyingType: 'Int8'),
      .litIntTypedList('UnsignedChar', underlyingType: 'Uint8'),
      .litIntTypedList('UnsignedShort', underlyingType: 'Uint16'),
      .litIntTypedList('Short', underlyingType: 'Int16'),
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