{ config, pkgs, ... }:

{
  programs.tmux = {
    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];
    keyMode = "vi";
    mouse = true;
  };  
}