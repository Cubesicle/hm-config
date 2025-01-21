{ config, pkgs, ... }:

{
  home.username = "your-username";
  home.homeDirectory = "/home/your-username";

  # Set to true if you don't want to install packages
  noPkgs = false;

  # Extra packages
  extraPkgs = with pkgs; [
    #(config.lib.nixGL.wrap firefox)
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
}
