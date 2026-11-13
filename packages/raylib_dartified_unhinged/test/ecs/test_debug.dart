import 'package:raylib_dartified_unhinged/raylib_dartified_unhinged.dart';
import 'package:test/test.dart';

typedef G = TestApp;

class TestApp extends App<G> {
  TestApp(super.backend);
}

void main() {
  group('Debug', () {
    late TestApp app;
    final String tag = 'core';
    final String message = 'hello from ECS!';
    final List<String> recievedMessages = [];
    
    setUp(() {
      recievedMessages.clear();
      app = .new(HeadlessBackend());
      app.enableDebug(true);
      app.setDebugLevel(.vvv);
      app.setDebugTags({tag});
      app.setDebugMessagePrinter((msg) {
        msg.options.showTime = false;
        msg.options.showSource = false;
        msg.options.showTag = true;
        msg.options.colorize = false;
        recievedMessages.add(msg.toString());
      });
    });
    
    test('tagged', () {
      app.dbgSelf(message, tag: tag);
      expect(recievedMessages, equals(["[$tag] $message"]));
    });

    test('tagged multiple', () {
      final int n = 10;

      for (int i = 0; i < n; i++) {
        app.dbgSelf(message, tag: tag);
      }

      expect(recievedMessages, equals(List.generate(n, (_) => "[$tag] $message")));
    });

    test('with everything', () {
      late DateTime msgTime;

      app.setDebugMessagePrinter((msg) {
        msg.options.showTime = true;
        msg.options.showTimeDate = false;
        msg.options.showSource = true;
        msg.options.showTag = true;
        msg.options.colorize = false;
        recievedMessages.add(msg.toString());
        msgTime = msg.time;
      });

      app.dbgSelf(message, tag: tag);

      expect(recievedMessages, equals([
        "[${msgTime.toString().split(' ').last}] [${app.namedId}] [$tag] $message"
      ]));
    });
  });
}