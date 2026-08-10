part of '../../../raylib_dartified.dart';

class RaylibRlgl extends RaylibModule<Raylib> with RaylibRlglModuleExtras<Raylib> {
  RaylibRlgl(super.rl);

  RaylibLookup get _lookup => rl.lookup<RaylibCore>();

  void rlMatrixMode(int mode)
    => _rlMatrixMode(mode);
  late final _rlMatrixModePtr = _lookup<NativeFunction<Void Function(Int)>>('rlMatrixMode');
  late final _rlMatrixMode = _rlMatrixModePtr.asFunction<void Function(int)>();

  void rlPushMatrix()
    => _rlPushMatrix();
  late final _rlPushMatrixPtr = _lookup<NativeFunction<Void Function()>>('rlPushMatrix');
  late final _rlPushMatrix = _rlPushMatrixPtr.asFunction<void Function()>();

  void rlPopMatrix()
    => _rlPopMatrix();
  late final _rlPopMatrixPtr = _lookup<NativeFunction<Void Function()>>('rlPopMatrix');
  late final _rlPopMatrix = _rlPopMatrixPtr.asFunction<void Function()>();

  void rlLoadIdentity()
    => _rlLoadIdentity();
  late final _rlLoadIdentityPtr = _lookup<NativeFunction<Void Function()>>('rlLoadIdentity');
  late final _rlLoadIdentity = _rlLoadIdentityPtr.asFunction<void Function()>();

  void rlTranslatef(double x, double y, double z)
    => _rlTranslatef(x, y, z);
  late final _rlTranslatefPtr = _lookup<NativeFunction<Void Function(Float, Float, Float)>>('rlTranslatef');
  late final _rlTranslatef = _rlTranslatefPtr.asFunction<void Function(double, double, double)>();

  void rlRotatef(double angle, double x, double y, double z)
    => _rlRotatef(angle, x, y, z);
  late final _rlRotatefPtr = _lookup<NativeFunction<Void Function(Float, Float, Float, Float)>>('rlRotatef');
  late final _rlRotatef = _rlRotatefPtr.asFunction<void Function(double, double, double, double)>();

  void rlScalef(double x, double y, double z)
    => _rlScalef(x, y, z);
  late final _rlScalefPtr = _lookup<NativeFunction<Void Function(Float, Float, Float)>>('rlScalef');
  late final _rlScalef = _rlScalefPtr.asFunction<void Function(double, double, double)>();

  void rlMultMatrixf(Pointer<Float> matf)
    => _rlMultMatrixf(matf);
  late final _rlMultMatrixfPtr = _lookup<NativeFunction<Void Function(Pointer<Float>)>>('rlMultMatrixf');
  late final _rlMultMatrixf = _rlMultMatrixfPtr.asFunction<void Function(Pointer<Float>)>();

  void rlFrustum(double left,double right,double bottom,double top,double znear,double zfar)
    => _rlFrustum(left, right, bottom, top, znear, zfar);
  late final _rlFrustumPtr = _lookup<NativeFunction<Void Function(Double, Double, Double, Double, Double, Double)>>('rlFrustum');
  late final _rlFrustum = _rlFrustumPtr.asFunction<void Function(double, double, double, double, double, double)>();

  void rlOrtho(double left, double right, double bottom, double top, double znear, double zfar)
    => _rlOrtho(left, right, bottom, top, znear, zfar);
  late final _rlOrthoPtr = _lookup<NativeFunction<Void Function(Double, Double, Double, Double, Double, Double)>>('rlOrtho');
  late final _rlOrtho = _rlOrthoPtr.asFunction<void Function(double, double, double, double, double, double)>();

  void rlViewport(int x, int y, int width, int height)
    => _rlViewport(x, y, width, height);
  late final _rlViewportPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int)>>('rlViewport');
  late final _rlViewport = _rlViewportPtr.asFunction<void Function(int, int, int, int)>();

  void rlSetClipPlanes(double nearPlane, double farPlane)
    => _rlSetClipPlanes(nearPlane, farPlane);
  late final _rlSetClipPlanesPtr = _lookup<NativeFunction<Void Function(Double, Double)>>('rlSetClipPlanes');
  late final _rlSetClipPlanes = _rlSetClipPlanesPtr.asFunction<void Function(double, double)>();

  double rlGetCullDistanceNear()
    => _rlGetCullDistanceNear();
  late final _rlGetCullDistanceNearPtr = _lookup<NativeFunction<Double Function()>>('rlGetCullDistanceNear');
  late final _rlGetCullDistanceNear = _rlGetCullDistanceNearPtr.asFunction<double Function()>();

  double rlGetCullDistanceFar()
    => _rlGetCullDistanceFar();
  late final _rlGetCullDistanceFarPtr = _lookup<NativeFunction<Double Function()>>('rlGetCullDistanceFar');
  late final _rlGetCullDistanceFar = _rlGetCullDistanceFarPtr.asFunction<double Function()>();

  void rlBegin(int mode)
    => _rlBegin(mode);
  late final _rlBeginPtr = _lookup<NativeFunction<Void Function(Int)>>('rlBegin');
  late final _rlBegin = _rlBeginPtr.asFunction<void Function(int)>();

  void rlEnd()
    => _rlEnd();
  late final _rlEndPtr = _lookup<NativeFunction<Void Function()>>('rlEnd');
  late final _rlEnd = _rlEndPtr.asFunction<void Function()>();

  void rlVertex2i(int x, int y)
    => _rlVertex2i(x, y);
  late final _rlVertex2iPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('rlVertex2i');
  late final _rlVertex2i = _rlVertex2iPtr.asFunction<void Function(int, int)>();

  void rlVertex2f(double x, double y)
    => _rlVertex2f(x, y);
  late final _rlVertex2fPtr = _lookup<NativeFunction<Void Function(Float, Float)>>('rlVertex2f');
  late final _rlVertex2f = _rlVertex2fPtr.asFunction<void Function(double, double)>();

  void rlVertex3f(double x, double y, double z)
    => _rlVertex3f(x, y, z);
  late final _rlVertex3fPtr = _lookup<NativeFunction<Void Function(Float, Float, Float)>>('rlVertex3f');
  late final _rlVertex3f = _rlVertex3fPtr.asFunction<void Function(double, double, double)>();

  void rlTexCoord2f(double x, double y)
    => _rlTexCoord2f(x, y);
  late final _rlTexCoord2fPtr = _lookup<NativeFunction<Void Function(Float, Float)>>('rlTexCoord2f');
  late final _rlTexCoord2f = _rlTexCoord2fPtr.asFunction<void Function(double, double)>();

  void rlNormal3f(double x, double y, double z)
    => _rlNormal3f(x, y, z);
  late final _rlNormal3fPtr = _lookup<NativeFunction<Void Function(Float, Float, Float)>>('rlNormal3f');
  late final _rlNormal3f = _rlNormal3fPtr.asFunction<void Function(double, double, double)>();

  void rlColor4ub(int r, int g, int b, int a)
    => _rlColor4ub(r, g, b, a);
  late final _rlColor4ubPtr = _lookup<NativeFunction<Void Function(UnsignedChar, UnsignedChar, UnsignedChar, UnsignedChar)>>('rlColor4ub');
  late final _rlColor4ub = _rlColor4ubPtr.asFunction<void Function(int, int, int, int)>();

  void rlColor3f(double x, double y, double z)
    => _rlColor3f(x, y, z);
  late final _rlColor3fPtr = _lookup<NativeFunction<Void Function(Float, Float, Float)>>('rlColor3f');
  late final _rlColor3f = _rlColor3fPtr.asFunction<void Function(double, double, double)>();

  void rlColor4f(double x, double y, double z, double w)
    => _rlColor4f(x, y, z, w);
  late final _rlColor4fPtr = _lookup<NativeFunction<Void Function(Float, Float, Float, Float)>>('rlColor4f');
  late final _rlColor4f = _rlColor4fPtr.asFunction<void Function(double, double, double, double)>();

  bool rlEnableVertexArray(int vaoId)
    => _rlEnableVertexArray(vaoId);
  late final _rlEnableVertexArrayPtr = _lookup<NativeFunction<Bool Function(UnsignedInt)>>('rlEnableVertexArray');
  late final _rlEnableVertexArray = _rlEnableVertexArrayPtr.asFunction<bool Function(int)>();

  void rlDisableVertexArray()
    => _rlDisableVertexArray();
  late final _rlDisableVertexArrayPtr = _lookup<NativeFunction<Void Function()>>('rlDisableVertexArray');
  late final _rlDisableVertexArray = _rlDisableVertexArrayPtr.asFunction<void Function()>();

  void rlEnableVertexBuffer(int id)
    => _rlEnableVertexBuffer(id);
  late final _rlEnableVertexBufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlEnableVertexBuffer');
  late final _rlEnableVertexBuffer = _rlEnableVertexBufferPtr.asFunction<void Function(int)>();

  void rlDisableVertexBuffer()
    => _rlDisableVertexBuffer();
  late final _rlDisableVertexBufferPtr = _lookup<NativeFunction<Void Function()>>('rlDisableVertexBuffer');
  late final _rlDisableVertexBuffer = _rlDisableVertexBufferPtr.asFunction<void Function()>();

  void rlEnableVertexBufferElement(int id)
    => _rlEnableVertexBufferElement(id);
  late final _rlEnableVertexBufferElementPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlEnableVertexBufferElement');
  late final _rlEnableVertexBufferElement = _rlEnableVertexBufferElementPtr.asFunction<void Function(int)>();

  void rlDisableVertexBufferElement()
    => _rlDisableVertexBufferElement();
  late final _rlDisableVertexBufferElementPtr = _lookup<NativeFunction<Void Function()>>('rlDisableVertexBufferElement');
  late final _rlDisableVertexBufferElement = _rlDisableVertexBufferElementPtr.asFunction<void Function()>();

  void rlEnableVertexAttribute(int index)
    => _rlEnableVertexAttribute(index);
  late final _rlEnableVertexAttributePtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlEnableVertexAttribute');
  late final _rlEnableVertexAttribute = _rlEnableVertexAttributePtr.asFunction<void Function(int)>();

  void rlDisableVertexAttribute(int index)
    => _rlDisableVertexAttribute(index);
  late final _rlDisableVertexAttributePtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlDisableVertexAttribute');
  late final _rlDisableVertexAttribute = _rlDisableVertexAttributePtr.asFunction<void Function(int)>();

  void rlEnableStatePointer(int vertexAttribType, Pointer<Void> buffer)
    => _rlEnableStatePointer(vertexAttribType, buffer);
  late final _rlEnableStatePointerPtr = _lookup<NativeFunction<Void Function(Int, Pointer<Void>)>>('rlEnableStatePointer');
  late final _rlEnableStatePointer = _rlEnableStatePointerPtr.asFunction<void Function(int, Pointer<Void>)>();

  void rlDisableStatePointer(int vertexAttribType)
    => _rlDisableStatePointer(vertexAttribType);
  late final _rlDisableStatePointerPtr = _lookup<NativeFunction<Void Function(Int)>>('rlDisableStatePointer');
  late final _rlDisableStatePointer = _rlDisableStatePointerPtr.asFunction<void Function(int)>();

  void rlActiveTextureSlot(int slot)
    => _rlActiveTextureSlot(slot);
  late final _rlActiveTextureSlotPtr = _lookup<NativeFunction<Void Function(Int)>>('rlActiveTextureSlot');
  late final _rlActiveTextureSlot = _rlActiveTextureSlotPtr.asFunction<void Function(int)>();

  void rlEnableTexture(int id)
    => _rlEnableTexture(id);
  late final _rlEnableTexturePtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlEnableTexture');
  late final _rlEnableTexture = _rlEnableTexturePtr.asFunction<void Function(int)>();

  void rlDisableTexture()
    => _rlDisableTexture();
  late final _rlDisableTexturePtr = _lookup<NativeFunction<Void Function()>>('rlDisableTexture');
  late final _rlDisableTexture = _rlDisableTexturePtr.asFunction<void Function()>();

  void rlEnableTextureCubemap(int id)
    => _rlEnableTextureCubemap(id);
  late final _rlEnableTextureCubemapPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlEnableTextureCubemap');
  late final _rlEnableTextureCubemap = _rlEnableTextureCubemapPtr.asFunction<void Function(int)>();

  void rlDisableTextureCubemap()
    => _rlDisableTextureCubemap();
  late final _rlDisableTextureCubemapPtr = _lookup<NativeFunction<Void Function()>>('rlDisableTextureCubemap');
  late final _rlDisableTextureCubemap = _rlDisableTextureCubemapPtr.asFunction<void Function()>();

  void rlTextureParameters(int id, int param, int value)
    => _rlTextureParameters(id, param, value);
  late final _rlTextureParametersPtr = _lookup<NativeFunction<Void Function(UnsignedInt, Int, Int)>>('rlTextureParameters');
  late final _rlTextureParameters = _rlTextureParametersPtr.asFunction<void Function(int, int, int)>();

  void rlCubemapParameters(int id, int param, int value)
    => _rlCubemapParameters(id, param, value);
  late final _rlCubemapParametersPtr = _lookup<NativeFunction<Void Function(UnsignedInt, Int, Int)>>('rlCubemapParameters');
  late final _rlCubemapParameters = _rlCubemapParametersPtr.asFunction<void Function(int, int, int)>();

  void rlEnableShader(int id)
    => _rlEnableShader(id);
  late final _rlEnableShaderPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlEnableShader');
  late final _rlEnableShader = _rlEnableShaderPtr.asFunction<void Function(int)>();

  void rlDisableShader()
    => _rlDisableShader();
  late final _rlDisableShaderPtr = _lookup<NativeFunction<Void Function()>>('rlDisableShader');
  late final _rlDisableShader = _rlDisableShaderPtr.asFunction<void Function()>();

  void rlEnableFramebuffer(int id)
    => _rlEnableFramebuffer(id);
  late final _rlEnableFramebufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlEnableFramebuffer');
  late final _rlEnableFramebuffer = _rlEnableFramebufferPtr.asFunction<void Function(int)>();

  void rlDisableFramebuffer()
    => _rlDisableFramebuffer();
  late final _rlDisableFramebufferPtr = _lookup<NativeFunction<Void Function()>>('rlDisableFramebuffer');
  late final _rlDisableFramebuffer = _rlDisableFramebufferPtr.asFunction<void Function()>();

  int rlGetActiveFramebuffer()
    => _rlGetActiveFramebuffer();
  late final _rlGetActiveFramebufferPtr = _lookup<NativeFunction<UnsignedInt Function()>>('rlGetActiveFramebuffer');
  late final _rlGetActiveFramebuffer = _rlGetActiveFramebufferPtr.asFunction<int Function()>();

  void rlActiveDrawBuffers(int count)
    => _rlActiveDrawBuffers(count);
  late final _rlActiveDrawBuffersPtr = _lookup<NativeFunction<Void Function(Int)>>('rlActiveDrawBuffers');
  late final _rlActiveDrawBuffers = _rlActiveDrawBuffersPtr.asFunction<void Function(int)>();

  void rlBlitFramebuffer(int srcX, int srcY, int srcWidth, int srcHeight, int dstX, int dstY, int dstWidth, int dstHeight, int bufferMask)
    => _rlBlitFramebuffer(srcX, srcY, srcWidth, srcHeight, dstX, dstY, dstWidth, dstHeight, bufferMask);
  late final _rlBlitFramebufferPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, Int, Int, Int, Int, Int)>>('rlBlitFramebuffer');
  late final _rlBlitFramebuffer = _rlBlitFramebufferPtr.asFunction<void Function(int, int, int, int, int, int, int, int, int)>();

  void rlBindFramebuffer(int target, int framebuffer)
    => _rlBindFramebuffer(target, framebuffer);
  late final _rlBindFramebufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt, UnsignedInt)>>('rlBindFramebuffer');
  late final _rlBindFramebuffer = _rlBindFramebufferPtr.asFunction<void Function(int, int)>();

  void rlEnableColorBlend()
    => _rlEnableColorBlend();
  late final _rlEnableColorBlendPtr = _lookup<NativeFunction<Void Function()>>('rlEnableColorBlend');
  late final _rlEnableColorBlend = _rlEnableColorBlendPtr.asFunction<void Function()>();

  void rlDisableColorBlend()
    => _rlDisableColorBlend();
  late final _rlDisableColorBlendPtr = _lookup<NativeFunction<Void Function()>>('rlDisableColorBlend');
  late final _rlDisableColorBlend = _rlDisableColorBlendPtr.asFunction<void Function()>();

  void rlEnableDepthTest()
    => _rlEnableDepthTest();
  late final _rlEnableDepthTestPtr = _lookup<NativeFunction<Void Function()>>('rlEnableDepthTest');
  late final _rlEnableDepthTest = _rlEnableDepthTestPtr.asFunction<void Function()>();

  void rlDisableDepthTest()
    => _rlDisableDepthTest();
  late final _rlDisableDepthTestPtr = _lookup<NativeFunction<Void Function()>>('rlDisableDepthTest');
  late final _rlDisableDepthTest = _rlDisableDepthTestPtr.asFunction<void Function()>();

  void rlEnableDepthMask()
    => _rlEnableDepthMask();
  late final _rlEnableDepthMaskPtr = _lookup<NativeFunction<Void Function()>>('rlEnableDepthMask');
  late final _rlEnableDepthMask = _rlEnableDepthMaskPtr.asFunction<void Function()>();

  void rlDisableDepthMask()
    => _rlDisableDepthMask();
  late final _rlDisableDepthMaskPtr = _lookup<NativeFunction<Void Function()>>('rlDisableDepthMask');
  late final _rlDisableDepthMask = _rlDisableDepthMaskPtr.asFunction<void Function()>();

  void rlEnableBackfaceCulling()
    => _rlEnableBackfaceCulling();
  late final _rlEnableBackfaceCullingPtr = _lookup<NativeFunction<Void Function()>>('rlEnableBackfaceCulling');
  late final _rlEnableBackfaceCulling = _rlEnableBackfaceCullingPtr.asFunction<void Function()>();

  void rlDisableBackfaceCulling()
    => _rlDisableBackfaceCulling();
  late final _rlDisableBackfaceCullingPtr = _lookup<NativeFunction<Void Function()>>('rlDisableBackfaceCulling');
  late final _rlDisableBackfaceCulling = _rlDisableBackfaceCullingPtr.asFunction<void Function()>();

  void rlColorMask(bool r, bool g, bool b, bool a)
    => _rlColorMask(r, g, b, a);
  late final _rlColorMaskPtr = _lookup<NativeFunction<Void Function(Bool, Bool, Bool, Bool)>>('rlColorMask');
  late final _rlColorMask = _rlColorMaskPtr.asFunction<void Function(bool, bool, bool, bool)>();

  void rlSetCullFace(int mode)
    => _rlSetCullFace(mode);
  late final _rlSetCullFacePtr = _lookup<NativeFunction<Void Function(Int)>>('rlSetCullFace');
  late final _rlSetCullFace = _rlSetCullFacePtr.asFunction<void Function(int)>();

  void rlEnableScissorTest()
    => _rlEnableScissorTest();
  late final _rlEnableScissorTestPtr = _lookup<NativeFunction<Void Function()>>('rlEnableScissorTest');
  late final _rlEnableScissorTest = _rlEnableScissorTestPtr.asFunction<void Function()>();

  void rlDisableScissorTest()
    => _rlDisableScissorTest();
  late final _rlDisableScissorTestPtr = _lookup<NativeFunction<Void Function()>>('rlDisableScissorTest');
  late final _rlDisableScissorTest = _rlDisableScissorTestPtr.asFunction<void Function()>();

  void rlScissor(int x, int y, int width, int height)
    => _rlScissor(x, y, width, height);
  late final _rlScissorPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int)>>('rlScissor');
  late final _rlScissor = _rlScissorPtr.asFunction<void Function(int, int, int, int)>();

  void rlEnablePointMode()
    => _rlEnablePointMode();
  late final _rlEnablePointModePtr = _lookup<NativeFunction<Void Function()>>('rlEnablePointMode');
  late final _rlEnablePointMode = _rlEnablePointModePtr.asFunction<void Function()>();

  void rlDisablePointMode()
    => _rlDisablePointMode();
  late final _rlDisablePointModePtr = _lookup<NativeFunction<Void Function()>>('rlDisablePointMode');
  late final _rlDisablePointMode = _rlDisablePointModePtr.asFunction<void Function()>();

  void rlSetPointSize(double size)
    => _rlSetPointSize(size);
  late final _rlSetPointSizePtr = _lookup<NativeFunction<Void Function(Float)>>('rlSetPointSize');
  late final _rlSetPointSize = _rlSetPointSizePtr.asFunction<void Function(double)>();

  double rlGetPointSize()
    => _rlGetPointSize();
  late final _rlGetPointSizePtr = _lookup<NativeFunction<Float Function()>>('rlGetPointSize');
  late final _rlGetPointSize = _rlGetPointSizePtr.asFunction<double Function()>();

  void rlEnableWireMode()
    => _rlEnableWireMode();
  late final _rlEnableWireModePtr = _lookup<NativeFunction<Void Function()>>('rlEnableWireMode');
  late final _rlEnableWireMode = _rlEnableWireModePtr.asFunction<void Function()>();

  void rlDisableWireMode()
    => _rlDisableWireMode();
  late final _rlDisableWireModePtr = _lookup<NativeFunction<Void Function()>>('rlDisableWireMode');
  late final _rlDisableWireMode = _rlDisableWireModePtr.asFunction<void Function()>();

  void rlSetLineWidth(double width)
    => _rlSetLineWidth(width);
  late final _rlSetLineWidthPtr = _lookup<NativeFunction<Void Function(Float)>>('rlSetLineWidth');
  late final _rlSetLineWidth = _rlSetLineWidthPtr.asFunction<void Function(double)>();

  double rlGetLineWidth()
    => _rlGetLineWidth();
  late final _rlGetLineWidthPtr = _lookup<NativeFunction<Float Function()>>('rlGetLineWidth');
  late final _rlGetLineWidth = _rlGetLineWidthPtr.asFunction<double Function()>();

  void rlEnableSmoothLines()
    => _rlEnableSmoothLines();
  late final _rlEnableSmoothLinesPtr = _lookup<NativeFunction<Void Function()>>('rlEnableSmoothLines');
  late final _rlEnableSmoothLines = _rlEnableSmoothLinesPtr.asFunction<void Function()>();

  void rlDisableSmoothLines()
    => _rlDisableSmoothLines();
  late final _rlDisableSmoothLinesPtr = _lookup<NativeFunction<Void Function()>>('rlDisableSmoothLines');
  late final _rlDisableSmoothLines = _rlDisableSmoothLinesPtr.asFunction<void Function()>();

  void rlEnableStereoRender()
    => _rlEnableStereoRender();
  late final _rlEnableStereoRenderPtr = _lookup<NativeFunction<Void Function()>>('rlEnableStereoRender');
  late final _rlEnableStereoRender = _rlEnableStereoRenderPtr.asFunction<void Function()>();

  void rlDisableStereoRender()
    => _rlDisableStereoRender();
  late final _rlDisableStereoRenderPtr = _lookup<NativeFunction<Void Function()>>('rlDisableStereoRender');
  late final _rlDisableStereoRender = _rlDisableStereoRenderPtr.asFunction<void Function()>();

  bool rlIsStereoRenderEnabled()
    => _rlIsStereoRenderEnabled();
  late final _rlIsStereoRenderEnabledPtr = _lookup<NativeFunction<Bool Function()>>('rlIsStereoRenderEnabled');
  late final _rlIsStereoRenderEnabled = _rlIsStereoRenderEnabledPtr.asFunction<bool Function()>();

  void rlClearColor(int r, int g, int b, int a)
    => _rlClearColor(r, g, b, a);
  late final _rlClearColorPtr = _lookup<NativeFunction<Void Function(UnsignedChar, UnsignedChar, UnsignedChar, UnsignedChar)>>('rlClearColor');
  late final _rlClearColor = _rlClearColorPtr.asFunction<void Function(int, int, int, int)>();

  void rlClearScreenBuffers()
    => _rlClearScreenBuffers();
  late final _rlClearScreenBuffersPtr = _lookup<NativeFunction<Void Function()>>('rlClearScreenBuffers');
  late final _rlClearScreenBuffers = _rlClearScreenBuffersPtr.asFunction<void Function()>();

  void rlCheckErrors()
    => _rlCheckErrors();
  late final _rlCheckErrorsPtr = _lookup<NativeFunction<Void Function()>>('rlCheckErrors');
  late final _rlCheckErrors = _rlCheckErrorsPtr.asFunction<void Function()>();

  void rlSetBlendMode(int mode)
    => _rlSetBlendMode(mode);
  late final _rlSetBlendModePtr = _lookup<NativeFunction<Void Function(Int)>>('rlSetBlendMode');
  late final _rlSetBlendMode = _rlSetBlendModePtr.asFunction<void Function(int)>();

  void rlSetBlendFactors(int glSrcFactor, int glDstFactor, int glEquation)
    => _rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation);
  late final _rlSetBlendFactorsPtr = _lookup<NativeFunction<Void Function(Int, Int, Int)>>('rlSetBlendFactors');
  late final _rlSetBlendFactors = _rlSetBlendFactorsPtr.asFunction<void Function(int, int, int)>();

  void rlSetBlendFactorsSeparate(int glSrcRGB, int glDstRGB, int glSrcAlpha, int glDstAlpha, int glEqRGB, int glEqAlpha)
    => _rlSetBlendFactorsSeparate(glSrcRGB, glDstRGB, glSrcAlpha, glDstAlpha, glEqRGB, glEqAlpha);
  late final _rlSetBlendFactorsSeparatePtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, Int, Int)>>('rlSetBlendFactorsSeparate');
  late final _rlSetBlendFactorsSeparate = _rlSetBlendFactorsSeparatePtr.asFunction<void Function(int, int, int, int, int, int)>();

  void rlglInit(int width, int height)
    => _rlglInit(width, height);
  late final _rlglInitPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('rlglInit');
  late final _rlglInit = _rlglInitPtr.asFunction<void Function(int, int)>();

  void rlglClose()
    => _rlglClose();
  late final _rlglClosePtr = _lookup<NativeFunction<Void Function()>>('rlglClose');
  late final _rlglClose = _rlglClosePtr.asFunction<void Function()>();

  void rlLoadExtensions(Pointer<Void> loader)
    => _rlLoadExtensions(loader);
  late final _rlLoadExtensionsPtr = _lookup<NativeFunction<Void Function(Pointer<Void>)>>('rlLoadExtensions');
  late final _rlLoadExtensions = _rlLoadExtensionsPtr.asFunction<void Function(Pointer<Void>)>();

  Pointer<Void> rlGetProcAddress(Pointer<Char> procName)
    => _rlGetProcAddress(procName);
  late final _rlGetProcAddressPtr = _lookup<NativeFunction<Pointer<Void> Function(Pointer<Char>)>>('rlGetProcAddress');
  late final _rlGetProcAddress = _rlGetProcAddressPtr.asFunction<Pointer<Void> Function(Pointer<Char>)>();

  int rlGetVersion()
    => _rlGetVersion();
  late final _rlGetVersionPtr = _lookup<NativeFunction<Int Function()>>('rlGetVersion');
  late final _rlGetVersion = _rlGetVersionPtr.asFunction<int Function()>();

  void rlSetFramebufferWidth(int width)
    => _rlSetFramebufferWidth(width);
  late final _rlSetFramebufferWidthPtr = _lookup<NativeFunction<Void Function(Int)>>('rlSetFramebufferWidth');
  late final _rlSetFramebufferWidth = _rlSetFramebufferWidthPtr.asFunction<void Function(int)>();

  int rlGetFramebufferWidth()
    => _rlGetFramebufferWidth();
  late final _rlGetFramebufferWidthPtr = _lookup<NativeFunction<Int Function()>>('rlGetFramebufferWidth');
  late final _rlGetFramebufferWidth = _rlGetFramebufferWidthPtr.asFunction<int Function()>();

  void rlSetFramebufferHeight(int height)
    => _rlSetFramebufferHeight(height);
  late final _rlSetFramebufferHeightPtr = _lookup<NativeFunction<Void Function(Int)>>('rlSetFramebufferHeight');
  late final _rlSetFramebufferHeight = _rlSetFramebufferHeightPtr.asFunction<void Function(int)>();

  int rlGetFramebufferHeight()
    => _rlGetFramebufferHeight();
  late final _rlGetFramebufferHeightPtr = _lookup<NativeFunction<Int Function()>>('rlGetFramebufferHeight');
  late final _rlGetFramebufferHeight = _rlGetFramebufferHeightPtr.asFunction<int Function()>();

  int rlGetTextureIdDefault()
    => _rlGetTextureIdDefault();
  late final _rlGetTextureIdDefaultPtr = _lookup<NativeFunction<UnsignedInt Function()>>('rlGetTextureIdDefault');
  late final _rlGetTextureIdDefault = _rlGetTextureIdDefaultPtr.asFunction<int Function()>();

  int rlGetShaderIdDefault()
    => _rlGetShaderIdDefault();
  late final _rlGetShaderIdDefaultPtr = _lookup<NativeFunction<UnsignedInt Function()>>('rlGetShaderIdDefault');
  late final _rlGetShaderIdDefault = _rlGetShaderIdDefaultPtr.asFunction<int Function()>();

  Pointer<Int> rlGetShaderLocsDefault()
    => _rlGetShaderLocsDefault();
  late final _rlGetShaderLocsDefaultPtr = _lookup<NativeFunction<Pointer<Int> Function()>>('rlGetShaderLocsDefault');
  late final _rlGetShaderLocsDefault = _rlGetShaderLocsDefaultPtr.asFunction<Pointer<Int> Function()>();

  RlRenderBatchC rlLoadRenderBatch(int numBuffers, int bufferElements)
    => _rlLoadRenderBatch(numBuffers, bufferElements);
  late final _rlLoadRenderBatchPtr = _lookup<NativeFunction<RlRenderBatchC Function(Int, Int)>>('rlLoadRenderBatch');
  late final _rlLoadRenderBatch = _rlLoadRenderBatchPtr.asFunction<RlRenderBatchC Function(int, int)>();

  void rlUnloadRenderBatch(RlRenderBatchC batch)
    => _rlUnloadRenderBatch(batch);
  late final _rlUnloadRenderBatchPtr = _lookup<NativeFunction<Void Function(RlRenderBatchC)>>('rlUnloadRenderBatch');
  late final _rlUnloadRenderBatch = _rlUnloadRenderBatchPtr.asFunction<void Function(RlRenderBatchC)>();

  void rlDrawRenderBatch(Pointer<RlRenderBatchC> batch)
    => _rlDrawRenderBatch(batch);
  late final _rlDrawRenderBatchPtr = _lookup<NativeFunction<Void Function(Pointer<RlRenderBatchC>)>>('rlDrawRenderBatch');
  late final _rlDrawRenderBatch = _rlDrawRenderBatchPtr.asFunction<void Function(Pointer<RlRenderBatchC>)>();

  void rlSetRenderBatchActive(Pointer<RlRenderBatchC> batch)
    => _rlSetRenderBatchActive(batch);
  late final _rlSetRenderBatchActivePtr = _lookup<NativeFunction<Void Function(Pointer<RlRenderBatchC>)>>('rlSetRenderBatchActive');
  late final _rlSetRenderBatchActive = _rlSetRenderBatchActivePtr.asFunction<void Function(Pointer<RlRenderBatchC>)>();

  void rlDrawRenderBatchActive()
    => _rlDrawRenderBatchActive();
  late final _rlDrawRenderBatchActivePtr = _lookup<NativeFunction<Void Function()>>('rlDrawRenderBatchActive');
  late final _rlDrawRenderBatchActive = _rlDrawRenderBatchActivePtr.asFunction<void Function()>();

  bool rlCheckRenderBatchLimit(int vCount)
    => _rlCheckRenderBatchLimit(vCount);
  late final _rlCheckRenderBatchLimitPtr = _lookup<NativeFunction<Bool Function(Int)>>('rlCheckRenderBatchLimit');
  late final _rlCheckRenderBatchLimit = _rlCheckRenderBatchLimitPtr.asFunction<bool Function(int)>();

  void rlSetTexture(int id)
    => _rlSetTexture(id);
  late final _rlSetTexturePtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlSetTexture');
  late final _rlSetTexture = _rlSetTexturePtr.asFunction<void Function(int)>();

  int rlLoadVertexArray()
    => _rlLoadVertexArray();
  late final _rlLoadVertexArrayPtr = _lookup<NativeFunction<UnsignedInt Function()>>('rlLoadVertexArray');
  late final _rlLoadVertexArray = _rlLoadVertexArrayPtr.asFunction<int Function()>();

  int rlLoadVertexBuffer(Pointer<Void> buffer, int size, bool dynamic)
    => _rlLoadVertexBuffer(buffer, size, dynamic);
  late final _rlLoadVertexBufferPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Void>, Int, Bool)>>('rlLoadVertexBuffer');
  late final _rlLoadVertexBuffer = _rlLoadVertexBufferPtr.asFunction<int Function(Pointer<Void>, int, bool)>();

  int rlLoadVertexBufferElement(Pointer<Void> buffer, int size, bool dynamic)
    => _rlLoadVertexBufferElement(buffer, size, dynamic);
  late final _rlLoadVertexBufferElementPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Void>, Int, Bool)>>('rlLoadVertexBufferElement');
  late final _rlLoadVertexBufferElement = _rlLoadVertexBufferElementPtr.asFunction<int Function(Pointer<Void>, int, bool)>();

  void rlUpdateVertexBuffer(int bufferId, Pointer<Void> data, int dataSize, int offset)
    => _rlUpdateVertexBuffer(bufferId, data, dataSize, offset);
  late final _rlUpdateVertexBufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt, Pointer<Void>, Int, Int)>>('rlUpdateVertexBuffer');
  late final _rlUpdateVertexBuffer = _rlUpdateVertexBufferPtr.asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlUpdateVertexBufferElements(int id, Pointer<Void> data, int dataSize, int offset)
    => _rlUpdateVertexBufferElements(id, data, dataSize, offset);
  late final _rlUpdateVertexBufferElementsPtr = _lookup<NativeFunction<Void Function(UnsignedInt, Pointer<Void>, Int, Int)>>('rlUpdateVertexBufferElements');
  late final _rlUpdateVertexBufferElements = _rlUpdateVertexBufferElementsPtr.asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlUnloadVertexArray(int vaoId)
    => _rlUnloadVertexArray(vaoId);
  late final _rlUnloadVertexArrayPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlUnloadVertexArray');
  late final _rlUnloadVertexArray = _rlUnloadVertexArrayPtr.asFunction<void Function(int)>();

  void rlUnloadVertexBuffer(int vboId)
    => _rlUnloadVertexBuffer(vboId);
  late final _rlUnloadVertexBufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlUnloadVertexBuffer');
  late final _rlUnloadVertexBuffer = _rlUnloadVertexBufferPtr.asFunction<void Function(int)>();

  void rlSetVertexAttribute(int index, int compSize, int type, bool normalized, int stride, int offset)
    => _rlSetVertexAttribute(index, compSize, type, normalized, stride, offset);
  late final _rlSetVertexAttributePtr = _lookup<NativeFunction<Void Function(UnsignedInt, Int, Int, Bool, Int, Int)>>('rlSetVertexAttribute');
  late final _rlSetVertexAttribute = _rlSetVertexAttributePtr.asFunction<void Function(int, int, int, bool, int, int)>();

  void rlSetVertexAttributeDivisor(int index, int divisor)
    => _rlSetVertexAttributeDivisor(index, divisor);
  late final _rlSetVertexAttributeDivisorPtr = _lookup<NativeFunction<Void Function(UnsignedInt, Int)>>('rlSetVertexAttributeDivisor');
  late final _rlSetVertexAttributeDivisor = _rlSetVertexAttributeDivisorPtr.asFunction<void Function(int, int)>();

  void rlSetVertexAttributeDefault(int locIndex, Pointer<Void> value, int attribType, int count)
    => _rlSetVertexAttributeDefault(locIndex, value, attribType, count);
  late final _rlSetVertexAttributeDefaultPtr = _lookup<NativeFunction<Void Function(Int, Pointer<Void>, Int, Int)>>('rlSetVertexAttributeDefault');
  late final _rlSetVertexAttributeDefault = _rlSetVertexAttributeDefaultPtr.asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlDrawVertexArray(int offset, int count)
    => _rlDrawVertexArray(offset, count);
  late final _rlDrawVertexArrayPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('rlDrawVertexArray');
  late final _rlDrawVertexArray = _rlDrawVertexArrayPtr.asFunction<void Function(int, int)>();

  void rlDrawVertexArrayElements(int offset, int count, Pointer<Void> buffer)
    => _rlDrawVertexArrayElements(offset, count, buffer);
  late final _rlDrawVertexArrayElementsPtr = _lookup<NativeFunction<Void Function(Int, Int, Pointer<Void>)>>('rlDrawVertexArrayElements');
  late final _rlDrawVertexArrayElements = _rlDrawVertexArrayElementsPtr.asFunction<void Function(int, int, Pointer<Void>)>();

  void rlDrawVertexArrayInstanced(int offset, int count, int instances)
    => _rlDrawVertexArrayInstanced(offset, count, instances);
  late final _rlDrawVertexArrayInstancedPtr = _lookup<NativeFunction<Void Function(Int, Int, Int)>>('rlDrawVertexArrayInstanced');
  late final _rlDrawVertexArrayInstanced = _rlDrawVertexArrayInstancedPtr.asFunction<void Function(int, int, int)>();

  void rlDrawVertexArrayElementsInstanced(int offset, int count, Pointer<Void> buffer, int instances)
    => _rlDrawVertexArrayElementsInstanced(offset, count, buffer, instances);
  late final _rlDrawVertexArrayElementsInstancedPtr = _lookup<NativeFunction<Void Function(Int, Int, Pointer<Void>, Int)>>('rlDrawVertexArrayElementsInstanced');
  late final _rlDrawVertexArrayElementsInstanced = _rlDrawVertexArrayElementsInstancedPtr.asFunction<void Function(int, int, Pointer<Void>, int)>();

  int rlLoadTexture(Pointer<Void> data, int width, int height, int format, int mipmapCount)
    => _rlLoadTexture(data, width, height, format, mipmapCount);
  late final _rlLoadTexturePtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Void>, Int, Int, Int, Int)>>('rlLoadTexture');
  late final _rlLoadTexture = _rlLoadTexturePtr.asFunction<int Function(Pointer<Void>, int, int, int, int)>();

  int rlLoadTextureDepth(int width, int height, bool useRenderBuffer)
    => _rlLoadTextureDepth(width, height, useRenderBuffer);
  late final _rlLoadTextureDepthPtr = _lookup<NativeFunction<UnsignedInt Function(Int, Int, Bool)>>('rlLoadTextureDepth');
  late final _rlLoadTextureDepth = _rlLoadTextureDepthPtr.asFunction<int Function(int, int, bool)>();

  int rlLoadTextureCubemap(Pointer<Void> data, int size, int format, int mipmapCount)
    => _rlLoadTextureCubemap(data, size, format, mipmapCount);
  late final _rlLoadTextureCubemapPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Void>, Int, Int, Int)>>('rlLoadTextureCubemap');
  late final _rlLoadTextureCubemap = _rlLoadTextureCubemapPtr.asFunction<int Function(Pointer<Void>, int, int, int)>();

  void rlUpdateTexture(int id, int offsetX, int offsetY, int width, int height, int format, Pointer<Void> data)
    => _rlUpdateTexture(id, offsetX, offsetY, width, height, format, data);
  late final _rlUpdateTexturePtr = _lookup<NativeFunction<Void Function(UnsignedInt, Int, Int, Int, Int, Int, Pointer<Void>)>>('rlUpdateTexture');
  late final _rlUpdateTexture = _rlUpdateTexturePtr.asFunction<void Function(int, int, int, int, int, int, Pointer<Void>)>();

  void rlGetGlTextureFormats(int format, Pointer<UnsignedInt> glInternalFormat, Pointer<UnsignedInt> glFormat, Pointer<UnsignedInt> glType)
    => _rlGetGlTextureFormats(format, glInternalFormat, glFormat, glType);
  late final _rlGetGlTextureFormatsPtr = _lookup<NativeFunction<Void Function(Int, Pointer<UnsignedInt>, Pointer<UnsignedInt>, Pointer<UnsignedInt>)>>('rlGetGlTextureFormats');
  late final _rlGetGlTextureFormats = _rlGetGlTextureFormatsPtr.asFunction<void Function(int, Pointer<UnsignedInt>, Pointer<UnsignedInt>, Pointer<UnsignedInt>)>();

  Pointer<Char> rlGetPixelFormatName(int format)
    => _rlGetPixelFormatName(format);
  late final _rlGetPixelFormatNamePtr = _lookup<NativeFunction<Pointer<Char> Function(UnsignedInt)>>('rlGetPixelFormatName');
  late final _rlGetPixelFormatName = _rlGetPixelFormatNamePtr.asFunction<Pointer<Char> Function(int)>();

  void rlUnloadTexture(int id)
    => _rlUnloadTexture(id);
  late final _rlUnloadTexturePtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlUnloadTexture');
  late final _rlUnloadTexture = _rlUnloadTexturePtr.asFunction<void Function(int)>();

  void rlGenTextureMipmaps(int id, int width, int height, int format, Pointer<Int> mipmaps)
    => _rlGenTextureMipmaps(id, width, height, format, mipmaps);
  late final _rlGenTextureMipmapsPtr = _lookup<NativeFunction<Void Function(UnsignedInt, Int, Int, Int, Pointer<Int>)>>('rlGenTextureMipmaps');
  late final _rlGenTextureMipmaps = _rlGenTextureMipmapsPtr.asFunction<void Function(int, int, int, int, Pointer<Int>)>();

  Pointer<Void> rlReadTexturePixels(int id, int width, int height, int format)
    => _rlReadTexturePixels(id, width, height, format);
  late final _rlReadTexturePixelsPtr = _lookup<NativeFunction<Pointer<Void> Function(UnsignedInt, Int, Int, Int)>>('rlReadTexturePixels');
  late final _rlReadTexturePixels = _rlReadTexturePixelsPtr.asFunction<Pointer<Void> Function(int, int, int, int)>();

  Pointer<UnsignedChar> rlReadScreenPixels(int width, int height)
    => _rlReadScreenPixels(width, height);
  late final _rlReadScreenPixelsPtr = _lookup<NativeFunction<Pointer<UnsignedChar> Function(Int, Int)>>('rlReadScreenPixels');
  late final _rlReadScreenPixels = _rlReadScreenPixelsPtr.asFunction<Pointer<UnsignedChar> Function(int, int)>();

  int rlLoadFramebuffer()
    => _rlLoadFramebuffer();
  late final _rlLoadFramebufferPtr = _lookup<NativeFunction<UnsignedInt Function()>>('rlLoadFramebuffer');
  late final _rlLoadFramebuffer = _rlLoadFramebufferPtr.asFunction<int Function()>();

  void rlFramebufferAttach(int fboId, int texId, int attachType, int texType, int mipLevel)
    => _rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel);
  late final _rlFramebufferAttachPtr = _lookup<NativeFunction<Void Function(UnsignedInt, UnsignedInt, Int, Int, Int)>>('rlFramebufferAttach');
  late final _rlFramebufferAttach = _rlFramebufferAttachPtr.asFunction<void Function(int, int, int, int, int)>();

  bool rlFramebufferComplete(int id)
    => _rlFramebufferComplete(id);
  late final _rlFramebufferCompletePtr = _lookup<NativeFunction<Bool Function(UnsignedInt)>>('rlFramebufferComplete');
  late final _rlFramebufferComplete = _rlFramebufferCompletePtr.asFunction<bool Function(int)>();

  void rlUnloadFramebuffer(int id)
    => _rlUnloadFramebuffer(id);
  late final _rlUnloadFramebufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlUnloadFramebuffer');
  late final _rlUnloadFramebuffer = _rlUnloadFramebufferPtr.asFunction<void Function(int)>();

  void rlCopyFramebuffer(int x, int y, int width, int height, int format, Pointer<Void> pixels)
    => _rlCopyFramebuffer(x, y, width, height, format, pixels);
  late final _rlCopyFramebufferPtr = _lookup<NativeFunction<Void Function(Int, Int, Int, Int, Int, Pointer<Void>)>>('rlCopyFramebuffer');
  late final _rlCopyFramebuffer = _rlCopyFramebufferPtr.asFunction<void Function(int, int, int, int, int, Pointer<Void>)>();

  void rlResizeFramebuffer(int width, int height)
    => _rlResizeFramebuffer(width, height);
  late final _rlResizeFramebufferPtr = _lookup<NativeFunction<Void Function(Int, Int)>>('rlResizeFramebuffer');
  late final _rlResizeFramebuffer = _rlResizeFramebufferPtr.asFunction<void Function(int, int)>();

  int rlLoadShader(Pointer<Char> code, int type)
    => _rlLoadShader(code, type);
  late final _rlLoadShaderPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Char>, Int)>>('rlLoadShader');
  late final _rlLoadShader = _rlLoadShaderPtr.asFunction<int Function(Pointer<Char>, int)>();

  int rlLoadShaderProgram(Pointer<Char> vsCode, Pointer<Char> fsCode)
    => _rlLoadShaderProgram(vsCode, fsCode);
  late final _rlLoadShaderProgramPtr = _lookup<NativeFunction<UnsignedInt Function(Pointer<Char>, Pointer<Char>)>>('rlLoadShaderProgram');
  late final _rlLoadShaderProgram = _rlLoadShaderProgramPtr.asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  int rlLoadShaderProgramEx(int vsId, int fsId)
    => _rlLoadShaderProgramEx(vsId, fsId);
  late final _rlLoadShaderProgramExPtr = _lookup<NativeFunction<UnsignedInt Function(UnsignedInt, UnsignedInt)>>('rlLoadShaderProgramEx');
  late final _rlLoadShaderProgramEx = _rlLoadShaderProgramExPtr.asFunction<int Function(int, int)>();

  int rlLoadShaderProgramCompute(int csId)
    => _rlLoadShaderProgramCompute(csId);
  late final _rlLoadShaderProgramComputePtr = _lookup<NativeFunction<UnsignedInt Function(UnsignedInt)>>('rlLoadShaderProgramCompute');
  late final _rlLoadShaderProgramCompute = _rlLoadShaderProgramComputePtr.asFunction<int Function(int)>();

  void rlUnloadShader(int id)
    => _rlUnloadShader(id);
  late final _rlUnloadShaderPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlUnloadShader');
  late final _rlUnloadShader = _rlUnloadShaderPtr.asFunction<void Function(int)>();

  void rlUnloadShaderProgram(int id)
    => _rlUnloadShaderProgram(id);
  late final _rlUnloadShaderProgramPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlUnloadShaderProgram');
  late final _rlUnloadShaderProgram = _rlUnloadShaderProgramPtr.asFunction<void Function(int)>();

  int rlGetLocationUniform(int shaderId, Pointer<Char> uniformName)
    => _rlGetLocationUniform(shaderId, uniformName);
  late final _rlGetLocationUniformPtr = _lookup<NativeFunction<Int Function(UnsignedInt, Pointer<Char>)>>('rlGetLocationUniform');
  late final _rlGetLocationUniform = _rlGetLocationUniformPtr.asFunction<int Function(int, Pointer<Char>)>();

  int rlGetLocationAttrib(int shaderId, Pointer<Char> attribName)
    => _rlGetLocationAttrib(shaderId, attribName);
  late final _rlGetLocationAttribPtr = _lookup<NativeFunction<Int Function(UnsignedInt, Pointer<Char>)>>('rlGetLocationAttrib');
  late final _rlGetLocationAttrib = _rlGetLocationAttribPtr.asFunction<int Function(int, Pointer<Char>)>();

  void rlSetUniform(int locIndex, Pointer<Void> value, int uniformType, int count)
    => _rlSetUniform(locIndex, value, uniformType, count);
  late final _rlSetUniformPtr = _lookup<NativeFunction<Void Function(Int, Pointer<Void>, Int, Int)>>('rlSetUniform');
  late final _rlSetUniform = _rlSetUniformPtr.asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlSetUniformMatrix(int locIndex, MatrixC mat)
    => _rlSetUniformMatrix(locIndex, mat);
  late final _rlSetUniformMatrixPtr = _lookup<NativeFunction<Void Function(Int, MatrixC)>>('rlSetUniformMatrix');
  late final _rlSetUniformMatrix = _rlSetUniformMatrixPtr.asFunction<void Function(int, MatrixC)>();

  void rlSetUniformMatrices(int locIndex, Pointer<MatrixC> mat, int count)
    => _rlSetUniformMatrices(locIndex, mat, count);
  late final _rlSetUniformMatricesPtr = _lookup<NativeFunction<Void Function(Int, Pointer<MatrixC>, Int)>>('rlSetUniformMatrices');
  late final _rlSetUniformMatrices = _rlSetUniformMatricesPtr.asFunction<void Function(int, Pointer<MatrixC>, int)>();

  void rlSetUniformSampler(int locIndex, int textureId)
    => _rlSetUniformSampler(locIndex, textureId);
  late final _rlSetUniformSamplerPtr = _lookup<NativeFunction<Void Function(Int, UnsignedInt)>>('rlSetUniformSampler');
  late final _rlSetUniformSampler = _rlSetUniformSamplerPtr.asFunction<void Function(int, int)>();

  void rlSetShader(int id, Pointer<Int> locs)
    => _rlSetShader(id, locs);
  late final _rlSetShaderPtr = _lookup<NativeFunction<Void Function(UnsignedInt, Pointer<Int>)>>('rlSetShader');
  late final _rlSetShader = _rlSetShaderPtr.asFunction<void Function(int, Pointer<Int>)>();

  void rlComputeShaderDispatch(int groupX, int groupY, int groupZ)
    => _rlComputeShaderDispatch(groupX, groupY, groupZ);
  late final _rlComputeShaderDispatchPtr = _lookup<NativeFunction<Void Function(UnsignedInt, UnsignedInt, UnsignedInt)>>('rlComputeShaderDispatch');
  late final _rlComputeShaderDispatch = _rlComputeShaderDispatchPtr.asFunction<void Function(int, int, int)>();

  int rlLoadShaderBuffer(int size, Pointer<Void> data, int usageHint)
    => _rlLoadShaderBuffer(size, data, usageHint);
  late final _rlLoadShaderBufferPtr = _lookup<NativeFunction<UnsignedInt Function(UnsignedInt, Pointer<Void>, Int)>>('rlLoadShaderBuffer');
  late final _rlLoadShaderBuffer = _rlLoadShaderBufferPtr.asFunction<int Function(int, Pointer<Void>, int)>();

  void rlUnloadShaderBuffer(int ssboId)
    => _rlUnloadShaderBuffer(ssboId);
  late final _rlUnloadShaderBufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt)>>('rlUnloadShaderBuffer');
  late final _rlUnloadShaderBuffer = _rlUnloadShaderBufferPtr.asFunction<void Function(int)>();

  void rlUpdateShaderBuffer(int id, Pointer<Void> data, int dataSize, int offset)
    => _rlUpdateShaderBuffer(id, data, dataSize, offset);
  late final _rlUpdateShaderBufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt, Pointer<Void>, UnsignedInt, UnsignedInt)>>('rlUpdateShaderBuffer');
  late final _rlUpdateShaderBuffer = _rlUpdateShaderBufferPtr.asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlBindShaderBuffer(int id, int index)
    => _rlBindShaderBuffer(id, index);
  late final _rlBindShaderBufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt, UnsignedInt)>>('rlBindShaderBuffer');
  late final _rlBindShaderBuffer = _rlBindShaderBufferPtr.asFunction<void Function(int, int)>();

  void rlReadShaderBuffer(int id, Pointer<Void> dest, int count, int offset)
    => _rlReadShaderBuffer(id, dest, count, offset);
  late final _rlReadShaderBufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt, Pointer<Void>, UnsignedInt, UnsignedInt)>>('rlReadShaderBuffer');
  late final _rlReadShaderBuffer = _rlReadShaderBufferPtr.asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlCopyShaderBuffer(int destId, int srcId, int destOffset, int srcOffset, int count)
    => _rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count);
  late final _rlCopyShaderBufferPtr = _lookup<NativeFunction<Void Function(UnsignedInt, UnsignedInt, UnsignedInt, UnsignedInt, UnsignedInt)>>('rlCopyShaderBuffer');
  late final _rlCopyShaderBuffer = _rlCopyShaderBufferPtr.asFunction<void Function(int, int, int, int, int)>();

  int rlGetShaderBufferSize(int id)
    => _rlGetShaderBufferSize(id);
  late final _rlGetShaderBufferSizePtr = _lookup<NativeFunction<UnsignedInt Function(UnsignedInt)>>('rlGetShaderBufferSize');
  late final _rlGetShaderBufferSize = _rlGetShaderBufferSizePtr.asFunction<int Function(int)>();

  void rlBindImageTexture(int id, int index, int format, bool readonly)
    => _rlBindImageTexture(id, index, format, readonly);
  late final _rlBindImageTexturePtr = _lookup<NativeFunction<Void Function(UnsignedInt, UnsignedInt, Int, Bool)>>('rlBindImageTexture');
  late final _rlBindImageTexture = _rlBindImageTexturePtr.asFunction<void Function(int, int, int, bool)>();

  MatrixC rlGetMatrixModelview()
    => _rlGetMatrixModelview();
  late final _rlGetMatrixModelviewPtr = _lookup<NativeFunction<MatrixC Function()>>('rlGetMatrixModelview');
  late final _rlGetMatrixModelview = _rlGetMatrixModelviewPtr.asFunction<MatrixC Function()>();

  MatrixC rlGetMatrixProjection()
    => _rlGetMatrixProjection();
  late final _rlGetMatrixProjectionPtr = _lookup<NativeFunction<MatrixC Function()>>('rlGetMatrixProjection');
  late final _rlGetMatrixProjection = _rlGetMatrixProjectionPtr.asFunction<MatrixC Function()>();

  MatrixC rlGetMatrixTransform()
    => _rlGetMatrixTransform();
  late final _rlGetMatrixTransformPtr = _lookup<NativeFunction<MatrixC Function()>>('rlGetMatrixTransform');
  late final _rlGetMatrixTransform = _rlGetMatrixTransformPtr.asFunction<MatrixC Function()>();

  MatrixC rlGetMatrixProjectionStereo(int eye)
    => _rlGetMatrixProjectionStereo(eye);
  late final _rlGetMatrixProjectionStereoPtr = _lookup<NativeFunction<MatrixC Function(Int)>>('rlGetMatrixProjectionStereo');
  late final _rlGetMatrixProjectionStereo = _rlGetMatrixProjectionStereoPtr.asFunction<MatrixC Function(int)>();

  MatrixC rlGetMatrixViewOffsetStereo(int eye)
    => _rlGetMatrixViewOffsetStereo(eye);
  late final _rlGetMatrixViewOffsetStereoPtr = _lookup<NativeFunction<MatrixC Function(Int)>>('rlGetMatrixViewOffsetStereo');
  late final _rlGetMatrixViewOffsetStereo = _rlGetMatrixViewOffsetStereoPtr.asFunction<MatrixC Function(int)>();

  void rlSetMatrixProjection(MatrixC proj)
    => _rlSetMatrixProjection(proj);
  late final _rlSetMatrixProjectionPtr = _lookup<NativeFunction<Void Function(MatrixC)>>('rlSetMatrixProjection');
  late final _rlSetMatrixProjection = _rlSetMatrixProjectionPtr.asFunction<void Function(MatrixC)>();

  void rlSetMatrixModelview(MatrixC view)
    => _rlSetMatrixModelview(view);
  late final _rlSetMatrixModelviewPtr = _lookup<NativeFunction<Void Function(MatrixC)>>('rlSetMatrixModelview');
  late final _rlSetMatrixModelview = _rlSetMatrixModelviewPtr.asFunction<void Function(MatrixC)>();

  void rlSetMatrixProjectionStereo(MatrixC right, MatrixC left)
    => _rlSetMatrixProjectionStereo(right, left);
  late final _rlSetMatrixProjectionStereoPtr = _lookup<NativeFunction<Void Function(MatrixC, MatrixC)>>('rlSetMatrixProjectionStereo');
  late final _rlSetMatrixProjectionStereo = _rlSetMatrixProjectionStereoPtr.asFunction<void Function(MatrixC, MatrixC)>();

  void rlSetMatrixViewOffsetStereo(MatrixC right, MatrixC left)
    => _rlSetMatrixViewOffsetStereo(right, left);
  late final _rlSetMatrixViewOffsetStereoPtr = _lookup<NativeFunction<Void Function(MatrixC, MatrixC)>>('rlSetMatrixViewOffsetStereo');
  late final _rlSetMatrixViewOffsetStereo = _rlSetMatrixViewOffsetStereoPtr.asFunction<void Function(MatrixC, MatrixC)>();

  void rlLoadDrawCube()
    => _rlLoadDrawCube();
  late final _rlLoadDrawCubePtr = _lookup<NativeFunction<Void Function()>>('rlLoadDrawCube');
  late final _rlLoadDrawCube = _rlLoadDrawCubePtr.asFunction<void Function()>();

  void rlLoadDrawQuad()
    => _rlLoadDrawQuad();
  late final _rlLoadDrawQuadPtr = _lookup<NativeFunction<Void Function()>>('rlLoadDrawQuad');
  late final _rlLoadDrawQuad = _rlLoadDrawQuadPtr.asFunction<void Function()>();
}
