part of '../../../raylib_dartified_web.dart';

final class RaylibMsfGif extends RaylibModuleWasm {
  /// `msf_gif_alpha_threshold`
  late final XWasmPtr<XInt> msf_gif_alpha_threshold;
  /// `msf_gif_bgra_flag`
  late final XWasmPtr<XInt> msf_gif_bgra_flag;
  /// `msf_gif_begin`
  late final XF3<int> msf_gif_begin;
  /// `msf_gif_frame`
  late final XF5<int> msf_gif_frame;
  /// `msf_gif_end`
  late final XF2<void> msf_gif_end;
  /// `msf_gif_free`
  late final XF1<void> msf_gif_free;
  /// `msf_gif_begin_to_file`
  late final XF5<int> msf_gif_begin_to_file;
  /// `msf_gif_frame_to_file`
  late final XF5<int> msf_gif_frame_to_file;
  /// `msf_gif_end_to_file`
  late final XF1<int> msf_gif_end_to_file;

  RaylibMsfGif(super.rl) {
    msf_gif_alpha_threshold = symbol('msf_gif_alpha_threshold');
    msf_gif_bgra_flag       = symbol('msf_gif_bgra_flag');
    
    msf_gif_begin           = dwrap3('msf_gif_begin');
    msf_gif_frame           = dwrap5('msf_gif_frame');
    msf_gif_end             = swrap1('msf_gif_end');
    msf_gif_free            = dwrap1('msf_gif_free');
    msf_gif_begin_to_file   = dwrap5('msf_gif_begin_to_file');
    msf_gif_frame_to_file   = dwrap5('msf_gif_frame_to_file');
    msf_gif_end_to_file     = dwrap1('msf_gif_end_to_file');
  }
}