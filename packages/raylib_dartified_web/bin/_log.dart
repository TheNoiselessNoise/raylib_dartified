// ignore_for_file: unused_element

import 'dart:io';

const logR = '\x1B[0m'; // reset
const logBOLD = '\x1B[1m';
const logDIM = '\x1B[2m';
const logITALIC = '\x1B[3m';
const logUnderline = '\x1B[4m';
const logBLINK = '\x1B[5m';
// const logBLINKFAST = '\x1B[6m';  // not used
const logINVERSE = '\x1B[7m';       // swap fg/bg
const logHIDDEN = '\x1B[8m';        // conceal
const logSTRIKETHROUGH = '\x1B[9m';

const logBLUE = '\x1B[38;5;111m';
const logCYAN = '\x1B[38;5;116m';
const logGREEN = '\x1B[38;5;114m';
const logYELLOW = '\x1B[38;5;221m';
const logRED = '\x1B[38;5;204m';
const logMAGENTA = '\x1B[38;5;183m';
const logGRAY = '\x1B[38;5;240m';

// resets for individual styles
const logRBOLD = '\x1B[22m';
const logRDIM = '\x1B[22m';         // same code as bold reset, they share it
const logRITALIC = '\x1B[23m';
const logRUNDERLINE = '\x1B[24m';
const logRBLINK = '\x1B[25m';
const logRINVERSE = '\x1B[27m';
const logRHIDDEN = '\x1B[28m';
const logRSTRIKETHROUGH = '\x1B[29m';
const logRCOLOR = '\x1B[39m';       // reset fg to default
const logRBG = '\x1B[49m';          // reset bg to default

String get logTIME {
  final t = DateTime.now();
  return '$logGRAY[${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}:${t.second.toString().padLeft(2, '0')}]$logR';
}

String logHr = '─'*48;
String logStyledHr = '$logGRAY$logHr$logR';

bool _color = true;

String logStyle(String code, String text) => _color ? '$code$text$logR' : text;

/// Call once at startup if stdout doesn't support ANSI (e.g. CI plain logs).
void logDisableColor() => _color = false;

/// Top-level banner, call once per tool/command invocation.
void logBanner(String title, {String? version}) {
  final ver = version != null ? logStyle(logGRAY, '  $version') : '';
  stdout.writeln(logHr);
  stdout.writeln('  ${logStyle(logBOLD + logMAGENTA, title)}$ver');
  stdout.writeln(logHr);
}

/// Section header, groups a block of related steps.
void logSection(String name) {
  stdout.writeln();
  stdout.writeln('$logTIME ${logStyle(logBOLD + logBLUE, '╭─ $name')}');
}

/// A sub-item under the current section.
void logStep(String msg) {
  stdout.writeln('$logTIME ${logStyle(logBLUE, '│>')} ${logStyle(logBOLD, msg)}');
}

/// Successful completion of a step, with optional elapsed duration.
void logOk(String msg, {Duration? elapsed}) {
  final suffix = elapsed != null
      ? ' ${logStyle(logGRAY, '(${(elapsed.inMilliseconds / 1000).toStringAsFixed(1)}s)')}'
      : '';
  stdout.writeln('$logTIME ${logStyle(logBOLD + logGREEN, '✔ ')}$msg$suffix');
}

/// Informational note, not a problem, just context.
void logInfo(String msg) {
  stdout.writeln('$logTIME ${logStyle(logBOLD + logCYAN, 'I ')}$msg');
}

/// Non-fatal warning.
void logWarn(String msg) {
  stdout.writeln('$logTIME ${logStyle(logBOLD + logYELLOW, 'W ')}$msg');
}

/// Fatal error, prints to stderr and exits.
Never logDie(String msg, {List<String> details = const []}) {
  stderr.writeln();
  final errorId = 'ERROR';
  stderr.writeln('$logTIME ${logStyle(logBOLD + logRED, '$errorId $logHr')}');
  stderr.writeln(logStyle(logRED, msg));
  for (final d in details) {
    stderr.writeln('  ${logStyle(logRED, d)}');
  }
  stderr.writeln('$logTIME ${logStyle(logRED, '${'─'*(errorId.length+1)}$logHr')}');
  stderr.writeln();
  exit(1);
}

class LogSummary {
  int _ok = 0, _warn = 0, _err = 0;
  final _sw = Stopwatch()..start();

  void ok() => _ok++;
  void warn() => _warn++;
  void err() => _err++;

  void print() {
    final elapsed = (_sw.elapsedMilliseconds / 1000).toStringAsFixed(1);
    stdout.writeln(logHr);
    stdout.writeln(
      '  ${logStyle(logBOLD + logGREEN, '✔ $_ok ok')}  '
      '${logStyle(logBOLD + logYELLOW, '⚠ $_warn warn')}  '
      '${logStyle(logBOLD + logRED, '✗ $_err error')}  '
      '${logStyle(logGRAY, 'in ${elapsed}s')}',
    );
    stdout.writeln(logHr);
  }
}

Future<void> logRun(
  String executable,
  List<String> arguments, {
  String? workingDirectory,
}) async {
  logInfo('\$ $executable ${arguments.join(' ')}');
  final process = await Process.start(
    executable,
    arguments,
    workingDirectory: workingDirectory,
    mode: ProcessStartMode.inheritStdio,
  );
  final exitCode = await process.exitCode;
  if (exitCode != 0) {
    logDie(
      'Command failed (exit $exitCode):\n'
      '  $executable ${arguments.join(' ')}',
    );
  }
}

void logRequireEnv(String name, [void Function()? onNotFound]) {
  final value = Platform.environment[name];
  if (value == null || value.isEmpty) onNotFound?.call();
  logOk('${logStyle(logBLUE, 'ENV')}: ${logStyle(logBOLD, name)} = $value');
}

void logRequireTool(String name) {
  final isWindows = Platform.isWindows;
  final result = Process.runSync(isWindows ? 'where' : 'which', [name]);
  if (result.exitCode != 0) {
    logDie('Required tool not found in PATH: $name');
  }
  final path = (result.stdout as String).trim();
  logOk('${logStyle(logBLUE, 'BIN')}: ${logStyle(logBOLD, name)} = ${path.split('\n').first.trim()}');
}