import 'package:raylib_dartified/backend/wasm/abbr/wasm.dart';

RaylibMsfGif get _module => Raylib.instance.module();

/// See [RaylibMsfGif.msf_gif_alpha_threshold].
XWasmPtr<XInt> get msf_gif_alpha_threshold => _module.msf_gif_alpha_threshold;
/// See [RaylibMsfGif.msf_gif_bgra_flag].
XWasmPtr<XInt> get msf_gif_bgra_flag => _module.msf_gif_bgra_flag;
/// See [RaylibMsfGif.msf_gif_begin].
XF3<int> get msf_gif_begin => _module.msf_gif_begin;
/// See [RaylibMsfGif.msf_gif_frame].
XF5<int> get msf_gif_frame => _module.msf_gif_frame;
/// See [RaylibMsfGif.msf_gif_end].
XF2<void> get msf_gif_end => _module.msf_gif_end;
/// See [RaylibMsfGif.msf_gif_free].
XF1<void> get msf_gif_free => _module.msf_gif_free;
/// See [RaylibMsfGif.msf_gif_begin_to_file].
XF5<int> get msf_gif_begin_to_file => _module.msf_gif_begin_to_file;
/// See [RaylibMsfGif.msf_gif_frame_to_file].
XF5<int> get msf_gif_frame_to_file => _module.msf_gif_frame_to_file;
/// See [RaylibMsfGif.msf_gif_end_to_file].
XF1<int> get msf_gif_end_to_file => _module.msf_gif_end_to_file;