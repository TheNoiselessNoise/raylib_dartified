part of '../../raylib_dartified_base.dart';

class _RaylibRlglDartDebugLabels extends RaylibDebugLabelsBase {
  
  /// Label for [RaylibRlglDart.rlMatrixMode].
  String rlMatrixMode(
    RlMatrixMode mode,
  ) => 'rlMatrixMode(${mode.name})';

  /// Label for [RaylibRlglDart.rlPushMatrix].
  String rlPushMatrix() => 'rlPushMatrix()';

  /// Label for [RaylibRlglDart.rlPopMatrix].
  String rlPopMatrix() => 'rlPopMatrix()';

  /// Label for [RaylibRlglDart.rlLoadIdentity].
  String rlLoadIdentity() => 'rlLoadIdentity()';

  /// Label for [RaylibRlglDart.rlTranslatef].
  String rlTranslatef(
    num x,
    num y,
    num z,
  ) => 'rlTranslatef($x, $y, $z)';

  /// Label for [RaylibRlglDart.rlRotatef].
  String rlRotatef(
    num angle,
    num x,
    num y,
    num z,
  ) => 'rlRotatef($angle, $x, $y, $z)';

  /// Label for [RaylibRlglDart.rlScalef].
  String rlScalef(
    num x,
    num y,
    num z,
  ) => 'rlScalef($x, $y, $z)';

  /// Label for [RaylibRlglDart.rlMultMatrixf].
  String rlMultMatrixf(
    List<num> matf,
  ) => 'rlMultMatrixf($matf)';

  /// Label for [RaylibRlglDart.rlFrustum].
  String rlFrustum(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => 'rlFrustum($left, $right, $bottom, $top, $znear, $zfar)';

  /// Label for [RaylibRlglDart.rlOrtho].
  String rlOrtho(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => 'rlOrtho($left, $right, $bottom, $top, $znear, $zfar)';

  /// Label for [RaylibRlglDart.rlViewport].
  String rlViewport(
    num x,
    num y,
    num width,
    num height,
  ) => 'rlViewport($x, $y, $width, $height)';

  /// Label for [RaylibRlglDart.rlSetClipPlanes].
  String rlSetClipPlanes(
    num nearPlane,
    num farPlane,
  ) => 'rlSetClipPlanes($nearPlane, $farPlane)';

  /// Label for [RaylibRlglDart.rlGetCullDistanceNear].
  String rlGetCullDistanceNear() => 'rlGetCullDistanceNear()';

  /// Label for [RaylibRlglDart.rlGetCullDistanceFar].
  String rlGetCullDistanceFar() => 'rlGetCullDistanceFar()';

  /// Label for [RaylibRlglDart.rlBegin].
  String rlBegin(
    RlDrawMode mode,
  ) => 'rlBegin(${mode.name})';

  /// Label for [RaylibRlglDart.rlEnd].
  String rlEnd() => 'rlEnd()';

  /// Label for [RaylibRlglDart.rlVertex2i].
  String rlVertex2i(
    num x,
    num y,
  ) => 'rlVertex2i($x, $y)';

  /// Label for [RaylibRlglDart.rlVertex2f].
  String rlVertex2f(
    num x,
    num y,
  ) => 'rlVertex2f($x, $y)';

  /// Label for [RaylibRlglDart.rlVertex3f].
  String rlVertex3f(
    num x,
    num y,
    num z,
  ) => 'rlVertex3f($x, $y, $z)';

  /// Label for [RaylibRlglDart.rlTexCoord2f].
  String rlTexCoord2f(
    num x,
    num y,
  ) => 'rlTexCoord2f($x, $y)';

  /// Label for [RaylibRlglDart.rlNormal3f].
  String rlNormal3f(
    num x,
    num y,
    num z,
  ) => 'rlNormal3f($x, $y, $z)';

  /// Label for [RaylibRlglDart.rlColor4ub].
  String rlColor4ub(
    num r,
    num g,
    num b,
    num a,
  ) => 'rlColor4ub($r, $g, $b, $a)';

  /// Label for [RaylibRlglDart.rlColor3f].
  String rlColor3f(
    num x,
    num y,
    num z,
  ) => 'rlColor3f($x, $y, $z)';

  /// Label for [RaylibRlglDart.rlColor4f].
  String rlColor4f(
    num x,
    num y,
    num z,
    num w,
  ) => 'rlColor4f($x, $y, $z, $w)';

  /// Label for [RaylibRlglDart.rlEnableVertexArray].
  String rlEnableVertexArray(
    num vaoId,
  ) => 'rlEnableVertexArray($vaoId)';

  /// Label for [RaylibRlglDart.rlDisableVertexArray].
  String rlDisableVertexArray() => 'rlDisableVertexArray()';

  /// Label for [RaylibRlglDart.rlEnableVertexBuffer].
  String rlEnableVertexBuffer(
    num id,
  ) => 'rlEnableVertexBuffer($id)';

  /// Label for [RaylibRlglDart.rlDisableVertexBuffer].
  String rlDisableVertexBuffer() => 'rlDisableVertexBuffer()';

  /// Label for [RaylibRlglDart.rlEnableVertexBufferElement].
  String rlEnableVertexBufferElement(
    num id,
  ) => 'rlEnableVertexBufferElement($id)';

  /// Label for [RaylibRlglDart.rlDisableVertexBufferElement].
  String rlDisableVertexBufferElement() => 'rlDisableVertexBufferElement()';

  /// Label for [RaylibRlglDart.rlEnableVertexAttribute].
  String rlEnableVertexAttribute(
    num index,
  ) => 'rlEnableVertexAttribute($index)';

  /// Label for [RaylibRlglDart.rlDisableVertexAttribute].
  String rlDisableVertexAttribute(
    num index,
  ) => 'rlDisableVertexAttribute($index)';

  /// Label for [RaylibRlglDart.rlEnableStatePointer].
  String rlEnableStatePointer(
    int vertexAttribType,
    TypedDataList data,
  ) => 'rlEnableStatePointer($vertexAttribType, data: ${data.length})';
  
  /// Label for [RaylibRlglDart.rlDisableStatePointer].
  String rlDisableStatePointer(
    int vertexAttribType,
  ) => 'rlDisableStatePointer($vertexAttribType)';

  /// Label for [RaylibRlglDart.rlActiveTextureSlot].
  String rlActiveTextureSlot(
    num slot,
  ) => 'rlActiveTextureSlot($slot)';

  /// Label for [RaylibRlglDart.rlEnableTexture].
  String rlEnableTexture(
    num id,
  ) => 'rlEnableTexture($id)';

  /// Label for [RaylibRlglDart.rlDisableTexture].
  String rlDisableTexture() => 'rlDisableTexture()';

  /// Label for [RaylibRlglDart.rlEnableTextureCubemap].
  String rlEnableTextureCubemap(
    num id,
  ) => 'rlEnableTextureCubemap($id)';

  /// Label for [RaylibRlglDart.rlDisableTextureCubemap].
  String rlDisableTextureCubemap() => 'rlDisableTextureCubemap()';

  /// Label for [RaylibRlglDart.rlTextureParameters].
  String rlTextureParameters(
    num id,
    num param,
    num value,
  ) => 'rlTextureParameters($id, $param, $value)';

  /// Label for [RaylibRlglDart.rlCubemapParameters].
  String rlCubemapParameters(
    num id,
    num param,
    num value,
  ) => 'rlCubemapParameters($id, $param, $value)';

  /// Label for [RaylibRlglDart.rlEnableShader].
  String rlEnableShader(
    num id,
  ) => 'rlEnableShader($id)';

  /// Label for [RaylibRlglDart.rlDisableShader].
  String rlDisableShader() => 'rlDisableShader()';

  /// Label for [RaylibRlglDart.rlEnableFramebuffer].
  String rlEnableFramebuffer(
    num id,
  ) => 'rlEnableFramebuffer($id)';

  /// Label for [RaylibRlglDart.rlDisableFramebuffer].
  String rlDisableFramebuffer() => 'rlDisableFramebuffer()';

  /// Label for [RaylibRlglDart.rlGetActiveFramebuffer].
  String rlGetActiveFramebuffer() => 'rlGetActiveFramebuffer()';

  /// Label for [RaylibRlglDart.rlActiveDrawBuffers].
  String rlActiveDrawBuffers(
    num count,
  ) => 'rlActiveDrawBuffers($count)';

  /// Label for [RaylibRlglDart.rlBlitFramebuffer].
  String rlBlitFramebuffer(
    num srcX,
    num srcY,
    num srcWidth,
    num srcHeight,
    num dstX,
    num dstY,
    num dstWidth,
    num dstHeight,
    num bufferMask,
  ) => 'rlBlitFramebuffer($srcX, $srcY, $srcWidth, $srcHeight, $dstX, $dstY, $dstWidth, $dstHeight, $bufferMask)';

  /// Label for [RaylibRlglDart.rlBindFramebuffer].
  String rlBindFramebuffer(
    num target,
    num framebuffer,
  ) => 'rlBindFramebuffer($target, $framebuffer)';

  /// Label for [RaylibRlglDart.rlEnableColorBlend].
  String rlEnableColorBlend() => 'rlEnableColorBlend()';

  /// Label for [RaylibRlglDart.rlDisableColorBlend].
  String rlDisableColorBlend() => 'rlDisableColorBlend()';

  /// Label for [RaylibRlglDart.rlEnableDepthTest].
  String rlEnableDepthTest() => 'rlEnableDepthTest()';

  /// Label for [RaylibRlglDart.rlDisableDepthTest].
  String rlDisableDepthTest() => 'rlDisableDepthTest()';

  /// Label for [RaylibRlglDart.rlEnableDepthMask].
  String rlEnableDepthMask() => 'rlEnableDepthMask()';

  /// Label for [RaylibRlglDart.rlDisableDepthMask].
  String rlDisableDepthMask() => 'rlDisableDepthMask()';

  /// Label for [RaylibRlglDart.rlEnableBackfaceCulling].
  String rlEnableBackfaceCulling() => 'rlEnableBackfaceCulling()';

  /// Label for [RaylibRlglDart.rlDisableBackfaceCulling].
  String rlDisableBackfaceCulling() => 'rlDisableBackfaceCulling()';

  /// Label for [RaylibRlglDart.rlColorMask].
  String rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => 'rlColorMask($r, $g, $b, $a)';

  /// Label for [RaylibRlglDart.rlSetCullFace].
  String rlSetCullFace(
    RlCullMode mode,
  ) => 'rlSetCullFace(${mode.name})';

  /// Label for [RaylibRlglDart.rlEnableScissorTest].
  String rlEnableScissorTest() => 'rlEnableScissorTest()';

  /// Label for [RaylibRlglDart.rlDisableScissorTest].
  String rlDisableScissorTest() => 'rlDisableScissorTest()';

  /// Label for [RaylibRlglDart.rlScissor].
  String rlScissor(
    num x,
    num y,
    num width,
    num height,
  ) => 'rlScissor($x, $y, $width, $height)';

  /// Label for [RaylibRlglDart.rlEnablePointMode].
  String rlEnablePointMode() => 'rlEnablePointMode()';

  /// Label for [RaylibRlglDart.rlDisablePointMode].
  String rlDisablePointMode() => 'rlDisablePointMode()';

  /// Label for [RaylibRlglDart.rlSetPointSize].
  String rlSetPointSize(
    num size,
  ) => 'rlSetPointSize($size)';

  /// Label for [RaylibRlglDart.rlGetPointSize].
  String rlGetPointSize() => 'rlGetPointSize()';

  /// Label for [RaylibRlglDart.rlEnableWireMode].
  String rlEnableWireMode() => 'rlEnableWireMode()';

  /// Label for [RaylibRlglDart.rlDisableWireMode].
  String rlDisableWireMode() => 'rlDisableWireMode()';

  /// Label for [RaylibRlglDart.rlSetLineWidth].
  String rlSetLineWidth(
    num width,
  ) => 'rlSetLineWidth($width)';

  /// Label for [RaylibRlglDart.rlGetLineWidth].
  String rlGetLineWidth() => 'rlGetLineWidth()';

  /// Label for [RaylibRlglDart.rlEnableSmoothLines].
  String rlEnableSmoothLines() => 'rlEnableSmoothLines()';

  /// Label for [RaylibRlglDart.rlDisableSmoothLines].
  String rlDisableSmoothLines() => 'rlDisableSmoothLines()';

  /// Label for [RaylibRlglDart.rlEnableStereoRender].
  String rlEnableStereoRender() => 'rlEnableStereoRender()';

  /// Label for [RaylibRlglDart.rlDisableStereoRender].
  String rlDisableStereoRender() => 'rlDisableStereoRender()';

  /// Label for [RaylibRlglDart.rlIsStereoRenderEnabled].
  String rlIsStereoRenderEnabled() => 'rlIsStereoRenderEnabled()';

  /// Label for [RaylibRlglDart.rlClearColor].
  String rlClearColor(
    num r,
    num g,
    num b,
    num a,
  ) => 'rlClearColor($r, $g, $b, $a)';

  /// Label for [RaylibRlglDart.rlClearScreenBuffers].
  String rlClearScreenBuffers() => 'rlClearScreenBuffers()';

  /// Label for [RaylibRlglDart.rlCheckErrors].
  String rlCheckErrors() => 'rlCheckErrors()';

  /// Label for [RaylibRlglDart.rlSetBlendMode].
  String rlSetBlendMode(
    BlendMode mode,
  ) => 'rlSetBlendMode(${mode.name})';

  /// Label for [RaylibRlglDart.rlSetBlendFactors].
  String rlSetBlendFactors(
    num glSrcFactor,
    num glDstFactor,
    num glEquation,
  ) => 'rlSetBlendFactors($glSrcFactor, $glDstFactor, $glEquation)';

  /// Label for [RaylibRlglDart.rlSetBlendFactorsSeparate].
  String rlSetBlendFactorsSeparate(
    num glSrcRGB,
    num glDstRGB,
    num glSrcAlpha,
    num glDstAlpha,
    num glEqRGB,
    num glEqAlpha,
  ) => 'rlSetBlendFactorsSeparate($glSrcRGB, $glDstRGB, $glSrcAlpha, $glDstAlpha, $glEqRGB, $glEqAlpha)';

  /// Label for [RaylibRlglDart.rlglInit].
  String rlglInit(
    num width,
    num height,
  ) => 'rlglInit($width, $height)';

  /// Label for [RaylibRlglDart.rlglClose].
  String rlglClose() => 'rlglClose()';

  /// Label for [RaylibRlglDart.rlGetVersion].
  String rlGetVersion() => 'rlGetVersion()';

  /// Label for [RaylibRlglDart.rlSetFramebufferWidth].
  String rlSetFramebufferWidth(
    num width,
  ) => 'rlSetFramebufferWidth($width)';

  /// Label for [RaylibRlglDart.rlGetFramebufferWidth].
  String rlGetFramebufferWidth() => 'rlGetFramebufferWidth()';

  /// Label for [RaylibRlglDart.rlSetFramebufferHeight].
  String rlSetFramebufferHeight(
    num height,
  ) => 'rlSetFramebufferHeight($height)';

  /// Label for [RaylibRlglDart.rlGetFramebufferHeight].
  String rlGetFramebufferHeight() => 'rlGetFramebufferHeight()';

  /// Label for [RaylibRlglDart.rlGetTextureIdDefault].
  String rlGetTextureIdDefault() => 'rlGetTextureIdDefault()';

  /// Label for [RaylibRlglDart.rlGetShaderIdDefault].
  String rlGetShaderIdDefault() => 'rlGetShaderIdDefault()';

  /// Label for [RaylibRlglDart.rlGetShaderLocsDefault].
  String rlGetShaderLocsDefault() => 'rlGetShaderLocsDefault()';

  /// Label for [RaylibRlglDart.rlLoadRenderBatch].
  String rlLoadRenderBatch(
    num numBuffers,
    num bufferElements,
  ) => 'rlLoadRenderBatch($numBuffers, $bufferElements)';

  /// Label for [RaylibRlglDart.rlUnloadRenderBatch].
  String rlUnloadRenderBatch(
    RlRenderBatch batch,
  ) => 'rlUnloadRenderBatch($batch)';

  /// Label for [RaylibRlglDart.rlDrawRenderBatch].
  String rlDrawRenderBatch(
    RlRenderBatch batch,
  ) => 'rlDrawRenderBatch($batch)';

  /// Label for [RaylibRlglDart.rlSetRenderBatchActive].
  String rlSetRenderBatchActive([
    RlRenderBatch? batch,
  ]) => 'rlSetRenderBatchActive($batch)';

  /// Label for [RaylibRlglDart.rlDrawRenderBatchActive].
  String rlDrawRenderBatchActive() => 'rlDrawRenderBatchActive()';

  /// Label for [RaylibRlglDart.rlCheckRenderBatchLimit].
  String rlCheckRenderBatchLimit(
    num vCount,
  ) => 'rlCheckRenderBatchLimit($vCount)';

  /// Label for [RaylibRlglDart.rlSetTexture].
  String rlSetTexture(
    num id,
  ) => 'rlSetTexture($id)';

  /// Label for [RaylibRlglDart.rlLoadVertexArray].
  String rlLoadVertexArray() => 'rlLoadVertexArray()';

  /// Label for [RaylibRlglDart.rlLoadVertexBuffer].
  String rlLoadVertexBuffer(
    TypedDataList buffer,
    bool dynamic,
  ) => 'rlLoadVertexBuffer(${buffer.lengthInBytes}, $dynamic)';

  /// Label for [RaylibRlglDart.rlLoadVertexBufferElement].
  String rlLoadVertexBufferElement(
    TypedDataList buffer,
    bool dynamic,
  ) => 'rlLoadVertexBufferElement(${buffer.lengthInBytes}, $dynamic)';

  /// Label for [RaylibRlglDart.rlUpdateVertexBuffer].
  String rlUpdateVertexBuffer(
    num bufferId,
    TypedDataList data,
    num dataSize,
    num offset,
  ) => 'rlUpdateVertexBuffer($bufferId, ${data.lengthInBytes}, $dataSize, $offset)';

  /// Label for [RaylibRlglDart.rlUpdateVertexBufferElements].
  String rlUpdateVertexBufferElements(
    num id,
    TypedDataList data,
    num dataSize,
    num offset,
  ) => 'rlLoadVertexBufferElement($id, ${data.lengthInBytes}, $dataSize, $offset)';

  /// Label for [RaylibRlglDart.rlUnloadVertexArray].
  String rlUnloadVertexArray(
    num vaoId,
  ) => 'rlUnloadVertexArray($vaoId)';

  /// Label for [RaylibRlglDart.rlUnloadVertexBuffer].
  String rlUnloadVertexBuffer(
    num vboId,
  ) => 'rlUnloadVertexBuffer($vboId)';

  /// Label for [RaylibRlglDart.rlSetVertexAttribute].
  String rlSetVertexAttribute(
    num index,
    num compSize,
    num type,
    bool normalized,
    num stride,
    num offset,
  ) => 'rlSetVertexAttribute($index, $compSize, $type, $normalized, $stride, $offset)';

  /// Label for [RaylibRlglDart.rlSetVertexAttributeDivisor].
  String rlSetVertexAttributeDivisor(
    num index,
    num divisor,
  ) => 'rlSetVertexAttributeDivisor($index, $divisor)';

  /// Label for [RaylibRlglDart.rlSetVertexAttributeDefault].
  String rlSetVertexAttributeDefault(
    num locIndex,
    Float32List value,
    RlShaderAttributeDataType attribType,
  ) => 'rlSetVertexAttributeDefault($locIndex, ${value.length}, ${attribType.name})';

  /// Label for [RaylibRlglDart.rlDrawVertexArray].
  String rlDrawVertexArray(
    num offset,
    num count,
  ) => 'rlDrawVertexArray($offset, $count)';

  /// Label for [RaylibRlglDart.rlDrawVertexArrayElements].
  String rlDrawVertexArrayElements(
    num offset,
    num count,
    Uint16List buffer,
  ) => 'rlDrawVertexArrayElements($offset, ${buffer.length})';

  /// Label for [RaylibRlglDart.rlDrawVertexArrayInstanced].
  String rlDrawVertexArrayInstanced(
    num offset,
    num count,
    num instances,
  ) => 'rlDrawVertexArrayInstanced($offset, $count, $instances)';

  /// Label for [RaylibRlglDart.rlDrawVertexArrayElementsInstanced].
  String rlDrawVertexArrayElementsInstanced(
    num offset,
    num count,
    Uint16List buffer,
    num instances,
  ) => 'rlDrawVertexArrayElementsInstanced($offset, $count, ${buffer.length}, $instances)';

  /// Label for [RaylibRlglDart.rlLoadTexture].
  String rlLoadTexture(
    Uint8List? data,
    num width,
    num height,
    PixelFormat format,
    num mipmapCount,
  ) => 'rlLoadTexture(${data?.length}, $width, $height, $format, $mipmapCount)';

  /// Label for [RaylibRlglDart.rlLoadTextureDepth].
  String rlLoadTextureDepth(
    num width,
    num height,
    bool useRenderBuffer,
  ) => 'rlLoadTextureDepth($width, $height, $useRenderBuffer)';

  /// Label for [RaylibRlglDart.rlLoadTextureCubemap].
  String rlLoadTextureCubemap(
    Uint8List? data,
    num size,
    PixelFormat format,
    num mipmapCount,
  ) => 'rlLoadTextureCubemap(${data?.length}, $size, ${format.name}, $mipmapCount)';

  /// Label for [RaylibRlglDart.rlUpdateTexture].
  String rlUpdateTexture(
    num id,
    num offsetX,
    num offsetY,
    num width,
    num height,
    PixelFormat format,
    Uint8List data,
  ) => 'rlUpdateTexture($id, $offsetX, $offsetY, $width, $height, ${format.name}, ${data.length})';

  /// Label for [RaylibRlglDart.rlGetGlTextureFormats].
  String rlGetGlTextureFormats(
    PixelFormat format,
  ) => 'rlGetGlTextureFormats(${format.name})';

  /// Label for [RaylibRlglDart.rlGetPixelFormatName].
  String rlGetPixelFormatName(
    PixelFormat format,
  ) => 'rlGetPixelFormatName(${format.name})';

  /// Label for [RaylibRlglDart.rlUnloadTexture].
  String rlUnloadTexture(
    num id,
  ) => 'rlUnloadTexture($id)';

  /// Label for [RaylibRlglDart.rlGenTextureMipmaps].
  String rlGenTextureMipmaps(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlGenTextureMipmaps($id, $width, $height, ${format.name})';

  /// Label for [RaylibRlglDart.rlReadTexturePixels].
  String rlReadTexturePixels(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlReadTexturePixels($id, $width, $height, ${format.name})';

  /// Label for [RaylibRlglDart.rlReadScreenPixels].
  String rlReadScreenPixels(
    num width,
    num height,
  ) => 'rlReadScreenPixels($width, $height)';

  /// Label for [RaylibRlglDart.rlLoadFramebuffer].
  String rlLoadFramebuffer() => 'rlLoadFramebuffer()';

  /// Label for [RaylibRlglDart.rlFramebufferAttach].
  String rlFramebufferAttach(
    num fboId,
    num texId,
    RlFramebufferAttachType attachType,
    RlFramebufferAttachTextureType texType,
    num mipLevel,
  ) => 'rlFramebufferAttach($fboId, $texId, ${attachType.name}, ${texType.name}, $mipLevel)';

  /// Label for [RaylibRlglDart.rlFramebufferComplete].
  String rlFramebufferComplete(
    num id,
  ) => 'rlFramebufferComplete($id)';

  /// Label for [RaylibRlglDart.rlUnloadFramebuffer].
  String rlUnloadFramebuffer(
    num id,
  ) => 'rlUnloadFramebuffer($id)';

  /// Label for [RaylibRlglDart.rlCopyFramebuffer].
  String rlCopyFramebuffer(
    num x,
    num y,
    num width,
    num height,
    PixelFormat format,
  ) => 'rlCopyFramebuffer($x, $y, $width, $height, $format)';
  
  /// Label for [RaylibRlglDart.rlResizeFramebuffer].
  String rlResizeFramebuffer(
    num width,
    num height,
  ) => 'rlResizeFramebuffer($width, $height)';

  /// Label for [RaylibRlglDart.rlLoadShader].
  String rlLoadShader(
    String code,
    RlShaderType type,
  ) => 'rlLoadShader(${code.length}, $type)';

  /// Label for [RaylibRlglDart.rlLoadShaderProgram].
  String rlLoadShaderProgram(
    String vsCode,
    String fsCode,
  ) => 'rlLoadShaderProgram($vsCode, $fsCode)';

  /// Label for [RaylibRlglDart.rlLoadShaderProgramEx].
  String rlLoadShaderProgramEx(
    num vsId,
    num fsId,
  ) => 'rlLoadShaderProgramEx($vsId, $fsId)';
  
  /// Label for [RaylibRlglDart.rlLoadShaderProgramCompute].
  String rlLoadShaderProgramCompute(
    num csId,
  ) => 'rlLoadShaderProgramCompute($csId)';
  
  /// Label for [RaylibRlglDart.rlUnloadShader].
  String rlUnloadShader(
    num id,
  ) => 'rlUnloadShader($id)';

  /// Label for [RaylibRlglDart.rlUnloadShaderProgram].
  String rlUnloadShaderProgram(
    num id,
  ) => 'rlUnloadShaderProgram($id)';

  /// Label for [RaylibRlglDart.rlGetLocationUniform].
  String rlGetLocationUniform(
    num shaderId,
    String uniformName,
  ) => 'rlGetLocationUniform($shaderId, $uniformName)';

  /// Label for [RaylibRlglDart.rlGetLocationAttrib].
  String rlGetLocationAttrib(
    num shaderId,
    String attribName,
  ) => 'rlGetLocationAttrib($shaderId, $attribName)';

  /// Label for [RaylibRlglDart.rlSetUniform].
  String rlSetUniform(
    num locIndex,
    TypedDataList value,
    RlShaderUniformDataType uniformType,
    num count,
  ) => 'rlSetUniform($locIndex, ${value.lengthInBytes}, ${uniformType.name})';

  /// Label for [RaylibRlglDart.rlSetUniformMatrix].
  String rlSetUniformMatrix(
    num locIndex,
    Matrix mat,
  ) => 'rlSetUniformMatrix($locIndex, $mat)';

  /// Label for [RaylibRlglDart.rlSetUniformMatrices].
  String rlSetUniformMatrices(
    num locIndex,
    List<Matrix> mat,
  ) => 'rlSetUniformMatrices($locIndex, mat: ${mat.length})';

  /// Label for [RaylibRlglDart.rlSetUniformSampler].
  String rlSetUniformSampler(
    num locIndex,
    num textureId,
  ) => 'rlSetUniformSampler($locIndex, $textureId)';

  /// Label for [RaylibRlglDart.rlSetShader].
  String rlSetShader(
    num id,
    List<int> locs,
  ) => 'rlSetShader($id, $locs)';

  /// Label for [RaylibRlglDart.rlComputeShaderDispatch].
  String rlComputeShaderDispatch(
    num groupX,
    num groupY,
    num groupZ,
  ) => 'rlComputeShaderDispatch($groupX, $groupY, $groupZ)';

  /// Label for [RaylibRlglDart.rlLoadShaderBuffer].
  String rlLoadShaderBuffer(
    num size,
    TypedDataList? data,
    RlUsageHint? usageHint,
  ) => 'rlLoadShaderBuffer($size, data: ${data?.lengthInBytes}, $usageHint)';

  /// Label for [RaylibRlglDart.rlUnloadShaderBuffer].
  String rlUnloadShaderBuffer(
    num ssboId,
  ) => 'rlUnloadShaderBuffer($ssboId)';

  /// Label for [RaylibRlglDart.rlUpdateShaderBuffer].
  String rlUpdateShaderBuffer(
    num id,
    TypedDataList data,
    num offset,
  ) => 'rlUpdateShaderBuffer($id, data: ${data.lengthInBytes}, $offset)';

  /// Label for [RaylibRlglDart.rlBindShaderBuffer].
  String rlBindShaderBuffer(
    num id,
    num index,
  ) => 'rlBindShaderBuffer($id, $index)';

  /// Label for [RaylibRlglDart.rlReadShaderBuffer].
  String rlReadShaderBuffer(
    num id,
    num count,
    num offset,
  ) => 'rlReadShaderBuffer($id, $count, $offset)';

  /// Label for [RaylibRlglDart.rlCopyShaderBuffer].
  String rlCopyShaderBuffer(
    num destId,
    num srcId,
    num destOffset,
    num srcOffset,
    num count,
  ) => 'rlCopyShaderBuffer($destId, $srcId, $destOffset, $srcOffset, $count)';

  /// Label for [RaylibRlglDart.rlGetShaderBufferSize].
  String rlGetShaderBufferSize(
    num id,
  ) => 'rlGetShaderBufferSize($id)';

  /// Label for [RaylibRlglDart.rlBindImageTexture].
  String rlBindImageTexture(
    num id,
    num index,
    PixelFormat format,
    bool readonly,
  ) => 'rlBindImageTexture($id, $index, ${format.name}, $readonly)';

  /// Label for [RaylibRlglDart.rlGetMatrixModelview].
  String rlGetMatrixModelview() => 'rlGetMatrixModelview()';

  /// Label for [RaylibRlglDart.rlGetMatrixProjection].
  String rlGetMatrixProjection() => 'rlGetMatrixProjection()';

  /// Label for [RaylibRlglDart.rlGetMatrixTransform].
  String rlGetMatrixTransform() => 'rlGetMatrixTransform()';

  /// Label for [RaylibRlglDart.rlGetMatrixProjectionStereo].
  String rlGetMatrixProjectionStereo(
    num eye,
  ) => 'rlGetMatrixProjectionStereo($eye)';

  /// Label for [RaylibRlglDart.rlGetMatrixViewOffsetStereo].
  String rlGetMatrixViewOffsetStereo(
    num eye,
  ) => 'rlGetMatrixViewOffsetStereo($eye)';

  /// Label for [RaylibRlglDart.rlSetMatrixProjection].
  String rlSetMatrixProjection(
    Matrix proj,
  ) => 'rlSetMatrixProjection($proj)';

  /// Label for [RaylibRlglDart.rlSetMatrixModelview].
  String rlSetMatrixModelview(
    Matrix view,
  ) => 'rlSetMatrixModelview($view)';

  /// Label for [RaylibRlglDart.rlSetMatrixProjectionStereo].
  String rlSetMatrixProjectionStereo(
    Matrix right,
    Matrix left,
  ) => 'rlSetMatrixProjectionStereo($right, $left)';

  /// Label for [RaylibRlglDart.rlSetMatrixViewOffsetStereo].
  String rlSetMatrixViewOffsetStereo(
    Matrix right,
    Matrix left,
  ) => 'rlSetMatrixViewOffsetStereo($right, $left)';

  /// Label for [RaylibRlglDart.rlLoadDrawCube].
  String rlLoadDrawCube() => 'rlLoadDrawCube()';

  /// Label for [RaylibRlglDart.rlLoadDrawQuad].
  String rlLoadDrawQuad() => 'rlLoadDrawQuad()';
  
}
