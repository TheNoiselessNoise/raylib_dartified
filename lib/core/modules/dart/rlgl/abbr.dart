import 'dart:typed_data';
import 'package:raylib_dartified/raylib_dartified.dart';

RaylibRlglD get _module => Raylib.instance.RlglD;

/// See [RaylibRlglD.rlMatrixMode].
void rlMatrixMode(
  RlMatrixMode mode,
) => _module.rlMatrixMode(mode);

/// See [RaylibRlglD.rlPushMatrix].
void rlPushMatrix() => _module.rlPushMatrix();

/// See [RaylibRlglD.rlPopMatrix].
void rlPopMatrix() => _module.rlPopMatrix();

/// See [RaylibRlglD.rlLoadIdentity].
void rlLoadIdentity() => _module.rlLoadIdentity();

/// See [RaylibRlglD.rlTranslatef].
void rlTranslatef(
  num x,
  num y,
  num z,
) => _module.rlTranslatef(x, y, z);

/// See [RaylibRlglD.rlRotatef].
void rlRotatef(
  num angle,
  num x,
  num y,
  num z,
) => _module.rlRotatef(angle, x, y, z);

/// See [RaylibRlglD.rlScalef].
void rlScalef(
  num x,
  num y,
  num z,
) => _module.rlScalef(x, y, z);

/// See [RaylibRlglD.rlMultMatrixf].
void rlMultMatrixf(
  List<double> matf,
) => _module.rlMultMatrixf(matf);

/// See [RaylibRlglD.rlFrustum].
void rlFrustum(
  num left,
  num right,
  num bottom,
  num top,
  num znear,
  num zfar,
) => _module.rlFrustum(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglD.rlOrtho].
void rlOrtho(
  num left,
  num right,
  num bottom,
  num top,
  num znear,
  num zfar,
) => _module.rlOrtho(left, right, bottom, top, znear, zfar);

/// See [RaylibRlglD.rlViewport].
void rlViewport(
  num x,
  num y,
  num width,
  num height,
) => _module.rlViewport(x, y, width, height);

/// See [RaylibRlglD.rlSetClipPlanes].
void rlSetClipPlanes(
  num nearPlane,
  num farPlane,
) => _module.rlSetClipPlanes(nearPlane, farPlane);

/// See [RaylibRlglD.rlGetCullDistanceNear].
double rlGetCullDistanceNear() => _module.rlGetCullDistanceNear();

/// See [RaylibRlglD.rlGetCullDistanceFar].
double rlGetCullDistanceFar() => _module.rlGetCullDistanceFar();

/// See [RaylibRlglD.rlBegin].
void rlBegin(
  RlDrawMode mode,
) => _module.rlBegin(mode);

/// See [RaylibRlglD.rlEnd].
void rlEnd() => _module.rlEnd();

/// See [RaylibRlglD.rlVertex2i].
void rlVertex2i(
  num x,
  num y,
) => _module.rlVertex2i(x, y);

/// See [RaylibRlglD.rlVertex2f].
void rlVertex2f(
  num x,
  num y,
) => _module.rlVertex2f(x, y);

/// See [RaylibRlglD.rlVertex3f].
void rlVertex3f(
  num x,
  num y,
  num z,
) => _module.rlVertex3f(x, y, z);

/// See [RaylibRlglD.rlTexCoord2f].
void rlTexCoord2f(
  num x,
  num y,
) => _module.rlTexCoord2f(x, y);

/// See [RaylibRlglD.rlNormal3f].
void rlNormal3f(
  num x,
  num y,
  num z,
) => _module.rlNormal3f(x, y, z);

/// See [RaylibRlglD.rlColor4ub].
void rlColor4ub(
  num r,
  num g,
  num b,
  num a,
) => _module.rlColor4ub(r, g, b, a);

/// See [RaylibRlglD.rlColor3f].
void rlColor3f(
  num x,
  num y,
  num z,
) => _module.rlColor3f(x, y, z);

/// See [RaylibRlglD.rlColor4f].
void rlColor4f(
  num x,
  num y,
  num z,
  num w,
) => _module.rlColor4f(x, y, z, w);

/// See [RaylibRlglD.rlEnableVertexArray].
bool rlEnableVertexArray(
  num vaoId,
) => _module.rlEnableVertexArray(vaoId);

/// See [RaylibRlglD.rlDisableVertexArray].
void rlDisableVertexArray() => _module.rlDisableVertexArray();

/// See [RaylibRlglD.rlEnableVertexBuffer].
void rlEnableVertexBuffer(
  num id,
) => _module.rlEnableVertexBuffer(id);

/// See [RaylibRlglD.rlDisableVertexBuffer].
void rlDisableVertexBuffer() => _module.rlDisableVertexBuffer();

/// See [RaylibRlglD.rlEnableVertexBufferElement].
void rlEnableVertexBufferElement(
  num id,
) => _module.rlEnableVertexBufferElement(id);

/// See [RaylibRlglD.rlDisableVertexBufferElement].
void rlDisableVertexBufferElement() => _module.rlDisableVertexBufferElement();

/// See [RaylibRlglD.rlEnableVertexAttribute].
void rlEnableVertexAttribute(
  num index,
) => _module.rlEnableVertexAttribute(index);

/// See [RaylibRlglD.rlDisableVertexAttribute].
void rlDisableVertexAttribute(
  num index,
) => _module.rlDisableVertexAttribute(index);

/// See [RaylibRlglD.rlEnableStatePointer].
void rlEnableStatePointer(int vertexAttribType, TypedDataList data) => _module.rlEnableStatePointer(vertexAttribType, data);

/// See [RaylibRlglD.rlDisableStatePointer].
void rlDisableStatePointer(int vertexAttribType) => _module.rlDisableStatePointer(vertexAttribType);

/// See [RaylibRlglD.rlActiveTextureSlot].
void rlActiveTextureSlot(
  num slot,
) => _module.rlActiveTextureSlot(slot);

/// See [RaylibRlglD.rlEnableTexture].
void rlEnableTexture(
  num id,
) => _module.rlEnableTexture(id);

/// See [RaylibRlglD.rlDisableTexture].
void rlDisableTexture() => _module.rlDisableTexture();

/// See [RaylibRlglD.rlEnableTextureCubemap].
void rlEnableTextureCubemap(
  num id,
) => _module.rlEnableTextureCubemap(id);

/// See [RaylibRlglD.rlDisableTextureCubemap].
void rlDisableTextureCubemap() => _module.rlDisableTextureCubemap();

/// See [RaylibRlglD.rlTextureParameters].
void rlTextureParameters(
  num id,
  num param,
  num value,
) => _module.rlTextureParameters(id, param, value);

/// See [RaylibRlglD.rlCubemapParameters].
void rlCubemapParameters(
  num id,
  num param,
  num value,
) => _module.rlCubemapParameters(id, param, value);

/// See [RaylibRlglD.rlEnableShader].
void rlEnableShader(
  num id,
) => _module.rlEnableShader(id);

/// See [RaylibRlglD.rlDisableShader].
void rlDisableShader() => _module.rlDisableShader();

/// See [RaylibRlglD.rlEnableFramebuffer].
void rlEnableFramebuffer(
  num id,
) => _module.rlEnableFramebuffer(id);

/// See [RaylibRlglD.rlDisableFramebuffer].
void rlDisableFramebuffer() => _module.rlDisableFramebuffer();

/// See [RaylibRlglD.rlGetActiveFramebuffer].
int rlGetActiveFramebuffer() => _module.rlGetActiveFramebuffer();

/// See [RaylibRlglD.rlActiveDrawBuffers].
void rlActiveDrawBuffers(
  num count,
) => _module.rlActiveDrawBuffers(count);

/// See [RaylibRlglD.rlBlitFramebuffer].
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

/// See [RaylibRlglD.rlBindFramebuffer].
void rlBindFramebuffer(
  num target,
  num framebuffer,
) => _module.rlBindFramebuffer(target, framebuffer);

/// See [RaylibRlglD.rlEnableColorBlend].
void rlEnableColorBlend() => _module.rlEnableColorBlend();

/// See [RaylibRlglD.rlDisableColorBlend].
void rlDisableColorBlend() => _module.rlDisableColorBlend();

/// See [RaylibRlglD.rlEnableDepthTest].
void rlEnableDepthTest() => _module.rlEnableDepthTest();

/// See [RaylibRlglD.rlDisableDepthTest].
void rlDisableDepthTest() => _module.rlDisableDepthTest();

/// See [RaylibRlglD.rlEnableDepthMask].
void rlEnableDepthMask() => _module.rlEnableDepthMask();

/// See [RaylibRlglD.rlDisableDepthMask].
void rlDisableDepthMask() => _module.rlDisableDepthMask();

/// See [RaylibRlglD.rlEnableBackfaceCulling].
void rlEnableBackfaceCulling() => _module.rlEnableBackfaceCulling();

/// See [RaylibRlglD.rlDisableBackfaceCulling].
void rlDisableBackfaceCulling() => _module.rlDisableBackfaceCulling();

/// See [RaylibRlglD.rlColorMask].
void rlColorMask(
  bool r,
  bool g,
  bool b,
  bool a,
) => _module.rlColorMask(r, g, b, a);

/// See [RaylibRlglD.rlSetCullFace].
void rlSetCullFace(
  RlCullMode mode,
) => _module.rlSetCullFace(mode);

/// See [RaylibRlglD.rlEnableScissorTest].
void rlEnableScissorTest() => _module.rlEnableScissorTest();

/// See [RaylibRlglD.rlDisableScissorTest].
void rlDisableScissorTest() => _module.rlDisableScissorTest();

/// See [RaylibRlglD.rlScissor].
void rlScissor(
  num x,
  num y,
  num width,
  num height,
) => _module.rlScissor(x, y, width, height);

/// See [RaylibRlglD.rlEnablePointMode].
void rlEnablePointMode() => _module.rlEnablePointMode();

/// See [RaylibRlglD.rlDisablePointMode].
void rlDisablePointMode() => _module.rlDisablePointMode();

/// See [RaylibRlglD.rlSetPointSize].
void rlSetPointSize(
  num size,
) => _module.rlSetPointSize(size);

/// See [RaylibRlglD.rlGetPointSize].
double rlGetPointSize() => _module.rlGetPointSize();

/// See [RaylibRlglD.rlEnableWireMode].
void rlEnableWireMode() => _module.rlEnableWireMode();

/// See [RaylibRlglD.rlDisableWireMode].
void rlDisableWireMode() => _module.rlDisableWireMode();

/// See [RaylibRlglD.rlSetLineWidth].
void rlSetLineWidth(
  num width,
) => _module.rlSetLineWidth(width);

/// See [RaylibRlglD.rlGetLineWidth].
double rlGetLineWidth() => _module.rlGetLineWidth();

/// See [RaylibRlglD.rlEnableSmoothLines].
void rlEnableSmoothLines() => _module.rlEnableSmoothLines();

/// See [RaylibRlglD.rlDisableSmoothLines].
void rlDisableSmoothLines() => _module.rlDisableSmoothLines();

/// See [RaylibRlglD.rlEnableStereoRender].
void rlEnableStereoRender() => _module.rlEnableStereoRender();

/// See [RaylibRlglD.rlDisableStereoRender].
void rlDisableStereoRender() => _module.rlDisableStereoRender();

/// See [RaylibRlglD.rlIsStereoRenderEnabled].
bool rlIsStereoRenderEnabled() => _module.rlIsStereoRenderEnabled();

/// See [RaylibRlglD.rlClearColor].
void rlClearColor(
  num r,
  num g,
  num b,
  num a,
) => _module.rlClearColor(r, g, b, a);

/// See [RaylibRlglD.rlClearScreenBuffers].
void rlClearScreenBuffers() => _module.rlClearScreenBuffers();

/// See [RaylibRlglD.rlCheckErrors].
void rlCheckErrors() => _module.rlCheckErrors();

/// See [RaylibRlglD.rlSetBlendMode].
void rlSetBlendMode(
  BlendMode mode,
) => _module.rlSetBlendMode(mode);

/// See [RaylibRlglD.rlSetBlendFactors].
void rlSetBlendFactors(
  num glSrcFactor,
  num glDstFactor,
  num glEquation,
) => _module.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation);

/// See [RaylibRlglD.rlSetBlendFactorsSeparate].
void rlSetBlendFactorsSeparate(
  num glSrcRGB,
  num glDstRGB,
  num glSrcAlpha,
  num glDstAlpha,
  num glEqRGB,
  num glEqAlpha,
) => _module.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha);

/// See [RaylibRlglD.rlglInit].
void rlglInit(
  num width,
  num height,
) => _module.rlglInit(width, height);

/// See [RaylibRlglD.rlglClose].
void rlglClose() => _module.rlglClose();

/// See [RaylibRlglD.rlGetVersion].
int rlGetVersion() => _module.rlGetVersion();

/// See [RaylibRlglD.rlSetFramebufferWidth].
void rlSetFramebufferWidth(
  num width,
) => _module.rlSetFramebufferWidth(width);

/// See [RaylibRlglD.rlGetFramebufferWidth].
int rlGetFramebufferWidth() => _module.rlGetFramebufferWidth();

/// See [RaylibRlglD.rlSetFramebufferHeight].
void rlSetFramebufferHeight(
  num height,
) => _module.rlSetFramebufferHeight(height);

/// See [RaylibRlglD.rlGetFramebufferHeight].
int rlGetFramebufferHeight() => _module.rlGetFramebufferHeight();

/// See [RaylibRlglD.rlGetTextureIdDefault].
int rlGetTextureIdDefault() => _module.rlGetTextureIdDefault();

/// See [RaylibRlglD.rlGetShaderIdDefault].
int rlGetShaderIdDefault() => _module.rlGetShaderIdDefault();

/// See [RaylibRlglD.rlGetShaderLocsDefault].
List<int> rlGetShaderLocsDefault() => _module.rlGetShaderLocsDefault();

/// See [RaylibRlglD.rlLoadRenderBatch].
RlRenderBatchD rlLoadRenderBatch(
  num numBuffers,
  num bufferElements,
) => _module.rlLoadRenderBatch(numBuffers, bufferElements);

/// See [RaylibRlglD.rlUnloadRenderBatch].
void rlUnloadRenderBatch(
  RlRenderBatchD batch,
) => _module.rlUnloadRenderBatch(batch);

/// See [RaylibRlglD.rlDrawRenderBatch].
void rlDrawRenderBatch(
  RlRenderBatchD batch,
) => _module.rlDrawRenderBatch(batch);

/// See [RaylibRlglD.rlSetRenderBatchActive].
void rlSetRenderBatchActive(
  RlRenderBatchD batch,
) => _module.rlSetRenderBatchActive(batch);

/// See [RaylibRlglD.rlDrawRenderBatchActive].
void rlDrawRenderBatchActive() => _module.rlDrawRenderBatchActive();

/// See [RaylibRlglD.rlCheckRenderBatchLimit].
bool rlCheckRenderBatchLimit(
  num vCount,
) => _module.rlCheckRenderBatchLimit(vCount);

/// See [RaylibRlglD.rlSetTexture].
void rlSetTexture(
  num id,
) => _module.rlSetTexture(id);

/// See [RaylibRlglD.rlLoadVertexArray].
int rlLoadVertexArray() => _module.rlLoadVertexArray();

/// See [RaylibRlglD.rlLoadVertexBuffer].
int rlLoadVertexBuffer(
  TypedDataList buffer,
  bool dynamic,
) => _module.rlLoadVertexBuffer(buffer, dynamic);

/// See [RaylibRlglD.rlLoadVertexBufferElement].
int rlLoadVertexBufferElement(
  TypedDataList buffer,
  bool dynamic,
) => _module.rlLoadVertexBufferElement(buffer, dynamic);

/// See [RaylibRlglD.rlUpdateVertexBuffer].
void rlUpdateVertexBuffer(
  num bufferId,
  TypedDataList data,
  int dataSize,
  num offset,
) => _module.rlUpdateVertexBuffer(bufferId, data, dataSize, offset);

/// See [RaylibRlglD.rlUpdateVertexBufferElements].
void rlUpdateVertexBufferElements(
  num id,
  TypedDataList data,
  int dataSize,
  num offset,
) => _module.rlUpdateVertexBufferElements(id, data, dataSize, offset);

/// See [RaylibRlglD.rlUnloadVertexArray].
void rlUnloadVertexArray(
  num vaoId,
) => _module.rlUnloadVertexArray(vaoId);

/// See [RaylibRlglD.rlUnloadVertexBuffer].
void rlUnloadVertexBuffer(
  num vboId,
) => _module.rlUnloadVertexBuffer(vboId);

/// See [RaylibRlglD.rlSetVertexAttribute].
void rlSetVertexAttribute(
  num index,
  num compSize,
  num type,
  bool normalized,
  num stride,
  num offset,
) => _module.rlSetVertexAttribute(index, compSize, type, normalized, stride, offset);

/// See [RaylibRlglD.rlSetVertexAttributeDivisor].
void rlSetVertexAttributeDivisor(
  num index,
  num divisor,
) => _module.rlSetVertexAttributeDivisor(index, divisor);

/// See [RaylibRlglD.rlSetVertexAttributeDefault].
void rlSetVertexAttributeDefault(
  num locIndex,
  Float32List value,
  RlShaderAttributeDataType attribType,
) => _module.rlSetVertexAttributeDefault(locIndex, value, attribType);

/// See [RaylibRlglD.rlDrawVertexArray].
void rlDrawVertexArray(
  num offset,
  num count,
) => _module.rlDrawVertexArray(offset, count);

/// See [RaylibRlglD.rlDrawVertexArrayElements].
void rlDrawVertexArrayElements(
  num offset,
  num count,
  Uint16List buffer,
) => _module.rlDrawVertexArrayElements(offset, count, buffer);

/// See [RaylibRlglD.rlDrawVertexArrayInstanced].
void rlDrawVertexArrayInstanced(
  num offset,
  num count,
  num instances,
) => _module.rlDrawVertexArrayInstanced(offset, count, instances);

/// See [RaylibRlglD.rlDrawVertexArrayElementsInstanced].
void rlDrawVertexArrayElementsInstanced(
  num offset,
  num count,
  Uint16List buffer,
  num instances,
) => _module.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances);

/// See [RaylibRlglD.rlLoadTexture].
int rlLoadTexture(
  Uint8List? data,
  num width,
  num height,
  PixelFormat format,
  num mipmapCount,
) => _module.rlLoadTexture(data, width, height, format, mipmapCount);

/// See [RaylibRlglD.rlLoadTextureDepth].
int rlLoadTextureDepth(
  num width,
  num height,
  bool useRenderBuffer,
) => _module.rlLoadTextureDepth(width, height, useRenderBuffer);

/// See [RaylibRlglD.rlLoadTextureCubemap].
int rlLoadTextureCubemap(
  Uint8List? data,
  num size,
  PixelFormat format,
  num mipmapCount,
) => _module.rlLoadTextureCubemap(data, size, format, mipmapCount);

/// See [RaylibRlglD.rlUpdateTexture].
void rlUpdateTexture(
  num id,
  num offsetX,
  num offsetY,
  num width,
  num height,
  PixelFormat format,
  Uint8List data,
) => _module.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data);

/// See [RaylibRlglD.rlGetGlTextureFormats].
(int glInternalFormat, int glFormat, int glType) rlGetGlTextureFormats(
  PixelFormat format,
) => _module.rlGetGlTextureFormats(format);

/// See [RaylibRlglD.rlGetPixelFormatName].
String rlGetPixelFormatName(
  PixelFormat format,
) => _module.rlGetPixelFormatName(format);

/// See [RaylibRlglD.rlUnloadTexture].
void rlUnloadTexture(
  num id,
) => _module.rlUnloadTexture(id);

/// See [RaylibRlglD.rlGenTextureMipmaps].
int rlGenTextureMipmaps(
  num id,
  num width,
  num height,
  PixelFormat format,
) => _module.rlGenTextureMipmaps(id, width, height, format);

/// See [RaylibRlglD.rlReadTexturePixels].
Uint8List rlReadTexturePixels(
  num id,
  num width,
  num height,
  PixelFormat format,
) => _module.rlReadTexturePixels(id, width, height, format);

/// See [RaylibRlglD.rlReadScreenPixels].
Uint8List rlReadScreenPixels(
  num width,
  num height,
) => _module.rlReadScreenPixels(width, height);

/// See [RaylibRlglD.rlLoadFramebuffer].
int rlLoadFramebuffer() => _module.rlLoadFramebuffer();

/// See [RaylibRlglD.rlFramebufferAttach].
void rlFramebufferAttach(
  num fboId,
  num texId,
  RlFramebufferAttachType attachType,
  RlFramebufferAttachTextureType texType,
  num mipLevel,
) => _module.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel);

/// See [RaylibRlglD.rlFramebufferComplete].
bool rlFramebufferComplete(
  num id,
) => _module.rlFramebufferComplete(id);

/// See [RaylibRlglD.rlUnloadFramebuffer].
void rlUnloadFramebuffer(
  num id,
) => _module.rlUnloadFramebuffer(id);

/// See [RaylibRlglD.rlCopyFramebuffer].
Uint8List rlCopyFramebuffer(
  num x,
  num y,
  num width,
  num height,
  PixelFormat format,
) => _module.rlCopyFramebuffer(x, y, width, height, format);

/// See [RaylibRlglD.rlResizeFramebuffer].
void rlResizeFramebuffer(
  num width,
  num height,
) => _module.rlResizeFramebuffer(width, height);

/// See [RaylibRlglD.rlLoadShader].
int rlLoadShader(
  String code,
  RlShaderType type,
) => _module.rlLoadShader(code, type);

/// See [RaylibRlglD.rlLoadShaderProgram].
int rlLoadShaderProgram(
  String vsCode,
  String fsCode,
) => _module.rlLoadShaderProgram(vsCode, fsCode);

/// See [RaylibRlglD.rlLoadShaderProgramEx].
int rlLoadShaderProgramEx(
  num vsId,
  num fsId,
) => _module.rlLoadShaderProgramEx(vsId, fsId);

/// See [RaylibRlglD.rlLoadShaderProgramCompute].
int rlLoadShaderProgramCompute(
  num csId,
) => _module.rlLoadShaderProgramCompute(csId);

/// See [RaylibRlglD.rlUnloadShader].
void rlUnloadShader(
  num id,
) => _module.rlUnloadShader(id);

/// See [RaylibRlglD.rlUnloadShaderProgram].
void rlUnloadShaderProgram(
  num id,
) => _module.rlUnloadShaderProgram(id);

/// See [RaylibRlglD.rlGetLocationUniform].
int rlGetLocationUniform(
  num shaderId,
  String uniformName,
) => _module.rlGetLocationUniform(shaderId, uniformName);

/// See [RaylibRlglD.rlGetLocationAttrib].
int rlGetLocationAttrib(
  num shaderId,
  String attribName,
) => _module.rlGetLocationAttrib(shaderId, attribName);

/// See [RaylibRlglD.rlSetUniform].
void rlSetUniform(
  num locIndex,
  TypedDataList value,
  RlShaderUniformDataType uniformType,
  num count,
) => _module.rlSetUniform(locIndex, value, uniformType, count);

/// See [RaylibRlglD.rlSetUniformMatrix].
void rlSetUniformMatrix(
  num locIndex,
  MatrixD mat,
) => _module.rlSetUniformMatrix(locIndex, mat);

/// See [RaylibRlglD.rlSetUniformMatrices].
void rlSetUniformMatrices(
  num locIndex,
  List<MatrixD> mat,
) => _module.rlSetUniformMatrices(locIndex, mat);

/// See [RaylibRlglD.rlSetUniformSampler].
void rlSetUniformSampler(
  num locIndex,
  num textureId,
) => _module.rlSetUniformSampler(locIndex, textureId);

/// See [RaylibRlglD.rlSetShader].
void rlSetShader(
  num id,
  List<int> locs,
) => _module.rlSetShader(id, locs);

/// See [RaylibRlglD.rlComputeShaderDispatch].
void rlComputeShaderDispatch(
  num groupX,
  num groupY,
  num groupZ,
) => _module.rlComputeShaderDispatch(groupX, groupY, groupZ);

/// See [RaylibRlglD.rlLoadShaderBuffer].
int rlLoadShaderBuffer(
  num size,
  TypedDataList? data,
  RlUsageHint? usageHint,
) => _module.rlLoadShaderBuffer(size, data, usageHint);

/// See [RaylibRlglD.rlUnloadShaderBuffer].
void rlUnloadShaderBuffer(
  num ssboId,
) => _module.rlUnloadShaderBuffer(ssboId);

/// See [RaylibRlglD.rlUpdateShaderBuffer].
void rlUpdateShaderBuffer(
  num id,
  TypedDataList data,
  num offset,
) => _module.rlUpdateShaderBuffer(id, data, offset);

/// See [RaylibRlglD.rlBindShaderBuffer].
void rlBindShaderBuffer(
  num id,
  num index,
) => _module.rlBindShaderBuffer(id, index);

/// See [RaylibRlglD.rlReadShaderBuffer].
Uint8List rlReadShaderBuffer(
  num id,
  num count,
  num offset,
) => _module.rlReadShaderBuffer(id, count, offset);

/// See [RaylibRlglD.rlCopyShaderBuffer].
void rlCopyShaderBuffer(
  num destId,
  num srcId,
  num destOffset,
  num srcOffset,
  num count,
) => _module.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count);

/// See [RaylibRlglD.rlGetShaderBufferSize].
int rlGetShaderBufferSize(
  num id,
) => _module.rlGetShaderBufferSize(id);

/// See [RaylibRlglD.rlBindImageTexture].
void rlBindImageTexture(
  num id,
  num index,
  PixelFormat format,
  bool readonly,
) => _module.rlBindImageTexture(id, index, format, readonly);

/// See [RaylibRlglD.rlGetMatrixModelview].
MatrixD rlGetMatrixModelview() => _module.rlGetMatrixModelview();

/// See [RaylibRlglD.rlGetMatrixProjection].
MatrixD rlGetMatrixProjection() => _module.rlGetMatrixProjection();

/// See [RaylibRlglD.rlGetMatrixTransform].
MatrixD rlGetMatrixTransform() => _module.rlGetMatrixTransform();

/// See [RaylibRlglD.rlGetMatrixProjectionStereo].
MatrixD rlGetMatrixProjectionStereo(
  num eye,
) => _module.rlGetMatrixProjectionStereo(eye);

/// See [RaylibRlglD.rlGetMatrixViewOffsetStereo].
MatrixD rlGetMatrixViewOffsetStereo(
  num eye,
) => _module.rlGetMatrixViewOffsetStereo(eye);

/// See [RaylibRlglD.rlSetMatrixProjection].
void rlSetMatrixProjection(
  MatrixD proj,
) => _module.rlSetMatrixProjection(proj);

/// See [RaylibRlglD.rlSetMatrixModelview].
void rlSetMatrixModelview(
  MatrixD view,
) => _module.rlSetMatrixModelview(view);

/// See [RaylibRlglD.rlSetMatrixProjectionStereo].
void rlSetMatrixProjectionStereo(
  MatrixD right,
  MatrixD left,
) => _module.rlSetMatrixProjectionStereo(right, left);

/// See [RaylibRlglD.rlSetMatrixViewOffsetStereo].
void rlSetMatrixViewOffsetStereo(
  MatrixD right,
  MatrixD left,
) => _module.rlSetMatrixViewOffsetStereo(right, left);

/// See [RaylibRlglD.rlLoadDrawCube].
void rlLoadDrawCube() => _module.rlLoadDrawCube();

/// See [RaylibRlglD.rlLoadDrawQuad].
void rlLoadDrawQuad() => _module.rlLoadDrawQuad();

