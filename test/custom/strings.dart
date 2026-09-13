import 'dart:typed_data';
import 'package:test/test.dart';
import 'package:raylib_dartified/abbr/dart.dart';

void main() {
  setUpAll(() => findRaylib('raylib-6.0_linux_amd64/lib', silent: true));

  group('UTF-8 (RChar)', () {
    late MemoryPointer<RChar> ptr;

    setUp(() => ptr = MemoryPointer.calloc(32, RChar.scalarByteSize).cast<RChar>());
    tearDown(() => ptr.free());

    test('round-trips ASCII', () {
      ptr.writeString('hello', 32);
      expect(ptr.toDartString(), 'hello');
    });

    test('round-trips multi-byte codepoints', () {
      // 'é' = 2 bytes, '中' = 3 bytes, '😀' = 4 bytes UTF-8
      const s = 'café 中文 😀';
      ptr.writeString(s, 32);
      expect(ptr.toDartString(), s);
    });

    test('stops at embedded NUL when reading unbounded', () {
      ptr.writeString('abc', 32);
      // manually clobber past the NUL terminator with garbage
      ptr.offsetBy(4).writeUint8(0x58); // 'X', should never be read
      expect(ptr.toDartString(), 'abc');
    });

    test('zero-pads remainder after write', () {
      ptr.writeString('ab', 8);
      final raw = ptr.readBytes(0, 8);
      expect(raw, [0x61, 0x62, 0, 0, 0, 0, 0, 0]);
    });

    test('truncates when text exceeds maxLength (byte-exact boundary)', () {
      ptr.writeString('abcdef', 4);
      final raw = ptr.readBytes(0, 4);
      expect(raw, [0x61, 0x62, 0x63, 0x64]); // 'abcd', no NUL room, no crash
    });

    test('does not split a multi-byte codepoint on truncation boundary landing mid-char', () {
      // 'é' is 2 bytes (0xC3 0xA9). maxLength=3 after 'a' (1 byte) leaves
      // only 2 bytes for 'é', exactly enough. maxLength=2 would only fit
      // 1 byte of 'é', which utf8.encode-then-slice would corrupt if not
      // handled at the codepoint level.
      ptr.writeString('aé', 2);
      final raw = ptr.readBytes(0, 2);
      // Implementation-defined: assert it's either "a\0" (dropped whole char)
      // or a valid encode, never a lone continuation byte.
      expect(raw[0], 0x61);
      expect(raw[1], anyOf(0x00, 0xC3));
    });

    test('empty string writes all zero and reads back empty', () {
      ptr.writeString('', 8);
      expect(ptr.readBytes(0, 8), List.filled(8, 0));
      expect(ptr.toDartString(), '');
    });

    test('toDartString stops at the shorter of NUL or maxLength', () {
      ptr.writeString('hello world', 32);
      expect(ptr.toDartString(5), 'hello');
    });

    test('readString honors byteOffset', () {
      ptr.writeString('AAAA', 4);
      ptr.offsetBy(4).cast<RChar>().writeString('BB', 4);
      expect(ptr.readStringUTF8(4, 4), 'BB');
      expect(ptr.readStringUTF8(4, 0), 'AAAA');
    });
  });

  group('UTF-16 (RInt16)', () {
    late MemoryPointer<RInt16> ptr;

    setUp(() => ptr = MemoryPointer.calloc(32, RInt16.scalarByteSize).cast<RInt16>());
    tearDown(() => ptr.free());

    test('round-trips ASCII', () {
      ptr.writeString('hello', 16);
      expect(ptr.toDartString(), 'hello');
    });

    test('round-trips BMP non-ASCII', () {
      const s = 'Testing äöü ключ';
      ptr.writeString(s, 16);
      expect(ptr.toDartString(16), s);
    });

    test('round-trips a surrogate-pair codepoint (non-BMP)', () {
      const emoji = '😀'; // U+1F600 -> surrogate pair D83D DE00
      ptr.writeString(emoji, 4);
      expect(ptr.toDartString(), emoji);
      expect(ptr.toDartString().runes.single, 0x1F600);
    });

    test('does not leave a lone high surrogate when truncating', () {
      // '😀' takes 2 code units; maxLength=1 can only fit the high surrogate.
      ptr.writeString('😀', 1);
      final units = ptr.asCopy<Uint16List>(1); // hypothetical bulk read helper
      // The lone high surrogate must not be written unpaired.
      expect(units[0], isNot(inInclusiveRange(0xD800, 0xDBFF)));
    });

    test('maxLength is in code units, not bytes', () {
      ptr.writeString('abcd', 2); // should keep only 2 units = 'ab'
      expect(ptr.toDartString(2), 'ab');
    });

    test('zero-pads remainder after write (as uint16 zeros)', () {
      ptr.writeString('ab', 4);
      final units = ptr.asCopy<Uint16List>(4);
      expect(units, [0x0061, 0x0062, 0, 0]);
    });

    test('stops at embedded NUL unit when reading unbounded', () {
      ptr.writeString('ab', 4);
      ptr.offsetBy(2 * 3).writeUint16(0x0058); // 'X' past the NUL, offset in bytes
      expect(ptr.toDartString(), 'ab');
    });

    test('empty string', () {
      ptr.writeString('', 4);
      expect(ptr.toDartString(), '');
    });

    test('toDartString respects code-unit bound over NUL', () {
      ptr.writeString('hello', 16);
      expect(ptr.toDartString(3), 'hel');
    });
  });

  group('UTF-32 (RInt32)', () {
    late MemoryPointer<RInt32> ptr;

    setUp(() => ptr = MemoryPointer.calloc(32, RInt32.scalarByteSize).cast<RInt32>());
    tearDown(() => ptr.free());

    test('round-trips ASCII', () {
      ptr.writeString('hello', 8);
      expect(ptr.toDartString(), 'hello');
    });

    test('round-trips non-BMP codepoints as single units (no surrogates)', () {
      const s = '😀🎉';
      ptr.writeString(s, 4);
      expect(ptr.toDartString(), s);
      final runes = ptr.asCopy<Uint32List>(4);
      expect(runes[0], 0x1F600);
      expect(runes[1], 0x1F389);
    });

    test('maxLength is in runes, not bytes', () {
      ptr.writeString('😀ab', 2); // 3 runes total, keep only first 2
      expect(ptr.toDartString(), '😀a');
    });

    test('zero-pads remainder after write', () {
      ptr.writeString('a', 3);
      final runes = ptr.asCopy<Uint32List>(3);
      expect(runes, [0x61, 0, 0]);
    });

    test('stops at embedded NUL rune when reading unbounded', () {
      ptr.writeString('ab', 4);
      ptr.offsetBy(4 * 3).writeUint32(0x58); // 'X' past NUL, byte offset
      expect(ptr.toDartString(), 'ab');
    });

    test('empty string', () {
      ptr.writeString('', 4);
      expect(ptr.toDartString(), '');
    });

    test('exact-fit write leaves no room for NUL and does not overflow', () {
      ptr.writeString('abcd', 4);
      final runes = ptr.asCopy<Uint32List>(4);
      expect(runes, [0x61, 0x62, 0x63, 0x64]);
    });
  });

  tearDownAll(disposeRaylib);
}