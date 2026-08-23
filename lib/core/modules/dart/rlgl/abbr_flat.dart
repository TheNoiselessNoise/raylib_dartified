import 'package:raylib_dartified/raylib_dartified.dart';

RaylibRlglFlat get _module => Raylib.instance.RlglFlat;

/// See [RaylibRlglFlat.rlMatrixMode].
void rlMatrixMode(
  int mode,
) => _module.rlMatrixMode(mode);

/// See [RaylibRlglFlat.rlPushMatrix].
void rlPushMatrix() => _module.rlPushMatrix();

/// See [RaylibRlglFlat.rlPopMatrix].
void rlPopMatrix() => _module.rlPopMatrix();

/// See [RaylibRlglFlat.rlLoadIdentity].
void rlLoadIdentity() => _module.rlLoadIdentity();

/// See [RaylibRlglFlat.rlTranslatef].
void rlTranslatef(
  double x,
  double y,
  double z,
) => _module.rlTranslatef(x, y, z);

/// See [RaylibRlglFlat.rlRotatef].
void rlRotatef(
  double angle,
  double x,
  double y,
  double z,
) => _module.rlRotatef(angle, x, y, z);

/// See [RaylibRlglFlat.rlScalef].
void rlScalef(
  double x,
  double y,
  double z,
) => _module.rlScalef(x, y, z);

/// See [RaylibRlglFlat.rlMultMatrixf].
void rlMultMatrixf(
  MemoryPointer<RFloat32> matf, 
) => _module.rlMultMatrixf(matf);

/// See [RaylibRlglFlat.rlFrustum].
void rlFrustum(
  double left,
  double right,
  double bottom,
  double top,
  double znear,
  double zfar,
) => _module.rlFrustum(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglFlat.rlOrtho].
void rlOrtho(
  double left,
  double right,
  double bottom,
  double top,
  double znear,
  double zfar,
) => _module.rlOrtho(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglFlat.rlViewport].
void rlViewport(
  int x,
  int y,
  int width,
  int height,
) => _module.rlViewport(x, y, width, height);

/// See [RaylibRlglFlat.rlSetClipPlanes].
void rlSetClipPlanes(
  double nearPlane,
  double farPlane,
) => _module.rlSetClipPlanes(nearPlane, farPlane);

/// See [RaylibRlglFlat.rlGetCullDistanceNear].
double rlGetCullDistanceNear() => _module.rlGetCullDistanceNear();

/// See [RaylibRlglFlat.rlGetCullDistanceFar].
double rlGetCullDistanceFar() => _module.rlGetCullDistanceFar();

/// See [RaylibRlglFlat.rlBegin].
void rlBegin(
  int mode,
) => _module.rlBegin(mode);

/// See [RaylibRlglFlat.rlEnd].
void rlEnd() => _module.rlEnd();

/// See [RaylibRlglFlat.rlVertex2i].
void rlVertex2i(
  int x,
  int y,
) => _module.rlVertex2i(x, y);

/// See [RaylibRlglFlat.rlVertex2f].
void rlVertex2f(
  double x,
  double y,
) => _module.rlVertex2f(x, y);

/// See [RaylibRlglFlat.rlVertex3f].
void rlVertex3f(
  double x,
  double y,
  double z
) => _module.rlVertex3f(x, y, z);

/// See [RaylibRlglFlat.rlTexCoord2f].
void rlTexCoord2f(
  double x,
  double y,
) => _module.rlTexCoord2f(x, y);

/// See [RaylibRlglFlat.rlNormal3f].
void rlNormal3f(
  double x,
  double y,
  double z,
) => _module.rlNormal3f(x, y, z);

/// See [RaylibRlglFlat.rlColor4ub].
void rlColor4ub(
  int r,
  int g,
  int b,
  int a,
) => _module.rlColor4ub(r, g, b, a);

/// See [RaylibRlglFlat.rlColor3f].
void rlColor3f(
  double x,
  double y,
  double z,
) => _module.rlColor3f(x, y, z);

/// See [RaylibRlglFlat.rlColor4f].
void rlColor4f(
  double x,
  double y,
  double z,
  double w,
) => _module.rlColor4f(x, y, z, w);

/// See [RaylibRlglFlat.rlEnableVertexArray].
bool rlEnableVertexArray(
  int vaoId,
) => _module.rlEnableVertexArray(vaoId);

/// See [RaylibRlglFlat.rlDisableVertexArray].
void rlDisableVertexArray() => _module.rlDisableVertexArray();

/// See [RaylibRlglFlat.rlEnableVertexBuffer].
void rlEnableVertexBuffer(
  int id,
) => _module.rlEnableVertexBuffer(id);

/// See [RaylibRlglFlat.rlDisableVertexBuffer].
void rlDisableVertexBuffer() => _module.rlDisableVertexBuffer();

/// See [RaylibRlglFlat.rlEnableVertexBufferElement].
void rlEnableVertexBufferElement(
  int id,
) => _module.rlEnableVertexBufferElement(id);

/// See [RaylibRlglFlat.rlDisableVertexBufferElement].
void rlDisableVertexBufferElement() => _module.rlDisableVertexBufferElement();

/// See [RaylibRlglFlat.rlEnableVertexAttribute].
void rlEnableVertexAttribute(
  int index,
) => _module.rlEnableVertexAttribute(index);

/// See [RaylibRlglFlat.rlDisableVertexAttribute].
void rlDisableVertexAttribute(
  int index,
) => _module.rlDisableVertexAttribute(index);

/// See [RaylibRlglFlat.rlEnableStatePointer].
void rlEnableStatePointer(
  int vertexAttribType,
  MemoryPointer<RVoid> buffer,
) => _module.rlEnableStatePointer(vertexAttribType, buffer);

/// See [RaylibRlglFlat.rlDisableStatePointer].
void rlDisableStatePointer(
  int vertexAttribType,
) => _module.rlDisableStatePointer(vertexAttribType);

/// See [RaylibRlglFlat.rlActiveTextureSlot].
void rlActiveTextureSlot(
  int slot,
) => _module.rlActiveTextureSlot(slot);

/// See [RaylibRlglFlat.rlEnableTexture].
void rlEnableTexture(
  int id,
) => _module.rlEnableTexture(id);

/// See [RaylibRlglFlat.rlDisableTexture].
void rlDisableTexture() => _module.rlDisableTexture();

/// See [RaylibRlglFlat.rlEnableTextureCubemap].
void rlEnableTextureCubemap(
  int id,
) => _module.rlEnableTextureCubemap(id);

/// See [RaylibRlglFlat.rlDisableTextureCubemap].
void rlDisableTextureCubemap() => _module.rlDisableTextureCubemap();

/// See [RaylibRlglFlat.rlTextureParameters].
void rlTextureParameters(
  int id,
  int param,
  int value,
) => _module.rlTextureParameters(id, param, value);

/// See [RaylibRlglFlat.rlCubemapParameters].
void rlCubemapParameters(
  int id,
  int param,
  int value,
) => _module.rlCubemapParameters(id, param, value);

/// See [RaylibRlglFlat.rlEnableShader].
void rlEnableShader(
  int id,
) => _module.rlEnableShader(id);

/// See [RaylibRlglFlat.rlDisableShader].
void rlDisableShader() => _module.rlDisableShader();

/// See [RaylibRlglFlat.rlEnableFramebuffer].
void rlEnableFramebuffer(
  int id,
) => _module.rlEnableFramebuffer(id);

/// See [RaylibRlglFlat.rlDisableFramebuffer].
void rlDisableFramebuffer() => _module.rlDisableFramebuffer();

/// See [RaylibRlglFlat.rlGetActiveFramebuffer].
int rlGetActiveFramebuffer() => _module.rlGetActiveFramebuffer();

/// See [RaylibRlglFlat.rlActiveDrawBuffers].
void rlActiveDrawBuffers(
  int count,
) => _module.rlActiveDrawBuffers(count);

/// See [RaylibRlglFlat.rlBlitFramebuffer].
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

/// See [RaylibRlglFlat.rlBindFramebuffer].
void rlBindFramebuffer(
  int target,
  int framebuffer,
) => _module.rlBindFramebuffer(target, framebuffer);

/// See [RaylibRlglFlat.rlEnableColorBlend].
void rlEnableColorBlend() => _module.rlEnableColorBlend();

/// See [RaylibRlglFlat.rlDisableColorBlend].
void rlDisableColorBlend() => _module.rlDisableColorBlend();

/// See [RaylibRlglFlat.rlEnableDepthTest].
void rlEnableDepthTest() => _module.rlEnableDepthTest();

/// See [RaylibRlglFlat.rlDisableDepthTest].
void rlDisableDepthTest() => _module.rlDisableDepthTest();

/// See [RaylibRlglFlat.rlEnableDepthMask].
void rlEnableDepthMask() => _module.rlEnableDepthMask();

/// See [RaylibRlglFlat.rlDisableDepthMask].
void rlDisableDepthMask() => _module.rlDisableDepthMask();

/// See [RaylibRlglFlat.rlEnableBackfaceCulling].
void rlEnableBackfaceCulling() => _module.rlEnableBackfaceCulling();

/// See [RaylibRlglFlat.rlDisableBackfaceCulling].
void rlDisableBackfaceCulling() => _module.rlDisableBackfaceCulling();

/// See [RaylibRlglFlat.rlColorMask].
void rlColorMask(
  bool r,
  bool g,
  bool b,
  bool a,
) => _module.rlColorMask(r, g, b, a);

/// See [RaylibRlglFlat.rlSetCullFace].
void rlSetCullFace(
  int mode,
) => _module.rlSetCullFace(mode);

/// See [RaylibRlglFlat.rlEnableScissorTest].
void rlEnableScissorTest() => _module.rlEnableScissorTest();

/// See [RaylibRlglFlat.rlDisableScissorTest].
void rlDisableScissorTest() => _module.rlDisableScissorTest();

/// See [RaylibRlglFlat.rlScissor].
void rlScissor(
  int x,
  int y,
  int width,
  int height,
) => _module.rlScissor(x, y, width, height);

/// See [RaylibRlglFlat.rlEnablePointMode].
void rlEnablePointMode() => _module.rlEnablePointMode();

/// See [RaylibRlglFlat.rlDisablePointMode].
void rlDisablePointMode() => _module.rlDisablePointMode();

/// See [RaylibRlglFlat.rlSetPointSize].
void rlSetPointSize(
  double size,
) => _module.rlSetPointSize(size);

/// See [RaylibRlglFlat.rlGetPointSize].
double rlGetPointSize() => _module.rlGetPointSize();

/// See [RaylibRlglFlat.rlEnableWireMode].
void rlEnableWireMode() => _module.rlEnableWireMode();

/// See [RaylibRlglFlat.rlDisableWireMode].
void rlDisableWireMode() => _module.rlDisableWireMode();

/// See [RaylibRlglFlat.rlSetLineWidth].
void rlSetLineWidth(
  double width,
) => _module.rlSetLineWidth(width);

/// See [RaylibRlglFlat.rlGetLineWidth].
double rlGetLineWidth() => _module.rlGetLineWidth();

/// See [RaylibRlglFlat.rlEnableSmoothLines].
void rlEnableSmoothLines() => _module.rlEnableSmoothLines();

/// See [RaylibRlglFlat.rlDisableSmoothLines].
void rlDisableSmoothLines() => _module.rlDisableSmoothLines();

/// See [RaylibRlglFlat.rlEnableStereoRender].
void rlEnableStereoRender() => _module.rlEnableStereoRender();

/// See [RaylibRlglFlat.rlDisableStereoRender].
void rlDisableStereoRender() => _module.rlDisableStereoRender();

/// See [RaylibRlglFlat.rlIsStereoRenderEnabled].
bool rlIsStereoRenderEnabled() => _module.rlIsStereoRenderEnabled();

/// See [RaylibRlglFlat.rlClearColor].
void rlClearColor(
  int r,
  int g,
  int b,
  int a,
) => _module.rlClearColor(r, g, b, a);

/// See [RaylibRlglFlat.rlClearScreenBuffers].
void rlClearScreenBuffers() => _module.rlClearScreenBuffers();

/// See [RaylibRlglFlat.rlCheckErrors].
void rlCheckErrors() => _module.rlCheckErrors();

/// See [RaylibRlglFlat.rlSetBlendMode].
void rlSetBlendMode(
  int mode,
) => _module.rlSetBlendMode(mode);

/// See [RaylibRlglFlat.rlSetBlendFactors].
void rlSetBlendFactors(
  int glSrcFactor,
  int glDstFactor,
  int glEquation,
) => _module.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation);

/// See [RaylibRlglFlat.rlSetBlendFactorsSeparate].
void rlSetBlendFactorsSeparate(
  int glSrcRGB,
  int glDstRGB,
  int glSrcAlpha,
  int glDstAlpha,
  int glEqRGB,
  int glEqAlpha,
) => _module.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha);

/// See [RaylibRlglFlat.rlglInit].
void rlglInit(
  int width,
  int height,
) => _module.rlglInit(width, height);

/// See [RaylibRlglFlat.rlglClose].
void rlglClose() => _module.rlglClose();

/// See [RaylibRlglFlat.rlLoadExtensions].
void rlLoadExtensions(
  MemoryPointer<RVoid> loader,
) => _module.rlLoadExtensions(loader);

/// See [RaylibRlglFlat.rlGetProcAddress].
NativeMemoryPointer<RVoid> rlGetProcAddress(
  MemoryPointer<RChar> procName,
) => _module.rlGetProcAddress(procName);

/// See [RaylibRlglFlat.rlGetVersion].
int rlGetVersion() => _module.rlGetVersion();

/// See [RaylibRlglFlat.rlSetFramebufferWidth].
void rlSetFramebufferWidth(
  int width,
) => _module.rlSetFramebufferWidth(width);

/// See [RaylibRlglFlat.rlGetFramebufferWidth].
int rlGetFramebufferWidth() => _module.rlGetFramebufferWidth();

/// See [RaylibRlglFlat.rlSetFramebufferHeight].
void rlSetFramebufferHeight(
  int height,
) => _module.rlSetFramebufferHeight(height);

/// See [RaylibRlglFlat.rlGetFramebufferHeight].
int rlGetFramebufferHeight() => _module.rlGetFramebufferHeight();

/// See [RaylibRlglFlat.rlGetTextureIdDefault].
int rlGetTextureIdDefault() => _module.rlGetTextureIdDefault();

/// See [RaylibRlglFlat.rlGetShaderIdDefault].
int rlGetShaderIdDefault() => _module.rlGetShaderIdDefault();

/// See [RaylibRlglFlat.rlGetShaderLocsDefault].
NativeMemoryPointer<RInt> rlGetShaderLocsDefault() => _module.rlGetShaderLocsDefault();

/// See [RaylibRlglFlat.rlLoadRenderBatch].
RlRenderBatchD rlLoadRenderBatch(
  int numBuffers,
  int bufferElements,
) => _module.rlLoadRenderBatch(numBuffers, bufferElements);

/// See [RaylibRlglFlat.rlUnloadRenderBatch].
void rlUnloadRenderBatch(
  RlRenderBatchD batch,
) => _module.rlUnloadRenderBatch(batch);

/// See [RaylibRlglFlat.rlDrawRenderBatch].
void rlDrawRenderBatch(
  StructPointer<RlRenderBatchD> batch,
) => _module.rlDrawRenderBatch(batch);

/// See [RaylibRlglFlat.rlSetRenderBatchActive].
void rlSetRenderBatchActive(
  StructPointer<RlRenderBatchD> batch,
) => _module.rlSetRenderBatchActive(batch);

/// See [RaylibRlglFlat.rlDrawRenderBatchActive].
void rlDrawRenderBatchActive() => _module.rlDrawRenderBatchActive();

/// See [RaylibRlglFlat.rlCheckRenderBatchLimit].
bool rlCheckRenderBatchLimit(
  int vCount,
) => _module.rlCheckRenderBatchLimit(vCount);

/// See [RaylibRlglFlat.rlSetTexture].
void rlSetTexture(
  int id,
) => _module.rlSetTexture(id);

/// See [RaylibRlglFlat.rlLoadVertexArray].
int rlLoadVertexArray() => _module.rlLoadVertexArray();

/// See [RaylibRlglFlat.rlLoadVertexBuffer].
int rlLoadVertexBuffer(
  MemoryPointer<RVoid> buffer,
  int size,
  bool dynamic,
) => _module.rlLoadVertexBuffer(buffer, size, dynamic);

/// See [RaylibRlglFlat.rlLoadVertexBufferElement].
int rlLoadVertexBufferElement(
  MemoryPointer<RVoid> buffer,
  int size,
  bool dynamic,
) => _module.rlLoadVertexBufferElement(buffer, size, dynamic);

/// See [RaylibRlglFlat.rlUpdateVertexBuffer].
void rlUpdateVertexBuffer(
  int bufferId,
  MemoryPointer<RVoid> data,
  int dataSize,
  int offset,
) => _module.rlUpdateVertexBuffer(bufferId, data, dataSize, offset);

/// See [RaylibRlglFlat.rlUpdateVertexBufferElements].
void rlUpdateVertexBufferElements(
  int id,
  MemoryPointer<RVoid> data,
  int dataSize,
  int offset,
) => _module.rlUpdateVertexBufferElements(id, data, dataSize, offset);

/// See [RaylibRlglFlat.rlUnloadVertexArray].
void rlUnloadVertexArray(
  int vaoId,
) => _module.rlUnloadVertexArray(vaoId);

/// See [RaylibRlglFlat.rlUnloadVertexBuffer].
void rlUnloadVertexBuffer(
  int vboId,
) => _module.rlUnloadVertexBuffer(vboId);

/// See [RaylibRlglFlat.rlSetVertexAttribute].
void rlSetVertexAttribute(
  int index,
  int compSize,
  int type,
  bool normalized,
  int stride,
  int offset,
) => _module.rlSetVertexAttribute(index, compSize, type, normalized, stride, offset);

/// See [RaylibRlglFlat.rlSetVertexAttributeDivisor].
void rlSetVertexAttributeDivisor(
  int index,
  int divisor,
) => _module.rlSetVertexAttributeDivisor(index, divisor);

/// See [RaylibRlglFlat.rlSetVertexAttributeDefault].
void rlSetVertexAttributeDefault(
  int locIndex,
  MemoryPointer<RVoid> value,
  int attribType,
  int count,
) => _module.rlSetVertexAttributeDefault(locIndex, value, attribType, count);

/// See [RaylibRlglFlat.rlDrawVertexArray].
void rlDrawVertexArray(
  int offset,
  int count,
) => _module.rlDrawVertexArray(offset, count);

/// See [RaylibRlglFlat.rlDrawVertexArrayElements].
void rlDrawVertexArrayElements(
  int offset,
  int count,
  MemoryPointer<RVoid> buffer,
) => _module.rlDrawVertexArrayElements(offset, count, buffer);

/// See [RaylibRlglFlat.rlDrawVertexArrayInstanced].
void rlDrawVertexArrayInstanced(
  int offset,
  int count,
  int instances,
) => _module.rlDrawVertexArrayInstanced(offset, count, instances);

/// See [RaylibRlglFlat.rlDrawVertexArrayElementsInstanced].
void rlDrawVertexArrayElementsInstanced(
  int offset,
  int count,
  MemoryPointer<RVoid> buffer,
  int instances,
) => _module.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances);

/// See [RaylibRlglFlat.rlLoadTexture].
int rlLoadTexture(
  MemoryPointer<RVoid> data,
  int width,
  int height,
  int format,
  int mipmapCount,
) => _module.rlLoadTexture(data, width, height, format, mipmapCount);

/// See [RaylibRlglFlat.rlLoadTextureDepth].
int rlLoadTextureDepth(
  int width,
  int height,
  bool useRenderBuffer,
) => _module.rlLoadTextureDepth(width, height, useRenderBuffer);

/// See [RaylibRlglFlat.rlLoadTextureCubemap].
int rlLoadTextureCubemap(
  MemoryPointer<RVoid> data,
  int size,
  int format,
  int mipmapCount,
) => _module.rlLoadTextureCubemap(data, size, format, mipmapCount);

/// See [RaylibRlglFlat.rlUpdateTexture].
void rlUpdateTexture(
  int id,
  int offsetX,
  int offsetY,
  int width,
  int height,
  int format,
  MemoryPointer<RVoid> data,
) => _module.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data);

/// See [RaylibRlglFlat.rlGetGlTextureFormats].
void rlGetGlTextureFormats(
  int format,
  MemoryPointer<RUnsignedInt> glInternalFormat,
  MemoryPointer<RUnsignedInt> glFormat,
  MemoryPointer<RUnsignedInt> glType,
) => _module.rlGetGlTextureFormats(format, glInternalFormat, glFormat, glType);

/// See [RaylibRlglFlat.rlGetPixelFormatName].
NativeMemoryPointer<RChar> rlGetPixelFormatName(
  int format,
) => _module.rlGetPixelFormatName(format);

/// See [RaylibRlglFlat.rlUnloadTexture].
void rlUnloadTexture(
  int id,
) => _module.rlUnloadTexture(id);

/// See [RaylibRlglFlat.rlGenTextureMipmaps].
void rlGenTextureMipmaps(
  int id,
  int width,
  int height,
  int format,
  MemoryPointer<RInt> mipmaps,
) => _module.rlGenTextureMipmaps(id, width, height, format, mipmaps);

/// See [RaylibRlglFlat.rlReadTexturePixels].
NativeMemoryPointer<RVoid> rlReadTexturePixels(
  int id,
  int width,
  int height,
  int format,
) => _module.rlReadTexturePixels(id, width, height, format);

/// See [RaylibRlglFlat.rlReadScreenPixels].
NativeMemoryPointer<RUnsignedChar> rlReadScreenPixels(
  int width,
  int height,
) => _module.rlReadScreenPixels(width, height);

/// See [RaylibRlglFlat.rlLoadFramebuffer].
int rlLoadFramebuffer() => _module.rlLoadFramebuffer();

/// See [RaylibRlglFlat.rlFramebufferAttach].
void rlFramebufferAttach(
  int fboId,
  int texId,
  int attachType,
  int texType,
  int mipLevel,
) => _module.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel);

/// See [RaylibRlglFlat.rlFramebufferComplete].
bool rlFramebufferComplete(
  int id,
) => _module.rlFramebufferComplete(id);

/// See [RaylibRlglFlat.rlUnloadFramebuffer].
void rlUnloadFramebuffer(
  int id,
) => _module.rlUnloadFramebuffer(id);

/// See [RaylibRlglFlat.rlCopyFramebuffer].
void rlCopyFramebuffer(
  int x,
  int y,
  int width,
  int height,
  int format,
  MemoryPointer<RVoid> pixels,
) => _module.rlCopyFramebuffer(x, y, width, height, format, pixels);

/// See [RaylibRlglFlat.rlResizeFramebuffer].
void rlResizeFramebuffer(
  int width,
  int height,
) => _module.rlResizeFramebuffer(width, height);

/// See [RaylibRlglFlat.rlLoadShader].
int rlLoadShader(
  MemoryPointer<RChar> code,
  int type,
) => _module.rlLoadShader(code, type);

/// See [RaylibRlglFlat.rlLoadShaderProgram].
int rlLoadShaderProgram(
  MemoryPointer<RChar> vsCode,
  MemoryPointer<RChar> fsCode,
) => _module.rlLoadShaderProgram(vsCode, fsCode);

/// See [RaylibRlglFlat.rlLoadShaderProgramEx].
int rlLoadShaderProgramEx(
  int vsId,
  int fsId,
) => _module.rlLoadShaderProgramEx(vsId, fsId);

/// See [RaylibRlglFlat.rlLoadShaderProgramCompute].
int rlLoadShaderProgramCompute(
  int csId,
) => _module.rlLoadShaderProgramCompute(csId);

/// See [RaylibRlglFlat.rlUnloadShader].
void rlUnloadShader(
  int id,
) => _module.rlUnloadShader(id);

/// See [RaylibRlglFlat.rlUnloadShaderProgram].
void rlUnloadShaderProgram(
  int id,
) => _module.rlUnloadShaderProgram(id);

/// See [RaylibRlglFlat.rlGetLocationUniform].
int rlGetLocationUniform(
  int shaderId,
  MemoryPointer<RChar> uniformName,
) => _module.rlGetLocationUniform(shaderId, uniformName);

/// See [RaylibRlglFlat.rlGetLocationAttrib].
int rlGetLocationAttrib(
  int shaderId,
  MemoryPointer<RChar> attribName,
) => _module.rlGetLocationAttrib(shaderId, attribName);

/// See [RaylibRlglFlat.rlSetUniform].
void rlSetUniform(
  int locIndex,
  MemoryPointer<RVoid> value,
  int uniformType,
  int count,
) => _module.rlSetUniform(locIndex, value, uniformType, count);

/// See [RaylibRlglFlat.rlSetUniformMatrix].
void rlSetUniformMatrix(
  int locIndex,
  MatrixD mat,
) => _module.rlSetUniformMatrix(locIndex, mat);

/// See [RaylibRlglFlat.rlSetUniformMatrices].
void rlSetUniformMatrices(
  int locIndex,
  StructPointer<MatrixD> mat,
  int count,
) => _module.rlSetUniformMatrices(locIndex, mat, count);

/// See [RaylibRlglFlat.rlSetUniformSampler].
void rlSetUniformSampler(
  int locIndex,
  int textureId,
) => _module.rlSetUniformSampler(locIndex, textureId);

/// See [RaylibRlglFlat.rlSetShader].
void rlSetShader(
  int id,
  MemoryPointer<RInt> locs,
) => _module.rlSetShader(id, locs);

/// See [RaylibRlglFlat.rlComputeShaderDispatch].
void rlComputeShaderDispatch(
  int groupX,
  int groupY,
  int groupZ,
) => _module.rlComputeShaderDispatch(groupX, groupY, groupZ);

/// See [RaylibRlglFlat.rlLoadShaderBuffer].
int rlLoadShaderBuffer(
  int size,
  MemoryPointer<RVoid> data,
  int usageHint,
) => _module.rlLoadShaderBuffer(size, data, usageHint);

/// See [RaylibRlglFlat.rlUnloadShaderBuffer].
void rlUnloadShaderBuffer(
  int ssboId,
) => _module.rlUnloadShaderBuffer(ssboId);

/// See [RaylibRlglFlat.rlUpdateShaderBuffer].
void rlUpdateShaderBuffer(
  int id,
  MemoryPointer<RVoid> data,
  int dataSize,
  int offset,
) => _module.rlUpdateShaderBuffer(id, data, dataSize, offset);

/// See [RaylibRlglFlat.rlBindShaderBuffer].
void rlBindShaderBuffer(
  int id,
  int index,
) => _module.rlBindShaderBuffer(id, index);

/// See [RaylibRlglFlat.rlReadShaderBuffer].
void rlReadShaderBuffer(
  int id,
  MemoryPointer<RVoid> dest,
  int count,
  int offset,
) => _module.rlReadShaderBuffer(id, dest, count, offset);

/// See [RaylibRlglFlat.rlCopyShaderBuffer].
void rlCopyShaderBuffer(
  int destId,
  int srcId,
  int destOffset,
  int srcOffset,
  int count,
) => _module.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count);

/// See [RaylibRlglFlat.rlGetShaderBufferSize].
int rlGetShaderBufferSize(
  int id,
) => _module.rlGetShaderBufferSize(id);

/// See [RaylibRlglFlat.rlBindImageTexture].
void rlBindImageTexture(
  int id,
  int index,
  int format,
  bool readonly,
) => _module.rlBindImageTexture(id, index, format, readonly);

/// See [RaylibRlglFlat.rlGetMatrixModelview].
MatrixD rlGetMatrixModelview() => _module.rlGetMatrixModelview();

/// See [RaylibRlglFlat.rlGetMatrixProjection].
MatrixD rlGetMatrixProjection() => _module.rlGetMatrixProjection();

/// See [RaylibRlglFlat.rlGetMatrixTransform].
MatrixD rlGetMatrixTransform() => _module.rlGetMatrixTransform();

/// See [RaylibRlglFlat.rlGetMatrixProjectionStereo].
MatrixD rlGetMatrixProjectionStereo(
  int eye,
) => _module.rlGetMatrixProjectionStereo(eye);

/// See [RaylibRlglFlat.rlGetMatrixViewOffsetStereo].
MatrixD rlGetMatrixViewOffsetStereo(
  int eye,
) => _module.rlGetMatrixViewOffsetStereo(eye);

/// See [RaylibRlglFlat.rlSetMatrixProjection].
void rlSetMatrixProjection(
  MatrixD proj,
) => _module.rlSetMatrixProjection(proj);

/// See [RaylibRlglFlat.rlSetMatrixModelview].
void rlSetMatrixModelview(
  MatrixD view,
) => _module.rlSetMatrixModelview(view);

/// See [RaylibRlglFlat.rlSetMatrixProjectionStereo].
void rlSetMatrixProjectionStereo(
  MatrixD right,
  MatrixD left,
) => _module.rlSetMatrixProjectionStereo(right, left);

/// See [RaylibRlglFlat.rlSetMatrixViewOffsetStereo].
void rlSetMatrixViewOffsetStereo(
  MatrixD right,
  MatrixD left,
) => _module.rlSetMatrixViewOffsetStereo(right, left);

/// See [RaylibRlglFlat.rlLoadDrawCube].
void rlLoadDrawCube() => _module.rlLoadDrawCube();

/// See [RaylibRlglFlat.rlLoadDrawQuad].
void rlLoadDrawQuad() => _module.rlLoadDrawQuad();