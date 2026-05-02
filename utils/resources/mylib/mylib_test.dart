import 'dart:ffi';
import 'package:raylib_dartified/raylib.dart';
// import './output/generated_c_module.dart';
import './output/generated_d_module.dart';

void main() {
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  MyModuleRegister.register(rl, './libmylib.so');

  rl.CoreD.InitWindow(800, 450, 'MyModule Tester');

  final myStructC = rl.Temp.MyStruct$.At('yikes!');
  rl.MyModule$.MutateMyStruct(myStructC);
  assert(myStructC.ref.intField == 10);
  assert(myStructC.ref.floatField == 2.0);

  final MyStructD myStructD = .zero();
  // NOTE: does not work, does not throw any error, but it does not synchronize
  //       see CODEGEN.md on `WHY`
  rl.MyModuleD$.MutateMyStruct(myStructD);

  final MyVec3D vec1 = .new(x: 10, y: 10, z: 10);
  final MyVec3D vec2 = .new(x: 10, y: 10, z: 10);
  final result = rl.MyModuleD$.Vec3Add(vec1, vec2);

  while(!rl.CoreD.WindowShouldClose()) {
    rl.CoreD.BeginDrawing();
    rl.CoreD.ClearBackground(.BLACK);
    rl.CoreD.DrawRectangle(50, 50, 100, 100, .RED);

    rl.CoreD.DrawText('MyStructC.intField: ${myStructC.ref.intField}', 20, 200, 25, .WHITE);
    rl.CoreD.DrawText('MyStructC.floatField: ${myStructC.ref.floatField}', 20, 230, 25, .WHITE);
    rl.CoreD.DrawText('MyStructD.intField: ${myStructD.intField}', 20, 260, 25, .WHITE);
    rl.CoreD.DrawText('MyStructD.floatField: ${myStructD.floatField}', 20, 290, 25, .WHITE);
    rl.CoreD.DrawText('Vec3Add: [ ${result.x}, ${result.y}, ${result.z} ]', 20, 320, 25, .WHITE);
    rl.CoreD.DrawText('Mouse: ${rl.CoreD.GetMousePosition()}', 20, 350, 25, .WHITE);
    rl.CoreD.EndDrawing();
  }

  rl.Temp.debugFree(true);
  // NOTE: you should see output:
  // Freeing user-defined 2 MyStruct$ slots
  // [FREE] yikes!
  // [FREE] MyStructC_default_1
  // Freeing user-defined 2 MyVec3$ slots
  // [FREE] MyVec3C_default_1
  // [FREE] MyVec3C_default_2
  
  rl.CloseWindowAndDispose();
}