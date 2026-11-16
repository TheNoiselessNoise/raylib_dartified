// Run it: dart run test_widgets.dart
import '_base.dart';

final class Counter extends FWidget<G> {
  int count = 0;

  Counter(super.app);

  void decrement() => setState(() => count--);
  void increment() => setState(() => count++);

  @override
  FWidget<G> build() => FLabel(app, text: 'Count: $count');
}

final class SliderValue extends FWidget<G> {
  double _value = 0;

  SliderValue(super.app);

  void set(double value) => setState(() => _value = value);

  @override
  FWidget<G> build() => FLabel(app, text: 'Value: ${_value.f2}');
}

final class TestWidgetsScene extends FWidgetScene<G> {
  late Counter counter;
  late SliderValue sliderValue;

  TestWidgetsScene(super.app) {
    counter = .new(app);
    sliderValue = .new(app);
  }

  List<FWidget<G>> sep(String? label) => [
    FSized(app, height: 8),

    FSeparator(app,
      thickness: 3,
      color: .WHITE,
      label: label == null ? null : FLabel(app, text: label),
    ),

    FSized(app, height: 8),
  ];

  FTree<G> buildExampleTree() => FTree(app,
    nodes: [
      FTreeNode(app,
        header: FLabel(app, text: 'Header', color: .AQUA),
        expanded: true,
        nodes: [
          FTreeNode(app,
            header: FLabel(app, text: 'Child 1', color: .BLUE),
            expanded: true,
            nodes: [
              FTreeNode(app,
                header: FLabel(app, text: 'Sub Child 1'),
              ),
              FTreeNode(app,
                header: FLabel(app, text: 'Sub Child 2'),
              ),
              FTreeNode(app,
                header: FLabel(app, text: 'Sub Child 3'),
              ),
            ],
          ),
          FTreeNode(app,
            header: FLabel(app, text: 'Child 2', color: .BLUE),
          ),
          FTreeNode(app,
            header: FLabel(app, text: 'Child 3', color: .BLUE),
          ),
        ],
      ),
    ],
  );

  FWidget<G> buildExampleCounter() => FRow(app,
    gap: 32,
    alignment: .center,
    children: [
      counter,

      FButton(app,
        onClickFn: (_) => counter.increment(),
        onDoubleClickFn: (_) => counter.increment(),
        child: FPadding.all(app, 16,
          child: FLabel(app, text: '+1'),
        ),
      ),

      FButton(app,
        onClickFn: (_) => counter.decrement(),
        onDoubleClickFn: (_) => counter.decrement(),
        child: FPadding.all(app, 16,
          child: FLabel(app, text: '-1'),
        ),
      ),
    ],
  );

  FWidget<G> buildExampleHelloWorld() => FRow(app,
    gap: 32,
    alignment: .center,
    children: [
      FContainer(app,
        backgroundColor: .RED,
        child: FLabel(app, text: 'Hello'),
      ),
      FContainer(app,
        backgroundColor: .GREEN,
        child: FLabel(app, text: 'World'),
      ),
      FContainer(app,
        backgroundColor: .BLUE,
        child: FLabel(app, text: ' ! '),
      ),
    ]
  );

  FWidget<G> buildExampleSlider() => FRow(app,
    gap: 32,
    alignment: .center,
    children: [
      sliderValue,

      FDoubleSlider(app,
        min: 0.0,
        max: 1.0,
        initialValue: 0.5,
        onChangeFn: (_, value) => sliderValue.set(value),
      ),
    ],
  );

  FWidget<G> buildExampleCheckbox() => FRow(app,
    gap: 32,
    alignment: .center,
    children: [
      FLabel(app, text: "Is Checked?"),

      FCheckbox(app,
        checked: true,
      ),
    ],
  );

  FWidget<G> buildExampleTextInput() => FTextInput(app,
    size: .vec2(200, 80),
    fontSize: 30,
  );

  FWidget<G> buildExampleSelect() => FSelect(app,
    options: ['One', 'Two', 'Three'],
  );

  FWidget<G> buildExampleButton() => FButton(app,
    child: FPadding.all(app, 16,
      child: FLabel(app, text: 'APPLY'),
    ),
  );

  @override
  void onStart() {
    addEntity(FSingleChildScrollView(app,
      child: FColumn(app,
        alignment: .center,
        gap: 8,
        children: [

          ...sep('Tree'),

          buildExampleTree(),

          ...sep('Counter'),

          buildExampleCounter(),

          ...sep('Hello, World!'),

          buildExampleHelloWorld(),

          ...sep('Slider'),

          buildExampleSlider(),

          ...sep('Checkbox'),

          buildExampleCheckbox(),
          
          ...sep('Text Input'),

          buildExampleTextInput(),

          ...sep('Select'),

          buildExampleSelect(),

          ...sep('Button'),

          buildExampleButton(),
        ],
      ),
    ));
  }

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_SPACE)) counter.increment();
  }
}

typedef G = TestWidgetsApp;

final class TestWidgetsApp extends ExampleRaylibApp<G> {
  TestWidgetsApp(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_widgets");
    SetWindowMonitor(0);
    SetTargetFPS(60);

    addScene(TestWidgetsScene(app));
  }
}

void main() => runExample((backend) => G(backend));
