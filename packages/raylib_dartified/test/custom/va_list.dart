import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  bootMemoryBackend();

  /*
    [ID 2] abc 3.50 1099511627776
    [2, abc, 3.5, 1099511627776]
    ptr => 0x..., str => Hello, World!
  */

  final va = XVaList.create
    .i32(2).string('abc').f64(3.5).i64(1099511627776)
    .build();

  final fmt = XPtr.fromString('[ID %i] %s %.2f %lld');
  print(XVaList.format(fmt, va.ptr)); 
  print(XVaList.extract(fmt, va.ptr));
  va.dispose();
  fmt.free();

  final p = XPtr.fromString("Hello, World!");
  print(XUtils.Format('ptr => %p, str => %s', [p, p]));
  p.free();
}