part of '../../raylib_dartified_unhinged.dart';

class FShake<T extends App<T>> extends FWidget<T> {  
  bool autoStart;

  FShake(super.app, {
    this.autoStart = true,
    required FWidget<T> child,
  }) : super(child: child);

  late final _shake = createController(
    duration: 0.5,
    onFrame: (t, elapsed) => child!.localOffset = .vec2(
      math.sin(elapsed * 40) * (1.0 - t) * 8,
      0,
    ),
    onComplete: () => child!.localOffset = .vec2(0, 0),
  );

  void shake({double duration = 0.5}) {
    _shake.duration = duration;
    _shake.forward();
  }

  @override
  void onAdd(ECSBase<T> parent) {
    super.onAdd(parent);
    if (autoStart) shake();
  }

  @override
  FWidget<T> build() => child!;

  @override
  FShake<T> createInstance() => .new(app, child: child!);

  @override
  void cloneWidgetInto(FWidget<T> copy) {
    if (copy is! FShake<T>) return;
    // nothing
  }
}