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
      background      = "${palette.base.hex}ff";
      text            = "${palette.text.hex}ff";
      prompt          = "${palette.subtext1.hex}ff";
      placeholder     = "${palette.overlay1.hex}ff";
      input           = "${palette.text.hex}ff";
      match           = "${palette.${cfg.accent}.hex}ff";
      selection       = "${palette.surface2.hex}ff";
      selection-text  = "${palette.text.hex}ff";
      selection-match = "${palette.${cfg.accent}.hex}ff";
      counter         = "${palette.overlay1.hex}ff";
      border          = "${palette.${cfg.accent}.hex}ff";
    };
  };
}
