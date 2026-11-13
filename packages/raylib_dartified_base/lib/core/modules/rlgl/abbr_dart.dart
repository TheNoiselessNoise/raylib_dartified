import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

RaylibRlglDart get _module => RaylibBase.instance.module();

/// See [RaylibRlglDart.rlMatrixMode].
void rlMatrixMode(
  RlMatrixMode mode,
) => _module.rlMatrixMode(mode);

/// See [RaylibRlglDart.rlPushMatrix].
void rlPushMatrix() => _module.rlPushMatrix();

/// See [RaylibRlglDart.rlPopMatrix].
void rlPopMatrix() => _module.rlPopMatrix();

/// See [RaylibRlglDart.rlLoadIdentity].
void rlLoadIdentity() => _module.rlLoadIdentity();

/// See [RaylibRlglDart.rlTranslatef].
void rlTranslatef(
  num x,
  num y,
  num z,
) => _module.rlTranslatef(x, y, z);

/// See [RaylibRlglDart.rlRotatef].
void rlRotatef(
  num angle,
  num x,
  num y,
  num z,
) => _module.rlRotatef(angle, x, y, z);

/// See [RaylibRlglDart.rlScalef].
void rlScalef(
  num x,
  num y,
  num z,
) => _module.rlScalef(x, y, z);

/// See [RaylibRlglDart.rlMultMatrixf].
void rlMultMatrixf(
  List<double> matf,
) => _module.rlMultMatrixf(matf);

/// See [RaylibRlglDart.rlFrustum].
void rlFrustum(
  num left,
  num right,
  num bottom,
  num top,
  num znear,
  num zfar,
) => _module.rlFrustum(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglDart.rlOrtho].
void rlOrtho(
  num left,
  num right,
  num bottom,
  num top,
  num znear,
  num zfar,
) => _module.rlOrtho(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglDart.rlViewport].
void rlViewport(
  num x,
  num y,
  num width,
  num height,
) => _module.rlViewport(x, y, width, height);

/// See [RaylibRlglDart.rlSetClipPlanes].
void rlSetClipPlanes(
  num nearPlane,
  num farPlane,
) => _module.rlSetClipPlanes(nearPlane, farPlane);

/// See [RaylibRlglDart.rlGetCullDistanceNear].
double rlGetCullDistanceNear() => _module.rlGetCullDistanceNear();

/// See [RaylibRlglDart.rlGetCullDistanceFar].
double rlGetCullDistanceFar() => _module.rlGetCullDistanceFar();

/// See [RaylibRlglDart.rlBegin].
void rlBegin(
  RlDrawMode mode,
) => _module.rlBegin(mode);

/// See [RaylibRlglDart.rlEnd].
void rlEnd() => _module.rlEnd();

/// See [RaylibRlglDart.rlVertex2i].
void rlVertex2i(
  num x,
  num y,
) => _module.rlVertex2i(x, y);

/// See [RaylibRlglDart.rlVertex2f].
void rlVertex2f(
  num x,
  num y,
) => _module.rlVertex2f(x, y);

/// See [RaylibRlglDart.rlVertex3f].
void rlVertex3f(
  num x,
  num y,
  num z,
) => _module.rlVertex3f(x, y, z);

/// See [RaylibRlglDart.rlTexCoord2f].
void rlTexCoord2f(
  num x,
  num y,
) => _module.rlTexCoord2f(x, y);

/// See [RaylibRlglDart.rlNormal3f].
void rlNormal3f(
  num x,
  num y,
  num z,
) => _module.rlNormal3f(x, y, z);

/// See [RaylibRlglDart.rlColor4ub].
void rlColor4ub(
  num r,
  num g,
  num b,
  num a,
) => _module.rlColor4ub(r, g, b, a);

/// See [RaylibRlglDart.rlColor3f].
void rlColor3f(
  num x,
  num y,
  num z,
) => _module.rlColor3f(x, y, z);

/// See [RaylibRlglDart.rlColor4f].
void rlColor4f(
  num x,
  num y,
  num z,
  num w,
) => _module.rlColor4f(x, y, z, w);

/// See [RaylibRlglDart.rlEnableVertexArray].
bool rlEnableVertexArray(
  num vaoId,
) => _module.rlEnableVertexArray(vaoId);

/// See [RaylibRlglDart.rlDisableVertexArray].
void rlDisableVertexArray() => _module.rlDisableVertexArray();

/// See [RaylibRlglDart.rlEnableVertexBuffer].
void rlEnableVertexBuffer(
  num id,
) => _module.rlEnableVertexBuffer(id);

/// See [RaylibRlglDart.rlDisableVertexBuffer].
void rlDisableVertexBuffer() => _module.rlDisableVertexBuffer();

/// See [RaylibRlglDart.rlEnableVertexBufferElement].
void rlEnableVertexBufferElement(
  num id,
) => _module.rlEnableVertexBufferElement(id);

/// See [RaylibRlglDart.rlDisableVertexBufferElement].
void rlDisableVertexBufferElement() => _module.rlDisableVertexBufferElement();

/// See [RaylibRlglDart.rlEnableVertexAttribute].
void rlEnableVertexAttribute(
  num index,
) => _module.rlEnableVertexAttribute(index);

/// See [RaylibRlglDart.rlDisableVertexAttribute].
void rlDisableVertexAttribute(
  num index,
) => _module.rlDisableVertexAttribute(index);

/// See [RaylibRlglDart.rlEnableStatePointer].
void rlEnableStatePointer(
  int vertexAttribType,
  TypedDataList data,
) => _module.rlEnableStatePointer(vertexAttribType, data);

/// See [RaylibRlglDart.rlDisableStatePointer].
void rlDisableStatePointer(
  int vertexAttribType,
) => _module.rlDisableStatePointer(vertexAttribType);

/// See [RaylibRlglDart.rlActiveTextureSlot].
void rlActiveTextureSlot(
  num slot,
) => _module.rlActiveTextureSlot(slot);

/// See [RaylibRlglDart.rlEnableTexture].
void rlEnableTexture(
  num id,
) => _module.rlEnableTexture(id);

/// See [RaylibRlglDart.rlDisableTexture].
void rlDisableTexture() => _module.rlDisableTexture();

/// See [RaylibRlglDart.rlEnableTextureCubemap].
void rlEnableTextureCubemap(
  num id,
) => _module.rlEnableTextureCubemap(id);

/// See [RaylibRlglDart.rlDisableTextureCubemap].
void rlDisableTextureCubemap() => _module.rlDisableTextureCubemap();

/// See [RaylibRlglDart.rlTextureParameters].
void rlTextureParameters(
  num id,
  num param,
  num value,
) => _module.rlTextureParameters(id, param, value);

/// See [RaylibRlglDart.rlCubemapParameters].
void rlCubemapParameters(
  num id,
  num param,
  num value,
) => _module.rlCubemapParameters(id, param, value);

/// See [RaylibRlglDart.rlEnableShader].
void rlEnableShader(
  num id,
) => _module.rlEnableShader(id);

/// See [RaylibRlglDart.rlDisableShader].
void rlDisableShader() => _module.rlDisableShader();

/// See [RaylibRlglDart.rlEnableFramebuffer].
void rlEnableFramebuffer(
  num id,
) => _module.rlEnableFramebuffer(id);

/// See [RaylibRlglDart.rlDisableFramebuffer].
void rlDisableFramebuffer() => _module.rlDisableFramebuffer();

/// See [RaylibRlglDart.rlGetActiveFramebuffer].
int rlGetActiveFramebuffer() => _module.rlGetActiveFramebuffer();

/// See [RaylibRlglDart.rlActiveDrawBuffers].
void rlActiveDrawBuffers(
  num count,
) => _module.rlActiveDrawBuffers(count);

/// See [RaylibRlglDart.rlBlitFramebuffer].
void rlBlitFramebuffer(
  num srcX,
  num srcY,
  num srcWidth,
  num srcHeight,
  num dstX,
  num dstY,
  num dstWidth,
  num dstHeight,
  num bufferMask,
) => _module.rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask);

/// See [RaylibRlglDart.rlBindFramebuffer].
void rlBindFramebuffer(
  num target,
  num framebuffer,
) => _module.rlBindFramebuffer(target, framebuffer);

/// See [RaylibRlglDart.rlEnableColorBlend].
void rlEnableColorBlend() => _module.rlEnableColorBlend();

/// See [RaylibRlglDart.rlDisableColorBlend].
void rlDisableColorBlend() => _module.rlDisableColorBlend();

/// See [RaylibRlglDart.rlEnableDepthTest].
void rlEnableDepthTest() => _module.rlEnableDepthTest();

/// See [RaylibRlglDart.rlDisableDepthTest].
void rlDisableDepthTest() => _module.rlDisableDepthTest();

/// See [RaylibRlglDart.rlEnableDepthMask].
void rlEnableDepthMask() => _module.rlEnableDepthMask();

/// See [RaylibRlglDart.rlDisableDepthMask].
void rlDisableDepthMask() => _module.rlDisableDepthMask();

/// See [RaylibRlglDart.rlEnableBackfaceCulling].
void rlEnableBackfaceCulling() => _module.rlEnableBackfaceCulling();

/// See [RaylibRlglDart.rlDisableBackfaceCulling].
void rlDisableBackfaceCulling() => _module.rlDisableBackfaceCulling();

/// See [RaylibRlglDart.rlColorMask].
void rlColorMask(
  bool r,
  bool g,
  bool b,
  bool a,
) => _module.rlColorMask(r, g, b, a);

/// See [RaylibRlglDart.rlSetCullFace].
void rlSetCullFace(
  RlCullMode mode,
) => _module.rlSetCullFace(mode);

/// See [RaylibRlglDart.rlEnableScissorTest].
void rlEnableScissorTest() => _module.rlEnableScissorTest();

/// See [RaylibRlglDart.rlDisableScissorTest].
void rlDisableScissorTest() => _module.rlDisableScissorTest();

/// See [RaylibRlglDart.rlScissor].
void rlScissor(
  num x,
  num y,
  num width,
  num height,
) => _module.rlScissor(x, y, width, height);

/// See [RaylibRlglDart.rlEnablePointMode].
void rlEnablePointMode() => _module.rlEnablePointMode();

/// See [RaylibRlglDart.rlDisablePointMode].
void rlDisablePointMode() => _module.rlDisablePointMode();

/// See [RaylibRlglDart.rlSetPointSize].
void rlSetPointSize(
  num size,
) => _module.rlSetPointSize(size);

/// See [RaylibRlglDart.rlGetPointSize].
double rlGetPointSize() => _module.rlGetPointSize();

/// See [RaylibRlglDart.rlEnableWireMode].
void rlEnableWireMode() => _module.rlEnableWireMode();

/// See [RaylibRlglDart.rlDisableWireMode].
void rlDisableWireMode() => _module.rlDisableWireMode();

/// See [RaylibRlglDart.rlSetLineWidth].
void rlSetLineWidth(
  num width,
) => _module.rlSetLineWidth(width);

/// See [RaylibRlglDart.rlGetLineWidth].
double rlGetLineWidth() => _module.rlGetLineWidth();

/// See [RaylibRlglDart.rlEnableSmoothLines].
void rlEnableSmoothLines() => _module.rlEnableSmoothLines();

/// See [RaylibRlglDart.rlDisableSmoothLines].
void rlDisableSmoothLines() => _module.rlDisableSmoothLines();

/// See [RaylibRlglDart.rlEnableStereoRender].
void rlEnableStereoRender() => _module.rlEnableStereoRender();

/// See [RaylibRlglDart.rlDisableStereoRender].
void rlDisableStereoRender() => _module.rlDisableStereoRender();

/// See [RaylibRlglDart.rlIsStereoRenderEnabled].
bool rlIsStereoRenderEnabled() => _module.rlIsStereoRenderEnabled();

/// See [RaylibRlglDart.rlClearColor].
void rlClearColor(
  num r,
  num g,
  num b,
  num a,
) => _module.rlClearColor(r, g, b, a);

/// See [RaylibRlglDart.rlClearScreenBuffers].
void rlClearScreenBuffers() => _module.rlClearScreenBuffers();

/// See [RaylibRlglDart.rlCheckErrors].
void rlCheckErrors() => _module.rlCheckErrors();

/// See [RaylibRlglDart.rlSetBlendMode].
void rlSetBlendMode(
  BlendMode mode,
) => _module.rlSetBlendMode(mode);

/// See [RaylibRlglDart.rlSetBlendFactors].
void rlSetBlendFactors(
  num glSrcFactor,
  num glDstFactor,
  num glEquation,
) => _module.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation);

/// See [RaylibRlglDart.rlSetBlendFactorsSeparate].
void rlSetBlendFactorsSeparate(
  num glSrcRGB,
  num glDstRGB,
  num glSrcAlpha,
  num glDstAlpha,
  num glEqRGB,
  num glEqAlpha,
) => _module.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha);

/// See [RaylibRlglDart.rlglInit].
void rlglInit(
  num width,
  num height,
) => _module.rlglInit(width, height);

/// See [RaylibRlglDart.rlglClose].
void rlglClose() => _module.rlglClose();

/// See [RaylibRlglDart.rlGetVersion].
int rlGetVersion() => _module.rlGetVersion();

/// See [RaylibRlglDart.rlSetFramebufferWidth].
void rlSetFramebufferWidth(
  num width,
) => _module.rlSetFramebufferWidth(width);

/// See [RaylibRlglDart.rlGetFramebufferWidth].
int rlGetFramebufferWidth() => _module.rlGetFramebufferWidth();

/// See [RaylibRlglDart.rlSetFramebufferHeight].
void rlSetFramebufferHeight(
  num height,
) => _module.rlSetFramebufferHeight(height);

/// See [RaylibRlglDart.rlGetFramebufferHeight].
int rlGetFramebufferHeight() => _module.rlGetFramebufferHeight();

/// See [RaylibRlglDart.rlGetTextureIdDefault].
int rlGetTextureIdDefault() => _module.rlGetTextureIdDefault();

/// See [RaylibRlglDart.rlGetShaderIdDefault].
int rlGetShaderIdDefault() => _module.rlGetShaderIdDefault();

/// See [RaylibRlglDart.rlGetShaderLocsDefault].
List<int> rlGetShaderLocsDefault() => _module.rlGetShaderLocsDefault();

/// See [RaylibRlglDart.rlLoadRenderBatch].
RlRenderBatch rlLoadRenderBatch(
  num numBuffers,
  num bufferElements,
) => _module.rlLoadRenderBatch(numBuffers, bufferElements);

/// See [RaylibRlglDart.rlUnloadRenderBatch].
void rlUnloadRenderBatch(
  RlRenderBatch batch,
) => _module.rlUnloadRenderBatch(batch);

/// See [RaylibRlglDart.rlDrawRenderBatch].
void rlDrawRenderBatch(
  RlRenderBatch batch,
) => _module.rlDrawRenderBatch(batch);

/// See [RaylibRlglDart.rlSetRenderBatchActive].
void rlSetRenderBatchActive(
  RlRenderBatch batch,
) => _module.rlSetRenderBatchActive(batch);

/// See [RaylibRlglDart.rlDrawRenderBatchActive].
void rlDrawRenderBatchActive() => _module.rlDrawRenderBatchActive();

/// See [RaylibRlglDart.rlCheckRenderBatchLimit].
bool rlCheckRenderBatchLimit(
  num vCount,
) => _module.rlCheckRenderBatchLimit(vCount);

/// See [RaylibRlglDart.rlSetTexture].
void rlSetTexture(
  num id,
) => _module.rlSetTexture(id);

/// See [RaylibRlglDart.rlLoadVertexArray].
int rlLoadVertexArray() => _module.rlLoadVertexArray();

/// See [RaylibRlglDart.rlLoadVertexBuffer].
int rlLoadVertexBuffer(
  TypedDataList buffer,
  bool dynamic,
) => _module.rlLoadVertexBuffer(buffer, dynamic);

/// See [RaylibRlglDart.rlLoadVertexBufferElement].
int rlLoadVertexBufferElement(
  TypedDataList buffer,
  bool dynamic,
) => _module.rlLoadVertexBufferElement(buffer, dynamic);

/// See [RaylibRlglDart.rlUpdateVertexBuffer].
void rlUpdateVertexBuffer(
  num bufferId,
  TypedDataList data,
  int dataSize,
  num offset,
) => _module.rlUpdateVertexBuffer(bufferId, data, dataSize, offset);

/// See [RaylibRlglDart.rlUpdateVertexBufferElements].
void rlUpdateVertexBufferElements(
  num id,
  TypedDataList data,
  int dataSize,
  num offset,
) => _module.rlUpdateVertexBufferElements(id, data, dataSize, offset);

/// See [RaylibRlglDart.rlUnloadVertexArray].
void rlUnloadVertexArray(
  num vaoId,
) => _module.rlUnloadVertexArray(vaoId);

/// See [RaylibRlglDart.rlUnloadVertexBuffer].
void rlUnloadVertexBuffer(
  num vboId,
) => _module.rlUnloadVertexBuffer(vboId);

/// See [RaylibRlglDart.rlSetVertexAttribute].
void rlSetVertexAttribute(
  num index,
  num compSize,
  num type,
  bool normalized,
  num stride,
  num offset,
) => _module.rlSetVertexAttribute(index, compSize, type, normalized, stride, offset);

/// See [RaylibRlglDart.rlSetVertexAttributeDivisor].
void rlSetVertexAttributeDivisor(
  num index,
  num divisor,
) => _module.rlSetVertexAttributeDivisor(index, divisor);

/// See [RaylibRlglDart.rlSetVertexAttributeDefault].
void rlSetVertexAttributeDefault(
  num locIndex,
  Float32List value,
  RlShaderAttributeDataType attribType,
) => _module.rlSetVertexAttributeDefault(locIndex, value, attribType);

/// See [RaylibRlglDart.rlDrawVertexArray].
void rlDrawVertexArray(
  num offset,
  num count,
) => _module.rlDrawVertexArray(offset, count);

/// See [RaylibRlglDart.rlDrawVertexArrayElements].
void rlDrawVertexArrayElements(
  num offset,
  num count,
  Uint16List buffer,
) => _module.rlDrawVertexArrayElements(offset, count, buffer);

/// See [RaylibRlglDart.rlDrawVertexArrayInstanced].
void rlDrawVertexArrayInstanced(
  num offset,
  num count,
  num instances,
) => _module.rlDrawVertexArrayInstanced(offset, count, instances);

/// See [RaylibRlglDart.rlDrawVertexArrayElementsInstanced].
void rlDrawVertexArrayElementsInstanced(
  num offset,
  num count,
  Uint16List buffer,
  num instances,
) => _module.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances);

/// See [RaylibRlglDart.rlLoadTexture].
int rlLoadTexture(
  Uint8List? data,
  num width,
  num height,
  PixelFormat format,
  num mipmapCount,
) => _module.rlLoadTexture(data, width, height, format, mipmapCount);

/// See [RaylibRlglDart.rlLoadTextureDepth].
int rlLoadTextureDepth(
  num width,
  num height,
  bool useRenderBuffer,
) => _module.rlLoadTextureDepth(width, height, useRenderBuffer);

/// See [RaylibRlglDart.rlLoadTextureCubemap].
int rlLoadTextureCubemap(
  Uint8List? data,
  num size,
  PixelFormat format,
  num mipmapCount,
) => _module.rlLoadTextureCubemap(data, size, format, mipmapCount);

/// See [RaylibRlglDart.rlUpdateTexture].
void rlUpdateTexture(
  num id,
  num offsetX,
  num offsetY,
  num width,
  num height,
  PixelFormat format,
  Uint8List data,
) => _module.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data);

/// See [RaylibRlglDart.rlGetGlTextureFormats].
(int glInternalFormat, int glFormat, int glType) rlGetGlTextureFormats(
  PixelFormat format,
) => _module.rlGetGlTextureFormats(format);

/// See [RaylibRlglDart.rlGetPixelFormatName].
String rlGetPixelFormatName(
  PixelFormat format,
) => _module.rlGetPixelFormatName(format);

/// See [RaylibRlglDart.rlUnloadTexture].
void rlUnloadTexture(
  num id,
) => _module.rlUnloadTexture(id);

/// See [RaylibRlglDart.rlGenTextureMipmaps].
int rlGenTextureMipmaps(
  num id,
  num width,
  num height,
  PixelFormat format,
) => _module.rlGenTextureMipmaps(id, width, height, format);

/// See [RaylibRlglDart.rlReadTexturePixels].
Uint8List rlReadTexturePixels(
  num id,
  num width,
  num height,
  PixelFormat format,
) => _module.rlReadTexturePixels(id, width, height, format);

/// See [RaylibRlglDart.rlReadScreenPixels].
Uint8List rlReadScreenPixels(
  num width,
  num height,
) => _module.rlReadScreenPixels(width, height);

/// See [RaylibRlglDart.rlLoadFramebuffer].
int rlLoadFramebuffer() => _module.rlLoadFramebuffer();

/// See [RaylibRlglDart.rlFramebufferAttach].
void rlFramebufferAttach(
  num fboId,
  num texId,
  RlFramebufferAttachType attachType,
  RlFramebufferAttachTextureType texType,
  num mipLevel,
) => _module.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel);

/// See [RaylibRlglDart.rlFramebufferComplete].
bool rlFramebufferComplete(
  num id,
) => _module.rlFramebufferComplete(id);

/// See [RaylibRlglDart.rlUnloadFramebuffer].
void rlUnloadFramebuffer(
  num id,
) => _module.rlUnloadFramebuffer(id);

/// See [RaylibRlglDart.rlCopyFramebuffer].
Uint8List rlCopyFramebuffer(
  num x,
  num y,
  num width,
  num height,
  PixelFormat format,
) => _module.rlCopyFramebuffer(x, y, width, height, format);

/// See [RaylibRlglDart.rlResizeFramebuffer].
void rlResizeFramebuffer(
  num width,
  num height,
) => _module.rlResizeFramebuffer(width, height);

/// See [RaylibRlglDart.rlLoadShader].
int rlLoadShader(
  String code,
  RlShaderType type,
) => _module.rlLoadShader(code, type);

/// See [RaylibRlglDart.rlLoadShaderProgram].
int rlLoadShaderProgram(
  String vsCode,
  String fsCode,
) => _module.rlLoadShaderProgram(vsCode, fsCode);

/// See [RaylibRlglDart.rlLoadShaderProgramEx].
int rlLoadShaderProgramEx(
  num vsId,
  num fsId,
) => _module.rlLoadShaderProgramEx(vsId, fsId);

/// See [RaylibRlglDart.rlLoadShaderProgramCompute].
int rlLoadShaderProgramCompute(
  num csId,
) => _module.rlLoadShaderProgramCompute(csId);

/// See [RaylibRlglDart.rlUnloadShader].
void rlUnloadShader(
  num id,
) => _module.rlUnloadShader(id);

/// See [RaylibRlglDart.rlUnloadShaderProgram].
void rlUnloadShaderProgram(
  num id,
) => _module.rlUnloadShaderProgram(id);

/// See [RaylibRlglDart.rlGetLocationUniform].
int rlGetLocationUniform(
  num shaderId,
  String uniformName,
) => _module.rlGetLocationUniform(shaderId, uniformName);

/// See [RaylibRlglDart.rlGetLocationAttrib].
int rlGetLocationAttrib(
  num shaderId,
  String attribName,
) => _module.rlGetLocationAttrib(shaderId, attribName);

/// See [RaylibRlglDart.rlSetUniform].
void rlSetUniform(
  num locIndex,
  TypedDataList value,
  RlShaderUniformDataType uniformType,
  num count,
) => _module.rlSetUniform(locIndex, value, uniformType, count);

/// See [RaylibRlglDart.rlSetUniformMatrix].
void rlSetUniformMatrix(
  num locIndex,
  Matrix mat,
) => _module.rlSetUniformMatrix(locIndex, mat);

/// See [RaylibRlglDart.rlSetUniformMatrices].
void rlSetUniformMatrices(
  num locIndex,
  List<Matrix> mat,
) => _module.rlSetUniformMatrices(locIndex, mat);

/// See [RaylibRlglDart.rlSetUniformSampler].
void rlSetUniformSampler(
  num locIndex,
  num textureId,
) => _module.rlSetUniformSampler(locIndex, textureId);

/// See [RaylibRlglDart.rlSetShader].
void rlSetShader(
  num id,
  List<int> locs,
) => _module.rlSetShader(id, locs);

/// See [RaylibRlglDart.rlComputeShaderDispatch].
void rlComputeShaderDispatch(
  num groupX,
  num groupY,
  num groupZ,
) => _module.rlComputeShaderDispatch(groupX, groupY, groupZ);

/// See [RaylibRlglDart.rlLoadShaderBuffer].
int rlLoadShaderBuffer(
  num size,
  TypedDataList? data,
  RlUsageHint? usageHint,
) => _module.rlLoadShaderBuffer(size, data, usageHint);

/// See [RaylibRlglDart.rlUnloadShaderBuffer].
void rlUnloadShaderBuffer(
  num ssboId,
) => _module.rlUnloadShaderBuffer(ssboId);

/// See [RaylibRlglDart.rlUpdateShaderBuffer].
void rlUpdateShaderBuffer(
  num id,
  TypedDataList data,
  num offset,
) => _module.rlUpdateShaderBuffer(id, data, offset);

/// See [RaylibRlglDart.rlBindShaderBuffer].
void rlBindShaderBuffer(
  num id,
  num index,
) => _module.rlBindShaderBuffer(id, index);

/// See [RaylibRlglDart.rlReadShaderBuffer].
Uint8List rlReadShaderBuffer(
  num id,
  num count,
  num offset,
) => _module.rlReadShaderBuffer(id, count, offset);

/// See [RaylibRlglDart.rlCopyShaderBuffer].
void rlCopyShaderBuffer(
  num destId,
  num srcId,
  num destOffset,
  num srcOffset,
  num count,
) => _module.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count);

/// See [RaylibRlglDart.rlGetShaderBufferSize].
int rlGetShaderBufferSize(
  num id,
) => _module.rlGetShaderBufferSize(id);

/// See [RaylibRlglDart.rlBindImageTexture].
void rlBindImageTexture(
  num id,
  num index,
  PixelFormat format,
  bool readonly,
) => _module.rlBindImageTexture(id, index, format, readonly);

/// See [RaylibRlglDart.rlGetMatrixModelview].
Matrix rlGetMatrixModelview() => _module.rlGetMatrixModelview();

/// See [RaylibRlglDart.rlGetMatrixProjection].
Matrix rlGetMatrixProjection() => _module.rlGetMatrixProjection();

/// See [RaylibRlglDart.rlGetMatrixTransform].
Matrix rlGetMatrixTransform() => _module.rlGetMatrixTransform();

/// See [RaylibRlglDart.rlGetMatrixProjectionStereo].
Matrix rlGetMatrixProjectionStereo(
  num eye,
) => _module.rlGetMatrixProjectionStereo(eye);

/// See [RaylibRlglDart.rlGetMatrixViewOffsetStereo].
Matrix rlGetMatrixViewOffsetStereo(
  num eye,
) => _module.rlGetMatrixViewOffsetStereo(eye);

/// See [RaylibRlglDart.rlSetMatrixProjection].
void rlSetMatrixProjection(
  Matrix proj,
) => _module.rlSetMatrixProjection(proj);

/// See [RaylibRlglDart.rlSetMatrixModelview].
void rlSetMatrixModelview(
  Matrix view,
) => _module.rlSetMatrixModelview(view);

/// See [RaylibRlglDart.rlSetMatrixProjectionStereo].
void rlSetMatrixProjectionStereo(
  Matrix right,
  Matrix left,
) => _module.rlSetMatrixProjectionStereo(right, left);

/// See [RaylibRlglDart.rlSetMatrixViewOffsetStereo].
void rlSetMatrixViewOffsetStereo(
  Matrix right,
  Matrix left,
) => _module.rlSetMatrixViewOffsetStereo(right, left);

/// See [RaylibRlglDart.rlLoadDrawCube].
void rlLoadDrawCube() => _module.rlLoadDrawCube();

/// See [RaylibRlglDart.rlLoadDrawQuad].
void rlLoadDrawQuad() => _module.rlLoadDrawQuad();
