part of '../raylib_dartified_unhinged.dart';

/// A filter predicate used internally by the query system.
///
/// Returns `true` if the given entity [E] should be included in the current
/// query group's results.
typedef QueryFilterFn<T extends App<T>, E extends IsComponentManagable<T, E>> = bool Function(E);

/// A single clause group in a query expression.
///
/// Each group holds a list of [QueryFilterFn] predicates that must all pass for an
/// entity to be accepted (AND semantics within the group). When [negated] is
/// `true`, the combined result of the group is inverted, i.e. an entity passes
/// only if it would *not* have passed all the filters.
///
/// Groups are created implicitly by [QueryComponentManagable.Or] and
/// [QueryComponentManagable.Not]; you rarely construct one directly.
final class QueryGroup<T extends App<T>, E extends IsComponentManagable<T, E>> {
  final List<QueryFilterFn<T, E>> filters = [];

  /// When `true`, the entire group's result is negated before being applied.
  bool negated = false;

  void add(QueryFilterFn<T, E> f) => filters.add(f);
}

/// Base class for the **Query-like DSL**, a fluent, chainable query language
/// for filtering entities or components.
///
/// ## The Query-like language
///
/// Capitalized methods (e.g. [With], [Except], [Where], [Or], [Not]) are the
/// vocabulary of an embedded query language. They are named in PascalCase to
/// distinguish them from ordinary Dart methods and to read naturally in a chain:
///
/// ```dart
/// query
///   .With<Position>()
///   .With<Velocity>()
///   .Except<Frozen>()
///   .DoForEach((e) => ...);
/// ```
///
/// The query is lazily evaluated: nothing is resolved until a terminal
/// operation such as [First], [DoForEach], [Collect], etc. is called.
///
/// ## Groups and boolean logic
///
/// Internally a query is a list of [QueryGroup]s.  Within a group, all
/// filters are ANDed.  [Or] starts a new group; results across groups are
/// ORed (entity passes if *any* group passes). [Not] starts a new negated
/// group (entity passes if it would *fail* all filters in that group).
///
/// ```dart
/// // entities that have Burning OR have Wet
/// query.With<Burning>().Or().With<Wet>().Collect();
///
/// // entities that are NOT frozen
/// query.Not().With<Frozen>().Collect();
/// ```
///
/// ## Type parameters
///
/// - [T] the concrete [App] subclass (used for component type resolution).
/// - [E] the element type being queried ([Entity] or [Comp]).
/// - [Q] the concrete query subclass, used so that every builder method
///   returns the right type and chains remain fluent.

// Multi-Query
abstract class QueryComponentManagable<
  T extends App<T>,
  E extends IsComponentManagable<T, E>,
  Q extends QueryComponentManagable<T, E, Q>
> extends ECSBase<T> with
    
  Self<Q>,
  IsCloneable<T, Q>,
  HasAppAccess<T>

{

  List<QueryGroup<T, E>> _groups = [.new()];

  /// Optional override for the entity source. When set via [From], the query
  /// operates on this list instead of [queryableList].
  List<E>? _sourceList;

  @override
  final T app;

  QueryComponentManagable(this.app);

  /// The default pool of elements to query when no explicit [From] source is
  /// provided. Implemented by concrete subclasses.
  Iterable<E> get queryableList;

  //           ░██████     ░██████   ░██     ░██ ░█████████    ░██████  ░██████████ 
  // ░██      ░██   ░██   ░██   ░██  ░██     ░██ ░██     ░██  ░██   ░██ ░██         
  //  ░██    ░██         ░██     ░██ ░██     ░██ ░██     ░██ ░██        ░██         
  //   ░██    ░████████  ░██     ░██ ░██     ░██ ░█████████  ░██        ░█████████  
  //  ░██            ░██ ░██     ░██ ░██     ░██ ░██   ░██   ░██        ░██         
  // ░██      ░██   ░██   ░██   ░██   ░██   ░██  ░██    ░██   ░██   ░██ ░██         
  //           ░██████     ░██████     ░██████   ░██     ░██   ░██████  ░██████████ 

  /// **[Query-like]** Restricts the query to a specific list of [entities]
  /// instead of the default [queryableList].
  ///
  /// Useful when you already have a pre-filtered subset and want to apply
  /// further conditions on top of it.
  Q From(List<E> entities) {
    _sourceList = entities;
    return self;
  }

  //         ░██████████░██████░██         ░██████████░██████████ ░█████████    ░██████   
  // ░██     ░██          ░██  ░██             ░██    ░██         ░██     ░██  ░██   ░██  
  //  ░██    ░██          ░██  ░██             ░██    ░██         ░██     ░██ ░██         
  //   ░██   ░█████████   ░██  ░██             ░██    ░█████████  ░█████████   ░████████  
  //  ░██    ░██          ░██  ░██             ░██    ░██         ░██   ░██           ░██ 
  // ░██     ░██          ░██  ░██             ░██    ░██         ░██    ░██   ░██   ░██  
  //         ░██        ░██████░██████████     ░██    ░██████████ ░██     ░██   ░██████   

  /// **[Query-like]** Keeps only elements whose runtime type is [C].
  ///
  /// This is a type-narrowing filter: an entity must *be* a [C], not merely
  /// *have* one as a component.
  Q On<C extends E>() {
    _groups.last.add((e) => e is C);
    return self;
  }

  /// **[Query-like]** Keeps only elements that have component [C] attached.
  Q With<C extends Comp<T>>() {
    _groups.last.add((e) => e.contains<C>());
    return self;
  }

  /// **[Query-like]** Keeps only elements that have *both* components [A] and [B].
  Q With2<
    A extends Comp<T>,
    B extends Comp<T>
  >() {
    _groups.last.add((e) => e.contains<A>() && e.contains<B>());
    return self;
  }

  /// **[Query-like]** Keeps only elements that have *all three* components
  /// [A], [B], and [C].
  Q With3<
    A extends Comp<T>,
    B extends Comp<T>,
    C extends Comp<T>
  >() {
    _groups.last.add((e) => e.contains<A>() && e.contains<B>() && e.contains<C>());
    return self;
  }

  /// **[Query-like]** Keeps only elements that have *at least one* of [A] or [B].
  Q WithAny<
    A extends Comp<T>,
    B extends Comp<T>
  >() {
    _groups.last.add((e) => e.contains<A>() || e.contains<B>());
    return self;
  }

  /// **[Query-like]** Excludes elements that have component [C].
  Q Except<C extends Comp<T>>() {
    _groups.last.add((e) => !e.contains<C>());
    return self;
  }

  /// **[Query-like]** Excludes elements that have *either* [A] or [B].
  Q Except2<
    A extends Comp<T>,
    B extends Comp<T>
  >() {
    _groups.last.add((e) => !e.contains<A>() && !e.contains<B>());
    return self;
  }

  /// **[Query-like]** Excludes elements that have *any* of [A], [B], or [C].
  Q Except3<
    A extends Comp<T>,
    B extends Comp<T>,
    C extends Comp<T>
  >() {
    _groups.last.add((e) => !e.contains<A>() && !e.contains<B>() && !e.contains<C>());
    return self;
  }

  /// **[Query-like]** Keeps only elements for which [fn] returns `true`.
  ///
  /// Use this for arbitrary conditions that don't map to a component check.
  Q Where(bool Function(E entity) fn) {
    _groups.last.add(fn);
    return self;
  }

  /// **[Query-like]** Keeps only elements matching given type [X].
  Q WhereType<X>() {
    _groups.last.add((x) => x is X);
    return self;
  }

  /// **[Query-like]** Keeps only elements that have [C] *and* for which [fn]
  /// returns `true` given the entity and its [C] instance.
  Q WithWhere<C extends Comp<T>>(
    bool Function(E entity, C c) fn
  ) {
    _groups.last.add((e) {
      final c = e.find<C>();
      return c != null && fn(e, c);
    });
    return self;
  }

  /// **[Query-like]** Keeps only elements that have *both* [A] and [B] and for
  /// which [fn] returns `true`.
  Q With2Where<
    A extends Comp<T>,
    B extends Comp<T>
  >(
    bool Function(E entity, A a, B b) fn
  ) {
    _groups.last.add((e) {
      final a = e.find<A>(), b = e.find<B>();
      return a != null && b != null && fn(e, a, b);
    });
    return self;
  }

  /// **[Query-like]** Keeps only elements that have *all three* of [A], [B],
  /// and [C] and for which [fn] returns `true`.
  Q With3Where<
    A extends Comp<T>,
    B extends Comp<T>,
    C extends Comp<T>
  >(
    bool Function(E entity, A a, B b, C c) fn
  ) {
    _groups.last.add((e) {
      final a = e.find<A>(), b = e.find<B>(), c = e.find<C>();
      return a != null && b != null && c != null && fn(e, a, b, c);
    });
    return self;
  }

  //         ░████████     ░██████     ░██████   ░██         
  // ░██     ░██    ░██   ░██   ░██   ░██   ░██  ░██         
  //  ░██    ░██    ░██  ░██     ░██ ░██     ░██ ░██         
  //   ░██   ░████████   ░██     ░██ ░██     ░██ ░██         
  //  ░██    ░██     ░██ ░██     ░██ ░██     ░██ ░██         
  // ░██     ░██     ░██  ░██   ░██   ░██   ░██  ░██         
  //         ░█████████    ░██████     ░██████   ░██████████ 

  /// **[Query-like]** Opens a new *negated* filter group.
  ///
  /// Filters added after [Not] must **all** fail for an entity to pass this
  /// group.  Typically used as:
  ///
  /// ```dart
  /// query.Not().With<Frozen>()
  /// ```
  ///
  /// Which reads: "entities that do NOT have `Frozen`."
  Q Not() {
    _groups.add(QueryGroup<T, E>());
    _groups.last.negated = true;
    return self;
  }

  /// **[Query-like]** Merges all groups from [other] into this query (AND at
  /// the group level).
  ///
  /// When called without arguments, this is a no-op and can be used purely for
  /// readability.
  Q And([Q? other]) {
    if (other != null) {
      _groups.addAll(other._groups);
    }
    return self;
  }

  /// **[Query-like]** Opens a new filter group (OR semantics between groups).
  ///
  /// An entity passes the overall query if it passes *any* group. When [other]
  /// is provided its groups are appended; without arguments a fresh empty group
  /// is started and subsequent filter calls populate it:
  ///
  /// ```dart
  /// query.With<Fire>().Or().With<Lava>()
  /// // entities that have Fire OR have Lava
  /// ```
  Q Or([Q? other]) {
    if (other != null) {
      _groups.addAll(other._groups);
    } else {
      _groups.add(.new());
    }
    return self;
  }

  // ---------------------------------------------------------------------------
  // Internal resolution
  // ---------------------------------------------------------------------------

  /// Applies all accumulated filter groups to the source list and returns the
  /// matching elements.
  ///
  /// Groups are ANDed together (every group must pass). Within a group, all
  /// predicates are ANDed; a negated group inverts that combined result.
  Iterable<E> _resolve() => (_sourceList ?? queryableList).where((e) {
    return _groups.every((group) {
      final passes = group.filters.every((f) => f(e));
      return group.negated ? !passes : passes;
    });
  });

  //   ░██████   ░██████░███    ░██   ░██████  ░██         ░██████████ 
  //  ░██   ░██    ░██  ░████   ░██  ░██   ░██ ░██         ░██         
  // ░██           ░██  ░██░██  ░██ ░██        ░██         ░██         
  //  ░████████    ░██  ░██ ░██ ░██ ░██  █████ ░██         ░█████████  
  //         ░██   ░██  ░██  ░██░██ ░██     ██ ░██         ░██         
  //  ░██   ░██    ░██  ░██   ░████  ░██  ░███ ░██         ░██         
  //   ░██████   ░██████░██    ░███   ░█████░█ ░██████████ ░██████████ 

  /// **[Query-like]** Returns the first matching element. Throws if none exist.
  E get First => _resolve().first;

    /// **[Query-like]** Returns the first matching element, or `null` if the
  /// result set is empty.
  E? get FirstOrNull => _resolve().firstOrNull;

  /// **[Query-like]** Returns the first element of type [X], skipping any
  /// non-matching elements. Throws a [StateError] if no element of type
  /// [X] exists.
  X FirstAs<X extends E>() => _resolve().whereType<X>().first;

  /// **[Query-like]** Returns the first element of type [X], skipping any
  /// non-matching elements, or `null` if none exists.
  X? FirstAsOrNull<X extends E>() => _resolve().whereType<X>().firstOrNull;

  /// **[Query-like]** Returns the last matching element. Throws if none exist.
  E get Last => _resolve().last;

  /// **[Query-like]** Returns the last matching element, or `null` if the
  /// result set is empty.
  E? get LastOrNull => _resolve().lastOrNull;

  /// **[Query-like]** Returns the last element of type [X], skipping any
  /// non-matching elements. Throws a [StateError] if no element of type
  /// [X] exists.
  X LastAs<X extends E>() => _resolve().whereType<X>().last;

  /// **[Query-like]** Returns the last element of type [X], skipping any
  /// non-matching elements, or `null` if none exists.
  X? LastAsOrNull<X extends E>() => _resolve().whereType<X>().lastOrNull;

  /// **[Query-like]** Returns the number of matching elements.
  int get Count => _resolve().length;

  /// **[Query-like]** `true` if at least one element matches.
  bool get IsNotEmpty => _resolve().isNotEmpty;

  /// **[Query-like]** `true` if no elements match.
  bool get IsEmpty => _resolve().isEmpty;

  /// **[Query-like]** Alias for [IsNotEmpty]. `true` if at least one element
  /// matches.
  bool get Exists => Count > 0;

  /// **[Query-like]** Returns the index of [e] in the resolved result list, or
  /// `-1` if not found.
  int IndexOf(E e) => _resolve().toList().indexOf(e);

  // ░██████████░██████░█████████    ░██████   ░██████████
  // ░██          ░██  ░██     ░██  ░██   ░██      ░██    
  // ░██          ░██  ░██     ░██ ░██             ░██    
  // ░█████████   ░██  ░█████████   ░████████      ░██    
  // ░██          ░██  ░██   ░██           ░██     ░██    
  // ░██          ░██  ░██    ░██   ░██   ░██      ░██    
  // ░██        ░██████░██     ░██   ░██████       ░██    

  /// **[Query-like]** Calls [fn] with the first matching element. Does nothing
  /// if the result set is empty.
  void DoFirst<A extends E>(void Function(A entity) fn) {
    final entities = On<A>()._resolve();
    if (entities.isEmpty) return;
    fn(entities.first as A);
  }

  /// **[Query-like]** Calls [fn] with the first matching element and its [C]
  /// component. Does nothing if the result set is empty.
  void DoFirstWith<
    C extends Comp<T>
  >(void Function(E entity, C c) fn) {
    final entities = _resolve();
    if (entities.isEmpty) return;
    final entity = entities.first;
    entity.on<C>((c) => fn(entity, c));
  }

  /// **[Query-like]** Calls [fn] with the first matching element and its [A]
  /// and [B] components. Does nothing if the result set is empty.
  void DoFirstWith2<
    A extends Comp<T>,
    B extends Comp<T>
  >(void Function(E entity, A a, B b) fn) {
    final entities = _resolve();
    if (entities.isEmpty) return;
    final entity = entities.first;
    entity.on2<A, B>((a, b) => fn(entity, a, b));
  }

  /// **[Query-like]** Calls [fn] with the first matching element and its [A],
  /// [B], and [C] components. Does nothing if the result set is empty.
  void DoFirstWith3<
    A extends Comp<T>,
    B extends Comp<T>,
    C extends Comp<T>
  >(void Function(E entity, A a, B b, C c) fn) {
    final entities = _resolve();
    if (entities.isEmpty) return;
    final entity = entities.first;
    entity.on3<A, B, C>((a, b, c) => fn(entity, a, b, c));
  }

  // ░██            ░███      ░██████   ░██████████
  // ░██           ░██░██    ░██   ░██      ░██    
  // ░██          ░██  ░██  ░██             ░██    
  // ░██         ░█████████  ░████████      ░██    
  // ░██         ░██    ░██         ░██     ░██    
  // ░██         ░██    ░██  ░██   ░██      ░██    
  // ░██████████ ░██    ░██   ░██████       ░██    

  /// **[Query-like]** Calls [fn] with the last matching element. Does nothing
  /// if the result set is empty.
  void DoLast<A extends E>(void Function(A entity) fn) {
    final entities = On<A>()._resolve();
    if (entities.isEmpty) return;
    fn(entities.last as A);
  }

  /// **[Query-like]** Calls [fn] with the last matching element and its [C]
  /// component. Does nothing if the result set is empty.
  void DoLastWith<
    C extends Comp<T>
  >(void Function(E entity, C c) fn) {
    final entities = _resolve();
    if (entities.isEmpty) return;
    final entity = entities.last;
    entity.on<C>((c) => fn(entity, c));
  }

  /// **[Query-like]** Calls [fn] with the last matching element and its [A]
  /// and [B] components. Does nothing if the result set is empty.
  void DoLastWith2<
    A extends Comp<T>,
    B extends Comp<T>
  >(void Function(E entity, A a, B b) fn) {
    final entities = _resolve();
    if (entities.isEmpty) return;
    final entity = entities.last;
    entity.on2<A, B>((a, b) => fn(entity, a, b));
  }

  /// **[Query-like]** Calls [fn] with the last matching element and its [A],
  /// [B], and [C] components. Does nothing if the result set is empty.
  void DoLastWith3<
    A extends Comp<T>,
    B extends Comp<T>,
    C extends Comp<T>
  >(void Function(E entity, A a, B b, C c) fn) {
    final entities = _resolve();
    if (entities.isEmpty) return;
    final entity = entities.last;
    entity.on3<A, B, C>((a, b, c) => fn(entity, a, b, c));
  }

  // ░████████   ░██     ░██ ░██         ░██     ░██ 
  // ░██    ░██  ░██     ░██ ░██         ░██    ░██  
  // ░██    ░██  ░██     ░██ ░██         ░██   ░██   
  // ░████████   ░██     ░██ ░██         ░███████    
  // ░██     ░██ ░██     ░██ ░██         ░██   ░██   
  // ░██     ░██  ░██   ░██  ░██         ░██    ░██  
  // ░█████████    ░██████   ░██████████ ░██     ░██ 

  /// **[Query-like]** Passes the full result [Iterable] to [fn].
  void DoAll<A extends E>(void Function(Iterable<A> entities) fn)
    => fn(_resolve().whereType<A>());

  /// **[Query-like]** Calls [fn] once for each matching element.
  void DoForEach<A extends E>(void Function(A entity) fn)
    => _resolve().whereType<A>().forEach(fn);

  /// **[Query-like]** For each element that has [C], calls [fn] with the
  /// element and its [C] instance. Implicitly adds a [With]`<C>` filter.
  void DoForEachWith<
    C extends Comp<T>
  >(void Function(E entity, C a) fn)
    => With<C>().DoForEach<E>((e) => fn(e, e.find<C>()!));

  /// **[Query-like]** For each element that has both [A] and [B], calls [fn]
  /// with the element and both component instances. Implicitly adds a
  /// [With2]`<A, B>` filter.
  void DoForEachWith2<
    A extends Comp<T>,
    B extends Comp<T>
  >(void Function(E entity, A a, B b) fn)
    => With2<A, B>().DoForEach<E>((e) => fn(e, e.find<A>()!, e.find<B>()!));

  /// **[Query-like]** For each element that has [A], [B], *and* [C], calls
  /// [fn] with the element and all three component instances. Implicitly adds
  /// a [With3]`<A, B, C>` filter.
  void DoForEachWith3<
    A extends Comp<T>,
    B extends Comp<T>,
    C extends Comp<T>
  >(void Function(E entity, A a, B b, C c) fn)
    => With3<A, B, C>().DoForEach<E>((e) => fn(e, e.find<A>()!, e.find<B>()!, e.find<C>()!));

  // ░█████████  ░█████████    ░██████       ░█████ 
  // ░██     ░██ ░██     ░██  ░██   ░██        ░██  
  // ░██     ░██ ░██     ░██ ░██     ░██       ░██  
  // ░█████████  ░█████████  ░██     ░██       ░██  
  // ░██         ░██   ░██   ░██     ░██ ░██   ░██  
  // ░██         ░██    ░██   ░██   ░██  ░██   ░██  
  // ░██         ░██     ░██   ░██████    ░██████   

  /// **[Query-like]** Projects matching elements using [toElement].
  Iterable<X> Map<X>(X Function(E e) toElement)
    => _resolve().map(toElement);

  /// **[Query-like]** Returns all matching elements as a lazy [Iterable].
  Iterable<A> Collect<A extends E>() => _resolve().whereType<A>();

  //   ░██████  ░██           ░██████   ░███    ░██ ░██████████ 
  //  ░██   ░██ ░██          ░██   ░██  ░████   ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██░██  ░██ ░██         
  // ░██        ░██         ░██     ░██ ░██ ░██ ░██ ░█████████  
  // ░██        ░██         ░██     ░██ ░██  ░██░██ ░██         
  //  ░██   ░██ ░██          ░██   ░██  ░██   ░████ ░██         
  //   ░██████  ░██████████   ░██████   ░██    ░███ ░██████████ 

  /// State key for [QueryComponentManagable]'s [_groups].
  late final stateKey_groups = ECSStateKey<List<QueryGroup<T, E>>>(
    '$QueryComponentManagable', 'groups',
    get: () => .from(_groups),
    set: (value) => _groups = value,
  );

  /// State key for [QueryComponentManagable]'s [_sourceList].
  late final stateKey_sourceList = ECSStateKey<List<E>?>(
    '$QueryComponentManagable', 'sourceList',
    get: () => _sourceList, // NOTE: do NOT make a copy using `.from(...)`
    set: (value) => _sourceList = value,
  );

  @override
  @mustCallSuper
  void _registerBuiltinStateKeys() {
    super._registerBuiltinStateKeys();
    registerStateKey(stateKey_groups);
    registerStateKey(stateKey_sourceList);
  }
}

/// A query over [Entity] objects within a [IsEntityManagable].
///
/// Source is the origin's full entity list; use [From] to restrict to a subset.
///
/// Example:
/// ```dart
///   .With<Health>()
///   .Except<Dead>()
///   .DoForEachWith<Health>((e, h) => h.regen());
/// ```
final class QueryEntities<T extends App<T>, E extends IsEntityManagable<T, E, Entity<T>>> extends QueryComponentManagable<T, Entity<T>, QueryEntities<T, E>> {
  final E origin;

  QueryEntities(super.app, this.origin);

  @override
  Iterable<Entity<T>> get queryableList => origin.getEntities();

  @override
  QueryEntities<T, E> createInstance() => .new(app, origin);
}

/// A query over the direct [Comp] children of a single [Entity].
///
/// Only components attached directly to [entity] are considered; for a
/// recursive search across child entities use [QueryEntityComponentDeep].
final class QueryEntityComponent<T extends App<T>> extends QueryComponentManagable<T, Comp<T>, QueryEntityComponent<T>> {
  final Entity<T> entity;

  QueryEntityComponent(super.app, this.entity);

  @override
  Iterable<Comp<T>> get queryableList => entity.getComponents();

  @override
  QueryEntityComponent<T> createInstance() => .new(app, entity);
}

/// A query over *all* [Comp] descendants of an [Entity], including those
/// attached to nested child entities.
///
/// For shallow (direct-only) component queries use [QueryEntityComponent].
final class QueryEntityComponentDeep<T extends App<T>> extends QueryComponentManagable<T, Comp<T>, QueryEntityComponentDeep<T>> {
  final Entity<T> entity;

  QueryEntityComponentDeep(super.app, this.entity);

  @override
  Iterable<Comp<T>> get queryableList => entity.getEverything();

  @override
  QueryEntityComponentDeep<T> createInstance() => .new(app, entity);
}

/// A query over the direct [Comp] children of a single [Comp].
///
/// Only components attached directly to [component] are considered; for a
/// recursive search across nested child components use [QueryComponentComponentDeep].
final class QueryComponentComponent<T extends App<T>> extends QueryComponentManagable<T, Comp<T>, QueryComponentComponent<T>> {
  final Comp<T> component;

  QueryComponentComponent(super.app, this.component);

  @override
  Iterable<Comp<T>> get queryableList => component.getComponents();

  @override
  QueryComponentComponent<T> createInstance() => .new(app, component);
}

/// A query over *all* [Comp] descendants of a [Comp], including those
/// attached to nested child components.
///
/// For shallow (direct-only) component queries use [QueryComponentComponent].
final class QueryComponentComponentDeep<T extends App<T>> extends QueryComponentManagable<T, Comp<T>, QueryComponentComponentDeep<T>> {
  final Comp<T> component;

  QueryComponentComponentDeep(super.app, this.component);

  @override
  Iterable<Comp<T>> get queryableList => component.getEverything();

  @override
  QueryComponentComponentDeep<T> createInstance() => .new(app, component);
}