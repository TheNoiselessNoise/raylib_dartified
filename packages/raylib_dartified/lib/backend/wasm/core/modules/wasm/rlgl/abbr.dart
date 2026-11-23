import 'package:raylib_dartified/backend/wasm/abbr/wasm.dart';

RaylibRlgl get _module => Raylib.instance.module();

/// See [RaylibRlgl.rlMatrixMode].
XF1<void> get rlMatrixMode => _module.rlMatrixMode;
/// See [RaylibRlgl.rlPushMatrix].
XF0<void> get rlPushMatrix => _module.rlPushMatrix;
/// See [RaylibRlgl.rlPopMatrix].
XF0<void> get rlPopMatrix => _module.rlPopMatrix;
/// See [RaylibRlgl.rlLoadIdentity].
XF0<void> get rlLoadIdentity => _module.rlLoadIdentity;
/// See [RaylibRlgl.rlTranslatef].
XF3<void> get rlTranslatef => _module.rlTranslatef;
/// See [RaylibRlgl.rlRotatef].
XF4<void> get rlRotatef => _module.rlRotatef;
/// See [RaylibRlgl.rlScalef].
XF3<void> get rlScalef => _module.rlScalef;
/// See [RaylibRlgl.rlMultMatrixf].
XF1<void> get rlMultMatrixf => _module.rlMultMatrixf;
/// See [RaylibRlgl.rlFrustum].
XF6<void> get rlFrustum => _module.rlFrustum;
/// See [RaylibRlgl.rlOrtho].
XF6<void> get rlOrtho => _module.rlOrtho;
/// See [RaylibRlgl.rlViewport].
XF4<void> get rlViewport => _module.rlViewport;
/// See [RaylibRlgl.rlSetClipPlanes].
XF2<void> get rlSetClipPlanes => _module.rlSetClipPlanes;
/// See [RaylibRlgl.rlGetCullDistanceNear].
XF0<double> get rlGetCullDistanceNear => _module.rlGetCullDistanceNear;
/// See [RaylibRlgl.rlGetCullDistanceFar].
XF0<double> get rlGetCullDistanceFar => _module.rlGetCullDistanceFar;
/// See [RaylibRlgl.rlBegin].
XF1<void> get rlBegin => _module.rlBegin;
/// See [RaylibRlgl.rlEnd].
XF0<void> get rlEnd => _module.rlEnd;
/// See [RaylibRlgl.rlVertex2i].
XF2<void> get rlVertex2i => _module.rlVertex2i;
/// See [RaylibRlgl.rlVertex2f].
XF2<void> get rlVertex2f => _module.rlVertex2f;
/// See [RaylibRlgl.rlVertex3f].
XF3<void> get rlVertex3f => _module.rlVertex3f;
/// See [RaylibRlgl.rlTexCoord2f].
XF2<void> get rlTexCoord2f => _module.rlTexCoord2f;
/// See [RaylibRlgl.rlNormal3f].
XF3<void> get rlNormal3f => _module.rlNormal3f;
/// See [RaylibRlgl.rlColor4ub].
XF4<void> get rlColor4ub => _module.rlColor4ub;
/// See [RaylibRlgl.rlColor3f].
XF3<void> get rlColor3f => _module.rlColor3f;
/// See [RaylibRlgl.rlColor4f].
XF4<void> get rlColor4f => _module.rlColor4f;
/// See [RaylibRlgl.rlEnableVertexArray].
XF1<bool> get rlEnableVertexArray => _module.rlEnableVertexArray;
/// See [RaylibRlgl.rlDisableVertexArray].
XF0<void> get rlDisableVertexArray => _module.rlDisableVertexArray;
/// See [RaylibRlgl.rlEnableVertexBuffer].
XF1<void> get rlEnableVertexBuffer => _module.rlEnableVertexBuffer;
/// See [RaylibRlgl.rlDisableVertexBuffer].
XF0<void> get rlDisableVertexBuffer => _module.rlDisableVertexBuffer;
/// See [RaylibRlgl.rlEnableVertexBufferElement].
XF1<void> get rlEnableVertexBufferElement => _module.rlEnableVertexBufferElement;
/// See [RaylibRlgl.rlDisableVertexBufferElement].
XF0<void> get rlDisableVertexBufferElement => _module.rlDisableVertexBufferElement;
/// See [RaylibRlgl.rlEnableVertexAttribute].
XF1<void> get rlEnableVertexAttribute => _module.rlEnableVertexAttribute;
/// See [RaylibRlgl.rlDisableVertexAttribute].
XF1<void> get rlDisableVertexAttribute => _module.rlDisableVertexAttribute;
/// See [RaylibRlgl.rlEnableStatePointer].
XF2<void> get rlEnableStatePointer => _module.rlEnableStatePointer;
/// See [RaylibRlgl.rlDisableStatePointer].
XF1<void> get rlDisableStatePointer => _module.rlDisableStatePointer;
/// See [RaylibRlgl.rlActiveTextureSlot].
XF1<void> get rlActiveTextureSlot => _module.rlActiveTextureSlot;
/// See [RaylibRlgl.rlEnableTexture].
XF1<void> get rlEnableTexture => _module.rlEnableTexture;
/// See [RaylibRlgl.rlDisableTexture].
XF0<void> get rlDisableTexture => _module.rlDisableTexture;
/// See [RaylibRlgl.rlEnableTextureCubemap].
XF1<void> get rlEnableTextureCubemap => _module.rlEnableTextureCubemap;
/// See [RaylibRlgl.rlDisableTextureCubemap].
XF0<void> get rlDisableTextureCubemap => _module.rlDisableTextureCubemap;
/// See [RaylibRlgl.rlTextureParameters].
XF3<void> get rlTextureParameters => _module.rlTextureParameters;
/// See [RaylibRlgl.rlCubemapParameters].
XF3<void> get rlCubemapParameters => _module.rlCubemapParameters;
/// See [RaylibRlgl.rlEnableShader].
XF1<void> get rlEnableShader => _module.rlEnableShader;
/// See [RaylibRlgl.rlDisableShader].
XF0<void> get rlDisableShader => _module.rlDisableShader;
/// See [RaylibRlgl.rlEnableFramebuffer].
XF1<void> get rlEnableFramebuffer => _module.rlEnableFramebuffer;
/// See [RaylibRlgl.rlDisableFramebuffer].
XF0<void> get rlDisableFramebuffer => _module.rlDisableFramebuffer;
/// See [RaylibRlgl.rlGetActiveFramebuffer].
XF0<int> get rlGetActiveFramebuffer => _module.rlGetActiveFramebuffer;
/// See [RaylibRlgl.rlActiveDrawBuffers].
XF1<void> get rlActiveDrawBuffers => _module.rlActiveDrawBuffers;
/// See [RaylibRlgl.rlBlitFramebuffer].
XF9<void> get rlBlitFramebuffer => _module.rlBlitFramebuffer;
/// See [RaylibRlgl.rlBindFramebuffer].
XF2<void> get rlBindFramebuffer => _module.rlBindFramebuffer;
/// See [RaylibRlgl.rlEnableColorBlend].
XF0<void> get rlEnableColorBlend => _module.rlEnableColorBlend;
/// See [RaylibRlgl.rlDisableColorBlend].
XF0<void> get rlDisableColorBlend => _module.rlDisableColorBlend;
/// See [RaylibRlgl.rlEnableDepthTest].
XF0<void> get rlEnableDepthTest => _module.rlEnableDepthTest;
/// See [RaylibRlgl.rlDisableDepthTest].
XF0<void> get rlDisableDepthTest => _module.rlDisableDepthTest;
/// See [RaylibRlgl.rlEnableDepthMask].
XF0<void> get rlEnableDepthMask => _module.rlEnableDepthMask;
/// See [RaylibRlgl.rlDisableDepthMask].
XF0<void> get rlDisableDepthMask => _module.rlDisableDepthMask;
/// See [RaylibRlgl.rlEnableBackfaceCulling].
XF0<void> get rlEnableBackfaceCulling => _module.rlEnableBackfaceCulling;
/// See [RaylibRlgl.rlDisableBackfaceCulling].
XF0<void> get rlDisableBackfaceCulling => _module.rlDisableBackfaceCulling;
/// See [RaylibRlgl.rlColorMask].
XF4<void> get rlColorMask => _module.rlColorMask;
/// See [RaylibRlgl.rlSetCullFace].
XF1<void> get rlSetCullFace => _module.rlSetCullFace;
/// See [RaylibRlgl.rlEnableScissorTest].
XF0<void> get rlEnableScissorTest => _module.rlEnableScissorTest;
/// See [RaylibRlgl.rlDisableScissorTest].
XF0<void> get rlDisableScissorTest => _module.rlDisableScissorTest;
/// See [RaylibRlgl.rlScissor].
XF4<void> get rlScissor => _module.rlScissor;
/// See [RaylibRlgl.rlEnablePointMode].
XF0<void> get rlEnablePointMode => _module.rlEnablePointMode;
/// See [RaylibRlgl.rlDisablePointMode].
XF0<void> get rlDisablePointMode => _module.rlDisablePointMode;
/// See [RaylibRlgl.rlSetPointSize].
XF1<void> get rlSetPointSize => _module.rlSetPointSize;
/// See [RaylibRlgl.rlGetPointSize].
XF0<double> get rlGetPointSize => _module.rlGetPointSize;
/// See [RaylibRlgl.rlEnableWireMode].
XF0<void> get rlEnableWireMode => _module.rlEnableWireMode;
/// See [RaylibRlgl.rlDisableWireMode].
XF0<void> get rlDisableWireMode => _module.rlDisableWireMode;
/// See [RaylibRlgl.rlSetLineWidth].
XF1<void> get rlSetLineWidth => _module.rlSetLineWidth;
/// See [RaylibRlgl.rlGetLineWidth].
XF0<double> get rlGetLineWidth => _module.rlGetLineWidth;
/// See [RaylibRlgl.rlEnableSmoothLines].
XF0<void> get rlEnableSmoothLines => _module.rlEnableSmoothLines;
/// See [RaylibRlgl.rlDisableSmoothLines].
XF0<void> get rlDisableSmoothLines => _module.rlDisableSmoothLines;
/// See [RaylibRlgl.rlEnableStereoRender].
XF0<void> get rlEnableStereoRender => _module.rlEnableStereoRender;
/// See [RaylibRlgl.rlDisableStereoRender].
XF0<void> get rlDisableStereoRender => _module.rlDisableStereoRender;
/// See [RaylibRlgl.rlIsStereoRenderEnabled].
XF0<bool> get rlIsStereoRenderEnabled => _module.rlIsStereoRenderEnabled;
/// See [RaylibRlgl.rlClearColor].
XF4<void> get rlClearColor => _module.rlClearColor;
/// See [RaylibRlgl.rlClearScreenBuffers].
XF0<void> get rlClearScreenBuffers => _module.rlClearScreenBuffers;
/// See [RaylibRlgl.rlCheckErrors].
XF0<void> get rlCheckErrors => _module.rlCheckErrors;
/// See [RaylibRlgl.rlSetBlendMode].
XF1<void> get rlSetBlendMode => _module.rlSetBlendMode;
/// See [RaylibRlgl.rlSetBlendFactors].
XF3<void> get rlSetBlendFactors => _module.rlSetBlendFactors;
/// See [RaylibRlgl.rlSetBlendFactorsSeparate].
XF6<void> get rlSetBlendFactorsSeparate => _module.rlSetBlendFactorsSeparate;
/// See [RaylibRlgl.rlglInit].
XF2<void> get rlglInit => _module.rlglInit;
/// See [RaylibRlgl.rlglClose].
XF0<void> get rlglClose => _module.rlglClose;
/// See [RaylibRlgl.rlLoadExtensions].
XF1<void> get rlLoadExtensions => _module.rlLoadExtensions;
/// See [RaylibRlgl.rlGetProcAddress].
XF1<XWasmPtr<XVoid>> get rlGetProcAddress => _module.rlGetProcAddress;
/// See [RaylibRlgl.rlGetVersion].
XF0<int> get rlGetVersion => _module.rlGetVersion;
/// See [RaylibRlgl.rlSetFramebufferWidth].
XF1<void> get rlSetFramebufferWidth => _module.rlSetFramebufferWidth;
/// See [RaylibRlgl.rlGetFramebufferWidth].
XF0<int> get rlGetFramebufferWidth => _module.rlGetFramebufferWidth;
/// See [RaylibRlgl.rlSetFramebufferHeight].
XF1<void> get rlSetFramebufferHeight => _module.rlSetFramebufferHeight;
/// See [RaylibRlgl.rlGetFramebufferHeight].
XF0<int> get rlGetFramebufferHeight => _module.rlGetFramebufferHeight;
/// See [RaylibRlgl.rlGetTextureIdDefault].
XF0<int> get rlGetTextureIdDefault => _module.rlGetTextureIdDefault;
/// See [RaylibRlgl.rlGetShaderIdDefault].
XF0<int> get rlGetShaderIdDefault => _module.rlGetShaderIdDefault;
/// See [RaylibRlgl.rlGetShaderLocsDefault].
XF0<XWasmPtr<XInt>> get rlGetShaderLocsDefault => _module.rlGetShaderLocsDefault;
/// See [RaylibRlgl.rlLoadRenderBatch].
XF3<void> get rlLoadRenderBatch => _module.rlLoadRenderBatch;
/// See [RaylibRlgl.rlUnloadRenderBatch].
XF1<void> get rlUnloadRenderBatch => _module.rlUnloadRenderBatch;
/// See [RaylibRlgl.rlDrawRenderBatch].
XF1<void> get rlDrawRenderBatch => _module.rlDrawRenderBatch;
/// See [RaylibRlgl.rlSetRenderBatchActive].
XF1<void> get rlSetRenderBatchActive => _module.rlSetRenderBatchActive;
/// See [RaylibRlgl.rlDrawRenderBatchActive].
XF0<void> get rlDrawRenderBatchActive => _module.rlDrawRenderBatchActive;
/// See [RaylibRlgl.rlCheckRenderBatchLimit].
XF1<bool> get rlCheckRenderBatchLimit => _module.rlCheckRenderBatchLimit;
/// See [RaylibRlgl.rlSetTexture].
XF1<void> get rlSetTexture => _module.rlSetTexture;
/// See [RaylibRlgl.rlLoadVertexArray].
XF0<int> get rlLoadVertexArray => _module.rlLoadVertexArray;
/// See [RaylibRlgl.rlLoadVertexBuffer].
XF3<int> get rlLoadVertexBuffer => _module.rlLoadVertexBuffer;
/// See [RaylibRlgl.rlLoadVertexBufferElement].
XF3<int> get rlLoadVertexBufferElement => _module.rlLoadVertexBufferElement;
/// See [RaylibRlgl.rlUpdateVertexBuffer].
XF4<void> get rlUpdateVertexBuffer => _module.rlUpdateVertexBuffer;
/// See [RaylibRlgl.rlUpdateVertexBufferElements].
XF4<void> get rlUpdateVertexBufferElements => _module.rlUpdateVertexBufferElements;
/// See [RaylibRlgl.rlUnloadVertexArray].
XF1<void> get rlUnloadVertexArray => _module.rlUnloadVertexArray;
/// See [RaylibRlgl.rlUnloadVertexBuffer].
XF1<void> get rlUnloadVertexBuffer => _module.rlUnloadVertexBuffer;
/// See [RaylibRlgl.rlSetVertexAttribute].
XF6<void> get rlSetVertexAttribute => _module.rlSetVertexAttribute;
/// See [RaylibRlgl.rlSetVertexAttributeDivisor].
XF2<void> get rlSetVertexAttributeDivisor => _module.rlSetVertexAttributeDivisor;
/// See [RaylibRlgl.rlSetVertexAttributeDefault].
XF4<void> get rlSetVertexAttributeDefault => _module.rlSetVertexAttributeDefault;
/// See [RaylibRlgl.rlDrawVertexArray].
XF2<void> get rlDrawVertexArray => _module.rlDrawVertexArray;
/// See [RaylibRlgl.rlDrawVertexArrayElements].
XF3<void> get rlDrawVertexArrayElements => _module.rlDrawVertexArrayElements;
/// See [RaylibRlgl.rlDrawVertexArrayInstanced].
XF3<void> get rlDrawVertexArrayInstanced => _module.rlDrawVertexArrayInstanced;
/// See [RaylibRlgl.rlDrawVertexArrayElementsInstanced].
XF4<void> get rlDrawVertexArrayElementsInstanced => _module.rlDrawVertexArrayElementsInstanced;
/// See [RaylibRlgl.rlLoadTexture].
XF5<int> get rlLoadTexture => _module.rlLoadTexture;
/// See [RaylibRlgl.rlLoadTextureDepth].
XF3<int> get rlLoadTextureDepth => _module.rlLoadTextureDepth;
/// See [RaylibRlgl.rlLoadTextureCubemap].
XF4<int> get rlLoadTextureCubemap => _module.rlLoadTextureCubemap;
/// See [RaylibRlgl.rlUpdateTexture].
XF7<void> get rlUpdateTexture => _module.rlUpdateTexture;
/// See [RaylibRlgl.rlGetGlTextureFormats].
XF4<void> get rlGetGlTextureFormats => _module.rlGetGlTextureFormats;
/// See [RaylibRlgl.rlGetPixelFormatName].
XF1<XWasmPtr<XChar>> get rlGetPixelFormatName => _module.rlGetPixelFormatName;
/// See [RaylibRlgl.rlUnloadTexture].
XF1<void> get rlUnloadTexture => _module.rlUnloadTexture;
/// See [RaylibRlgl.rlGenTextureMipmaps].
XF5<void> get rlGenTextureMipmaps => _module.rlGenTextureMipmaps;
/// See [RaylibRlgl.rlReadTexturePixels].
XF4<XWasmPtr<XVoid>> get rlReadTexturePixels => _module.rlReadTexturePixels;
/// See [RaylibRlgl.rlReadScreenPixels].
XF2<XWasmPtr<XUnsignedChar>> get rlReadScreenPixels => _module.rlReadScreenPixels;
/// See [RaylibRlgl.rlLoadFramebuffer].
XF0<int> get rlLoadFramebuffer => _module.rlLoadFramebuffer;
/// See [RaylibRlgl.rlFramebufferAttach].
XF5<void> get rlFramebufferAttach => _module.rlFramebufferAttach;
/// See [RaylibRlgl.rlFramebufferComplete].
XF1<bool> get rlFramebufferComplete => _module.rlFramebufferComplete;
/// See [RaylibRlgl.rlUnloadFramebuffer].
XF1<void> get rlUnloadFramebuffer => _module.rlUnloadFramebuffer;
/// See [RaylibRlgl.rlCopyFramebuffer].
XF6<void> get rlCopyFramebuffer => _module.rlCopyFramebuffer;
/// See [RaylibRlgl.rlResizeFramebuffer].
XF2<void> get rlResizeFramebuffer => _module.rlResizeFramebuffer;
/// See [RaylibRlgl.rlLoadShader].
XF2<int> get rlLoadShader => _module.rlLoadShader;
/// See [RaylibRlgl.rlLoadShaderProgram].
XF2<int> get rlLoadShaderProgram => _module.rlLoadShaderProgram;
/// See [RaylibRlgl.rlLoadShaderProgramEx].
XF2<int> get rlLoadShaderProgramEx => _module.rlLoadShaderProgramEx;
/// See [RaylibRlgl.rlLoadShaderProgramCompute].
XF1<int> get rlLoadShaderProgramCompute => _module.rlLoadShaderProgramCompute;
/// See [RaylibRlgl.rlUnloadShader].
XF1<void> get rlUnloadShader => _module.rlUnloadShader;
/// See [RaylibRlgl.rlUnloadShaderProgram].
XF1<void> get rlUnloadShaderProgram => _module.rlUnloadShaderProgram;
/// See [RaylibRlgl.rlGetLocationUniform].
XF2<int> get rlGetLocationUniform => _module.rlGetLocationUniform;
/// See [RaylibRlgl.rlGetLocationAttrib].
XF2<int> get rlGetLocationAttrib => _module.rlGetLocationAttrib;
/// See [RaylibRlgl.rlSetUniform].
XF4<void> get rlSetUniform => _module.rlSetUniform;
/// See [RaylibRlgl.rlSetUniformMatrix].
XF2<void> get rlSetUniformMatrix => _module.rlSetUniformMatrix;
/// See [RaylibRlgl.rlSetUniformMatrices].
XF3<void> get rlSetUniformMatrices => _module.rlSetUniformMatrices;
/// See [RaylibRlgl.rlSetUniformSampler].
XF2<void> get rlSetUniformSampler => _module.rlSetUniformSampler;
/// See [RaylibRlgl.rlSetShader].
XF2<void> get rlSetShader => _module.rlSetShader;
/// See [RaylibRlgl.rlComputeShaderDispatch].
XF3<void> get rlComputeShaderDispatch => _module.rlComputeShaderDispatch;
/// See [RaylibRlgl.rlLoadShaderBuffer].
XF3<int> get rlLoadShaderBuffer => _module.rlLoadShaderBuffer;
/// See [RaylibRlgl.rlUnloadShaderBuffer].
XF1<void> get rlUnloadShaderBuffer => _module.rlUnloadShaderBuffer;
/// See [RaylibRlgl.rlUpdateShaderBuffer].
XF4<void> get rlUpdateShaderBuffer => _module.rlUpdateShaderBuffer;
/// See [RaylibRlgl.rlBindShaderBuffer].
XF2<void> get rlBindShaderBuffer => _module.rlBindShaderBuffer;
/// See [RaylibRlgl.rlReadShaderBuffer].
XF4<void> get rlReadShaderBuffer => _module.rlReadShaderBuffer;
/// See [RaylibRlgl.rlCopyShaderBuffer].
XF5<void> get rlCopyShaderBuffer => _module.rlCopyShaderBuffer;
/// See [RaylibRlgl.rlGetShaderBufferSize].
XF1<int> get rlGetShaderBufferSize => _module.rlGetShaderBufferSize;
/// See [RaylibRlgl.rlBindImageTexture].
XF4<void> get rlBindImageTexture => _module.rlBindImageTexture;
/// See [RaylibRlgl.rlGetMatrixModelview].
XF1<void> get rlGetMatrixModelview => _module.rlGetMatrixModelview;
/// See [RaylibRlgl.rlGetMatrixProjection].
XF1<void> get rlGetMatrixProjection => _module.rlGetMatrixProjection;
/// See [RaylibRlgl.rlGetMatrixTransform].
XF1<void> get rlGetMatrixTransform => _module.rlGetMatrixTransform;
/// See [RaylibRlgl.rlGetMatrixProjectionStereo].
XF2<void> get rlGetMatrixProjectionStereo => _module.rlGetMatrixProjectionStereo;
/// See [RaylibRlgl.rlGetMatrixViewOffsetStereo].
XF2<void> get rlGetMatrixViewOffsetStereo => _module.rlGetMatrixViewOffsetStereo;
/// See [RaylibRlgl.rlSetMatrixProjection].
XF1<void> get rlSetMatrixProjection => _module.rlSetMatrixProjection;
/// See [RaylibRlgl.rlSetMatrixModelview].
XF1<void> get rlSetMatrixModelview => _module.rlSetMatrixModelview;
/// See [RaylibRlgl.rlSetMatrixProjectionStereo].
XF2<void> get rlSetMatrixProjectionStereo => _module.rlSetMatrixProjectionStereo;
/// See [RaylibRlgl.rlSetMatrixViewOffsetStereo].
XF2<void> get rlSetMatrixViewOffsetStereo => _module.rlSetMatrixViewOffsetStereo;
/// See [RaylibRlgl.rlLoadDrawCube].
XF0<void> get rlLoadDrawCube => _module.rlLoadDrawCube;
/// See [RaylibRlgl.rlLoadDrawQuad].
XF0<void> get rlLoadDrawQuad => _module.rlLoadDrawQuad;