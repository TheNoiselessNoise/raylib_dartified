part of '../../../raylib.dart';

class RaylibRlglD extends RaylibModule with RaylibRlglModuleExtras implements RaylibRlglModuleBase<
  // types
  MatrixD,
  RlRenderBatchD
  
> {
  
  RaylibRlglD(super.rl);

  @override
  void rlMatrixMode(
    RlMatrixMode mode,
  ) => run(
    () => 'rlMatrixMode(${mode.name})',
    () => rl.Rlgl.rlMatrixMode(mode.value),
  );

  @override
  void rlPushMatrix() => run(
    () => 'rlPushMatrix()',
    () => rl.Rlgl.rlPushMatrix(),
  );

  @override
  void rlPopMatrix() => run(
    () => 'rlPopMatrix()',
    () => rl.Rlgl.rlPopMatrix(),
  );

  @override
  void rlLoadIdentity() => run(
    () => 'rlLoadIdentity()',
    () => rl.Rlgl.rlLoadIdentity(),
  );

  @override
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

  @override
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

  @override
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

  @override
  void rlMultMatrixf(
    List<double> matf,
  ) => run(
    () => 'rlMultMatrixf($matf)',
    () => rl.Rlgl.rlMultMatrixf(
      rl.Temp.Float$.Array(matf),
    ),
  );

  @override
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

  @override
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

  @override
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

  @override
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

  @override
  double rlGetCullDistanceNear() => run(
    () => 'rlGetCullDistanceNear()',
    () => rl.Rlgl.rlGetCullDistanceNear(),
  );

  @override
  double rlGetCullDistanceFar() => run(
    () => 'rlGetCullDistanceFar()',
    () => rl.Rlgl.rlGetCullDistanceFar(),
  );

  @override
  void rlBegin(
    RlDrawMode mode,
  ) => run(
    () => 'rlBegin(${mode.name})',
    () => rl.Rlgl.rlBegin(mode.value),
  );

  @override
  void rlEnd() => run(
    () => 'rlEnd()',
    () => rl.Rlgl.rlEnd(),
  );

  @override
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

  @override
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

  @override
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

  @override
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

  @override
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

  @override
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

  @override
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

  @override
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

  @override
  bool rlEnableVertexArray(
    num vaoId,
  ) => run(
    () => 'rlEnableVertexArray($vaoId)',
    () => rl.Rlgl.rlEnableVertexArray(vaoId.toInt()),
  );

  @override
  void rlDisableVertexArray() => run(
    () => 'rlDisableVertexArray()',
    () => rl.Rlgl.rlDisableVertexArray(),
  );

  @override
  void rlEnableVertexBuffer(
    num id,
  ) => run(
    () => 'rlEnableVertexBuffer($id)',
    () => rl.Rlgl.rlEnableVertexBuffer(id.toInt()),
  );

  @override
  void rlDisableVertexBuffer() => run(
    () => 'rlDisableVertexBuffer()',
    () => rl.Rlgl.rlDisableVertexBuffer(),
  );

  @override
  void rlEnableVertexBufferElement(
    num id,
  ) => run(
    () => 'rlEnableVertexBufferElement($id)',
    () => rl.Rlgl.rlEnableVertexBufferElement(id.toInt()),
  );

  @override
  void rlDisableVertexBufferElement() => run(
    () => 'rlDisableVertexBufferElement()',
    () => rl.Rlgl.rlDisableVertexBufferElement(),
  );

  @override
  void rlEnableVertexAttribute(
    num index,
  ) => run(
    () => 'rlEnableVertexAttribute($index)',
    () => rl.Rlgl.rlEnableVertexAttribute(index.toInt()),
  );

  @override
  void rlDisableVertexAttribute(
    num index,
  ) => run(
    () => 'rlDisableVertexAttribute($index)',
    () => rl.Rlgl.rlDisableVertexAttribute(index.toInt()),
  );

  @override
  void rlActiveTextureSlot(
    num slot,
  ) => run(
    () => 'rlActiveTextureSlot($slot)',
    () => rl.Rlgl.rlActiveTextureSlot(slot.toInt()),
  );

  @override
  void rlEnableTexture(
    num id,
  ) => run(
    () => 'rlEnableTexture($id)',
    () => rl.Rlgl.rlEnableTexture(id.toInt()),
  );

  @override
  void rlDisableTexture() => run(
    () => 'rlDisableTexture()',
    () => rl.Rlgl.rlDisableTexture(),
  );

  @override
  void rlEnableTextureCubemap(
    num id,
  ) => run(
    () => 'rlEnableTextureCubemap($id)',
    () => rl.Rlgl.rlEnableTextureCubemap(id.toInt()),
  );

  @override
  void rlDisableTextureCubemap() => run(
    () => 'rlDisableTextureCubemap()',
    () => rl.Rlgl.rlDisableTextureCubemap(),
  );

  @override
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

  @override
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

  @override
  void rlEnableShader(
    num id,
  ) => run(
    () => 'rlEnableShader($id)',
    () => rl.Rlgl.rlEnableShader(id.toInt()),
  );

  @override
  void rlDisableShader() => run(
    () => 'rlDisableShader()',
    () => rl.Rlgl.rlDisableShader(),
  );

  @override
  void rlEnableFramebuffer(
    num id,
  ) => run(
    () => 'rlEnableFramebuffer($id)',
    () => rl.Rlgl.rlEnableFramebuffer(id.toInt()),
  );

  @override
  void rlDisableFramebuffer() => run(
    () => 'rlDisableFramebuffer()',
    () => rl.Rlgl.rlDisableFramebuffer(),
  );

  @override
  int rlGetActiveFramebuffer() => run(
    () => 'rlGetActiveFramebuffer()',
    () => rl.Rlgl.rlGetActiveFramebuffer(),
  );

  @override
  void rlActiveDrawBuffers(
    num count,
  ) => run(
    () => 'rlActiveDrawBuffers($count)',
    () => rl.Rlgl.rlActiveDrawBuffers(count.toInt()),
  );

  @override
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

  @override
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

  @override
  void rlEnableColorBlend() => run(
    () => 'rlEnableColorBlend()',
    () => rl.Rlgl.rlEnableColorBlend(),
  );

  @override
  void rlDisableColorBlend() => run(
    () => 'rlDisableColorBlend()',
    () => rl.Rlgl.rlDisableColorBlend(),
  );

  @override
  void rlEnableDepthTest() => run(
    () => 'rlEnableDepthTest()',
    () => rl.Rlgl.rlEnableDepthTest(),
  );

  @override
  void rlDisableDepthTest() => run(
    () => 'rlDisableDepthTest()',
    () => rl.Rlgl.rlDisableDepthTest(),
  );

  @override
  void rlEnableDepthMask() => run(
    () => 'rlEnableDepthMask()',
    () => rl.Rlgl.rlEnableDepthMask(),
  );

  @override
  void rlDisableDepthMask() => run(
    () => 'rlDisableDepthMask()',
    () => rl.Rlgl.rlDisableDepthMask(),
  );

  @override
  void rlEnableBackfaceCulling() => run(
    () => 'rlEnableBackfaceCulling()',
    () => rl.Rlgl.rlEnableBackfaceCulling(),
  );

  @override
  void rlDisableBackfaceCulling() => run(
    () => 'rlDisableBackfaceCulling()',
    () => rl.Rlgl.rlDisableBackfaceCulling(),
  );

  @override
  void rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => run(
    () => 'rlColorMask($r, $g, $b, $a)',
    () => rl.Rlgl.rlColorMask(r, g, b, a),
  );

  @override
  void rlSetCullFace(
    RlCullMode mode,
  ) => run(
    () => 'rlSetCullFace(${mode.name})',
    () => rl.Rlgl.rlSetCullFace(mode.value),
  );

  @override
  void rlEnableScissorTest() => run(
    () => 'rlEnableScissorTest()',
    () => rl.Rlgl.rlEnableScissorTest(),
  );

  @override
  void rlDisableScissorTest() => run(
    () => 'rlDisableScissorTest()',
    () => rl.Rlgl.rlDisableScissorTest(),
  );

  @override
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

  @override
  void rlEnableWireMode() => run(
    () => 'rlEnableWireMode()',
    () => rl.Rlgl.rlEnableWireMode(),
  );

  @override
  void rlEnablePointMode() => run(
    () => 'rlEnablePointMode()',
    () => rl.Rlgl.rlEnablePointMode(),
  );

  @override
  void rlDisableWireMode() => run(
    () => 'rlDisableWireMode()',
    () => rl.Rlgl.rlDisableWireMode(),
  );

  @override
  void rlSetLineWidth(
    num width,
  ) => run(
    () => 'rlSetLineWidth($width)',
    () => rl.Rlgl.rlSetLineWidth(width.toDouble()),
  );

  @override
  double rlGetLineWidth() => run(
    () => 'rlGetLineWidth()',
    () => rl.Rlgl.rlGetLineWidth(),
  );

  @override
  void rlEnableSmoothLines() => run(
    () => 'rlEnableSmoothLines()',
    () => rl.Rlgl.rlEnableSmoothLines(),
  );

  @override
  void rlDisableSmoothLines() => run(
    () => 'rlDisableSmoothLines()',
    () => rl.Rlgl.rlDisableSmoothLines(),
  );

  @override
  void rlEnableStereoRender() => run(
    () => 'rlEnableStereoRender()',
    () => rl.Rlgl.rlEnableStereoRender(),
  );

  @override
  void rlDisableStereoRender() => run(
    () => 'rlDisableStereoRender()',
    () => rl.Rlgl.rlDisableStereoRender(),
  );

  @override
  bool rlIsStereoRenderEnabled() => run(
    () => 'rlIsStereoRenderEnabled()',
    () => rl.Rlgl.rlIsStereoRenderEnabled(),
  );

  @override
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

  @override
  void rlClearScreenBuffers() => run(
    () => 'rlClearScreenBuffers()',
    () => rl.Rlgl.rlClearScreenBuffers(),
  );

  @override
  void rlCheckErrors() => run(
    () => 'rlCheckErrors()',
    () => rl.Rlgl.rlCheckErrors(),
  );

  @override
  void rlSetBlendMode(
    BlendMode mode,
  ) => run(
    () => 'rlSetBlendMode(${mode.name})',
    () => rl.Rlgl.rlSetBlendMode(mode.value),
  );

  @override
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

  @override
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

  @override
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

  @override
  void rlglClose() => run(
    () => 'rlglClose()',
    () => rl.Rlgl.rlglClose(),
  );

  // NOTE: rlLoadExtensions is not implemented, use it in raw FFI layer if you really need it

  @override
  int rlGetVersion() => run(
    () => 'rlGetVersion()',
    () => rl.Rlgl.rlGetVersion(),
  );

  @override
  void rlSetFramebufferWidth(
    num width,
  ) => run(
    () => 'rlSetFramebufferWidth($width)',
    () => rl.Rlgl.rlSetFramebufferWidth(width.toInt()),
  );

  @override
  int rlGetFramebufferWidth() => run(
    () => 'rlGetFramebufferWidth()',
    () => rl.Rlgl.rlGetFramebufferWidth(),
  );

  @override
  void rlSetFramebufferHeight(
    num height,
  ) => run(
    () => 'rlSetFramebufferHeight($height)',
    () => rl.Rlgl.rlSetFramebufferHeight(height.toInt()),
  );

  @override
  int rlGetFramebufferHeight() => run(
    () => 'rlGetFramebufferHeight()',
    () => rl.Rlgl.rlGetFramebufferHeight(),
  );

  @override
  int rlGetTextureIdDefault() => run(
    () => 'rlGetTextureIdDefault()',
    () => rl.Rlgl.rlGetTextureIdDefault(),
  );

  @override
  int rlGetShaderIdDefault() => run(
    () => 'rlGetShaderIdDefault()',
    () => rl.Rlgl.rlGetShaderIdDefault(),
  );

  @override
  List<int> rlGetShaderLocsDefault() => run(
    () => 'rlGetShaderLocsDefault()',
    () {
      final locs = rl.Rlgl.rlGetShaderLocsDefault();
      return .generate(RL_MAX_SHADER_LOCATIONS, (i) => locs[i]);
    },
  );

  @override
  RlRenderBatchD rlLoadRenderBatch(
    num numBuffers,
    num bufferElements,
  ) => run(
    () => 'rlLoadRenderBatch($numBuffers, $bufferElements)',
    () => rl.Temp.RlRenderBatch$.RefCapture(
      'rlLoadRenderBatch_${numBuffers}_$bufferElements',
      rl.Rlgl.rlLoadRenderBatch(
        numBuffers.toInt(),
        bufferElements.toInt(),
      ),
    ),
  );

  @override
  void rlUnloadRenderBatch(
    RlRenderBatchD batch,
  ) => run(
    () => 'rlUnloadRenderBatch($batch)',
    () => rl.Rlgl.rlUnloadRenderBatch(
      rl.Temp.RlRenderBatch$.Ref1(batch).ref,
    ),
  );

  @override
  void rlDrawRenderBatch(
    RlRenderBatchD batch,
  ) => run(
    () => 'rlDrawRenderBatch($batch)',
    () => rl.Temp.RlRenderBatch$.RefUpdate1(batch,
      (pb) => rl.Rlgl.rlDrawRenderBatch(pb),
    ),
  );

  @override
  void rlSetRenderBatchActive(
    RlRenderBatchD batch,
  ) => run(
    () => 'rlSetRenderBatchActive($batch)',
    () => rl.Temp.RlRenderBatch$.RefUpdate1(batch,
      (pb) => rl.Rlgl.rlSetRenderBatchActive(pb),
    ),
  );

  @override
  void rlDrawRenderBatchActive() => run(
    () => 'rlDrawRenderBatchActive()',
    () => rl.Rlgl.rlDrawRenderBatchActive(),
  );

  @override
  bool rlCheckRenderBatchLimit(
    num vCount,
  ) => run(
    () => 'rlCheckRenderBatchLimit($vCount)',
    () => rl.Rlgl.rlCheckRenderBatchLimit(vCount.toInt()),
  );

  @override
  void rlSetTexture(
    num id,
  ) => run(
    () => 'rlSetTexture($id)',
    () => rl.Rlgl.rlSetTexture(id.toInt()),
  );

  @override
  int rlLoadVertexArray() => run(
    () => 'rlLoadVertexArray()',
    () => rl.Rlgl.rlLoadVertexArray(),
  );

  @override
  int rlLoadVertexBuffer(
    TypedData buffer,
    bool dynamic,
  ) => run(
    () => 'rlLoadVertexBuffer(${buffer.lengthInBytes}, $dynamic)',
    () {
      final bytes = buffer.buffer.asUint8List(buffer.offsetInBytes, buffer.lengthInBytes);
      return rl.Rlgl.rlLoadVertexBuffer(
        rl.Temp.Uint8$.Array(bytes).cast(),
        bytes.length,
        dynamic,
      );
    },
  );

  @override
  int rlLoadVertexBufferElement(
    TypedData buffer,
    bool dynamic,
  ) => run(
    () => 'rlLoadVertexBufferElement(${buffer.lengthInBytes}, $dynamic)',
    () {
      final bytes = buffer.buffer.asUint8List(buffer.offsetInBytes, buffer.lengthInBytes);
      return rl.Rlgl.rlLoadVertexBufferElement(
        rl.Temp.Uint8$.Array(bytes).cast(),
        bytes.length,
        dynamic,
      );
    },
  );

  @override
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
        rl.Temp.Uint8$.Array(bytes).cast(),
        bytes.length,
        offset.toInt(),
      );
    },
  );

  @override
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
        rl.Temp.Uint8$.Array(bytes).cast(),
        bytes.length,
        offset.toInt(),
      );
    },
  );

  @override
  void rlUnloadVertexArray(
    num vaoId,
  ) => run(
    () => 'rlUnloadVertexArray($vaoId)',
    () => rl.Rlgl.rlUnloadVertexArray(vaoId.toInt()),
  );

  @override
  void rlUnloadVertexBuffer(
    num vboId,
  ) => run(
    () => 'rlUnloadVertexBuffer($vboId)',
    () => rl.Rlgl.rlUnloadVertexBuffer(vboId.toInt()),
  );

  @override
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

  @override
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

  @override
  void rlSetVertexAttributeDefault(
    num locIndex,
    Float32List value,
    RlShaderAttributeDataType attribType,
  ) => run(
    () => 'rlSetVertexAttributeDefault($locIndex, ${value.length}, ${attribType.name})',
    () => rl.Rlgl.rlSetVertexAttributeDefault(
      locIndex.toInt(),
      rl.Temp.Float$.FromTypedList(value).cast(),
      attribType.value,
      value.length,
    ),
  );

  @override
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

  @override
  void rlDrawVertexArrayElements(
    num offset,
    num count,
    Uint16List buffer,
  ) => run(
    () => 'rlDrawVertexArrayElements($offset, ${buffer.length})',
    () => rl.Rlgl.rlDrawVertexArrayElements(
      offset.toInt(),
      count.toInt(),
      rl.Temp.Uint16$.FromTypedList(buffer).cast(),
    ),
  );

  @override
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

  @override
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
      rl.Temp.Uint16$.FromTypedList(buffer).cast(),
      instances.toInt(),
    ),
  );

  @override
  int rlLoadTexture(
    Uint8List? data,
    num width,
    num height,
    PixelFormat format,
    num mipmapCount,
  ) => run(
    () => 'rlLoadTexture(${data?.length}, $width, $height, $format, $mipmapCount)',
    () => rl.Rlgl.rlLoadTexture(
      data == null ? nullptr : rl.Temp.Uint8$.FromTypedList(data).cast(),
      width.toInt(),
      height.toInt(),
      format.value,
      mipmapCount.toInt(),
    ),
  );

  @override
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

  @override
  int rlLoadTextureCubemap(
    Uint8List? data,
    num size,
    PixelFormat format,
    num mipmapCount,
  ) => run(
    () => 'rlLoadTextureCubemap(${data?.length}, $size, ${format.name}, $mipmapCount)',
    () => rl.Rlgl.rlLoadTextureCubemap(
      data == null ? nullptr : rl.Temp.Uint8$.FromTypedList(data).cast(),
      size.toInt(),
      format.value,
      mipmapCount.toInt(),
    ),
  );

  @override
  void rlUpdateTexture(
    num id,
    num offsetX,
    num offsetY,
    num width,
    num height,
    PixelFormat format,
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
      rl.Temp.Uint8$.FromTypedList(data).cast(),
    ),
  );

  @override
  (int glInternalFormat, int glFormat, int glType) rlGetGlTextureFormats(
    PixelFormat format,
  ) => run(
    () => 'rlGetGlTextureFormats(${format.name})',
    () {
      final glInternalFormat = rl.Temp.UnsignedInt$.Ref1();
      final glFormat = rl.Temp.UnsignedInt$.Ref2();
      final glType = rl.Temp.UnsignedInt$.Ref3();
      rl.Rlgl.rlGetGlTextureFormats(
        format.value,
        glInternalFormat,
        glFormat,
        glType,
      );
      return (glInternalFormat.value, glFormat.value, glType.value);
    },
  );

  @override
  String rlGetPixelFormatName(
    PixelFormat format,
  ) => run(
    () => 'rlGetPixelFormatName(${format.name})',
    () => rl.Rlgl.rlGetPixelFormatName(
      format.value,
    ).toD,
  );

  @override
  void rlUnloadTexture(
    num id,
  ) => run(
    () => 'rlUnloadTexture($id)',
    () => rl.Rlgl.rlUnloadTexture(id.toInt()),
  );

  @override
  int rlGenTextureMipmaps(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => run(
    () => 'rlGenTextureMipmaps($id, $width, $height, ${format.name})',
    () {
      final mipmaps = rl.Temp.Int$.Ref1();
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

  @override
  Uint8List rlReadTexturePixels(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => run(
    () => 'rlReadTexturePixels($id, $width, $height, ${format.name})',
    () {
      final size = rl.Utils.GetPixelDataSize(
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

  @override
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

  @override
  int rlLoadFramebuffer() => run(
    () => 'rlLoadFramebuffer()',
    () => rl.Rlgl.rlLoadFramebuffer(),
  );

  @override
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

  @override
  bool rlFramebufferComplete(
    num id,
  ) => run(
    () => 'rlFramebufferComplete($id)',
    () => rl.Rlgl.rlFramebufferComplete(id.toInt()),
  );

  @override
  void rlUnloadFramebuffer(
    num id,
  ) => run(
    () => 'rlUnloadFramebuffer($id)',
    () => rl.Rlgl.rlUnloadFramebuffer(id.toInt()),
  );

  @override
  int rlLoadShaderCode(
    String? vsCode,
    String? fsCode,
  ) => run(
    () => 'rlLoadShaderCode(vsCode: ${vsCode?.length}, fsCode: ${fsCode?.length})',
    () => rl.Rlgl.rlLoadShaderCode(
      rl.Temp.String$.ValueOrNull(vsCode),
      rl.Temp.String$.ValueOrNull(fsCode),
    ),
  );

  @override
  int rlCompileShader(
    String shaderCode,
    RlShaderType type,
  ) => run(
    () => 'rlCompileShader(shaderCode: ${shaderCode.length}, ${type.name})',
    () => rl.Rlgl.rlCompileShader(
      rl.Temp.String$.ValueOrNull(shaderCode),
      type.value,
    ),
  );

  @override
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

  @override
  void rlUnloadShaderProgram(
    num id,
  ) => run(
    () => 'rlUnloadShaderProgram($id)',
    () => rl.Rlgl.rlUnloadShaderProgram(id.toInt()),
  );

  @override
  int rlGetLocationUniform(
    num shaderId,
    String uniformName,
  ) => run(
    () => 'rlGetLocationUniform($shaderId, $uniformName)',
    () => rl.Rlgl.rlGetLocationUniform(
      shaderId.toInt(),
      rl.Temp.String$.ValueOrNull(uniformName),
    ),
  );

  @override
  int rlGetLocationAttrib(
    num shaderId,
    String attribName,
  ) => run(
    () => 'rlGetLocationAttrib($shaderId, $attribName)',
    () => rl.Rlgl.rlGetLocationAttrib(
      shaderId.toInt(),
      rl.Temp.String$.ValueOrNull(attribName),
    ),
  );

  @override
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
          ptr = rl.Temp.Float$.FromTypedData(value).cast();
        case .RL_SHADER_UNIFORM_INT:
        case .RL_SHADER_UNIFORM_IVEC2:
        case .RL_SHADER_UNIFORM_IVEC3:
        case .RL_SHADER_UNIFORM_IVEC4:
        case .RL_SHADER_UNIFORM_SAMPLER2D:
          ptr = rl.Temp.Int32$.FromTypedData(value).cast();
        case .RL_SHADER_UNIFORM_UINT:
        case .RL_SHADER_UNIFORM_UIVEC2:
        case .RL_SHADER_UNIFORM_UIVEC3:
        case .RL_SHADER_UNIFORM_UIVEC4:
          ptr = rl.Temp.Uint32$.FromTypedData(value).cast();
      }
      rl.Rlgl.rlSetUniform(
        locIndex.toInt(),
        ptr,
        uniformType.value,
        count.toInt(),
      );
    },
  );

  @override
  void rlSetUniformMatrix(
    num locIndex,
    MatrixD mat,
  ) => run(
    () => 'rlSetUniformMatrix($locIndex, $mat)',
    () => rl.Rlgl.rlSetUniformMatrix(
      locIndex.toInt(),
      rl.Temp.Matrix$.Ref1(mat).ref,
    ),
  );

  @override
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

  @override
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

  @override
  void rlSetShader(
    num id,
    List<int> locs,
  ) => run(
    () => 'rlSetShader($id, $locs)',
    () => rl.Rlgl.rlSetShader(
      id.toInt(),
      rl.Temp.Int$.Array(locs),
    ),
  );

  @override
  int rlLoadComputeShaderProgram(
    num shaderId,
  ) => run(
    () => 'rlLoadComputeShaderProgram($shaderId)',
    () => rl.Rlgl.rlLoadComputeShaderProgram(shaderId.toInt()),
  );

  @override
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

  @override
  int rlLoadShaderBuffer(
    num size,
    TypedData? data,
    RlUsageHint? usageHint,
  ) => run(
    () => 'rlLoadShaderBuffer($size, data: ${data?.lengthInBytes}, $usageHint)',
    () => rl.Rlgl.rlLoadShaderBuffer(
      size.toInt(),
      data == null ? nullptr : rl.Temp.Uint8$.FromTypedData(data).cast(),
      usageHint?.value ?? 0,
    ),
  );

  @override
  void rlUnloadShaderBuffer(
    num ssboId,
  ) => run(
    () => 'rlUnloadShaderBuffer($ssboId)',
    () => rl.Rlgl.rlUnloadShaderBuffer(ssboId.toInt()),
  );

  @override
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
        rl.Temp.Uint8$.Array(bytes).cast(),
        bytes.length,
        offset.toInt(),
      );
    },
  );

  @override
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

  @override
  Uint8List rlReadShaderBuffer(
    num id,
    num count,
    num offset,
  ) => run(
    () => 'rlReadShaderBuffer($id, $count, $offset)',
    () {
      final values = rl.Temp.Uint8$.Sized(count.toInt());
      rl.Rlgl.rlReadShaderBuffer(
        id.toInt(),
        values.cast(),
        count.toInt(),
        offset.toInt(),
      );
      return .fromList(values.asTypedList(count.toInt()));
    },
  );

  @override
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

  @override
  int rlGetShaderBufferSize(
    num id,
  ) => run(
    () => 'rlGetShaderBufferSize($id)',
    () => rl.Rlgl.rlGetShaderBufferSize(id.toInt()),
  );

  @override
  void rlBindImageTexture(
    num id,
    num index,
    PixelFormat format,
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

  @override
  MatrixD rlGetMatrixModelview() => run(
    () => 'rlGetMatrixModelview()',
    () => rl.Rlgl.rlGetMatrixModelview().toD(),
  );

  @override
  MatrixD rlGetMatrixProjection() => run(
    () => 'rlGetMatrixProjection()',
    () => rl.Rlgl.rlGetMatrixProjection().toD(),
  );

  @override
  MatrixD rlGetMatrixTransform() => run(
    () => 'rlGetMatrixTransform()',
    () => rl.Rlgl.rlGetMatrixTransform().toD(),
  );

  @override
  MatrixD rlGetMatrixProjectionStereo(
    num eye,
  ) => run(
    () => 'rlGetMatrixProjectionStereo($eye)',
    () => rl.Rlgl.rlGetMatrixProjectionStereo(eye.toInt()).toD(),
  );

  @override
  MatrixD rlGetMatrixViewOffsetStereo(
    num eye,
  ) => run(
    () => 'rlGetMatrixViewOffsetStereo($eye)',
    () => rl.Rlgl.rlGetMatrixViewOffsetStereo(eye.toInt()).toD(),
  );

  @override
  void rlSetMatrixProjection(
    MatrixD proj,
  ) => run(
    () => 'rlSetMatrixProjection($proj)',
    () => rl.Rlgl.rlSetMatrixProjection(
      rl.Temp.Matrix$.Ref1(proj).ref,
    ),
  );

  @override
  void rlSetMatrixModelview(
    MatrixD view,
  ) => run(
    () => 'rlSetMatrixModelview($view)',
    () => rl.Rlgl.rlSetMatrixModelview(
      rl.Temp.Matrix$.Ref1(view).ref,
    ),
  );

  @override
  void rlSetMatrixProjectionStereo(
    MatrixD right,
    MatrixD left,
  ) => run(
    () => 'rlSetMatrixProjectionStereo($right, $left)',
    () => rl.Rlgl.rlSetMatrixProjectionStereo(
      rl.Temp.Matrix$.Ref1(right).ref,
      rl.Temp.Matrix$.Ref2(left).ref,
    ),
  );

  @override
  void rlSetMatrixViewOffsetStereo(
    MatrixD right,
    MatrixD left,
  ) => run(
    () => 'rlSetMatrixViewOffsetStereo($right, $left)',
    () => rl.Rlgl.rlSetMatrixViewOffsetStereo(
      rl.Temp.Matrix$.Ref1(right).ref,
      rl.Temp.Matrix$.Ref2(left).ref,
    ),
  );

  @override
  void rlLoadDrawCube() => run(
    () => 'rlLoadDrawCube()',
    () => rl.Rlgl.rlLoadDrawCube(),
  );

  @override
  void rlLoadDrawQuad() => run(
    () => 'rlLoadDrawQuad()',
    () => rl.Rlgl.rlLoadDrawQuad(),
  );
}
