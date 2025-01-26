{ config, ... }:

{
  programs.kitty.settings = {
    confirm_os_window_close = 0;
    enable_audio_bell = false;
    font_family       = "JetBrainsMono NF Medium";
    bold_font         = "JetBrainsMono NF Bold";
    italic_font       = "JetBrainsMono NF Italic";
    bold_italic_font  = "JetBrainsMono NF Bold Italic";
  };
}
