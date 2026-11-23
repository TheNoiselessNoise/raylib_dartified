# Contents

- [LIMITATIONS (Native)](#limitations-native)
  - [Audio Callbacks](#audio-callbacks)
  - [Thread Safety](#thread-safety)
- [LIMITATIONS (Web)](#limitations-wasm)
  - [Stack Size](#stack-size)
  - [Audio Stream Polling](#audio-stream-polling)

# LIMITATIONS (Native)

## Audio Callbacks

Affected: `AttachAudioMixedProcessor` and `AttachAudioStreamProcessor`

Severity: `Partial limitation` - works for visualization, unreliable for real-time DSP.

Raylib's audio processing callbacks are invoked from a native audio thread (e.g. PulseAudio, WASAPI, ALSA) that has no Dart isolate attached to it. Dart FFI `NativeCallable` comes in two variants:

- `NativeCallable.listener` - dispatches through the main isolate's event loop. Works if the game loop is async (see below), but introduces latency.
- `NativeCallable.isolateLocal` - requires the calling thread to already be running inside a Dart isolate. Crashes with `Cannot invoke native callback outside an isolate` when called from the audio thread.

### **`NativeCallable.listener` with an async game loop**

`AudioCallback` uses `listener` internally for example.

If your game loop yields to the event loop each frame (e.g. via `await Future.delayed(Duration.zero)`), `listener` callbacks will actually execute:

```dart
final music = LoadMusicStream('myMusic.mp3');
final callback = AudioCallback.function((bufferData, frames) {
  // do something
});

AttachAudioMixedProcessor(callback);
while (!WindowShouldClose()) {
  UpdateMusicStream(music);
  await Future.delayed(Duration.zero);
}
```

This works well for **visualization** (e.g. computing `averageVolume[]`), where a frame or two of latency is imperceptible.

It is **not suitable for real-time DSP** (e.g. modifying the audio buffer in-place). The audio thread queues callbacks faster than the game loop processes them (~hundreds of times per second vs. 60fps), so by the time Dart executes the callback the audio frames have already been played. Buffer modifications arrive too late to have any effect.

**Workarounds for real-time DSP:**

1. **Native C shim** - Write the audio processor in C, compile it as a small shared library, and load it via FFI. Expose a way to set parameters (e.g. `exponent`) via a shared native variable that Dart writes to. Dart reads output (e.g. `averageVolume[]`) each frame via a pointer.
2. **`UpdateAudioStream`** - If you control the audio source, push pre-processed PCM data from Dart each frame. Processing happens on the Dart side before submission, avoiding the callback entirely.

## Thread Safety

Raylib itself is not thread-safe - all raylib calls must happen on the thread that called `InitWindow`. Dart's multi-isolate model means you must not call any wrapped raylib function from a non-main isolate. There is no enforcement of this at the wrapper level; violations will produce undefined behavior or crashes.

# LIMITATIONS (Web)

## Stack Size

WASM stack is a fixed linear memory region (default 64KB) with no guard pages
and no demand growth. Audio/image decoders (`dr_mp3`, `stb_vorbis`, `dr_wav`,
`stb_image`) allocate large local buffers across deep call chains and will
silently overflow into heap memory, manifesting as a misleading
`RuntimeError: index out of bounds` inside `ccall`/`cwrap`, not at the
overflow site itself.

On native, the OS stack is typically 8MB and grows on demand via page faults,
so this never surfaces. In WASM it is invisible until it crashes.

**Fix:** always compile with `-s STACK_SIZE=1048576` (1MB) at minimum.
Increase further if additional decoders or deep call stacks are involved.

## Audio Stream Polling

Raylib's audio streaming model (`IsAudioStreamProcessed` + `UpdateAudioStream`)
is a polling loop, the caller is responsible for refilling the buffer before it
runs dry. On native this is fine because the main loop runs uncapped and easily
outpaces the audio thread.

In WASM the main loop is driven by `requestAnimationFrame`, which is capped at
the display refresh rate (~16ms at 60fps) and subject to delays from tab
visibility, compositor jank, and GC pauses. The Web Audio API processes on a
separate thread at its own cadence, entirely decoupled from `requestAnimationFrame`. If a frame
takes too long, or `requestAnimationFrame` fires late, the audio buffer runs dry and stutters.

Any main-thread work inside the loop (FFT, image processing, heavy rendering)
compounds the problem by delaying the buffer refill further.

**There is no clean fix.** The correct solution would be an `AudioWorkletProcessor`
feeding the stream from the audio thread, which is not exposed by Emscripten's
miniaudio backend. Mitigations: increase buffer size to add headroom, and
always refill the audio stream before any other per-frame work.