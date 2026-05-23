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
    type = o.type;
    for (int i = 0; i < paramsCount; i++) {
      params[i] = o.params[i];
    }
    return this;
  }

  AutomationEventD toD([Pointer<AutomationEventC>? ptr]) => .new(
    originalPointer: ptr,
    frame: frame,
    type: type,
    params: .generate(paramsCount, (i) => params[i]),
  );
}

class AutomationEventD extends StructD<AutomationEventC, AutomationEventD> with AutomationEventBase<AutomationEventD> {
  int _frame;
  @override get frame {
    structOnOriginalPointer((p) => _frame = p.ref.frame);
    return _frame;
  }
  @override set frame(int value) {
    _frame = value;
    structOnOriginalPointer((p) => p.ref.frame = value);
  }

  int _type;
  @override get type {
    structOnOriginalPointer((p) => _type = p.ref.type);
    return _type;
  }
  @override set type(int value) {
    _type = value;
    structOnOriginalPointer((p) => p.ref.type = value);
  }

  late NativeLiveListArrayInt _params;
  @override get params {
    structOnOriginalPointer((p) => _params.ptr = p.ref.params);
    return _params;
  }
  @override set params(List<int> value) {
    assert(value.length <= paramsCount);
    structOnOriginalPointer((p) => _params.ptr = p.ref.params);
    _params.inner = value;
  }

  AutomationEventD({
    super.originalPointer,
    int frame = 0,
    int type = 0,
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
  void structSyncInto(RaylibTemp temp, Pointer<AutomationEventC> p, String key) {} // NOTE: do nothing

  @override
  void nativeWriteInto(AutomationEventC p) {
    p.frame = frame;
    p.type = type;
    for (int i = 0; i < paramsCount; i++) {
      p.params[i] = _params.inner[i];
    }
  }

  @override
  void nativeReadFrom(AutomationEventC p) {
    frame = p.frame;
    type = p.type;
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