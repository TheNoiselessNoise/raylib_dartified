part of '../../../raylib_dartified.dart';

class RaylibRlglFlat extends RaylibRlglFlatModule<Raylib> {
  
  RaylibRlglFlat(super.rl);

  @override
  void rlMatrixMode(
    int mode,
  ) => rl.Rlgl.rlMatrixMode(
    mode,
  );

  @override
  void rlPushMatrix() => rl.Rlgl.rlPushMatrix();

  @override
  void rlPopMatrix() => rl.Rlgl.rlPopMatrix();

  @override
  void rlLoadIdentity() => rl.Rlgl.rlLoadIdentity();

  @override
  void rlTranslatef(
    double x,
    double y,
    double z,
  ) => rl.Rlgl.rlTranslatef(
    x,
    y,
    z,
  );

  @override
  void rlRotatef(
    double angle,
    double x,
    double y,
    double z,
  ) => rl.Rlgl.rlRotatef(
    angle,
    x,
    y,
    z,
  );

  @override
  void rlScalef(
    double x,
    double y,
    double z,
  ) => rl.Rlgl.rlScalef(
    x,
    y,
    z,
  );

  @override
  void rlMultMatrixf(
    MemoryPointer<RFloat32> matf, 
  ) => rl.Rlgl.rlMultMatrixf(
    matf.asNativePointer(),
  );

  @override
  void rlFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double znear,
    double zfar,
  ) => rl.Rlgl.rlFrustum(
    left,
    right,
    bottom,
    top,
    znear,
    zfar,
  );

  @override
  void rlOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double znear,
    double zfar,
  ) => rl.Rlgl.rlOrtho(
    left,
    right,
    bottom,
    top,
    znear,
    zfar,
  );

  @override
  void rlViewport(
    int x,
    int y,
    int width,
    int height,
  ) => rl.Rlgl.rlViewport(
    x,
    y,
    width,
    height,
  );

  @override
  void rlSetClipPlanes(
    double nearPlane,
    double farPlane,
  ) => rl.Rlgl.rlSetClipPlanes(
    nearPlane,
    farPlane,
  );

  @override
  double rlGetCullDistanceNear() => rl.Rlgl.rlGetCullDistanceNear();

  @override
  double rlGetCullDistanceFar() => rl.Rlgl.rlGetCullDistanceFar();

  @override
  void rlBegin(
    int mode,
  ) => rl.Rlgl.rlBegin(
    mode,
  );

  @override
  void rlEnd() => rl.Rlgl.rlEnd();

  @override
  void rlVertex2i(
    int x,
    int y,
  ) => rl.Rlgl.rlVertex2i(
    x,
    y,
  );

  @override
  void rlVertex2f(
    double x,
    double y,
  ) => rl.Rlgl.rlVertex2f(
    x,
    y,
  );

  @override
  void rlVertex3f(
    double x,
    double y,
    double z
  ) => rl.Rlgl.rlVertex3f(
    x,
    y,
    z,
  );

  @override
  void rlTexCoord2f(
    double x,
    double y,
  ) => rl.Rlgl.rlTexCoord2f(
    x,
    y,
  );

  @override
  void rlNormal3f(
    double x,
    double y,
    double z,
  ) => rl.Rlgl.rlNormal3f(
    x,
    y,
    z,
  );

  @override
  void rlColor4ub(
    int r,
    int g,
    int b,
    int a,
  ) => rl.Rlgl.rlColor4ub(
    r,
    g,
    b,
    a,
  );

  @override
  void rlColor3f(
    double x,
    double y,
    double z,
  ) => rl.Rlgl.rlColor3f(
    x,
    y,
    z,
  );

  @override
  void rlColor4f(
    double x,
    double y,
    double z,
    double w,
  ) => rl.Rlgl.rlColor4f(
    x,
    y,
    z,
    w,
  );

  @override
  bool rlEnableVertexArray(
    int vaoId,
  ) => rl.Rlgl.rlEnableVertexArray(
    vaoId,
  );

  @override
  void rlDisableVertexArray() => rl.Rlgl.rlDisableVertexArray();

  @override
  void rlEnableVertexBuffer(
    int id,
  ) => rl.Rlgl.rlEnableVertexBuffer(
    id,
  );

  @override
  void rlDisableVertexBuffer() => rl.Rlgl.rlDisableVertexBuffer();

  @override
  void rlEnableVertexBufferElement(
    int id,
  ) => rl.Rlgl.rlEnableVertexBufferElement(
    id,
  );

  @override
  void rlDisableVertexBufferElement() => rl.Rlgl.rlDisableVertexBufferElement();

  @override
  void rlEnableVertexAttribute(
    int index,
  ) => rl.Rlgl.rlEnableVertexAttribute(
    index,
  );

  @override
  void rlDisableVertexAttribute(
    int index,
  ) => rl.Rlgl.rlDisableVertexAttribute(
    index,
  );

  @override
  void rlEnableStatePointer(
    int vertexAttribType,
    MemoryPointer<RVoid> buffer,
  ) => rl.Rlgl.rlEnableStatePointer(
    vertexAttribType,
    buffer.asNativePointer(),
  );

  @override
  void rlDisableStatePointer(
    int vertexAttribType,
  ) => rl.Rlgl.rlDisableStatePointer(
    vertexAttribType,
  );

  @override
  void rlActiveTextureSlot(
    int slot,
  ) => rl.Rlgl.rlActiveTextureSlot(
    slot,
  );

  @override
  void rlEnableTexture(
    int id,
  ) => rl.Rlgl.rlEnableTexture(
    id,
  );

  @override
  void rlDisableTexture() => rl.Rlgl.rlDisableTexture();

  @override
  void rlEnableTextureCubemap(
    int id,
  ) => rl.Rlgl.rlEnableTextureCubemap(
    id,
  );

  @override
  void rlDisableTextureCubemap() => rl.Rlgl.rlDisableTextureCubemap();

  @override
  void rlTextureParameters(
    int id,
    int param,
    int value,
  ) => rl.Rlgl.rlTextureParameters(
    id,
    param,
    value,
  );

  @override
  void rlCubemapParameters(
    int id,
    int param,
    int value,
  ) => rl.Rlgl.rlCubemapParameters(
    id,
    param,
    value,
  );

  @override
  void rlEnableShader(
    int id,
  ) => rl.Rlgl.rlEnableShader(
    id,
  );

  @override
  void rlDisableShader() => rl.Rlgl.rlDisableShader();

  @override
  void rlEnableFramebuffer(
    int id,
  ) => rl.Rlgl.rlEnableFramebuffer(
    id,
  );

  @override
  void rlDisableFramebuffer() => rl.Rlgl.rlDisableFramebuffer();

  @override
  int rlGetActiveFramebuffer() => rl.Rlgl.rlGetActiveFramebuffer();

  @override
  void rlActiveDrawBuffers(
    int count,
  ) => rl.Rlgl.rlActiveDrawBuffers(
    count,
  );

  @override
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
  ) => rl.Rlgl.rlBlitFramebuffer(
    srcX,
    srcY,
    srcWidth,
    srcHeight,
    dstX,
    dstY,
    dstWidth,
    dstHeight,
    bufferMask,
  );

  @override
  void rlBindFramebuffer(
    int target,
    int framebuffer,
  ) => rl.Rlgl.rlBindFramebuffer(
    target,
    framebuffer,
  );

  @override
  void rlEnableColorBlend() => rl.Rlgl.rlEnableColorBlend();

  @override
  void rlDisableColorBlend() => rl.Rlgl.rlDisableColorBlend();

  @override
  void rlEnableDepthTest() => rl.Rlgl.rlEnableDepthTest();

  @override
  void rlDisableDepthTest() => rl.Rlgl.rlDisableDepthTest();

  @override
  void rlEnableDepthMask() => rl.Rlgl.rlEnableDepthMask();

  @override
  void rlDisableDepthMask() => rl.Rlgl.rlDisableDepthMask();

  @override
  void rlEnableBackfaceCulling() => rl.Rlgl.rlEnableBackfaceCulling();

  @override
  void rlDisableBackfaceCulling() => rl.Rlgl.rlDisableBackfaceCulling();

  @override
  void rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => rl.Rlgl.rlColorMask(
    r,
    g,
    b,
    a,
  );

  @override
  void rlSetCullFace(
    int mode,
  ) => rl.Rlgl.rlSetCullFace(
    mode,
  );

  @override
  void rlEnableScissorTest() => rl.Rlgl.rlEnableScissorTest();

  @override
  void rlDisableScissorTest() => rl.Rlgl.rlDisableScissorTest();

  @override
  void rlScissor(
    int x,
    int y,
    int width,
    int height,
  ) => rl.Rlgl.rlScissor(
    x,
    y,
    width,
    height,
  );

  @override
  void rlEnablePointMode() => rl.Rlgl.rlEnablePointMode();

  @override
  void rlDisablePointMode() => rl.Rlgl.rlDisablePointMode();

  @override
  void rlSetPointSize(
    double size,
  ) => rl.Rlgl.rlSetPointSize(
    size,
  );

  @override
  double rlGetPointSize() => rl.Rlgl.rlGetPointSize();

  @override
  void rlEnableWireMode() => rl.Rlgl.rlEnableWireMode();

  @override
  void rlDisableWireMode() => rl.Rlgl.rlDisableWireMode();

  @override
  void rlSetLineWidth(
    double width,
  ) => rl.Rlgl.rlSetLineWidth(
    width,
  );

  @override
  double rlGetLineWidth() => rl.Rlgl.rlGetLineWidth();

  @override
  void rlEnableSmoothLines() => rl.Rlgl.rlEnableSmoothLines();

  @override
  void rlDisableSmoothLines() => rl.Rlgl.rlDisableSmoothLines();

  @override
  void rlEnableStereoRender() => rl.Rlgl.rlEnableStereoRender();

  @override
  void rlDisableStereoRender() => rl.Rlgl.rlDisableStereoRender();

  @override
  bool rlIsStereoRenderEnabled() => rl.Rlgl.rlIsStereoRenderEnabled();

  @override
  void rlClearColor(
    int r,
    int g,
    int b,
    int a,
  ) => rl.Rlgl.rlClearColor(
    r,
    g,
    b,
    a,
  );

  @override
  void rlClearScreenBuffers() => rl.Rlgl.rlClearScreenBuffers();

  @override
  void rlCheckErrors() => rl.Rlgl.rlCheckErrors();

  @override
  void rlSetBlendMode(
    int mode,
  ) => rl.Rlgl.rlSetBlendMode(
    mode,
  );

  @override
  void rlSetBlendFactors(
    int glSrcFactor,
    int glDstFactor,
    int glEquation,
  ) => rl.Rlgl.rlSetBlendFactors(
    glSrcFactor,
    glDstFactor,
    glEquation,
  );

  @override
  void rlSetBlendFactorsSeparate(
    int glSrcRGB,
    int glDstRGB,
    int glSrcAlpha,
    int glDstAlpha,
    int glEqRGB,
    int glEqAlpha,
  ) => rl.Rlgl.rlSetBlendFactorsSeparate(
    glSrcRGB,
    glDstRGB,
    glSrcAlpha,
    glDstAlpha,
    glEqRGB,
    glEqAlpha,
  );

  @override
  void rlglInit(
    int width,
    int height,
  ) => rl.Rlgl.rlglInit(
    width,
    height,
  );

  @override
  void rlglClose() => rl.Rlgl.rlglClose();

  @override
  void rlLoadExtensions(
    MemoryPointer<RVoid> loader,
  ) => rl.Rlgl.rlLoadExtensions(
    loader.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RVoid> rlGetProcAddress(
    MemoryPointer<RChar> procName,
  ) => rl.Rlgl.rlGetProcAddress(
    procName.asNativePointer(),
  ).asMemoryPointer();

  @override
  int rlGetVersion() => rl.Rlgl.rlGetVersion();

  @override
  void rlSetFramebufferWidth(
    int width,
  ) => rl.Rlgl.rlSetFramebufferWidth(
    width,
  );

  @override
  int rlGetFramebufferWidth() => rl.Rlgl.rlGetFramebufferWidth();

  @override
  void rlSetFramebufferHeight(
    int height,
  ) => rl.Rlgl.rlSetFramebufferHeight(
    height,
  );

  @override
  int rlGetFramebufferHeight() => rl.Rlgl.rlGetFramebufferHeight();

  @override
  int rlGetTextureIdDefault() => rl.Rlgl.rlGetTextureIdDefault();

  @override
  int rlGetShaderIdDefault() => rl.Rlgl.rlGetShaderIdDefault();

  @override
  NativeMemoryPointer<RInt> rlGetShaderLocsDefault() => rl.Rlgl.rlGetShaderLocsDefault().asMemoryPointer();

  @override
  RlRenderBatchD rlLoadRenderBatch(
    int numBuffers,
    int bufferElements,
  ) => rl.Temp.RlRenderBatch$.RefCapture(
    RaylibCaptureIds.rlLoadRenderBatch,
    (_) => rl.Rlgl.rlLoadRenderBatch(
      numBuffers,
      bufferElements,
    ).toD(),
  );

  @override
  void rlUnloadRenderBatch(
    RlRenderBatchD batch,
  ) => rl.Rlgl.rlUnloadRenderBatch(
    rl.Temp.RlRenderBatch$.Ref1(batch).asNativePointer<RlRenderBatchC>().ref,
  );

  @override
  void rlDrawRenderBatch(
    StructPointer<RlRenderBatchD> batch,
  ) => rl.Rlgl.rlDrawRenderBatch(
    batch.asNativePointer(),
  );

  @override
  void rlSetRenderBatchActive(
    StructPointer<RlRenderBatchD> batch,
  ) => rl.Rlgl.rlSetRenderBatchActive(
    batch.asNativePointer(),
  );

  @override
  void rlDrawRenderBatchActive() => rl.Rlgl.rlDrawRenderBatchActive();

  @override
  bool rlCheckRenderBatchLimit(
    int vCount,
  ) => rl.Rlgl.rlCheckRenderBatchLimit(
    vCount,
  );

  @override
  void rlSetTexture(
    int id,
  ) => rl.Rlgl.rlSetTexture(
    id,
  );

  @override
  int rlLoadVertexArray() => rl.Rlgl.rlLoadVertexArray();

  @override
  int rlLoadVertexBuffer(
    MemoryPointer<RVoid> buffer,
    int size,
    bool dynamic,
  ) => rl.Rlgl.rlLoadVertexBuffer(
    buffer.asNativePointer(),
    size,
    dynamic,
  );

  @override
  int rlLoadVertexBufferElement(
    MemoryPointer<RVoid> buffer,
    int size,
    bool dynamic,
  ) => rl.Rlgl.rlLoadVertexBufferElement(
    buffer.asNativePointer(),
    size,
    dynamic,
  );

  @override
  void rlUpdateVertexBuffer(
    int bufferId,
    MemoryPointer<RVoid> data,
    int dataSize,
    int offset,
  ) => rl.Rlgl.rlUpdateVertexBuffer(
    bufferId,
    data.asNativePointer(),
    dataSize,
    offset,
  );

  @override
  void rlUpdateVertexBufferElements(
    int id,
    MemoryPointer<RVoid> data,
    int dataSize,
    int offset,
  ) => rl.Rlgl.rlUpdateVertexBufferElements(
    id,
    data.asNativePointer(),
    dataSize,
    offset,
  );

  @override
  void rlUnloadVertexArray(
    int vaoId,
  ) => rl.Rlgl.rlUnloadVertexArray(
    vaoId,
  );

  @override
  void rlUnloadVertexBuffer(
    int vboId,
  ) => rl.Rlgl.rlUnloadVertexBuffer(
    vboId,
  );

  @override
  void rlSetVertexAttribute(
    int index,
    int compSize,
    int type,
    bool normalized,
    int stride,
    int offset,
  ) => rl.Rlgl.rlSetVertexAttribute(
    index,
    compSize,
    type,
    normalized,
    stride,
    offset,
  );

  @override
  void rlSetVertexAttributeDivisor(
    int index,
    int divisor,
  ) => rl.Rlgl.rlSetVertexAttributeDivisor(
    index,
    divisor,
  );

  @override
  void rlSetVertexAttributeDefault(
    int locIndex,
    MemoryPointer<RVoid> value,
    int attribType,
    int count,
  ) => rl.Rlgl.rlSetVertexAttributeDefault(
    locIndex,
    value.asNativePointer(),
    attribType,
    count,
  );

  @override
  void rlDrawVertexArray(
    int offset,
    int count,
  ) => rl.Rlgl.rlDrawVertexArray(
    offset,
    count,
  );

  @override
  void rlDrawVertexArrayElements(
    int offset,
    int count,
    MemoryPointer<RVoid> buffer,
  ) => rl.Rlgl.rlDrawVertexArrayElements(
    offset,
    count,
    buffer.asNativePointer(),
  );

  @override
  void rlDrawVertexArrayInstanced(
    int offset,
    int count,
    int instances,
  ) => rl.Rlgl.rlDrawVertexArrayInstanced(
    offset,
    count,
    instances,
  );

  @override
  void rlDrawVertexArrayElementsInstanced(
    int offset,
    int count,
    MemoryPointer<RVoid> buffer,
    int instances,
  ) => rl.Rlgl.rlDrawVertexArrayElementsInstanced(
    offset,
    count,
    buffer.asNativePointer(),
    instances,
  );

  @override
  int rlLoadTexture(
    MemoryPointer<RVoid> data,
    int width,
    int height,
    int format,
    int mipmapCount,
  ) => rl.Rlgl.rlLoadTexture(
    data.asNativePointer(),
    width,
    height,
    format,
    mipmapCount,
  );

  @override
  int rlLoadTextureDepth(
    int width,
    int height,
    bool useRenderBuffer,
  ) => rl.Rlgl.rlLoadTextureDepth(
    width,
    height,
    useRenderBuffer,
  );

  @override
  int rlLoadTextureCubemap(
    MemoryPointer<RVoid> data,
    int size,
    int format,
    int mipmapCount,
  ) => rl.Rlgl.rlLoadTextureCubemap(
    data.asNativePointer(),
    size,
    format,
    mipmapCount,
  );

  @override
  void rlUpdateTexture(
    int id,
    int offsetX,
    int offsetY,
    int width,
    int height,
    int format,
    MemoryPointer<RVoid> data,
  ) => rl.Rlgl.rlUpdateTexture(
    id,
    offsetX,
    offsetY,
    width,
    height,
    format,
    data.asNativePointer(),
  );

  @override
  void rlGetGlTextureFormats(
    int format,
    MemoryPointer<RUnsignedInt> glInternalFormat,
    MemoryPointer<RUnsignedInt> glFormat,
    MemoryPointer<RUnsignedInt> glType,
  ) => rl.Rlgl.rlGetGlTextureFormats(
    format,
    glInternalFormat.asNativePointer(),
    glFormat.asNativePointer(),
    glType.asNativePointer(),
  );

  @override
  NativeMemoryPointer<RChar> rlGetPixelFormatName(
    int format,
  ) => rl.Rlgl.rlGetPixelFormatName(
    format,
  ).asMemoryPointer();

  @override
  void rlUnloadTexture(
    int id,
  ) => rl.Rlgl.rlUnloadTexture(
    id,
  );

  @override
  void rlGenTextureMipmaps(
    int id,
    int width,
    int height,
    int format,
    MemoryPointer<RInt> mipmaps,
  ) => rl.Rlgl.rlGenTextureMipmaps(
    id,
    width,
    height,
    format,
    mipmaps.asNativePointer(), 
  );

  @override
  NativeMemoryPointer<RVoid> rlReadTexturePixels(
    int id,
    int width,
    int height,
    int format,
  ) => rl.Rlgl.rlReadTexturePixels(
    id,
    width,
    height,
    format,
  ).asMemoryPointer();

  @override
  NativeMemoryPointer<RUnsignedChar> rlReadScreenPixels(
    int width,
    int height,
  ) => rl.Rlgl.rlReadScreenPixels(
    width,
    height,
  ).asMemoryPointer();

  @override
  int rlLoadFramebuffer() => rl.Rlgl.rlLoadFramebuffer();

  @override
  void rlFramebufferAttach(
    int fboId,
    int texId,
    int attachType,
    int texType,
    int mipLevel,
  ) => rl.Rlgl.rlFramebufferAttach(
    fboId,
    texId,
    attachType,
    texType,
    mipLevel,
  );

  @override
  bool rlFramebufferComplete(
    int id,
  ) => rl.Rlgl.rlFramebufferComplete(
    id,
  );

  @override
  void rlUnloadFramebuffer(
    int id,
  ) => rl.Rlgl.rlUnloadFramebuffer(
    id,
  );

  @override
  void rlCopyFramebuffer(
    int x,
    int y,
    int width,
    int height,
    int format,
    MemoryPointer<RVoid> pixels,
  ) => rl.Rlgl.rlCopyFramebuffer(
    x,
    y,
    width,
    height,
    format,
    pixels.asNativePointer(),
  );

  @override
  void rlResizeFramebuffer(
    int width,
    int height,
  ) => rl.Rlgl.rlResizeFramebuffer(
    width,
    height,
  );

  @override
  int rlLoadShader(
    MemoryPointer<RChar> code,
    int type,
  ) => rl.Rlgl.rlLoadShader(
    code.asNativePointer(),
    type,
  );

  @override
  int rlLoadShaderProgram(
    MemoryPointer<RChar> vsCode,
    MemoryPointer<RChar> fsCode,
  ) => rl.Rlgl.rlLoadShaderProgram(
    vsCode.asNativePointer(),
    fsCode.asNativePointer(),
  );

  @override
  int rlLoadShaderProgramEx(
    int vsId,
    int fsId,
  ) => rl.Rlgl.rlLoadShaderProgramEx(
    vsId,
    fsId,
  );

  @override
  int rlLoadShaderProgramCompute(
    int csId,
  ) => rl.Rlgl.rlLoadShaderProgramCompute(
    csId,
  );

  @override
  void rlUnloadShader(
    int id,
  ) => rl.Rlgl.rlUnloadShader(
    id,
  );

  @override
  void rlUnloadShaderProgram(
    int id,
  ) => rl.Rlgl.rlUnloadShaderProgram(
    id,
  );

  @override
  int rlGetLocationUniform(
    int shaderId,
    MemoryPointer<RChar> uniformName,
  ) => rl.Rlgl.rlGetLocationUniform(
    shaderId,
    uniformName.asNativePointer(),
  );

  @override
  int rlGetLocationAttrib(
    int shaderId,
    MemoryPointer<RChar> attribName,
  ) => rl.Rlgl.rlGetLocationAttrib(
    shaderId,
    attribName.asNativePointer(),
  );

  @override
  void rlSetUniform(
    int locIndex,
    MemoryPointer<RVoid> value,
    int uniformType,
    int count,
  ) => rl.Rlgl.rlSetUniform(
    locIndex,
    value.asNativePointer(),
    uniformType,
    count,
  );

  @override
  void rlSetUniformMatrix(
    int locIndex,
    MatrixD mat,
  ) => rl.Rlgl.rlSetUniformMatrix(
    locIndex,
    rl.Temp.Matrix$.Ref1(mat).asNativePointer<MatrixC>().ref,
  );

  @override
  void rlSetUniformMatrices(
    int locIndex,
    StructPointer<MatrixD> mat,
    int count,
  ) => rl.Rlgl.rlSetUniformMatrices(
    locIndex,
    mat.asNativePointer(),
    count,
  );

  @override
  void rlSetUniformSampler(
    int locIndex,
    int textureId,
  ) => rl.Rlgl.rlSetUniformSampler(
    locIndex,
    textureId,
  );

  @override
  void rlSetShader(
    int id,
    MemoryPointer<RInt> locs,
  ) => rl.Rlgl.rlSetShader(
    id,
    locs.asNativePointer(),
  );

  @override
  void rlComputeShaderDispatch(
    int groupX,
    int groupY,
    int groupZ,
  ) => rl.Rlgl.rlComputeShaderDispatch(
    groupX,
    groupY,
    groupZ,
  );

  @override
  int rlLoadShaderBuffer(
    int size,
    MemoryPointer<RVoid> data,
    int usageHint,
  ) => rl.Rlgl.rlLoadShaderBuffer(
    size,
    data.asNativePointer(),
    usageHint,
  );

  @override
  void rlUnloadShaderBuffer(
    int ssboId,
  ) => rl.Rlgl.rlUnloadShaderBuffer(
    ssboId,
  );

  @override
  void rlUpdateShaderBuffer(
    int id,
    MemoryPointer<RVoid> data,
    int dataSize,
    int offset,
  ) => rl.Rlgl.rlUpdateShaderBuffer(
    id,
    data.asNativePointer(),
    dataSize,
    offset,
  );

  @override
  void rlBindShaderBuffer(
    int id,
    int index,
  ) => rl.Rlgl.rlBindShaderBuffer(
    id,
    index,
  );

  @override
  void rlReadShaderBuffer(
    int id,
    MemoryPointer<RVoid> dest,
    int count,
    int offset,
  ) => rl.Rlgl.rlReadShaderBuffer(
    id,
    dest.asNativePointer(),
    count,
    offset,
  );

  @override
  void rlCopyShaderBuffer(
    int destId,
    int srcId,
    int destOffset,
    int srcOffset,
    int count,
  ) => rl.Rlgl.rlCopyShaderBuffer(
    destId,
    srcId,
    destOffset,
    srcOffset,
    count,
  );

  @override
  int rlGetShaderBufferSize(
    int id,
  ) => rl.Rlgl.rlGetShaderBufferSize(
    id,
  );

  @override
  void rlBindImageTexture(
    int id,
    int index,
    int format,
    bool readonly,
  ) => rl.Rlgl.rlBindImageTexture(
    id,
    index,
    format,
    readonly,
  );

  @override
  MatrixD rlGetMatrixModelview() => rl.Rlgl.rlGetMatrixModelview().toD();

  @override
  MatrixD rlGetMatrixProjection() => rl.Rlgl.rlGetMatrixProjection().toD();

  @override
  MatrixD rlGetMatrixTransform() => rl.Rlgl.rlGetMatrixTransform().toD();

  @override
  MatrixD rlGetMatrixProjectionStereo(
    int eye,
  ) => rl.Rlgl.rlGetMatrixProjectionStereo(
    eye,
  ).toD();

  @override
  MatrixD rlGetMatrixViewOffsetStereo(
    int eye,
  ) => rl.Rlgl.rlGetMatrixViewOffsetStereo(
    eye,
  ).toD();

  @override
  void rlSetMatrixProjection(
    MatrixD proj,
  ) => rl.Rlgl.rlSetMatrixProjection(
    rl.Temp.Matrix$.Ref1(proj).asNativePointer<MatrixC>().ref,
  );

  @override
  void rlSetMatrixModelview(
    MatrixD view,
  ) => rl.Rlgl.rlSetMatrixModelview(
    rl.Temp.Matrix$.Ref1(view).asNativePointer<MatrixC>().ref,
  );

  @override
  void rlSetMatrixProjectionStereo(
    MatrixD right,
    MatrixD left,
  ) => rl.Rlgl.rlSetMatrixProjectionStereo(
    rl.Temp.Matrix$.Ref1(right).asNativePointer<MatrixC>().ref,
    rl.Temp.Matrix$.Ref2(left).asNativePointer<MatrixC>().ref,
  );

  @override
  void rlSetMatrixViewOffsetStereo(
    MatrixD right,
    MatrixD left,
  ) => rl.Rlgl.rlSetMatrixViewOffsetStereo(
    rl.Temp.Matrix$.Ref1(right).asNativePointer<MatrixC>().ref,
    rl.Temp.Matrix$.Ref2(left).asNativePointer<MatrixC>().ref,
  );

  @override
  void rlLoadDrawCube() => rl.Rlgl.rlLoadDrawCube();

  @override
  void rlLoadDrawQuad() => rl.Rlgl.rlLoadDrawQuad();
}
