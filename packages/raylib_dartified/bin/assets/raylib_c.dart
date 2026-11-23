const String headerTemplate = r"""
#include <stdio.h>
""";

const String CoreTemplate = r"""
#include "raylib.h"
#define RLIGHTS_IMPLEMENTATION
#include "rlights.h"
""";

const String GuiTemplate = r"""
#define RAYGUI_IMPLEMENTATION
#include "raygui.h"
""";

const String MsfGifTemplate = r"""
#define MSF_GIF_IMPL
#include "msf_gif.h"
""";