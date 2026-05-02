part of '../../../raylib.dart';

class RaylibRlglD extends RaylibModuleD with RaylibRlglExtras {
  RaylibRlglD(super.lib);

  void rlMatrixMode(
    RlMatrixMode mode,
  ) => run(
    () => 'rlMatrixMode(${mode.name})',
    () => rl.Rlgl.rlMatrixMode(mode.value),
  );

  void rlPushMatrix() => run(
    () => 'rlPushMatrix()',
    () => rl.Rlgl.rlPushMatrix(),
  );

  void rlPopMatrix() => run(
    () => 'rlPopMatrix()',
    () => rl.Rlgl.rlPopMatrix(),
  );

  void rlLoadIdentity() => run(
    () => 'rlLoadIdentity()',
    () => rl.Rlgl.rlLoadIdentity(),
  );

  void rlTranslatef(
    num x,
    num y,
    num z,
  ) => run(
    () => 'rlTranslatef($x, $y, $z)',
    () => rl.Rlgl.rlTranslatef(
      x.toDouble(),
      y.toDouble(),
      z.toDouble(),
    ),
  );

  void rlRotatef(
    num angle,
    num x,
    num y,
    num z,
  ) => run(
    () => 'rlRotatef($angle, $x, $y, $z)',
    () => rl.Rlgl.rlRotatef(
      angle.toDouble(),
      x.toDouble(),
      y.toDouble(),
      z.toDouble(),
    ),
  );

  void rlScalef(
    num x,
    num y,
    num z,
  ) => run(
    () => 'rlScalef($x, $y, $z)',
    () => rl.Rlgl.rlScalef(
      x.toDouble(),
      y.toDouble(),
      z.toDouble(),
    ),
  );

  void rlMultMatrixf(
    List<double> matf,
  ) => run(
    () => 'rlMultMatrixf($matf)',
    () => rl.Rlgl.rlMultMatrixf(refListFloat(matf)),
  );

  void rlFrustum(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => run(
    () => '_rlFrustum($left, $right, $bottom, $top, $znear, $zfar)',
    () => rl.Rlgl.rlFrustum(
      left.toDouble(),
      right.toDouble(),
      bottom.toDouble(),
      top.toDouble(),
      znear.toDouble(),
      zfar.toDouble(),
    ),
  );

  void rlOrtho(
    num left,
    num right,
    num bottom,
    num top,
    num znear,
    num zfar,
  ) => run(
    () => '_rlOrtho($left, $right, $bottom, $top, $znear, $zfar)',
    () => rl.Rlgl.rlOrtho(
      left.toDouble(),
      right.toDouble(),
      bottom.toDouble(),
      top.toDouble(),
      znear.toDouble(),
      zfar.toDouble(),
    ),
  );

  void rlViewport(
    num x,
    num y,
    num width,
    num height,
  ) => run(
    () => 'rlViewport($x, $y, $width, $height)',
    () => rl.Rlgl.rlViewport(
      x.toInt(),
      y.toInt(),
      width.toInt(),
      height.toInt(),
    ),
  );

  void rlSetClipPlanes(
    num nearPlane,
    num farPlane,
  ) => run(
    () => 'rlSetClipPlanes($nearPlane, $farPlane)',
    () => rl.Rlgl.rlSetClipPlanes(
      nearPlane.toDouble(),
      farPlane.toDouble(),
    ),
  );

  double rlGetCullDistanceNear() => run(
    () => 'rlGetCullDistanceNear()',
    () => rl.Rlgl.rlGetCullDistanceNear(),
  );

  double rlGetCullDistanceFar() => run(
    () => 'rlGetCullDistanceFar()',
    () => rl.Rlgl.rlGetCullDistanceFar(),
  );

  void rlBegin(
    RlDrawMode mode,
  ) => run(
    () => 'rlBegin(${mode.name})',
    () => rl.Rlgl.rlBegin(mode.value),
  );

  void rlEnd() => run(
    () => 'rlEnd()',
    () => rl.Rlgl.rlEnd(),
  );

  void rlVertex2i(
    num x,
    num y,
  ) => run(
    () => 'rlVertex2i($x, $y)',
    () => rl.Rlgl.rlVertex2i(
      x.toInt(),
      y.toInt(),
    ),
  );

  void rlVertex2f(
    num x,
    num y,
  ) => run(
    () => 'rlVertex2f($x, $y)',
    () => rl.Rlgl.rlVertex2f(
      x.toDouble(),
      y.toDouble(),
    ),
  );

  void rlVertex3f(
    num x,
    num y,
    num z,
  ) => run(
    () => 'rlVertex3f($x, $y, $z)',
    () => rl.Rlgl.rlVertex3f(
      x.toDouble(),
      y.toDouble(),
      z.toDouble(),
    ),
  );

  void rlTexCoord2f(
    num x,
    num y,
  ) => run(
    () => 'rlTexCoord2f($x, $y)',
    () => rl.Rlgl.rlTexCoord2f(
      x.toDouble(),
      y.toDouble(),
    ),
  );

  void rlNormal3f(
    num x,
    num y,
    num z,
  ) => run(
    () => 'rlNormal3f($x, $y, $z)',
    () => rl.Rlgl.rlNormal3f(
      x.toDouble(),
      y.toDouble(),
      z.toDouble(),
    ),
  );

  void rlColor4ub(
    num r,
    num g,
    num b,
    num a,
  ) => run(
    () => 'rlColor4ub($r, $g, $b, $a)',
    () => rl.Rlgl.rlColor4ub(
      r.toInt(),
      g.toInt(),
      b.toInt(),
      a.toInt(),
    ),
  );

  void rlColor(
    ColorD color,
  ) => run(
    () => 'rlColor($color)',
    () => rl.Rlgl.rlColor4ub(
      color.r,
      color.g,
      color.b,
      color.a,
    ),
  );

  void rlColor3f(
    num x,
    num y,
    num z,
  ) => run(
    () => 'rlColor3f($x, $y, $z)',
    () => rl.Rlgl.rlColor3f(
      x.toDouble(),
      y.toDouble(),
      z.toDouble(),
    ),
  );

  void rlColor4f(
    num x,
    num y,
    num z,
    num w,
  ) => run(
    () => 'rlColor4f($x, $y, $z, $w)',
    () => rl.Rlgl.rlColor4f(
      x.toDouble(),
      y.toDouble(),
      z.toDouble(),
      w.toDouble(),
    ),
  );

  bool rlEnableVertexArray(
    num vaoId,
  ) => run(
    () => 'rlEnableVertexArray($vaoId)',
    () => rl.Rlgl.rlEnableVertexArray(vaoId.toInt()),
  );

  void rlDisableVertexArray() => run(
    () => 'rlDisableVertexArray()',
    () => rl.Rlgl.rlDisableVertexArray(),
  );

  void rlEnableVertexBuffer(
    num id,
  ) => run(
    () => 'rlEnableVertexBuffer($id)',
    () => rl.Rlgl.rlEnableVertexBuffer(id.toInt()),
  );

  void rlDisableVertexBuffer() => run(
    () => 'rlDisableVertexBuffer()',
    () => rl.Rlgl.rlDisableVertexBuffer(),
  );

  void rlEnableVertexBufferElement(
    num id,
  ) => run(
    () => 'rlEnableVertexBufferElement($id)',
    () => rl.Rlgl.rlEnableVertexBufferElement(id.toInt()),
  );

  void rlDisableVertexBufferElement() => run(
    () => 'rlDisableVertexBufferElement()',
    () => rl.Rlgl.rlDisableVertexBufferElement(),
  );

  void rlEnableVertexAttribute(
    num index,
  ) => run(
    () => 'rlEnableVertexAttribute($index)',
    () => rl.Rlgl.rlEnableVertexAttribute(index.toInt()),
  );

  void rlDisableVertexAttribute(
    num index,
  ) => run(
    () => 'rlDisableVertexAttribute($index)',
    () => rl.Rlgl.rlDisableVertexAttribute(index.toInt()),
  );

  void rlActiveTextureSlot(
    num slot,
  ) => run(
    () => 'rlActiveTextureSlot($slot)',
    () => rl.Rlgl.rlActiveTextureSlot(slot.toInt()),
  );

  void rlEnableTexture(
    num id,
  ) => run(
    () => 'rlEnableTexture($id)',
    () => rl.Rlgl.rlEnableTexture(id.toInt()),
  );

  void rlDisableTexture() => run(
    () => 'rlDisableTexture()',
    () => rl.Rlgl.rlDisableTexture(),
  );

  void rlEnableTextureCubemap(
    num id,
  ) => run(
    () => 'rlEnableTextureCubemap($id)',
    () => rl.Rlgl.rlEnableTextureCubemap(id.toInt()),
  );

  void rlDisableTextureCubemap() => run(
    () => 'rlDisableTextureCubemap()',
    () => rl.Rlgl.rlDisableTextureCubemap(),
  );

  void rlTextureParameters(
    num id,
    num param,
    num value,
  ) => run(
    () => 'rlTextureParameters($id, $param, $value)',
    () => rl.Rlgl.rlTextureParameters(
      id.toInt(),
      param.toInt(),
      value.toInt(),
    ),
  );

  void rlCubemapParameters(
    num id,
    num param,
    num value,
  ) => run(
    () => 'rlCubemapParameters($id, $param, $value)',
    () => rl.Rlgl.rlCubemapParameters(
      id.toInt(),
      param.toInt(),
      value.toInt(),
    ),
  );

  void rlEnableShader(
    num id,
  ) => run(
    () => 'rlEnableShader($id)',
    () => rl.Rlgl.rlEnableShader(id.toInt()),
  );

  void rlDisableShader() => run(
    () => 'rlDisableShader()',
    () => rl.Rlgl.rlDisableShader(),
  );

  void rlEnableFramebuffer(
    num id,
  ) => run(
    () => 'rlEnableFramebuffer($id)',
    () => rl.Rlgl.rlEnableFramebuffer(id.toInt()),
  );

  void rlDisableFramebuffer() => run(
    () => 'rlDisableFramebuffer()',
    () => rl.Rlgl.rlDisableFramebuffer(),
  );

  int rlGetActiveFramebuffer() => run(
    () => 'rlGetActiveFramebuffer()',
    () => rl.Rlgl.rlGetActiveFramebuffer(),
  );

  void rlActiveDrawBuffers(
    num count,
  ) => run(
    () => 'rlActiveDrawBuffers($count)',
    () => rl.Rlgl.rlActiveDrawBuffers(count.toInt()),
  );

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
  ) => run(
    () => 'rlBlitFramebuffer($srcX, $srcY, $srcWidth, $srcHeight, $dstX, $dstY, $dstWidth, $dstHeight, $bufferMask)',
    () => rl.Rlgl.rlBlitFramebuffer(
      srcX.toInt(),
      srcY.toInt(),
      srcWidth.toInt(),
      srcHeight.toInt(),
      dstX.toInt(),
      dstY.toInt(),
      dstWidth.toInt(),
      dstHeight.toInt(),
      bufferMask.toInt(),
    ),
  );

  void rlBindFramebuffer(
    num target,
    num framebuffer,
  ) => run(
    () => 'rlBindFramebuffer($target, $framebuffer)',
    () => rl.Rlgl.rlBindFramebuffer(
      target.toInt(),
      framebuffer.toInt(),
    ),
  );

  void rlEnableColorBlend() => run(
    () => 'rlEnableColorBlend()',
    () => rl.Rlgl.rlEnableColorBlend(),
  );

  void rlDisableColorBlend() => run(
    () => 'rlDisableColorBlend()',
    () => rl.Rlgl.rlDisableColorBlend(),
  );

  void rlEnableDepthTest() => run(
    () => 'rlEnableDepthTest()',
    () => rl.Rlgl.rlEnableDepthTest(),
  );

  void rlDisableDepthTest() => run(
    () => 'rlDisableDepthTest()',
    () => rl.Rlgl.rlDisableDepthTest(),
  );

  void rlEnableDepthMask() => run(
    () => 'rlEnableDepthMask()',
    () => rl.Rlgl.rlEnableDepthMask(),
  );

  void rlDisableDepthMask() => run(
    () => 'rlDisableDepthMask()',
    () => rl.Rlgl.rlDisableDepthMask(),
  );

  void rlEnableBackfaceCulling() => run(
    () => 'rlEnableBackfaceCulling()',
    () => rl.Rlgl.rlEnableBackfaceCulling(),
  );

  void rlDisableBackfaceCulling() => run(
    () => 'rlDisableBackfaceCulling()',
    () => rl.Rlgl.rlDisableBackfaceCulling(),
  );

  void rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => run(
    () => 'rlColorMask($r, $g, $b, $a)',
    () => rl.Rlgl.rlColorMask(r, g, b, a),
  );

  void rlSetCullFace(
    RlCullMode mode,
  ) => run(
    () => 'rlSetCullFace(${mode.name})',
    () => rl.Rlgl.rlSetCullFace(mode.value),
  );

  void rlEnableScissorTest() => run(
    () => 'rlEnableScissorTest()',
    () => rl.Rlgl.rlEnableScissorTest(),
  );

  void rlDisableScissorTest() => run(
    () => 'rlDisableScissorTest()',
    () => rl.Rlgl.rlDisableScissorTest(),
  );

  void rlScissor(
    num x,
    num y,
    num width,
    num height,
  ) => run(
    () => 'rlScissor($x, $y, $width, $height)',
    () => rl.Rlgl.rlScissor(
      x.toInt(),
      y.toInt(),
      width.toInt(),
      height.toInt(),
    ),
  );

  void rlEnableWireMode() => run(
    () => 'rlEnableWireMode()',
    () => rl.Rlgl.rlEnableWireMode(),
  );

  void rlEnablePointMode() => run(
    () => 'rlEnablePointMode()',
    () => rl.Rlgl.rlEnablePointMode(),
  );

  void rlDisableWireMode() => run(
    () => 'rlDisableWireMode()',
    () => rl.Rlgl.rlDisableWireMode(),
  );

  void rlSetLineWidth(
    num width,
  ) => run(
    () => 'rlSetLineWidth($width)',
    () => rl.Rlgl.rlSetLineWidth(width.toDouble()),
  );

  double rlGetLineWidth() => run(
    () => 'rlGetLineWidth()',
    () => rl.Rlgl.rlGetLineWidth(),
  );

  void rlEnableSmoothLines() => run(
    () => 'rlEnableSmoothLines()',
    () => rl.Rlgl.rlEnableSmoothLines(),
  );

  void rlDisableSmoothLines() => run(
    () => 'rlDisableSmoothLines()',
    () => rl.Rlgl.rlDisableSmoothLines(),
  );

  void rlEnableStereoRender() => run(
    () => 'rlEnableStereoRender()',
    () => rl.Rlgl.rlEnableStereoRender(),
  );

  void rlDisableStereoRender() => run(
    () => 'rlDisableStereoRender()',
    () => rl.Rlgl.rlDisableStereoRender(),
  );

  bool rlIsStereoRenderEnabled() => run(
    () => 'rlIsStereoRenderEnabled()',
    () => rl.Rlgl.rlIsStereoRenderEnabled(),
  );

  void rlClearColor(
    num r,
    num g,
    num b,
    num a,
  ) => run(
    () => 'rlClearColor($r, $g, $b, $a)',
    () => rl.Rlgl.rlClearColor(
      r.toInt(),
      g.toInt(),
      b.toInt(),
      a.toInt(),
    ),
  );

  void rlClearScreenBuffers() => run(
    () => 'rlClearScreenBuffers()',
    () => rl.Rlgl.rlClearScreenBuffers(),
  );

  void rlCheckErrors() => run(
    () => 'rlCheckErrors()',
    () => rl.Rlgl.rlCheckErrors(),
  );

  void rlSetBlendMode(
    RlBlendMode mode,
  ) => run(
    () => 'rlSetBlendMode(${mode.name})',
    () => rl.Rlgl.rlSetBlendMode(mode.value),
  );

  void rlSetBlendFactors(
    num glSrcFactor,
    num glDstFactor,
    num glEquation,
  ) => run(
    () => 'rlSetBlendFactors($glSrcFactor, $glDstFactor, $glEquation)',
    () => rl.Rlgl.rlSetBlendFactors(
      glSrcFactor.toInt(),
      glDstFactor.toInt(),
      glEquation.toInt(),
    ),
  );

  void rlSetBlendFactorsSeparate(
    num glSrcRGB,
    num glDstRGB,
    num glSrcAlpha,
    num glDstAlpha,
    num glEqRGB,
    num glEqAlpha,
  ) => run(
    () => 'rlSetBlendFactorsSeparate($glSrcRGB, $glDstRGB, $glSrcAlpha, $glDstAlpha, $glEqRGB, $glEqAlpha)',
    () => rl.Rlgl.rlSetBlendFactorsSeparate(
      glSrcRGB.toInt(),
      glDstRGB.toInt(),
      glSrcAlpha.toInt(),
      glDstAlpha.toInt(),
      glEqRGB.toInt(),
      glEqAlpha.toInt(),
    ),
  );

  void rlglInit(
    num width,
    num height,
  ) => run(
    () => 'rlglInit($width, $height)',
    () => rl.Rlgl.rlglInit(
      width.toInt(),
      height.toInt(),
    ),
  );

  void rlglClose() => run(
    () => 'rlglClose()',
    () => rl.Rlgl.rlglClose(),
  );

  // NOTE: rlLoadExtensions is not implemented, use it in raw FFI layer if you really need it

  int rlGetVersion() => run(
    () => 'rlGetVersion()',
    () => rl.Rlgl.rlGetVersion(),
  );

  void rlSetFramebufferWidth(
    num width,
  ) => run(
    () => 'rlSetFramebufferWidth($width)',
    () => rl.Rlgl.rlSetFramebufferWidth(width.toInt()),
  );

  int rlGetFramebufferWidth() => run(
    () => 'rlGetFramebufferWidth()',
    () => rl.Rlgl.rlGetFramebufferWidth(),
  );

  void rlSetFramebufferHeight(
    num height,
  ) => run(
    () => 'rlSetFramebufferHeight($height)',
    () => rl.Rlgl.rlSetFramebufferHeight(height.toInt()),
  );

  int rlGetFramebufferHeight() => run(
    () => 'rlGetFramebufferHeight()',
    () => rl.Rlgl.rlGetFramebufferHeight(),
  );

  int rlGetTextureIdDefault() => run(
    () => 'rlGetTextureIdDefault()',
    () => rl.Rlgl.rlGetTextureIdDefault(),
  );

  int rlGetShaderIdDefault() => run(
    () => 'rlGetShaderIdDefault()',
    () => rl.Rlgl.rlGetShaderIdDefault(),
  );

  List<int> rlGetShaderLocsDefault() => run(
    () => 'rlGetShaderLocsDefault()',
    () {
      final locs = rl.Rlgl.rlGetShaderLocsDefault();
      return List.generate(RL_MAX_SHADER_LOCATIONS, (i) => locs[i]);
    },
  );

  RlRenderBatchD rlLoadRenderBatch(
    num numBuffers,
    num bufferElements,
  ) => run(
    () => 'rlLoadRenderBatch($numBuffers, $bufferElements)',
    () => _refCaptureRlRenderBatch(
      'rlLoadRenderBatch_${numBuffers}_$bufferElements',
      rl.Rlgl.rlLoadRenderBatch(
        numBuffers.toInt(),
        bufferElements.toInt(),
      ),
    ),
  );

  void rlUnloadRenderBatch(
    RlRenderBatchD batch,
  ) => run(
    () => 'rlUnloadRenderBatch($batch)',
    () => rl.Rlgl.rlUnloadRenderBatch(
      _refRlRenderBatch1(batch).ref,
    ),
  );

  void rlDrawRenderBatch(
    RlRenderBatchD batch,
  ) => run(
    () => 'rlDrawRenderBatch($batch)',
    () => _refUpdateRLRenderBatch(batch,
      (pb) => rl.Rlgl.rlDrawRenderBatch(pb),
    ),
  );

  void rlSetRenderBatchActive(
    RlRenderBatchD batch,
  ) => run(
    () => 'rlSetRenderBatchActive($batch)',
    () => _refUpdateRLRenderBatch(batch,
      (pb) => rl.Rlgl.rlSetRenderBatchActive(pb),
    ),
  );

  void rlDrawRenderBatchActive() => run(
    () => 'rlDrawRenderBatchActive()',
    () => rl.Rlgl.rlDrawRenderBatchActive(),
  );

  bool rlCheckRenderBatchLimit(
    num vCount,
  ) => run(
    () => 'rlCheckRenderBatchLimit($vCount)',
    () => rl.Rlgl.rlCheckRenderBatchLimit(vCount.toInt()),
  );

  void rlSetTexture(
    num id,
  ) => run(
    () => 'rlSetTexture($id)',
    () => rl.Rlgl.rlSetTexture(id.toInt()),
  );

  int rlLoadVertexArray() => run(
    () => 'rlLoadVertexArray()',
    () => rl.Rlgl.rlLoadVertexArray(),
  );

  int rlLoadVertexBuffer(
    TypedData buffer,
    bool dynamic,
  ) => run(
    () => 'rlLoadVertexBuffer(${buffer.lengthInBytes}, $dynamic)',
    () {
      final bytes = buffer.buffer.asUint8List(buffer.offsetInBytes, buffer.lengthInBytes);
      return rl.Rlgl.rlLoadVertexBuffer(
        refListUInt8(bytes).cast(),
        bytes.length,
        dynamic,
      );
    },
  );

  int rlLoadVertexBufferElement(
    TypedData buffer,
    bool dynamic,
  ) => run(
    () => 'rlLoadVertexBufferElement(${buffer.lengthInBytes}, $dynamic)',
    () {
      final bytes = buffer.buffer.asUint8List(buffer.offsetInBytes, buffer.lengthInBytes);
      return rl.Rlgl.rlLoadVertexBufferElement(
        refListUInt8(bytes).cast(),
        bytes.length,
        dynamic,
      );
    },
  );

  void rlUpdateVertexBuffer(
    num bufferId,
    TypedData data,
    num offset,
  ) => run(
    () => 'rlUpdateVertexBuffer($bufferId, ${data.lengthInBytes}, $offset)',
    () {
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      return rl.Rlgl.rlUpdateVertexBuffer(
        bufferId.toInt(),
        refListUInt8(bytes).cast(),
        bytes.length,
        offset.toInt(),
      );
    },
  );

  void rlUpdateVertexBufferElements(
    num id,
    TypedData data,
    num offset,
  ) => run(
    () => 'rlLoadVertexBufferElement($id, ${data.lengthInBytes}, $offset)',
    () {
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      return rl.Rlgl.rlUpdateVertexBufferElements(
        id.toInt(),
        refListUInt8(bytes).cast(),
        bytes.length,
        offset.toInt(),
      );
    },
  );

  void rlUnloadVertexArray(
    num vaoId,
  ) => run(
    () => 'rlUnloadVertexArray($vaoId)',
    () => rl.Rlgl.rlUnloadVertexArray(vaoId.toInt()),
  );

  void rlUnloadVertexBuffer(
    num vboId,
  ) => run(
    () => 'rlUnloadVertexBuffer($vboId)',
    () => rl.Rlgl.rlUnloadVertexBuffer(vboId.toInt()),
  );

  void rlSetVertexAttribute(
    num index,
    num compSize,
    num type,
    bool normalized,
    num stride,
    num offset,
  ) => run(
    () => 'rlSetVertexAttribute($index, $compSize, $type, $normalized, $stride, $offset)',
    () => rl.Rlgl.rlSetVertexAttribute(
      index.toInt(),
      compSize.toInt(),
      type.toInt(),
      normalized,
      stride.toInt(),
      offset.toInt(),
    ),
  );

  void rlSetVertexAttributeDivisor(
    num index,
    num divisor,
  ) => run(
    () => 'rlSetVertexAttributeDivisor($index, $divisor)',
    () => rl.Rlgl.rlSetVertexAttributeDivisor(
      index.toInt(),
      divisor.toInt(),
    ),
  );

  void rlSetVertexAttributeDefault(
    num locIndex,
    Float32List value,
    RlShaderAttributeDataType attribType,
  ) => run(
    () => 'rlSetVertexAttributeDefault($locIndex, ${value.length}, ${attribType.name})',
    () => rl.Rlgl.rlSetVertexAttributeDefault(
      locIndex.toInt(),
      refTypedListFloat(value).cast(),
      attribType.value,
      value.length,
    ),
  );

  void rlDrawVertexArray(
    num offset,
    num count,
  ) => run(
    () => 'rlDrawVertexArray($offset, $count)',
    () => rl.Rlgl.rlDrawVertexArray(
      offset.toInt(),
      count.toInt(),
    ),
  );

  void rlDrawVertexArrayElements(
    num offset,
    num count,
    Uint16List buffer,
  ) => run(
    () => 'rlDrawVertexArrayElements($offset, ${buffer.length})',
    () => rl.Rlgl.rlDrawVertexArrayElements(
      offset.toInt(),
      count.toInt(),
      refTypedListUInt16(buffer).cast(),
    ),
  );

  void rlDrawVertexArrayInstanced(
    num offset,
    num count,
    num instances,
  ) => run(
    () => 'rlDrawVertexArrayInstanced($offset, $count, $instances)',
    () => rl.Rlgl.rlDrawVertexArrayInstanced(
      offset.toInt(),
      count.toInt(),
      instances.toInt(),
    ),
  );

  void rlDrawVertexArrayElementsInstanced(
    num offset,
    num count,
    Uint16List buffer,
    num instances,
  ) => run(
    () => 'rlDrawVertexArrayElementsInstanced($offset, $count, ${buffer.length}, $instances)',
    () => rl.Rlgl.rlDrawVertexArrayElementsInstanced(
      offset.toInt(),
      count.toInt(),
      refTypedListUInt16(buffer).cast(),
      instances.toInt(),
    ),
  );

  int rlLoadTexture(
    Uint8List? data,
    num width,
    num height,
    RlPixelFormat format,
    num mipmapCount,
  ) => run(
    () => 'rlLoadTexture(${data?.length}, $width, $height, $format, $mipmapCount)',
    () => rl.Rlgl.rlLoadTexture(
      data == null ? nullptr : refTypedListUInt8(data).cast(),
      width.toInt(),
      height.toInt(),
      format.value,
      mipmapCount.toInt(),
    ),
  );

  int rlLoadTextureDepth(
    num width,
    num height,
    bool useRenderBuffer,
  ) => run(
    () => 'rlLoadTextureDepth($width, $height, $useRenderBuffer)',
    () => rl.Rlgl.rlLoadTextureDepth(
      width.toInt(),
      height.toInt(),
      useRenderBuffer,
    ),
  );

  int rlLoadTextureCubemap(
    Uint8List? data,
    num size,
    RlPixelFormat format,
    num mipmapCount,
  ) => run(
    () => 'rlLoadTextureCubemap(${data?.length}, $size, ${format.name}, $mipmapCount)',
    () => rl.Rlgl.rlLoadTextureCubemap(
      data == null ? nullptr : refTypedListUInt8(data).cast(),
      size.toInt(),
      format.value,
      mipmapCount.toInt(),
    ),
  );

  void rlUpdateTexture(
    num id,
    num offsetX,
    num offsetY,
    num width,
    num height,
    RlPixelFormat format,
    Uint8List data,
  ) => run(
    () => 'rlUpdateTexture($id, $offsetX, $offsetY, $width, $height, ${format.name}, ${data.length})',
    () => rl.Rlgl.rlUpdateTexture(
      id.toInt(),
      offsetX.toInt(),
      offsetY.toInt(),
      width.toInt(),
      height.toInt(),
      format.value,
      refTypedListUInt8(data).cast(),
    ),
  );

  (int glInternalFormat, int glFormat, int glType) rlGetGlTextureFormats(
    RlPixelFormat format,
  ) => run(
    () => 'rlGetGlTextureFormats(${format.name})',
    () {
      final glInternalFormat = refUInt1();
      final glFormat = refUInt2();
      final glType = refUInt3();
      rl.Rlgl.rlGetGlTextureFormats(
        format.value,
        glInternalFormat,
        glFormat,
        glType,
      );
      return (glInternalFormat.value, glFormat.value, glType.value);
    },
  );

  String rlGetPixelFormatName(
    RlPixelFormat format,
  ) => run(
    () => 'rlGetPixelFormatName(${format.name})',
    () => rl.Rlgl.rlGetPixelFormatName(
      format.value,
    ).toD,
  );

  void rlUnloadTexture(
    num id,
  ) => run(
    () => 'rlUnloadTexture($id)',
    () => rl.Rlgl.rlUnloadTexture(id.toInt()),
  );

  int rlGenTextureMipmaps(
    num id,
    num width,
    num height,
    RlPixelFormat format,
  ) => run(
    () => 'rlGenTextureMipmaps($id, $width, $height, ${format.name})',
    () {
      final mipmaps = refInt1();
      rl.Rlgl.rlGenTextureMipmaps(
        id.toInt(),
        width.toInt(),
        height.toInt(),
        format.value,
        mipmaps,
      );
      return mipmaps.value;
    },
  );

  Uint8List rlReadTexturePixels(
    num id,
    num width,
    num height,
    RlPixelFormat format,
  ) => run(
    () => 'rlReadTexturePixels($id, $width, $height, ${format.name})',
    () {
      final size = rlGetPixelDataSize(
        width.toInt(),
        height.toInt(),
        format,
      );
      final pixels = rl.Rlgl.rlReadTexturePixels(
        id.toInt(),
        width.toInt(),
        height.toInt(),
        format.value,
      );
      return pixels.cast<Uint8>().asTypedList(size);
    },
  );

  @DoNotValidate()
  int rlGetPixelDataSize(int width, int height, RlPixelFormat format)
  {
    int sizeInBytes = 0;
    int bpp = 0;

    switch (format)
    {
      case .RL_PIXELFORMAT_UNCOMPRESSED_GRAYSCALE: bpp = 8; break;
      case .RL_PIXELFORMAT_UNCOMPRESSED_GRAY_ALPHA:
      case .RL_PIXELFORMAT_UNCOMPRESSED_R5G6B5:
      case .RL_PIXELFORMAT_UNCOMPRESSED_R5G5B5A1:
      case .RL_PIXELFORMAT_UNCOMPRESSED_R4G4B4A4: bpp = 16; break;
      case .RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8A8: bpp = 32; break;
      case .RL_PIXELFORMAT_UNCOMPRESSED_R8G8B8: bpp = 24; break;
      case .RL_PIXELFORMAT_UNCOMPRESSED_R32: bpp = 32; break;
      case .RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32: bpp = 32*3; break;
      case .RL_PIXELFORMAT_UNCOMPRESSED_R32G32B32A32: bpp = 32*4; break;
      case .RL_PIXELFORMAT_UNCOMPRESSED_R16: bpp = 16; break;
      case .RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16: bpp = 16*3; break;
      case .RL_PIXELFORMAT_UNCOMPRESSED_R16G16B16A16: bpp = 16*4; break;
      case .RL_PIXELFORMAT_COMPRESSED_DXT1_RGB:
      case .RL_PIXELFORMAT_COMPRESSED_DXT1_RGBA:
      case .RL_PIXELFORMAT_COMPRESSED_ETC1_RGB:
      case .RL_PIXELFORMAT_COMPRESSED_ETC2_RGB:
      case .RL_PIXELFORMAT_COMPRESSED_PVRT_RGB:
      case .RL_PIXELFORMAT_COMPRESSED_PVRT_RGBA: bpp = 4; break;
      case .RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA:
      case .RL_PIXELFORMAT_COMPRESSED_DXT5_RGBA:
      case .RL_PIXELFORMAT_COMPRESSED_ETC2_EAC_RGBA:
      case .RL_PIXELFORMAT_COMPRESSED_ASTC_4x4_RGBA: bpp = 8; break;
      case .RL_PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA: bpp = 2; break;
    }

    num bytesPerPixel = bpp/8.0;
    sizeInBytes = (bytesPerPixel*width*height).toInt();

    if ((width < 4) && (height < 4))
    {
      if (
        format.gte(RlPixelFormat.RL_PIXELFORMAT_COMPRESSED_DXT1_RGB) &&
        format.lt(RlPixelFormat.RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA)
      ) sizeInBytes = 8;
      else if (
        format.gte(RlPixelFormat.RL_PIXELFORMAT_COMPRESSED_DXT3_RGBA) &&
        format.lt(RlPixelFormat.RL_PIXELFORMAT_COMPRESSED_ASTC_8x8_RGBA)
      ) sizeInBytes = 16;
    }

    return sizeInBytes;
  }

  List<int> rlReadScreenPixels(
    num width,
    num height,
  ) => run(
    () => 'rlReadScreenPixels($width, $height)',
    () {
      final values = rl.Rlgl.rlReadScreenPixels(
        width.toInt(),
        height.toInt(),
      );
      final pixels = List.generate(width.toInt()*height.toInt()*4, (i) => values[i]);
      calloc.free(values);
      return pixels;
    },
  );

  int rlLoadFramebuffer() => run(
    () => 'rlLoadFramebuffer()',
    () => rl.Rlgl.rlLoadFramebuffer(),
  );

  void rlFramebufferAttach(
    num fboId,
    num texId,
    RlFramebufferAttachType attachType,
    RlFramebufferAttachTextureType texType,
    num mipLevel,
  ) => run(
    () => 'rlFramebufferAttach($fboId, $texId, ${attachType.name}, ${texType.name}, $mipLevel)',
    () => rl.Rlgl.rlFramebufferAttach(
      fboId.toInt(),
      texId.toInt(),
      attachType.value,
      texType.value,
      mipLevel.toInt(),
    ),
  );

  bool rlFramebufferComplete(
    num id,
  ) => run(
    () => 'rlFramebufferComplete($id)',
    () => rl.Rlgl.rlFramebufferComplete(id.toInt()),
  );

  void rlUnloadFramebuffer(
    num id,
  ) => run(
    () => 'rlUnloadFramebuffer($id)',
    () => rl.Rlgl.rlUnloadFramebuffer(id.toInt()),
  );

  int rlLoadShaderCode(
    String? vsCode,
    String? fsCode,
  ) => run(
    () => 'rlLoadShaderCode(vsCode: ${vsCode?.length}, fsCode: ${fsCode?.length})',
    () => rl.Rlgl.rlLoadShaderCode(
      refStr(vsCode),
      refStr(fsCode),
    ),
  );

  int rlCompileShader(
    String shaderCode,
    RlShaderType type,
  ) => run(
    () => 'rlCompileShader(shaderCode: ${shaderCode.length}, ${type.name})',
    () => rl.Rlgl.rlCompileShader(
      refStr(shaderCode),
      type.value,
    ),
  );

  int rlLoadShaderProgram(
    num vShaderId,
    num fShaderId,
  ) => run(
    () => 'rlLoadShaderProgram($vShaderId, $fShaderId)',
    () => rl.Rlgl.rlLoadShaderProgram(
      vShaderId.toInt(),
      fShaderId.toInt(),
    ),
  );

  void rlUnloadShaderProgram(
    num id,
  ) => run(
    () => 'rlUnloadShaderProgram($id)',
    () => rl.Rlgl.rlUnloadShaderProgram(id.toInt()),
  );

  int rlGetLocationUniform(
    num shaderId,
    String uniformName,
  ) => run(
    () => 'rlGetLocationUniform($shaderId, $uniformName)',
    () => rl.Rlgl.rlGetLocationUniform(
      shaderId.toInt(),
      refStr(uniformName),
    ),
  );

  int rlGetLocationAttrib(
    num shaderId,
    String attribName,
  ) => run(
    () => 'rlGetLocationAttrib($shaderId, $attribName)',
    () => rl.Rlgl.rlGetLocationAttrib(
      shaderId.toInt(),
      refStr(attribName),
    ),
  );

  void rlSetUniform(
    num locIndex,
    TypedData value,
    RlShaderUniformDataType uniformType,
    num count,
  ) => run(
    () => 'rlSetUniform($locIndex, ${value.lengthInBytes}, ${uniformType.name})',
    () {
      final Pointer<Void> ptr;
      switch (uniformType) {
        case .RL_SHADER_UNIFORM_FLOAT:
        case .RL_SHADER_UNIFORM_VEC2:
        case .RL_SHADER_UNIFORM_VEC3:
        case .RL_SHADER_UNIFORM_VEC4:
          ptr = refTypedListFloat(value as Float32List).cast();
        case .RL_SHADER_UNIFORM_INT:
        case .RL_SHADER_UNIFORM_IVEC2:
        case .RL_SHADER_UNIFORM_IVEC3:
        case .RL_SHADER_UNIFORM_IVEC4:
        case .RL_SHADER_UNIFORM_SAMPLER2D:
          ptr = refTypedListInt32(value as Int32List).cast();
        case .RL_SHADER_UNIFORM_UINT:
        case .RL_SHADER_UNIFORM_UIVEC2:
        case .RL_SHADER_UNIFORM_UIVEC3:
        case .RL_SHADER_UNIFORM_UIVEC4:
          ptr = refTypedListUInt32(value as Uint32List).cast();
      }
      rl.Rlgl.rlSetUniform(
        locIndex.toInt(),
        ptr,
        uniformType.value,
        count.toInt(),
      );
    },
  );

  void rlSetUniformMatrix(
    num locIndex,
    MatrixD mat,
  ) => run(
    () => 'rlSetUniformMatrix($locIndex, $mat)',
    () => rl.Rlgl.rlSetUniformMatrix(
      locIndex.toInt(),
      _refMatrix1(mat).ref,
    ),
  );

  void rlSetUniformMatrices(
    num locIndex,
    List<MatrixD> mat,
  ) => run(
    () => 'rlSetUniformMatrices($locIndex, mat: ${mat.length})',
    () => rl.Rlgl.rlSetUniformMatrices(
      locIndex.toInt(),
      rl.Temp.Matrix$.Array(mat),
      mat.length,
    ),
  );

  void rlSetUniformSampler(
    num locIndex,
    num textureId,
  ) => run(
    () => 'rlSetUniformSampler($locIndex, $textureId)',
    () => rl.Rlgl.rlSetUniformSampler(
      locIndex.toInt(),
      textureId.toInt(),
    ),
  );

  void rlSetShader(
    num id,
    List<int> locs,
  ) => run(
    () => 'rlSetShader($id, $locs)',
    () => rl.Rlgl.rlSetShader(
      id.toInt(),
      refListInt(locs),
    ),
  );

  int rlLoadComputeShaderProgram(
    num shaderId,
  ) => run(
    () => 'rlLoadComputeShaderProgram($shaderId)',
    () => rl.Rlgl.rlLoadComputeShaderProgram(shaderId.toInt()),
  );

  void rlComputeShaderDispatch(
    num groupX,
    num groupY,
    num groupZ,
  ) => run(
    () => 'rlComputeShaderDispatch($groupX, $groupY, $groupZ)',
    () => rl.Rlgl.rlComputeShaderDispatch(
      groupX.toInt(),
      groupY.toInt(),
      groupZ.toInt(),
    ),
  );

  int rlLoadShaderBuffer(
    num size,
    TypedData? data,
    RlUsageHint? usageHint,
  ) => run(
    () => 'rlLoadShaderBuffer($size, data: ${data?.lengthInBytes}, $usageHint)',
    () => rl.Rlgl.rlLoadShaderBuffer(
      size.toInt(),
      data == null ? nullptr : refTypedDataUInt8(data).cast(),
      usageHint?.value ?? 0,
    ),
  );

  void rlUnloadShaderBuffer(
    num ssboId,
  ) => run(
    () => 'rlUnloadShaderBuffer($ssboId)',
    () => rl.Rlgl.rlUnloadShaderBuffer(ssboId.toInt()),
  );

  void rlUpdateShaderBuffer(
    num id,
    TypedData data,
    num offset,
  ) => run(
    () => 'rlUpdateShaderBuffer($id, data: ${data.lengthInBytes}, $offset)',
    () {
      final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      rl.Rlgl.rlUpdateShaderBuffer(
        id.toInt(),
        refListUInt8(bytes).cast(),
        bytes.length,
        offset.toInt(),
      );
    },
  );

  void rlBindShaderBuffer(
    num id,
    num index,
  ) => run(
    () => 'rlBindShaderBuffer($id, $index)',
    () => rl.Rlgl.rlBindShaderBuffer(
      id.toInt(),
      index.toInt(),
    ),
  );

  Uint8List rlReadShaderBuffer(
    num id,
    num count,
    num offset,
  ) => run(
    () => 'rlReadShaderBuffer($id, $count, $offset)',
    () {
      final values = refSizedUInt8(count.toInt());
      rl.Rlgl.rlReadShaderBuffer(
        id.toInt(),
        values.cast(),
        count.toInt(),
        offset.toInt(),
      );
      return .fromList(values.asTypedList(count.toInt()));
    },
  );

  void rlCopyShaderBuffer(
    num destId,
    num srcId,
    num destOffset,
    num srcOffset,
    num count,
  ) => run(
    () => 'rlCopyShaderBuffer($destId, $srcId, $destOffset, $srcOffset, $count)',
    () => rl.Rlgl.rlCopyShaderBuffer(
      destId.toInt(),
      srcId.toInt(),
      destOffset.toInt(),
      srcOffset.toInt(),
      count.toInt(),
    ),
  );

  int rlGetShaderBufferSize(
    num id,
  ) => run(
    () => 'rlGetShaderBufferSize($id)',
    () => rl.Rlgl.rlGetShaderBufferSize(id.toInt()),
  );

  void rlBindImageTexture(
    num id,
    num index,
    RlPixelFormat format,
    bool readonly,
  ) => run(
    () => 'rlBindImageTexture($id, $index, ${format.name}, $readonly)',
    () => rl.Rlgl.rlBindImageTexture(
      id.toInt(),
      index.toInt(),
      format.value,
      readonly,
    ),
  );

  MatrixD rlGetMatrixModelview() => run(
    () => 'rlGetMatrixModelview()',
    () => rl.Rlgl.rlGetMatrixModelview().toD(),
  );

  MatrixD rlGetMatrixProjection() => run(
    () => 'rlGetMatrixProjection()',
    () => rl.Rlgl.rlGetMatrixProjection().toD(),
  );

  MatrixD rlGetMatrixTransform() => run(
    () => 'rlGetMatrixTransform()',
    () => rl.Rlgl.rlGetMatrixTransform().toD(),
  );

  MatrixD rlGetMatrixProjectionStereo(
    num eye,
  ) => run(
    () => 'rlGetMatrixProjectionStereo($eye)',
    () => rl.Rlgl.rlGetMatrixProjectionStereo(eye.toInt()).toD(),
  );

  MatrixD rlGetMatrixViewOffsetStereo(
    num eye,
  ) => run(
    () => 'rlGetMatrixViewOffsetStereo($eye)',
    () => rl.Rlgl.rlGetMatrixViewOffsetStereo(eye.toInt()).toD(),
  );

  void rlSetMatrixProjection(
    MatrixD proj,
  ) => run(
    () => 'rlSetMatrixProjection($proj)',
    () => rl.Rlgl.rlSetMatrixProjection(
      _refMatrix1(proj).ref,
    ),
  );

  void rlSetMatrixModelview(
    MatrixD view,
  ) => run(
    () => 'rlSetMatrixModelview($view)',
    () => rl.Rlgl.rlSetMatrixModelview(
      _refMatrix1(view).ref,
    ),
  );

  void rlSetMatrixProjectionStereo(
    MatrixD right,
    MatrixD left,
  ) => run(
    () => 'rlSetMatrixProjectionStereo($right, $left)',
    () => rl.Rlgl.rlSetMatrixProjectionStereo(
      _refMatrix1(right).ref,
      _refMatrix2(left).ref,
    ),
  );

  void rlSetMatrixViewOffsetStereo(
    MatrixD right,
    MatrixD left,
  ) => run(
    () => 'rlSetMatrixViewOffsetStereo($right, $left)',
    () => rl.Rlgl.rlSetMatrixViewOffsetStereo(
      _refMatrix1(right).ref,
      _refMatrix2(left).ref,
    ),
  );

  void rlLoadDrawCube() => run(
    () => 'rlLoadDrawCube()',
    () => rl.Rlgl.rlLoadDrawCube(),
  );

  void rlLoadDrawQuad() => run(
    () => 'rlLoadDrawQuad()',
    () => rl.Rlgl.rlLoadDrawQuad(),
  );
}
