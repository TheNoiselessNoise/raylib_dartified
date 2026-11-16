// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../raylib_dartified_base.dart';

// Easing does not need to have bindings.

/// Exposes Raylib's easing functions as module-level calls.
///
/// All functions share the same parameter convention (Robert Penner's easing):
/// - [t] current time
/// - [b] start value
/// - [c] change in value (end - start)
/// - [d] total duration
///
/// Returns the interpolated value at time [t].
final class RaylibEaseExtDart<R extends RaylibBase> extends RaylibModule<R> {
  RaylibEaseExtDart(super.rl);

  String _debugLabel(String name, num t, num b, num c, num d)
    => '$name($t, $b, $c, $d)';

  // Linear Easing functions

  /// Linear
  double EaseLinearNone(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseLinearNone', t, b, c, d),
    () => c*t/d + b,
  );
  
  /// Linear In
  double EaseLinearIn(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseLinearIn', t, b, c, d),
    () => c*t/d + b,
  );
  
  /// Linear Out
  double EaseLinearOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseLinearOut', t, b, c, d),
    () => c*t/d + b,
  );
  
  /// Linear In Out
  double EaseLinearInOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseLinearInOut', t, b, c, d),
    () => c*t/d + b,
  );

  // Sine Easing functions

  /// Sine In
  double EaseSineIn(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseSineIn', t, b, c, d),
    () => -c*math.cos(t/d*(rl.PI/2.0)) + c + b,
  );
  
  /// Sine Out
  double EaseSineOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseSineOut', t, b, c, d),
    () => c*math.sin(t/d*(rl.PI/2.0)) + b,
  );
  
  /// Sine In Out
  double EaseSineInOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseSineInOut', t, b, c, d),
    () => -c/2.0*(math.cos(rl.PI*t/d) - 1.0) + b,
  );

  // Circular Easing functions

  /// Circular In
  double EaseCircIn(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseCircIn', t, b, c, d),
    () {
      t /= d;
      return (-c*(math.sqrt(1.0 - t*t) - 1.0) + b);
    },
  );

  /// Circular Out
  double EaseCircOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseCircOut', t, b, c, d),
    () {
      t = t/d - 1.0;
      return (c*math.sqrt(1.0 - t*t) + b);
    },
  );

  /// Circular In Out
  double EaseCircInOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseCircInOut', t, b, c, d),
    () {
      if ((t/=d/2.0) < 1.0) {
        return (-c/2.0*(math.sqrt(1.0 - t*t) - 1.0) + b);
      }
      t -= 2.0;
      return (c/2.0*(math.sqrt(1.0 - t*t) + 1.0) + b);
    },
  );

  // Cubic Easing functions

  /// Cubic In
  double EaseCubicIn(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseCubicIn', t, b, c, d),
    () {
      t /= d;
      return (c*t*t*t + b).toDouble();
    },
  );

  /// Cubic Out
  double EaseCubicOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseCubicOut', t, b, c, d),
    () {
      t = t/d - 1.0;
      return (c*(t*t*t + 1.0) + b);
    },
  );

  /// Cubic In Out
  double EaseCubicInOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseCubicInOut', t, b, c, d),
    () {
      if ((t/=d/2.0) < 1.0) {
        return (c/2.0*t*t*t + b);
      }
      t -= 2.0;
      return (c/2.0*(t*t*t + 2.0) + b);
    },
  );

  // Quadratic Easing functions

  /// Quadratic In
  double EaseQuadIn(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseQuadIn', t, b, c, d),
    () {
      t /= d;
      return (c*t*t + b).toDouble();
    },
  );

  /// Quadratic Out
  double EaseQuadOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseQuadOut', t, b, c, d),
    () {
      t /= d;
      return (-c*t*(t - 2.0) + b);
    },
  );

  /// Quadratic In Out
  double EaseQuadInOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseQuadInOut', t, b, c, d),
    () {
      if ((t/=d/2) < 1) {
        return (((c/2)*(t*t)) + b);
      }
      return (-c/2.0*(((t - 1.0)*(t - 3.0)) - 1.0) + b);
    },
  );

  // Exponential Easing functions

  /// Exponential In
  double EaseExpoIn(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseExpoIn', t, b, c, d),
    () => ((t == 0.0) ? b : (c*math.pow(2.0, 10.0*(t/d - 1.0)) + b)).toDouble(),
  );

  /// Exponential Out
  double EaseExpoOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseExpoOut', t, b, c, d),
    () => ((t == d) ? (b + c) : (c*(-math.pow(2.0, -10.0*t/d) + 1.0) + b)).toDouble(),
  );

  /// Exponential In Out
  double EaseExpoInOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseExpoInOut', t, b, c, d),
    () {
      if (t == 0.0) return b.toDouble();
      if (t == d) return (b + c).toDouble();
      if ((t/=d/2.0) < 1.0) return (c/2.0*math.pow(2.0, 10.0*(t - 1.0)) + b);
      return (c/2.0*(-math.pow(2.0, -10.0*(t - 1.0)) + 2.0) + b);
    },
  );

  // Back Easing functions

  /// Back In
  double EaseBackIn(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseBackIn', t, b, c, d),
    () {
      final s = 1.70158;
      final postFix = t/=d;
      return (c*(postFix)*t*((s + 1.0)*t - s) + b);
    },
  );

  /// Back Out
  double EaseBackOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseBackOut', t, b, c, d),
    () {
      final s = 1.70158;
      t = t/d - 1.0;
      return (c*(t*t*((s + 1.0)*t + s) + 1.0) + b);
    },
  );

  /// Back In Out
  double EaseBackInOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseBackInOut', t, b, c, d),
    () {
      num s = 1.70158;
      if ((t/=d/2.0) < 1.0)
      {
        s *= 1.525;
        return (c/2.0*(t*t*((s + 1.0)*t - s)) + b);
      }

      final postFix = t-=2.0;
      s *= 1.525;
      return (c/2.0*((postFix)*t*((s + 1.0)*t + s) + 2.0) + b);
    },
  );

  // Bounce Easing functions

  /// Bounce In
  double EaseBounceIn(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseBounceIn', t, b, c, d),
    () => (c - EaseBounceOut(d - t, 0.0, c, d) + b),
  );

  /// Bounce Out
  double EaseBounceOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseBounceOut', t, b, c, d),
    () {
      if ((t/=d) < (1.0/2.75))
      {
        return (c*(7.5625*t*t) + b);
      }
      else if (t < (2.0/2.75))
      {
        final postFix = t-=(1.5/2.75);
        return (c*(7.5625*(postFix)*t + 0.75) + b);
      }
      else if (t < (2.5/2.75))
      {
        final postFix = t-=(2.25/2.75);
        return (c*(7.5625*(postFix)*t + 0.9375) + b);
      }
      else
      {
        final postFix = t-=(2.625/2.75);
        return (c*(7.5625*(postFix)*t + 0.984375) + b);
      }
    },
  );

  /// Bounce In Out
  double EaseBounceInOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseBounceInOut', t, b, c, d),
    () {
      if (t < d/2.0) {
        return (EaseBounceIn(t*2.0, 0.0, c, d)*0.5 + b);
      }
      return (EaseBounceOut(t*2.0 - d, 0.0, c, d)*0.5 + c*0.5 + b);
    },
  );

  // Elastic Easing functions

  /// Elastic In
  double EaseElasticIn(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseElasticIn', t, b, c, d),
    () {
      if (t == 0.0) return b.toDouble();
      if ((t/=d) == 1.0) return (b + c).toDouble();

      final p = d*0.3;
      final a = c;
      final s = p/4.0;
      final postFix = a*math.pow(2.0, 10.0*(t-=1.0));

      return (-(postFix*math.sin((t*d-s)*(2.0*rl.PI)/p )) + b);
    },
  );

  /// Elastic Out
  double EaseElasticOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseElasticOut', t, b, c, d),
    () {
      if (t == 0.0) return b.toDouble();
      if ((t/=d) == 1.0) return (b + c).toDouble();

      final p = d*0.3;
      final a = c;
      final s = p/4.0;

      return (a*math.pow(2.0,-10.0*t)*math.sin((t*d-s)*(2.0*rl.PI)/p) + c + b);
    },
  );

  /// Elastic In Out
  double EaseElasticInOut(num t, num b, num c, num d) => debugRun(
    () => _debugLabel('EaseElasticInOut', t, b, c, d),
    () {
      if (t == 0.0) return b.toDouble();
      if ((t/=d/2.0) == 2.0) return (b + c).toDouble();

      final p = d*(0.3*1.5);
      final a = c;
      final s = p/4.0;

      if (t < 1.0) {
        final postFix = a*math.pow(2.0, 10.0*(t-=1.0));
        return -0.5*(postFix*math.sin((t*d-s)*(2.0*rl.PI)/p)) + b;
      }

      final postFix = a*math.pow(2.0, -10.0*(t-=1.0));

      return (postFix*math.sin((t*d-s)*(2.0*rl.PI)/p)*0.5 + c + b);
    },
  );
}