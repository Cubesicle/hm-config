{ config, lib, ... }:

let
  inherit (config.catppuccin) sources;

  cfg = config.catppuccin.fuzzel;
  palette = (lib.importJSON "${sources.palette}/palette.json").${cfg.flavor}.colors;
in

{
  programs.fuzzel.settings = lib.mkForce {
    main = {
      font = "JetBrainsMono NF";
      terminal = "kitty";
    };
    border.width = 2;

    colors = {
      background      = lib.mkIf cfg.enable "${palette.base.hex}ff";
      text            = lib.mkIf cfg.enable "${palette.text.hex}ff";
      prompt          = lib.mkIf cfg.enable "${palette.subtext1.hex}ff";
      placeholder     = lib.mkIf cfg.enable "${palette.overlay1.hex}ff";
      input           = lib.mkIf cfg.enable "${palette.text.hex}ff";
      match           = lib.mkIf cfg.enable "${palette.${cfg.accent}.hex}ff";
      selection       = lib.mkIf cfg.enable "${palette.surface2.hex}ff";
      selection-text  = lib.mkIf cfg.enable "${palette.text.hex}ff";
      selection-match = lib.mkIf cfg.enable "${palette.${cfg.accent}.hex}ff";
      counter         = lib.mkIf cfg.enable "${palette.overlay1.hex}ff";
      border          = lib.mkIf cfg.enable "${palette.${cfg.accent}.hex}ff";
    };
  };
}
