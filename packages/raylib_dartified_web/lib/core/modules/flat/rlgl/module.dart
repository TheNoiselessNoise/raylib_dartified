part of '../../../raylib_dartified_web.dart';

final class RaylibRlglFlatWeb extends RaylibRlglFlat<Raylib> {

  RaylibRlglFlatWeb(super.rl);

  RaylibRlgl get _wasm => rl.module();

  @override
  void rlMatrixMode(
    int mode,
  ) => _wasm.rlMatrixMode(
    mode.toJS,
  );

  @override
  void rlPushMatrix() => _wasm.rlPushMatrix();

  @override
  void rlPopMatrix() => _wasm.rlPopMatrix();

  @override
  void rlLoadIdentity() => _wasm.rlLoadIdentity();

  @override
  void rlTranslatef(
    double x,
    double y,
    double z,
  ) => _wasm.rlTranslatef(
    x.toJS,
    y.toJS,
    z.toJS,
  );

  @override
  void rlRotatef(
    double angle,
    double x,
    double y,
    double z,
  ) => _wasm.rlRotatef(
    angle.toJS,
    x.toJS,
    y.toJS,
    z.toJS,
  );

  @override
  void rlScalef(
    double x,
    double y,
    double z,
  ) => _wasm.rlScalef(
    x.toJS,
    y.toJS,
    z.toJS,
  );

  @override
  void rlMultMatrixf(
    XPtr<XFloat32> matf, 
  ) => _wasm.rlMultMatrixf(
    matf.toJS,
  );

  @override
  void rlFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double znear,
    double zfar,
  ) => _wasm.rlFrustum(
    left.toJS,
    right.toJS,
    bottom.toJS,
    top.toJS,
    znear.toJS,
    zfar.toJS,
  );

  @override
  void rlOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double znear,
    double zfar,
  ) => _wasm.rlOrtho(
    left.toJS,
    right.toJS,
    bottom.toJS,
    top.toJS,
    znear.toJS,
    zfar.toJS,
  );

  @override
  void rlViewport(
    int x,
    int y,
    int width,
    int height,
  ) => _wasm.rlViewport(
    x.toJS,
    y.toJS,
    width.toJS,
    height.toJS,
  );

  @override
  void rlSetClipPlanes(
    double nearPlane,
    double farPlane,
  ) => _wasm.rlSetClipPlanes(
    nearPlane.toJS,
    farPlane.toJS,
  );

  @override
  double rlGetCullDistanceNear() => _wasm.rlGetCullDistanceNear();

  @override
  double rlGetCullDistanceFar() => _wasm.rlGetCullDistanceFar();

  @override
  void rlBegin(
    int mode,
  ) => _wasm.rlBegin(
    mode.toJS,
  );

  @override
  void rlEnd() => _wasm.rlEnd();

  @override
  void rlVertex2i(
    int x,
    int y,
  ) => _wasm.rlVertex2i(
    x.toJS,
    y.toJS,
  );

  @override
  void rlVertex2f(
    double x,
    double y,
  ) => _wasm.rlVertex2f(
    x.toJS,
    y.toJS,
  );

  @override
  void rlVertex3f(
    double x,
    double y,
    double z
  ) => _wasm.rlVertex3f(
    x.toJS,
    y.toJS,
    z.toJS,
  );

  @override
  void rlTexCoord2f(
    double x,
    double y,
  ) => _wasm.rlTexCoord2f(
    x.toJS,
    y.toJS,
  );

  @override
  void rlNormal3f(
    double x,
    double y,
    double z,
  ) => _wasm.rlNormal3f(
    x.toJS,
    y.toJS,
    z.toJS,
  );

  @override
  void rlColor4ub(
    int r,
    int g,
    int b,
    int a,
  ) => _wasm.rlColor4ub(
    r.toJS,
    g.toJS,
    b.toJS,
    a.toJS,
  );

  @override
  void rlColor3f(
    double x,
    double y,
    double z,
  ) => _wasm.rlColor3f(
    x.toJS,
    y.toJS,
    z.toJS,
  );

  @override
  void rlColor4f(
    double x,
    double y,
    double z,
    double w,
  ) => _wasm.rlColor4f(
    x.toJS,
    y.toJS,
    z.toJS,
    w.toJS,
  );

  @override
  bool rlEnableVertexArray(
    int vaoId,
  ) => _wasm.rlEnableVertexArray(
    vaoId.toJS,
  );

  @override
  void rlDisableVertexArray() => _wasm.rlDisableVertexArray();

  @override
  void rlEnableVertexBuffer(
    int id,
  ) => _wasm.rlEnableVertexBuffer(
    id.toJS,
  );

  @override
  void rlDisableVertexBuffer() => _wasm.rlDisableVertexBuffer();

  @override
  void rlEnableVertexBufferElement(
    int id,
  ) => _wasm.rlEnableVertexBufferElement(
    id.toJS,
  );

  @override
  void rlDisableVertexBufferElement() => _wasm.rlDisableVertexBufferElement();

  @override
  void rlEnableVertexAttribute(
    int index,
  ) => _wasm.rlEnableVertexAttribute(
    index.toJS,
  );

  @override
  void rlDisableVertexAttribute(
    int index,
  ) => _wasm.rlDisableVertexAttribute(
    index.toJS,
  );

  @override
  void rlEnableStatePointer(
    int vertexAttribType,
    XPtr<XVoid> buffer,
  ) => _wasm.rlEnableStatePointer(
    vertexAttribType.toJS,
    buffer.toJS,
  );

  @override
  void rlDisableStatePointer(
    int vertexAttribType,
  ) => _wasm.rlDisableStatePointer(
    vertexAttribType.toJS,
  );

  @override
  void rlActiveTextureSlot(
    int slot,
  ) => _wasm.rlActiveTextureSlot(
    slot.toJS,
  );

  @override
  void rlEnableTexture(
    int id,
  ) => _wasm.rlEnableTexture(
    id.toJS,
  );

  @override
  void rlDisableTexture() => _wasm.rlDisableTexture();

  @override
  void rlEnableTextureCubemap(
    int id,
  ) => _wasm.rlEnableTextureCubemap(
    id.toJS,
  );

  @override
  void rlDisableTextureCubemap() => _wasm.rlDisableTextureCubemap();

  @override
  void rlTextureParameters(
    int id,
    int param,
    int value,
  ) => _wasm.rlTextureParameters(
    id.toJS,
    param.toJS,
    value.toJS,
  );

  @override
  void rlCubemapParameters(
    int id,
    int param,
    int value,
  ) => _wasm.rlCubemapParameters(
    id.toJS,
    param.toJS,
    value.toJS,
  );

  @override
  void rlEnableShader(
    int id,
  ) => _wasm.rlEnableShader(
    id.toJS,
  );

  @override
  void rlDisableShader() => _wasm.rlDisableShader();

  @override
  void rlEnableFramebuffer(
    int id,
  ) => _wasm.rlEnableFramebuffer(
    id.toJS,
  );

  @override
  void rlDisableFramebuffer() => _wasm.rlDisableFramebuffer();

  @override
  int rlGetActiveFramebuffer() => _wasm.rlGetActiveFramebuffer();

  @override
  void rlActiveDrawBuffers(
    int count,
  ) => _wasm.rlActiveDrawBuffers(
    count.toJS,
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
  ) => _wasm.rlBlitFramebuffer(
    srcX.toJS,
    srcY.toJS,
    srcWidth.toJS,
    srcHeight.toJS,
    dstX.toJS,
    dstY.toJS,
    dstWidth.toJS,
    dstHeight.toJS,
    bufferMask.toJS,
  );

  @override
  void rlBindFramebuffer(
    int target,
    int framebuffer,
  ) => _wasm.rlBindFramebuffer(
    target.toJS,
    framebuffer.toJS,
  );

  @override
  void rlEnableColorBlend() => _wasm.rlEnableColorBlend();

  @override
  void rlDisableColorBlend() => _wasm.rlDisableColorBlend();

  @override
  void rlEnableDepthTest() => _wasm.rlEnableDepthTest();

  @override
  void rlDisableDepthTest() => _wasm.rlDisableDepthTest();

  @override
  void rlEnableDepthMask() => _wasm.rlEnableDepthMask();

  @override
  void rlDisableDepthMask() => _wasm.rlDisableDepthMask();

  @override
  void rlEnableBackfaceCulling() => _wasm.rlEnableBackfaceCulling();

  @override
  void rlDisableBackfaceCulling() => _wasm.rlDisableBackfaceCulling();

  @override
  void rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => _wasm.rlColorMask(
    r.toJS,
    g.toJS,
    b.toJS,
    a.toJS,
  );

  @override
  void rlSetCullFace(
    int mode,
  ) => _wasm.rlSetCullFace(
    mode.toJS,
  );

  @override
  void rlEnableScissorTest() => _wasm.rlEnableScissorTest();

  @override
  void rlDisableScissorTest() => _wasm.rlDisableScissorTest();

  @override
  void rlScissor(
    int x,
    int y,
    int width,
    int height,
  ) => _wasm.rlScissor(
    x.toJS,
    y.toJS,
    width.toJS,
    height.toJS,
  );

  @override
  void rlEnablePointMode() => _wasm.rlEnablePointMode();

  @override
  void rlDisablePointMode() => _wasm.rlDisablePointMode();

  @override
  void rlSetPointSize(
    double size,
  ) => _wasm.rlSetPointSize(
    size.toJS,
  );

  @override
  double rlGetPointSize() => _wasm.rlGetPointSize();

  @override
  void rlEnableWireMode() => _wasm.rlEnableWireMode();

  @override
  void rlDisableWireMode() => _wasm.rlDisableWireMode();

  @override
  void rlSetLineWidth(
    double width,
  ) => _wasm.rlSetLineWidth(
    width.toJS,
  );

  @override
  double rlGetLineWidth() => _wasm.rlGetLineWidth();

  @override
  void rlEnableSmoothLines() => _wasm.rlEnableSmoothLines();

  @override
  void rlDisableSmoothLines() => _wasm.rlDisableSmoothLines();

  @override
  void rlEnableStereoRender() => _wasm.rlEnableStereoRender();

  @override
  void rlDisableStereoRender() => _wasm.rlDisableStereoRender();

  @override
  bool rlIsStereoRenderEnabled() => _wasm.rlIsStereoRenderEnabled();

  @override
  void rlClearColor(
    int r,
    int g,
    int b,
    int a,
  ) => _wasm.rlClearColor(
    r.toJS,
    g.toJS,
    b.toJS,
    a.toJS,
  );

  @override
  void rlClearScreenBuffers() => _wasm.rlClearScreenBuffers();

  @override
  void rlCheckErrors() => _wasm.rlCheckErrors();

  @override
  void rlSetBlendMode(
    int mode,
  ) => _wasm.rlSetBlendMode(
    mode.toJS,
  );

  @override
  void rlSetBlendFactors(
    int glSrcFactor,
    int glDstFactor,
    int glEquation,
  ) => _wasm.rlSetBlendFactors(
    glSrcFactor.toJS,
    glDstFactor.toJS,
    glEquation.toJS,
  );

  @override
  void rlSetBlendFactorsSeparate(
    int glSrcRGB,
    int glDstRGB,
    int glSrcAlpha,
    int glDstAlpha,
    int glEqRGB,
    int glEqAlpha,
  ) => _wasm.rlSetBlendFactorsSeparate(
    glSrcRGB.toJS,
    glDstRGB.toJS,
    glSrcAlpha.toJS,
    glDstAlpha.toJS,
    glEqRGB.toJS,
    glEqAlpha.toJS,
  );

  @override
  void rlglInit(
    int width,
    int height,
  ) => _wasm.rlglInit(
    width.toJS,
    height.toJS,
  );

  @override
  void rlglClose() => _wasm.rlglClose();

  @override
  void rlLoadExtensions(
    XPtr<XVoid> loader,
  ) => _wasm.rlLoadExtensions(
    loader.toJS,
  );

  @override
  XWasmPtr<XVoid> rlGetProcAddress(
    XPtr<XChar> procName,
  ) => _wasm.rlGetProcAddress(
    procName.toJS,
  );

  @override
  int rlGetVersion() => _wasm.rlGetVersion();

  @override
  void rlSetFramebufferWidth(
    int width,
  ) => _wasm.rlSetFramebufferWidth(
    width.toJS,
  );

  @override
  int rlGetFramebufferWidth() => _wasm.rlGetFramebufferWidth();

  @override
  void rlSetFramebufferHeight(
    int height,
  ) => _wasm.rlSetFramebufferHeight(
    height.toJS,
  );

  @override
  int rlGetFramebufferHeight() => _wasm.rlGetFramebufferHeight();

  @override
  int rlGetTextureIdDefault() => _wasm.rlGetTextureIdDefault();

  @override
  int rlGetShaderIdDefault() => _wasm.rlGetShaderIdDefault();

  @override
  XWasmPtr<XInt> rlGetShaderLocsDefault() => _wasm.rlGetShaderLocsDefault();

  @override
  RlRenderBatch rlLoadRenderBatch(
    int numBuffers,
    int bufferElements,
  ) => RlRenderBatch$.RefCapture(
    RaylibCaptureIds.rlLoadRenderBatch,
    (p) => _wasm.rlLoadRenderBatch(
      p.toJS,
      numBuffers.toJS,
      bufferElements.toJS,
    ),
  );

  @override
  void rlUnloadRenderBatch(
    RlRenderBatch batch,
  ) => _wasm.rlUnloadRenderBatch(
    RlRenderBatch$.Ref1(batch).toJS,
  );

  @override
  void rlDrawRenderBatch(
    XStructPtr<RlRenderBatch> batch,
  ) => _wasm.rlDrawRenderBatch(
    batch.toJS,
  );

  @override
  void rlSetRenderBatchActive(
    XStructPtr<RlRenderBatch> batch,
  ) => _wasm.rlSetRenderBatchActive(
    batch.toJS,
  );

  @override
  void rlDrawRenderBatchActive() => _wasm.rlDrawRenderBatchActive();

  @override
  bool rlCheckRenderBatchLimit(
    int vCount,
  ) => _wasm.rlCheckRenderBatchLimit(
    vCount.toJS,
  );

  @override
  void rlSetTexture(
    int id,
  ) => _wasm.rlSetTexture(
    id.toJS,
  );

  @override
  int rlLoadVertexArray() => _wasm.rlLoadVertexArray();

  @override
  int rlLoadVertexBuffer(
    XPtr<XVoid> buffer,
    int size,
    bool dynamic,
  ) => _wasm.rlLoadVertexBuffer(
    buffer.toJS,
    size.toJS,
    dynamic.toJS,
  );

  @override
  int rlLoadVertexBufferElement(
    XPtr<XVoid> buffer,
    int size,
    bool dynamic,
  ) => _wasm.rlLoadVertexBufferElement(
    buffer.toJS,
    size.toJS,
    dynamic.toJS,
  );

  @override
  void rlUpdateVertexBuffer(
    int bufferId,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  ) => _wasm.rlUpdateVertexBuffer(
    bufferId.toJS,
    data.toJS,
    dataSize.toJS,
    offset.toJS,
  );

  @override
  void rlUpdateVertexBufferElements(
    int id,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  ) => _wasm.rlUpdateVertexBufferElements(
    id.toJS,
    data.toJS,
    dataSize.toJS,
    offset.toJS,
  );

  @override
  void rlUnloadVertexArray(
    int vaoId,
  ) => _wasm.rlUnloadVertexArray(
    vaoId.toJS,
  );

  @override
  void rlUnloadVertexBuffer(
    int vboId,
  ) => _wasm.rlUnloadVertexBuffer(
    vboId.toJS,
  );

  @override
  void rlSetVertexAttribute(
    int index,
    int compSize,
    int type,
    bool normalized,
    int stride,
    int offset,
  ) => _wasm.rlSetVertexAttribute(
    index.toJS,
    compSize.toJS,
    type.toJS,
    normalized.toJS,
    stride.toJS,
    offset.toJS,
  );

  @override
  void rlSetVertexAttributeDivisor(
    int index,
    int divisor,
  ) => _wasm.rlSetVertexAttributeDivisor(
    index.toJS,
    divisor.toJS,
  );

  @override
  void rlSetVertexAttributeDefault(
    int locIndex,
    XPtr<XVoid> value,
    int attribType,
    int count,
  ) => _wasm.rlSetVertexAttributeDefault(
    locIndex.toJS,
    value.toJS,
    attribType.toJS,
    count.toJS,
  );

  @override
  void rlDrawVertexArray(
    int offset,
    int count,
  ) => _wasm.rlDrawVertexArray(
    offset.toJS,
    count.toJS,
  );

  @override
  void rlDrawVertexArrayElements(
    int offset,
    int count,
    XPtr<XVoid> buffer,
  ) => _wasm.rlDrawVertexArrayElements(
    offset.toJS,
    count.toJS,
    buffer.toJS,
  );

  @override
  void rlDrawVertexArrayInstanced(
    int offset,
    int count,
    int instances,
  ) => _wasm.rlDrawVertexArrayInstanced(
    offset.toJS,
    count.toJS,
    instances.toJS,
  );

  @override
  void rlDrawVertexArrayElementsInstanced(
    int offset,
    int count,
    XPtr<XVoid> buffer,
    int instances,
  ) => _wasm.rlDrawVertexArrayElementsInstanced(
    offset.toJS,
    count.toJS,
    buffer.toJS,
    instances.toJS,
  );

  @override
  int rlLoadTexture(
    XPtr<XVoid> data,
    int width,
    int height,
    int format,
    int mipmapCount,
  ) => _wasm.rlLoadTexture(
    data.toJS,
    width.toJS,
    height.toJS,
    format.toJS,
    mipmapCount.toJS,
  );

  @override
  int rlLoadTextureDepth(
    int width,
    int height,
    bool useRenderBuffer,
  ) => _wasm.rlLoadTextureDepth(
    width.toJS,
    height.toJS,
    useRenderBuffer.toJS,
  );

  @override
  int rlLoadTextureCubemap(
    XPtr<XVoid> data,
    int size,
    int format,
    int mipmapCount,
  ) => _wasm.rlLoadTextureCubemap(
    data.toJS,
    size.toJS,
    format.toJS,
    mipmapCount.toJS,
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
  ) => _wasm.rlUpdateTexture(
    id.toJS,
    offsetX.toJS,
    offsetY.toJS,
    width.toJS,
    height.toJS,
    format.toJS,
    data.toJS,
  );

  @override
  void rlGetGlTextureFormats(
    int format,
    XPtr<XUnsignedInt> glInternalFormat,
    XPtr<XUnsignedInt> glFormat,
    XPtr<XUnsignedInt> glType,
  ) => _wasm.rlGetGlTextureFormats(
    format.toJS,
    glInternalFormat.toJS,
    glFormat.toJS,
    glType.toJS,
  );

  @override
  XWasmPtr<XChar> rlGetPixelFormatName(
    int format,
  ) => _wasm.rlGetPixelFormatName(
    format.toJS,
  );

  @override
  void rlUnloadTexture(
    int id,
  ) => _wasm.rlUnloadTexture(
    id.toJS,
  );

  @override
  void rlGenTextureMipmaps(
    int id,
    int width,
    int height,
    int format,
    XPtr<XInt> mipmaps,
  ) => _wasm.rlGenTextureMipmaps(
    id.toJS,
    width.toJS,
    height.toJS,
    format.toJS,
    mipmaps.toJS, 
  );

  @override
  XWasmPtr<XVoid> rlReadTexturePixels(
    int id,
    int width,
    int height,
    int format,
  ) => _wasm.rlReadTexturePixels(
    id.toJS,
    width.toJS,
    height.toJS,
    format.toJS,
  );

  @override
  XWasmPtr<XUnsignedChar> rlReadScreenPixels(
    int width,
    int height,
  ) => _wasm.rlReadScreenPixels(
    width.toJS,
    height.toJS,
  );

  @override
  int rlLoadFramebuffer() => _wasm.rlLoadFramebuffer();

  @override
  void rlFramebufferAttach(
    int fboId,
    int texId,
    int attachType,
    int texType,
    int mipLevel,
  ) => _wasm.rlFramebufferAttach(
    fboId.toJS,
    texId.toJS,
    attachType.toJS,
    texType.toJS,
    mipLevel.toJS,
  );

  @override
  bool rlFramebufferComplete(
    int id,
  ) => _wasm.rlFramebufferComplete(
    id.toJS,
  );

  @override
  void rlUnloadFramebuffer(
    int id,
  ) => _wasm.rlUnloadFramebuffer(
    id.toJS,
  );

  @override
  void rlCopyFramebuffer(
    int x,
    int y,
    int width,
    int height,
    int format,
    XPtr<XVoid> pixels,
  ) => _wasm.rlCopyFramebuffer(
    x.toJS,
    y.toJS,
    width.toJS,
    height.toJS,
    format.toJS,
    pixels.toJS,
  );

  @override
  void rlResizeFramebuffer(
    int width,
    int height,
  ) => _wasm.rlResizeFramebuffer(
    width.toJS,
    height.toJS,
  );

  @override
  int rlLoadShader(
    XPtr<XChar> code,
    int type,
  ) => _wasm.rlLoadShader(
    code.toJS,
    type.toJS,
  );

  @override
  int rlLoadShaderProgram(
    XPtr<XChar> vsCode,
    XPtr<XChar> fsCode,
  ) => _wasm.rlLoadShaderProgram(
    vsCode.toJS,
    fsCode.toJS,
  );

  @override
  int rlLoadShaderProgramEx(
    int vsId,
    int fsId,
  ) => _wasm.rlLoadShaderProgramEx(
    vsId.toJS,
    fsId.toJS,
  );

  @override
  int rlLoadShaderProgramCompute(
    int csId,
  ) => _wasm.rlLoadShaderProgramCompute(
    csId.toJS,
  );

  @override
  void rlUnloadShader(
    int id,
  ) => _wasm.rlUnloadShader(
    id.toJS,
  );

  @override
  void rlUnloadShaderProgram(
    int id,
  ) => _wasm.rlUnloadShaderProgram(
    id.toJS,
  );

  @override
  int rlGetLocationUniform(
    int shaderId,
    XPtr<XChar> uniformName,
  ) => _wasm.rlGetLocationUniform(
    shaderId.toJS,
    uniformName.toJS,
  );

  @override
  int rlGetLocationAttrib(
    int shaderId,
    XPtr<XChar> attribName,
  ) => _wasm.rlGetLocationAttrib(
    shaderId.toJS,
    attribName.toJS,
  );

  @override
  void rlSetUniform(
    int locIndex,
    XPtr<XVoid> value,
    int uniformType,
    int count,
  ) => _wasm.rlSetUniform(
    locIndex.toJS,
    value.toJS,
    uniformType.toJS,
    count.toJS,
  );

  @override
  void rlSetUniformMatrix(
    int locIndex,
    Matrix mat,
  ) => _wasm.rlSetUniformMatrix(
    locIndex.toJS,
    Matrix$.Ref1(mat).toJS,
  );

  @override
  void rlSetUniformMatrices(
    int locIndex,
    XStructPtr<Matrix> mat,
    int count,
  ) => _wasm.rlSetUniformMatrices(
    locIndex.toJS,
    mat.toJS,
    count.toJS,
  );

  @override
  void rlSetUniformSampler(
    int locIndex,
    int textureId,
  ) => _wasm.rlSetUniformSampler(
    locIndex.toJS,
    textureId.toJS,
  );

  @override
  void rlSetShader(
    int id,
    XPtr<XInt> locs,
  ) => _wasm.rlSetShader(
    id.toJS,
    locs.toJS,
  );

  @override
  void rlComputeShaderDispatch(
    int groupX,
    int groupY,
    int groupZ,
  ) => _wasm.rlComputeShaderDispatch(
    groupX.toJS,
    groupY.toJS,
    groupZ.toJS,
  );

  @override
  int rlLoadShaderBuffer(
    int size,
    XPtr<XVoid> data,
    int usageHint,
  ) => _wasm.rlLoadShaderBuffer(
    size.toJS,
    data.toJS,
    usageHint.toJS,
  );

  @override
  void rlUnloadShaderBuffer(
    int ssboId,
  ) => _wasm.rlUnloadShaderBuffer(
    ssboId.toJS,
  );

  @override
  void rlUpdateShaderBuffer(
    int id,
    XPtr<XVoid> data,
    int dataSize,
    int offset,
  ) => _wasm.rlUpdateShaderBuffer(
    id.toJS,
    data.toJS,
    dataSize.toJS,
    offset.toJS,
  );

  @override
  void rlBindShaderBuffer(
    int id,
    int index,
  ) => _wasm.rlBindShaderBuffer(
    id.toJS,
    index.toJS,
  );

  @override
  void rlReadShaderBuffer(
    int id,
    XPtr<XVoid> dest,
    int count,
    int offset,
  ) => _wasm.rlReadShaderBuffer(
    id.toJS,
    dest.toJS,
    count.toJS,
    offset.toJS,
  );

  @override
  void rlCopyShaderBuffer(
    int destId,
    int srcId,
    int destOffset,
    int srcOffset,
    int count,
  ) => _wasm.rlCopyShaderBuffer(
    destId.toJS,
    srcId.toJS,
    destOffset.toJS,
    srcOffset.toJS,
    count.toJS,
  );

  @override
  int rlGetShaderBufferSize(
    int id,
  ) => _wasm.rlGetShaderBufferSize(
    id.toJS,
  );

  @override
  void rlBindImageTexture(
    int id,
    int index,
    int format,
    bool readonly,
  ) => _wasm.rlBindImageTexture(
    id.toJS,
    index.toJS,
    format.toJS,
    readonly.toJS,
  );

  @override
  Matrix rlGetMatrixModelview() => Matrix$.Extract(
    (p) => _wasm.rlGetMatrixModelview(
      p.toJS,
    ),
  );

  @override
  Matrix rlGetMatrixProjection() => Matrix$.Extract(
    (p) => _wasm.rlGetMatrixProjection(
      p.toJS,
    ),
  );

  @override
  Matrix rlGetMatrixTransform() => Matrix$.Extract(
    (p) => _wasm.rlGetMatrixTransform(
      p.toJS,
    ),
  );

  @override
  Matrix rlGetMatrixProjectionStereo(
    int eye,
  ) => Matrix$.Extract(
    (p) => _wasm.rlGetMatrixProjectionStereo(
      p.toJS,
      eye.toJS,
    ),
  );

  @override
  Matrix rlGetMatrixViewOffsetStereo(
    int eye,
  ) => Matrix$.Extract(
    (p) => _wasm.rlGetMatrixViewOffsetStereo(
      p.toJS,
      eye.toJS,
    ),
  );

  @override
  void rlSetMatrixProjection(
    Matrix proj,
  ) => _wasm.rlSetMatrixProjection(
    Matrix$.Ref1(proj).toJS,
  );

  @override
  void rlSetMatrixModelview(
    Matrix view,
  ) => _wasm.rlSetMatrixModelview(
    Matrix$.Ref1(view).toJS,
  );

  @override
  void rlSetMatrixProjectionStereo(
    Matrix right,
    Matrix left,
  ) => _wasm.rlSetMatrixProjectionStereo(
    Matrix$.Ref1(right).toJS,
    Matrix$.Ref2(left).toJS,
  );

  @override
  void rlSetMatrixViewOffsetStereo(
    Matrix right,
    Matrix left,
  ) => _wasm.rlSetMatrixViewOffsetStereo(
    Matrix$.Ref1(right).toJS,
    Matrix$.Ref2(left).toJS,
  );

  @override
  void rlLoadDrawCube() => _wasm.rlLoadDrawCube();

  @override
  void rlLoadDrawQuad() => _wasm.rlLoadDrawQuad();
}