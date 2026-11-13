# WASM Implementation Limitations

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