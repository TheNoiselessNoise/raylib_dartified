part of '../../raylib_dartified.dart';

/// Re-exports [RaylibRlglConstants] values as instance members,
/// so constants are accessible directly on the module without a class qualifier.
mixin RaylibRlglModuleExtras on XPackageModule<Raylib> {

  /// See [RaylibRlglConstants.RLGL_VERSION].
  String get RLGL_VERSION => RaylibRlglConstants.RLGL_VERSION;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFER_ELEMENTS].
  int get RL_DEFAULT_BATCH_BUFFER_ELEMENTS => RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFER_ELEMENTS;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFERS].
  int get RL_DEFAULT_BATCH_BUFFERS => RaylibRlglConstants.RL_DEFAULT_BATCH_BUFFERS;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_BATCH_DRAWCALLS].
  int get RL_DEFAULT_BATCH_DRAWCALLS => RaylibRlglConstants.RL_DEFAULT_BATCH_DRAWCALLS;
  
  /// See [RaylibRlglConstants.RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS].
  int get RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS => RaylibRlglConstants.RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS;
  
  /// See [RaylibRlglConstants.RL_MAX_MATRIX_STACK_SIZE].
  int get RL_MAX_MATRIX_STACK_SIZE => RaylibRlglConstants.RL_MAX_MATRIX_STACK_SIZE;
  
  /// See [RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS].
  int get RL_MAX_SHADER_LOCATIONS => RaylibRlglConstants.RL_MAX_SHADER_LOCATIONS;
  
  /// See [RaylibRlglConstants.RL_CULL_DISTANCE_NEAR].
  double get RL_CULL_DISTANCE_NEAR => RaylibRlglConstants.RL_CULL_DISTANCE_NEAR;
  
  /// See [RaylibRlglConstants.RL_CULL_DISTANCE_FAR].
  double get RL_CULL_DISTANCE_FAR => RaylibRlglConstants.RL_CULL_DISTANCE_FAR;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_S].
  int get RL_TEXTURE_WRAP_S => RaylibRlglConstants.RL_TEXTURE_WRAP_S;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_T].
  int get RL_TEXTURE_WRAP_T => RaylibRlglConstants.RL_TEXTURE_WRAP_T;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_MAG_FILTER].
  int get RL_TEXTURE_MAG_FILTER => RaylibRlglConstants.RL_TEXTURE_MAG_FILTER;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_MIN_FILTER].
  int get RL_TEXTURE_MIN_FILTER => RaylibRlglConstants.RL_TEXTURE_MIN_FILTER;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST].
  int get RL_TEXTURE_FILTER_NEAREST => RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR].
  int get RL_TEXTURE_FILTER_LINEAR => RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_NEAREST].
  int get RL_TEXTURE_FILTER_MIP_NEAREST => RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_NEAREST;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR].
  int get RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR => RaylibRlglConstants.RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST].
  int get RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST => RaylibRlglConstants.RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_LINEAR].
  int get RL_TEXTURE_FILTER_MIP_LINEAR => RaylibRlglConstants.RL_TEXTURE_FILTER_MIP_LINEAR;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_FILTER_ANISOTROPIC].
  int get RL_TEXTURE_FILTER_ANISOTROPIC => RaylibRlglConstants.RL_TEXTURE_FILTER_ANISOTROPIC;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_MIPMAP_BIAS_RATIO].
  int get RL_TEXTURE_MIPMAP_BIAS_RATIO => RaylibRlglConstants.RL_TEXTURE_MIPMAP_BIAS_RATIO;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_REPEAT].
  int get RL_TEXTURE_WRAP_REPEAT => RaylibRlglConstants.RL_TEXTURE_WRAP_REPEAT;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_CLAMP].
  int get RL_TEXTURE_WRAP_CLAMP => RaylibRlglConstants.RL_TEXTURE_WRAP_CLAMP;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_REPEAT].
  int get RL_TEXTURE_WRAP_MIRROR_REPEAT => RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_REPEAT;
  
  /// See [RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_CLAMP].
  int get RL_TEXTURE_WRAP_MIRROR_CLAMP => RaylibRlglConstants.RL_TEXTURE_WRAP_MIRROR_CLAMP;
  
  /// See [RaylibRlglConstants.RL_MODELVIEW].
  int get RL_MODELVIEW => RaylibRlglConstants.RL_MODELVIEW;
  
  /// See [RaylibRlglConstants.RL_PROJECTION].
  int get RL_PROJECTION => RaylibRlglConstants.RL_PROJECTION;
  
  /// See [RaylibRlglConstants.RL_TEXTURE].
  int get RL_TEXTURE => RaylibRlglConstants.RL_TEXTURE;
  
  /// See [RaylibRlglConstants.RL_LINES].
  int get RL_LINES => RaylibRlglConstants.RL_LINES;
  
  /// See [RaylibRlglConstants.RL_TRIANGLES].
  int get RL_TRIANGLES => RaylibRlglConstants.RL_TRIANGLES;
  
  /// See [RaylibRlglConstants.RL_QUADS].
  int get RL_QUADS => RaylibRlglConstants.RL_QUADS;
  
  /// See [RaylibRlglConstants.RL_UNSIGNED_BYTE].
  int get RL_UNSIGNED_BYTE => RaylibRlglConstants.RL_UNSIGNED_BYTE;
  
  /// See [RaylibRlglConstants.RL_FLOAT].
  int get RL_FLOAT => RaylibRlglConstants.RL_FLOAT;
  
  /// See [RaylibRlglConstants.RL_STREAM_DRAW].
  int get RL_STREAM_DRAW => RaylibRlglConstants.RL_STREAM_DRAW;
  
  /// See [RaylibRlglConstants.RL_STREAM_READ].
  int get RL_STREAM_READ => RaylibRlglConstants.RL_STREAM_READ;
  
  /// See [RaylibRlglConstants.RL_STREAM_COPY].
  int get RL_STREAM_COPY => RaylibRlglConstants.RL_STREAM_COPY;
  
  /// See [RaylibRlglConstants.RL_STATIC_DRAW].
  int get RL_STATIC_DRAW => RaylibRlglConstants.RL_STATIC_DRAW;
  
  /// See [RaylibRlglConstants.RL_STATIC_READ].
  int get RL_STATIC_READ => RaylibRlglConstants.RL_STATIC_READ;
  
  /// See [RaylibRlglConstants.RL_STATIC_COPY].
  int get RL_STATIC_COPY => RaylibRlglConstants.RL_STATIC_COPY;
  
  /// See [RaylibRlglConstants.RL_DYNAMIC_DRAW].
  int get RL_DYNAMIC_DRAW => RaylibRlglConstants.RL_DYNAMIC_DRAW;
  
  /// See [RaylibRlglConstants.RL_DYNAMIC_READ].
  int get RL_DYNAMIC_READ => RaylibRlglConstants.RL_DYNAMIC_READ;
  
  /// See [RaylibRlglConstants.RL_DYNAMIC_COPY].
  int get RL_DYNAMIC_COPY => RaylibRlglConstants.RL_DYNAMIC_COPY;
  
  /// See [RaylibRlglConstants.RL_FRAGMENT_SHADER].
  int get RL_FRAGMENT_SHADER => RaylibRlglConstants.RL_FRAGMENT_SHADER;
  
  /// See [RaylibRlglConstants.RL_VERTEX_SHADER].
  int get RL_VERTEX_SHADER => RaylibRlglConstants.RL_VERTEX_SHADER;
  
  /// See [RaylibRlglConstants.RL_COMPUTE_SHADER].
  int get RL_COMPUTE_SHADER => RaylibRlglConstants.RL_COMPUTE_SHADER;
  
  /// See [RaylibRlglConstants.RL_ZERO].
  int get RL_ZERO => RaylibRlglConstants.RL_ZERO;
  
  /// See [RaylibRlglConstants.RL_ONE].
  int get RL_ONE => RaylibRlglConstants.RL_ONE;
  
  /// See [RaylibRlglConstants.RL_SRC_COLOR].
  int get RL_SRC_COLOR => RaylibRlglConstants.RL_SRC_COLOR;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_SRC_COLOR].
  int get RL_ONE_MINUS_SRC_COLOR => RaylibRlglConstants.RL_ONE_MINUS_SRC_COLOR;
  
  /// See [RaylibRlglConstants.RL_SRC_ALPHA].
  int get RL_SRC_ALPHA => RaylibRlglConstants.RL_SRC_ALPHA;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_SRC_ALPHA].
  int get RL_ONE_MINUS_SRC_ALPHA => RaylibRlglConstants.RL_ONE_MINUS_SRC_ALPHA;
  
  /// See [RaylibRlglConstants.RL_DST_ALPHA].
  int get RL_DST_ALPHA => RaylibRlglConstants.RL_DST_ALPHA;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_DST_ALPHA].
  int get RL_ONE_MINUS_DST_ALPHA => RaylibRlglConstants.RL_ONE_MINUS_DST_ALPHA;
  
  /// See [RaylibRlglConstants.RL_DST_COLOR].
  int get RL_DST_COLOR => RaylibRlglConstants.RL_DST_COLOR;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_DST_COLOR].
  int get RL_ONE_MINUS_DST_COLOR => RaylibRlglConstants.RL_ONE_MINUS_DST_COLOR;
  
  /// See [RaylibRlglConstants.RL_SRC_ALPHA_SATURATE].
  int get RL_SRC_ALPHA_SATURATE => RaylibRlglConstants.RL_SRC_ALPHA_SATURATE;
  
  /// See [RaylibRlglConstants.RL_CONSTANT_COLOR].
  int get RL_CONSTANT_COLOR => RaylibRlglConstants.RL_CONSTANT_COLOR;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_COLOR].
  int get RL_ONE_MINUS_CONSTANT_COLOR => RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_COLOR;
  
  /// See [RaylibRlglConstants.RL_CONSTANT_ALPHA].
  int get RL_CONSTANT_ALPHA => RaylibRlglConstants.RL_CONSTANT_ALPHA;
  
  /// See [RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_ALPHA].
  int get RL_ONE_MINUS_CONSTANT_ALPHA => RaylibRlglConstants.RL_ONE_MINUS_CONSTANT_ALPHA;
  
  /// See [RaylibRlglConstants.RL_FUNC_ADD].
  int get RL_FUNC_ADD => RaylibRlglConstants.RL_FUNC_ADD;
  
  /// See [RaylibRlglConstants.RL_MIN].
  int get RL_MIN => RaylibRlglConstants.RL_MIN;
  
  /// See [RaylibRlglConstants.RL_MAX].
  int get RL_MAX => RaylibRlglConstants.RL_MAX;
  
  /// See [RaylibRlglConstants.RL_FUNC_SUBTRACT].
  int get RL_FUNC_SUBTRACT => RaylibRlglConstants.RL_FUNC_SUBTRACT;
  
  /// See [RaylibRlglConstants.RL_FUNC_REVERSE_SUBTRACT].
  int get RL_FUNC_REVERSE_SUBTRACT => RaylibRlglConstants.RL_FUNC_REVERSE_SUBTRACT;
  
  /// See [RaylibRlglConstants.RL_BLEND_EQUATION].
  int get RL_BLEND_EQUATION => RaylibRlglConstants.RL_BLEND_EQUATION;
  
  /// See [RaylibRlglConstants.RL_BLEND_EQUATION_RGB].
  int get RL_BLEND_EQUATION_RGB => RaylibRlglConstants.RL_BLEND_EQUATION_RGB;
  
  /// See [RaylibRlglConstants.RL_BLEND_EQUATION_ALPHA].
  int get RL_BLEND_EQUATION_ALPHA => RaylibRlglConstants.RL_BLEND_EQUATION_ALPHA;
  
  /// See [RaylibRlglConstants.RL_BLEND_DST_RGB].
  int get RL_BLEND_DST_RGB => RaylibRlglConstants.RL_BLEND_DST_RGB;
  
  /// See [RaylibRlglConstants.RL_BLEND_SRC_RGB].
  int get RL_BLEND_SRC_RGB => RaylibRlglConstants.RL_BLEND_SRC_RGB;
  
  /// See [RaylibRlglConstants.RL_BLEND_DST_ALPHA].
  int get RL_BLEND_DST_ALPHA => RaylibRlglConstants.RL_BLEND_DST_ALPHA;
  
  /// See [RaylibRlglConstants.RL_BLEND_SRC_ALPHA].
  int get RL_BLEND_SRC_ALPHA => RaylibRlglConstants.RL_BLEND_SRC_ALPHA;
  
  /// See [RaylibRlglConstants.RL_BLEND_COLOR].
  int get RL_BLEND_COLOR => RaylibRlglConstants.RL_BLEND_COLOR;
  
  /// See [RaylibRlglConstants.RL_READ_FRAMEBUFFER].
  int get RL_READ_FRAMEBUFFER => RaylibRlglConstants.RL_READ_FRAMEBUFFER;
  
  /// See [RaylibRlglConstants.RL_DRAW_FRAMEBUFFER].
  int get RL_DRAW_FRAMEBUFFER => RaylibRlglConstants.RL_DRAW_FRAMEBUFFER;
  
  /// See [RaylibRlglConstants.RL_SHADER_LOC_MAP_DIFFUSE].
  int get RL_SHADER_LOC_MAP_DIFFUSE => RaylibRlglConstants.RL_SHADER_LOC_MAP_DIFFUSE;
  
  /// See [RaylibRlglConstants.RL_SHADER_LOC_MAP_SPECULAR].
  int get RL_SHADER_LOC_MAP_SPECULAR => RaylibRlglConstants.RL_SHADER_LOC_MAP_SPECULAR;
  
}

/// Backend-agnostic contract for the Raylib Rlgl module.
///
/// Concrete platform implementations extend this to provide
/// the full API surface across different backends.
abstract class RaylibRlglFlat extends XPackageModule<Raylib> with RaylibRlglModuleExtras {

  /// Capture ID generator for pointer slots allocated by this module.
  final RaylibCaptureIds = _RaylibRlglDartCaptureIds();

  RaylibRlglFlat(super.pkg);

  /// Choose the current matrix to be transformed
  void rlMatrixMode(
    int mode,
  );

  /// Push the current matrix to stack
  void rlPushMatrix();

  /// Pop latest inserted matrix from stack
  void rlPopMatrix();

  /// Reset current matrix to identity matrix
  void rlLoadIdentity();

  /// Multiply the current matrix by a translation matrix
  void rlTranslatef(
    double x,
    double y,
    double z,
  );

  /// Multiply the current matrix by a rotation matrix
  void rlRotatef(
    double angle,
    double x,
    double y,
    double z,
  );

  /// Multiply the current matrix by a scaling matrix
  void rlScalef(
    double x,
    double y,
    double z,
  );

  /// Multiply the current matrix by another matrix
  void rlMultMatrixf(
    XPtr<XFloat32> matf, 
  );

  /// Multiply the current matrix by a perspective matrix generated by parameters
  void rlFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double znear,
    double zfar,
  );

  /// Multiply the current matrix by an orthographic matrix generated by parameters
  void rlOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double znear,
    double zfar,
  );

  /// Set the viewport area
  void rlViewport(
    int x,
    int y,
    int width,
    int height,
  );

  /// Set clip planes distances
  void rlSetClipPlanes(
    double nearPlane,
    double farPlane,
  );

  /// Get cull plane distance near
  double rlGetCullDistanceNear();

  /// Get cull plane distance far
  double rlGetCullDistanceFar();

  /// Initialize drawing mode (how to organize vertex)
  void rlBegin(
    int mode,
  );

  /// Finish vertex providing
  void rlEnd();

  /// Define one vertex (position) - 2 int
  void rlVertex2i(
    int x,
    int y,
  );

  /// Define one vertex (position) - 2 float
  void rlVertex2f(
    double x,
    double y,
  );

  /// Define one vertex (position) - 3 float
  void rlVertex3f(
    double x,
    double y,
    double z
  );

  /// Define one vertex (texture coordinate) - 2 float
  void rlTexCoord2f(
    double x,
    double y,
  );

  /// Define one vertex (normal) - 3 float
  void rlNormal3f(
    double x,
    double y,
    double z,
  );

  /// Define one vertex (color) - 4 byte
  void rlColor4ub(
    int r,
    int g,
    int b,
    int a,
  );

  /// Define one vertex (color) - 3 float
  void rlColor3f(
    double x,
    double y,
    double z,
  );

  /// Define one vertex (color) - 4 float
  void rlColor4f(
    double x,
    double y,
    double z,
    double w,
  );

  /// Enable vertex array (VAO, if supported)
  bool rlEnableVertexArray(
    int vaoId,
  );

  /// Disable vertex array (VAO, if supported)
  void rlDisableVertexArray();

  /// Enable vertex buffer (VBO)
  void rlEnableVertexBuffer(
    int id,
  );

  /// Disable vertex buffer (VBO)
  void rlDisableVertexBuffer();

  /// Enable vertex buffer element (VBO element)
  void rlEnableVertexBufferElement(
    int id,
  );

  /// Disable vertex buffer element (VBO element)
  void rlDisableVertexBufferElement();

  /// Enable vertex attribute index
  void rlEnableVertexAttribute(
    int index,
  );

  /// Disable vertex attribute index
  void rlDisableVertexAttribute(
    int index,
  );

  /// Enable attribute state pointer
  void rlEnableStatePointer(
    int vertexAttribType,
    XPtr<XVoid> buffer,
  );

  /// Disable attribute state pointer
  void rlDisableStatePointer(
    int vertexAttribType,
  );

  /// Select and active a texture slot
  void rlActiveTextureSlot(
    int slot,
  );

  /// Enable texture
  void rlEnableTexture(
    int id,
  );

  /// Disable texture
  void rlDisableTexture();

  /// Enable texture cubemap
  void rlEnableTextureCubemap(
    int id,
  );

  /// Disable texture cubemap
  void rlDisableTextureCubemap();

  /// Set texture parameters (filter, wrap)
  void rlTextureParameters(
    int id,
    int param,
    int value,
  );

  /// Set cubemap parameters (filter, wrap)
  void rlCubemapParameters(
    int id,
    int param,
    int value,
  );

  /// Enable shader program
  void rlEnableShader(
    int id,
  );

  /// Disable shader program
  void rlDisableShader();

  /// Enable render texture (fbo)
  void rlEnableFramebuffer(
    int id,
  );

  /// Disable render texture (fbo), return to default framebuffer
  void rlDisableFramebuffer();

  /// Get the currently active render texture (fbo), 0 for default framebuffer
  int rlGetActiveFramebuffer();

  /// Activate multiple draw color buffers
  void rlActiveDrawBuffers(
    int count,
  );

  /// Blit active framebuffer to main framebuffer
  void rlBlitFramebuffer(
    int srcX,
    int srcY,
    int srcWidth,
    int srcHeight,
    int dstX,
    int dstY,
    int dstWidth,
    int dstHeight,
    int bufferMask,
  );

  /// Bind framebuffer (FBO)
  void rlBindFramebuffer(
    int target,
    int framebuffer,
  );

  /// Enable color blending
  void rlEnableColorBlend();

  /// Disable color blending
  void rlDisableColorBlend();

  /// Enable depth test
  void rlEnableDepthTest();

  /// Disable depth test
  void rlDisableDepthTest();

  /// Enable depth write
  void rlEnableDepthMask();

  /// Disable depth write
  void rlDisableDepthMask();

  /// Enable backface culling
  void rlEnableBackfaceCulling();

  /// Disable backface culling
  void rlDisableBackfaceCulling();

  /// Color mask control
  void rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  );

  /// Set face culling mode
  void rlSetCullFace(
    int mode,
  );

  /// Enable scissor test
  void rlEnableScissorTest();

  /// Disable scissor test
  void rlDisableScissorTest();

  /// Scissor test
  void rlScissor(
    int x,
    int y,
    int width,
    int height,
  );

  /// Enable point mode
  void rlEnablePointMode();

  /// Disable point mode
  void rlDisablePointMode();

  /// Set the point drawing size
  void rlSetPointSize(
    double size,
  );

  /// Get the point drawing size
  double rlGetPointSize();

  /// Enable wire mode
  void rlEnableWireMode();

  /// Disable wire mode
  void rlDisableWireMode();

  /// Set the line drawing width
  void rlSetLineWidth(
    double width,
  );

  /// Get the line drawing width
  double rlGetLineWidth();

  /// Enable line aliasing
  void rlEnableSmoothLines();

  /// Disable line aliasing
  void rlDisableSmoothLines();

  /// Enable stereo rendering
  void rlEnableStereoRender();

  /// Disable stereo rendering
  void rlDisableStereoRender();

  /// Check if stereo render is enabled
  bool rlIsStereoRenderEnabled();

  /// Clear color buffer with color
  void rlClearColor(
    int r,
    int g,
    int b,
    int a,
  );

  /// Clear used screen buffers (color and depth)
  void rlClearScreenBuffers();

  /// Check and log OpenGL error codes
  void rlCheckErrors();

  /// Set blending mode
  void rlSetBlendMode(
    int mode,
  );

  /// Set blending mode factor and equation (using OpenGL factors)
  void rlSetBlendFactors(
    int glSrcFactor,
    int glDstFactor,
    int glEquation,
  );

  /// Set blending mode factors and equations separately (using OpenGL factors)
  void rlSetBlendFactorsSeparate(
    int glSrcRGB,
    int glDstRGB,
    int glSrcAlpha,
    int glDstAlpha,
    int glEqRGB,
    int glEqAlpha,
  );

  /// Initialize rlgl (buffers, shaders, textures, states)
  void rlglInit(
    int width,
    int height,
  );

  /// De-initialize rlgl (buffers, shaders, textures)
  void rlglClose();

  /// Load OpenGL extensions (loader function required)
  void rlLoadExtensions(
    XPtr<XVoid> loader,
  );

  /// Get OpenGL procedure address
  XPtr<XVoid> rlGetProcAddress(
    XPtr<XChar> procName,
  );

  /// Get current OpenGL version
  int rlGetVersion();

  /// Set current framebuffer width
  void rlSetFramebufferWidth(
    int width,
  );

  /// Get default framebuffer width
  int rlGetFramebufferWidth();

  /// Set current framebuffer height
  void rlSetFramebufferHeight(
    int height,
  );

  /// Get default framebuffer height
  int rlGetFramebufferHeight();

  /// Get default texture id
  int rlGetTextureIdDefault();

  /// Get default shader id
  int rlGetShaderIdDefault();

  /// Get default shader locations
  XPtr<XInt> rlGetShaderLocsDefault();

  /// Load a render batch system
  RlRenderBatch rlLoadRenderBatch(
    int numBuffers,
    int bufferElements,
  );

  /// Unload render batch system
  void rlUnloadRenderBatch(
    RlRenderBatch batch,
  );

  /// Draw render batch data (Update->Draw->Reset)
  void rlDrawRenderBatch(
    XStructPtr<RlRenderBatch> batch,
  );

  /// Set the active render batch for rlgl (NULL for default internal)
  void rlSetRenderBatchActive(
    XStructPtr<RlRenderBatch> batch,
  );

  /// Update and draw internal render batch
  void rlDrawRenderBatchActive();

  /// Check internal buffer overflow for a given number of vertex
  bool rlCheckRenderBatchLimit(
    int vCount,
  );

  /// Set current texture for render batch and check buffers limits
  void rlSetTexture(
    int id,
  );

  /// Load vertex array (vao) if supported
  int rlLoadVertexArray();

  /// Load a vertex buffer object
  int rlLoadVertexBuffer(
    XPtr<XVoid> buffer,
    int size,
    bool dynamic,
  );

  /// Load vertex buffer elements object
  int rlLoadVertexBufferElement(
    XPtr<XVoid> buffer,
    int size,
    bool dynamic,
  );

  /// Update vertex buffer object data on GPU buffer
  void rlUpdateVertexBuffer(
    int bufferId,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  );

  /// Update vertex buffer elements data on GPU buffer
  void rlUpdateVertexBufferElements(
    int id,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  );

  /// Unload vertex array (vao)
  void rlUnloadVertexArray(
    int vaoId,
  );

  /// Unload vertex buffer object
  void rlUnloadVertexBuffer(
    int vboId,
  );

  /// Set vertex attribute data configuration
  void rlSetVertexAttribute(
    int index,
    int compSize,
    int type,
    bool normalized,
    int stride,
    int offset,
  );

  /// Set vertex attribute data divisor
  void rlSetVertexAttributeDivisor(
    int index,
    int divisor,
  );

  /// Set vertex attribute default value, when attribute to provided
  void rlSetVertexAttributeDefault(
    int locIndex,
    XPtr<XVoid> value,
    int attribType,
    int count,
  );

  /// Draw vertex array (currently active vao)
  void rlDrawVertexArray(
    int offset,
    int count,
  );

  /// Draw vertex array elements
  void rlDrawVertexArrayElements(
    int offset,
    int count,
    XPtr<XVoid> buffer,
  );

  /// Draw vertex array (currently active vao) with instancing
  void rlDrawVertexArrayInstanced(
    int offset,
    int count,
    int instances,
  );

  /// Draw vertex array elements with instancing
  void rlDrawVertexArrayElementsInstanced(
    int offset,
    int count,
    XPtr<XVoid> buffer,
    int instances,
  );

  /// Load texture data
  int rlLoadTexture(
    XPtr<XVoid> data,
    int width,
    int height,
    int format,
    int mipmapCount,
  );

  /// Load depth texture/renderbuffer (to be attached to fbo)
  int rlLoadTextureDepth(
    int width,
    int height,
    bool useRenderBuffer,
  );

  /// Load texture cubemap data
  int rlLoadTextureCubemap(
    XPtr<XVoid> data,
    int size,
    int format,
    int mipmapCount,
  );

  /// Update texture with new data on GPU
  void rlUpdateTexture(
    int id,
    int offsetX,
    int offsetY,
    int width,
    int height,
    int format,
    XPtr<XVoid> data,
  );

  /// Get OpenGL internal formats
  void rlGetGlTextureFormats(
    int format,
    XPtr<XUnsignedInt> glInternalFormat,
    XPtr<XUnsignedInt> glFormat,
    XPtr<XUnsignedInt> glType,
  );

  /// Get name string for pixel format
  XPtr<XChar> rlGetPixelFormatName(
    int format,
  );

  /// Unload texture from GPU memory
  void rlUnloadTexture(
    int id,
  );

  /// Generate mipmap data for selected texture
  void rlGenTextureMipmaps(
    int id,
    int width,
    int height,
    int format,
    XPtr<XInt> mipmaps,
  );

  /// Read texture pixel data
  XPtr<XVoid> rlReadTexturePixels(
    int id,
    int width,
    int height,
    int format,
  );

  /// Read screen pixel data (color buffer)
  XPtr<XUnsignedChar> rlReadScreenPixels(
    int width,
    int height,
  );

  /// Load an empty framebuffer
  int rlLoadFramebuffer();

  /// Attach texture/renderbuffer to a framebuffer
  void rlFramebufferAttach(
    int fboId,
    int texId,
    int attachType,
    int texType,
    int mipLevel,
  );

  /// Verify framebuffer is complete
  bool rlFramebufferComplete(
    int id,
  );

  /// Delete framebuffer from GPU
  void rlUnloadFramebuffer(
    int id,
  );

  /// Copy framebuffer pixel data to internal buffer
  void rlCopyFramebuffer(
    int x,
    int y,
    int width,
    int height,
    int format,
    XPtr<XVoid> pixels,
  );

  /// Resize internal framebuffer
  void rlResizeFramebuffer(
    int width,
    int height,
  );

  /// Load (compile) shader and return shader id
  int rlLoadShader(
    XPtr<XChar> code,
    int type,
  );

  /// Load shader from code strings
  int rlLoadShaderProgram(
    XPtr<XChar> vsCode,
    XPtr<XChar> fsCode,
  );

  /// Load shader program, using already loaded shader ids
  int rlLoadShaderProgramEx(
    int vsId,
    int fsId,
  );

  /// Load compute shader program
  int rlLoadShaderProgramCompute(
    int csId,
  );

  /// Unload shader, loaded with rlLoadShader();
  void rlUnloadShader(
    int id,
  );

  /// Unload shader program
  void rlUnloadShaderProgram(
    int id,
  );

  /// Get shader location uniform, requires shader program id
  int rlGetLocationUniform(
    int shaderId,
    XPtr<XChar> uniformName,
  );

  /// Get shader location attribute, requires shader program id
  int rlGetLocationAttrib(
    int shaderId,
    XPtr<XChar> attribName,
  );

  /// Set shader value uniform
  void rlSetUniform(
    int locIndex,
    XPtr<XVoid> value,
    int uniformType,
    int count,
  );

  /// Set shader value matrix
  void rlSetUniformMatrix(
    int locIndex,
    Matrix mat,
  );

  /// Set shader value matrices
  void rlSetUniformMatrices(
    int locIndex,
    XStructPtr<Matrix> mat,
    int count,
  );

  /// Set shader value sampler
  void rlSetUniformSampler(
    int locIndex,
    int textureId,
  );

  /// Set shader currently active (id and locations)
  void rlSetShader(
    int id,
    XPtr<XInt> locs,
  );

  /// Dispatch compute shader (equivalent to *draw* for graphics pipeline)
  void rlComputeShaderDispatch(
    int groupX,
    int groupY,
    int groupZ,
  );

  /// Load shader storage buffer object (SSBO)
  int rlLoadShaderBuffer(
    int size,
    XPtr<XVoid> data,
    int usageHint,
  );

  /// Unload shader storage buffer object (SSBO)
  void rlUnloadShaderBuffer(
    int ssboId,
  );

  /// Update SSBO buffer data
  void rlUpdateShaderBuffer(
    int id,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  );

  /// Bind SSBO buffer
  void rlBindShaderBuffer(
    int id,
    int index,
  );

  /// Read SSBO buffer data (GPU->CPU)
  void rlReadShaderBuffer(
    int id,
    XPtr<XVoid> dest,
    int count,
    int offset,
  );

  /// Copy SSBO data between buffers
  void rlCopyShaderBuffer(
    int destId,
    int srcId,
    int destOffset,
    int srcOffset,
    int count,
  );

  /// Get SSBO buffer size
  int rlGetShaderBufferSize(
    int id,
  );

  /// Bind image texture
  void rlBindImageTexture(
    int id,
    int index,
    int format,
    bool readonly,
  );

  /// Get internal modelview matrix
  Matrix rlGetMatrixModelview();

  /// Get internal projection matrix
  Matrix rlGetMatrixProjection();

  /// Get internal accumulated transform matrix
  Matrix rlGetMatrixTransform();

  /// Get internal projection matrix for stereo render (selected eye)
  Matrix rlGetMatrixProjectionStereo(
    int eye,
  );

  /// Get internal view offset matrix for stereo render (selected eye)
  Matrix rlGetMatrixViewOffsetStereo(
    int eye,
  );

  /// Set a custom projection matrix (replaces internal projection matrix)
  void rlSetMatrixProjection(
    Matrix proj,
  );

  /// Set a custom modelview matrix (replaces internal modelview matrix)
  void rlSetMatrixModelview(
    Matrix view,
  );

  /// Set eyes projection matrices for stereo rendering
  void rlSetMatrixProjectionStereo(
    Matrix right,
    Matrix left,
  );

  /// Set eyes view offsets matrices for stereo rendering
  void rlSetMatrixViewOffsetStereo(
    Matrix right,
    Matrix left,
  );

  /// Load and draw a cube
  void rlLoadDrawCube();

  /// Load and draw a quad
  void rlLoadDrawQuad();
}
