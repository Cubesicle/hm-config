{ config, ... }:

{
  services.dunst.settings = {
    global = {
      font = "JetBrainsMono NF 8";
      frame_width = 2;
      corner_radius = 10;
      follow = "mouse";
    };
  };
}
