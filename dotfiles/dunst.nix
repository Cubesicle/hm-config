{ config, ... }:

{
  services.dunst.settings = {
    global = {
      frame_width = 2;
      corner_radius = 10;
      follow = "mouse";
    };
  };
}
