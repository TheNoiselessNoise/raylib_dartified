import 'dart:ffi';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibRlgl get _module => Raylib.instance.module();

/// See [RaylibRlgl.rlMatrixMode].
void rlMatrixMode(int mode) => _module.rlMatrixMode(mode);

/// See [RaylibRlgl.rlPushMatrix].
void rlPushMatrix() => _module.rlPushMatrix();

/// See [RaylibRlgl.rlPopMatrix].
void rlPopMatrix() => _module.rlPopMatrix();

/// See [RaylibRlgl.rlLoadIdentity].
void rlLoadIdentity() => _module.rlLoadIdentity();

/// See [RaylibRlgl.rlTranslatef].
void rlTranslatef(double x, double y, double z) => _module.rlTranslatef(x, y, z);

/// See [RaylibRlgl.rlRotatef].
void rlRotatef(double angle, double x, double y, double z) => _module.rlRotatef(angle, x, y, z);

/// See [RaylibRlgl.rlScalef].
void rlScalef(double x, double y, double z) => _module.rlScalef(x, y, z);

/// See [RaylibRlgl.rlMultMatrixf].
void rlMultMatrixf(Pointer<Float> matf) => _module.rlMultMatrixf(matf);

/// See [RaylibRlgl.rlFrustum].
void rlFrustum(
  double left,
  double right,
  double bottom,
  double top,
  double znear,
  double zfar,
) => _module.rlFrustum(left, right, bottom, top, znear, zfar);

/// See [RaylibRlgl.rlOrtho].
void rlOrtho(
  double left,
  double right,
  double bottom,
  double top,
  double znear,
  double zfar,
) => _module.rlOrtho(left, right, bottom, top, znear, zfar);

/// See [RaylibRlgl.rlViewport].
void rlViewport(int x, int y, int width, int height) => _module.rlViewport(x, y, width, height);

/// See [RaylibRlgl.rlSetClipPlanes].
void rlSetClipPlanes(double nearPlane, double farPlane) => _module.rlSetClipPlanes(nearPlane, farPlane);

/// See [RaylibRlgl.rlGetCullDistanceNear].
double rlGetCullDistanceNear() => _module.rlGetCullDistanceNear();

/// See [RaylibRlgl.rlGetCullDistanceFar].
double rlGetCullDistanceFar() => _module.rlGetCullDistanceFar();

/// See [RaylibRlgl.rlBegin].
void rlBegin(int mode) => _module.rlBegin(mode);

/// See [RaylibRlgl.rlEnd].
void rlEnd() => _module.rlEnd();

/// See [RaylibRlgl.rlVertex2i].
void rlVertex2i(int x, int y) => _module.rlVertex2i(x, y);

/// See [RaylibRlgl.rlVertex2f].
void rlVertex2f(double x, double y) => _module.rlVertex2f(x, y);

/// See [RaylibRlgl.rlVertex3f].
void rlVertex3f(double x, double y, double z) => _module.rlVertex3f(x, y, z);

/// See [RaylibRlgl.rlTexCoord2f].
void rlTexCoord2f(double x, double y) => _module.rlTexCoord2f(x, y);

/// See [RaylibRlgl.rlNormal3f].
void rlNormal3f(double x, double y, double z) => _module.rlNormal3f(x, y, z);

/// See [RaylibRlgl.rlColor4ub].
void rlColor4ub(int r, int g, int b, int a) => _module.rlColor4ub(r, g, b, a);

/// See [RaylibRlgl.rlColor3f].
void rlColor3f(double x, double y, double z) => _module.rlColor3f(x, y, z);

/// See [RaylibRlgl.rlColor4f].
void rlColor4f(double x, double y, double z, double w) => _module.rlColor4f(x, y, z, w);

/// See [RaylibRlgl.rlEnableVertexArray].
bool rlEnableVertexArray(int vaoId) => _module.rlEnableVertexArray(vaoId);

/// See [RaylibRlgl.rlDisableVertexArray].
void rlDisableVertexArray() => _module.rlDisableVertexArray();

/// See [RaylibRlgl.rlEnableVertexBuffer].
void rlEnableVertexBuffer(int id) => _module.rlEnableVertexBuffer(id);

/// See [RaylibRlgl.rlDisableVertexBuffer].
void rlDisableVertexBuffer() => _module.rlDisableVertexBuffer();

/// See [RaylibRlgl.rlEnableVertexBufferElement].
void rlEnableVertexBufferElement(int id) => _module.rlEnableVertexBufferElement(id);

/// See [RaylibRlgl.rlDisableVertexBufferElement].
void rlDisableVertexBufferElement() => _module.rlDisableVertexBufferElement();

/// See [RaylibRlgl.rlEnableVertexAttribute].
void rlEnableVertexAttribute(int index) => _module.rlEnableVertexAttribute(index);

/// See [RaylibRlgl.rlDisableVertexAttribute].
void rlDisableVertexAttribute(int index) => _module.rlDisableVertexAttribute(index);

/// See [RaylibRlgl.rlEnableStatePointer].
void rlEnableStatePointer(
  int vertexAttribType,
  Pointer<Void> buffer,
) => _module.rlEnableStatePointer(vertexAttribType, buffer);

/// See [RaylibRlgl.rlDisableStatePointer].
void rlDisableStatePointer(int vertexAttribType) => _module.rlDisableStatePointer(vertexAttribType);

/// See [RaylibRlgl.rlActiveTextureSlot].
void rlActiveTextureSlot(int slot) => _module.rlActiveTextureSlot(slot);

/// See [RaylibRlgl.rlEnableTexture].
void rlEnableTexture(int id) => _module.rlEnableTexture(id);

/// See [RaylibRlgl.rlDisableTexture].
void rlDisableTexture() => _module.rlDisableTexture();

/// See [RaylibRlgl.rlEnableTextureCubemap].
void rlEnableTextureCubemap(int id) => _module.rlEnableTextureCubemap(id);

/// See [RaylibRlgl.rlDisableTextureCubemap].
void rlDisableTextureCubemap() => _module.rlDisableTextureCubemap();

/// See [RaylibRlgl.rlTextureParameters].
void rlTextureParameters(int id, int param, int value) => _module.rlTextureParameters(id, param, value);

/// See [RaylibRlgl.rlCubemapParameters].
void rlCubemapParameters(int id, int param, int value) => _module.rlCubemapParameters(id, param, value);

/// See [RaylibRlgl.rlEnableShader].
void rlEnableShader(int id) => _module.rlEnableShader(id);

/// See [RaylibRlgl.rlDisableShader].
void rlDisableShader() => _module.rlDisableShader();

/// See [RaylibRlgl.rlEnableFramebuffer].
void rlEnableFramebuffer(int id) => _module.rlEnableFramebuffer(id);

/// See [RaylibRlgl.rlDisableFramebuffer].
void rlDisableFramebuffer() => _module.rlDisableFramebuffer();

/// See [RaylibRlgl.rlGetActiveFramebuffer].
int rlGetActiveFramebuffer() => _module.rlGetActiveFramebuffer();

/// See [RaylibRlgl.rlActiveDrawBuffers].
void rlActiveDrawBuffers(int count) => _module.rlActiveDrawBuffers(count);

/// See [RaylibRlgl.rlBlitFramebuffer].
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
) => _module.rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask);

/// See [RaylibRlgl.rlBindFramebuffer].
void rlBindFramebuffer(int target, int framebuffer) => _module.rlBindFramebuffer(target, framebuffer);

/// See [RaylibRlgl.rlEnableColorBlend].
void rlEnableColorBlend() => _module.rlEnableColorBlend();

/// See [RaylibRlgl.rlDisableColorBlend].
void rlDisableColorBlend() => _module.rlDisableColorBlend();

/// See [RaylibRlgl.rlEnableDepthTest].
void rlEnableDepthTest() => _module.rlEnableDepthTest();

/// See [RaylibRlgl.rlDisableDepthTest].
void rlDisableDepthTest() => _module.rlDisableDepthTest();

/// See [RaylibRlgl.rlEnableDepthMask].
void rlEnableDepthMask() => _module.rlEnableDepthMask();

/// See [RaylibRlgl.rlDisableDepthMask].
void rlDisableDepthMask() => _module.rlDisableDepthMask();

/// See [RaylibRlgl.rlEnableBackfaceCulling].
void rlEnableBackfaceCulling() => _module.rlEnableBackfaceCulling();

/// See [RaylibRlgl.rlDisableBackfaceCulling].
void rlDisableBackfaceCulling() => _module.rlDisableBackfaceCulling();

/// See [RaylibRlgl.rlColorMask].
void rlColorMask(bool r, bool g, bool b, bool a) => _module.rlColorMask(r, g, b, a);

/// See [RaylibRlgl.rlSetCullFace].
void rlSetCullFace(int mode) => _module.rlSetCullFace(mode);

/// See [RaylibRlgl.rlEnableScissorTest].
void rlEnableScissorTest() => _module.rlEnableScissorTest();

/// See [RaylibRlgl.rlDisableScissorTest].
void rlDisableScissorTest() => _module.rlDisableScissorTest();

/// See [RaylibRlgl.rlScissor].
void rlScissor(int x, int y, int width, int height) => _module.rlScissor(x, y, width, height);

/// See [RaylibRlgl.rlEnablePointMode].
void rlEnablePointMode() => _module.rlEnablePointMode();

/// See [RaylibRlgl.rlDisablePointMode].
void rlDisablePointMode() => _module.rlDisablePointMode();

/// See [RaylibRlgl.rlSetPointSize].
void rlSetPointSize(double size) => _module.rlSetPointSize(size);

/// See [RaylibRlgl.rlGetPointSize].
double rlGetPointSize() => _module.rlGetPointSize();

/// See [RaylibRlgl.rlEnableWireMode].
void rlEnableWireMode() => _module.rlEnableWireMode();

/// See [RaylibRlgl.rlDisableWireMode].
void rlDisableWireMode() => _module.rlDisableWireMode();

/// See [RaylibRlgl.rlSetLineWidth].
void rlSetLineWidth(double width) => _module.rlSetLineWidth(width);

/// See [RaylibRlgl.rlGetLineWidth].
double rlGetLineWidth() => _module.rlGetLineWidth();

/// See [RaylibRlgl.rlEnableSmoothLines].
void rlEnableSmoothLines() => _module.rlEnableSmoothLines();

/// See [RaylibRlgl.rlDisableSmoothLines].
void rlDisableSmoothLines() => _module.rlDisableSmoothLines();

/// See [RaylibRlgl.rlEnableStereoRender].
void rlEnableStereoRender() => _module.rlEnableStereoRender();

/// See [RaylibRlgl.rlDisableStereoRender].
void rlDisableStereoRender() => _module.rlDisableStereoRender();

/// See [RaylibRlgl.rlIsStereoRenderEnabled].
bool rlIsStereoRenderEnabled() => _module.rlIsStereoRenderEnabled();

/// See [RaylibRlgl.rlClearColor].
void rlClearColor(int r, int g, int b, int a) => _module.rlClearColor(r, g, b, a);

/// See [RaylibRlgl.rlClearScreenBuffers].
void rlClearScreenBuffers() => _module.rlClearScreenBuffers();

/// See [RaylibRlgl.rlCheckErrors].
void rlCheckErrors() => _module.rlCheckErrors();

/// See [RaylibRlgl.rlSetBlendMode].
void rlSetBlendMode(int mode) => _module.rlSetBlendMode(mode);

/// See [RaylibRlgl.rlSetBlendFactors].
void rlSetBlendFactors(int glSrcFactor, int glDstFactor, int glEquation) => _module.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation);

/// See [RaylibRlgl.rlSetBlendFactorsSeparate].
void rlSetBlendFactorsSeparate(
  int glSrcRGB,
  int glDstRGB,
  int glSrcAlpha,
  int glDstAlpha,
  int glEqRGB,
  int glEqAlpha,
) => _module.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha);

/// See [RaylibRlgl.rlglInit].
void rlglInit(int width, int height) => _module.rlglInit(width, height);

/// See [RaylibRlgl.rlglClose].
void rlglClose() => _module.rlglClose();

/// See [RaylibRlgl.rlLoadExtensions].
void rlLoadExtensions(Pointer<Void> loader) => _module.rlLoadExtensions(loader);

/// See [RaylibRlgl.rlGetProcAddress].
Pointer<Void> rlGetProcAddress(Pointer<Char> procName) => _module.rlGetProcAddress(procName);

/// See [RaylibRlgl.rlGetVersion].
int rlGetVersion() => _module.rlGetVersion();

/// See [RaylibRlgl.rlSetFramebufferWidth].
void rlSetFramebufferWidth(int width) => _module.rlSetFramebufferWidth(width);

/// See [RaylibRlgl.rlGetFramebufferWidth].
int rlGetFramebufferWidth() => _module.rlGetFramebufferWidth();

/// See [RaylibRlgl.rlSetFramebufferHeight].
void rlSetFramebufferHeight(int height) => _module.rlSetFramebufferHeight(height);

/// See [RaylibRlgl.rlGetFramebufferHeight].
int rlGetFramebufferHeight() => _module.rlGetFramebufferHeight();

/// See [RaylibRlgl.rlGetTextureIdDefault].
int rlGetTextureIdDefault() => _module.rlGetTextureIdDefault();

/// See [RaylibRlgl.rlGetShaderIdDefault].
int rlGetShaderIdDefault() => _module.rlGetShaderIdDefault();

/// See [RaylibRlgl.rlGetShaderLocsDefault].
Pointer<Int> rlGetShaderLocsDefault() => _module.rlGetShaderLocsDefault();

/// See [RaylibRlgl.rlLoadRenderBatch].
RlRenderBatchC rlLoadRenderBatch(int numBuffers, int bufferElements) => _module.rlLoadRenderBatch(numBuffers, bufferElements);

/// See [RaylibRlgl.rlUnloadRenderBatch].
void rlUnloadRenderBatch(RlRenderBatchC batch) => _module.rlUnloadRenderBatch(batch);

/// See [RaylibRlgl.rlDrawRenderBatch].
void rlDrawRenderBatch(Pointer<RlRenderBatchC> batch) => _module.rlDrawRenderBatch(batch);

/// See [RaylibRlgl.rlSetRenderBatchActive].
void rlSetRenderBatchActive(Pointer<RlRenderBatchC> batch) => _module.rlSetRenderBatchActive(batch);

/// See [RaylibRlgl.rlDrawRenderBatchActive].
void rlDrawRenderBatchActive() => _module.rlDrawRenderBatchActive();

/// See [RaylibRlgl.rlCheckRenderBatchLimit].
bool rlCheckRenderBatchLimit(int vCount) => _module.rlCheckRenderBatchLimit(vCount);

/// See [RaylibRlgl.rlSetTexture].
void rlSetTexture(int id) => _module.rlSetTexture(id);

/// See [RaylibRlgl.rlLoadVertexArray].
int rlLoadVertexArray() => _module.rlLoadVertexArray();

/// See [RaylibRlgl.rlLoadVertexBuffer].
int rlLoadVertexBuffer(Pointer<Void> buffer, int size, bool dynamic) => _module.rlLoadVertexBuffer(buffer, size, dynamic);

/// See [RaylibRlgl.rlLoadVertexBufferElement].
int rlLoadVertexBufferElement(Pointer<Void> buffer, int size, bool dynamic) => _module.rlLoadVertexBufferElement(buffer, size, dynamic);

/// See [RaylibRlgl.rlUpdateVertexBuffer].
void rlUpdateVertexBuffer(
  int bufferId,
  Pointer<Void> data,
  int dataSize,
  int offset,
) => _module.rlUpdateVertexBuffer(bufferId, data, dataSize, offset);

/// See [RaylibRlgl.rlUpdateVertexBufferElements].
void rlUpdateVertexBufferElements(
  int id,
  Pointer<Void> data,
  int dataSize,
  int offset,
) => _module.rlUpdateVertexBufferElements(id, data, dataSize, offset);

/// See [RaylibRlgl.rlUnloadVertexArray].
void rlUnloadVertexArray(int vaoId) => _module.rlUnloadVertexArray(vaoId);

/// See [RaylibRlgl.rlUnloadVertexBuffer].
void rlUnloadVertexBuffer(int vboId) => _module.rlUnloadVertexBuffer(vboId);

/// See [RaylibRlgl.rlSetVertexAttribute].
void rlSetVertexAttribute(
  int index,
  int compSize,
  int type,
  bool normalized,
  int stride,
  int offset,
) => _module.rlSetVertexAttribute(index, compSize, type, normalized, stride, offset);

/// See [RaylibRlgl.rlSetVertexAttributeDivisor].
void rlSetVertexAttributeDivisor(int index, int divisor) => _module.rlSetVertexAttributeDivisor(index, divisor);

/// See [RaylibRlgl.rlSetVertexAttributeDefault].
void rlSetVertexAttributeDefault(
  int locIndex,
  Pointer<Void> value,
  int attribType,
  int count,
) => _module.rlSetVertexAttributeDefault(locIndex, value, attribType, count);

/// See [RaylibRlgl.rlDrawVertexArray].
void rlDrawVertexArray(int offset, int count) => _module.rlDrawVertexArray(offset, count);

/// See [RaylibRlgl.rlDrawVertexArrayElements].
void rlDrawVertexArrayElements(int offset, int count, Pointer<Void> buffer) => _module.rlDrawVertexArrayElements(offset, count, buffer);

/// See [RaylibRlgl.rlDrawVertexArrayInstanced].
void rlDrawVertexArrayInstanced(int offset, int count, int instances) => _module.rlDrawVertexArrayInstanced(offset, count, instances);

/// See [RaylibRlgl.rlDrawVertexArrayElementsInstanced].
void rlDrawVertexArrayElementsInstanced(
  int offset,
  int count,
  Pointer<Void> buffer,
  int instances,
) => _module.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances);

/// See [RaylibRlgl.rlLoadTexture].
int rlLoadTexture(
  Pointer<Void> data,
  int width,
  int height,
  int format,
  int mipmapCount,
) => _module.rlLoadTexture(data, width, height, format, mipmapCount);

/// See [RaylibRlgl.rlLoadTextureDepth].
int rlLoadTextureDepth(int width, int height, bool useRenderBuffer) => _module.rlLoadTextureDepth(width, height, useRenderBuffer);

/// See [RaylibRlgl.rlLoadTextureCubemap].
int rlLoadTextureCubemap(
  Pointer<Void> data,
  int size,
  int format,
  int mipmapCount,
) => _module.rlLoadTextureCubemap(data, size, format, mipmapCount);

/// See [RaylibRlgl.rlUpdateTexture].
void rlUpdateTexture(
  int id,
  int offsetX,
  int offsetY,
  int width,
  int height,
  int format,
  Pointer<Void> data,
) => _module.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data);

/// See [RaylibRlgl.rlGetGlTextureFormats].
void rlGetGlTextureFormats(
  int format,
  Pointer<UnsignedInt> glInternalFormat,
  Pointer<UnsignedInt> glFormat,
  Pointer<UnsignedInt> glType,
) => _module.rlGetGlTextureFormats(format, glInternalFormat, glFormat, glType);

/// See [RaylibRlgl.rlGetPixelFormatName].
Pointer<Char> rlGetPixelFormatName(int format) => _module.rlGetPixelFormatName(format);

/// See [RaylibRlgl.rlUnloadTexture].
void rlUnloadTexture(int id) => _module.rlUnloadTexture(id);

/// See [RaylibRlgl.rlGenTextureMipmaps].
void rlGenTextureMipmaps(
  int id,
  int width,
  int height,
  int format,
  Pointer<Int> mipmaps,
) => _module.rlGenTextureMipmaps(id, width, height, format, mipmaps);

/// See [RaylibRlgl.rlReadTexturePixels].
Pointer<Void> rlReadTexturePixels(int id, int width, int height, int format) => _module.rlReadTexturePixels(id, width, height, format);

/// See [RaylibRlgl.rlReadScreenPixels].
Pointer<UnsignedChar> rlReadScreenPixels(int width, int height) => _module.rlReadScreenPixels(width, height);

/// See [RaylibRlgl.rlLoadFramebuffer].
int rlLoadFramebuffer() => _module.rlLoadFramebuffer();

/// See [RaylibRlgl.rlFramebufferAttach].
void rlFramebufferAttach(
  int fboId,
  int texId,
  int attachType,
  int texType,
  int mipLevel,
) => _module.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel);

/// See [RaylibRlgl.rlFramebufferComplete].
bool rlFramebufferComplete(int id) => _module.rlFramebufferComplete(id);

/// See [RaylibRlgl.rlUnloadFramebuffer].
void rlUnloadFramebuffer(int id) => _module.rlUnloadFramebuffer(id);

/// See [RaylibRlgl.rlCopyFramebuffer].
void rlCopyFramebuffer(
  int x,
  int y,
  int width,
  int height,
  int format,
  Pointer<Void> pixels,
) => _module.rlCopyFramebuffer(x, y, width, height, format, pixels);

/// See [RaylibRlgl.rlResizeFramebuffer].
void rlResizeFramebuffer(int width, int height) => _module.rlResizeFramebuffer(width, height);

/// See [RaylibRlgl.rlLoadShader].
int rlLoadShader(Pointer<Char> code, int type) => _module.rlLoadShader(code, type);

/// See [RaylibRlgl.rlLoadShaderProgram].
int rlLoadShaderProgram(
  Pointer<Char> vsCode,
  Pointer<Char> fsCode,
) => _module.rlLoadShaderProgram(vsCode, fsCode);

/// See [RaylibRlgl.rlLoadShaderProgramEx].
int rlLoadShaderProgramEx(int vsId, int fsId) => _module.rlLoadShaderProgramEx(vsId, fsId);

/// See [RaylibRlgl.rlLoadShaderProgramCompute].
int rlLoadShaderProgramCompute(int csId) => _module.rlLoadShaderProgramCompute(csId);

/// See [RaylibRlgl.rlUnloadShader].
void rlUnloadShader(int id) => _module.rlUnloadShader(id);

/// See [RaylibRlgl.rlUnloadShaderProgram].
void rlUnloadShaderProgram(int id) => _module.rlUnloadShaderProgram(id);

/// See [RaylibRlgl.rlGetLocationUniform].
int rlGetLocationUniform(int shaderId, Pointer<Char> uniformName) => _module.rlGetLocationUniform(shaderId, uniformName);

/// See [RaylibRlgl.rlGetLocationAttrib].
int rlGetLocationAttrib(int shaderId, Pointer<Char> attribName) => _module.rlGetLocationAttrib(shaderId, attribName);

/// See [RaylibRlgl.rlSetUniform].
void rlSetUniform(
  int locIndex,
  Pointer<Void> value,
  int uniformType,
  int count,
) => _module.rlSetUniform(locIndex, value, uniformType, count);

/// See [RaylibRlgl.rlSetUniformMatrix].
void rlSetUniformMatrix(int locIndex, MatrixC mat) => _module.rlSetUniformMatrix(locIndex, mat);

/// See [RaylibRlgl.rlSetUniformMatrices].
void rlSetUniformMatrices(int locIndex, Pointer<MatrixC> mat, int count) => _module.rlSetUniformMatrices(locIndex, mat, count);

/// See [RaylibRlgl.rlSetUniformSampler].
void rlSetUniformSampler(int locIndex, int textureId) => _module.rlSetUniformSampler(locIndex, textureId);

/// See [RaylibRlgl.rlSetShader].
void rlSetShader(int id, Pointer<Int> locs) => _module.rlSetShader(id, locs);

/// See [RaylibRlgl.rlComputeShaderDispatch].
void rlComputeShaderDispatch(int groupX, int groupY, int groupZ) => _module.rlComputeShaderDispatch(groupX, groupY, groupZ);

/// See [RaylibRlgl.rlLoadShaderBuffer].
int rlLoadShaderBuffer(int size, Pointer<Void> data, int usageHint) => _module.rlLoadShaderBuffer(size, data, usageHint);

/// See [RaylibRlgl.rlUnloadShaderBuffer].
void rlUnloadShaderBuffer(int ssboId) => _module.rlUnloadShaderBuffer(ssboId);

/// See [RaylibRlgl.rlUpdateShaderBuffer].
void rlUpdateShaderBuffer(
  int id,
  Pointer<Void> data,
  int dataSize,
  int offset,
) => _module.rlUpdateShaderBuffer(id, data, dataSize, offset);

/// See [RaylibRlgl.rlBindShaderBuffer].
void rlBindShaderBuffer(int id, int index) => _module.rlBindShaderBuffer(id, index);

/// See [RaylibRlgl.rlReadShaderBuffer].
void rlReadShaderBuffer(int id, Pointer<Void> dest, int count, int offset) => _module.rlReadShaderBuffer(id, dest, count, offset);

/// See [RaylibRlgl.rlCopyShaderBuffer].
void rlCopyShaderBuffer(
  int destId,
  int srcId,
  int destOffset,
  int srcOffset,
  int count,
) => _module.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count);

/// See [RaylibRlgl.rlGetShaderBufferSize].
int rlGetShaderBufferSize(int id) => _module.rlGetShaderBufferSize(id);

/// See [RaylibRlgl.rlBindImageTexture].
void rlBindImageTexture(int id, int index, int format, bool readonly) => _module.rlBindImageTexture(id, index, format, readonly);

/// See [RaylibRlgl.rlGetMatrixModelview].
MatrixC rlGetMatrixModelview() => _module.rlGetMatrixModelview();

/// See [RaylibRlgl.rlGetMatrixProjection].
MatrixC rlGetMatrixProjection() => _module.rlGetMatrixProjection();

/// See [RaylibRlgl.rlGetMatrixTransform].
MatrixC rlGetMatrixTransform() => _module.rlGetMatrixTransform();

/// See [RaylibRlgl.rlGetMatrixProjectionStereo].
MatrixC rlGetMatrixProjectionStereo(int eye) => _module.rlGetMatrixProjectionStereo(eye);

/// See [RaylibRlgl.rlGetMatrixViewOffsetStereo].
MatrixC rlGetMatrixViewOffsetStereo(int eye) => _module.rlGetMatrixViewOffsetStereo(eye);

/// See [RaylibRlgl.rlSetMatrixProjection].
void rlSetMatrixProjection(MatrixC proj) => _module.rlSetMatrixProjection(proj);

/// See [RaylibRlgl.rlSetMatrixModelview].
void rlSetMatrixModelview(MatrixC view) => _module.rlSetMatrixModelview(view);

/// See [RaylibRlgl.rlSetMatrixProjectionStereo].
void rlSetMatrixProjectionStereo(MatrixC right, MatrixC left) => _module.rlSetMatrixProjectionStereo(right, left);

/// See [RaylibRlgl.rlSetMatrixViewOffsetStereo].
void rlSetMatrixViewOffsetStereo(MatrixC right, MatrixC left) => _module.rlSetMatrixViewOffsetStereo(right, left);

/// See [RaylibRlgl.rlLoadDrawCube].
void rlLoadDrawCube() => _module.rlLoadDrawCube();

/// See [RaylibRlgl.rlLoadDrawQuad].
void rlLoadDrawQuad() => _module.rlLoadDrawQuad();

