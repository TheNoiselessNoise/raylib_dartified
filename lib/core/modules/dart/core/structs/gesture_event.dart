part of '../../../../raylib_dartified.dart';

extension GestureEventCPEx on Pointer<GestureEventC> {
  Pointer<GestureEventC> setC(GestureEventC o) { ref.setC(o); return this; }
  Pointer<GestureEventC> setD(GestureEventD o) { ref.setD(o); return this; }
  GestureEventD toD() => ref.toD(this);
}

extension GestureEventCEx on GestureEventC {
  int get maxTouchPoints => GestureEventBase.BASE_maxTouchPoints;

  GestureEventC setC(GestureEventC o) {
    touchAction = o.touchAction;
    pointCount = o.pointCount;
    for (int i = 0; i < maxTouchPoints; i++) {
      pointId[i] = o.pointId[i];
    }
    for (int i = 0; i < maxTouchPoints; i++) {
      position[i].setC(o.position[i]);
    }
    return this;
  }

  GestureEventC setD(GestureEventD o) {
    touchAction = o.touchAction.value;
    pointCount = o.pointCount;
    for (int i = 0; i < maxTouchPoints; i++) {
      pointId[i] = o.pointId[i];
    }
    for (int i = 0; i < maxTouchPoints; i++) {
      position[i].setD(o.position[i]);
    }
    return this;
  }

  GestureEventD toD([Pointer<GestureEventC>? ptr]) => .new(
    originalPointer: ptr,
    touchAction: .fromValue(touchAction),
    pointCount: pointCount,
    pointId: .generate(maxTouchPoints, (i) => pointId[i]),
    position: .generate(maxTouchPoints, (i) => position[i].toD()),
  );
}

class GestureEventD extends StructD<GestureEventC, GestureEventD> with GestureEventBase<
  GestureEventD,
  Vector2D,
  MatrixD,
  Vector3D,
  QuaternionD,
  Vector4D
> {
  TouchAction _touchAction;
  @override get touchAction {
    structOnOp((p) => _touchAction = .fromValue(p.ref.touchAction));
    return _touchAction;
  }
  @override set touchAction(TouchAction value) {
    _touchAction = value;
    structOnOp((p) => p.ref.touchAction = value.value);
  }

  int _pointCount;
  @override get pointCount {
    structOnOp((p) => _pointCount = p.ref.pointCount);
    return _pointCount;
  }
  @override set pointCount(int value) {
    _pointCount = value;
    structOnOp((p) => p.ref.pointCount = value);
  }

  late NativeLiveListArrayInt _pointId;
  @override get pointId {
    structOnOp((p) => _pointId.ptr = p.ref.pointId);
    return _pointId;
  }
  @override set pointId(List<int> value) {
    assert(value.length <= GestureEventBase.BASE_maxTouchPoints);
    structOnOp((p) => _pointId.ptr = p.ref.pointId);
    _pointId.inner = value;
  }

  late NativeLiveListArrayStruct<Vector2C, Vector2D> _position;
  @override get position {
    structOnOp((p) => _position.ptr = p.ref.position);
    return _position;
  }
  @override set position(List<Vector2D> value) {
    assert(value.length <= GestureEventBase.BASE_maxTouchPoints);
    structOnOp((p) => _position.ptr = p.ref.position);
    _position.inner = value;
  }

  GestureEventD({
    super.originalPointer,
    TouchAction touchAction = .TOUCH_ACTION_DOWN,
    int pointCount = 0,
    List<int>? pointId,
    List<Vector2D>? position,
  }) :
    _touchAction = touchAction,
    _pointCount = pointCount
  {
    _pointId = .new(pointId ?? .generate(GestureEventBase.BASE_maxTouchPoints, (_) => 0), originalPointer?.ref.pointId);
    _position = .new(position ?? .generate(GestureEventBase.BASE_maxTouchPoints, (_) => .zero()), originalPointer?.ref.position);
  }

  factory GestureEventD.zero() => .new();

  @override
  GestureEventD setD(GestureEventD o) {
    touchAction = o.touchAction;
    pointCount = o.pointCount;
    pointId = .from(o.pointId);
    position = .from(o.position);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<GestureEventC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<GestureEventC> p, int index) => p[index];

  @override
  void nativeWriteInto(GestureEventC p) {
    p.touchAction = touchAction.value;
    p.pointCount = pointCount;
    for (int i = 0; i < GestureEventBase.BASE_maxTouchPoints; i++) {
      pointId[i] = p.pointId[i];
    }
    for (int i = 0; i < GestureEventBase.BASE_maxTouchPoints; i++) {
      position[i].nativeWriteInto(p.position[i]);
    }
  }

  @override
  void nativeReadFrom(GestureEventC p) {
    structOnOp((o) {
      o.ref.pointId = p.pointId;
      o.ref.position = p.position;
    });
    touchAction = .fromValue(p.touchAction);
    pointCount = p.pointCount;
    pointId = .generate(GestureEventBase.BASE_maxTouchPoints, (i) => p.pointId[i]);
    position = .generate(GestureEventBase.BASE_maxTouchPoints, (i) => p.position[i].toD());
  }

  @override
  GestureEventD clone() => .new(
    originalPointer: originalPointer,
    touchAction: touchAction,
    pointCount: pointCount,
    pointId: .from(pointId),
    position: .from(position),
  );
}