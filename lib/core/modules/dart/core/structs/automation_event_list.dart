part of '../../../../raylib.dart';

extension AutomationEventListCPEx on Pointer<AutomationEventListC> {
  Pointer<AutomationEventListC> setC(AutomationEventListC o) => this;
  Pointer<AutomationEventListC> setD(AutomationEventListD o) => this;
  AutomationEventListD toD() => ref.toD(this);
}

extension AutomationEventListCEx on AutomationEventListC {
  AutomationEventListC setC(AutomationEventListC o) => this;
  AutomationEventListC setD(AutomationEventListD o) => this;
  AutomationEventListD toD(Pointer<AutomationEventListC> ptr) => .new(ptr);
}

class AutomationEventListD extends StructDView<AutomationEventListD, AutomationEventListC> {
  AutomationEventListD(super.originalPointer);

  int get capacity => ref.capacity;
  int get count => ref.count;
  List<AutomationEventD> get events => .generate(count, (i) => (ref.events + i).toD());

  @override
  AutomationEventListC get ref => getOriginalPointer().ref;

  @override
  String signature() => '$structName(capacity: $capacity, count: $count)';

  @override
  AutomationEventListD clone() => .new(getOriginalPointer());
}