{ config, pkgs, ... }:

{
  programs.tmux = {
    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];
    keyMode = "vi";
    mouse = true;
    extraConfig = "set-option -g detach-on-destroy off";
  };
}
