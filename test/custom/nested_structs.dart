import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  test("Nested Structs", () {
    Vector3D position = .vec3(10, 10, 10);
    Camera3DD camera = .new(position: position);

    expect(camera.position.toString(), position.toString());

    camera.position.x = 5;
    expect(camera.position.toString(), (position..x = 5).toString());
  });

  test("Nested Structs - backed by memory", () {
    Vector3D position = .vec3(10, 10, 10);
    Camera3DD camera = .new(position: position);

    Camera3D$.Allocate(camera);
    expect(camera.op, isNotNull);
    expect(camera.position.toString(), position.toString());

    camera.position.x = 5;
    expect(camera.position.toString(), (position..x = 5).toString());
  });

  tearDownAll(disposeRaylib);
}