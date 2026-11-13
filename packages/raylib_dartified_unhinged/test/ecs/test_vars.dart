import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';

typedef G = TestApp;

class TestApp extends App<G> {
  TestApp(super.backend); 
}

void main() {
  group('Variables', () {
    late TestApp app;
    VarNumKey<int> varCount = .new('count');

    setUp(() => app = .new(HeadlessBackend()));

    test('set', () {
      varCount.set(app, 100);
      expect(varCount.get(app), equals(100));
    });

    test('get or set', () {
      expect(varCount.getOrSet(app, 100), equals(100));
    });

    test('get missing', () {
      expect(varCount.get(app), equals(null));
    });

    test('get with fallback', () {
      expect(varCount.getSafe(app, 100), equals(100));
    });

    test('has', () {
      expect(varCount.has(app), equals(false));
      varCount.set(app, 100);
      expect(varCount.has(app), equals(true));
    });

    test('increment', () {
      varCount.inc(app);
      varCount.inc(app);
      varCount.inc(app);
      expect(varCount.get(app), equals(3));
    });

    test('decrement', () {
      varCount.dec(app);
      varCount.dec(app);
      varCount.dec(app);
      expect(varCount.get(app), equals(-3));
    });
  });
}
