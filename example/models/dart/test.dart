// Custom example, there's no original equivalent
// Run it: dart run test.dart
// WARNING: expects resources from the raylib source
import '../../base.dart';

const int screenWidth = 800;
const int screenHeight = 450;

void dumpModel(String name, ModelD model) {
  assert(model.originalPointer != null);
  String pad([int n = 1]) => '  ' * n;
  String arrow([int n = 1]) => '${pad(n)} >';
  print('='*32);
  print('$name:');
  print('${arrow()} ptr: ${model.originalPointer}');
  print('${arrow()} allocKey: ${model.$state.allocKey}');
  print('${arrow()} meshes:');
  for (final (i, mesh) in model.meshes.indexed) {
    print('${arrow(2)} mesh $i ptr: ${mesh.originalPointer}');
  }
  print('${arrow()} materials:');
  for (final (i, material) in model.materials.indexed) {
    print('${arrow(2)} material $i ptr: ${material.originalPointer}');
  }
  print('${arrow()} bones:');
  for (final (i, bone) in model.bones.indexed) {
    print('${arrow(2)} bone $i ptr: ${bone.originalPointer}');
  }
  print('='*32);
}

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.Temp.debugSync(true);
  rl.Temp.debugFree(true);

  rl.CoreD.InitWindow(screenWidth, screenHeight, "test");

  final characterModel1 = rl.CoreD.LoadModel("../resources/models/gltf/greenman.glb");

  dumpModel('characterModel1', characterModel1);
  rl.Temp.Model$.PointerTo(characterModel1);
  dumpModel('characterModel1', characterModel1);

  rl.CloseWindowAndDispose();
}