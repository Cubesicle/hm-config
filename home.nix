{ config, lib, pkgs, ... }:

{
  # Imports
  imports = [
    <catppuccin/modules/home-manager>
    ./config.nix
  ] ++ lib.filesystem.listFilesRecursive ./dotfiles;

  options = {
    noPkgs = lib.mkEnableOption "Don't install packages";
    extraPkgs = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [];
      description = "Extra packages to install";
    };
    enableNixGL = lib.mkEnableOption "Enable nixGL";
  };

  config = {
    nixGL.packages = lib.mkIf config.enableNixGL (import <nixgl> { inherit pkgs; });

    home.pointerCursor.gtk.enable = true;
    home.pointerCursor.hyprcursor.enable = true;
    home.pointerCursor.name = "capitaine-cursors";
    home.pointerCursor.package = pkgs.capitaine-cursors;
    programs.btop.enable = true;
    programs.fuzzel.enable = true;
    programs.helix.enable = true;
    programs.kitty = {
      enable = true;
      package = lib.mkIf config.enableNixGL (config.lib.nixGL.wrap pkgs.kitty);
    };
    programs.tmux.enable = true;
    programs.yazi.enable = true;
    programs.zsh.enable = true;
    services.dunst.enable = true;
    services.hyprpaper.enable = true;
    wayland.windowManager.hyprland = {
      enable = true;
      package = lib.mkIf config.enableNixGL (config.lib.nixGL.wrap pkgs.hyprland);
    };

    home.packages = if config.noPkgs then
      lib.mkForce ([
        config.home.sessionVariablesPackage
        pkgs.home-manager
      ] ++ config.extraPkgs)
    else
      [
        pkgs.hyprshot
        pkgs.nerd-fonts.jetbrains-mono
      ] ++ config.extraPkgs;

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "24.11"; # Please read the comment before changing.

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
