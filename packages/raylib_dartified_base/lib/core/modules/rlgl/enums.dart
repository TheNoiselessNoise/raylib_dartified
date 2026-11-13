part of '../../raylib_dartified_base.dart';

/// `DrawMode`
enum RlDrawMode with XEnum {
  /// `RL_NONE` (for uninitialized [RlDrawCall] slots only)
  RL_NONE(0),
  /// `RL_LINES`
  RL_LINES(0x0001),
  /// `RL_TRIANGLES`
  RL_TRIANGLES(0x0004),
  /// `RL_QUADS`
  RL_QUADS(0x0007);

  const RlDrawMode(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlDrawMode] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlDrawMode fromValue(int value) => switch (value) {
    0x0001 => RL_LINES,
    0x0004 => RL_TRIANGLES,
    0x0007 => RL_QUADS,
    _ => throw ArgumentError('Unknown value for $RlDrawMode: $value'),
  };
}

/// `ShaderType`
enum RlShaderType with XEnum {
  /// `RL_FRAGMENT_SHADER`
  RL_FRAGMENT_SHADER(0x8B30),
  /// `RL_VERTEX_SHADER`
  RL_VERTEX_SHADER(0x8B31),
  /// `RL_COMPUTE_SHADER`
  RL_COMPUTE_SHADER(0x91B9);

  const RlShaderType(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlShaderType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlShaderType fromValue(int value) => switch (value) {
    0x8B30 => RL_FRAGMENT_SHADER,
    0x8B31 => RL_VERTEX_SHADER,
    0x91B9 => RL_COMPUTE_SHADER,
    _ => throw ArgumentError('Unknown value for $RlShaderType: $value'),
  };
}

/// `UsageHint`
enum RlUsageHint with XEnum {
  /// `RL_STREAM_DRAW`
  RL_STREAM_DRAW(0x88E0),
  /// `RL_STREAM_READ`
  RL_STREAM_READ(0x88E1),
  /// `RL_STREAM_COPY`
  RL_STREAM_COPY(0x88E2),
  /// `RL_STATIC_DRAW`
  RL_STATIC_DRAW(0x88E4),
  /// `RL_STATIC_READ`
  RL_STATIC_READ(0x88E5),
  /// `RL_STATIC_COPY`
  RL_STATIC_COPY(0x88E6),
  /// `RL_DYNAMIC_DRAW`
  RL_DYNAMIC_DRAW(0x88E8),
  /// `RL_DYNAMIC_READ`
  RL_DYNAMIC_READ(0x88E9),
  /// `RL_DYNAMIC_COPY`
  RL_DYNAMIC_COPY(0x88EA);

  const RlUsageHint(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlUsageHint] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlUsageHint fromValue(int value) => switch (value) {
    0x88E0 => RL_STREAM_DRAW,
    0x88E1 => RL_STREAM_READ,
    0x88E2 => RL_STREAM_COPY,
    0x88E4 => RL_STATIC_DRAW,
    0x88E5 => RL_STATIC_READ,
    0x88E6 => RL_STATIC_COPY,
    0x88E8 => RL_DYNAMIC_DRAW,
    0x88E9 => RL_DYNAMIC_READ,
    0x88EA => RL_DYNAMIC_COPY,
    _ => throw ArgumentError('Unknown value for $RlUsageHint: $value'),
  };
}

/// `MatrixMode`
enum RlMatrixMode with XEnum {
  /// `RL_MODELVIEW`
  RL_MODELVIEW(0x1700),
  /// `RL_PROJECTION`
  RL_PROJECTION(0x1701),
  /// `RL_TEXTURE`
  RL_TEXTURE(0x1702);

  const RlMatrixMode(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlMatrixMode] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlMatrixMode fromValue(int value) => switch (value) {
    0x1700 => RL_MODELVIEW,
    0x1701 => RL_PROJECTION,
    0x1702 => RL_TEXTURE,
    _ => throw ArgumentError('Unknown value for $RlMatrixMode: $value'),
  };
}

/// `GlVersion`
enum RlGlVersion with XEnum {
  /// `RL_OPENGL_11`
  RL_OPENGL_11(1),
  /// `RL_OPENGL_21`
  RL_OPENGL_21(2),
  /// `RL_OPENGL_33`
  RL_OPENGL_33(3),
  /// `RL_OPENGL_43`
  RL_OPENGL_43(4),
  /// `RL_OPENGL_ES_20`
  RL_OPENGL_ES_20(5),
  /// `RL_OPENGL_ES_30`
  RL_OPENGL_ES_30(6);

  const RlGlVersion(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlGlVersion] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlGlVersion fromValue(int value) => switch (value) {
    1 => RL_OPENGL_11,
    2 => RL_OPENGL_21,
    3 => RL_OPENGL_33,
    4 => RL_OPENGL_43,
    5 => RL_OPENGL_ES_20,
    6 => RL_OPENGL_ES_30,
    _ => throw ArgumentError('Unknown value for $RlGlVersion: $value'),
  };
}

/// `ShaderUniformDataType`
enum RlShaderUniformDataType with XEnum {
  /// `RL_SHADER_UNIFORM_FLOAT`
  RL_SHADER_UNIFORM_FLOAT(0),
  /// `RL_SHADER_UNIFORM_VEC2`
  RL_SHADER_UNIFORM_VEC2(1),
  /// `RL_SHADER_UNIFORM_VEC3`
  RL_SHADER_UNIFORM_VEC3(2),
  /// `RL_SHADER_UNIFORM_VEC4`
  RL_SHADER_UNIFORM_VEC4(3),
  /// `RL_SHADER_UNIFORM_INT`
  RL_SHADER_UNIFORM_INT(4),
  /// `RL_SHADER_UNIFORM_IVEC2`
  RL_SHADER_UNIFORM_IVEC2(5),
  /// `RL_SHADER_UNIFORM_IVEC3`
  RL_SHADER_UNIFORM_IVEC3(6),
  /// `RL_SHADER_UNIFORM_IVEC4`
  RL_SHADER_UNIFORM_IVEC4(7),
  /// `RL_SHADER_UNIFORM_UINT`
  RL_SHADER_UNIFORM_UINT(8),
  /// `RL_SHADER_UNIFORM_UIVEC2`
  RL_SHADER_UNIFORM_UIVEC2(9),
  /// `RL_SHADER_UNIFORM_UIVEC3`
  RL_SHADER_UNIFORM_UIVEC3(10),
  /// `RL_SHADER_UNIFORM_UIVEC4`
  RL_SHADER_UNIFORM_UIVEC4(11),
  /// `RL_SHADER_UNIFORM_SAMPLER2D`
  RL_SHADER_UNIFORM_SAMPLER2D(12);

  const RlShaderUniformDataType(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlShaderUniformDataType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlShaderUniformDataType fromValue(int value) => switch (value) {
    0 => RL_SHADER_UNIFORM_FLOAT,
    1 => RL_SHADER_UNIFORM_VEC2,
    2 => RL_SHADER_UNIFORM_VEC3,
    3 => RL_SHADER_UNIFORM_VEC4,
    4 => RL_SHADER_UNIFORM_INT,
    5 => RL_SHADER_UNIFORM_IVEC2,
    6 => RL_SHADER_UNIFORM_IVEC3,
    7 => RL_SHADER_UNIFORM_IVEC4,
    8 => RL_SHADER_UNIFORM_UINT,
    9 => RL_SHADER_UNIFORM_UIVEC2,
    10 => RL_SHADER_UNIFORM_UIVEC3,
    11 => RL_SHADER_UNIFORM_UIVEC4,
    12 => RL_SHADER_UNIFORM_SAMPLER2D,
    _ => throw ArgumentError('Unknown value for $RlShaderUniformDataType: $value'),
  };
}

/// `ShaderAttributeDataType`
enum RlShaderAttributeDataType with XEnum {
  /// `RL_SHADER_ATTRIB_FLOAT`
  RL_SHADER_ATTRIB_FLOAT(0),
  /// `RL_SHADER_ATTRIB_VEC2`
  RL_SHADER_ATTRIB_VEC2(1),
  /// `RL_SHADER_ATTRIB_VEC3`
  RL_SHADER_ATTRIB_VEC3(2),
  /// `RL_SHADER_ATTRIB_VEC4`
  RL_SHADER_ATTRIB_VEC4(3);

  const RlShaderAttributeDataType(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlShaderAttributeDataType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlShaderAttributeDataType fromValue(int value) => switch (value) {
    0 => RL_SHADER_ATTRIB_FLOAT,
    1 => RL_SHADER_ATTRIB_VEC2,
    2 => RL_SHADER_ATTRIB_VEC3,
    3 => RL_SHADER_ATTRIB_VEC4,
    _ => throw ArgumentError('Unknown value for $RlShaderAttributeDataType: $value'),
  };
}

/// `FramebufferAttachType`
enum RlFramebufferAttachType with XEnum {
  /// `RL_ATTACHMENT_COLOR_CHANNEL0`
  RL_ATTACHMENT_COLOR_CHANNEL0(0),
  /// `RL_ATTACHMENT_COLOR_CHANNEL1`
  RL_ATTACHMENT_COLOR_CHANNEL1(1),
  /// `RL_ATTACHMENT_COLOR_CHANNEL2`
  RL_ATTACHMENT_COLOR_CHANNEL2(2),
  /// `RL_ATTACHMENT_COLOR_CHANNEL3`
  RL_ATTACHMENT_COLOR_CHANNEL3(3),
  /// `RL_ATTACHMENT_COLOR_CHANNEL4`
  RL_ATTACHMENT_COLOR_CHANNEL4(4),
  /// `RL_ATTACHMENT_COLOR_CHANNEL5`
  RL_ATTACHMENT_COLOR_CHANNEL5(5),
  /// `RL_ATTACHMENT_COLOR_CHANNEL6`
  RL_ATTACHMENT_COLOR_CHANNEL6(6),
  /// `RL_ATTACHMENT_COLOR_CHANNEL7`
  RL_ATTACHMENT_COLOR_CHANNEL7(7),
  /// `RL_ATTACHMENT_DEPTH`
  RL_ATTACHMENT_DEPTH(100),
  /// `RL_ATTACHMENT_STENCIL`
  RL_ATTACHMENT_STENCIL(200);

  const RlFramebufferAttachType(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlFramebufferAttachType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlFramebufferAttachType fromValue(int value) => switch (value) {
    0 => RL_ATTACHMENT_COLOR_CHANNEL0,
    1 => RL_ATTACHMENT_COLOR_CHANNEL1,
    2 => RL_ATTACHMENT_COLOR_CHANNEL2,
    3 => RL_ATTACHMENT_COLOR_CHANNEL3,
    4 => RL_ATTACHMENT_COLOR_CHANNEL4,
    5 => RL_ATTACHMENT_COLOR_CHANNEL5,
    6 => RL_ATTACHMENT_COLOR_CHANNEL6,
    7 => RL_ATTACHMENT_COLOR_CHANNEL7,
    100 => RL_ATTACHMENT_DEPTH,
    200 => RL_ATTACHMENT_STENCIL,
    _ => throw ArgumentError('Unknown value for $RlFramebufferAttachType: $value'),
  };
}

/// `FramebufferAttachTextureType`
enum RlFramebufferAttachTextureType with XEnum {
  /// `RL_ATTACHMENT_CUBEMAP_POSITIVE_X`
  RL_ATTACHMENT_CUBEMAP_POSITIVE_X(0),
  /// `RL_ATTACHMENT_CUBEMAP_NEGATIVE_X`
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_X(1),
  /// `RL_ATTACHMENT_CUBEMAP_POSITIVE_Y`
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Y(2),
  /// `RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y`
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y(3),
  /// `RL_ATTACHMENT_CUBEMAP_POSITIVE_Z`
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Z(4),
  /// `RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z`
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z(5),
  /// `RL_ATTACHMENT_TEXTURE2D`
  RL_ATTACHMENT_TEXTURE2D(100),
  /// `RL_ATTACHMENT_RENDERBUFFER`
  RL_ATTACHMENT_RENDERBUFFER(200);

  const RlFramebufferAttachTextureType(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlFramebufferAttachTextureType] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlFramebufferAttachTextureType fromValue(int value) => switch (value) {
    0 => RL_ATTACHMENT_CUBEMAP_POSITIVE_X,
    1 => RL_ATTACHMENT_CUBEMAP_NEGATIVE_X,
    2 => RL_ATTACHMENT_CUBEMAP_POSITIVE_Y,
    3 => RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y,
    4 => RL_ATTACHMENT_CUBEMAP_POSITIVE_Z,
    5 => RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z,
    100 => RL_ATTACHMENT_TEXTURE2D,
    200 => RL_ATTACHMENT_RENDERBUFFER,
    _ => throw ArgumentError('Unknown value for $RlFramebufferAttachTextureType: $value'),
  };
}

/// `CullMode`
enum RlCullMode with XEnum {
  /// `RL_CULL_FACE_FRONT`
  RL_CULL_FACE_FRONT(0),
  /// `RL_CULL_FACE_BACK`
  RL_CULL_FACE_BACK(1);

  const RlCullMode(this.value);
  
  /// The underlying native integer value.
  @override
  final int value;

  /// Returns the [RlCullMode] for the given native [value].
  ///
  /// Throws [ArgumentError] if [value] does not correspond to a known entry.
  static RlCullMode fromValue(int value) => switch (value) {
    0 => RL_CULL_FACE_FRONT,
    1 => RL_CULL_FACE_BACK,
    _ => throw ArgumentError('Unknown value for $RlCullMode: $value'),
  };
}