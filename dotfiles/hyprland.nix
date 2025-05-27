{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hyprsplit
    ];

    settings = {
      "$terminal" = "kitty";
      "$menu" = "fuzzel";
      "$mainMod" = "SUPER";
      "$altMod" = "ALT";

      bind = [
        "$mainMod, RETURN, exec, $terminal sh -c 'tmux attach -t main || tmux new -s main'"
        "$mainMod, W, killactive"
        "$mainMod, V, togglefloating"
        "$mainMod, S, togglesplit"
        "$mainMod, F, fullscreen, 0"
        "$mainMod, G, togglegroup"
        "$mainMod, BRACKETLEFT, changegroupactive, b"
        "$mainMod, BRACKETRIGHT, changegroupactive, f"
        "$mainMod SHIFT, TAB, changegroupactive, b"
        "$mainMod, TAB, changegroupactive, f"
        "$mainMod SHIFT, BRACKETLEFT, movegroupwindow, b"
        "$mainMod SHIFT, BRACKETRIGHT, movegroupwindow, f"
        "$mainMod SHIFT, S, exec, hyprshot -m region --clipboard-only --freeze"
        "$mainMod CTRL, Q, exit"
        "$mainMod, M, exec, $menu"

        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        "$mainMod SHIFT, H, movewindoworgroup, l"
        "$mainMod SHIFT, L, movewindoworgroup, r"
        "$mainMod SHIFT, K, movewindoworgroup, u"
        "$mainMod SHIFT, J, movewindoworgroup, d"
        "$mainMod SHIFT $altMod, H, movewindow, l"
        "$mainMod SHIFT $altMod, L, movewindow, r"
        "$mainMod SHIFT $altMod, K, movewindow, u"
        "$mainMod SHIFT $altMod, J, movewindow, d"

        "$mainMod, 1, split:workspace, 1"
        "$mainMod, 2, split:workspace, 2"
        "$mainMod, 3, split:workspace, 3"
        "$mainMod, 4, split:workspace, 4"
        "$mainMod, 5, split:workspace, 5"
        "$mainMod, 6, split:workspace, 6"
        "$mainMod, 7, split:workspace, 7"
        "$mainMod, 8, split:workspace, 8"
        "$mainMod, 9, split:workspace, 9"
        "$mainMod, 0, split:workspace, 10"

        "$mainMod SHIFT, 1, split:movetoworkspace, 1"
        "$mainMod SHIFT, 2, split:movetoworkspace, 2"
        "$mainMod SHIFT, 3, split:movetoworkspace, 3"
        "$mainMod SHIFT, 4, split:movetoworkspace, 4"
        "$mainMod SHIFT, 5, split:movetoworkspace, 5"
        "$mainMod SHIFT, 6, split:movetoworkspace, 6"
        "$mainMod SHIFT, 7, split:movetoworkspace, 7"
        "$mainMod SHIFT, 8, split:movetoworkspace, 8"
        "$mainMod SHIFT, 9, split:movetoworkspace, 9"
        "$mainMod SHIFT, 0, split:movetoworkspace, 10"

        "ALT, TAB, exec, hyprswitch gui --mod-key alt_l --key tab --close mod-key-release --reverse-key=mod=shift && hyprswitch dispatch"
        "ALT SHIFT, TAB, exec, hyprswitch gui --mod-key alt_l --key tab --close mod-key-release --reverse-key=mod=shift && hyprswitch dispatch -r"

        "$mainMod, mouse_up, split:workspace, m+1"
        "$mainMod, mouse_down, split:workspace, m-1"
        "$mainMod, mouse_right, focusmonitor, r"
        "$mainMod, mouse_left, focusmonitor, l"

        "$mainMod, mouse:274, togglefloating"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      general = {
        border_size = 2;
        "col.active_border" = "$accent";
        "col.inactive_border" = "$surface0";
      };

      dwindle.preserve_split = true;

      group = {
        "col.border_active" = "$accent";
        "col.border_inactive" = "$surface0";
        groupbar = {
          font_family = "JetBrainsMono NF";
          text_color = "$text";
          "col.active" = "$accent";
          "col.inactive" = "$surface0";
        };
      };

      decoration.rounding = 10;

      misc = {
        font_family = "JetBrainsMono NF";
        splash_font_family = "JetBrainsMono NF";
      };

      layerrule = "noanim, selection";
    };
  };
}
