## 6.0.4

- update pub.dev example
- cleanup

## 6.0.3

- fix `Mesh`
- [BREAKING] rename structs by removing the suffix "D"

## 6.0.2

- `currentMemoryPlatform` is now more descriptive
- fixed `XPtr.cast`
- some docs for codecs
- add new types ssize, intptr, uintptr, ptrdiff, long, unsigned long, long long, unsigned long long

## 6.0.1

- Fixed `XPtr<XBool>` extension.
- Fixed RaylibStruct `op` preservation.
- Fixed module naming.

## 6.0.0

- [BREAKING] Unified `XPtr<X extends XType>` abstraction replacing per-backend pointer handling
- [BREAKING] Unified struct definitions via `StructLayout`
- [BREAKING] Unified allocators

## 5.5.4

- [BREAKING] Rename `RefOrNull<X>` of a struct allocator

## 5.5.3

- Relax meta version constraint to be compatible with Flutter SDK

## 5.5.2

- Proper documentation
- Added enum `AutomationEventType`
- `AutomationEventBase.type` is now type `AutomationEventType` instead of `int`
- `RlDrawCallBase.mode` is now type `RlDrawMode` instead of `int`
- Added missing `UnloadDirectoryFiles` into `core` module
- Fix `GuiListView` and `GuiListViewEx`

## 5.5.1

- pub.dev revalidation

## 5.5.0

- Initial version.
