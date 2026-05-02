import 'api_xml_reader.dart';
import 'type_resolver.dart';

abstract class Writable {
  final List<String> queue = [];
  final StringBuffer sb = StringBuffer();

  void write(String c) => sb.write(c);
  void writeln([String? c]) => sb.writeln(c ?? '');
  void writeln2([String? c]) => sb.writeln('${c ?? ''}\n');

  String get _pad => '  ';
  void pad    (String c) =>    write('${_pad*1}$c');
  void padln  (String c) =>  writeln('${_pad*1}$c');
  void padln2 (String c) => writeln2('${_pad*1}$c');
  void pad2   (String c) =>    write('${_pad*2}$c');
  void pad2ln (String c) =>  writeln('${_pad*2}$c');
  void pad2ln2(String c) => writeln2('${_pad*2}$c');
  void pad3   (String c) =>    write('${_pad*3}$c');
  void pad3ln (String c) =>  writeln('${_pad*3}$c');
  void pad3ln2(String c) => writeln2('${_pad*3}$c');
  void pad4   (String c) =>    write('${_pad*4}$c');
  void pad4ln (String c) =>  writeln('${_pad*4}$c');
  void pad4ln2(String c) => writeln2('${_pad*4}$c');

  String replaceID(String id) => '/*{{${id.toUpperCase()}}}*/';

  void writeReplacement(String id, String replace)
    => writeUpdate((c) => c.replaceFirst(id, replace));
    
  void writeUpdate(String Function(String c) replacer) {
    String old = sb.toString();
    sb.clear();
    write(replacer(old));
  }

  String writeIsolated(void Function() writer) {
    // push to queue
    queue.add(sb.toString());
    sb.clear();

    try {
      writer();
      return sb.toString();
    } finally {
      // restore last
      sb.clear();
      write(queue.removeLast());
    }
  }

  void writeSection(String name, {int baseLength = 9, int pad = 0}) {
    String ch = '=';
    String base = ch * baseLength;
    int nameLength = name.length + 2;
    String sepPart = '$base${ch * nameLength}$base';
    String namePart = '$base $name $base';
    String padding = ' ' * pad;

    writeln();
    writeln('$padding// $sepPart');
    writeln('$padding// $namePart');
    writeln('$padding// $sepPart');
    writeln();
  }
}

abstract class RaylibGenerator extends Writable {
  RaylibApiReaderResult api;
  TypeResolver typeResolver;

  RaylibGenerator(this.api) :
    typeResolver = TypeResolver(api);
}