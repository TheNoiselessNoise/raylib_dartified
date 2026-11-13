part of '../raylib_dartified_unhinged.dart';

mixin _DebugUtils<T extends App<T>> on FWidget<T> {
  FWidget<T> buildSeparator(String text, [FSeparatorLabelPosition position = .center]) {
    return FPadding.symmetric(app, 8, 0,
      child: FSeparator(app,
        labelGap: 8,
        labelPosition: position,
        label: FLabel(app, text: text),
      ),
    );
  }

  Map<String, Iterable<ECSBase<T>>> getChildrenOf(ECSBase<T> source) {
    if (source case T app) return {
      'AppSystems': app._systems,
      'Scenes': app._scenes,
    };

    if (source case AppSystem<T> _) return {};

    if (source case Scene<T> scene) return {
      'SceneSystems': scene._systems,
      'Entities': scene._entities,
    };

    if (source case SceneSystem<T> _) return {};

    if (source case AnyEntityGroup<T> group) return {
      'Entities': group._entities,
      'Components': group._components,
    };

    if (source case Entity<T> entity) return {
      'Components': entity._components,
    };

    if (source case Comp<T> comp) return {
      'Components': comp._components,
    };

    throw StateError('Unknown source type for getting children: ${source.runtimeType}');
  }
}

class DebugObjectWidget<T extends App<T>> extends FWidget<T> with _DebugUtils<T> {
  final DebugWidget<T> debugWidget;
  
  DebugObjectWidget(super.app, this.debugWidget);

  late List<ECSBase<T>> hierarchy = [ app ];
  ECSBase<T> get currentObject => hierarchy.last;

  List<FWidget<T>> buildHeader() => [
    FRow(app,
      gap: 8,
      alignment: .center,
      children: [
        if (hierarchy.length > 1) ...[
          FButton(app,
            onClickFn: (_) => debugWidget.setState(() => hierarchy.removeLast()),
            child: FPadding.symmetric(app, 4, 8,
              child: FLabel(app, text: 'BACK'),
            ),
          ),
        ],

        FButton(app,
          onClickFn: (_) => debugWidget.rebuild(),
          child: FPadding.symmetric(app, 4, 8,
            child: FLabel(app, text: 'REFRESH'),
          ),
        ),

        FExpanded(app,
          child: FSized.flexible(app,
            // XHACK: move scrollbar so it does not overlaps the buttons
            height: 40,
            child: FSingleChildScrollView(app,
              key: 'breadcrumbs',
              scrollVertical: false,
              scrollHorizontal: true,
              scrollOnContentChange: true,

              child: FRow(app,
                gap: 8,
                alignment: .center,
                children: [
                  for (final (index, node) in hierarchy.indexed) ...[
                    if (index > 0) ...[
                      FLabel(app, text: '>'),
                    ],

                    FButton(app,
                      onClickFn: (_) => debugWidget.setState(() => hierarchy.removeRange(index + 1, hierarchy.length)),
                      child: FPadding.symmetric(app, 4, 8,
                        child: FLabel(app, text: node.namedId),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ];

  List<FWidget<T>> buildChildren() {
    final children = getChildrenOf(currentObject);

    final tree = <FWidget<T>>[];

    for (final e in children.entries) {
      if (e.value.isEmpty) continue;

      final subNodes = <FWidget<T>>[
        buildSeparator(e.key, .left),
      ];

      for (final subObject in e.value) {
        bool isCurrent = false;

        if (currentObject is T && subObject is Scene<T> && currentObject.scene == subObject) {
          isCurrent = true;
        }

        subNodes.addAll([
          FButton(app,
            onClickFn: (_) => debugWidget.setState(() => hierarchy.add(subObject)),
            child: FContainer(app,
              backgroundColor: isCurrent ? .AMBER : .TRANSPARENT,
              child: FPadding.symmetric(app, 4, 8,
                child: FLabel(app, text: subObject.namedId),
              ),
            ),
          ),
        ]);
      }

      tree.addAll(subNodes);
    }

    return tree;
  }

  final int _titleSize = 150;
  FSized<T> sizedTitle(String text, {int? width}) => FSized(app,
    heightMode: .flexible,
    width: width ?? _titleSize,
    child: FLabel(app, text: text),
  );

  List<FWidget<T>> _objectControls(ObjectFieldDescriptor f) {
    if (f is ObjectFieldDescriptor<Vector2>) {
      final value = f.getter() ?? .zero();
      
      return [
        // x
        sizedTitle(value.x.f2, width: 75),

        FDoubleSlider(app,
          // min: 0,
          // max: screenWidth,
          initialValue: value.x,
          onChangeEndFn: (_, v) => setState(() => f.setter!(value..x = v)),
        ),

        // y
        sizedTitle(value.y.f2, width: 75),

        FDoubleSlider(app,
          // min: 0,
          // max: screenHeight,
          initialValue: value.y,
          onChangeEndFn: (_, v) => setState(() => f.setter!(value..y = v)),
        ),
      ];
    }

    if (f is ObjectFieldDescriptor<Rectangle>) {
      final value = f.getter() ?? .zero();
      
      return [
        // x
        sizedTitle(value.x.f2, width: 75),

        FDoubleSlider(app,
          // min: 0,
          // max: screenWidth,
          initialValue: value.x,
          onChangeEndFn: (_, v) => setState(() => f.setter!(value..x = v)),
        ),

        // y
        sizedTitle(value.y.f2, width: 75),

        FDoubleSlider(app,
          // min: 0,
          // max: screenHeight,
          initialValue: value.y,
          onChangeEndFn: (_, v) => setState(() => f.setter!(value..y = v)),
        ),

        // width
        sizedTitle(value.width.f2, width: 75),

        FDoubleSlider(app,
          // min: 0,
          // max: screenHeight,
          initialValue: value.width,
          onChangeEndFn: (_, v) => setState(() => f.setter!(value..width = v)),
        ),

        // height
        sizedTitle(value.height.f2, width: 75),

        FDoubleSlider(app,
          // min: 0,
          // max: screenHeight,
          initialValue: value.height,
          onChangeEndFn: (_, v) => setState(() => f.setter!(value..height = v)),
        ),
      ];
    }

    throw StateError('Unhandled type for ObjectFieldDescriptor: ${f.type}');
  }

  List<FWidget<T>> buildFieldControls() {
    final controls = <FWidget<T>>[];

    final fields = currentObject.getObjectDescriptor().fields;
    for (final MapEntry(key: name, value: f) in fields.entries) {
      controls.add(FRow(app, gap: 8, children: [sizedTitle(name)]));
      if (!f.isSettable) continue;

      final additionalControls = <FWidget<T>>[];

      additionalControls.addAll(switch (f) {
        StringFieldDescriptor f => [
          FTextInput(app,
            initialText: f.getter() ?? '',
            onSubmitFn: (_, v) => f.setter!(f.nullable && v.isEmpty ? null : v),
          ),
        ],
        BoolFieldDescriptor f => [
          FCheckbox(app,
            checked: f.getter(),
            onChangeFn: (_, v) => f.setter!(v),
          ),
        ],
        IntFieldDescriptor f => [
          sizedTitle(f.value.toString()),

          FIntSlider(app,
            initialValue: f.value,
            min: f.min,
            max: f.max,
            step: f.step,
            onChangeFn: (_, v) => f.setter!(v),
          ),
        ],
        DoubleFieldDescriptor f => [
          sizedTitle(f.value.f2),

          FDoubleSlider(app,
            initialValue: f.value,
            min: f.min,
            max: f.max,
            step: f.step,
            onChangeFn: (_, v) => f.setter!(v),
          ),
        ],
        ColorFieldDescriptor f => [
          FColorPicker(app,
            initial: f.getter(),
            allowClear: f.nullable,
            onChangeFn: (_, v) => f.setter!(v),
          ),
        ],
        ObjectFieldDescriptor f => _objectControls(f),
        _ => [
          FLabel(app, text: 'Unsupported ${f.runtimeType}'),
        ],
      });

      controls.add(FRow(app, gap: 8, children: additionalControls));
    }

    return controls;
  }

  List<FWidget<T>> buildInformation() => [
    FRow(app,
      gap: 8,
      children: [
        sizedTitle('ID'),
        
        FLabel(app, text: currentObject.id.toString()),
      ],
    ),

    FRow(app,
      gap: 8,
      children: [
        sizedTitle('Named ID'),

        FLabel(app, text: currentObject.namedId),
      ],
    ),

    // is active
    if (currentObject case IsAnyEnableable<T> enableable) ...[
      FRow(app,
        gap: 8,
        children: [
          sizedTitle('Is Active'),

          FCheckbox(app,
            checked: enableable.isEnabled,
            onChangeFn: (_, v) => debugWidget.setState(() => enableable.setEnabled(v)),
          ),
        ],
      ),
    ],
  ];

  @override
  FWidget<T> build() {
    final children = buildChildren();
    final information = buildInformation();
    final fieldControls = buildFieldControls();
    
    return FPadding.all(app, 8,
      child: FColumn(app,
        gap: 8,
        children: [
          ...buildHeader(),

          FExpanded(app,
            child: FSingleChildScrollView(app,
              autoScrollY: false,
              child: FColumn(app,
                gap: 4,
                children: [
                  if (children.isNotEmpty) buildSeparator('CHILDREN'),
                  ...children,
                  
                  if (information.isNotEmpty) buildSeparator('INFORMATION'),
                  ...information,

                  if (fieldControls.isNotEmpty) buildSeparator('CONTROLS'),
                  ...fieldControls,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DebugPerformanceWidget<T extends App<T>> extends FWidget<T> {
  final DebugWidget<T> debugWidget;
  
  // Rolling buffer for smoothing FPS/frame time calculations
  double currentDt = 0.0;
  final List<double> _frameTimes = [];
  final int _maxSamples = 60;

  DebugPerformanceWidget(super.app, this.debugWidget);

  void updateMetrics(double dt) {
    currentDt = dt;
    _frameTimes.add(dt);
    if (_frameTimes.length > _maxSamples) {
      _frameTimes.removeAt(0);
    }
  }

  @override
  FWidget<T> build() {
    final avgDt = _frameTimes.isEmpty ? 0.0 : _frameTimes.reduce((a, b) => a + b) / _frameTimes.length;
    final fps = avgDt > 0 ? (1.0 / avgDt).round() : 0;
    final frameMs = avgDt * 1000;

    return FPadding.all(app, 8,
      child: FColumn(app,
        gap: 8,
        children: [
          FRow(app, gap: 8, children: [
            FLabel(app, text: 'FPS:'),
            FLabel(app, text: '$fps'),
          ]),
          FRow(app, gap: 8, children: [
            FLabel(app, text: 'Frame Time:'),
            FLabel(app, text: '${frameMs.toStringAsFixed(2)} ms'),
          ]),
        ],
      ),
    );
  }
}

enum DebugTabs {
  objects('Objects'),
  watch('Watch'),
  performance('Performance');

  const DebugTabs(this.tabName);
  final String tabName;
}

class DebugWatchWidget<T extends App<T>> extends FWidget<T> {
  final DebugWidget<T> debugWidget;

  DebugWatchWidget(super.app, this.debugWidget);

  @override
  FWidget<T> build() => FColumn(app,
    gap: 4,
    children: [
      for (final e in debugWidget._watchers.entries) ...[
        FRow(app,
          gap: 8,
          children: [
            FLabel(app, text: e.key),
            FLabel(app, text: ' => '),
            FLabel(app, text: '${e.value()}'),
          ],
        ),
      ],
    ],
  );
}

class DebugWidget<T extends App<T>> extends FWidget<T> {
  late DebugObjectWidget<T> objectDebugWidget;
  late DebugWatchWidget<T> watchWidget;
  late DebugPerformanceWidget<T> performanceWidget;

  final Map<String, dynamic Function()> _watchers = {};

  DebugWidget(super.app) {
    objectDebugWidget = .new(app, this);
    watchWidget = .new(app, this);
    performanceWidget = .new(app, this);

    // always render at the top
    add(CRenderLayer<T>(app, layer: RenderLayers.debug.name));
  }

  bool hidden = false;
  DebugTabs currentTab = .objects;
  late ECSBase<T> selectedObject = app;

  void updateFrame(double dt) {
    if (currentTab == .performance && !hidden) {
      performanceWidget.updateMetrics(dt);
    }
  }

  FWidget<T> buildDebugView() => switch (currentTab) {
    .objects => objectDebugWidget..rebuild(),
    .watch => watchWidget..rebuild(),
    .performance => performanceWidget..rebuild(),
  };

  @override
  FWidget<T> build() => FColumn(app,
    children: [
      FRow(app,
        children: [
          FButton(app,
            onClickFn: (_) => setState(() => hidden = !hidden),
            child: FLabel(app, text: '...'),
          ),

          if (!hidden) ...[
            for (final tab in DebugTabs.values) ...[
              FSized.shrink(app, width: 8),

              FButton(app,
                onClickFn: (_) => setState(() => currentTab = tab),
                child: FContainer(app,
                  backgroundColor: currentTab == tab ? .AMBER : .TRANSPARENT,
                  child: FPadding.symmetric(app, 4, 8,
                    child: FLabel(app, text: tab.tabName),
                  ),
                ),
              ),  
            ],
          ],
        ],
      ),

      FExpanded(app,
        child: hidden ? FSized.shrink(app) : FPadding.all(app, 8,
          child: FContainer(app,
            roundness: 0,
            backgroundColor: .ASH..a = 100,
            child: buildDebugView()
          ),
        ),
      ),
    ],
  );
}

class DebugAppSystem<T extends App<T>> extends AppSystem<T> {
  late DebugWidget<T> debugWidget;
  Scene<T>? lastScene;

  DebugAppSystem(super.app) {
    debugWidget = .new(app);
    app.listenOnEventRecorded(_debugBreakOn);
    _startWatchTask();
    _add();
  }

  void _add() {
    final currentScene = scene;
    
    if (lastScene != currentScene) {
      lastScene?.detachEntity(debugWidget);

      if (lastScene == null) {
        // trigger the widget build
        currentScene.addEntity(debugWidget);
      } else {
        currentScene.attachEntity(debugWidget);
      }

      debugWidget.rebuild();
      lastScene = currentScene;
    }
  }

  @override
  void onBeginFrame(double dt) {
    _add();
    debugWidget.updateFrame(dt);
  }

  void _startWatchTask() {
    task(DelayTask(app,
      seconds: 1,
      action: (_) => callback(() {
        debugWidget.watchWidget.rebuild();
        debugWidget.performanceWidget.rebuild();
        _startWatchTask();
      })
    ));
  }

  void devInspect(ECSBase<T> origin) => debugWidget.setState(() {
    debugWidget.currentTab = .objects;
    debugWidget.objectDebugWidget.hierarchy.add(origin);
  });

  final List<bool Function(Event<T> event)> _listenOnEvents = [];

  void _debugBreakOn(_, Event<T> event) {
    if (_listenOnEvents.any((check) => check(event))) {
      print('[DEV] Breaking on event $event');
      app.time.setTimeScale(0);
    }
  }

  void devBreakOn<E extends Event<T>>()
    => _listenOnEvents.add((event) => event is E);

  void devWatch(String name, dynamic Function() getter)
    => debugWidget._watchers[name] = getter;
}