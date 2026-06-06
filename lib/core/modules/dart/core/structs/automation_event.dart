part of '../../../../raylib_dartified.dart';

extension AutomationEventCPEx on Pointer<AutomationEventC> {
  Pointer<AutomationEventC> setC(AutomationEventC o) { ref.setC(o); return this; }
  Pointer<AutomationEventC> setD(AutomationEventD o) { ref.setD(o); return this; }
  AutomationEventD toD() => ref.toD(this);
}

extension AutomationEventCEx on AutomationEventC {
  int get paramsCount => AutomationEventBase.BASE_paramsCount;

  AutomationEventC setC(AutomationEventC o) {
    frame = o.frame;
    type = o.type;
    for (int i = 0; i < paramsCount; i++) {
      params[i] = o.params[i];
    }
    return this;
  }

  AutomationEventC setD(AutomationEventD o) {
    frame = o.frame;
    type = o.type.value;
    for (int i = 0; i < paramsCount; i++) {
      params[i] = o.params[i];
    }
    return this;
  }

  AutomationEventD toD([Pointer<AutomationEventC>? ptr]) => .new(
    originalPointer: ptr,
    frame: frame,
    type: .fromValue(type),
    params: .generate(paramsCount, (i) => params[i]),
  );
}

class AutomationEventD extends StructD<AutomationEventC, AutomationEventD> with AutomationEventBase<AutomationEventD> {
  int _frame;
  @override get frame {
    structOnOp((p) => _frame = p.ref.frame);
    return _frame;
  }
  @override set frame(int value) {
    _frame = value;
    structOnOp((p) => p.ref.frame = value);
  }

  AutomationEventType _type;
  @override get type {
    structOnOp((p) => _type = .fromValue(p.ref.type));
    return _type;
  }
  @override set type(AutomationEventType value) {
    _type = value;
    structOnOp((p) => p.ref.type = value.value);
  }

  late NativeLiveListArrayInt _params;
  @override get params {
    structOnOp((p) => _params.ptr = p.ref.params);
    return _params;
  }
  @override set params(List<int> value) {
    assert(value.length <= paramsCount);
    structOnOp((p) => _params.ptr = p.ref.params);
    _params.inner = value;
  }

  AutomationEventD({
    super.originalPointer,
    int frame = 0,
    AutomationEventType type = .EVENT_NONE,
    List<int>? params,
  }) :
    _frame = frame,
    _type = type
  {
    _params = .new(params ?? .filled(paramsCount, 0), originalPointer?.ref.params);
  }

  factory AutomationEventD.zero() => .new();

  @override
  AutomationEventD setD(AutomationEventD o) {
    frame = o.frame;
    type = o.type;
    params = .from(o.params);
    return this;
  }

  @override
  nativeGetIndexedReference(Pointer<AutomationEventC> p, int index) => (p + index).ref;

  @override
  nativeGetIndexedArrayReference(Array<AutomationEventC> p, int index) => p[index];

  @override
  void nativeWriteInto(AutomationEventC p) {
    p.frame = frame;
    p.type = type.value;
    for (int i = 0; i < paramsCount; i++) {
      p.params[i] = _params.inner[i];
    }
  }

  @override
  void nativeReadFrom(AutomationEventC p) {
    frame = p.frame;
    type = .fromValue(p.type);
    params = .generate(paramsCount, (i) => p.params[i]);
  }

  @override
  AutomationEventD clone() => .new(
    originalPointer: originalPointer,
    frame: frame,
    type: type,
    params: .from(params),
  );
}