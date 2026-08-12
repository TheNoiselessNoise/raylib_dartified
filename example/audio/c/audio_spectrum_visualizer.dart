// Example dartified, see original for reference:
// https://github.com/raysan5/raylib/blob/master/examples/audio/audio_spectrum_visualizer.c
// Run it: dart run audio_spectrum_visualizer.dart
// WARNING: expects resources from the raylib source
import 'dart:ffi';
import 'dart:math' as math;
import '../../base_c.dart';

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

late Pointer<Vector4C> renderFrameVec4;

void main()
{
  findRaylib('raylib-6.0_linux_amd64/lib');

  renderFrameVec4 = Vector4$.val.At('renderFrame')
    .set(UNUSED_CHANNEL, UNUSED_CHANNEL, UNUSED_CHANNEL, UNUSED_CHANNEL);

  InitWindow(screenWidth, screenHeight, "audio_spectrum_visualizer".toC);
  SetTargetFPS(60);

  final textureSource = Rectangle$.val.At('textureSource');
  final texturePosition = Vector2$.val.At('texturePosition');

  final fftImagePtr = Image$.val.At('fftImage');
  fftImagePtr.ref = GenImageColor(BUFFER_SIZE, TEXTURE_HEIGHT, WHITE);
  final fftTexture = LoadTextureFromImage(fftImagePtr.ref);
  final bufferA = LoadRenderTexture(screenWidth, screenHeight);
  final iResolution = Vector2$.val.At('iResolution').set(screenWidth, screenHeight);

  final shader = LoadShader(
    nullptr,
    "../resources/shaders/glsl$GLSL_VERSION/fft.fs".toC
  );

  int iResolutionLocation = GetShaderLocation(
    shader, "iResolution".toC
  );
  int iChannel0Location = GetShaderLocation(
    shader, "iChannel0".toC
  );
  SetShaderValue(
    shader,
    iResolutionLocation,
    iResolution.cast(),
    ShaderUniformDataType.SHADER_UNIFORM_VEC2.value
  );
  SetShaderValueTexture(shader, iChannel0Location, fftTexture);

  InitAudioDevice();
  SetAudioStreamBufferSizeDefault(AUDIO_STREAM_RING_BUFFER_SIZE);

  final wavePtr = Wave$.val.At('wavePtr');
  wavePtr.ref = LoadWave("../resources/country.mp3".toC);
  WaveFormat(wavePtr, SAMPLE_RATE, PER_SAMPLE_BIT_DEPTH, MONO);

  final audioStream = LoadAudioStream(SAMPLE_RATE, PER_SAMPLE_BIT_DEPTH, MONO);
  PlayAudioStream(audioStream);

  int fftHistoryLen = (FFT_HISTORICAL_SMOOTHING_DUR/WINDOW_TIME).ceil() + 1;

  final fft = FFTData(
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
  final wavPCM16 = wavePtr.ref.data.cast<Short>();

  final chunkSamples = Int16$.val.At('chunkSamples', AUDIO_STREAM_RING_BUFFER_SIZE);
  final audioSamples = Float32$.val.At('audioSamples', FFT_WINDOW_SIZE);

  while (!WindowShouldClose())
  {
    while (IsAudioStreamProcessed(audioStream)) {
      for (int i = 0; i < AUDIO_STREAM_RING_BUFFER_SIZE; i++) {
        int left = (wavePtr.ref.channels == 2) ? wavPCM16[wavCursor*2 + 0] : wavPCM16[wavCursor];
        int right = (wavePtr.ref.channels == 2) ? wavPCM16[wavCursor*2 + 1] : left;
        chunkSamples[i] = (left + right) ~/ 2;

        if (++wavCursor >= wavePtr.ref.frameCount) wavCursor = 0;
      }

      UpdateAudioStream(
        audioStream,
        chunkSamples.cast(),
        AUDIO_STREAM_RING_BUFFER_SIZE
      );

      for (int i = 0; i < FFT_WINDOW_SIZE; i++) {
        audioSamples[i] = (chunkSamples[i*2] + chunkSamples[i*2 + 1])*0.5/32767;
      }
    }

    CaptureFrame(fft, audioSamples);
    RenderFrame(fft, fftImagePtr);
    UpdateTexture(fftTexture, fftImagePtr.ref.data);

    BeginDrawing();

      ClearBackground(RAYWHITE);

      BeginShaderMode(shader);
        SetShaderValueTexture(shader, iChannel0Location, fftTexture);

        textureSource.set(0, 0, screenWidth, -screenHeight);
        DrawTextureRec(bufferA.texture, textureSource.ref, texturePosition.ref, WHITE);
      EndShaderMode();

    EndDrawing();
  }

  UnloadShader(shader);
  UnloadRenderTexture(bufferA);
  UnloadTexture(fftTexture);
  UnloadImage(fftImagePtr.ref);
  UnloadAudioStream(audioStream);
  UnloadWave(wavePtr.ref);
  CloseAudioDevice();

  CloseWindowAndDispose();
}

void CooleyTukeyFFTSlow(List<FFTComplex> spectrum, int n) {
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
    double angle = -2*PI/len;
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

void CaptureFrame(FFTData fftData, Pointer<Float> audioSamples) {
  for (int i = 0; i < FFT_WINDOW_SIZE; i++) {
    double x = (2*PI*i)/(FFT_WINDOW_SIZE - 1);
    double blackmanWeight = 0.42 - 0.5*math.cos(x) + 0.08*math.cos(2*x);
    fftData.workBuffer[i].real = audioSamples[i]*blackmanWeight;
    fftData.workBuffer[i].imaginary = 0;
  }

  CooleyTukeyFFTSlow(fftData.workBuffer, FFT_WINDOW_SIZE);
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
    smoothedSpectrum[bin] = Clamp(normalized, 0, 1);
  }

  fftData.lastFftTime = GetTime();
  fftData.fftHistory[fftData.historyPos] = .from(smoothedSpectrum);
  fftData.historyPos = (fftData.historyPos + 1) % fftData.fftHistoryLen;
}

void RenderFrame(FFTData fftData, Pointer<ImageC> fftImage) {
  double framesSinceTapback = (fftData.tapbackPos/WINDOW_TIME).floorToDouble();
  framesSinceTapback = Clamp(framesSinceTapback, 0, fftData.fftHistoryLen - 1);

  int historyPosition = (fftData.historyPos - 1 - framesSinceTapback.toInt()) % fftData.fftHistoryLen;
  if (historyPosition < 0) historyPosition += fftData.fftHistoryLen;

  final amplitude = fftData.fftHistory[historyPosition];
  for (int bin = 0; bin < BUFFER_SIZE; bin++) {
    renderFrameVec4.ref.x = amplitude[bin];
    ImageDrawPixel(fftImage, bin, FFT_ROW, ColorFromNormalized(renderFrameVec4.ref));
  }
}