part of '../../raylib_dartified_unhinged.dart';

/// Hook result for before/on/after lifecycle functionalities.
enum HookResult {
  /// Proceed normally: run the core 'on' phase, then the 'after' phase.
  proceed,

  /// Skip the core 'on' phase, but still execute the 'after' phase for cleanup/sync.
  skip,

  /// Hard abort: cancel the operation entirely (skip both 'on' and 'after').
  cancel,
}

/// Single key to external hook storage.
final class ECSHookKey<F extends Function> {
  // for group-clearing, since there's no enum to group by
  final String family;

  final String name;

  const ECSHookKey(this.family, this.name);

  String get fullId => '$family.$name';

  @override
  bool operator ==(Object other) => other is ECSHookKey<F> && other.fullId == fullId;

  @override
  int get hashCode => Object.hash(F, fullId);

  @override
  String toString() => fullId;
}

/// Hooks receive the affected instance as an argument (e.g. `self`).
/// Prefer that over closing over an outer reference, hook closures
/// are shared by reference when cloned, so a captured outer instance
/// stays stale across clones.
mixin HasExternalHooks<T extends App<T>> {
  final Map<ECSHookKey, List<Function>> _hooks = {};

  HookResult _mergeHookResult(HookResult acc, HookResult res) {
    if (res == .cancel) return res;
    if (res == .skip) return res;
    return acc;
  }

  void addHook<F extends Function>(ECSHookKey<F> key, F fn)
    => (_hooks[key] ??= <Function>[]).add(fn);

  void removeHook<F extends Function>(ECSHookKey<F> key, F fn)
    => _hooks[key]?.remove(fn);

  Iterable<F> hooksOf<F extends Function>(ECSHookKey<F> key)
    => (_hooks[key] ?? const <Function>[]).cast<F>();

  void clearExternalHooks([Iterable<ECSHookKey>? keys]) {
    if (keys == null) {
      _hooks.clear();
    } else {
      keys.forEach(_hooks.remove);
    }
  }

  void clearExternalHooksWhere(bool Function(ECSHookKey) test) 
    => _hooks.removeWhere((k, _) => test(k));

  void clearExternalHookFamily(String family)
    => clearExternalHooksWhere((k) => k.family == family);

  void _copyHooksTo(
    HasExternalHooks<T> target,
    bool Function(ECSHookKey) allowed,
  ) => _hooks.forEach((type, fns) {
    if (allowed(type)) {
      target._hooks[type] = .from(fns);
    }
  });
}