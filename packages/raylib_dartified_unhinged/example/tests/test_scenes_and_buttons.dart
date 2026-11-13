// Run it: dart run test_scenes_and_buttons.dart
import '_base.dart';

class IntroScene extends FWidgetScene<G> {
  IntroScene(super.app);

  @override
  void onStart() {
    addEntity(FCenter(app,
      vertical: true,
      child: FColumn(app,
        alignment: .center,
        children: [
          FButton(app,
            buttonStyle: .outlined,
            onClickFn: (_) => goToMainMenu(),
            child: FPadding.all(app, 16,
              child: FLabel(app, text: 'My Game', alignment: .center),
            ),
          ),
        ],
      ),
    ));
  }

  @override
  void onDrawBackground() {
    DrawText('SCENE: $runtimeType', 20, 20, 20, .RED);

    DrawText(
      "Click the button or Press SPACE to continue",
      50, app.screenHeight - 100, 30,
      .BLUE,
    );
  }

  @override
  void onInput() {
    if (IsKeyPressed(.KEY_SPACE)) goToMainMenu();
  }
}

class MainMenuScene extends FWidgetScene<G> {
  late Map<String, void Function(FWidget<G> btn)> buttonInfo;

  MainMenuScene(super.app);

  @override
  void onStart() {
    buttonInfo = {
      'Start': (_) => goToGame(),
      'Options': (_) => goToMainMenuOptions(),
      'Exit': (_) => callback(() => app.exitApp = true),
    };

    addEntity(FCenter(app,
      vertical: true,
      child: FColumn(app,
        alignment: .center,
        gap: 16,
        children: [
          for (final e in buttonInfo.entries)
            FButton(app,
              onClickFn: e.value,
              child: FPadding.all(app, 16,
                child: FLabel(app, text: e.key),
              ),
            ),
        ],
      ),
    ));
  }

  @override
  void onDrawBackground() {
    DrawText('SCENE: $runtimeType', 20, 20, 20, .RED);
  }
}

class MainMenuOptionsWidget extends FWidget<G> {
  double volume = 1.0;

  late FButton<G> applyButton;

  MainMenuOptionsWidget(super.app) {
    applyButton = FButton(app,
      buttonVariant: .success,
      buttonStyle: .outlined,
      onClickFn: (_) => goToMainMenu(),
      child: FPadding.all(app, 16,
        child: FLabel(app, text: 'APPLY'),
      ),
    );
  }

  @override
  FWidget<G> build() => FCenter(app,
    vertical: true,
    child: FColumn(app,
      alignment: .center,
      children: [
        FExpanded(app,
          child: FCenter(app,
            vertical: true,
            child: FColumn(app,
              alignment: .center,
              gap: 8,
              children: [
                FButton(app,
                  buttonStyle: .outlined,
                  child: FPadding.all(app, 16,
                    child: FLabel(app, text: 'One'),
                  ),
                ),

                FRow(app,
                  alignment: .center,
                  gap: 32,
                  children: [
                    FLabel(app, text: 'Volume:'),

                    FDoubleSlider(app,
                      sliderStyle: .filled,
                      enableArrowKeys: true,
                      initialValue: volume,
                      min: 0,
                      max: 1,
                      onChangeEndFn: (_, value) => setState(() => volume = value),
                    ),

                    FLabel(app, text: volume.f2),
                  ],
                ),

                FRow(app,
                  alignment: .center,
                  gap: 32,
                  children: [
                    FCheckbox(app,
                      checked: true,
                    ),
                  ],
                ),

                FRow(app,
                  alignment: .center,
                  gap: 32,
                  children: [
                    FSelect(app,
                      options: ['One', 'Two', 'Three'],
                    ),
                  ],
                ),

                FButton(app,
                  buttonStyle: .outlined,
                  child: FPadding.all(app, 16,
                    child: FLabel(app, text: 'Three'),
                  ),
                ),

                FTextInput(app,
                  size: .vec2(100, 50),
                ),
              ],
            ),
          ),
        ),
        FRow(app,
          alignment: .center,
          gap: 8,
          children: [
            FPadding.LTRB(app, 0, 0, 0, 16,
              child: FButton(app,
                buttonStyle: .outlined,
                onClickFn: (_) => goToMainMenu(),
                child: FPadding.all(app, 16,
                  child: FLabel(app, text: 'BACK'),
                ),
              ),
            ),

            FPadding.LTRB(app, 0, 0, 0, 16,
              child: applyButton,
            ),

            FPadding.LTRB(app, 0, 0, 0, 16,
              child: FButton(app,
                buttonVariant: .success,
                buttonStyle: .outlined,
                onClickFn: (btn) => setState(() => applyButton.widgetDisable()),
                child: FPadding.all(app, 16,
                  child: FLabel(app, text: 'Toggle Apply Button: ${applyButton.isWidgetDisabled}'),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

class MainMenuOptionsScene extends FWidgetScene<G> {
  MainMenuOptionsScene(super.app);

  late MainMenuOptionsWidget widget;

  @override
  void onStart() => addEntity(widget = .new(app));

  @override
  void onDrawBackground() {
    DrawText('SCENE: $runtimeType', 20, 20, 20, .RED);
  }
}

class GameScene extends FWidgetScene<G> {
  GameScene(super.app);

  @override
  void onStart() {
    addEntity(FCenter(app,
      vertical: true,
      child: FColumn(app,
        alignment: .center,
        children: [
          FButton(app,
            child: FPadding.all(app, 16,
              child: FLabel(app, text: 'BACK'),
            ),
            buttonStyle: .outlined,
            onClickFn: (_) => goToMainMenu(),
          ),
        ],
      ),
    ));
  }

  @override
  void onDrawBackground() {
    DrawText('SCENE: $runtimeType', 20, 20, 20, .RED);

    DrawText(
      "Nothing Simulator",
      20, 50, 50, .WHITE
    );
  }
}

typedef G = MyGame;

extension on HasAppAccess<G> {
  // ignore: unused_element
  IntroScene get introScene => app.getScene()!;
  // ignore: unused_element
  void goToIntro() => app.callback(() => app.setScene(introScene));
  
  MainMenuScene get mainMenuScene => app.getScene()!;
  void goToMainMenu() => app.callback(() => app.setScene(mainMenuScene));

  MainMenuOptionsScene get mainMenuOptionsScene => app.getScene()!;
  void goToMainMenuOptions() => app.callback(() => app.setScene(mainMenuOptionsScene));
  
  GameScene get gameScene => app.getScene()!;
  void goToGame() => app.callback(() => app.setScene(gameScene));
}

class MyGame extends ExampleRaylibApp<G> {
  MyGame(super.backend);

  @override
  void onInit() {
    InitWindow(screenWidth, screenHeight, "test_scenes_and_buttons");
    SetWindowMonitor(0);

    addScene(IntroScene(this));
    addScene(MainMenuOptionsScene(this));
    addScene(MainMenuScene(this));
    addScene(GameScene(this));
  }
}

void main() => runExample((backend) => G(backend));