{ config, pkgs, ... }:

{
  services.dunst.settings = {
    global = {
      corner_radius = 10;
      follow = "mouse";
    };
  };
}