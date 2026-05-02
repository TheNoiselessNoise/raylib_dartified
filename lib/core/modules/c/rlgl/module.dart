part of '../../../raylib.dart';

mixin RaylibRlglExtras on RaylibModule {
  String get RLGL_VERSION => '5.0';
  int get RL_DEFAULT_BATCH_BUFFER_ELEMENTS => 8192;
  int get RL_DEFAULT_BATCH_BUFFERS => 1;
  int get RL_DEFAULT_BATCH_DRAWCALLS => 256;
  int get RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS => 4;
  int get RL_MAX_MATRIX_STACK_SIZE => 32;
  int get RL_MAX_SHADER_LOCATIONS => 32;
  double get RL_CULL_DISTANCE_NEAR => 0.01;
  double get RL_CULL_DISTANCE_FAR => 1000.0;
  int get RL_TEXTURE_WRAP_S => 10242;
  int get RL_TEXTURE_WRAP_T => 10243;
  int get RL_TEXTURE_MAG_FILTER => 10240;
  int get RL_TEXTURE_MIN_FILTER => 10241;
  int get RL_TEXTURE_FILTER_NEAREST => 9728;
  int get RL_TEXTURE_FILTER_LINEAR => 9729;
  int get RL_TEXTURE_FILTER_MIP_NEAREST => 9984;
  int get RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR => 9986;
  int get RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST => 9985;
  int get RL_TEXTURE_FILTER_MIP_LINEAR => 9987;
  int get RL_TEXTURE_FILTER_ANISOTROPIC => 12288;
  int get RL_TEXTURE_MIPMAP_BIAS_RATIO => 16384;
  int get RL_TEXTURE_WRAP_REPEAT => 10497;
  int get RL_TEXTURE_WRAP_CLAMP => 33071;
  int get RL_TEXTURE_WRAP_MIRROR_REPEAT => 33648;
  int get RL_TEXTURE_WRAP_MIRROR_CLAMP => 34626;
  int get RL_MODELVIEW => 5888;
  int get RL_PROJECTION => 5889;
  int get RL_TEXTURE => 5890;
  int get RL_LINES => 1;
  int get RL_TRIANGLES => 4;
  int get RL_QUADS => 7;
  int get RL_UNSIGNED_BYTE => 5121;
  int get RL_FLOAT => 5126;
  int get RL_STREAM_DRAW => 35040;
  int get RL_STREAM_READ => 35041;
  int get RL_STREAM_COPY => 35042;
  int get RL_STATIC_DRAW => 35044;
  int get RL_STATIC_READ => 35045;
  int get RL_STATIC_COPY => 35046;
  int get RL_DYNAMIC_DRAW => 35048;
  int get RL_DYNAMIC_READ => 35049;
  int get RL_DYNAMIC_COPY => 35050;
  int get RL_FRAGMENT_SHADER => 35632;
  int get RL_VERTEX_SHADER => 35633;
  int get RL_COMPUTE_SHADER => 37305;
  int get RL_ZERO => 0;
  int get RL_ONE => 1;
  int get RL_SRC_COLOR => 768;
  int get RL_ONE_MINUS_SRC_COLOR => 769;
  int get RL_SRC_ALPHA => 770;
  int get RL_ONE_MINUS_SRC_ALPHA => 771;
  int get RL_DST_ALPHA => 772;
  int get RL_ONE_MINUS_DST_ALPHA => 773;
  int get RL_DST_COLOR => 774;
  int get RL_ONE_MINUS_DST_COLOR => 775;
  int get RL_SRC_ALPHA_SATURATE => 776;
  int get RL_CONSTANT_COLOR => 32769;
  int get RL_ONE_MINUS_CONSTANT_COLOR => 32770;
  int get RL_CONSTANT_ALPHA => 32771;
  int get RL_ONE_MINUS_CONSTANT_ALPHA => 32772;
  int get RL_FUNC_ADD => 32774;
  int get RL_MIN => 32775;
  int get RL_MAX => 32776;
  int get RL_FUNC_SUBTRACT => 32778;
  int get RL_FUNC_REVERSE_SUBTRACT => 32779;
  int get RL_BLEND_EQUATION => 32777;
  int get RL_BLEND_EQUATION_RGB => 32777;
  int get RL_BLEND_EQUATION_ALPHA => 34877;
  int get RL_BLEND_DST_RGB => 32968;
  int get RL_BLEND_SRC_RGB => 32969;
  int get RL_BLEND_DST_ALPHA => 32970;
  int get RL_BLEND_SRC_ALPHA => 32971;
  int get RL_BLEND_COLOR => 32773;
  int get RL_READ_FRAMEBUFFER => 36008;
  int get RL_DRAW_FRAMEBUFFER => 36009;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION => 0;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD => 1;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL => 2;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR => 3;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT => 4;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2 => 5;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES => 6;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS => 7;
  int get RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS => 8;
  int get RL_SHADER_LOC_MAP_DIFFUSE => 15;
  int get RL_SHADER_LOC_MAP_SPECULAR => 16;
}

class RaylibRlgl extends RaylibModule with RaylibRlglExtras {
  RaylibRlgl(super.lib);

  void rlMatrixMode(int mode) {
    return _rlMatrixMode(mode);
  }

  late final _rlMatrixModePtr = rl
      .coreLookup<NativeFunction<Void Function(Int)>>('rlMatrixMode');
  late final _rlMatrixMode = _rlMatrixModePtr.asFunction<void Function(int)>();

  void rlPushMatrix() {
    return _rlPushMatrix();
  }

  late final _rlPushMatrixPtr = rl.coreLookup<NativeFunction<Void Function()>>(
    'rlPushMatrix',
  );
  late final _rlPushMatrix = _rlPushMatrixPtr.asFunction<void Function()>();

  void rlPopMatrix() {
    return _rlPopMatrix();
  }

  late final _rlPopMatrixPtr = rl.coreLookup<NativeFunction<Void Function()>>(
    'rlPopMatrix',
  );
  late final _rlPopMatrix = _rlPopMatrixPtr.asFunction<void Function()>();

  void rlLoadIdentity() {
    return _rlLoadIdentity();
  }

  late final _rlLoadIdentityPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlLoadIdentity');
  late final _rlLoadIdentity = _rlLoadIdentityPtr.asFunction<void Function()>();

  void rlTranslatef(double x, double y, double z) {
    return _rlTranslatef(x, y, z);
  }

  late final _rlTranslatefPtr = rl
      .coreLookup<NativeFunction<Void Function(Float, Float, Float)>>(
        'rlTranslatef',
      );
  late final _rlTranslatef = _rlTranslatefPtr
      .asFunction<void Function(double, double, double)>();

  void rlRotatef(double angle, double x, double y, double z) {
    return _rlRotatef(angle, x, y, z);
  }

  late final _rlRotatefPtr = rl
      .coreLookup<NativeFunction<Void Function(Float, Float, Float, Float)>>(
        'rlRotatef',
      );
  late final _rlRotatef = _rlRotatefPtr
      .asFunction<void Function(double, double, double, double)>();

  void rlScalef(double x, double y, double z) {
    return _rlScalef(x, y, z);
  }

  late final _rlScalefPtr = rl
      .coreLookup<NativeFunction<Void Function(Float, Float, Float)>>(
        'rlScalef',
      );
  late final _rlScalef = _rlScalefPtr
      .asFunction<void Function(double, double, double)>();

  void rlMultMatrixf(Pointer<Float> matf) {
    return _rlMultMatrixf(matf);
  }

  late final _rlMultMatrixfPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<Float>)>>(
        'rlMultMatrixf',
      );
  late final _rlMultMatrixf = _rlMultMatrixfPtr
      .asFunction<void Function(Pointer<Float>)>();

  void rlFrustum(
    double left,
    double right,
    double bottom,
    double top,
    double znear,
    double zfar,
  ) {
    return _rlFrustum(left, right, bottom, top, znear, zfar);
  }

  late final _rlFrustumPtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(Double, Double, Double, Double, Double, Double)
        >
      >('rlFrustum');
  late final _rlFrustum = _rlFrustumPtr
      .asFunction<
        void Function(double, double, double, double, double, double)
      >();

  void rlOrtho(
    double left,
    double right,
    double bottom,
    double top,
    double znear,
    double zfar,
  ) {
    return _rlOrtho(left, right, bottom, top, znear, zfar);
  }

  late final _rlOrthoPtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(Double, Double, Double, Double, Double, Double)
        >
      >('rlOrtho');
  late final _rlOrtho = _rlOrthoPtr
      .asFunction<
        void Function(double, double, double, double, double, double)
      >();

  void rlViewport(int x, int y, int width, int height) {
    return _rlViewport(x, y, width, height);
  }

  late final _rlViewportPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int, Int, Int)>>(
        'rlViewport',
      );
  late final _rlViewport = _rlViewportPtr
      .asFunction<void Function(int, int, int, int)>();

  void rlSetClipPlanes(double nearPlane, double farPlane) {
    return _rlSetClipPlanes(nearPlane, farPlane);
  }

  late final _rlSetClipPlanesPtr = rl
      .coreLookup<NativeFunction<Void Function(Double, Double)>>(
        'rlSetClipPlanes',
      );
  late final _rlSetClipPlanes = _rlSetClipPlanesPtr
      .asFunction<void Function(double, double)>();

  double rlGetCullDistanceNear() {
    return _rlGetCullDistanceNear();
  }

  late final _rlGetCullDistanceNearPtr = rl
      .coreLookup<NativeFunction<Double Function()>>('rlGetCullDistanceNear');
  late final _rlGetCullDistanceNear = _rlGetCullDistanceNearPtr
      .asFunction<double Function()>();

  double rlGetCullDistanceFar() {
    return _rlGetCullDistanceFar();
  }

  late final _rlGetCullDistanceFarPtr = rl
      .coreLookup<NativeFunction<Double Function()>>('rlGetCullDistanceFar');
  late final _rlGetCullDistanceFar = _rlGetCullDistanceFarPtr
      .asFunction<double Function()>();

  void rlBegin(int mode) {
    return _rlBegin(mode);
  }

  late final _rlBeginPtr = rl.coreLookup<NativeFunction<Void Function(Int)>>(
    'rlBegin',
  );
  late final _rlBegin = _rlBeginPtr.asFunction<void Function(int)>();

  void rlEnd() {
    return _rlEnd();
  }

  late final _rlEndPtr = rl.coreLookup<NativeFunction<Void Function()>>(
    'rlEnd',
  );
  late final _rlEnd = _rlEndPtr.asFunction<void Function()>();

  void rlVertex2i(int x, int y) {
    return _rlVertex2i(x, y);
  }

  late final _rlVertex2iPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int)>>('rlVertex2i');
  late final _rlVertex2i = _rlVertex2iPtr.asFunction<void Function(int, int)>();

  void rlVertex2f(double x, double y) {
    return _rlVertex2f(x, y);
  }

  late final _rlVertex2fPtr = rl
      .coreLookup<NativeFunction<Void Function(Float, Float)>>('rlVertex2f');
  late final _rlVertex2f = _rlVertex2fPtr
      .asFunction<void Function(double, double)>();

  void rlVertex3f(double x, double y, double z) {
    return _rlVertex3f(x, y, z);
  }

  late final _rlVertex3fPtr = rl
      .coreLookup<NativeFunction<Void Function(Float, Float, Float)>>(
        'rlVertex3f',
      );
  late final _rlVertex3f = _rlVertex3fPtr
      .asFunction<void Function(double, double, double)>();

  void rlTexCoord2f(double x, double y) {
    return _rlTexCoord2f(x, y);
  }

  late final _rlTexCoord2fPtr = rl
      .coreLookup<NativeFunction<Void Function(Float, Float)>>('rlTexCoord2f');
  late final _rlTexCoord2f = _rlTexCoord2fPtr
      .asFunction<void Function(double, double)>();

  void rlNormal3f(double x, double y, double z) {
    return _rlNormal3f(x, y, z);
  }

  late final _rlNormal3fPtr = rl
      .coreLookup<NativeFunction<Void Function(Float, Float, Float)>>(
        'rlNormal3f',
      );
  late final _rlNormal3f = _rlNormal3fPtr
      .asFunction<void Function(double, double, double)>();

  void rlColor4ub(int r, int g, int b, int a) {
    return _rlColor4ub(r, g, b, a);
  }

  late final _rlColor4ubPtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(UnsignedChar, UnsignedChar, UnsignedChar, UnsignedChar)
        >
      >('rlColor4ub');
  late final _rlColor4ub = _rlColor4ubPtr
      .asFunction<void Function(int, int, int, int)>();

  void rlColor3f(double x, double y, double z) {
    return _rlColor3f(x, y, z);
  }

  late final _rlColor3fPtr = rl
      .coreLookup<NativeFunction<Void Function(Float, Float, Float)>>(
        'rlColor3f',
      );
  late final _rlColor3f = _rlColor3fPtr
      .asFunction<void Function(double, double, double)>();

  void rlColor4f(double x, double y, double z, double w) {
    return _rlColor4f(x, y, z, w);
  }

  late final _rlColor4fPtr = rl
      .coreLookup<NativeFunction<Void Function(Float, Float, Float, Float)>>(
        'rlColor4f',
      );
  late final _rlColor4f = _rlColor4fPtr
      .asFunction<void Function(double, double, double, double)>();

  bool rlEnableVertexArray(int vaoId) {
    return _rlEnableVertexArray(vaoId);
  }

  late final _rlEnableVertexArrayPtr = rl
      .coreLookup<NativeFunction<Bool Function(UnsignedInt)>>(
        'rlEnableVertexArray',
      );
  late final _rlEnableVertexArray = _rlEnableVertexArrayPtr
      .asFunction<bool Function(int)>();

  void rlDisableVertexArray() {
    return _rlDisableVertexArray();
  }

  late final _rlDisableVertexArrayPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableVertexArray');
  late final _rlDisableVertexArray = _rlDisableVertexArrayPtr
      .asFunction<void Function()>();

  void rlEnableVertexBuffer(int id) {
    return _rlEnableVertexBuffer(id);
  }

  late final _rlEnableVertexBufferPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlEnableVertexBuffer',
      );
  late final _rlEnableVertexBuffer = _rlEnableVertexBufferPtr
      .asFunction<void Function(int)>();

  void rlDisableVertexBuffer() {
    return _rlDisableVertexBuffer();
  }

  late final _rlDisableVertexBufferPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableVertexBuffer');
  late final _rlDisableVertexBuffer = _rlDisableVertexBufferPtr
      .asFunction<void Function()>();

  void rlEnableVertexBufferElement(int id) {
    return _rlEnableVertexBufferElement(id);
  }

  late final _rlEnableVertexBufferElementPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlEnableVertexBufferElement',
      );
  late final _rlEnableVertexBufferElement = _rlEnableVertexBufferElementPtr
      .asFunction<void Function(int)>();

  void rlDisableVertexBufferElement() {
    return _rlDisableVertexBufferElement();
  }

  late final _rlDisableVertexBufferElementPtr = rl
      .coreLookup<NativeFunction<Void Function()>>(
        'rlDisableVertexBufferElement',
      );
  late final _rlDisableVertexBufferElement = _rlDisableVertexBufferElementPtr
      .asFunction<void Function()>();

  void rlEnableVertexAttribute(int index) {
    return _rlEnableVertexAttribute(index);
  }

  late final _rlEnableVertexAttributePtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlEnableVertexAttribute',
      );
  late final _rlEnableVertexAttribute = _rlEnableVertexAttributePtr
      .asFunction<void Function(int)>();

  void rlDisableVertexAttribute(int index) {
    return _rlDisableVertexAttribute(index);
  }

  late final _rlDisableVertexAttributePtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlDisableVertexAttribute',
      );
  late final _rlDisableVertexAttribute = _rlDisableVertexAttributePtr
      .asFunction<void Function(int)>();

  void rlActiveTextureSlot(int slot) {
    return _rlActiveTextureSlot(slot);
  }

  late final _rlActiveTextureSlotPtr = rl
      .coreLookup<NativeFunction<Void Function(Int)>>('rlActiveTextureSlot');
  late final _rlActiveTextureSlot = _rlActiveTextureSlotPtr
      .asFunction<void Function(int)>();

  void rlEnableTexture(int id) {
    return _rlEnableTexture(id);
  }

  late final _rlEnableTexturePtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlEnableTexture',
      );
  late final _rlEnableTexture = _rlEnableTexturePtr
      .asFunction<void Function(int)>();

  void rlDisableTexture() {
    return _rlDisableTexture();
  }

  late final _rlDisableTexturePtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableTexture');
  late final _rlDisableTexture = _rlDisableTexturePtr
      .asFunction<void Function()>();

  void rlEnableTextureCubemap(int id) {
    return _rlEnableTextureCubemap(id);
  }

  late final _rlEnableTextureCubemapPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlEnableTextureCubemap',
      );
  late final _rlEnableTextureCubemap = _rlEnableTextureCubemapPtr
      .asFunction<void Function(int)>();

  void rlDisableTextureCubemap() {
    return _rlDisableTextureCubemap();
  }

  late final _rlDisableTextureCubemapPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableTextureCubemap');
  late final _rlDisableTextureCubemap = _rlDisableTextureCubemapPtr
      .asFunction<void Function()>();

  void rlTextureParameters(int id, int param, int value) {
    return _rlTextureParameters(id, param, value);
  }

  late final _rlTextureParametersPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt, Int, Int)>>(
        'rlTextureParameters',
      );
  late final _rlTextureParameters = _rlTextureParametersPtr
      .asFunction<void Function(int, int, int)>();

  void rlCubemapParameters(int id, int param, int value) {
    return _rlCubemapParameters(id, param, value);
  }

  late final _rlCubemapParametersPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt, Int, Int)>>(
        'rlCubemapParameters',
      );
  late final _rlCubemapParameters = _rlCubemapParametersPtr
      .asFunction<void Function(int, int, int)>();

  void rlEnableShader(int id) {
    return _rlEnableShader(id);
  }

  late final _rlEnableShaderPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>('rlEnableShader');
  late final _rlEnableShader = _rlEnableShaderPtr
      .asFunction<void Function(int)>();

  void rlDisableShader() {
    return _rlDisableShader();
  }

  late final _rlDisableShaderPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableShader');
  late final _rlDisableShader = _rlDisableShaderPtr
      .asFunction<void Function()>();

  void rlEnableFramebuffer(int id) {
    return _rlEnableFramebuffer(id);
  }

  late final _rlEnableFramebufferPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlEnableFramebuffer',
      );
  late final _rlEnableFramebuffer = _rlEnableFramebufferPtr
      .asFunction<void Function(int)>();

  void rlDisableFramebuffer() {
    return _rlDisableFramebuffer();
  }

  late final _rlDisableFramebufferPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableFramebuffer');
  late final _rlDisableFramebuffer = _rlDisableFramebufferPtr
      .asFunction<void Function()>();

  int rlGetActiveFramebuffer() {
    return _rlGetActiveFramebuffer();
  }

  late final _rlGetActiveFramebufferPtr = rl
      .coreLookup<NativeFunction<UnsignedInt Function()>>(
        'rlGetActiveFramebuffer',
      );
  late final _rlGetActiveFramebuffer = _rlGetActiveFramebufferPtr
      .asFunction<int Function()>();

  void rlActiveDrawBuffers(int count) {
    return _rlActiveDrawBuffers(count);
  }

  late final _rlActiveDrawBuffersPtr = rl
      .coreLookup<NativeFunction<Void Function(Int)>>('rlActiveDrawBuffers');
  late final _rlActiveDrawBuffers = _rlActiveDrawBuffersPtr
      .asFunction<void Function(int)>();

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
  ) {
    return _rlBlitFramebuffer(
      srcX,
      srcY,
      srcWidth,
      srcHeight,
      dstX,
      dstY,
      dstWidth,
      dstHeight,
      bufferMask,
    );
  }

  late final _rlBlitFramebufferPtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(Int, Int, Int, Int, Int, Int, Int, Int, Int)
        >
      >('rlBlitFramebuffer');
  late final _rlBlitFramebuffer = _rlBlitFramebufferPtr
      .asFunction<void Function(int, int, int, int, int, int, int, int, int)>();

  void rlBindFramebuffer(int target, int framebuffer) {
    return _rlBindFramebuffer(target, framebuffer);
  }

  late final _rlBindFramebufferPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt, UnsignedInt)>>(
        'rlBindFramebuffer',
      );
  late final _rlBindFramebuffer = _rlBindFramebufferPtr
      .asFunction<void Function(int, int)>();

  void rlEnableColorBlend() {
    return _rlEnableColorBlend();
  }

  late final _rlEnableColorBlendPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlEnableColorBlend');
  late final _rlEnableColorBlend = _rlEnableColorBlendPtr
      .asFunction<void Function()>();

  void rlDisableColorBlend() {
    return _rlDisableColorBlend();
  }

  late final _rlDisableColorBlendPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableColorBlend');
  late final _rlDisableColorBlend = _rlDisableColorBlendPtr
      .asFunction<void Function()>();

  void rlEnableDepthTest() {
    return _rlEnableDepthTest();
  }

  late final _rlEnableDepthTestPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlEnableDepthTest');
  late final _rlEnableDepthTest = _rlEnableDepthTestPtr
      .asFunction<void Function()>();

  void rlDisableDepthTest() {
    return _rlDisableDepthTest();
  }

  late final _rlDisableDepthTestPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableDepthTest');
  late final _rlDisableDepthTest = _rlDisableDepthTestPtr
      .asFunction<void Function()>();

  void rlEnableDepthMask() {
    return _rlEnableDepthMask();
  }

  late final _rlEnableDepthMaskPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlEnableDepthMask');
  late final _rlEnableDepthMask = _rlEnableDepthMaskPtr
      .asFunction<void Function()>();

  void rlDisableDepthMask() {
    return _rlDisableDepthMask();
  }

  late final _rlDisableDepthMaskPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableDepthMask');
  late final _rlDisableDepthMask = _rlDisableDepthMaskPtr
      .asFunction<void Function()>();

  void rlEnableBackfaceCulling() {
    return _rlEnableBackfaceCulling();
  }

  late final _rlEnableBackfaceCullingPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlEnableBackfaceCulling');
  late final _rlEnableBackfaceCulling = _rlEnableBackfaceCullingPtr
      .asFunction<void Function()>();

  void rlDisableBackfaceCulling() {
    return _rlDisableBackfaceCulling();
  }

  late final _rlDisableBackfaceCullingPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableBackfaceCulling');
  late final _rlDisableBackfaceCulling = _rlDisableBackfaceCullingPtr
      .asFunction<void Function()>();

  void rlColorMask(bool r, bool g, bool b, bool a) {
    return _rlColorMask(r, g, b, a);
  }

  late final _rlColorMaskPtr = rl
      .coreLookup<NativeFunction<Void Function(Bool, Bool, Bool, Bool)>>(
        'rlColorMask',
      );
  late final _rlColorMask = _rlColorMaskPtr
      .asFunction<void Function(bool, bool, bool, bool)>();

  void rlSetCullFace(int mode) {
    return _rlSetCullFace(mode);
  }

  late final _rlSetCullFacePtr = rl
      .coreLookup<NativeFunction<Void Function(Int)>>('rlSetCullFace');
  late final _rlSetCullFace = _rlSetCullFacePtr
      .asFunction<void Function(int)>();

  void rlEnableScissorTest() {
    return _rlEnableScissorTest();
  }

  late final _rlEnableScissorTestPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlEnableScissorTest');
  late final _rlEnableScissorTest = _rlEnableScissorTestPtr
      .asFunction<void Function()>();

  void rlDisableScissorTest() {
    return _rlDisableScissorTest();
  }

  late final _rlDisableScissorTestPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableScissorTest');
  late final _rlDisableScissorTest = _rlDisableScissorTestPtr
      .asFunction<void Function()>();

  void rlScissor(int x, int y, int width, int height) {
    return _rlScissor(x, y, width, height);
  }

  late final _rlScissorPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int, Int, Int)>>(
        'rlScissor',
      );
  late final _rlScissor = _rlScissorPtr
      .asFunction<void Function(int, int, int, int)>();

  void rlEnableWireMode() {
    return _rlEnableWireMode();
  }

  late final _rlEnableWireModePtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlEnableWireMode');
  late final _rlEnableWireMode = _rlEnableWireModePtr
      .asFunction<void Function()>();

  void rlEnablePointMode() {
    return _rlEnablePointMode();
  }

  late final _rlEnablePointModePtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlEnablePointMode');
  late final _rlEnablePointMode = _rlEnablePointModePtr
      .asFunction<void Function()>();

  void rlDisableWireMode() {
    return _rlDisableWireMode();
  }

  late final _rlDisableWireModePtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableWireMode');
  late final _rlDisableWireMode = _rlDisableWireModePtr
      .asFunction<void Function()>();

  void rlSetLineWidth(double width) {
    return _rlSetLineWidth(width);
  }

  late final _rlSetLineWidthPtr = rl
      .coreLookup<NativeFunction<Void Function(Float)>>('rlSetLineWidth');
  late final _rlSetLineWidth = _rlSetLineWidthPtr
      .asFunction<void Function(double)>();

  double rlGetLineWidth() {
    return _rlGetLineWidth();
  }

  late final _rlGetLineWidthPtr = rl
      .coreLookup<NativeFunction<Float Function()>>('rlGetLineWidth');
  late final _rlGetLineWidth = _rlGetLineWidthPtr
      .asFunction<double Function()>();

  void rlEnableSmoothLines() {
    return _rlEnableSmoothLines();
  }

  late final _rlEnableSmoothLinesPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlEnableSmoothLines');
  late final _rlEnableSmoothLines = _rlEnableSmoothLinesPtr
      .asFunction<void Function()>();

  void rlDisableSmoothLines() {
    return _rlDisableSmoothLines();
  }

  late final _rlDisableSmoothLinesPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableSmoothLines');
  late final _rlDisableSmoothLines = _rlDisableSmoothLinesPtr
      .asFunction<void Function()>();

  void rlEnableStereoRender() {
    return _rlEnableStereoRender();
  }

  late final _rlEnableStereoRenderPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlEnableStereoRender');
  late final _rlEnableStereoRender = _rlEnableStereoRenderPtr
      .asFunction<void Function()>();

  void rlDisableStereoRender() {
    return _rlDisableStereoRender();
  }

  late final _rlDisableStereoRenderPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDisableStereoRender');
  late final _rlDisableStereoRender = _rlDisableStereoRenderPtr
      .asFunction<void Function()>();

  bool rlIsStereoRenderEnabled() {
    return _rlIsStereoRenderEnabled();
  }

  late final _rlIsStereoRenderEnabledPtr = rl
      .coreLookup<NativeFunction<Bool Function()>>('rlIsStereoRenderEnabled');
  late final _rlIsStereoRenderEnabled = _rlIsStereoRenderEnabledPtr
      .asFunction<bool Function()>();

  void rlClearColor(int r, int g, int b, int a) {
    return _rlClearColor(r, g, b, a);
  }

  late final _rlClearColorPtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(UnsignedChar, UnsignedChar, UnsignedChar, UnsignedChar)
        >
      >('rlClearColor');
  late final _rlClearColor = _rlClearColorPtr
      .asFunction<void Function(int, int, int, int)>();

  void rlClearScreenBuffers() {
    return _rlClearScreenBuffers();
  }

  late final _rlClearScreenBuffersPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlClearScreenBuffers');
  late final _rlClearScreenBuffers = _rlClearScreenBuffersPtr
      .asFunction<void Function()>();

  void rlCheckErrors() {
    return _rlCheckErrors();
  }

  late final _rlCheckErrorsPtr = rl.coreLookup<NativeFunction<Void Function()>>(
    'rlCheckErrors',
  );
  late final _rlCheckErrors = _rlCheckErrorsPtr.asFunction<void Function()>();

  void rlSetBlendMode(int mode) {
    return _rlSetBlendMode(mode);
  }

  late final _rlSetBlendModePtr = rl
      .coreLookup<NativeFunction<Void Function(Int)>>('rlSetBlendMode');
  late final _rlSetBlendMode = _rlSetBlendModePtr
      .asFunction<void Function(int)>();

  void rlSetBlendFactors(int glSrcFactor, int glDstFactor, int glEquation) {
    return _rlSetBlendFactors(glSrcFactor, glDstFactor, glEquation);
  }

  late final _rlSetBlendFactorsPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int, Int)>>(
        'rlSetBlendFactors',
      );
  late final _rlSetBlendFactors = _rlSetBlendFactorsPtr
      .asFunction<void Function(int, int, int)>();

  void rlSetBlendFactorsSeparate(
    int glSrcRGB,
    int glDstRGB,
    int glSrcAlpha,
    int glDstAlpha,
    int glEqRGB,
    int glEqAlpha,
  ) {
    return _rlSetBlendFactorsSeparate(
      glSrcRGB,
      glDstRGB,
      glSrcAlpha,
      glDstAlpha,
      glEqRGB,
      glEqAlpha,
    );
  }

  late final _rlSetBlendFactorsSeparatePtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int, Int, Int, Int, Int)>>(
        'rlSetBlendFactorsSeparate',
      );
  late final _rlSetBlendFactorsSeparate = _rlSetBlendFactorsSeparatePtr
      .asFunction<void Function(int, int, int, int, int, int)>();

  void rlglInit(int width, int height) {
    return _rlglInit(width, height);
  }

  late final _rlglInitPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int)>>('rlglInit');
  late final _rlglInit = _rlglInitPtr.asFunction<void Function(int, int)>();

  void rlglClose() {
    return _rlglClose();
  }

  late final _rlglClosePtr = rl.coreLookup<NativeFunction<Void Function()>>(
    'rlglClose',
  );
  late final _rlglClose = _rlglClosePtr.asFunction<void Function()>();

  void rlLoadExtensions(Pointer<Void> loader) {
    return _rlLoadExtensions(loader);
  }

  late final _rlLoadExtensionsPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<Void>)>>(
        'rlLoadExtensions',
      );
  late final _rlLoadExtensions = _rlLoadExtensionsPtr
      .asFunction<void Function(Pointer<Void>)>();

  int rlGetVersion() {
    return _rlGetVersion();
  }

  late final _rlGetVersionPtr = rl.coreLookup<NativeFunction<Int Function()>>(
    'rlGetVersion',
  );
  late final _rlGetVersion = _rlGetVersionPtr.asFunction<int Function()>();

  void rlSetFramebufferWidth(int width) {
    return _rlSetFramebufferWidth(width);
  }

  late final _rlSetFramebufferWidthPtr = rl
      .coreLookup<NativeFunction<Void Function(Int)>>('rlSetFramebufferWidth');
  late final _rlSetFramebufferWidth = _rlSetFramebufferWidthPtr
      .asFunction<void Function(int)>();

  int rlGetFramebufferWidth() {
    return _rlGetFramebufferWidth();
  }

  late final _rlGetFramebufferWidthPtr = rl
      .coreLookup<NativeFunction<Int Function()>>('rlGetFramebufferWidth');
  late final _rlGetFramebufferWidth = _rlGetFramebufferWidthPtr
      .asFunction<int Function()>();

  void rlSetFramebufferHeight(int height) {
    return _rlSetFramebufferHeight(height);
  }

  late final _rlSetFramebufferHeightPtr = rl
      .coreLookup<NativeFunction<Void Function(Int)>>('rlSetFramebufferHeight');
  late final _rlSetFramebufferHeight = _rlSetFramebufferHeightPtr
      .asFunction<void Function(int)>();

  int rlGetFramebufferHeight() {
    return _rlGetFramebufferHeight();
  }

  late final _rlGetFramebufferHeightPtr = rl
      .coreLookup<NativeFunction<Int Function()>>('rlGetFramebufferHeight');
  late final _rlGetFramebufferHeight = _rlGetFramebufferHeightPtr
      .asFunction<int Function()>();

  int rlGetTextureIdDefault() {
    return _rlGetTextureIdDefault();
  }

  late final _rlGetTextureIdDefaultPtr = rl
      .coreLookup<NativeFunction<UnsignedInt Function()>>(
        'rlGetTextureIdDefault',
      );
  late final _rlGetTextureIdDefault = _rlGetTextureIdDefaultPtr
      .asFunction<int Function()>();

  int rlGetShaderIdDefault() {
    return _rlGetShaderIdDefault();
  }

  late final _rlGetShaderIdDefaultPtr = rl
      .coreLookup<NativeFunction<UnsignedInt Function()>>(
        'rlGetShaderIdDefault',
      );
  late final _rlGetShaderIdDefault = _rlGetShaderIdDefaultPtr
      .asFunction<int Function()>();

  Pointer<Int> rlGetShaderLocsDefault() {
    return _rlGetShaderLocsDefault();
  }

  late final _rlGetShaderLocsDefaultPtr = rl
      .coreLookup<NativeFunction<Pointer<Int> Function()>>(
        'rlGetShaderLocsDefault',
      );
  late final _rlGetShaderLocsDefault = _rlGetShaderLocsDefaultPtr
      .asFunction<Pointer<Int> Function()>();

  RlRenderBatchC rlLoadRenderBatch(int numBuffers, int bufferElements) {
    return _rlLoadRenderBatch(numBuffers, bufferElements);
  }

  late final _rlLoadRenderBatchPtr = rl
      .coreLookup<NativeFunction<RlRenderBatchC Function(Int, Int)>>(
        'rlLoadRenderBatch',
      );
  late final _rlLoadRenderBatch = _rlLoadRenderBatchPtr
      .asFunction<RlRenderBatchC Function(int, int)>();

  void rlUnloadRenderBatch(RlRenderBatchC batch) {
    return _rlUnloadRenderBatch(batch);
  }

  late final _rlUnloadRenderBatchPtr = rl
      .coreLookup<NativeFunction<Void Function(RlRenderBatchC)>>(
        'rlUnloadRenderBatch',
      );
  late final _rlUnloadRenderBatch = _rlUnloadRenderBatchPtr
      .asFunction<void Function(RlRenderBatchC)>();

  void rlDrawRenderBatch(Pointer<RlRenderBatchC> batch) {
    return _rlDrawRenderBatch(batch);
  }

  late final _rlDrawRenderBatchPtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<RlRenderBatchC>)>>(
        'rlDrawRenderBatch',
      );
  late final _rlDrawRenderBatch = _rlDrawRenderBatchPtr
      .asFunction<void Function(Pointer<RlRenderBatchC>)>();

  void rlSetRenderBatchActive(Pointer<RlRenderBatchC> batch) {
    return _rlSetRenderBatchActive(batch);
  }

  late final _rlSetRenderBatchActivePtr = rl
      .coreLookup<NativeFunction<Void Function(Pointer<RlRenderBatchC>)>>(
        'rlSetRenderBatchActive',
      );
  late final _rlSetRenderBatchActive = _rlSetRenderBatchActivePtr
      .asFunction<void Function(Pointer<RlRenderBatchC>)>();

  void rlDrawRenderBatchActive() {
    return _rlDrawRenderBatchActive();
  }

  late final _rlDrawRenderBatchActivePtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlDrawRenderBatchActive');
  late final _rlDrawRenderBatchActive = _rlDrawRenderBatchActivePtr
      .asFunction<void Function()>();

  bool rlCheckRenderBatchLimit(int vCount) {
    return _rlCheckRenderBatchLimit(vCount);
  }

  late final _rlCheckRenderBatchLimitPtr = rl
      .coreLookup<NativeFunction<Bool Function(Int)>>(
        'rlCheckRenderBatchLimit',
      );
  late final _rlCheckRenderBatchLimit = _rlCheckRenderBatchLimitPtr
      .asFunction<bool Function(int)>();

  void rlSetTexture(int id) {
    return _rlSetTexture(id);
  }

  late final _rlSetTexturePtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>('rlSetTexture');
  late final _rlSetTexture = _rlSetTexturePtr.asFunction<void Function(int)>();

  int rlLoadVertexArray() {
    return _rlLoadVertexArray();
  }

  late final _rlLoadVertexArrayPtr = rl
      .coreLookup<NativeFunction<UnsignedInt Function()>>('rlLoadVertexArray');
  late final _rlLoadVertexArray = _rlLoadVertexArrayPtr
      .asFunction<int Function()>();

  int rlLoadVertexBuffer(Pointer<Void> buffer, int size, bool dynamic) {
    return _rlLoadVertexBuffer(buffer, size, dynamic);
  }

  late final _rlLoadVertexBufferPtr = rl
      .coreLookup<
        NativeFunction<UnsignedInt Function(Pointer<Void>, Int, Bool)>
      >('rlLoadVertexBuffer');
  late final _rlLoadVertexBuffer = _rlLoadVertexBufferPtr
      .asFunction<int Function(Pointer<Void>, int, bool)>();

  int rlLoadVertexBufferElement(Pointer<Void> buffer, int size, bool dynamic) {
    return _rlLoadVertexBufferElement(buffer, size, dynamic);
  }

  late final _rlLoadVertexBufferElementPtr = rl
      .coreLookup<
        NativeFunction<UnsignedInt Function(Pointer<Void>, Int, Bool)>
      >('rlLoadVertexBufferElement');
  late final _rlLoadVertexBufferElement = _rlLoadVertexBufferElementPtr
      .asFunction<int Function(Pointer<Void>, int, bool)>();

  void rlUpdateVertexBuffer(
    int bufferId,
    Pointer<Void> data,
    int dataSize,
    int offset,
  ) {
    return _rlUpdateVertexBuffer(bufferId, data, dataSize, offset);
  }

  late final _rlUpdateVertexBufferPtr = rl
      .coreLookup<
        NativeFunction<Void Function(UnsignedInt, Pointer<Void>, Int, Int)>
      >('rlUpdateVertexBuffer');
  late final _rlUpdateVertexBuffer = _rlUpdateVertexBufferPtr
      .asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlUpdateVertexBufferElements(
    int id,
    Pointer<Void> data,
    int dataSize,
    int offset,
  ) {
    return _rlUpdateVertexBufferElements(id, data, dataSize, offset);
  }

  late final _rlUpdateVertexBufferElementsPtr = rl
      .coreLookup<
        NativeFunction<Void Function(UnsignedInt, Pointer<Void>, Int, Int)>
      >('rlUpdateVertexBufferElements');
  late final _rlUpdateVertexBufferElements = _rlUpdateVertexBufferElementsPtr
      .asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlUnloadVertexArray(int vaoId) {
    return _rlUnloadVertexArray(vaoId);
  }

  late final _rlUnloadVertexArrayPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlUnloadVertexArray',
      );
  late final _rlUnloadVertexArray = _rlUnloadVertexArrayPtr
      .asFunction<void Function(int)>();

  void rlUnloadVertexBuffer(int vboId) {
    return _rlUnloadVertexBuffer(vboId);
  }

  late final _rlUnloadVertexBufferPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlUnloadVertexBuffer',
      );
  late final _rlUnloadVertexBuffer = _rlUnloadVertexBufferPtr
      .asFunction<void Function(int)>();

  void rlSetVertexAttribute(
    int index,
    int compSize,
    int type,
    bool normalized,
    int stride,
    int offset,
  ) {
    return _rlSetVertexAttribute(
      index,
      compSize,
      type,
      normalized,
      stride,
      offset,
    );
  }

  late final _rlSetVertexAttributePtr = rl
      .coreLookup<
        NativeFunction<Void Function(UnsignedInt, Int, Int, Bool, Int, Int)>
      >('rlSetVertexAttribute');
  late final _rlSetVertexAttribute = _rlSetVertexAttributePtr
      .asFunction<void Function(int, int, int, bool, int, int)>();

  void rlSetVertexAttributeDivisor(int index, int divisor) {
    return _rlSetVertexAttributeDivisor(index, divisor);
  }

  late final _rlSetVertexAttributeDivisorPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt, Int)>>(
        'rlSetVertexAttributeDivisor',
      );
  late final _rlSetVertexAttributeDivisor = _rlSetVertexAttributeDivisorPtr
      .asFunction<void Function(int, int)>();

  void rlSetVertexAttributeDefault(
    int locIndex,
    Pointer<Void> value,
    int attribType,
    int count,
  ) {
    return _rlSetVertexAttributeDefault(locIndex, value, attribType, count);
  }

  late final _rlSetVertexAttributeDefaultPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Pointer<Void>, Int, Int)>>(
        'rlSetVertexAttributeDefault',
      );
  late final _rlSetVertexAttributeDefault = _rlSetVertexAttributeDefaultPtr
      .asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlDrawVertexArray(int offset, int count) {
    return _rlDrawVertexArray(offset, count);
  }

  late final _rlDrawVertexArrayPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int)>>('rlDrawVertexArray');
  late final _rlDrawVertexArray = _rlDrawVertexArrayPtr
      .asFunction<void Function(int, int)>();

  void rlDrawVertexArrayElements(int offset, int count, Pointer<Void> buffer) {
    return _rlDrawVertexArrayElements(offset, count, buffer);
  }

  late final _rlDrawVertexArrayElementsPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int, Pointer<Void>)>>(
        'rlDrawVertexArrayElements',
      );
  late final _rlDrawVertexArrayElements = _rlDrawVertexArrayElementsPtr
      .asFunction<void Function(int, int, Pointer<Void>)>();

  void rlDrawVertexArrayInstanced(int offset, int count, int instances) {
    return _rlDrawVertexArrayInstanced(offset, count, instances);
  }

  late final _rlDrawVertexArrayInstancedPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int, Int)>>(
        'rlDrawVertexArrayInstanced',
      );
  late final _rlDrawVertexArrayInstanced = _rlDrawVertexArrayInstancedPtr
      .asFunction<void Function(int, int, int)>();

  void rlDrawVertexArrayElementsInstanced(
    int offset,
    int count,
    Pointer<Void> buffer,
    int instances,
  ) {
    return _rlDrawVertexArrayElementsInstanced(
      offset,
      count,
      buffer,
      instances,
    );
  }

  late final _rlDrawVertexArrayElementsInstancedPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Int, Pointer<Void>, Int)>>(
        'rlDrawVertexArrayElementsInstanced',
      );
  late final _rlDrawVertexArrayElementsInstanced =
      _rlDrawVertexArrayElementsInstancedPtr
          .asFunction<void Function(int, int, Pointer<Void>, int)>();

  int rlLoadTexture(
    Pointer<Void> data,
    int width,
    int height,
    int format,
    int mipmapCount,
  ) {
    return _rlLoadTexture(data, width, height, format, mipmapCount);
  }

  late final _rlLoadTexturePtr = rl
      .coreLookup<
        NativeFunction<UnsignedInt Function(Pointer<Void>, Int, Int, Int, Int)>
      >('rlLoadTexture');
  late final _rlLoadTexture = _rlLoadTexturePtr
      .asFunction<int Function(Pointer<Void>, int, int, int, int)>();

  int rlLoadTextureDepth(int width, int height, bool useRenderBuffer) {
    return _rlLoadTextureDepth(width, height, useRenderBuffer);
  }

  late final _rlLoadTextureDepthPtr = rl
      .coreLookup<NativeFunction<UnsignedInt Function(Int, Int, Bool)>>(
        'rlLoadTextureDepth',
      );
  late final _rlLoadTextureDepth = _rlLoadTextureDepthPtr
      .asFunction<int Function(int, int, bool)>();

  int rlLoadTextureCubemap(
    Pointer<Void> data,
    int size,
    int format,
    int mipmapCount,
  ) {
    return _rlLoadTextureCubemap(data, size, format, mipmapCount);
  }

  late final _rlLoadTextureCubemapPtr = rl
      .coreLookup<
        NativeFunction<UnsignedInt Function(Pointer<Void>, Int, Int, Int)>
      >('rlLoadTextureCubemap');
  late final _rlLoadTextureCubemap = _rlLoadTextureCubemapPtr
      .asFunction<int Function(Pointer<Void>, int, int, int)>();

  void rlUpdateTexture(
    int id,
    int offsetX,
    int offsetY,
    int width,
    int height,
    int format,
    Pointer<Void> data,
  ) {
    return _rlUpdateTexture(id, offsetX, offsetY, width, height, format, data);
  }

  late final _rlUpdateTexturePtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(UnsignedInt, Int, Int, Int, Int, Int, Pointer<Void>)
        >
      >('rlUpdateTexture');
  late final _rlUpdateTexture = _rlUpdateTexturePtr
      .asFunction<void Function(int, int, int, int, int, int, Pointer<Void>)>();

  void rlGetGlTextureFormats(
    int format,
    Pointer<UnsignedInt> glInternalFormat,
    Pointer<UnsignedInt> glFormat,
    Pointer<UnsignedInt> glType,
  ) {
    return _rlGetGlTextureFormats(format, glInternalFormat, glFormat, glType);
  }

  late final _rlGetGlTextureFormatsPtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(
            Int,
            Pointer<UnsignedInt>,
            Pointer<UnsignedInt>,
            Pointer<UnsignedInt>,
          )
        >
      >('rlGetGlTextureFormats');
  late final _rlGetGlTextureFormats = _rlGetGlTextureFormatsPtr
      .asFunction<
        void Function(
          int,
          Pointer<UnsignedInt>,
          Pointer<UnsignedInt>,
          Pointer<UnsignedInt>,
        )
      >();

  Pointer<Char> rlGetPixelFormatName(int format) {
    return _rlGetPixelFormatName(format);
  }

  late final _rlGetPixelFormatNamePtr = rl
      .coreLookup<NativeFunction<Pointer<Char> Function(UnsignedInt)>>(
        'rlGetPixelFormatName',
      );
  late final _rlGetPixelFormatName = _rlGetPixelFormatNamePtr
      .asFunction<Pointer<Char> Function(int)>();

  void rlUnloadTexture(int id) {
    return _rlUnloadTexture(id);
  }

  late final _rlUnloadTexturePtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlUnloadTexture',
      );
  late final _rlUnloadTexture = _rlUnloadTexturePtr
      .asFunction<void Function(int)>();

  void rlGenTextureMipmaps(
    int id,
    int width,
    int height,
    int format,
    Pointer<Int> mipmaps,
  ) {
    return _rlGenTextureMipmaps(id, width, height, format, mipmaps);
  }

  late final _rlGenTextureMipmapsPtr = rl
      .coreLookup<
        NativeFunction<Void Function(UnsignedInt, Int, Int, Int, Pointer<Int>)>
      >('rlGenTextureMipmaps');
  late final _rlGenTextureMipmaps = _rlGenTextureMipmapsPtr
      .asFunction<void Function(int, int, int, int, Pointer<Int>)>();

  Pointer<Void> rlReadTexturePixels(int id, int width, int height, int format) {
    return _rlReadTexturePixels(id, width, height, format);
  }

  late final _rlReadTexturePixelsPtr = rl
      .coreLookup<
        NativeFunction<Pointer<Void> Function(UnsignedInt, Int, Int, Int)>
      >('rlReadTexturePixels');
  late final _rlReadTexturePixels = _rlReadTexturePixelsPtr
      .asFunction<Pointer<Void> Function(int, int, int, int)>();

  Pointer<UnsignedChar> rlReadScreenPixels(int width, int height) {
    return _rlReadScreenPixels(width, height);
  }

  late final _rlReadScreenPixelsPtr = rl
      .coreLookup<NativeFunction<Pointer<UnsignedChar> Function(Int, Int)>>(
        'rlReadScreenPixels',
      );
  late final _rlReadScreenPixels = _rlReadScreenPixelsPtr
      .asFunction<Pointer<UnsignedChar> Function(int, int)>();

  int rlLoadFramebuffer() {
    return _rlLoadFramebuffer();
  }

  late final _rlLoadFramebufferPtr = rl
      .coreLookup<NativeFunction<UnsignedInt Function()>>('rlLoadFramebuffer');
  late final _rlLoadFramebuffer = _rlLoadFramebufferPtr
      .asFunction<int Function()>();

  void rlFramebufferAttach(
    int fboId,
    int texId,
    int attachType,
    int texType,
    int mipLevel,
  ) {
    return _rlFramebufferAttach(fboId, texId, attachType, texType, mipLevel);
  }

  late final _rlFramebufferAttachPtr = rl
      .coreLookup<
        NativeFunction<Void Function(UnsignedInt, UnsignedInt, Int, Int, Int)>
      >('rlFramebufferAttach');
  late final _rlFramebufferAttach = _rlFramebufferAttachPtr
      .asFunction<void Function(int, int, int, int, int)>();

  bool rlFramebufferComplete(int id) {
    return _rlFramebufferComplete(id);
  }

  late final _rlFramebufferCompletePtr = rl
      .coreLookup<NativeFunction<Bool Function(UnsignedInt)>>(
        'rlFramebufferComplete',
      );
  late final _rlFramebufferComplete = _rlFramebufferCompletePtr
      .asFunction<bool Function(int)>();

  void rlUnloadFramebuffer(int id) {
    return _rlUnloadFramebuffer(id);
  }

  late final _rlUnloadFramebufferPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlUnloadFramebuffer',
      );
  late final _rlUnloadFramebuffer = _rlUnloadFramebufferPtr
      .asFunction<void Function(int)>();

  int rlLoadShaderCode(Pointer<Char> vsCode, Pointer<Char> fsCode) {
    return _rlLoadShaderCode(vsCode, fsCode);
  }

  late final _rlLoadShaderCodePtr = rl
      .coreLookup<
        NativeFunction<UnsignedInt Function(Pointer<Char>, Pointer<Char>)>
      >('rlLoadShaderCode');
  late final _rlLoadShaderCode = _rlLoadShaderCodePtr
      .asFunction<int Function(Pointer<Char>, Pointer<Char>)>();

  int rlCompileShader(Pointer<Char> shaderCode, int type) {
    return _rlCompileShader(shaderCode, type);
  }

  late final _rlCompileShaderPtr = rl
      .coreLookup<NativeFunction<UnsignedInt Function(Pointer<Char>, Int)>>(
        'rlCompileShader',
      );
  late final _rlCompileShader = _rlCompileShaderPtr
      .asFunction<int Function(Pointer<Char>, int)>();

  int rlLoadShaderProgram(int vShaderId, int fShaderId) {
    return _rlLoadShaderProgram(vShaderId, fShaderId);
  }

  late final _rlLoadShaderProgramPtr = rl
      .coreLookup<
        NativeFunction<UnsignedInt Function(UnsignedInt, UnsignedInt)>
      >('rlLoadShaderProgram');
  late final _rlLoadShaderProgram = _rlLoadShaderProgramPtr
      .asFunction<int Function(int, int)>();

  void rlUnloadShaderProgram(int id) {
    return _rlUnloadShaderProgram(id);
  }

  late final _rlUnloadShaderProgramPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlUnloadShaderProgram',
      );
  late final _rlUnloadShaderProgram = _rlUnloadShaderProgramPtr
      .asFunction<void Function(int)>();

  int rlGetLocationUniform(int shaderId, Pointer<Char> uniformName) {
    return _rlGetLocationUniform(shaderId, uniformName);
  }

  late final _rlGetLocationUniformPtr = rl
      .coreLookup<NativeFunction<Int Function(UnsignedInt, Pointer<Char>)>>(
        'rlGetLocationUniform',
      );
  late final _rlGetLocationUniform = _rlGetLocationUniformPtr
      .asFunction<int Function(int, Pointer<Char>)>();

  int rlGetLocationAttrib(int shaderId, Pointer<Char> attribName) {
    return _rlGetLocationAttrib(shaderId, attribName);
  }

  late final _rlGetLocationAttribPtr = rl
      .coreLookup<NativeFunction<Int Function(UnsignedInt, Pointer<Char>)>>(
        'rlGetLocationAttrib',
      );
  late final _rlGetLocationAttrib = _rlGetLocationAttribPtr
      .asFunction<int Function(int, Pointer<Char>)>();

  void rlSetUniform(
    int locIndex,
    Pointer<Void> value,
    int uniformType,
    int count,
  ) {
    return _rlSetUniform(locIndex, value, uniformType, count);
  }

  late final _rlSetUniformPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Pointer<Void>, Int, Int)>>(
        'rlSetUniform',
      );
  late final _rlSetUniform = _rlSetUniformPtr
      .asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlSetUniformMatrix(int locIndex, MatrixC mat) {
    return _rlSetUniformMatrix(locIndex, mat);
  }

  late final _rlSetUniformMatrixPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, MatrixC)>>(
        'rlSetUniformMatrix',
      );
  late final _rlSetUniformMatrix = _rlSetUniformMatrixPtr
      .asFunction<void Function(int, MatrixC)>();

  void rlSetUniformMatrices(int locIndex, Pointer<MatrixC> mat, int count) {
    return _rlSetUniformMatrices(locIndex, mat, count);
  }

  late final _rlSetUniformMatricesPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, Pointer<MatrixC>, Int)>>(
        'rlSetUniformMatrices',
      );
  late final _rlSetUniformMatrices = _rlSetUniformMatricesPtr
      .asFunction<void Function(int, Pointer<MatrixC>, int)>();

  void rlSetUniformSampler(int locIndex, int textureId) {
    return _rlSetUniformSampler(locIndex, textureId);
  }

  late final _rlSetUniformSamplerPtr = rl
      .coreLookup<NativeFunction<Void Function(Int, UnsignedInt)>>(
        'rlSetUniformSampler',
      );
  late final _rlSetUniformSampler = _rlSetUniformSamplerPtr
      .asFunction<void Function(int, int)>();

  void rlSetShader(int id, Pointer<Int> locs) {
    return _rlSetShader(id, locs);
  }

  late final _rlSetShaderPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt, Pointer<Int>)>>(
        'rlSetShader',
      );
  late final _rlSetShader = _rlSetShaderPtr
      .asFunction<void Function(int, Pointer<Int>)>();

  int rlLoadComputeShaderProgram(int shaderId) {
    return _rlLoadComputeShaderProgram(shaderId);
  }

  late final _rlLoadComputeShaderProgramPtr = rl
      .coreLookup<NativeFunction<UnsignedInt Function(UnsignedInt)>>(
        'rlLoadComputeShaderProgram',
      );
  late final _rlLoadComputeShaderProgram = _rlLoadComputeShaderProgramPtr
      .asFunction<int Function(int)>();

  void rlComputeShaderDispatch(int groupX, int groupY, int groupZ) {
    return _rlComputeShaderDispatch(groupX, groupY, groupZ);
  }

  late final _rlComputeShaderDispatchPtr = rl
      .coreLookup<
        NativeFunction<Void Function(UnsignedInt, UnsignedInt, UnsignedInt)>
      >('rlComputeShaderDispatch');
  late final _rlComputeShaderDispatch = _rlComputeShaderDispatchPtr
      .asFunction<void Function(int, int, int)>();

  int rlLoadShaderBuffer(int size, Pointer<Void> data, int usageHint) {
    return _rlLoadShaderBuffer(size, data, usageHint);
  }

  late final _rlLoadShaderBufferPtr = rl
      .coreLookup<
        NativeFunction<UnsignedInt Function(UnsignedInt, Pointer<Void>, Int)>
      >('rlLoadShaderBuffer');
  late final _rlLoadShaderBuffer = _rlLoadShaderBufferPtr
      .asFunction<int Function(int, Pointer<Void>, int)>();

  void rlUnloadShaderBuffer(int ssboId) {
    return _rlUnloadShaderBuffer(ssboId);
  }

  late final _rlUnloadShaderBufferPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt)>>(
        'rlUnloadShaderBuffer',
      );
  late final _rlUnloadShaderBuffer = _rlUnloadShaderBufferPtr
      .asFunction<void Function(int)>();

  void rlUpdateShaderBuffer(
    int id,
    Pointer<Void> data,
    int dataSize,
    int offset,
  ) {
    return _rlUpdateShaderBuffer(id, data, dataSize, offset);
  }

  late final _rlUpdateShaderBufferPtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(UnsignedInt, Pointer<Void>, UnsignedInt, UnsignedInt)
        >
      >('rlUpdateShaderBuffer');
  late final _rlUpdateShaderBuffer = _rlUpdateShaderBufferPtr
      .asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlBindShaderBuffer(int id, int index) {
    return _rlBindShaderBuffer(id, index);
  }

  late final _rlBindShaderBufferPtr = rl
      .coreLookup<NativeFunction<Void Function(UnsignedInt, UnsignedInt)>>(
        'rlBindShaderBuffer',
      );
  late final _rlBindShaderBuffer = _rlBindShaderBufferPtr
      .asFunction<void Function(int, int)>();

  void rlReadShaderBuffer(int id, Pointer<Void> dest, int count, int offset) {
    return _rlReadShaderBuffer(id, dest, count, offset);
  }

  late final _rlReadShaderBufferPtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(UnsignedInt, Pointer<Void>, UnsignedInt, UnsignedInt)
        >
      >('rlReadShaderBuffer');
  late final _rlReadShaderBuffer = _rlReadShaderBufferPtr
      .asFunction<void Function(int, Pointer<Void>, int, int)>();

  void rlCopyShaderBuffer(
    int destId,
    int srcId,
    int destOffset,
    int srcOffset,
    int count,
  ) {
    return _rlCopyShaderBuffer(destId, srcId, destOffset, srcOffset, count);
  }

  late final _rlCopyShaderBufferPtr = rl
      .coreLookup<
        NativeFunction<
          Void Function(
            UnsignedInt,
            UnsignedInt,
            UnsignedInt,
            UnsignedInt,
            UnsignedInt,
          )
        >
      >('rlCopyShaderBuffer');
  late final _rlCopyShaderBuffer = _rlCopyShaderBufferPtr
      .asFunction<void Function(int, int, int, int, int)>();

  int rlGetShaderBufferSize(int id) {
    return _rlGetShaderBufferSize(id);
  }

  late final _rlGetShaderBufferSizePtr = rl
      .coreLookup<NativeFunction<UnsignedInt Function(UnsignedInt)>>(
        'rlGetShaderBufferSize',
      );
  late final _rlGetShaderBufferSize = _rlGetShaderBufferSizePtr
      .asFunction<int Function(int)>();

  void rlBindImageTexture(int id, int index, int format, bool readonly) {
    return _rlBindImageTexture(id, index, format, readonly);
  }

  late final _rlBindImageTexturePtr = rl
      .coreLookup<
        NativeFunction<Void Function(UnsignedInt, UnsignedInt, Int, Bool)>
      >('rlBindImageTexture');
  late final _rlBindImageTexture = _rlBindImageTexturePtr
      .asFunction<void Function(int, int, int, bool)>();

  MatrixC rlGetMatrixModelview() {
    return _rlGetMatrixModelview();
  }

  late final _rlGetMatrixModelviewPtr = rl
      .coreLookup<NativeFunction<MatrixC Function()>>('rlGetMatrixModelview');
  late final _rlGetMatrixModelview = _rlGetMatrixModelviewPtr
      .asFunction<MatrixC Function()>();

  MatrixC rlGetMatrixProjection() {
    return _rlGetMatrixProjection();
  }

  late final _rlGetMatrixProjectionPtr = rl
      .coreLookup<NativeFunction<MatrixC Function()>>('rlGetMatrixProjection');
  late final _rlGetMatrixProjection = _rlGetMatrixProjectionPtr
      .asFunction<MatrixC Function()>();

  MatrixC rlGetMatrixTransform() {
    return _rlGetMatrixTransform();
  }

  late final _rlGetMatrixTransformPtr = rl
      .coreLookup<NativeFunction<MatrixC Function()>>('rlGetMatrixTransform');
  late final _rlGetMatrixTransform = _rlGetMatrixTransformPtr
      .asFunction<MatrixC Function()>();

  MatrixC rlGetMatrixProjectionStereo(int eye) {
    return _rlGetMatrixProjectionStereo(eye);
  }

  late final _rlGetMatrixProjectionStereoPtr = rl
      .coreLookup<NativeFunction<MatrixC Function(Int)>>(
        'rlGetMatrixProjectionStereo',
      );
  late final _rlGetMatrixProjectionStereo = _rlGetMatrixProjectionStereoPtr
      .asFunction<MatrixC Function(int)>();

  MatrixC rlGetMatrixViewOffsetStereo(int eye) {
    return _rlGetMatrixViewOffsetStereo(eye);
  }

  late final _rlGetMatrixViewOffsetStereoPtr = rl
      .coreLookup<NativeFunction<MatrixC Function(Int)>>(
        'rlGetMatrixViewOffsetStereo',
      );
  late final _rlGetMatrixViewOffsetStereo = _rlGetMatrixViewOffsetStereoPtr
      .asFunction<MatrixC Function(int)>();

  void rlSetMatrixProjection(MatrixC proj) {
    return _rlSetMatrixProjection(proj);
  }

  late final _rlSetMatrixProjectionPtr = rl
      .coreLookup<NativeFunction<Void Function(MatrixC)>>(
        'rlSetMatrixProjection',
      );
  late final _rlSetMatrixProjection = _rlSetMatrixProjectionPtr
      .asFunction<void Function(MatrixC)>();

  void rlSetMatrixModelview(MatrixC view) {
    return _rlSetMatrixModelview(view);
  }

  late final _rlSetMatrixModelviewPtr = rl
      .coreLookup<NativeFunction<Void Function(MatrixC)>>(
        'rlSetMatrixModelview',
      );
  late final _rlSetMatrixModelview = _rlSetMatrixModelviewPtr
      .asFunction<void Function(MatrixC)>();

  void rlSetMatrixProjectionStereo(MatrixC right, MatrixC left) {
    return _rlSetMatrixProjectionStereo(right, left);
  }

  late final _rlSetMatrixProjectionStereoPtr = rl
      .coreLookup<NativeFunction<Void Function(MatrixC, MatrixC)>>(
        'rlSetMatrixProjectionStereo',
      );
  late final _rlSetMatrixProjectionStereo = _rlSetMatrixProjectionStereoPtr
      .asFunction<void Function(MatrixC, MatrixC)>();

  void rlSetMatrixViewOffsetStereo(MatrixC right, MatrixC left) {
    return _rlSetMatrixViewOffsetStereo(right, left);
  }

  late final _rlSetMatrixViewOffsetStereoPtr = rl
      .coreLookup<NativeFunction<Void Function(MatrixC, MatrixC)>>(
        'rlSetMatrixViewOffsetStereo',
      );
  late final _rlSetMatrixViewOffsetStereo = _rlSetMatrixViewOffsetStereoPtr
      .asFunction<void Function(MatrixC, MatrixC)>();

  void rlLoadDrawCube() {
    return _rlLoadDrawCube();
  }

  late final _rlLoadDrawCubePtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlLoadDrawCube');
  late final _rlLoadDrawCube = _rlLoadDrawCubePtr.asFunction<void Function()>();

  void rlLoadDrawQuad() {
    return _rlLoadDrawQuad();
  }

  late final _rlLoadDrawQuadPtr = rl
      .coreLookup<NativeFunction<Void Function()>>('rlLoadDrawQuad');
  late final _rlLoadDrawQuad = _rlLoadDrawQuadPtr.asFunction<void Function()>();
}
