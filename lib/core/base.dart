part of 'raylib.dart';

typedef RaylibLookup = Pointer<T> Function<T extends NativeType>(String symbolName);
typedef RaylibModuleConstructor<T> = T Function(Raylib);

abstract class BaseRaylibModule {
  final Raylib rl;
  
  BaseRaylibModule(this.rl);

  bool _isLoaded = false;
  void _doLoad() {
    if (_isLoaded) return;
    _isLoaded = true;
    load();
  }

  void load() {}

  Logger get logger => rl.logger;

  bool _debugEnabled = false;
  void debug(bool v) => _debugEnabled = v;

  bool _debugTime = false;
  void debugTime(bool v) => _debugTime = true;
  
  void logInfo(String message) => logger.info(message);
  void logWarn(String message) => logger.warning(message);

  final List<bool Function(String)> _debugFilters = [];
  void debugFilter(bool Function(String) filter) => _debugFilters.add(filter);
  bool _matchesFilters(String message) => _debugFilters.isEmpty || _debugFilters.any((f) => f(message));

  void debugInfo(String message) { if (_debugEnabled && _matchesFilters(message)) logInfo(message); }
  void debugWarn(String message) { if (_debugEnabled && _matchesFilters(message)) logWarn(message); }

  T disableSync<T>(T Function() f) {
    final oldSyncing = rl.Temp.doSync;
    rl.Temp.enableSyncing(false);
    final result = f();
    rl.Temp.enableSyncing(oldSyncing);
    return result;
  }

  T run<T>(String Function() name, T Function() f) {
    if (_debugEnabled) {
      final label = '[$runtimeType] ${name()}';
      if (_matchesFilters(label)) {
        if (_debugTime) return rl.timeIt(label, f);
        logInfo(label);
      }
    }
    return f();
  }

  final List<void Function()> _onDisposeFns = [];
  void onDispose(void Function() fn) => _onDisposeFns.add(fn);

  @mustCallSuper
  void dispose() {
    _onDisposeFns.forEach((f) => f());
    _onDisposeFns.clear();
  }
}

abstract class RaylibModule extends BaseRaylibModule {
  RaylibModule(super.rl);
}

mixin HasTempHelpers {
  Raylib get rl;

  // Helpers

  String refId(String x) => '${rl.Temp.nextId()}_$x';

  Pointer<U> refPtrStructOrNull<U extends Struct, D extends StructD<D, U>>(
    D? x, String key, Pointer<U> Function([D, String]) alloc
  ) => x == null ? nullptr : alloc(x, key);

  Pointer<U> refPtrLitOrNull<U extends NativeType, D>(
    D? x, String key, Pointer<U> Function([D, String]) alloc
  ) => x == null ? nullptr : alloc(x, key);

  Pointer<U> refLitSized<U extends NativeType, D>(
    int count, String? key, Pointer<U> Function(String, [int]) alloc
  ) => alloc(key ?? 'Sized$U', count);

  T refUpdateNullable$<T, C extends Struct, D extends StructD<D, C>>(
    D? o,
    T Function(Pointer<C> p) callback,
    Pointer<C> Function(D) alloc,
    void Function(Pointer<C> p, D o) update,
  ) {
    final p = o != null ? alloc(o) : nullptr;
    final result = callback(p);
    if (o != null) update(p, o);
    return result;
  }
}

mixin HasTempRefs on HasTempHelpers {

  // Literals

  Pointer<Char> refStr(String? s) => s == null ? nullptr : rl.Temp.str(s);

  Pointer<Char> refListChar(List<num> y, [String? x]) => rl.Temp.Char$.Array(y, key: x);
  Pointer<Char> refChar1([int? y]) => rl.Temp.Char$.Value(y, '1');
  Pointer<Char> refChar2([int? y]) => rl.Temp.Char$.Value(y, '2');
  Pointer<Char> refChar3([int? y]) => rl.Temp.Char$.Value(y, '3');
  Pointer<Char> refChar4([int? y]) => rl.Temp.Char$.Value(y, '4');
  Pointer<Char> refChar1OrNull([int? y]) => refPtrLitOrNull(y, '1', rl.Temp.Char$.Value);
  Pointer<Char> refChar2OrNull([int? y]) => refPtrLitOrNull(y, '2', rl.Temp.Char$.Value);
  Pointer<Char> refChar3OrNull([int? y]) => refPtrLitOrNull(y, '3', rl.Temp.Char$.Value);
  Pointer<Char> refChar4OrNull([int? y]) => refPtrLitOrNull(y, '4', rl.Temp.Char$.Value);
  
  Pointer<Int> refListInt(List<num> y, [String? x]) => rl.Temp.Int$.Array(y, key: x);
  Pointer<Int> refInt1([int? y]) => rl.Temp.Int$.Value(y, '1');
  Pointer<Int> refInt2([int? y]) => rl.Temp.Int$.Value(y, '2');
  Pointer<Int> refInt3([int? y]) => rl.Temp.Int$.Value(y, '3');
  Pointer<Int> refInt4([int? y]) => rl.Temp.Int$.Value(y, '4');
  Pointer<Int> refInt1OrNull([int? y]) => refPtrLitOrNull(y, '1', rl.Temp.Int$.Value);
  Pointer<Int> refInt2OrNull([int? y]) => refPtrLitOrNull(y, '2', rl.Temp.Int$.Value);
  Pointer<Int> refInt3OrNull([int? y]) => refPtrLitOrNull(y, '3', rl.Temp.Int$.Value);
  Pointer<Int> refInt4OrNull([int? y]) => refPtrLitOrNull(y, '4', rl.Temp.Int$.Value);
  
  Pointer<UnsignedInt> refListUInt(List<num> y, [String? x]) => rl.Temp.UnsignedInt$.Array(y, key: x);
  Pointer<UnsignedInt> refUInt1([int? y]) => rl.Temp.UnsignedInt$.Value(y, '1');
  Pointer<UnsignedInt> refUInt2([int? y]) => rl.Temp.UnsignedInt$.Value(y, '2');
  Pointer<UnsignedInt> refUInt3([int? y]) => rl.Temp.UnsignedInt$.Value(y, '3');
  Pointer<UnsignedInt> refUInt4([int? y]) => rl.Temp.UnsignedInt$.Value(y, '4');
  Pointer<UnsignedInt> refUInt1OrNull([int? y]) => refPtrLitOrNull(y, '1', rl.Temp.UnsignedInt$.Value);
  Pointer<UnsignedInt> refUInt2OrNull([int? y]) => refPtrLitOrNull(y, '2', rl.Temp.UnsignedInt$.Value);
  Pointer<UnsignedInt> refUInt3OrNull([int? y]) => refPtrLitOrNull(y, '3', rl.Temp.UnsignedInt$.Value);
  Pointer<UnsignedInt> refUInt4OrNull([int? y]) => refPtrLitOrNull(y, '4', rl.Temp.UnsignedInt$.Value);

  Pointer<Short> refListShort(List<num> y, [String? x]) => rl.Temp.Short$.Array(y, key: x);
  Pointer<Short> refShort1([int? y]) => rl.Temp.Short$.Value(y, '1');
  Pointer<Short> refShort2([int? y]) => rl.Temp.Short$.Value(y, '2');
  Pointer<Short> refShort3([int? y]) => rl.Temp.Short$.Value(y, '3');
  Pointer<Short> refShort4([int? y]) => rl.Temp.Short$.Value(y, '4');
  Pointer<Short> refShort1OrNull([int? y]) => refPtrLitOrNull(y, '1', rl.Temp.Short$.Value);
  Pointer<Short> refShort2OrNull([int? y]) => refPtrLitOrNull(y, '2', rl.Temp.Short$.Value);
  Pointer<Short> refShort3OrNull([int? y]) => refPtrLitOrNull(y, '3', rl.Temp.Short$.Value);
  Pointer<Short> refShort4OrNull([int? y]) => refPtrLitOrNull(y, '4', rl.Temp.Short$.Value);

  Pointer<Float> refListFloat(List<num> y, [String? x]) => rl.Temp.Float$.Array(y, key: x);
  Pointer<Float> refFloat1([double? y, String? x]) => rl.Temp.Float$.Value(y, x ?? '1');
  Pointer<Float> refFloat2([double? y, String? x]) => rl.Temp.Float$.Value(y, x ?? '2');
  Pointer<Float> refFloat3([double? y, String? x]) => rl.Temp.Float$.Value(y, x ?? '3');
  Pointer<Float> refFloat4([double? y, String? x]) => rl.Temp.Float$.Value(y, x ?? '4');
  Pointer<Float> refFloat1OrNull([double? y]) => refPtrLitOrNull(y, '1', rl.Temp.Float$.Value);
  Pointer<Float> refFloat2OrNull([double? y]) => refPtrLitOrNull(y, '2', rl.Temp.Float$.Value);
  Pointer<Float> refFloat3OrNull([double? y]) => refPtrLitOrNull(y, '3', rl.Temp.Float$.Value);
  Pointer<Float> refFloat4OrNull([double? y]) => refPtrLitOrNull(y, '4', rl.Temp.Float$.Value);

  Pointer<Bool> refListBool(List<bool> y, [String? x]) => rl.Temp.Bool$.Array(y, key: x);
  Pointer<Bool> refBool1([bool? y, String? x]) => rl.Temp.Bool$.Value(y, x ?? '1');
  Pointer<Bool> refBool2([bool? y, String? x]) => rl.Temp.Bool$.Value(y, x ?? '2');
  Pointer<Bool> refBool3([bool? y, String? x]) => rl.Temp.Bool$.Value(y, x ?? '3');
  Pointer<Bool> refBool4([bool? y, String? x]) => rl.Temp.Bool$.Value(y, x ?? '4');
  Pointer<Bool> refBool1OrNull([bool? y]) => refPtrLitOrNull(y, '1', rl.Temp.Bool$.Value);
  Pointer<Bool> refBool2OrNull([bool? y]) => refPtrLitOrNull(y, '2', rl.Temp.Bool$.Value);
  Pointer<Bool> refBool3OrNull([bool? y]) => refPtrLitOrNull(y, '3', rl.Temp.Bool$.Value);
  Pointer<Bool> refBool4OrNull([bool? y]) => refPtrLitOrNull(y, '4', rl.Temp.Bool$.Value);
  
  Pointer<Pointer<Char>> refListString(List<String> y, [String? x]) => rl.Temp.String$.Array(y, key: x);
  Pointer<Char> refString1([String? y]) => rl.Temp.String$.ValueAt('1', y);
  Pointer<Char> refString2([String? y]) => rl.Temp.String$.ValueAt('2', y);
  Pointer<Char> refString3([String? y]) => rl.Temp.String$.ValueAt('3', y);
  Pointer<Char> refString4([String? y]) => rl.Temp.String$.ValueAt('4', y);

  Pointer<Uint8> refSizedUInt8(int count, [String? x]) => refLitSized(count, x, rl.Temp.Uint8$.At);
  Pointer<Uint8> refListUInt8(List<num> y, [String? x]) => rl.Temp.Uint8$.Array(y, key: x);
  Pointer<Uint8> refTypedListUInt8(Uint8List y, [String? x]) => rl.Temp.Uint8$.Array(y.toList(), key: x);
  Pointer<Uint8> refTypedDataUInt8(TypedData y, [String? x]) => refTypedListUInt8(y.buffer.asUint8List(y.offsetInBytes, y.lengthInBytes), x);
  
  Pointer<Float> refTypedListFloat(Float32List y, [String? x]) => rl.Temp.Float$.Array(y.toList(), key: x);
  Pointer<Uint16> refTypedListUInt16(Uint16List y, [String? x]) => rl.Temp.Uint16$.Array(y.toList(), key: x);
  Pointer<Int32> refTypedListInt32(Int32List y, [String? x]) => rl.Temp.Int32$.Array(y.toList(), key: x);
  Pointer<Uint32> refTypedListUInt32(Uint32List y, [String? x]) => rl.Temp.Uint32$.Array(y.toList(), key: x);
  Pointer<UnsignedChar> refListUChars(List<num> y, [String? x]) => rl.Temp.UnsignedChar$.Array(y, key: x);
}

abstract class RaylibModuleD extends RaylibModule
  with
    HasTempHelpers,
    HasTempRefs {

  RaylibModuleD(super.rl);

  // Structs

  Pointer<Vector2C> _refListVector2(List<Vector2D> y, [String? x]) => rl.Temp.Vector2$.Array(y, key: x);
  Pointer<Vector2C> _refVector21([Vector2D? x]) => refPtrStructOrNull(x, '1', rl.Temp.Vector2$.ToC);
  Pointer<Vector2C> _refVector22([Vector2D? x]) => refPtrStructOrNull(x, '2', rl.Temp.Vector2$.ToC);
  Pointer<Vector2C> _refVector23([Vector2D? x]) => refPtrStructOrNull(x, '3', rl.Temp.Vector2$.ToC);
  Pointer<Vector2C> _refVector24([Vector2D? x]) => refPtrStructOrNull(x, '4', rl.Temp.Vector2$.ToC);
  Pointer<Vector2C> _refVector25([Vector2D? x]) => refPtrStructOrNull(x, '5', rl.Temp.Vector2$.ToC);
  
  Pointer<Vector3C> _refListVector3(List<Vector3D> y, [String? x]) => rl.Temp.Vector3$.Array(y, key: x);
  Pointer<Vector3C> _refVector31([Vector3D? x]) => refPtrStructOrNull(x, '1', rl.Temp.Vector3$.ToC);
  Pointer<Vector3C> _refVector32([Vector3D? x]) => refPtrStructOrNull(x, '2', rl.Temp.Vector3$.ToC);
  Pointer<Vector3C> _refVector33([Vector3D? x]) => refPtrStructOrNull(x, '3', rl.Temp.Vector3$.ToC);
  Pointer<Vector3C> _refVector34([Vector3D? x]) => refPtrStructOrNull(x, '4', rl.Temp.Vector3$.ToC);
  Pointer<Vector4C> _refVector41([Vector4D? x]) => refPtrStructOrNull(x, '1', rl.Temp.Vector4$.ToC);
  
  Pointer<ColorC> _refColor1([ColorD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Color$.ToC);
  Pointer<ColorC> _refColor2([ColorD? x]) => refPtrStructOrNull(x, '2', rl.Temp.Color$.ToC);
  Pointer<ColorC> _refColor3([ColorD? x]) => refPtrStructOrNull(x, '3', rl.Temp.Color$.ToC);
  Pointer<ColorC> _refColor4([ColorD? x]) => refPtrStructOrNull(x, '4', rl.Temp.Color$.ToC);
  
  Pointer<ImageC> _refListImage(List<ImageD> y, [String? x]) => rl.Temp.Image$.Array(y, key: x);
  Pointer<ImageC> _refImage1([ImageD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Image$.ToC);
  Pointer<ImageC> _refImage2([ImageD? x]) => refPtrStructOrNull(x, '2', rl.Temp.Image$.ToC);
  
  Pointer<Camera2DC> _refCamera2D1([Camera2DD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Camera2D$.ToC);
  Pointer<Camera3DC> _refCamera3D1([Camera3DD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Camera3D$.ToC);
  
  Pointer<TextureC> _refTexture1([TextureD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Texture$.ToC);
  Pointer<NPatchInfoC> _refNPatchInfo1([NPatchInfoD? x]) => refPtrStructOrNull(x, '1', rl.Temp.NPatchInfo$.ToC);
  Pointer<RenderTextureC> _refRenderTexture1([RenderTextureD? x]) => refPtrStructOrNull(x, '1', rl.Temp.RenderTexture$.ToC);
  Pointer<ShaderC> _refShader1([ShaderD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Shader$.ToC);
  Pointer<FontC> _refFont1([FontD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Font$.ToC);
  Pointer<MatrixC> _refListMatrix(List<MatrixD> y, [String? x]) => rl.Temp.Matrix$.Array(y, key: x);
  Pointer<MatrixC> _refMatrix1([MatrixD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Matrix$.ToC);
  Pointer<MatrixC> _refMatrix2([MatrixD? x]) => refPtrStructOrNull(x, '2', rl.Temp.Matrix$.ToC);
  
  Pointer<RectangleC> _refRectangle1([RectangleD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Rectangle$.ToC);
  Pointer<RectangleC> _refRectangle2([RectangleD? x]) => refPtrStructOrNull(x, '2', rl.Temp.Rectangle$.ToC);
  Pointer<RectangleC> _refRectangle3([RectangleD? x]) => refPtrStructOrNull(x, '3', rl.Temp.Rectangle$.ToC);
  
  Pointer<GlyphInfoC> _refListGlyphInfo(List<GlyphInfoD> y, [String? x])
    => y.firstOrNull?.originalPointer ?? rl.Temp.GlyphInfo$.Array(y, key: x);
  Pointer<RayC> _refRay1([RayD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Ray$.ToC);
  
  Pointer<BoundingBoxC> _refBoundingBox1([BoundingBoxD? x]) => refPtrStructOrNull(x, '1', rl.Temp.BoundingBox$.ToC);
  Pointer<BoundingBoxC> _refBoundingBox2([BoundingBoxD? x]) => refPtrStructOrNull(x, '2', rl.Temp.BoundingBox$.ToC);
  
  Pointer<MeshC> _refMesh1([MeshD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Mesh$.ToC);
  Pointer<MaterialC> _refMaterial1([MaterialD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Material$.ToC);
  Pointer<ModelC> _refModel1([ModelD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Model$.ToC);
  Pointer<ModelAnimationC> _refModelAnimation1([ModelAnimationD? x]) => refPtrStructOrNull(x, '1', rl.Temp.ModelAnimation$.ToC);
  Pointer<RlRenderBatchC> _refRlRenderBatch1([RlRenderBatchD? x]) => refPtrStructOrNull(x, '1', rl.Temp.RlRenderBatch$.ToC);
  Pointer<AudioStreamC> _refAudioStream1([AudioStreamD? x]) => refPtrStructOrNull(x, '1', rl.Temp.AudioStream$.ToC);
  Pointer<MusicC> _refMusic1([MusicD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Music$.ToC);
  Pointer<AutomationEventListC> _refAutomationEventList1([AutomationEventListD? x]) => refPtrStructOrNull(x, '1', rl.Temp.AutomationEventList$.ToC);
  Pointer<VrDeviceInfoC> _refVrDeviceInfo1([VrDeviceInfoD? x]) => refPtrStructOrNull(x, '1', rl.Temp.VrDeviceInfo$.ToC);
  Pointer<VrStereoConfigC> _refVrStereoConfig1([VrStereoConfigD? x]) => refPtrStructOrNull(x, '1', rl.Temp.VrStereoConfig$.ToC);
  Pointer<AutomationEventC> _refAutomationEvent1([AutomationEventD? x]) => refPtrStructOrNull(x, '1', rl.Temp.AutomationEvent$.ToC);
  Pointer<SoundC> _refSound1([SoundD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Sound$.ToC);
  Pointer<WaveC> _refWave1([WaveD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Wave$.ToC);
  Pointer<WaveC> _refWave2([WaveD? x]) => refPtrStructOrNull(x, '2', rl.Temp.Wave$.ToC);
  Pointer<LightC> _refLight1([LightD? x]) => refPtrStructOrNull(x, '1', rl.Temp.Light$.ToC);

  // Capture

  FontD _refCaptureFont(String x, FontC o) => (rl.Temp.Font$.At(refId(x))..ref = o).toD();
  MaterialD _refCaptureMaterial(String x, MaterialC o) => (rl.Temp.Material$.At(refId(x))..ref = o).toD();
  ShaderD _refCaptureShader(String x, ShaderC o) => (rl.Temp.Shader$.At(refId(x))..ref = o).toD();
  MusicD _refCaptureMusic(String x, MusicC o) => (rl.Temp.Music$.At(refId(x))..ref = o).toD();
  RenderTextureD _refCaptureRenderTexture(String x, RenderTextureC o) => (rl.Temp.RenderTexture$.At(refId(x))..ref = o).toD();
  AutomationEventListD _refCaptureAutomationEventList(String x, AutomationEventListC o) => (rl.Temp.AutomationEventList$.At(refId(x))..ref = o).toD();
  FilePathListD _refCaptureFilePathList(String x, FilePathListC o) => (rl.Temp.FilePathList$.At(refId(x))..ref = o).toD();
  VrStereoConfigD _refCaptureVrStereoConfig(String x, VrStereoConfigC o) => (rl.Temp.VrStereoConfig$.At(refId(x))..ref = o).toD();
  ModelD _refCaptureModel(String x, ModelC o) => (rl.Temp.Model$.At(refId(x))..ref = o).toD();
  MeshD _refCaptureMesh(String x, MeshC o) => (rl.Temp.Mesh$.At(refId(x))..ref = o).toD();
  ImageD _refCaptureImage(String x, ImageC o) => (rl.Temp.Image$.At(refId(x))..ref = o).toD();
  TextureD _refCaptureTexture(String x, TextureC o) => (rl.Temp.Texture$.At(refId(x))..ref = o).toD();
  WaveD _refCaptureWave(String x, WaveC o) => (rl.Temp.Wave$.At(refId(x))..ref = o).toD();
  SoundD _refCaptureSound(String x, SoundC o) => (rl.Temp.Sound$.At(refId(x))..ref = o).toD();
  AudioStreamD _refCaptureAudioStream(String x, AudioStreamC o) => (rl.Temp.AudioStream$.At(refId(x))..ref = o).toD();
  RlRenderBatchD _refCaptureRlRenderBatch(String x, RlRenderBatchC o) => (rl.Temp.RlRenderBatch$.At(refId(x))..ref = o).toD();

  // Update

  T _refUpdateModel<T>(ModelD? o, T Function(Pointer<ModelC> p) callback)
    => refUpdateNullable$(o, callback, _refModel1, (p, o) => o.setC(p.ref));

  T _refUpdateModelAnimation<T>(ModelAnimationD? o, T Function(Pointer<ModelAnimationC> p) callback)
    => refUpdateNullable$(o, callback, _refModelAnimation1, (p, o) => o.setC(p.ref));

  T _refUpdateMesh<T>(MeshD? o, T Function(Pointer<MeshC> p) callback)
    => refUpdateNullable$(o, callback, _refMesh1, (p, o) => o.setC(p.ref));

  T _refUpdateImage<T>(ImageD? o, T Function(Pointer<ImageC> p) callback)
    => refUpdateNullable$(o, callback, _refImage1, (p, o) => o.setC(p.ref));

  T _refUpdateTexture<T>(TextureD? o, T Function(Pointer<TextureC> p) callback)
    => refUpdateNullable$(o, callback, _refTexture1, (p, o) => o.setC(p.ref));

  T _refUpdateWave<T>(WaveD? o, T Function(Pointer<WaveC> p) callback)
    => refUpdateNullable$(o, callback, _refWave1, (p, o) => o.setC(p.ref));

  T _refUpdateSound<T>(SoundD? o, T Function(Pointer<SoundC> p) callback)
    => refUpdateNullable$(o, callback, _refSound1, (p, o) => o.setC(p.ref));

  T _refUpdateAudioStream<T>(AudioStreamD? o, T Function(Pointer<AudioStreamC> p) callback)
    => refUpdateNullable$(o, callback, _refAudioStream1, (p, o) => o.setC(p.ref));

  T _refUpdateRLRenderBatch<T>(RlRenderBatchD? o, T Function(Pointer<RlRenderBatchC> p) callback)
    => refUpdateNullable$(o, callback, _refRlRenderBatch1, (p, o) => o.setC(p.ref));

  T _refUpdateCamera3D<T>(Camera3DD? o, T Function(Pointer<Camera3DC> p) callback)
    => refUpdateNullable$(o, callback, _refCamera3D1, (p, o) => o.setC(p.ref));

  T _refUpdateVector2<T>(Vector2D? o, T Function(Pointer<Vector2C> p) callback)
    => refUpdateNullable$(o, callback, _refVector21, (p, o) => o.setC(p.ref));
  
  T _refUpdateRectangle<T>(RectangleD? o, T Function(Pointer<RectangleC> p) callback)
    => refUpdateNullable$(o, callback, _refRectangle1, (p, o) => o.setC(p.ref));

  T _refUpdateLight<T>(LightD? o, T Function(Pointer<LightC> p) callback)
    => refUpdateNullable$(o, callback, _refLight1, (p, o) => o.setC(p.ref));
}

abstract class CallbackD<C extends Function, D extends Function> {
  late final NativeCallable<C> _callable;
  bool _isDisposed = false;

  D get function;

  late String name;

  CallbackD([String? name]) {
    this.name = name ?? runtimeType.toString();
  }

  // NOTE: Example overriden implementation:
  //       @override
  //       initializer() => .listener(function);
  bool _initialized = false;
  NativeCallable<C> initializer();

  Pointer<NativeFunction<C>> get nativeFunction {
    // NOTE: we initialize in getter, because constructor
    //       initialization made the app hang on exit,
    //       because callbacks were not disposed() properly
    if (!_initialized) {
      _initialized = true;
      _callable = initializer();
    }
    assert(!_isDisposed, '$runtimeType: has been disposed');
    return _callable.nativeFunction;
  }

  List<CallbackD> get registry;

  Pointer<NativeFunction<C>> attach() {
    if (!registry.contains(this)) registry.add(this);
    return nativeFunction;
  }

  void detach([bool keepAlive = false]) {
    if (keepAlive) return;
    registry.remove(this);
    dispose();
  }

  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    _callable.close();
  }

  static void disposeRegistry(List<CallbackD> registry) {
    registry.forEach((f) => f.dispose());
    registry.clear();
  }

  @override
  String toString() => name;
}

abstract class StructD<D extends StructD<D, C>, C extends NativeType> {
  Pointer<C>? originalPointer;

  String _pointerTag = 'default';
  String get tag => _pointerTag;
  @nonVirtual
  D setTag(String newTag) {
    _pointerTag = newTag;
    return this as D;
  }

  String? _allocKey;
  String get allocKey => _allocKey ?? _getBaseKey();

  static int _internalIdCounter = 0;
  int _internalId = -1;
  int get internalId => _internalId;

  StructD({
    this.originalPointer,
  });

  String get structName => runtimeType.toString();

  String get cStructName {
    final name = structName;
    return '${name.substring(0, name.length - 1)}C';
  }

  @nonVirtual
  String _getBaseKey([String? inner]) => '${cStructName}_${tag}_$inner';

  @nonVirtual
  String _getBaseKeyWithId([String? inner]) => '${internalId}_${cStructName}_${tag}_$inner';

  D setC(C o);
  D setD(D o);
  String signature();
  D clone(); // preserves originalPointer
  D copy() { // clone without originalPointer
    final clone = this.clone();
    clone.originalPointer = null;
    return clone;
  }

  bool get _requiresOriginalPointer => true;

  // NOTE: Just redirect the call to `temp.***(key, count)`
  Pointer<C> allocatePointer(RaylibTemp temp, String key, [int count = 1]);

  // NOTE: For syncing D side stuff into C, most of the time just redirect to `writeInto(p.ref)`
  void syncInto(RaylibTemp temp, Pointer<C> p, String key) => allocateInto(temp, p, key);

  // NOTE: In cases you want to allocate some OUR OWN pointers into struct
  void allocateInto(RaylibTemp temp, Pointer<C> p, String key);
  
  // NOTE: Just write everything directly into the reference
  void writeInto(C p);

  bool _isDisposed = false;
  bool get isDisposed => _isDisposed;

  @nonVirtual
  void markDisposed() {
    _isDisposed = true;
    originalPointer = null;
  }

  @nonVirtual
  Pointer<C> getOriginalPointer() {
    if (originalPointer == null) {
      if (!_requiresOriginalPointer) {
        throw StateError(
          '$structName.getOriginalPointer() was called on a value-type struct that never owns a pointer. '
          'This struct is meant to be passed by value via writeInto(), not by reference. '
          'If you need a pointer, use toC() to allocate one into Temp instead.'
        );
      } else {
        throw StateError(
          '$structName.getOriginalPointer() was called but originalPointer is null. '
          'This struct requires a raylib-owned pointer (e.g. from LoadShader, LoadModel, etc.) '
          'but none has been assigned yet or was already Unloaded. Make sure this struct '
          'was obtained via a Load* function and not constructed manually.'
        );
      }
    }
    return originalPointer!;
  }

  @nonVirtual
  Pointer<C> getOriginalPointerAndDispose() {
    final pointer = getOriginalPointer();
    markDisposed();
    return pointer;
  }

  @nonVirtual
  void _warnIfNoOriginalPointer(RaylibTemp temp) {
    if (_requiresOriginalPointer && originalPointer == null) {
      temp.debugWarn(
        "[WARNING]: $structName.toC() called without it's originalPointer set! "
        "This can result in UNDEFINED BEHAVIOR!!!"
      );
    }
  }

  @nonVirtual
  void onOriginalPointer(void Function(Pointer<C> p) callback) {
    if (originalPointer != null) callback(originalPointer!);
  }

  @nonVirtual
  Pointer<C> toC(RaylibTemp temp, String key) {
    String baseKey = _getBaseKey(key);

    if (!_requiresOriginalPointer) {
      final p = allocatePointer(temp, baseKey);
      allocateInto(temp, p, baseKey);
      return p;
    }

    if (_internalId == -1) _internalId = ++_internalIdCounter;
    if (!isDisposed) _warnIfNoOriginalPointer(temp);

    baseKey = _getBaseKeyWithId(key);

    if (originalPointer != null) {
      temp.debugSyncInfo('[SYNC] $structName.syncInto($baseKey)');
      if (isDisposed) return originalPointer!;
      if (!temp.doSync) return originalPointer!;
      
      syncInto(temp, originalPointer!, baseKey);
      return originalPointer!;
    }

    temp.debugSyncInfo('[SYNC] $structName.allocatePointer($baseKey)');
    _allocKey = baseKey;
    final p = allocatePointer(temp, baseKey);
    allocateInto(temp, p, baseKey);
    originalPointer = p;
    return originalPointer!;
  }

  @override
  String toString() => signature();
}

abstract class StructDLiteral<D extends StructD<D, C>, C extends NativeType> extends StructD<D, C> {
  StructDLiteral({
    super.originalPointer,
  });

  @override
  bool get _requiresOriginalPointer => false;

  // NOTE: just redirect allocateInto to writeInto(p.ref);
}

abstract class StructDView<D extends StructD<D, C>, C extends NativeType> extends StructD<D, C> {
  StructDView(Pointer<C> originalPointer) : super(
    originalPointer: originalPointer,
  );

  C get ref;

  @override
  String signature() => '$structName()';

  @override
  @nonVirtual
  D setC(C o) => throw UnsupportedError('$runtimeType: is just a view; cannot write to it.');

  @override
  @nonVirtual
  D setD(D o) => throw UnsupportedError('$runtimeType: is just a view; cannot write to it.');

  @override
  @nonVirtual
  Pointer<C> allocatePointer(RaylibTemp temp, String key, [int count = 1])
    => throw UnsupportedError('$runtimeType: is just a view; cannot allocate it externally.');

  @override
  @nonVirtual
  void syncInto(RaylibTemp temp, Pointer<C> p, String key) {} // NOTE: do nothing

  @override
  @nonVirtual
  void allocateInto(RaylibTemp temp, Pointer<C> p, String key)
    => throw UnsupportedError('$runtimeType: is just a view; cannot allocate externally.');

  @override
  @nonVirtual
  void writeInto(C p)
    => throw UnsupportedError('$runtimeType: is just a view; cannot write externally.');
}