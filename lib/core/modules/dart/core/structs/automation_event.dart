part of '../../../../raylib_dartified.dart';

extension AutomationEventCPEx on Pointer<AutomationEventC> {
  Pointer<AutomationEventC> setC(AutomationEventC o) { ref.setC(o); return this; }
  Pointer<AutomationEventC> setD(AutomationEventD o) { ref.setD(o); return this; }
  AutomationEventD toD() => ref.toD(this);
}

extension AutomationEventCEx on AutomationEventC {
  int get paramCount => AutomationEventBase.BASE_paramCount;

  AutomationEventC setC(AutomationEventC o) {
    frame = o.frame;
    type = o.type;
    for (int i = 0; i < paramCount; i++) {
      params[i] = o.params[i];
    }
    return this;
  }

  AutomationEventC setD(AutomationEventD o) {
    frame = o.frame;
    type = o.type;
    for (int i = 0; i < paramCount; i++) {
      params[i] = o.params[i];
    }
    return this;
  }

  AutomationEventD toD([Pointer<AutomationEventC>? ptr]) => .new(
    originalPointer: ptr,
    frame: frame,
    type: type,
    params: .generate(paramCount, (i) => params[i]),
  );
}

class AutomationEventD extends StructD<AutomationEventC, AutomationEventD> with AutomationEventBase<AutomationEventD> {
  @override
  int frame;

  @override
  int type;

  @override
  late List<int> params;

  AutomationEventD({
    super.originalPointer,
    this.frame = 0,
    this.type = 0,
    List<int>? params,
  }) {
    this.params = params ?? .filled(paramCount, 0);
  }

  factory AutomationEventD.zero() => .new();

  @override
  AutomationEventD setC(AutomationEventC o) {
    frame = o.frame;
    type = o.type;
    params = .generate(paramCount, (i) => o.params[i]);
    return this;
  }

  @override
  AutomationEventD setD(AutomationEventD o) {
    frame = o.frame;
    type = o.type;
    params = .from(o.params);
    return this;
  }

  @override
  getReference(Pointer<AutomationEventC> p) => p.ref;

  @override
  void structSyncInto(RaylibTemp temp, Pointer<AutomationEventC> p, String key) {} // NOTE: do nothing

  @override
  void nativeWriteInto(AutomationEventC p)
    => throw UnsupportedError('AutomationEventD: is raylib-owned; cannot write externally.');

  @override
  AutomationEventD clone() => .new(
    originalPointer: originalPointer,
    frame: frame,
    type: type,
    params: .from(params),
  );
}