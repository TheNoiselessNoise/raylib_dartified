part of '../../../../raylib_dartified.dart';

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

class AutomationEventListD extends StructDView<AutomationEventListC, AutomationEventListD> with AutomationEventListBase<
  AutomationEventListD,
  AutomationEventD
> {
  AutomationEventListD(super.originalPointer);

  @override
  int get capacity => ref.capacity;
  
  @override
  int get count => ref.count;
  
  @override
  List<AutomationEventD> get events => .generate(count, (i) => (ref.events + i).toD());

  @override
  AutomationEventListC get ref => getOriginalPointer().ref;

  @override
  AutomationEventListD clone() => .new(getOriginalPointer());
}