part of '../../raylib_dartified_unhinged.dart';

double _linear(double t) => t;

double _lerpDouble(double from, double to, double t) => from + (to - from) * t;

class _PropertyTween {
  final void Function(double value) set;
  final double from;
  final double to;
  final double duration;
  final double Function(double t) easing;

  double elapsed = 0;
  bool done = false;

  _PropertyTween({
    required this.set,
    required this.from,
    required this.to,
    required this.duration,
    required this.easing,
  });

  void tick(double dt) {
    if (done) return;
    elapsed += dt;
    final t = duration <= 0 ? 1.0 : (elapsed / duration).clamp(0.0, 1.0);
    set(_lerpDouble(from, to, easing(t)));
    if (t >= 1.0) done = true;
  }
}

class CAnimation<T extends App<T>> extends Comp<T> {
  List<_PropertyTween> _tweens = [];
  List<void Function()> _onCompleteCallbacks = [];

  bool _completedFired = false;

  CAnimation(super.app);

  /// Animate a single property from [from] (defaults to current value via
  /// [get] if omitted) to [to] over [duration] seconds.
  ///
  /// Calling this again for a property that's already animating overrides
  /// it, the new tween replaces the old one outright, consistent with
  /// "last call wins" rather than queueing or stacking. If you want
  /// queueing, chain a second .animate() call after onComplete instead.
  CAnimation<T> property(
    double Function() get,
    void Function(double value) set, {
    double? from,
    required double to,
    required double duration,
    double Function(double t) easing = _linear,
  }) {
    // "Override" semantics: same setter reference (by identity via a
    // wrapping key) replaces any existing tween targeting it. We key on
    // the Setter function identity rather than a string field name, since
    // that's what was actually passed in, no reflection, no magic.
    _tweens.removeWhere((tw) => tw.set == set);
    _tweens.add(.new(
      set: set,
      from: from ?? get(),
      to: to,
      duration: duration,
      easing: easing,
    ));
    _completedFired = false; // re-arm onComplete if it already fired
    return this;
  }

  /// Fires once, when ALL currently-registered tweens have finished.
  /// If you call .property() again after completion, onComplete can fire
  /// again once the new tween(s) finish too.
  CAnimation<T> onComplete(void Function() callback) {
    _onCompleteCallbacks.add(callback);
    return this;
  }

  bool get isComplete => _tweens.isNotEmpty && _tweens.every((tw) => tw.done);

  void reset() {
    for (final tw in _tweens) {
      tw.elapsed = 0;
      tw.done = false;
      tw.set(tw.from); // snap immediately to the start value
    }
    _completedFired = false;
  }

  @override
  void onPostUpdate(double dt) {
    if (_tweens.isEmpty) return;

    for (final tw in _tweens) {
      tw.tick(dt);
    }

    if (!_completedFired && isComplete) {
      _completedFired = true;
      for (final cb in _onCompleteCallbacks) {
        cb();
      }
    }
  }
  
  // clone

  @override
  CAnimation<T> createInstance() {
    final c = CAnimation<T>(app);
    c._tweens = .from(_tweens);
    c._onCompleteCallbacks = .from(_onCompleteCallbacks);
    c._completedFired = _completedFired;
    return c;
  }

  // state

  @override
  CAnimationSnapshot<T> createSnapshot() {
    final snapshot = CAnimationSnapshot<T>(namedId);
    snapshot._tweens = .from(_tweens);
    snapshot._onCompleteCallbacks = .from(_onCompleteCallbacks);
    snapshot._completedFired = _completedFired;
    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CAnimationSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    _tweens = .from(snapshot._tweens);
    _onCompleteCallbacks = .from(snapshot._onCompleteCallbacks);
    _completedFired = snapshot._completedFired;
  }

  // persistence

  static const typeId = '__comp__CAnimation';
  
  @override String get persistentTypeId => typeId;
}

class CAnimationSnapshot<T extends App<T>> extends CompSnapshot<T, CAnimation<T>> {
  late List<_PropertyTween> _tweens;
  late List<void Function()> _onCompleteCallbacks;
  late bool _completedFired;
  
  CAnimationSnapshot(super.id);

  @override
  CAnimation<T> createInstance(T app) => .new(app);
}