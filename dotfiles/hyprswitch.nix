{ config, lib, ... }:

let
  inherit (config.catppuccin) sources;

  cfg = config.catppuccin;
  palette = (lib.importJSON "${sources.palette}/palette.json").${cfg.flavor}.colors;
in

{
  home.file.".config/hypr/hyprswitch.css".text = ''
    :root {
      --border-color: ${palette.surface0.hex};
      --border-color-active: ${palette.${cfg.accent}.hex};
      --bg-color: ${palette.base.hex};
      --bg-color-hover: ${palette.base.hex};
      --index-border-color: ${palette.surface0.hex};
      --border-radius: 10px;
      --border-size: 2px;
    }

    * {
      font-family: JetBrainsMono NF;
    }

    label {
      color: ${palette.text.hex};
    }
  '';
}
