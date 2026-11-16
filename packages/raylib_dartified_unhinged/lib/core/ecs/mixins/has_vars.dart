part of '../../raylib_dartified_unhinged.dart';

final class VarNumKey<T extends num> extends VarKey<T> {
  const VarNumKey(super.name);

  T inc(HasVars vars, [num? amount]) {
    final value = getSafe(vars, 0 as T);
    final next = (value + (amount ?? 1));
    set(vars, next as T);
    return next;
  }

  T dec(HasVars vars, [num? amount]) {
    final value = getSafe(vars, 0 as T);
    final next = (value - (amount ?? 1));
    set(vars, next as T);
    return next;
  }
}

final class VarKey<T> {
  final String name;
  
  const VarKey(this.name);

  T get(HasVars vars)
    => vars._vars[this] as T;

  T? getNullable(HasVars vars)
    => vars._vars[this] as T?;

  T getSafe(HasVars vars, T fallback)
    => vars._vars[this] is T ? vars._vars[this] as T : fallback;

  bool has(HasVars vars)
    => vars._vars.containsKey(this);

  void set(HasVars vars, T value)
    => vars._vars[this] = value;

  T getOrSet(HasVars vars, T fallback) {
    if (vars._vars.containsKey(this)) return get(vars)!;
    set(vars, fallback);
    return fallback;
  }
}

mixin HasVars<
  T extends App<T>,
  E extends ECSBase<T>
> on
  Self<E>,
  ECSBase<T>
{
  /// State key for [HasVars]'s [_vars].
  late final stateKey_vars = ECSStateKey<Map<VarKey<dynamic>, dynamic>>(
    '$HasVars', 'vars',
    get: () => .from(_vars),
    set: (value) => _vars = value,
  );

  @override
  @mustCallSuper
  void _registerBuiltinStateKeys() {
    super._registerBuiltinStateKeys();
    registerStateKey(stateKey_vars);
  }

  Map<VarKey<dynamic>, dynamic> _vars = {};
}