import 'package:raylib_dartified_base/raylib_dartified_base.dart';

// Exports everything that can be shared across Dart and Flat layers.

RaylibBase get _rl => RaylibBase.instance;

/// See [XTemp.structAlloc].
XStructAlloc<D> structAllocator<D extends XStruct<D>>()
  => XTemp.instance.structAlloc<D>();

/// See [XTemp.structAllocUntyped].
XStructAlloc structAllocatorUntyped(Object type)
  => XTemp.instance.structAllocUntyped(type);

/// See [XTemp.scalarAlloc].
XScalarAlloc scalarAllocator<R extends XType>([Object? type])
  => XTemp.instance.scalarAlloc<R>(type);

/// See [XStructTypes.of].
XStructType<D> structType<D extends XStruct<D>>()
  => XStructTypes.of<D>();

/// See [XStructTypes.ofUntyped].
XStructType structTypeUntyped(Object type)
  => XStructTypes.ofUntyped(type);

/// See [RaylibBase.rand].
double rand() => _rl.rand();

/// See [RaylibBase.randC].
double randC() => _rl.randC();

/// See [XUtils.realloc].
XPtr<XVoid> realloc(XPtr oldPtr, int oldSize, int newSize)
  => XUtils.realloc(oldPtr, oldSize, newSize);

/// See [XUtils.memset].
void memset(XPtr ptr, int value, int size)
  => XUtils.memset(ptr, value, size);

/// See [XUtils.memcpy].
void memcpy(XPtr dest, XPtr src, int n)
  => XUtils.memcpy(dest, src, n);

/// See [XUtils.memcmp].
int memcmp(XPtr a, XPtr b, int n)
  => XUtils.memcmp(a, b, n);

/// See [XUtils.strlen].
int strlen(XPtr ptr)
  => XUtils.strlen(ptr);

/// See [XUtils.strnlen].
int strnlen(XPtr ptr, int maxLen)
  => XUtils.strnlen(ptr, maxLen);

/// See [XUtils.strcmp].
int strcmp(XPtr a, XPtr b)
  => XUtils.strcmp(a, b);

/// See [XUtils.strcpy].
void strcpy(XPtr dest, XPtr src)
  => XUtils.strcpy(dest, src);

/// See [XUtils.strncpy].
void strncpy(XPtr dest, XPtr src, int n)
  => XUtils.strncpy(dest, src, n);

/// See [XUtils.strncat].
void strncat(XPtr dest, XPtr src, int n)
  => XUtils.strncat(dest, src, n);

/// See [XUtils.strstr].
XPtr<XVoid> strstr(XPtr haystack, XPtr needle)
  => XUtils.strstr(haystack, needle);

extension StringToRaylibC on String {
  XPtr<XChar> get toC => XTemp.instance.String$.Value(this);
}

Color get LIGHTGRAY => .LIGHTGRAY;
Color get GRAY => .GRAY;
Color get DARKGRAY => .DARKGRAY;
Color get YELLOW => .YELLOW;
Color get GOLD => .GOLD;
Color get ORANGE => .ORANGE;
Color get PINK => .PINK;
Color get RED => .RED;
Color get MAROON => .MAROON;
Color get GREEN => .GREEN;
Color get LIME => .LIME;
Color get DARKGREEN => .DARKGREEN;
Color get SKYBLUE => .SKYBLUE;
Color get BLUE => .BLUE;
Color get DARKBLUE => .DARKBLUE;
Color get PURPLE => .PURPLE;
Color get VIOLET => .VIOLET;
Color get DARKPURPLE => .DARKPURPLE;
Color get BEIGE => .BEIGE;
Color get BROWN => .BROWN;
Color get DARKBROWN => .DARKBROWN;
Color get WHITE => .WHITE;
Color get BLACK => .BLACK;
Color get BLANK => .BLANK;
Color get MAGENTA => .MAGENTA;
Color get RAYWHITE => .RAYWHITE;
Color get TRANSPARENT => .TRANSPARENT;