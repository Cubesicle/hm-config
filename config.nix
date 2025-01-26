{ config, pkgs, ... }:

{
  home.username = "your-username";
  home.homeDirectory = "/home/your-username";

  # Set to true if you don't want to install packages
  noPkgs = false;

  # Extra packages
  extraPkgs = with pkgs; [
    #(config.lib.nixGL.wrap firefox)
    #config.home.pointerCursor.package
  ];

  # Set to true if you're using nixpkgs on a non-nixos system
  enableNixGL = false;

  # Environment variables
  home.sessionVariables = {
    EDITOR = "hx";
  };

  # Catppuccin
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  # Hyprland
  wayland.windowManager.hyprland.settings = {
    #monitor = [
    #  "DP-1, 1920x1080@144, 0x0, 1"
    #  "DP-2, preferred, 1920x180, 1"
    #  "HDMI-A-1, preferred, -768x-140, auto, transform, 1"
    #];
    input = {
      sensitivity = 0;
      accel_profile = "flat";
    };
  };
}
