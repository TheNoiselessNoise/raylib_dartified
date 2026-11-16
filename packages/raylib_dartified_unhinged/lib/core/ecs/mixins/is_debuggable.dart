part of '../../raylib_dartified_unhinged.dart';

enum ECSDebugLevel { simple, v, vv, vvv }

final class ECSDebugMessageOptions {
  bool showTime = true;
  bool showTimeDate = true;
  bool showSource = true;
  bool showTag = true;
  bool colorize = true;
}

final class ECSDebugMessage {
  final String text;
  final ECSDebugLevel level;
  final DateTime time;
  final String source;
  final String? tag;
  final ECSDebugMessageOptions options = .new();

  ECSDebugMessage(this.text, this.level, this.time, this.source, this.tag);

  static const Map<ECSDebugLevel, (TermColor?, List<TermStyle>)> _levelColors = {
    .simple: (null, [.none]),
    .v: (.cyan, [.dim]),
    .vv: (.brightWhite, [.dim]),
    .vvv: (.brightWhite, [.dim]),
  };

  @override
  String toString() {
    final o = options;
    final buf = TermBuffer();

    if (o.showTime) {
      String timeString = time.toString();
      if (!o.showTimeDate) timeString = timeString.split(' ').last;
      buf.add(.dim('[$timeString] '));
    }
    if (o.showSource) buf.add(.dim('[$source] '));
    if (o.showTag && tag != null) buf.add(.dim('[$tag] '));

    final (color, styles) = _levelColors[level]!;
    buf.add(.styled(text, fg: color, styles: styles));

    return buf.render(colorize: o.colorize);
  }
}

typedef IsAnyDebuggable<T extends App<T>> = IsDebuggable<T, ECSBase<T>>;

mixin IsDebuggable<
  T extends App<T>,
  E extends ECSBase<T>
> on
  IsEventEmittable<T, E>
{
  IsAnyDebuggable<T>? get debugParent {
    if (parent case IsAnyDebuggable<T> debuggableParent) {
      return debuggableParent;
    }
    return null;
  }

  bool? _debugEnabledOverride;
  ECSDebugLevel? _debugLevelOverride;
  Set<String>? _debugTagsOverride;
  void Function(ECSDebugMessage msg)? _debugDefaultMessagePrinterOverride;

  bool get debugEnabledEffective
    => _debugEnabledOverride ?? debugParent?.debugEnabledEffective ?? false;

  ECSDebugLevel get debugLevelEffective
    => _debugLevelOverride ?? debugParent?.debugLevelEffective ?? .simple;

  Set<String>? get debugTagsEffective
    => _debugTagsOverride ?? debugParent?.debugTagsEffective;

  void Function(ECSDebugMessage msg)? get _debugDefaultMessagePrinter
    => _debugDefaultMessagePrinterOverride ?? debugParent?._debugDefaultMessagePrinter;

  @nonVirtual
  E enableDebug([bool? enable = true]) {
    _debugEnabledOverride = enable;
    return self;
  }

  @nonVirtual
  E setDebugLevel(ECSDebugLevel? level) {
    _debugLevelOverride = level;
    return self;
  }

  @nonVirtual
  E setDebugMessagePrinter(void Function(ECSDebugMessage msg) printer) {
    _debugDefaultMessagePrinterOverride = printer;
    return self;
  }

  /// Restricts this object (and anything cascading from it, unless they
  /// set their own override) to only the given tags. Pass `null` to clear
  /// the override and inherit from [debugParent]. Pass an empty set to
  /// block all tagged messages while still allowing untagged ones.
  @nonVirtual
  E setDebugTags(Set<String>? tags) {
    _debugTagsOverride = tags;
    return self;
  }

  /// Convenience: narrows the *current effective* tag set by adding [tag],
  /// materializing an override on this object.
  @nonVirtual
  E addDebugTag(String tag) {
    _debugTagsOverride = {...?debugTagsEffective, tag};
    return self;
  }

  /// Hook key for [IsDebuggable]'s [onDebugMessage] hooks.
  late final hookKey_onDebugMessage = ECSHookKey<void Function(E self, ECSDebugMessage msg)>(
    '$IsDebuggable', 'onDebugMessage'
  );

  @nonVirtual
  E listenOnDebugMessage(void Function(E self, ECSDebugMessage msg) fn) {
    addHook(hookKey_onDebugMessage, fn);
    return self;
  }

  bool _checkDebug(ECSDebugLevel level, String? tag) {
    if (!debugEnabledEffective) return false;
    if (level.index > debugLevelEffective.index) return false;
    final allowed = debugTagsEffective;
    if (tag != null && allowed != null && !allowed.contains(tag)) return false;
    return true;
  }

  ECSDebugMessage _msg(String message, ECSDebugLevel level, String? tag)
    => .new(message, level, .now(), namedId, tag);

  @nonVirtual
  void dbgSelf(String message, { ECSDebugLevel level = .simple, String? tag }) {
    if (!_checkDebug(level, tag)) return;
    _doOnDebugMessage(_msg(message, level, tag));
  }

  @nonVirtual
  void dbg(String message, { ECSDebugLevel level = .simple, String? tag }) {
    if (!_checkDebug(level, tag)) return;
    _doOnDebugMessage(_msg(message, level, tag), propagate: true);
  }

  @mustCallSuper
  void _doOnDebugMessage(ECSDebugMessage msg, {bool propagate = false}) {
    hooksOf(hookKey_onDebugMessage).forEach((f) => f(self, msg));
    onDebugMessage(msg);
    emit(EventDebugMessage(app, msg), scope: .self);
    if (propagate) debugParent?._doOnDebugMessage(msg, propagate: true);
  }

  void onDebugMessage(ECSDebugMessage msg) => _debugDefaultMessagePrinter?.call(msg);
}