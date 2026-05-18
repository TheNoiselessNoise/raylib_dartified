// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_spectrum_visualizer.c
// Run it: dart run audio_spectrum_visualizer.dart
// WARNING: expects resources from the raylib source
import 'dart:math' as math;
import 'dart:typed_data';
import '../../base.dart';

const int    MONO                          = 1;
const int    SAMPLE_RATE                   = 44100;
const double SAMPLE_RATE_F                 = 44100.0;
const int    FFT_WINDOW_SIZE               = 1024;
const int    BUFFER_SIZE                   = 512;
const int    PER_SAMPLE_BIT_DEPTH          = 16;
const int    AUDIO_STREAM_RING_BUFFER_SIZE = FFT_WINDOW_SIZE*2;
const double EFFECTIVE_SAMPLE_RATE         = SAMPLE_RATE_F*0.5;
const double WINDOW_TIME                   = FFT_WINDOW_SIZE/EFFECTIVE_SAMPLE_RATE;
const double FFT_HISTORICAL_SMOOTHING_DUR  = 2.0;
const double MIN_DECIBELS                  = -100.0;
const double MAX_DECIBELS                  = -30.0;
const double INVERSE_DECIBEL_RANGE         = (1.0/(MAX_DECIBELS - MIN_DECIBELS));
const double DB_TO_LINEAR_SCALE            = 20.0/2.302585092994046;
const double SMOOTHING_TIME_CONSTANT       = 0.8;
const int    TEXTURE_HEIGHT                = 1;
const int    FFT_ROW                       = 0;
const double UNUSED_CHANNEL                = 0.0;

class FFTComplex {
  double real;
  double imaginary;

  FFTComplex([this.real = 0, this.imaginary = 0]);
}

class FFTData {
  List<FFTComplex> spectrum;
  List<FFTComplex> workBuffer;
  List<double> prevMagnitudes;
  List<List<double>> fftHistory;
  int fftHistoryLen;
  int historyPos;
  double lastFftTime;
  double tapbackPos;

  FFTData({
    required this.spectrum,
    required this.workBuffer,
    required this.prevMagnitudes,
    required this.fftHistory,
    required this.fftHistoryLen,
    required this.historyPos,
    required this.lastFftTime,
    required this.tapbackPos,
  });
}

const int GLSL_VERSION = 330;
const int screenWidth = 800;
const int screenHeight = 450;

void main()
{
  final rl = findRaylib('raylib-5.5_linux_amd64/lib');

  rl.CoreD.InitWindow(screenWidth, screenHeight, "audio_spectrum_visualizer");
  rl.CoreD.SetWindowMonitor(0);
  rl.CoreD.SetTargetFPS(60);

  final fftImage = rl.CoreD.GenImageColor(BUFFER_SIZE, TEXTURE_HEIGHT, .WHITE);
  final fftTexture = rl.CoreD.LoadTextureFromImage(fftImage);
  final bufferA = rl.CoreD.LoadRenderTexture(screenWidth, screenHeight);
  final Vector2D iResolution = .vec2(screenWidth, screenHeight);

  final shader = rl.CoreD.LoadShader(null, "../resources/shaders/glsl$GLSL_VERSION/fft.fs");

  int iResolutionLocation = rl.CoreD.GetShaderLocation(shader, "iResolution");
  int iChannel0Location = rl.CoreD.GetShaderLocation(shader, "iChannel0");
  rl.CoreD.SetShaderValue(shader, iResolutionLocation, iResolution.toArray(), .SHADER_UNIFORM_VEC2);
  rl.CoreD.SetShaderValueTexture(shader, iChannel0Location, fftTexture);

  rl.AudioD.InitAudioDevice();
  rl.AudioD.SetAudioStreamBufferSizeDefault(AUDIO_STREAM_RING_BUFFER_SIZE);

  final wave = rl.AudioD.LoadWave("../resources/country.mp3");
  rl.AudioD.WaveFormat(wave, SAMPLE_RATE, PER_SAMPLE_BIT_DEPTH, MONO);

  final audioStream = rl.AudioD.LoadAudioStream(SAMPLE_RATE, PER_SAMPLE_BIT_DEPTH, MONO);
  rl.AudioD.PlayAudioStream(audioStream);

  int fftHistoryLen = (FFT_HISTORICAL_SMOOTHING_DUR/WINDOW_TIME).ceil() + 1;

  FFTData fft = FFTData(
    spectrum: .generate(FFT_WINDOW_SIZE, (_) => FFTComplex()),
    workBuffer: .generate(FFT_WINDOW_SIZE, (_) => FFTComplex()),
    prevMagnitudes: .filled(BUFFER_SIZE, 0),
    fftHistory: .generate(fftHistoryLen, (_) => .filled(BUFFER_SIZE, 0)),
    fftHistoryLen: fftHistoryLen,
    historyPos: 0,
    lastFftTime: 0,
    tapbackPos: 0.01,
  );

  int wavCursor = 0;
  final wavPCM16 = wave.data.asInt16List(); // short

  final List<int> chunkSamples = .filled(AUDIO_STREAM_RING_BUFFER_SIZE, 0);
  final List<double> audioSamples = .filled(FFT_WINDOW_SIZE, 0);

  while (!rl.CoreD.WindowShouldClose())
  {
    while (rl.AudioD.IsAudioStreamProcessed(audioStream)) {
      for (int i = 0; i < AUDIO_STREAM_RING_BUFFER_SIZE; i++) {
        int left = (wave.channels == 2) ? wavPCM16[wavCursor*2 + 0] : wavPCM16[wavCursor];
        int right = (wave.channels == 2) ? wavPCM16[wavCursor*2 + 1] : left;
        chunkSamples[i] = (left + right) ~/ 2;

        if (++wavCursor >= wave.frameCount) wavCursor = 0;
      }

      rl.AudioD.UpdateAudioStream(audioStream, Int16List.fromList(chunkSamples));

      for (int i = 0; i < FFT_WINDOW_SIZE; i++) {
        audioSamples[i] = (chunkSamples[i*2] + chunkSamples[i*2 + 1])*0.5/32767;
      }
    }

    CaptureFrame(rl, fft, audioSamples);
    RenderFrame(rl, fft, fftImage);
    rl.CoreD.UpdateTexture(fftTexture, fftImage.data);

    rl.CoreD.BeginDrawing();

      rl.CoreD.ClearBackground(.RAYWHITE);

      rl.CoreD.BeginShaderMode(shader);
        rl.CoreD.SetShaderValueTexture(shader, iChannel0Location, fftTexture);

        rl.CoreD.DrawTextureRec(
          bufferA.texture,
          .rect(0, 0, screenWidth, -screenHeight),
          .zero(),
          .WHITE
        );
      rl.CoreD.EndShaderMode();

    rl.CoreD.EndDrawing();
  }

  rl.CoreD.UnloadShader(shader);
  rl.CoreD.UnloadRenderTexture(bufferA);
  rl.CoreD.UnloadTexture(fftTexture);
  rl.CoreD.UnloadImage(fftImage);
  rl.AudioD.UnloadAudioStream(audioStream);
  rl.AudioD.UnloadWave(wave);
  rl.AudioD.CloseAudioDevice();

  rl.CloseWindowAndDispose();
}

void CooleyTukeyFFTSlow(Raylib rl, List<FFTComplex> spectrum, int n) {
  int j = 0;
  for (int i = 1; i < n - 1; i++) {
    int bit = n >> 1;
    while (j >= bit) {
      j -= bit;
      bit >>= 1;
    }
    j += bit;
    if (i < j) {
      FFTComplex temp = spectrum[i];
      spectrum[i] = spectrum[j];
      spectrum[j] = temp;
    }
  }

  for (int len = 2; len <= n; len <<= 1) {
    double angle = -2*rl.PI/len;
    FFTComplex twiddleUnit = FFTComplex(math.cos(angle), math.sin(angle));
    for (int i = 0; i < n; i += len) {
      FFTComplex twiddleCurrent = FFTComplex(1, 1);
      for (int j = 0; j < len/2; j++) {
        FFTComplex even = spectrum[i + j];
        FFTComplex odd = spectrum[i + j + len~/2];
        FFTComplex twiddledOdd = FFTComplex(
          odd.real*twiddleCurrent.real - odd.imaginary*twiddleCurrent.imaginary,
          odd.real*twiddleCurrent.imaginary + odd.imaginary*twiddleCurrent.real
        );

        spectrum[i + j].real = even.real + twiddledOdd.real;
        spectrum[i + j].imaginary = even.imaginary + twiddledOdd.imaginary;
        spectrum[i + j + len~/2].real = even.real - twiddledOdd.real;
        spectrum[i + j + len~/2].imaginary = even.imaginary - twiddledOdd.imaginary;

        double twiddleRealNext = twiddleCurrent.real*twiddleUnit.real - twiddleCurrent.imaginary*twiddleUnit.imaginary;
        twiddleCurrent.imaginary = twiddleCurrent.real*twiddleUnit.imaginary + twiddleCurrent.imaginary*twiddleUnit.real;
        twiddleCurrent.real = twiddleRealNext;
      }
    }
  }
}

void CaptureFrame(Raylib rl, FFTData fftData, List<double> audioSamples) {
  for (int i = 0; i < FFT_WINDOW_SIZE; i++) {
    double x = (2*rl.PI*i)/(FFT_WINDOW_SIZE - 1);
    double blackmanWeight = 0.42 - 0.5*math.cos(x) + 0.08*math.cos(2*x);
    fftData.workBuffer[i].real = audioSamples[i]*blackmanWeight;
    fftData.workBuffer[i].imaginary = 0;
  }

  CooleyTukeyFFTSlow(rl, fftData.workBuffer, FFT_WINDOW_SIZE);
  fftData.spectrum = .from(fftData.workBuffer);

  List<double> smoothedSpectrum = .filled(BUFFER_SIZE, 0);

  for (int bin = 0; bin < BUFFER_SIZE; bin++) {
    double re = fftData.workBuffer[bin].real;
    double im = fftData.workBuffer[bin].imaginary;
    double linearMagnitude = math.sqrt(re*re + im*im)/FFT_WINDOW_SIZE;

    double smoothedMagnitude = SMOOTHING_TIME_CONSTANT*fftData.prevMagnitudes[bin] + (1-SMOOTHING_TIME_CONSTANT)*linearMagnitude;
    fftData.prevMagnitudes[bin] = smoothedMagnitude;

    double db = math.log(math.max(smoothedMagnitude, 1e-40))*DB_TO_LINEAR_SCALE;
    double normalized = (db - MIN_DECIBELS)*INVERSE_DECIBEL_RANGE;
    smoothedSpectrum[bin] = rl.Clamp(normalized, 0, 1);
  }

  fftData.lastFftTime = rl.CoreD.GetTime();
  fftData.fftHistory[fftData.historyPos] = .from(smoothedSpectrum);
  fftData.historyPos = (fftData.historyPos + 1) % fftData.fftHistoryLen;
}

void RenderFrame(Raylib rl, FFTData fftData, ImageD fftImage) {
  double framesSinceTapback = (fftData.tapbackPos/WINDOW_TIME).floorToDouble();
  framesSinceTapback = rl.Clamp(framesSinceTapback, 0, fftData.fftHistoryLen - 1);

  int historyPosition = (fftData.historyPos - 1 - framesSinceTapback.toInt()) % fftData.fftHistoryLen;
  if (historyPosition < 0) historyPosition += fftData.fftHistoryLen;

  final amplitude = fftData.fftHistory[historyPosition];
  for (int bin = 0; bin < BUFFER_SIZE; bin++) {
    rl.CoreD.ImageDrawPixel(
      fftImage, bin, FFT_ROW,
      rl.CoreD.ColorFromNormalized(.vec4(
        amplitude[bin], UNUSED_CHANNEL, UNUSED_CHANNEL, UNUSED_CHANNEL
      ))
    );
  }
}