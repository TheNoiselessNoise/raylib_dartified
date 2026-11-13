## Shader Conversion

The examples in this package require a shader category folder named `glsl300es`, which is **not** included in the original Raylib source. You'll need to create it manually alongside the existing `glsl330` folder and populate it with converted versions of the shaders your examples use.

### Steps

1. Create a `glsl300es/` folder next to `glsl330/` in your shaders directory
2. Copy the relevant `.fs` / `.vs` files from `glsl330/` into `glsl300es/`
3. Apply the changes described below

### Required Changes

**1. Version directive**
```glsl
// Before
#version 330

// After
#version 300 es
```

**2. Float precision qualifier** add this line after the version directive:
```glsl
precision mediump float;
```

**3. Integer literals in float expressions** if you encounter a compile error like:
```
wrong operand types: no operation '*'
```
find the offending integer literal and append `.0`:
```glsl
// Before
color.a * (1 - length(...) * 2)

// After
color.a * (1.0 - length(...) * 2.0)
```

### Full "Particle fade fragment shader" Example

`glsl330/particle_fade.fs`
```glsl
#version 330

uniform vec4 color;
out vec4 finalColor;

void main()
{
    finalColor = vec4(color.rgb, color.a * (1 - length(gl_PointCoord.xy - vec2(0.5))*2));
}
```

`glsl300es/particle_fade.fs`
```glsl
#version 300 es

precision mediump float;

uniform vec4 color;
out vec4 finalColor;

void main()
{
    finalColor = vec4(color.rgb, color.a * (1.0 - length(gl_PointCoord.xy - vec2(0.5))*2.0));
}
```

> In the vast majority of cases these three changes are all that's needed. GLSL ES 3.00 is otherwise largely compatible with GLSL 3.30 for the kinds of shaders Raylib examples use.