const String template = r"""
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>raylib_dartified_web</title>
  <style>
    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: monospace;
      background: #0d0d0d;
      color: #c8c8c8;
      min-height: 100vh;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 1rem;
      gap: 0.75rem;
    }

    #header {
      width: 100%;
      max-width: 800px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 0.5rem 0;
      border-bottom: 1px solid #2a2a2a;
    }

    #title {
      font-size: 13px;
      color: #555;
      letter-spacing: 0.08em;
      text-transform: uppercase;
    }

    #status-bar {
      font-size: 12px;
      color: #555;
      display: flex;
      align-items: center;
      gap: 0.75rem;
    }

    #status.info { color: dodgerblue; }
    #status.warning { color: orange; }
    #status.error { color: red; }

    .spinner {
      width: 10px;
      height: 10px;
      border: 1.5px solid #333;
      border-top-color: #7adb78;
      border-radius: 50%;
      animation: spin 0.8s linear infinite;
      flex-shrink: 0;
    }

    @keyframes spin { to { transform: rotate(360deg); } }

    #canvas-wrap {
      width: 100%;
      max-width: 800px;
      border: 1px solid #2a2a2a;
      line-height: 0;
    }

    canvas.emscripten {
      display: block;
      width: 100%;
      background: #000;
    }

    #output {
      width: 100%;
      max-width: 800px;
      height: 100px;
      background: #0d0d0d;
      border: 1px solid #2a2a2a;
      border-top: none;
      color: #afafaf;
      font-family: monospace;
      font-size: 11px;
      padding: 0.5rem;
      resize: none;
      outline: none;
    }

    #controls {
      width: 100%;
      max-width: 800px;
      display: flex;
      gap: 1rem;
      justify-content: flex-end;
      align-items: center;
    }

    button {
      font-family: monospace;
      font-size: 11px;
      background: transparent;
      border: 1px solid #2a2a2a;
      color: #555;
      padding: 4px 12px;
      cursor: pointer;
      text-transform: uppercase;
      letter-spacing: 0.05em;
    }

    button:hover { border-color: #444; color: #888; }

    label {
      font-size: 11px;
      color: #444;
      display: flex;
      align-items: center;
      gap: 6px;
      cursor: pointer;
    }

    input[type=checkbox] { accent-color: #7adb78; }

    progress {
      width: 120px;
      height: 6px;
      accent-color: #7adb78;
    }

    /* ── Fullscreen output overlay ── */
    #fs-output-wrap {
      display: none;
      position: fixed;
      bottom: 0;
      left: 0;
      width: 100%;
      z-index: 9999;
      pointer-events: none;
    }

    #fs-output-panel {
      background: rgba(13, 13, 13, 0.88);
      border-top: 1px solid #2a2a2a;
      width: 100%;
      max-height: 180px;
      transform: translateY(100%);
      transition: transform 0.25s ease;
      pointer-events: auto;
    }

    #fs-output-panel.visible {
      transform: translateY(0);
    }

    #fs-output-text {
      width: 100%;
      height: 140px;
      background: transparent;
      border: none;
      color: #afafaf;
      font-family: monospace;
      font-size: 11px;
      padding: 0.5rem 0.75rem;
      resize: none;
      outline: none;
    }

    #fs-toggle-btn {
      position: fixed;
      bottom: 12px;
      right: 12px;
      z-index: 10000;
      display: none;
      font-family: monospace;
      font-size: 10px;
      background: rgba(13, 13, 13, 0.55);
      border: 1px solid rgba(80, 80, 80, 0.5);
      color: rgba(170, 170, 170, 0.7);
      padding: 5px 10px;
      cursor: pointer;
      text-transform: uppercase;
      letter-spacing: 0.06em;
      border-radius: 3px;
      backdrop-filter: blur(4px);
      -webkit-backdrop-filter: blur(4px);
      transition: background 0.15s, color 0.15s, border-color 0.15s;
      line-height: 1.4;
    }

    #fs-toggle-btn:hover {
      background: rgba(30, 30, 30, 0.75);
      border-color: rgba(120, 120, 120, 0.6);
      color: rgba(200, 200, 200, 0.9);
    }

    #fs-toggle-btn.active {
      border-color: rgba(122, 219, 120, 0.5);
      color: rgba(122, 219, 120, 0.8);
    }

    @media (max-width: 768px) and (pointer: coarse) {
      body {
        overflow: hidden;
        padding: 0;
        gap: 0;
        background: #000;
        justify-content: center;
      }

      #header, #output, #controls { display: none; }

      #canvas-wrap {
        position: fixed;
        top: 0; left: 0;
        width: 100vh;
        height: 100vw;
        max-width: none;
        border: none;
        transform: rotate(90deg) translateY(-100%);
        transform-origin: top left;
      }

      canvas.emscripten {
        width: 100%;
        height: 100%;
      }
    }
  </style>
</head>
<body>

  <div id="header">
    <span id="title">raylib_dartified_web</span>
    <div id="status-bar">
      <div class="spinner" id="spinner"></div>
      <span id="status">Downloading…</span>
      <progress id="progress" value="0" max="100" hidden></progress>
    </div>
  </div>

  <div id="canvas-wrap">
    <canvas class="emscripten" id="canvas" oncontextmenu="event.preventDefault()" tabindex="-1"></canvas>
  </div>

  <textarea id="output" rows="6" readonly></textarea>

  <div id="controls">
    <label><input type="checkbox" id="resize"> resize canvas</label>
    <label><input type="checkbox" id="pointerLock" checked> lock pointer</label>
    <button onclick="Module.requestFullscreen(document.getElementById('pointerLock').checked, document.getElementById('resize').checked)">fullscreen</button>
  </div>

  <!-- Fullscreen overlay: reparented into the FS element at runtime -->
  <button id="fs-toggle-btn" onclick="toggleFsOutput()" title="Toggle output">output</button>
  <div id="fs-output-wrap">
    <div id="fs-output-panel">
      <textarea id="fs-output-text" readonly></textarea>
    </div>
  </div>

  <script>
    var statusElement   = document.getElementById('status');
    var progressElement = document.getElementById('progress');
    var spinnerElement  = document.getElementById('spinner');
    var outputElement   = document.getElementById('output');
    var fsOutputText    = document.getElementById('fs-output-text');
    var fsToggleBtn     = document.getElementById('fs-toggle-btn');
    var fsOutputWrap    = document.getElementById('fs-output-wrap');
    var fsOutputPanel   = document.getElementById('fs-output-panel');

    if (outputElement) outputElement.value = '';

    var fsOutputVisible = false;

    // Overlay nodes that need to live inside whichever element is fullscreened
    var fsToggleBtn  = document.getElementById('fs-toggle-btn');
    var fsOutputWrap = document.getElementById('fs-output-wrap');
    // Remember their original parent so we can restore on exit
    var fsOverlayOriginalParent = fsToggleBtn.parentNode;

    function toggleFsOutput() {
      fsOutputVisible = !fsOutputVisible;
      if (fsOutputVisible) {
        fsOutputPanel.classList.add('visible');
        fsToggleBtn.classList.add('active');
        fsOutputText.scrollTop = fsOutputText.scrollHeight;
      } else {
        fsOutputPanel.classList.remove('visible');
        fsToggleBtn.classList.remove('active');
      }
    }

    function onFullscreenChange() {
      var fsEl = document.fullscreenElement ||
                 document.webkitFullscreenElement ||
                 document.mozFullScreenElement ||
                 document.msFullscreenElement;

      if (fsEl) {
        // Emscripten fullscreened some element (usually the canvas), adopt our
        // overlay nodes into it so they sit above the canvas in the FS layer.
        fsEl.appendChild(fsToggleBtn);
        fsEl.appendChild(fsOutputWrap);
        fsToggleBtn.style.display = 'block';
        fsOutputWrap.style.display = 'block';
      } else {
        // Exiting fullscreen, move overlays back to their original home.
        fsOverlayOriginalParent.appendChild(fsToggleBtn);
        fsOverlayOriginalParent.appendChild(fsOutputWrap);
        fsToggleBtn.style.display = 'none';
        fsOutputWrap.style.display = 'none';
        fsOutputVisible = false;
        fsOutputPanel.classList.remove('visible');
        fsToggleBtn.classList.remove('active');
      }
    }

    document.addEventListener('fullscreenchange',       onFullscreenChange);
    document.addEventListener('webkitfullscreenchange', onFullscreenChange);
    document.addEventListener('mozfullscreenchange',    onFullscreenChange);
    document.addEventListener('MSFullscreenChange',     onFullscreenChange);

    document.getElementById('canvas').addEventListener('webglcontextlost', (e) => {
      alert('WebGL context lost. Reload the page.');
      e.preventDefault();
    }, false);

    var setStatus = (text, type='error') => {
      statusElement.className = type;
      if (!setStatus.last) setStatus.last = { time: Date.now(), text: '' };
      if (text === setStatus.last.text) return;
      var m = text.match(/([^(]+)\((\d+(\.\d+)?)\/(\d+)\)/);
      var now = Date.now();
      if (m && now - setStatus.last.time < 30) return;
      setStatus.last.time = now;
      setStatus.last.text = text;
      if (m) {
        text = m[1];
        progressElement.value = parseInt(m[2]) * 100;
        progressElement.max   = parseInt(m[4]) * 100;
        progressElement.hidden = false;
        spinnerElement.hidden  = false;
      } else {
        progressElement.value = null;
        progressElement.max   = null;
        progressElement.hidden = true;
        if (!text) spinnerElement.style.display = 'none';
      }
      statusElement.textContent = text;
    };

    var Module = {
      print(...args) {
        var line = args.join(' ') + '\n';
        if (outputElement) {
          outputElement.value += line;
          outputElement.scrollTop = outputElement.scrollHeight;
        }
        if (fsOutputText) {
          fsOutputText.value += line;
          fsOutputText.scrollTop = fsOutputText.scrollHeight;
        }
        console.log(...args);
      },
      canvas: document.getElementById('canvas'),
      getContextAttributes: function() {
        return {
          preserveDrawingBuffer: true,
          // alpha: false,
          // antialias: true
        };
      },
      setStatus,
      totalDependencies: 0,
      monitorRunDependencies(left) {
        this.totalDependencies = Math.max(this.totalDependencies, left);
        setStatus(left
          ? 'Preparing… (' + (this.totalDependencies - left) + '/' + this.totalDependencies + ')'
          : 'All downloads complete.', 'info');
      },
      onRuntimeInitialized: () => dartMain(),
    };

    setStatus('Downloading…', 'info');

    window.onerror = () => {
      setStatus('Exception thrown, see JavaScript console');
      spinnerElement.style.display = 'none';
      setStatus = (text) => { if (text) console.error('[post-exception status] ' + text); };
    };
  </script>

  <script async src="raylib.js?v=1"></script>
  <script async src="main.js?v=1"></script>

</body>
</html>
""";