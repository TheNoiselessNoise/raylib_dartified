part of '../../../raylib_dartified.dart';

class RaylibRlglD extends RaylibRlglModule<Raylib> {
  
  RaylibRlglD(super.rl);

  @override
  void rlMatrixMode(
    RlMatrixMode mode,
  ) => run(
    () => RaylibDebugLabels.rlMatrixMode(mode),
    () => rl.RlglFlat.rlMatrixMode(
      mode.value,
    ),
  );

  @override
  void rlPushMatrix() => run(
    () => RaylibDebugLabels.rlPushMatrix(),
    () => rl.RlglFlat.rlPushMatrix(),
  );

  @override
  void rlPopMatrix() => run(
    () => RaylibDebugLabels.rlPopMatrix(),
    () => rl.RlglFlat.rlPopMatrix(),
  );

  @override
  void rlLoadIdentity() => run(
    () => RaylibDebugLabels.rlLoadIdentity(),
    () => rl.RlglFlat.rlLoadIdentity(),
  );

  @override
  void rlTranslatef(
    num x,
    num y,
    num z,
  ) => run(
    () => RaylibDebugLabels.rlTranslatef(x, y, z),
    () => rl.RlglFlat.rlTranslatef(
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
    () => RaylibDebugLabels.rlRotatef(angle, x, y, z),
    () => rl.RlglFlat.rlRotatef(
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
    () => RaylibDebugLabels.rlScalef(x, y, z),
    () => rl.RlglFlat.rlScalef(
      x.toDouble(),
      y.toDouble(),
      z.toDouble(),
    ),
  );

  @override
  void rlMultMatrixf(
    List<num> matf,
  ) => run(
    () => RaylibDebugLabels.rlMultMatrixf(matf),
    () => rl.RlglFlat.rlMultMatrixf(
      rl.Temp.Float32$.Array(matf),
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
    () => RaylibDebugLabels.rlFrustum(left, right, bottom, top, znear, zfar),
    () => rl.RlglFlat.rlFrustum(
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
    () => RaylibDebugLabels.rlOrtho(left, right, bottom, top, znear, zfar),
    () => rl.RlglFlat.rlOrtho(
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
    () => RaylibDebugLabels.rlViewport(x, y, width, height),
    () => rl.RlglFlat.rlViewport(
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
    () => RaylibDebugLabels.rlSetClipPlanes(nearPlane, farPlane),
    () => rl.RlglFlat.rlSetClipPlanes(
      nearPlane.toDouble(),
      farPlane.toDouble(),
    ),
  );

  @override
  double rlGetCullDistanceNear() => run(
    () => RaylibDebugLabels.rlGetCullDistanceNear(),
    () => rl.RlglFlat.rlGetCullDistanceNear(),
  );

  @override
  double rlGetCullDistanceFar() => run(
    () => RaylibDebugLabels.rlGetCullDistanceFar(),
    () => rl.RlglFlat.rlGetCullDistanceFar(),
  );

  @override
  void rlBegin(
    RlDrawMode mode,
  ) => run(
    () => RaylibDebugLabels.rlBegin(mode),
    () => rl.RlglFlat.rlBegin(
      mode.value,
    ),
  );

  @override
  void rlEnd() => run(
    () => RaylibDebugLabels.rlEnd(),
    () => rl.RlglFlat.rlEnd(),
  );

  @override
  void rlVertex2i(
    num x,
    num y,
  ) => run(
    () => RaylibDebugLabels.rlVertex2i(x, y),
    () => rl.RlglFlat.rlVertex2i(
      x.toInt(),
      y.toInt(),
    ),
  );

  @override
  void rlVertex2f(
    num x,
    num y,
  ) => run(
    () => RaylibDebugLabels.rlVertex2f(x, y),
    () => rl.RlglFlat.rlVertex2f(
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
    () => RaylibDebugLabels.rlVertex3f(x, y, z),
    () => rl.RlglFlat.rlVertex3f(
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
    () => RaylibDebugLabels.rlTexCoord2f(x, y),
    () => rl.RlglFlat.rlTexCoord2f(
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
    () => RaylibDebugLabels.rlNormal3f(x, y, z),
    () => rl.RlglFlat.rlNormal3f(
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
    () => RaylibDebugLabels.rlColor4ub(r, g, b, a),
    () => rl.RlglFlat.rlColor4ub(
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
    () => RaylibDebugLabels.rlColor3f(x, y, z),
    () => rl.RlglFlat.rlColor3f(
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
    () => RaylibDebugLabels.rlColor4f(x, y, z, w),
    () => rl.RlglFlat.rlColor4f(
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
    () => RaylibDebugLabels.rlEnableVertexArray(vaoId),
    () => rl.RlglFlat.rlEnableVertexArray(
      vaoId.toInt(),
    ),
  );

  @override
  void rlDisableVertexArray() => run(
    () => RaylibDebugLabels.rlDisableVertexArray(),
    () => rl.RlglFlat.rlDisableVertexArray(),
  );

  @override
  void rlEnableVertexBuffer(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlEnableVertexBuffer(id),
    () => rl.RlglFlat.rlEnableVertexBuffer(
      id.toInt(),
    ),
  );

  @override
  void rlDisableVertexBuffer() => run(
    () => RaylibDebugLabels.rlDisableVertexBuffer(),
    () => rl.RlglFlat.rlDisableVertexBuffer(),
  );

  @override
  void rlEnableVertexBufferElement(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlEnableVertexBufferElement(id),
    () => rl.RlglFlat.rlEnableVertexBufferElement(
      id.toInt(),
    ),
  );

  @override
  void rlDisableVertexBufferElement() => run(
    () => RaylibDebugLabels.rlDisableVertexBufferElement(),
    () => rl.RlglFlat.rlDisableVertexBufferElement(),
  );

  @override
  void rlEnableVertexAttribute(
    num index,
  ) => run(
    () => RaylibDebugLabels.rlEnableVertexAttribute(index),
    () => rl.RlglFlat.rlEnableVertexAttribute(
      index.toInt(),
    ),
  );

  @override
  void rlDisableVertexAttribute(
    num index,
  ) => run(
    () => RaylibDebugLabels.rlDisableVertexAttribute(index),
    () => rl.RlglFlat.rlDisableVertexAttribute(
      index.toInt(),
    ),
  );

  final Map<int, MemoryPointer> _rlEnableStatePointer_statePointers = {};

  @override
  void rlEnableStatePointer(int vertexAttribType, TypedDataList buffer) => run(
    () => RaylibDebugLabels.rlEnableStatePointer(vertexAttribType, buffer),
    () {
      final existing = _rlEnableStatePointer_statePointers[vertexAttribType];
      if (existing != null) existing.free();

      final native = rl.Temp.TypedDataList$.Array(buffer, key: 'rlEnableStatePointer_$vertexAttribType');

      _rlEnableStatePointer_statePointers[vertexAttribType] = native;

      rl.RlglFlat.rlEnableStatePointer(
        vertexAttribType,
        native,
      );
    },
  );

  @override
  void rlDisableStatePointer(int vertexAttribType) => run(
    () => RaylibDebugLabels.rlDisableStatePointer(vertexAttribType),
    () {
      rl.RlglFlat.rlDisableStatePointer(
        vertexAttribType,
      );

      final existing = _rlEnableStatePointer_statePointers.remove(vertexAttribType);
      if (existing != null) existing.free();
    },
  );

  @override
  void rlActiveTextureSlot(
    num slot,
  ) => run(
    () => RaylibDebugLabels.rlActiveTextureSlot(slot),
    () => rl.RlglFlat.rlActiveTextureSlot(
      slot.toInt(),
    ),
  );

  @override
  void rlEnableTexture(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlEnableTexture(id),
    () => rl.RlglFlat.rlEnableTexture(
      id.toInt(),
    ),
  );

  @override
  void rlDisableTexture() => run(
    () => RaylibDebugLabels.rlDisableTexture(),
    () => rl.RlglFlat.rlDisableTexture(),
  );

  @override
  void rlEnableTextureCubemap(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlEnableTextureCubemap(id),
    () => rl.RlglFlat.rlEnableTextureCubemap(
      id.toInt(),
    ),
  );

  @override
  void rlDisableTextureCubemap() => run(
    () => RaylibDebugLabels.rlDisableTextureCubemap(),
    () => rl.RlglFlat.rlDisableTextureCubemap(),
  );

  @override
  void rlTextureParameters(
    num id,
    num param,
    num value,
  ) => run(
    () => RaylibDebugLabels.rlTextureParameters(id, param, value),
    () => rl.RlglFlat.rlTextureParameters(
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
    () => RaylibDebugLabels.rlCubemapParameters(id, param, value),
    () => rl.RlglFlat.rlCubemapParameters(
      id.toInt(),
      param.toInt(),
      value.toInt(),
    ),
  );

  @override
  void rlEnableShader(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlEnableShader(id),
    () => rl.RlglFlat.rlEnableShader(
      id.toInt(),
    ),
  );

  @override
  void rlDisableShader() => run(
    () => RaylibDebugLabels.rlDisableShader(),
    () => rl.RlglFlat.rlDisableShader(),
  );

  @override
  void rlEnableFramebuffer(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlEnableFramebuffer(id),
    () => rl.RlglFlat.rlEnableFramebuffer(
      id.toInt(),
    ),
  );

  @override
  void rlDisableFramebuffer() => run(
    () => RaylibDebugLabels.rlDisableFramebuffer(),
    () => rl.RlglFlat.rlDisableFramebuffer(),
  );

  @override
  int rlGetActiveFramebuffer() => run(
    () => RaylibDebugLabels.rlGetActiveFramebuffer(),
    () => rl.RlglFlat.rlGetActiveFramebuffer(),
  );

  @override
  void rlActiveDrawBuffers(
    num count,
  ) => run(
    () => RaylibDebugLabels.rlActiveDrawBuffers(count),
    () => rl.RlglFlat.rlActiveDrawBuffers(
      count.toInt(),
    ),
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
    () => RaylibDebugLabels.rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask),
    () => rl.RlglFlat.rlBlitFramebuffer(
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
    () => RaylibDebugLabels.rlBindFramebuffer(target, framebuffer),
    () => rl.RlglFlat.rlBindFramebuffer(
      target.toInt(),
      framebuffer.toInt(),
    ),
  );

  @override
  void rlEnableColorBlend() => run(
    () => RaylibDebugLabels.rlEnableColorBlend(),
    () => rl.RlglFlat.rlEnableColorBlend(),
  );

  @override
  void rlDisableColorBlend() => run(
    () => RaylibDebugLabels.rlDisableColorBlend(),
    () => rl.RlglFlat.rlDisableColorBlend(),
  );

  @override
  void rlEnableDepthTest() => run(
    () => RaylibDebugLabels.rlEnableDepthTest(),
    () => rl.RlglFlat.rlEnableDepthTest(),
  );

  @override
  void rlDisableDepthTest() => run(
    () => RaylibDebugLabels.rlDisableDepthTest(),
    () => rl.RlglFlat.rlDisableDepthTest(),
  );

  @override
  void rlEnableDepthMask() => run(
    () => RaylibDebugLabels.rlEnableDepthMask(),
    () => rl.RlglFlat.rlEnableDepthMask(),
  );

  @override
  void rlDisableDepthMask() => run(
    () => RaylibDebugLabels.rlDisableDepthMask(),
    () => rl.RlglFlat.rlDisableDepthMask(),
  );

  @override
  void rlEnableBackfaceCulling() => run(
    () => RaylibDebugLabels.rlEnableBackfaceCulling(),
    () => rl.RlglFlat.rlEnableBackfaceCulling(),
  );

  @override
  void rlDisableBackfaceCulling() => run(
    () => RaylibDebugLabels.rlDisableBackfaceCulling(),
    () => rl.RlglFlat.rlDisableBackfaceCulling(),
  );

  @override
  void rlColorMask(
    bool r,
    bool g,
    bool b,
    bool a,
  ) => run(
    () => RaylibDebugLabels.rlColorMask(r, g, b, a),
    () => rl.RlglFlat.rlColorMask(
      r,
      g,
      b,
      a,
    ),
  );

  @override
  void rlSetCullFace(
    RlCullMode mode,
  ) => run(
    () => RaylibDebugLabels.rlSetCullFace(mode),
    () => rl.RlglFlat.rlSetCullFace(
      mode.value,
    ),
  );

  @override
  void rlEnableScissorTest() => run(
    () => RaylibDebugLabels.rlEnableScissorTest(),
    () => rl.RlglFlat.rlEnableScissorTest(),
  );

  @override
  void rlDisableScissorTest() => run(
    () => RaylibDebugLabels.rlDisableScissorTest(),
    () => rl.RlglFlat.rlDisableScissorTest(),
  );

  @override
  void rlScissor(
    num x,
    num y,
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.rlScissor(x, y, width, height),
    () => rl.RlglFlat.rlScissor(
      x.toInt(),
      y.toInt(),
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  void rlEnablePointMode() => run(
    () => RaylibDebugLabels.rlEnablePointMode(),
    () => rl.RlglFlat.rlEnablePointMode(),
  );

  @override
  void rlDisablePointMode() => run(
    () => RaylibDebugLabels.rlDisablePointMode(),
    () => rl.RlglFlat.rlDisablePointMode(),
  );

  @override
  void rlSetPointSize(
    num size,
  ) => run(
    () => RaylibDebugLabels.rlSetPointSize(size),
    () => rl.RlglFlat.rlSetPointSize(
      size.toDouble(),
    ),
  );
  
  @override
  double rlGetPointSize() => run(
    () => RaylibDebugLabels.rlGetPointSize(),
    () => rl.RlglFlat.rlGetPointSize(),
  );

  @override
  void rlEnableWireMode() => run(
    () => RaylibDebugLabels.rlEnableWireMode(),
    () => rl.RlglFlat.rlEnableWireMode(),
  );

  @override
  void rlDisableWireMode() => run(
    () => RaylibDebugLabels.rlDisableWireMode(),
    () => rl.RlglFlat.rlDisableWireMode(),
  );

  @override
  void rlSetLineWidth(
    num width,
  ) => run(
    () => RaylibDebugLabels.rlSetLineWidth(width),
    () => rl.RlglFlat.rlSetLineWidth(
      width.toDouble(),
    ),
  );

  @override
  double rlGetLineWidth() => run(
    () => RaylibDebugLabels.rlGetLineWidth(),
    () => rl.RlglFlat.rlGetLineWidth(),
  );

  @override
  void rlEnableSmoothLines() => run(
    () => RaylibDebugLabels.rlEnableSmoothLines(),
    () => rl.RlglFlat.rlEnableSmoothLines(),
  );

  @override
  void rlDisableSmoothLines() => run(
    () => RaylibDebugLabels.rlDisableSmoothLines(),
    () => rl.RlglFlat.rlDisableSmoothLines(),
  );

  @override
  void rlEnableStereoRender() => run(
    () => RaylibDebugLabels.rlEnableStereoRender(),
    () => rl.RlglFlat.rlEnableStereoRender(),
  );

  @override
  void rlDisableStereoRender() => run(
    () => RaylibDebugLabels.rlDisableStereoRender(),
    () => rl.RlglFlat.rlDisableStereoRender(),
  );

  @override
  bool rlIsStereoRenderEnabled() => run(
    () => RaylibDebugLabels.rlIsStereoRenderEnabled(),
    () => rl.RlglFlat.rlIsStereoRenderEnabled(),
  );

  @override
  void rlClearColor(
    num r,
    num g,
    num b,
    num a,
  ) => run(
    () => RaylibDebugLabels.rlClearColor(r, g, b, a),
    () => rl.RlglFlat.rlClearColor(
      r.toInt(),
      g.toInt(),
      b.toInt(),
      a.toInt(),
    ),
  );

  @override
  void rlClearScreenBuffers() => run(
    () => RaylibDebugLabels.rlClearScreenBuffers(),
    () => rl.RlglFlat.rlClearScreenBuffers(),
  );

  @override
  void rlCheckErrors() => run(
    () => RaylibDebugLabels.rlCheckErrors(),
    () => rl.RlglFlat.rlCheckErrors(),
  );

  @override
  void rlSetBlendMode(
    BlendMode mode,
  ) => run(
    () => RaylibDebugLabels.rlSetBlendMode(mode),
    () => rl.RlglFlat.rlSetBlendMode(
      mode.value,
    ),
  );

  @override
  void rlSetBlendFactors(
    num glSrcFactor,
    num glDstFactor,
    num glEquation,
  ) => run(
    () => RaylibDebugLabels.rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation),
    () => rl.RlglFlat.rlSetBlendFactors(
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
    () => RaylibDebugLabels.rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha),
    () => rl.RlglFlat.rlSetBlendFactorsSeparate(
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
    () => RaylibDebugLabels.rlglInit(width, height),
    () => rl.RlglFlat.rlglInit(
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  void rlglClose() => run(
    () => RaylibDebugLabels.rlglClose(),
    () => rl.RlglFlat.rlglClose(),
  );

  // NOTE: rlLoadExtensions, use it in flat layer if you really need it

  // NOTE: rlGetProcAddress, use it in flat layer if you really need it

  @override
  int rlGetVersion() => run(
    () => RaylibDebugLabels.rlGetVersion(),
    () => rl.RlglFlat.rlGetVersion(),
  );

  @override
  void rlSetFramebufferWidth(
    num width,
  ) => run(
    () => RaylibDebugLabels.rlSetFramebufferWidth(width),
    () => rl.RlglFlat.rlSetFramebufferWidth(
      width.toInt(),
    ),
  );

  @override
  int rlGetFramebufferWidth() => run(
    () => RaylibDebugLabels.rlGetFramebufferWidth(),
    () => rl.RlglFlat.rlGetFramebufferWidth(),
  );

  @override
  void rlSetFramebufferHeight(
    num height,
  ) => run(
    () => RaylibDebugLabels.rlSetFramebufferHeight(height),
    () => rl.RlglFlat.rlSetFramebufferHeight(
      height.toInt(),
    ),
  );

  @override
  int rlGetFramebufferHeight() => run(
    () => RaylibDebugLabels.rlGetFramebufferHeight(),
    () => rl.RlglFlat.rlGetFramebufferHeight(),
  );

  @override
  int rlGetTextureIdDefault() => run(
    () => RaylibDebugLabels.rlGetTextureIdDefault(),
    () => rl.RlglFlat.rlGetTextureIdDefault(),
  );

  @override
  int rlGetShaderIdDefault() => run(
    () => RaylibDebugLabels.rlGetShaderIdDefault(),
    () => rl.RlglFlat.rlGetShaderIdDefault(),
  );

  @override
  List<int> rlGetShaderLocsDefault() => run(
    () => RaylibDebugLabels.rlGetShaderLocsDefault(),
    () {
      final locs = rl.RlglFlat.rlGetShaderLocsDefault();
      return .generate(RL_MAX_SHADER_LOCATIONS, (i) => locs[i]);
    },
  );

  @override
  RlRenderBatchD rlLoadRenderBatch(
    num numBuffers,
    num bufferElements,
  ) => run(
    () => RaylibDebugLabels.rlLoadRenderBatch(numBuffers, bufferElements),
    () => rl.RlglFlat.rlLoadRenderBatch(
      numBuffers.toInt(),
      bufferElements.toInt(),
    ),
  );

  @override
  void rlUnloadRenderBatch(
    RlRenderBatchD batch,
  ) => run(
    () => RaylibDebugLabels.rlUnloadRenderBatch(batch),
    () => rl.RlglFlat.rlUnloadRenderBatch(
      batch,
    ),
  );

  @override
  void rlDrawRenderBatch(
    RlRenderBatchD batch,
  ) => run(
    () => RaylibDebugLabels.rlDrawRenderBatch(batch),
    () => rl.Temp.RlRenderBatch$.RefUpdate1(batch,
      (pb) => rl.RlglFlat.rlDrawRenderBatch(
        pb,
      ),
    ),
  );

  @override
  void rlSetRenderBatchActive([
    RlRenderBatchD? batch,
  ]) => run(
    () => RaylibDebugLabels.rlSetRenderBatchActive(batch),
    () => rl.Temp.RlRenderBatch$.RefUpdate1(batch,
      (pb) => rl.RlglFlat.rlSetRenderBatchActive(
        pb,
      ),
    ),
  );

  @override
  void rlDrawRenderBatchActive() => run(
    () => RaylibDebugLabels.rlDrawRenderBatchActive(),
    () => rl.RlglFlat.rlDrawRenderBatchActive(),
  );

  @override
  bool rlCheckRenderBatchLimit(
    num vCount,
  ) => run(
    () => RaylibDebugLabels.rlCheckRenderBatchLimit(vCount),
    () => rl.RlglFlat.rlCheckRenderBatchLimit(
      vCount.toInt(),
    ),
  );

  @override
  void rlSetTexture(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlSetTexture(id),
    () => rl.RlglFlat.rlSetTexture(
      id.toInt(),
    ),
  );

  @override
  int rlLoadVertexArray() => run(
    () => RaylibDebugLabels.rlLoadVertexArray(),
    () => rl.RlglFlat.rlLoadVertexArray(),
  );

  @override
  int rlLoadVertexBuffer(
    TypedDataList buffer,
    bool dynamic,
  ) => run(
    () => RaylibDebugLabels.rlLoadVertexBuffer(buffer, dynamic),
    () => rl.RlglFlat.rlLoadVertexBuffer(
      rl.Temp.TypedDataList$.Array(buffer),
      buffer.length,
      dynamic,
    ),
  );

  @override
  int rlLoadVertexBufferElement(
    TypedDataList buffer,
    bool dynamic,
  ) => run(
    () => RaylibDebugLabels.rlLoadVertexBufferElement(buffer, dynamic),
    () => rl.RlglFlat.rlLoadVertexBufferElement(
      rl.Temp.TypedDataList$.Array(buffer),
      buffer.length,
      dynamic,
    ),
  );

  @override
  void rlUpdateVertexBuffer(
    num bufferId,
    TypedDataList data,
    num dataSize,
    num offset,
  ) => run(
    () => RaylibDebugLabels.rlUpdateVertexBuffer(bufferId, data, dataSize, offset),
    () => rl.RlglFlat.rlUpdateVertexBuffer(
      bufferId.toInt(),
      rl.Temp.TypedDataList$.Array(data),
      (dataSize * rl.Temp.TypedDataList$.ElementSize(data)).toInt(),
      offset.toInt(),
    ),
  );

  @override
  void rlUpdateVertexBufferElements(
    num id,
    TypedDataList data,
    num dataSize,
    num offset,
  ) => run(
    () => RaylibDebugLabels.rlUpdateVertexBufferElements(id, data, dataSize, offset),
    () => rl.RlglFlat.rlUpdateVertexBufferElements(
      id.toInt(),
      rl.Temp.TypedDataList$.Array(data),
      (dataSize * rl.Temp.TypedDataList$.ElementSize(data)).toInt(),
      offset.toInt(),
    ),
  );

  @override
  void rlUnloadVertexArray(
    num vaoId,
  ) => run(
    () => RaylibDebugLabels.rlUnloadVertexArray(vaoId),
    () => rl.RlglFlat.rlUnloadVertexArray(
      vaoId.toInt(),
    ),
  );

  @override
  void rlUnloadVertexBuffer(
    num vboId,
  ) => run(
    () => RaylibDebugLabels.rlUnloadVertexBuffer(vboId),
    () => rl.RlglFlat.rlUnloadVertexBuffer(
      vboId.toInt(),
    ),
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
    () => RaylibDebugLabels.rlSetVertexAttribute(index, compSize, type, normalized, stride, offset),
    () => rl.RlglFlat.rlSetVertexAttribute(
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
    () => RaylibDebugLabels.rlSetVertexAttributeDivisor(index, divisor),
    () => rl.RlglFlat.rlSetVertexAttributeDivisor(
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
    () => RaylibDebugLabels.rlSetVertexAttributeDefault(locIndex, value, attribType),
    () => rl.RlglFlat.rlSetVertexAttributeDefault(
      locIndex.toInt(),
      rl.Temp.Float32$.FromTypedList(value).cast(),
      attribType.value,
      value.length,
    ),
  );

  @override
  void rlDrawVertexArray(
    num offset,
    num count,
  ) => run(
    () => RaylibDebugLabels.rlDrawVertexArray(offset, count),
    () => rl.RlglFlat.rlDrawVertexArray(
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
    () => RaylibDebugLabels.rlDrawVertexArrayElements(offset, count, buffer),
    () => rl.RlglFlat.rlDrawVertexArrayElements(
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
    () => RaylibDebugLabels.rlDrawVertexArrayInstanced(offset, count, instances),
    () => rl.RlglFlat.rlDrawVertexArrayInstanced(
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
    () => RaylibDebugLabels.rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances),
    () => rl.RlglFlat.rlDrawVertexArrayElementsInstanced(
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
    () => RaylibDebugLabels.rlLoadTexture(data, width, height, format, mipmapCount),
    () => rl.RlglFlat.rlLoadTexture(
      (data == null ? MemoryPointer.nullptr : rl.Temp.Uint8$.FromTypedList(data)).cast(),
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
    () => RaylibDebugLabels.rlLoadTextureDepth(width, height, useRenderBuffer),
    () => rl.RlglFlat.rlLoadTextureDepth(
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
    () => RaylibDebugLabels.rlLoadTextureCubemap(data, size, format, mipmapCount),
    () => rl.RlglFlat.rlLoadTextureCubemap(
      (data == null ? MemoryPointer.nullptr : rl.Temp.Uint8$.FromTypedList(data)).cast(),
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
    () => RaylibDebugLabels.rlUpdateTexture(id, offsetX, offsetY, width, height, format, data),
    () => rl.RlglFlat.rlUpdateTexture(
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
    () => RaylibDebugLabels.rlGetGlTextureFormats(format),
    () {
      final glInternalFormat = rl.Temp.UnsignedInt$.Ref1();
      final glFormat = rl.Temp.UnsignedInt$.Ref2();
      final glType = rl.Temp.UnsignedInt$.Ref3();
      rl.RlglFlat.rlGetGlTextureFormats(
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
    () => RaylibDebugLabels.rlGetPixelFormatName(format),
    () => rl.RlglFlat.rlGetPixelFormatName(
      format.value,
    ).toDartString(),
  );

  @override
  void rlUnloadTexture(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlUnloadTexture(id),
    () => rl.RlglFlat.rlUnloadTexture(
      id.toInt(),
    ),
  );

  @override
  int rlGenTextureMipmaps(
    num id,
    num width,
    num height,
    PixelFormat format,
  ) => run(
    () => RaylibDebugLabels.rlGenTextureMipmaps(id, width, height, format),
    () {
      final mipmaps = rl.Temp.Int$.Ref1();
      rl.RlglFlat.rlGenTextureMipmaps(
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
    () => RaylibDebugLabels.rlReadTexturePixels(id, width, height, format),
    () {
      final size = rl.CoreD.GetPixelDataSize(
        width.toInt(),
        height.toInt(),
        format,
      );
      final pixels = rl.RlglFlat.rlReadTexturePixels(
        id.toInt(),
        width.toInt(),
        height.toInt(),
        format.value,
      );
      return pixels.to(size);
    },
  );

  @override
  Uint8List rlReadScreenPixels(
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.rlReadScreenPixels(width, height),
    () {
      final values = rl.RlglFlat.rlReadScreenPixels(
        width.toInt(),
        height.toInt(),
      );
      final pixels = values.to<Uint8List>(width.toInt()*height.toInt()*4);
      values.free();
      return .fromList(pixels);
    },
  );

  @override
  int rlLoadFramebuffer() => run(
    () => RaylibDebugLabels.rlLoadFramebuffer(),
    () => rl.RlglFlat.rlLoadFramebuffer(),
  );

  @override
  void rlFramebufferAttach(
    num fboId,
    num texId,
    RlFramebufferAttachType attachType,
    RlFramebufferAttachTextureType texType,
    num mipLevel,
  ) => run(
    () => RaylibDebugLabels.rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel),
    () => rl.RlglFlat.rlFramebufferAttach(
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
    () => RaylibDebugLabels.rlFramebufferComplete(id),
    () => rl.RlglFlat.rlFramebufferComplete(
      id.toInt(),
    ),
  );

  @override
  void rlUnloadFramebuffer(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlUnloadFramebuffer(id),
    () => rl.RlglFlat.rlUnloadFramebuffer(
      id.toInt(),
    ),
  );

  @override
  Uint8List rlCopyFramebuffer(
    num x,
    num y,
    num width,
    num height,
    PixelFormat format,
  ) => run(
    () => RaylibDebugLabels.rlCopyFramebuffer(x, y, width, height, format),
    () {
      final size = rl.CoreD.GetPixelDataSize(width, height, format);
      if (size <= 0) {
        throw ArgumentError(
          'rlCopyFramebuffer: invalid pixel data size for '
          '${width}x$height @ $format',
        );
      }

      final pixels = rl.Temp.Uint8$.Sized(size);

      rl.RlglFlat.rlCopyFramebuffer(
        x.toInt(),
        y.toInt(),
        width.toInt(),
        height.toInt(),
        format.value,
        pixels.cast(),
      );

      return pixels.to(size);
    },
  );
  
  @override
  void rlResizeFramebuffer(
    num width,
    num height,
  ) => run(
    () => RaylibDebugLabels.rlResizeFramebuffer(width, height),
    () => rl.RlglFlat.rlResizeFramebuffer(
      width.toInt(),
      height.toInt(),
    ),
  );

  @override
  int rlLoadShader(
    String code,
    RlShaderType type,
  ) => run(
    () => RaylibDebugLabels.rlLoadShader(code, type),
    () => rl.RlglFlat.rlLoadShader(
      rl.Temp.String$.ValueOrNull(code),
      type.value,
    ),
  );

  @override
  int rlLoadShaderProgram(
    String vsCode,
    String fsCode,
  ) => run(
    () => RaylibDebugLabels.rlLoadShaderProgram(vsCode, fsCode),
    () => rl.RlglFlat.rlLoadShaderProgram(
      rl.Temp.String$.ValueOrNull(vsCode),
      rl.Temp.String$.ValueOrNull(fsCode),
    ),
  );

  @override
  int rlLoadShaderProgramEx(
    num vsId,
    num fsId,
  ) => run(
    () => RaylibDebugLabels.rlLoadShaderProgramEx(vsId, fsId),
    () => rl.RlglFlat.rlLoadShaderProgramEx(
      vsId.toInt(),
      fsId.toInt(),
    ),
  );
  
  @override
  int rlLoadShaderProgramCompute(
    num csId,
  ) => run(
    () => RaylibDebugLabels.rlLoadShaderProgramCompute(csId),
    () => rl.RlglFlat.rlLoadShaderProgramCompute(
      csId.toInt(),
    ),
  );
  
  @override
  void rlUnloadShader(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlUnloadShader(id),
    () => rl.RlglFlat.rlUnloadShader(
      id.toInt(),
    ),
  );

  @override
  void rlUnloadShaderProgram(
    num id,
  ) => run(
    () => RaylibDebugLabels.rlUnloadShaderProgram(id),
    () => rl.RlglFlat.rlUnloadShaderProgram(
      id.toInt(),
    ),
  );

  @override
  int rlGetLocationUniform(
    num shaderId,
    String uniformName,
  ) => run(
    () => RaylibDebugLabels.rlGetLocationUniform(shaderId, uniformName),
    () => rl.RlglFlat.rlGetLocationUniform(
      shaderId.toInt(),
      rl.Temp.String$.ValueOrNull(uniformName),
    ),
  );

  @override
  int rlGetLocationAttrib(
    num shaderId,
    String attribName,
  ) => run(
    () => RaylibDebugLabels.rlGetLocationAttrib(shaderId, attribName),
    () => rl.RlglFlat.rlGetLocationAttrib(
      shaderId.toInt(),
      rl.Temp.String$.ValueOrNull(attribName),
    ),
  );

  @override
  void rlSetUniform(
    num locIndex,
    TypedDataList value,
    RlShaderUniformDataType uniformType,
    num count,
  ) => run(
    () => RaylibDebugLabels.rlSetUniform(locIndex, value, uniformType, count),
    () {
      final MemoryPointer ptr;
      switch (uniformType) {
        case .RL_SHADER_UNIFORM_FLOAT:
        case .RL_SHADER_UNIFORM_VEC2:
        case .RL_SHADER_UNIFORM_VEC3:
        case .RL_SHADER_UNIFORM_VEC4:
          ptr = rl.Temp.Float32$.FromTypedData(value);
        case .RL_SHADER_UNIFORM_INT:
        case .RL_SHADER_UNIFORM_IVEC2:
        case .RL_SHADER_UNIFORM_IVEC3:
        case .RL_SHADER_UNIFORM_IVEC4:
        case .RL_SHADER_UNIFORM_SAMPLER2D:
          ptr = rl.Temp.Int32$.FromTypedData(value);
        case .RL_SHADER_UNIFORM_UINT:
        case .RL_SHADER_UNIFORM_UIVEC2:
        case .RL_SHADER_UNIFORM_UIVEC3:
        case .RL_SHADER_UNIFORM_UIVEC4:
          ptr = rl.Temp.Uint32$.FromTypedData(value);
      }
      rl.RlglFlat.rlSetUniform(
        locIndex.toInt(),
        ptr.cast(),
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
    () => RaylibDebugLabels.rlSetUniformMatrix(locIndex, mat),
    () => rl.RlglFlat.rlSetUniformMatrix(
      locIndex.toInt(),
      mat,
    ),
  );

  @override
  void rlSetUniformMatrices(
    num locIndex,
    List<MatrixD> mat,
  ) => run(
    () => RaylibDebugLabels.rlSetUniformMatrices(locIndex, mat),
    () => rl.RlglFlat.rlSetUniformMatrices(
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
    () => RaylibDebugLabels.rlSetUniformSampler(locIndex, textureId),
    () => rl.RlglFlat.rlSetUniformSampler(
      locIndex.toInt(),
      textureId.toInt(),
    ),
  );

  @override
  void rlSetShader(
    num id,
    List<int> locs,
  ) => run(
    () => RaylibDebugLabels.rlSetShader(id, locs),
    () => rl.RlglFlat.rlSetShader(
      id.toInt(),
      rl.Temp.Int$.Array(locs),
    ),
  );

  @override
  void rlComputeShaderDispatch(
    num groupX,
    num groupY,
    num groupZ,
  ) => run(
    () => RaylibDebugLabels.rlComputeShaderDispatch(groupX, groupY, groupZ),
    () => rl.RlglFlat.rlComputeShaderDispatch(
      groupX.toInt(),
      groupY.toInt(),
      groupZ.toInt(),
    ),
  );

  @override
  int rlLoadShaderBuffer(
    num size,
    TypedDataList? data,
    RlUsageHint? usageHint,
  ) => run(
    () => RaylibDebugLabels.rlLoadShaderBuffer(size, data, usageHint),
    () => rl.RlglFlat.rlLoadShaderBuffer(
      size.toInt(),
      data == null ? MemoryPointer.nullptr : rl.Temp.TypedDataList$.Array(data),
      usageHint?.value ?? 0,
    ),
  );

  @override
  void rlUnloadShaderBuffer(
    num ssboId,
  ) => run(
    () => RaylibDebugLabels.rlUnloadShaderBuffer(ssboId),
    () => rl.RlglFlat.rlUnloadShaderBuffer(
      ssboId.toInt(),
    ),
  );

  @override
  void rlUpdateShaderBuffer(
    num id,
    TypedDataList data,
    num offset,
  ) => run(
    () => RaylibDebugLabels.rlUpdateShaderBuffer(id, data, offset),
    () => rl.RlglFlat.rlUpdateShaderBuffer(
      id.toInt(),
      rl.Temp.TypedDataList$.Array(data),
      data.length,
      offset.toInt(),
    ),
  );

  @override
  void rlBindShaderBuffer(
    num id,
    num index,
  ) => run(
    () => RaylibDebugLabels.rlBindShaderBuffer(id, index),
    () => rl.RlglFlat.rlBindShaderBuffer(
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
    () => RaylibDebugLabels.rlReadShaderBuffer(id, count, offset),
    () {
      final values = rl.Temp.Uint8$.Sized(count.toInt());
      rl.RlglFlat.rlReadShaderBuffer(
        id.toInt(),
        values.cast(),
        count.toInt(),
        offset.toInt(),
      );
      return values.to(count.toInt());
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
    () => RaylibDebugLabels.rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count),
    () => rl.RlglFlat.rlCopyShaderBuffer(
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
    () => RaylibDebugLabels.rlGetShaderBufferSize(id),
    () => rl.RlglFlat.rlGetShaderBufferSize(
      id.toInt(),
    ),
  );

  @override
  void rlBindImageTexture(
    num id,
    num index,
    PixelFormat format,
    bool readonly,
  ) => run(
    () => RaylibDebugLabels.rlBindImageTexture(id, index, format, readonly),
    () => rl.RlglFlat.rlBindImageTexture(
      id.toInt(),
      index.toInt(),
      format.value,
      readonly,
    ),
  );

  @override
  MatrixD rlGetMatrixModelview() => run(
    () => RaylibDebugLabels.rlGetMatrixModelview(),
    () => rl.RlglFlat.rlGetMatrixModelview(),
  );

  @override
  MatrixD rlGetMatrixProjection() => run(
    () => RaylibDebugLabels.rlGetMatrixProjection(),
    () => rl.RlglFlat.rlGetMatrixProjection(),
  );

  @override
  MatrixD rlGetMatrixTransform() => run(
    () => RaylibDebugLabels.rlGetMatrixTransform(),
    () => rl.RlglFlat.rlGetMatrixTransform(),
  );

  @override
  MatrixD rlGetMatrixProjectionStereo(
    num eye,
  ) => run(
    () => RaylibDebugLabels.rlGetMatrixProjectionStereo(eye),
    () => rl.RlglFlat.rlGetMatrixProjectionStereo(eye.toInt()),
  );

  @override
  MatrixD rlGetMatrixViewOffsetStereo(
    num eye,
  ) => run(
    () => RaylibDebugLabels.rlGetMatrixViewOffsetStereo(eye),
    () => rl.RlglFlat.rlGetMatrixViewOffsetStereo(eye.toInt()),
  );

  @override
  void rlSetMatrixProjection(
    MatrixD proj,
  ) => run(
    () => RaylibDebugLabels.rlSetMatrixProjection(proj),
    () => rl.RlglFlat.rlSetMatrixProjection(
      proj,
    ),
  );

  @override
  void rlSetMatrixModelview(
    MatrixD view,
  ) => run(
    () => RaylibDebugLabels.rlSetMatrixModelview(view),
    () => rl.RlglFlat.rlSetMatrixModelview(
      view,
    ),
  );

  @override
  void rlSetMatrixProjectionStereo(
    MatrixD right,
    MatrixD left,
  ) => run(
    () => RaylibDebugLabels.rlSetMatrixProjectionStereo(right, left),
    () => rl.RlglFlat.rlSetMatrixProjectionStereo(
      right,
      left,
    ),
  );

  @override
  void rlSetMatrixViewOffsetStereo(
    MatrixD right,
    MatrixD left,
  ) => run(
    () => RaylibDebugLabels.rlSetMatrixViewOffsetStereo(right, left),
    () => rl.RlglFlat.rlSetMatrixViewOffsetStereo(
      right,
      left,
    ),
  );

  @override
  void rlLoadDrawCube() => run(
    () => RaylibDebugLabels.rlLoadDrawCube(),
    () => rl.RlglFlat.rlLoadDrawCube(),
  );

  @override
  void rlLoadDrawQuad() => run(
    () => RaylibDebugLabels.rlLoadDrawQuad(),
    () => rl.RlglFlat.rlLoadDrawQuad(),
  );
}
