// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../raylib.dart';

class RaylibEasings extends RaylibModule {
  RaylibEasings(super.rl);

  // Ease: Linear
  double EaseLinearNone(num t, num b, num c, num d) => c*t/d + b;
  // Ease: Linear In
  double EaseLinearIn(num t, num b, num c, num d) => c*t/d + b;
  // Ease: Linear Out
  double EaseLinearOut(num t, num b, num c, num d) => c*t/d + b;
  // Ease: Linear In Out
  double EaseLinearInOut(num t, num b, num c, num d) => c*t/d + b;

  // Sine Easing functions
  // Ease: Sine In
  double EaseSineIn(num t, num b, num c, num d) => -c*math.cos(t/d*(rl.PI/2.0)) + c + b;
  // Ease: Sine Out
  double EaseSineOut(num t, num b, num c, num d) => c*math.sin(t/d*(rl.PI/2.0)) + b;
  // Ease: Sine In Out
  double EaseSineInOut(num t, num b, num c, num d) => -c/2.0*(math.cos(rl.PI*t/d) - 1.0) + b;

  // Circular Easing functions
  double EaseCircIn(num t, num b, num c, num d) {
    t /= d;
    return (-c*(math.sqrt(1.0 - t*t) - 1.0) + b);
  }
  double EaseCircOut(num t, num b, num c, num d) {
    t = t/d - 1.0;
    return (c*math.sqrt(1.0 - t*t) + b);
  }
  double EaseCircInOut(num t, num b, num c, num d)
  {
    if ((t/=d/2.0) < 1.0) {
      return (-c/2.0*(math.sqrt(1.0 - t*t) - 1.0) + b);
    }
    t -= 2.0;
    return (c/2.0*(math.sqrt(1.0 - t*t) + 1.0) + b);
  }

  // Cubic Easing functions
  double EaseCubicIn(num t, num b, num c, num d) {
    t /= d;
    return (c*t*t*t + b).toDouble();
  }
  double EaseCubicOut(num t, num b, num c, num d) {
    t = t/d - 1.0;
    return (c*(t*t*t + 1.0) + b);
  }
  double EaseCubicInOut(num t, num b, num c, num d)
  {
    if ((t/=d/2.0) < 1.0) {
      return (c/2.0*t*t*t + b);
    }
    t -= 2.0;
    return (c/2.0*(t*t*t + 2.0) + b);
  }

  // Quadratic Easing functions
  double EaseQuadIn(num t, num b, num c, num d) {
    t /= d;
    return (c*t*t + b).toDouble();
  }
  double EaseQuadOut(num t, num b, num c, num d) {
    t /= d;
    return (-c*t*(t - 2.0) + b);
  }
  double EaseQuadInOut(num t, num b, num c, num d)
  {
    if ((t/=d/2) < 1) {
      return (((c/2)*(t*t)) + b);
    }
    return (-c/2.0*(((t - 1.0)*(t - 3.0)) - 1.0) + b);
  }

  // Exponential Easing functions
  double EaseExpoIn(num t, num b, num c, num d) {
    return ((t == 0.0) ? b : (c*math.pow(2.0, 10.0*(t/d - 1.0)) + b)).toDouble();
  }

  double EaseExpoOut(num t, num b, num c, num d) {
    return ((t == d) ? (b + c) : (c*(-math.pow(2.0, -10.0*t/d) + 1.0) + b)).toDouble();
  }

  double EaseExpoInOut(num t, num b, num c, num d)
  {
    if (t == 0.0) return b.toDouble();
    if (t == d) return (b + c).toDouble();
    if ((t/=d/2.0) < 1.0) return (c/2.0*math.pow(2.0, 10.0*(t - 1.0)) + b);
    return (c/2.0*(-math.pow(2.0, -10.0*(t - 1.0)) + 2.0) + b);
  }

  // Back Easing functions
  double EaseBackIn(num t, num b, num c, num d)
  {
    final s = 1.70158;
    final postFix = t/=d;
    return (c*(postFix)*t*((s + 1.0)*t - s) + b);
  }

  double EaseBackOut(num t, num b, num c, num d)
  {
    final s = 1.70158;
    t = t/d - 1.0;
    return (c*(t*t*((s + 1.0)*t + s) + 1.0) + b);
  }

  double EaseBackInOut(num t, num b, num c, num d)
  {
    num s = 1.70158;
    if ((t/=d/2.0) < 1.0)
    {
      s *= 1.525;
      return (c/2.0*(t*t*((s + 1.0)*t - s)) + b);
    }

    final postFix = t-=2.0;
    s *= 1.525;
    return (c/2.0*((postFix)*t*((s + 1.0)*t + s) + 2.0) + b);
  }

  // Bounce Easing functions
  double EaseBounceOut(num t, num b, num c, num d)
  {
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
  }

  double EaseBounceIn(num t, num b, num c, num d) {
    return (c - EaseBounceOut(d - t, 0.0, c, d) + b);
  }

  double EaseBounceInOut(num t, num b, num c, num d)
  {
    if (t < d/2.0) {
      return (EaseBounceIn(t*2.0, 0.0, c, d)*0.5 + b);
    }
    return (EaseBounceOut(t*2.0 - d, 0.0, c, d)*0.5 + c*0.5 + b);
  }

  // Elastic Easing functions
  double EaseElasticIn(num t, num b, num c, num d)
  {
    if (t == 0.0) return b.toDouble();
    if ((t/=d) == 1.0) return (b + c).toDouble();

    final p = d*0.3;
    final a = c;
    final s = p/4.0;
    final postFix = a*math.pow(2.0, 10.0*(t-=1.0));

    return (-(postFix*math.sin((t*d-s)*(2.0*rl.PI)/p )) + b);
  }

  double EaseElasticOut(num t, num b, num c, num d)
  {
    if (t == 0.0) return b.toDouble();
    if ((t/=d) == 1.0) return (b + c).toDouble();

    final p = d*0.3;
    final a = c;
    final s = p/4.0;

    return (a*math.pow(2.0,-10.0*t)*math.sin((t*d-s)*(2.0*rl.PI)/p) + c + b);
  }

  double EaseElasticInOut(num t, num b, num c, num d)
  {
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
  }
}