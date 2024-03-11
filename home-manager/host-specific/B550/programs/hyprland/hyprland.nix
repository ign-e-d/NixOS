#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &
    sleep 1
    ${pkgs.swww}/bin/swww img /home/a/NixOS/pictures/wallpaper.jpg &
  '';
in
{
  programs.rofi = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      exec-once = ''${startupScript}/bin/start'';

      monitor = [
        "HDMI-A-1, 1920x1080@75, 0x0, 1"
        "DP-1, 1920x1080@60, 1920x0, 1"
      ];

      workspace = [
        "HDMI-A-1, 1"
        "DP-1, 2"
      ];

      "$mod" = "SUPER";

      "$terminal" = "${pkgs.kitty}/bin/kitty";
      "$fileManager" = "${pkgs.libsForQt5.dolphin}/bin/dolphin";
      "$browser" = "${pkgs.firefox}/bin/firefox";
      "$menu" = "${pkgs.rofi}/bin/rofi -show drun &";
      "$rebuild" = "/home/a/NixOS/scripts/kitty-wrap.sh";
      "$check-updates" = "/home/a/NixOS/scripts/check-updates.sh";
      "$waybar" = "${pkgs.waybar}/bin/waybar";
      "$lockScreen" = "${pkgs.hyprlock}/bin/hyprlock";
      "$screenShot" = "${pkgs.hyprshot}/bin/hyprshot";

      # Some default env vars.
      env = [
        "XCURSOR_SIZE,24"
        "WLR_NO_HARDWARE_CURSORS,1"

        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "GDK_BACKEND,wayland"
        "GTK_USE_PORTAL,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_QPA_PLATFORM,wayland"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "MOZ_ENABLE_WAYLAND,1"

#        "GTK_THEME,Nord"
      ];

      input = {
        kb_layout = "us,ru,fi";
        kb_options = "grp:alt_shift_toggle";
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 3;
      };

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      bind = [
        "$mod, F, exec, $browser"
        "$mod, Q, exec, $terminal"
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, E, exec, $fileManager"
        "$mod, V, togglefloating"
        "$mod, R, exec, $menu"

        # Scripts
        "$mod, O, exec, $rebuild"
        "$mod, P, exec, $check-updates"

        # Waybar, doesn't work?
        "$mod, U, exec, pkill -SIGUSR1 .waybar-wrapped"
        "$mod, I, exec, pkill -SIGUSR2 .waybar-wrapped"

        # Hyprlock
        "$mod, L, exec, $lockScreen"

        # Move focus with mainMod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        # Move windows
        "$mod SHIFT, left, swapwindow, l"
        "$mod SHIFT, right, swapwindow, r"
        "$mod SHIFT, up, swapwindow, u"
        "$mod SHIFT, down, swapwindow, d"

        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"

        # Move window to workspace
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"

        # Hyprshot
        "$mod, PRINT, exec, $screenShot -m region"
      ];
    };
  };
}
