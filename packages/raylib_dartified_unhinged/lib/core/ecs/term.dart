part of '../raylib_dartified_unhinged.dart';

enum TermColor {
  black(30),
  red(31),
  green(32),
  yellow(33),
  blue(34),
  magenta(35),
  cyan(36),
  white(37),
  brightBlack(90),
  brightRed(91),
  brightGreen(92),
  brightYellow(93),
  brightBlue(94),
  brightMagenta(95),
  brightCyan(96),
  brightWhite(97);

  final int code;
  const TermColor(this.code);
}

enum TermStyle {
  none(0),
  bold(1),
  dim(2),
  italic(3),
  underline(4),
  blink(5),
  reverse(7),
  hidden(8),
  strikethrough(9);

  final int code;
  const TermStyle(this.code);
}

/// A piece of text with accumulated SGR codes.
class TermSpan {
  final String text;
  final List<int> codes;

  const TermSpan._(this.text, this.codes);

  const TermSpan(String text, [List<int> codes = const []]) : this._(text, codes);

  static TermSpan plain(String text) => ._(text, const []);
  static TermSpan bold(String text) => ._(text, const [1]);
  static TermSpan dim(String text) => ._(text, const [2]);
  static TermSpan italic(String text) => ._(text, const [3]);
  static TermSpan underline(String text) => ._(text, const [4]);

  static TermSpan fg(TermColor c, String text) => ._(text, [c.code]);
  static TermSpan bg(TermColor c, String text) => ._(text, [c.code + 10]);

  static TermSpan rgb(int r, int g, int b, String text) => ._(text, [38, 2, r, g, b]);

  static TermSpan styled(
    String text, {
    TermColor? fg,
    TermColor? bg,
    List<TermStyle> styles = const [],
  }) {
    final codes = <int>[
      if (fg != null) fg.code,
      if (bg != null) bg.code + 10,
      ...styles.map((s) => s.code),
    ];
    return TermSpan._(text, codes);
  }

  TermSpan withFg(TermColor c) => ._(text, [...codes, c.code]);
  TermSpan withBg(TermColor c) => ._(text, [...codes, c.code + 10]);
  TermSpan withStyle(TermStyle s) => ._(text, [...codes, s.code]);

  TermBuffer operator +(Object other) {
    final buf = TermBuffer()..add(this);
    if (other is TermSpan) {
      buf.add(other);
    } else {
      buf.write(other.toString());
    }
    return buf;
  }

  String render({bool colorize = true}) {
    if (!colorize || codes.isEmpty) return text;
    return '\x1B[${codes.join(';')}m$text\x1B[0m';
  }

  @override
  String toString() => render();
}

/// Ordered collection of spans/plain strings, rendered together.
/// Plain strings added via `write` pass through uncolored unless you give
/// codes explicitly.
class TermBuffer {
  final List<TermSpan> _spans = [];

  TermBuffer add(TermSpan span) {
    _spans.add(span);
    return this;
  }

  TermBuffer write(String text, [List<int> codes = const []]) {
    _spans.add(.new(text, codes));
    return this;
  }

  TermBuffer operator +(Object other) {
    if (other is TermSpan) {
      add(other);
    } else {
      write(other.toString());
    }
    return this;
  }

  String render({bool colorize = true})
    => _spans.map((s) => s.render(colorize: colorize)).join();

  @override
  String toString() => render();
}