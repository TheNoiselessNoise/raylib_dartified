part of '../../../raylib_dartified.dart';

class RaylibRlglFlatNative extends RaylibRlglFlat<Raylib> {
  
  RaylibRlglFlatNative(super.rl);

  RaylibRlgl get _ffi => rl.module();

  @override
  void rlMatrixMode(
    int mode,
  ) => _ffi.rlMatrixMode(
    mode,
  );

  @override
  void rlPushMatrix() => _ffi.rlPushMatrix();

  @override
  void rlPopMatrix() => _ffi.rlPopMatrix();

  @override
  void rlLoadIdentity() => _ffi.rlLoadIdentity();

  @override
  void rlTranslatef(
    double x,
    double y,
    double z,
  ) => _ffi.rlTranslatef(
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
  ) => _ffi.rlRotatef(
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
  ) => _ffi.rlScalef(
    x,
    y,
    z,
  );

  @override
  void rlMultMatrixf(
    XPtr<XFloat32> matf, 
  ) => _ffi.rlMultMatrixf(
    matf.asNative(),
  );

  @override
  void rlFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double znear,
    double zfar,
  ) => _ffi.rlFrustum(
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
  ) => _ffi.rlOrtho(
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
  ) => _ffi.rlViewport(
    x,
    y,
    width,
    height,
  );

  @override
  void rlSetClipPlanes(
    double nearPlane,
    double farPlane,
  ) => _ffi.rlSetClipPlanes(
    nearPlane,
    farPlane,
  );

  @override
  double rlGetCullDistanceNear() => _ffi.rlGetCullDistanceNear();

  @override
  double rlGetCullDistanceFar() => _ffi.rlGetCullDistanceFar();

  @override
  void rlBegin(
    int mode,
  ) => _ffi.rlBegin(
    mode,
  );

  @override
  void rlEnd() => _ffi.rlEnd();

  @override
  void rlVertex2i(
    int x,
    int y,
  ) => _ffi.rlVertex2i(
    x,
    y,
  );

  @override
  void rlVertex2f(
    double x,
    double y,
  ) => _ffi.rlVertex2f(
    x,
    y,
  );

  @override
  void rlVertex3f(
    double x,
    double y,
    double z
  ) => _ffi.rlVertex3f(
    x,
    y,
    z,
  );

  @override
  void rlTexCoord2f(
    double x,
    double y,
  ) => _ffi.rlTexCoord2f(
    x,
    y,
  );

  @override
  void rlNormal3f(
    double x,
    double y,
    double z,
  ) => _ffi.rlNormal3f(
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
  ) => _ffi.rlColor4ub(
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
  ) => _ffi.rlColor3f(
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
  ) => _ffi.rlColor4f(
    x,
    y,
    z,
    w,
  );

  @override
  bool rlEnableVertexArray(
    int vaoId,
  ) => _ffi.rlEnableVertexArray(
    vaoId,
  );

  @override
  void rlDisableVertexArray() => _ffi.rlDisableVertexArray();

  @override
  void rlEnableVertexBuffer(
    int id,
  ) => _ffi.rlEnableVertexBuffer(
    id,
  );

  @override
  void rlDisableVertexBuffer() => _ffi.rlDisableVertexBuffer();

  @override
  void rlEnableVertexBufferElement(
    int id,
  ) => _ffi.rlEnableVertexBufferElement(
    id,
  );

  @override
  void rlDisableVertexBufferElement() => _ffi.rlDisableVertexBufferElement();

  @override
  void rlEnableVertexAttribute(
    int index,
  ) => _ffi.rlEnableVertexAttribute(
    index,
  );

  @override
  void rlDisableVertexAttribute(
    int index,
  ) => _ffi.rlDisableVertexAttribute(
    index,
  );

  @override
  void rlEnableStatePointer(
    int vertexAttribType,
    XPtr<XVoid> buffer,
  ) => _ffi.rlEnableStatePointer(
    vertexAttribType,
    buffer.asNative(),
  );

  @override
  void rlDisableStatePointer(
    int vertexAttribType,
  ) => _ffi.rlDisableStatePointer(
    vertexAttribType,
  );

  @override
  void rlActiveTextureSlot(
    int slot,
  ) => _ffi.rlActiveTextureSlot(
    slot,
  );

  @override
  void rlEnableTexture(
    int id,
  ) => _ffi.rlEnableTexture(
    id,
  );

  @override
  void rlDisableTexture() => _ffi.rlDisableTexture();

  @override
  void rlEnableTextureCubemap(
    int id,
  ) => _ffi.rlEnableTextureCubemap(
    id,
  );

  @override
  void rlDisableTextureCubemap() => _ffi.rlDisableTextureCubemap();

  @override
  void rlTextureParameters(
    int id,
    int param,
    int value,
  ) => _ffi.rlTextureParameters(
    id,
    param,
    value,
  );

  @override
  void rlCubemapParameters(
    int id,
    int param,
    int value,
  ) => _ffi.rlCubemapParameters(
    id,
    param,
    value,
  );

  @override
  void rlEnableShader(
    int id,
  ) => _ffi.rlEnableShader(
    id,
  );

  @override
  void rlDisableShader() => _ffi.rlDisableShader();

  @override
  void rlEnableFramebuffer(
    int id,
  ) => _ffi.rlEnableFramebuffer(
    id,
  );

  @override
  void rlDisableFramebuffer() => _ffi.rlDisableFramebuffer();

  @override
  int rlGetActiveFramebuffer() => _ffi.rlGetActiveFramebuffer();

  @override
  void rlActiveDrawBuffers(
    int count,
  ) => _ffi.rlActiveDrawBuffers(
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
  ) => _ffi.rlBlitFramebuffer(
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
  ) => _ffi.rlBindFramebuffer(
    target,
    framebuffer,
  );

  @override
  void rlEnableColorBlend() => _ffi.rlEnableColorBlend();

  @override
  void rlDisableColorBlend() => _ffi.rlDisableColorBlend();

  @override
  void rlEnableDepthTest() => _ffi.rlEnableDepthTest();

  @override
  void rlDisableDepthTest() => _ffi.rlDisableDepthTest();

  @override
  void rlEnableDepthMask() => _ffi.rlEnableDepthMask();

  @override
  void rlDisableDepthMask() => _ffi.rlDisableDepthMask();

  @override
  void rlEnableBackfaceCulling() => _ffi.rlEnableBackfaceCulling();

  @override
  void rlDisableBackfaceCulling() => _ffi.rlDisableBackfaceCulling();

  @override
  void rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => _ffi.rlColorMask(
    r,
    g,
    b,
    a,
  );

  @override
  void rlSetCullFace(
    int mode,
  ) => _ffi.rlSetCullFace(
    mode,
  );

  @override
  void rlEnableScissorTest() => _ffi.rlEnableScissorTest();

  @override
  void rlDisableScissorTest() => _ffi.rlDisableScissorTest();

  @override
  void rlScissor(
    int x,
    int y,
    int width,
    int height,
  ) => _ffi.rlScissor(
    x,
    y,
    width,
    height,
  );

  @override
  void rlEnablePointMode() => _ffi.rlEnablePointMode();

  @override
  void rlDisablePointMode() => _ffi.rlDisablePointMode();

  @override
  void rlSetPointSize(
    double size,
  ) => _ffi.rlSetPointSize(
    size,
  );

  @override
  double rlGetPointSize() => _ffi.rlGetPointSize();

  @override
  void rlEnableWireMode() => _ffi.rlEnableWireMode();

  @override
  void rlDisableWireMode() => _ffi.rlDisableWireMode();

  @override
  void rlSetLineWidth(
    double width,
  ) => _ffi.rlSetLineWidth(
    width,
  );

  @override
  double rlGetLineWidth() => _ffi.rlGetLineWidth();

  @override
  void rlEnableSmoothLines() => _ffi.rlEnableSmoothLines();

  @override
  void rlDisableSmoothLines() => _ffi.rlDisableSmoothLines();

  @override
  void rlEnableStereoRender() => _ffi.rlEnableStereoRender();

  @override
  void rlDisableStereoRender() => _ffi.rlDisableStereoRender();

  @override
  bool rlIsStereoRenderEnabled() => _ffi.rlIsStereoRenderEnabled();

  @override
  void rlClearColor(
    int r,
    int g,
    int b,
    int a,
  ) => _ffi.rlClearColor(
    r,
    g,
    b,
    a,
  );

  @override
  void rlClearScreenBuffers() => _ffi.rlClearScreenBuffers();

  @override
  void rlCheckErrors() => _ffi.rlCheckErrors();

  @override
  void rlSetBlendMode(
    int mode,
  ) => _ffi.rlSetBlendMode(
    mode,
  );

  @override
  void rlSetBlendFactors(
    int glSrcFactor,
    int glDstFactor,
    int glEquation,
  ) => _ffi.rlSetBlendFactors(
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
  ) => _ffi.rlSetBlendFactorsSeparate(
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
  ) => _ffi.rlglInit(
    width,
    height,
  );

  @override
  void rlglClose() => _ffi.rlglClose();

  @override
  void rlLoadExtensions(
    XPtr<XVoid> loader,
  ) => _ffi.rlLoadExtensions(
    loader.asNative(),
  );

  @override
  XNativePtr<XVoid> rlGetProcAddress(
    XPtr<XChar> procName,
  ) => _ffi.rlGetProcAddress(
    procName.asNative(),
  ).asXPtr();

  @override
  int rlGetVersion() => _ffi.rlGetVersion();

  @override
  void rlSetFramebufferWidth(
    int width,
  ) => _ffi.rlSetFramebufferWidth(
    width,
  );

  @override
  int rlGetFramebufferWidth() => _ffi.rlGetFramebufferWidth();

  @override
  void rlSetFramebufferHeight(
    int height,
  ) => _ffi.rlSetFramebufferHeight(
    height,
  );

  @override
  int rlGetFramebufferHeight() => _ffi.rlGetFramebufferHeight();

  @override
  int rlGetTextureIdDefault() => _ffi.rlGetTextureIdDefault();

  @override
  int rlGetShaderIdDefault() => _ffi.rlGetShaderIdDefault();

  @override
  XNativePtr<XInt> rlGetShaderLocsDefault() => _ffi.rlGetShaderLocsDefault().asXPtr();

  @override
  RlRenderBatch rlLoadRenderBatch(
    int numBuffers,
    int bufferElements,
  ) => RlRenderBatch$.RefCapture(
    RaylibCaptureIds.rlLoadRenderBatch,
    (p) => _ffi.rlLoadRenderBatch(
      numBuffers,
      bufferElements,
    ).toDart(p.asNative()),
  );

  @override
  void rlUnloadRenderBatch(
    RlRenderBatch batch,
  ) => _ffi.rlUnloadRenderBatch(
    RlRenderBatch$.Ref1(batch).asNative<RlRenderBatchC>().ref,
  );

  @override
  void rlDrawRenderBatch(
    XStructPtr<RlRenderBatch> batch,
  ) => _ffi.rlDrawRenderBatch(
    batch.asNative(),
  );

  @override
  void rlSetRenderBatchActive(
    XStructPtr<RlRenderBatch> batch,
  ) => _ffi.rlSetRenderBatchActive(
    batch.asNative(),
  );

  @override
  void rlDrawRenderBatchActive() => _ffi.rlDrawRenderBatchActive();

  @override
  bool rlCheckRenderBatchLimit(
    int vCount,
  ) => _ffi.rlCheckRenderBatchLimit(
    vCount,
  );

  @override
  void rlSetTexture(
    int id,
  ) => _ffi.rlSetTexture(
    id,
  );

  @override
  int rlLoadVertexArray() => _ffi.rlLoadVertexArray();

  @override
  int rlLoadVertexBuffer(
    XPtr<XVoid> buffer,
    int size,
    bool dynamic,
  ) => _ffi.rlLoadVertexBuffer(
    buffer.asNative(),
    size,
    dynamic,
  );

  @override
  int rlLoadVertexBufferElement(
    XPtr<XVoid> buffer,
    int size,
    bool dynamic,
  ) => _ffi.rlLoadVertexBufferElement(
    buffer.asNative(),
    size,
    dynamic,
  );

  @override
  void rlUpdateVertexBuffer(
    int bufferId,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  ) => _ffi.rlUpdateVertexBuffer(
    bufferId,
    data.asNative(),
    dataSize,
    offset,
  );

  @override
  void rlUpdateVertexBufferElements(
    int id,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  ) => _ffi.rlUpdateVertexBufferElements(
    id,
    data.asNative(),
    dataSize,
    offset,
  );

  @override
  void rlUnloadVertexArray(
    int vaoId,
  ) => _ffi.rlUnloadVertexArray(
    vaoId,
  );

  @override
  void rlUnloadVertexBuffer(
    int vboId,
  ) => _ffi.rlUnloadVertexBuffer(
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
  ) => _ffi.rlSetVertexAttribute(
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
  ) => _ffi.rlSetVertexAttributeDivisor(
    index,
    divisor,
  );

  @override
  void rlSetVertexAttributeDefault(
    int locIndex,
    XPtr<XVoid> value,
    int attribType,
    int count,
  ) => _ffi.rlSetVertexAttributeDefault(
    locIndex,
    value.asNative(),
    attribType,
    count,
  );

  @override
  void rlDrawVertexArray(
    int offset,
    int count,
  ) => _ffi.rlDrawVertexArray(
    offset,
    count,
  );

  @override
  void rlDrawVertexArrayElements(
    int offset,
    int count,
    XPtr<XVoid> buffer,
  ) => _ffi.rlDrawVertexArrayElements(
    offset,
    count,
    buffer.asNative(),
  );

  @override
  void rlDrawVertexArrayInstanced(
    int offset,
    int count,
    int instances,
  ) => _ffi.rlDrawVertexArrayInstanced(
    offset,
    count,
    instances,
  );

  @override
  void rlDrawVertexArrayElementsInstanced(
    int offset,
    int count,
    XPtr<XVoid> buffer,
    int instances,
  ) => _ffi.rlDrawVertexArrayElementsInstanced(
    offset,
    count,
    buffer.asNative(),
    instances,
  );

  @override
  int rlLoadTexture(
    XPtr<XVoid> data,
    int width,
    int height,
    int format,
    int mipmapCount,
  ) => _ffi.rlLoadTexture(
    data.asNative(),
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
  ) => _ffi.rlLoadTextureDepth(
    width,
    height,
    useRenderBuffer,
  );

  @override
  int rlLoadTextureCubemap(
    XPtr<XVoid> data,
    int size,
    int format,
    int mipmapCount,
  ) => _ffi.rlLoadTextureCubemap(
    data.asNative(),
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
    XPtr<XVoid> data,
  ) => _ffi.rlUpdateTexture(
    id,
    offsetX,
    offsetY,
    width,
    height,
    format,
    data.asNative(),
  );

  @override
  void rlGetGlTextureFormats(
    int format,
    XPtr<XUnsignedInt> glInternalFormat,
    XPtr<XUnsignedInt> glFormat,
    XPtr<XUnsignedInt> glType,
  ) => _ffi.rlGetGlTextureFormats(
    format,
    glInternalFormat.asNative(),
    glFormat.asNative(),
    glType.asNative(),
  );

  @override
  XNativePtr<XChar> rlGetPixelFormatName(
    int format,
  ) => _ffi.rlGetPixelFormatName(
    format,
  ).asXPtr();

  @override
  void rlUnloadTexture(
    int id,
  ) => _ffi.rlUnloadTexture(
    id,
  );

  @override
  void rlGenTextureMipmaps(
    int id,
    int width,
    int height,
    int format,
    XPtr<XInt> mipmaps,
  ) => _ffi.rlGenTextureMipmaps(
    id,
    width,
    height,
    format,
    mipmaps.asNative(), 
  );

  @override
  XNativePtr<XVoid> rlReadTexturePixels(
    int id,
    int width,
    int height,
    int format,
  ) => _ffi.rlReadTexturePixels(
    id,
    width,
    height,
    format,
  ).asXPtr();

  @override
  XNativePtr<XUnsignedChar> rlReadScreenPixels(
    int width,
    int height,
  ) => _ffi.rlReadScreenPixels(
    width,
    height,
  ).asXPtr();

  @override
  int rlLoadFramebuffer() => _ffi.rlLoadFramebuffer();

  @override
  void rlFramebufferAttach(
    int fboId,
    int texId,
    int attachType,
    int texType,
    int mipLevel,
  ) => _ffi.rlFramebufferAttach(
    fboId,
    texId,
    attachType,
    texType,
    mipLevel,
  );

  @override
  bool rlFramebufferComplete(
    int id,
  ) => _ffi.rlFramebufferComplete(
    id,
  );

  @override
  void rlUnloadFramebuffer(
    int id,
  ) => _ffi.rlUnloadFramebuffer(
    id,
  );

  @override
  void rlCopyFramebuffer(
    int x,
    int y,
    int width,
    int height,
    int format,
    XPtr<XVoid> pixels,
  ) => _ffi.rlCopyFramebuffer(
    x,
    y,
    width,
    height,
    format,
    pixels.asNative(),
  );

  @override
  void rlResizeFramebuffer(
    int width,
    int height,
  ) => _ffi.rlResizeFramebuffer(
    width,
    height,
  );

  @override
  int rlLoadShader(
    XPtr<XChar> code,
    int type,
  ) => _ffi.rlLoadShader(
    code.asNative(),
    type,
  );

  @override
  int rlLoadShaderProgram(
    XPtr<XChar> vsCode,
    XPtr<XChar> fsCode,
  ) => _ffi.rlLoadShaderProgram(
    vsCode.asNative(),
    fsCode.asNative(),
  );

  @override
  int rlLoadShaderProgramEx(
    int vsId,
    int fsId,
  ) => _ffi.rlLoadShaderProgramEx(
    vsId,
    fsId,
  );

  @override
  int rlLoadShaderProgramCompute(
    int csId,
  ) => _ffi.rlLoadShaderProgramCompute(
    csId,
  );

  @override
  void rlUnloadShader(
    int id,
  ) => _ffi.rlUnloadShader(
    id,
  );

  @override
  void rlUnloadShaderProgram(
    int id,
  ) => _ffi.rlUnloadShaderProgram(
    id,
  );

  @override
  int rlGetLocationUniform(
    int shaderId,
    XPtr<XChar> uniformName,
  ) => _ffi.rlGetLocationUniform(
    shaderId,
    uniformName.asNative(),
  );

  @override
  int rlGetLocationAttrib(
    int shaderId,
    XPtr<XChar> attribName,
  ) => _ffi.rlGetLocationAttrib(
    shaderId,
    attribName.asNative(),
  );

  @override
  void rlSetUniform(
    int locIndex,
    XPtr<XVoid> value,
    int uniformType,
    int count,
  ) => _ffi.rlSetUniform(
    locIndex,
    value.asNative(),
    uniformType,
    count,
  );

  @override
  void rlSetUniformMatrix(
    int locIndex,
    Matrix mat,
  ) => _ffi.rlSetUniformMatrix(
    locIndex,
    Matrix$.Ref1(mat).asNative<MatrixC>().ref,
  );

  @override
  void rlSetUniformMatrices(
    int locIndex,
    XStructPtr<Matrix> mat,
    int count,
  ) => _ffi.rlSetUniformMatrices(
    locIndex,
    mat.asNative(),
    count,
  );

  @override
  void rlSetUniformSampler(
    int locIndex,
    int textureId,
  ) => _ffi.rlSetUniformSampler(
    locIndex,
    textureId,
  );

  @override
  void rlSetShader(
    int id,
    XPtr<XInt> locs,
  ) => _ffi.rlSetShader(
    id,
    locs.asNative(),
  );

  @override
  void rlComputeShaderDispatch(
    int groupX,
    int groupY,
    int groupZ,
  ) => _ffi.rlComputeShaderDispatch(
    groupX,
    groupY,
    groupZ,
  );

  @override
  int rlLoadShaderBuffer(
    int size,
    XPtr<XVoid> data,
    int usageHint,
  ) => _ffi.rlLoadShaderBuffer(
    size,
    data.asNative(),
    usageHint,
  );

  @override
  void rlUnloadShaderBuffer(
    int ssboId,
  ) => _ffi.rlUnloadShaderBuffer(
    ssboId,
  );

  @override
  void rlUpdateShaderBuffer(
    int id,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  ) => _ffi.rlUpdateShaderBuffer(
    id,
    data.asNative(),
    dataSize,
    offset,
  );

  @override
  void rlBindShaderBuffer(
    int id,
    int index,
  ) => _ffi.rlBindShaderBuffer(
    id,
    index,
  );

  @override
  void rlReadShaderBuffer(
    int id,
    XPtr<XVoid> dest,
    int count,
    int offset,
  ) => _ffi.rlReadShaderBuffer(
    id,
    dest.asNative(),
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
  ) => _ffi.rlCopyShaderBuffer(
    destId,
    srcId,
    destOffset,
    srcOffset,
    count,
  );

  @override
  int rlGetShaderBufferSize(
    int id,
  ) => _ffi.rlGetShaderBufferSize(
    id,
  );

  @override
  void rlBindImageTexture(
    int id,
    int index,
    int format,
    bool readonly,
  ) => _ffi.rlBindImageTexture(
    id,
    index,
    format,
    readonly,
  );

  @override
  Matrix rlGetMatrixModelview() => Matrix$.Extract(
    (p) => _ffi.rlGetMatrixModelview().toDart(p.asNative()),
  );

  @override
  Matrix rlGetMatrixProjection() => Matrix$.Extract(
    (p) => _ffi.rlGetMatrixProjection().toDart(p.asNative()),
  );

  @override
  Matrix rlGetMatrixTransform() => Matrix$.Extract(
    (p) => _ffi.rlGetMatrixTransform().toDart(p.asNative()),
  );

  @override
  Matrix rlGetMatrixProjectionStereo(
    int eye,
  ) => Matrix$.Extract(
    (p) => _ffi.rlGetMatrixProjectionStereo(
      eye,
    ).toDart(p.asNative()),
  );

  @override
  Matrix rlGetMatrixViewOffsetStereo(
    int eye,
  ) => Matrix$.Extract(
    (p) => _ffi.rlGetMatrixViewOffsetStereo(
      eye,
    ).toDart(p.asNative()),
  );

  @override
  void rlSetMatrixProjection(
    Matrix proj,
  ) => _ffi.rlSetMatrixProjection(
    Matrix$.Ref1(proj).asNative<MatrixC>().ref,
  );

  @override
  void rlSetMatrixModelview(
    Matrix view,
  ) => _ffi.rlSetMatrixModelview(
    Matrix$.Ref1(view).asNative<MatrixC>().ref,
  );

  @override
  void rlSetMatrixProjectionStereo(
    Matrix right,
    Matrix left,
  ) => _ffi.rlSetMatrixProjectionStereo(
    Matrix$.Ref1(right).asNative<MatrixC>().ref,
    Matrix$.Ref2(left).asNative<MatrixC>().ref,
  );

  @override
  void rlSetMatrixViewOffsetStereo(
    Matrix right,
    Matrix left,
  ) => _ffi.rlSetMatrixViewOffsetStereo(
    Matrix$.Ref1(right).asNative<MatrixC>().ref,
    Matrix$.Ref2(left).asNative<MatrixC>().ref,
  );

  @override
  void rlLoadDrawCube() => _ffi.rlLoadDrawCube();

  @override
  void rlLoadDrawQuad() => _ffi.rlLoadDrawQuad();
}
