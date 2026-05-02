# LIMITATIONS

This document describes known limitations of the Dart raylib wrapper, including cases where the Dart FFI model fundamentally cannot match the original C API.

---

## Audio Callbacks (`AttachAudioMixedProcessor` / `AttachAudioStreamProcessor`)

**Severity: Partial limitation - works for visualization, unreliable for real-time DSP.**

Raylib's audio processing callbacks are invoked from a native audio thread (e.g. PulseAudio, WASAPI, ALSA) that has no Dart isolate attached to it. Dart FFI `NativeCallable` comes in two variants:

- `NativeCallable.listener` - dispatches through the main isolate's event loop. Works if the game loop is async (see below), but introduces latency.
- `NativeCallable.isolateLocal` - requires the calling thread to already be running inside a Dart isolate. Crashes with `Cannot invoke native callback outside an isolate` when called from the audio thread.

**`NativeCallable.listener` with an async game loop**

If your game loop yields to the event loop each frame (e.g. via `await Future.delayed(Duration.zero)`), `listener` callbacks will actually execute:

```dart
final ProcessAudioFunc = NativeCallable<AudioCallbackFunction>.listener(ProcessAudio);
rl.Audio.AttachAudioMixedProcessor(ProcessAudioFunc.nativeFunction);

while (!rl.Window.ShouldClose()) {
  rl.Audio.UpdateMusicStream(music);

  await Future.delayed(Duration.zero);
}

ProcessAudioFunc.close();
```

This works well for **visualization** (e.g. computing `averageVolume[]`), where a frame or two of latency is imperceptible.

It is **not suitable for real-time DSP** (e.g. modifying the audio buffer in-place). The audio thread queues callbacks faster than the game loop processes them (~hundreds of times per second vs. 60fps), so by the time Dart executes the callback the audio frames have already been played. Buffer modifications arrive too late to have any effect.

**Workarounds for real-time DSP:**

1. **Native C shim** - Write the audio processor in C, compile it as a small shared library, and load it via FFI. Expose a way to set parameters (e.g. `exponent`) via a shared native variable that Dart writes to. Dart reads output (e.g. `averageVolume[]`) each frame via a pointer.
2. **`UpdateAudioStream`** - If you control the audio source, push pre-processed PCM data from Dart each frame. Processing happens on the Dart side before submission, avoiding the callback entirely.

---

## Thread Safety

Raylib itself is not thread-safe - all raylib calls must happen on the thread that called `InitWindow`. Dart's multi-isolate model means you must not call any wrapped raylib function from a non-main isolate. There is no enforcement of this at the wrapper level; violations will produce undefined behavior or crashes.