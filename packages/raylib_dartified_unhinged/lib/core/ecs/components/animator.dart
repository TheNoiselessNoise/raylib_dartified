part of '../../raylib_dartified_unhinged.dart';

class Animation {
  String name;
  int? frameCount; // null = auto-calculate
  double? frameDuration;
  int frameWidth;
  int frameHeight;
  int startRow; // Which row to start on
  int? maxColumns; // How many columns before wrapping (null = don't wrap, single row)
  bool loop;
  String? sheetKey;
  String? nextAnimation;
  int paddingX;
  int paddingY;
  int offsetX;
  int offsetY;
  
  Animation({
    required this.name,
    this.frameCount,
    this.frameDuration,
    required this.frameWidth,
    required this.frameHeight,
    this.startRow = 0,
    this.maxColumns,
    this.loop = true,
    this.sheetKey,
    this.nextAnimation,
    this.paddingX = 0,
    this.paddingY = 0,
    this.offsetX = 0,
    this.offsetY = 0,
  });

  double get realFrameDuration => frameDuration ?? 0;

  int getFrameCount(int textureWidth, int textureHeight) {
    if (frameCount != null) return frameCount!;
    
    final effectiveFrameWidth = frameWidth + paddingX;
    final effectiveFrameHeight = frameHeight + paddingY;
    
    if (maxColumns != null) {
      // grid mode with wrapping
      final availableWidth = textureWidth - offsetX;
      final availableHeight = textureHeight - offsetY;
      final cols = availableWidth ~/ effectiveFrameWidth;
      final rows = availableHeight ~/ effectiveFrameHeight;
      return cols * rows;
    } else {
      // single row mode
      final availableWidth = textureWidth - offsetX;
      return availableWidth ~/ effectiveFrameWidth;
    }
  }
  
  Rectangle getFrameRect(int frameIndex) {
    if (maxColumns != null) {
      final col = frameIndex % maxColumns!;
      final row = startRow + (frameIndex ~/ maxColumns!);
      
      return .rect(
        (offsetX + col * (frameWidth + paddingX)),
        (offsetY + row * (frameHeight + paddingY)),
        frameWidth,
        frameHeight,
      );
    } else {
      return .rect(
        (offsetX + frameIndex * (frameWidth + paddingX)),
        (offsetY + startRow * frameHeight),
        frameWidth,
        frameHeight,
      );
    }
  }
}

/// ***WARNING***:
/// CAnimator cannot be fully restored from persistable data because it
/// contain closures (`onComplete`).
///
/// Either:
/// - Extend this class and override `onRestorePersistableData` to set up
///   the closures there.
///
/// - Listen on `factories.comp` (see [App.factories], [ECSFactoryRegistry.comp])
///   and setup closures when the restored instance matches your type.
///
/// ```dart
/// MyApp(super.backend) {
///   factories.comp.listen((typeId, instance) {
///     if (instance is CAnimator) {
///       instance.onComplete = ...;
///     }
///   });
/// }
/// ```
class CAnimator<T extends App<T>> extends Comp<T> {
  Texture? sheet;
  Map<String, Texture>? sheets;
  Map<String, Animation> animations;
  List<Animation> _fpsBoundAnimations = [];
  void Function(String animName)? onComplete;
  
  String currentAnimName;
  int currentFrame = 0;
  double frameTime = 0;
  bool isPlaying = true;

  Rectangle src = .zero();
  Rectangle dest = .zero();
  Vector2 origin = .zero();
  
  CAnimator(super.app, {
    super.populateDefaults,
    this.sheet, // single sheet
    this.sheets, // or multiple sheets
    this.animations = const {},
    String? currentAnimName,
    this.onComplete,
  }) :
    assert(sheet != null || sheets != null, 'Must provide sheet or sheets'),
    assert(currentAnimName != null || animations.isNotEmpty, 'You must either provide currentAnimName or at least one animation'),
    currentAnimName = currentAnimName ?? animations.keys.first;

  @override
  void registerObjectDescriptor(ObjectDescriptor<T> descriptor) {
    super.registerObjectDescriptor(descriptor);

    descriptor.addField('sheet', ObjectFieldDescriptor.value(
      () => sheet,
      (v) => sheet = v,
    ));

    descriptor.addField('sheets', ObjectFieldDescriptor.nullable(
      () => sheets,
      (v) => sheets = v == null ? v : .from(v),
    ));

    descriptor.addField('animations', ObjectFieldDescriptor.value(
      () => animations,
      (v) => animations = .from(v),
    ));

    descriptor.addField('onComplete', ObjectFieldDescriptor.value(
      () => onComplete,
      (v) => onComplete = v,
    ));

    descriptor.addField('currentAnimName', StringFieldDescriptor(
      () => currentAnimName,
      (v) => currentAnimName = v,
    ));

    descriptor.addField('currentFrame', IntFieldDescriptor.value(
      () => currentFrame,
      (v) => currentFrame = v,
    ));

    descriptor.addField('frameTime', DoubleFieldDescriptor.value(
      () => frameTime,
      (v) => frameTime = v,
    ));

    descriptor.addField('isPlaying', BoolFieldDescriptor(
      () => isPlaying,
      (v) => isPlaying = v,
    ));

    descriptor.addField('src', ObjectFieldDescriptor.value(
      () => src,
      (v) => src = v.copy(),
    ));

    descriptor.addField('dest', ObjectFieldDescriptor.value(
      () => dest,
      (v) => dest = v.copy(),
    ));

    descriptor.addField('origin', ObjectFieldDescriptor.value(
      () => origin,
      (v) => origin = v.copy(),
    ));
  }

  factory CAnimator.fromGroup(T app, {
    required String groupPath,
    required List<String> animationNames,
    int? frameWidth,
    int? frameHeight,
    String? initialAnimation,
    String extension = 'png',
    void Function(String animName)? onComplete,
    Animation Function(Animation anim)? postAnimation,
  }) {
    int maxWidth = frameWidth ?? 0;
    int maxHeight = frameHeight ?? 0;
    final Map<String, Texture> sheets = {};
    final Map<String, Animation> animations = {};
    
    for (final aninName in animationNames) {
      final animPath = path.join(groupPath, '$aninName.$extension');
      final sheet = app.backend.assets.texture(aninName, path: animPath).asset;
      if (frameWidth == null && sheet.width > maxWidth) maxWidth = sheet.width;
      if (frameHeight == null && sheet.height > maxHeight) maxHeight = sheet.height;
      sheets[aninName] = sheet;
      Animation anim = .new(
        name: aninName,
        sheetKey: aninName,
        frameDuration: 1/app.time.fps,
        frameWidth: frameWidth ?? sheet.width,
        frameHeight: frameHeight ?? sheet.height,
      );
      if (postAnimation != null) anim = postAnimation(anim);
      animations[aninName] = anim;
    }

    return .new(app,
      sheets: sheets,
      animations: animations,
      currentAnimName: initialAnimation ?? animations.keys.first,
      onComplete: onComplete,
    );
  }

  Animation get currentAnim {
    if (!animations.containsKey(currentAnimName)) {
      throw StateError('Animation $currentAnimName does not exist');
    }
    return animations[currentAnimName]!;
  }
  
  Texture get currentTexture {
    final anim = currentAnim;
    
    // if sheetKey, use that
    final sheets = this.sheets;
    final sheetKey = anim.sheetKey;
    if (sheetKey != null && sheets != null) {
      if (!sheets.containsKey(sheetKey)) {
        throw StateError("Invalid sheet key '$sheetKey'.");
      }

      return sheets[sheetKey]!;
    }
    
    // fall back to single sheet
    return sheet!;
  }

  @override
  void onAdd(ECSBase<T> parent) {
    animations.values.forEach((animation) {
      if (animation.frameDuration == null) {
        animation.frameDuration = 1 / app.time.fps;
        _fpsBoundAnimations.add(animation);
      }
    });
    
    app.listenOnFPSChange((_, oldFps, newFps) {
      _fpsBoundAnimations.forEach((animation) {
        animation.frameDuration = 1 / newFps;
      });
    });
  }

  @override
  void onPostUpdate(double dt) {
    if (!isPlaying) return;
    
    final anim = currentAnim;
    final texture = currentTexture;
    final maxFrames = anim.getFrameCount(texture.width, texture.height);
    
    frameTime += dt;
    
    while (frameTime >= anim.realFrameDuration) {
      frameTime -= anim.realFrameDuration;
      currentFrame++;
      
      if (currentFrame >= maxFrames) {
        if (anim.loop) {
          currentFrame = 0;
        } else {
          currentFrame = maxFrames - 1;
          isPlaying = false;
          onAnimationComplete(anim.name);
          
          // transition to next animation
          if (anim.nextAnimation != null) {
            play(anim.nextAnimation!);
          }
        }
      }
    }
  }

  @override
  void onDraw(double dt) {
    final anim = currentAnim;
    
    entity.onTransform((t) {
      src = anim.getFrameRect(currentFrame).copy();
      
      dest.set(
        t.position.x,
        t.position.y,
        anim.frameWidth * t.scale.x,
        anim.frameHeight * t.scale.y,
      );

      origin.set(
        anim.frameWidth * t.scale.x / 2,
        anim.frameHeight * t.scale.y / 2,
      );
      
      backend.render.drawTexturePro(
        currentTexture,
        src,
        dest,
        origin,
        t.rotation * 180 / math.pi,
        .WHITE,
      );
    });
  }

  void playNextAnimation() {
    final animNames = animations.keys.toList();
    int index = animNames.indexOf(currentAnimName);
    index = (index + 1) % animNames.length;
    play(animNames[index]);
  }

  void playPrevAnimation() {
    final animNames = animations.keys.toList();
    int index = animNames.indexOf(currentAnimName);
    index = (index - 1) % animNames.length;
    play(animNames[index]);
  }
  
  void play(String animName, {bool restart = false}) {
    if (currentAnimName == animName && !restart) return;
    currentAnimName = animName;
    currentFrame = 0;
    frameTime = 0;
    isPlaying = true;
  }
  
  void pause() => isPlaying = false;
  void resume() => isPlaying = true;
  void stop() {
    isPlaying = false;
    currentFrame = 0;
    frameTime = 0;
  }
  
  @mustCallSuper
  void onAnimationComplete(String animName) {
    onComplete?.call(animName);
  }

  // clone

  @override
  CAnimator<T> createInstance() {
    final c = CAnimator<T>(app,
      animations: .from(animations),
      currentAnimName: currentAnimName,
      onComplete: onComplete,
      sheet: sheet,
      sheets: sheets != null ? .from(sheets!) : null,
    );

    c._fpsBoundAnimations.addAll(List.from(_fpsBoundAnimations));
    c.currentFrame = currentFrame;
    c.frameTime = frameTime;
    c.isPlaying = isPlaying;

    c.src = src.copy();
    c.dest = dest.copy();
    c.origin = origin.copy();

    return c;
  }

  // state

  @override
  CAnimatorSnapshot<T> createSnapshot() {
    final snapshot = CAnimatorSnapshot<T>(namedId);

    snapshot.sheet = sheet?.copy();
    snapshot.sheets = sheets == null ? null : .from(sheets!);
    snapshot.animations = .from(animations);
    snapshot._fpsBoundAnimations = .from(_fpsBoundAnimations);
    snapshot.onComplete = onComplete;

    snapshot.currentAnimName = currentAnimName;
    snapshot.currentFrame = currentFrame;
    snapshot.frameTime = frameTime;
    snapshot.isPlaying = isPlaying;
    
    snapshot.src = src.copy();
    snapshot.dest = dest.copy();
    snapshot.origin = origin.copy();

    return snapshot;
  }

  @override
  @mustCallSuper
  void restoreSnapshot(covariant CAnimatorSnapshot<T> snapshot) {
    super.restoreSnapshot(snapshot);
    
    sheet = snapshot.sheet?.copy();
    sheets = snapshot.sheets == null ? null : .from(snapshot.sheets!);
    animations = .from(snapshot.animations);
    _fpsBoundAnimations = List.from(snapshot._fpsBoundAnimations);
    onComplete = snapshot.onComplete;

    currentAnimName = snapshot.currentAnimName;
    currentFrame = snapshot.currentFrame;
    frameTime = snapshot.frameTime;
    isPlaying = snapshot.isPlaying;
    
    src = snapshot.src.copy();
    dest = snapshot.dest.copy();
    origin = snapshot.origin.copy();
  }

  // persistence

  static const typeId = '__comp__CAnimator';
  
  @override String get persistentTypeId => typeId;

  @override
  @mustCallSuper
  MapData getPersistableData({bool force = false}) => {
    ...super.getPersistableData(force: force),
    'sheetKey': sheet?.id, // assumes Texture exposes a stable asset key
    'sheets': sheets?.map((k, tex) => MapEntry(k, tex.id)),
    'animations': animations.map((k, anim) => MapEntry(k, _animToData(anim))),
    // record which anims were fps-derived so we can re-null their
    // frameDuration on restore and let onAdd rebind them
    'fpsBoundAnimNames': _fpsBoundAnimations.map((a) => a.name).toList(),
    'currentAnimName': currentAnimName,
    'currentFrame': currentFrame,
    'frameTime': frameTime,
    'isPlaying': isPlaying,
  };

  @override
  @mustCallSuper
  void setPersistableData(MapTraversable data, {String? id}) {
    super.setPersistableData(data, id: id);

    final sheetKey = data.getStringOrNull('sheetKey');
    if (sheetKey != null) sheet = app.backend.assets.texture(sheetKey).asset;

    final sheetsData = data.getMap<String>('sheets');
    sheets = sheetsData.map((k, key) => MapEntry(k, app.backend.assets.texture(key).asset));

    final animData = data.getMap<MapData>('animations');
    animations = animData.map((k, v) => .new(k, _animFromData(.new(v))));

    final fpsBoundNames = data.getList<String>('fpsBoundAnimNames');
    _fpsBoundAnimations = [];
    for (final name in fpsBoundNames) {
      final anim = animations[name];
      if (anim != null) {
        anim.frameDuration = null; // let onAdd rebind it against current fps
        _fpsBoundAnimations.add(anim);
      }
    }

    currentAnimName = data.getString('currentAnimName', animations.keys.first);
    currentFrame = data.getInt('currentFrame', 0);
    frameTime = data.getDouble('frameTime', 0);
    isPlaying = data.getBool('isPlaying', true);
  }

  static MapData _animToData(Animation a) => {
    'name': a.name,
    'frameCount': a.frameCount,
    'frameDuration': a.frameDuration,
    'frameWidth': a.frameWidth,
    'frameHeight': a.frameHeight,
    'startRow': a.startRow,
    'maxColumns': a.maxColumns,
    'loop': a.loop,
    'sheetKey': a.sheetKey,
    'nextAnimation': a.nextAnimation,
    'paddingX': a.paddingX,
    'paddingY': a.paddingY,
    'offsetX': a.offsetX,
    'offsetY': a.offsetY,
  };

  static Animation _animFromData(MapTraversable d) => Animation(
    name: d.getString('name', ''),
    frameCount: d.getIntOrNull('frameCount'),
    frameDuration: d.getDoubleOrNull('frameDuration'),
    frameWidth: d.getInt('frameWidth', 0),
    frameHeight: d.getInt('frameHeight', 0),
    startRow: d.getInt('startRow', 0),
    maxColumns: d.getIntOrNull('maxColumns'),
    loop: d.getBool('loop', true),
    sheetKey: d.getStringOrNull('sheetKey'),
    nextAnimation: d.getStringOrNull('nextAnimation'),
    paddingX: d.getInt('paddingX', 0),
    paddingY: d.getInt('paddingY', 0),
    offsetX: d.getInt('offsetX', 0),
    offsetY: d.getInt('offsetY', 0),
  );
}

class CAnimatorSnapshot<T extends App<T>> extends CompSnapshot<T, CAnimator<T>> {
  late Texture? sheet;
  late Map<String, Texture>? sheets;
  late Map<String, Animation> animations;
  late List<Animation> _fpsBoundAnimations;
  late void Function(String animName)? onComplete;
  
  late String currentAnimName;
  late int currentFrame;
  late double frameTime;
  late bool isPlaying;

  late Rectangle src;
  late Rectangle dest;
  late Vector2 origin;

  CAnimatorSnapshot(super.id);
  
  @override
  CAnimator<T> createInstance(T app) => .new(app);
}