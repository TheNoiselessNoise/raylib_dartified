part of '../../../../raylib.dart';

extension AutomationEventCLike on AutomationEventC {
  int get paramCount => 4;
}

extension AutomationEventDLike on AutomationEventD {
  int get paramCount => 4;
}

extension AutomationEventCPEx on Pointer<AutomationEventC> {
  Pointer<AutomationEventC> setC(AutomationEventC o) {
    ref.setC(o);
    return this;
  }

  Pointer<AutomationEventC> setD(AutomationEventD o) {
    ref.setD(o);
    return this;
  }

  AutomationEventD toD() => ref.toD(this);
}

extension AutomationEventCEx on AutomationEventC {
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

class AutomationEventD extends StructD<AutomationEventD, AutomationEventC> {
  int frame;
  int type;
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
    originalPointer ??= o.originalPointer;
    frame = o.frame;
    type = o.type;
    params = .from(o.params);
    return this;
  }

  @override
  Pointer<AutomationEventC> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => throw UnsupportedError('FAutomationEventD: is raylib-owned; cannot allocate externally.');

  @override
  void syncInto(RaylibTemp temp, Pointer<AutomationEventC> p, String key) {} // NOTE: do nothing

  @override
  void allocateInto(RaylibTemp temp, Pointer<AutomationEventC> p, String key)
    => throw UnsupportedError('FAutomationEventD: is raylib-owned; cannot allocate externally.');

  @override
  void writeInto(AutomationEventC p)
    => throw UnsupportedError('FAutomationEventD: is raylib-owned; cannot write externally.');

  @override
  String signature() => '$structName(frame: $frame, type: $type, params: $params)';

  @override
  AutomationEventD clone() => .new(
    originalPointer: originalPointer,
    frame: frame,
    type: type,
    params: .from(params),
  );
}