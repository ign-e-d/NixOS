#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &

    sleep 1

    ${pkgs.swww}/bin/swww img /home/a/Pictures/gruv-material-texture.png &
  '';
in
{
  programs.waybar = {
    enable = true;
  };

  programs.wofi = {
    enable = true;
  };

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = ''${startupScript}/bin/start'';

      monitor = [
        "HDMI-1, 1920x1080@75, 0x0, 1"
        "DP-1, 1920x1080@60, 1920x0, 1"
      ];

      "$mod" = "SUPER";

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$browser" = "firefox";
      "$menu" = "wofi --show drun";

      # Some default env vars.
      env = [
        "XCURSOR_SIZE,24"
        "QT_QPA_PLATFORMTHEME,qt5ct"
      ];

      input = {
        kb_layout = "us";
      };

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

      bind = [
        "$mod F, exec, $browser"
        "$mod Q, exec, $terminal"
        "$mod C, killactive"
        "$mod M, exit"
        "$mod E, exec, $fileManager"
        "$mod V, togglefloating"
        "$mod R, exec, $menu"

        # Move focus with mainMod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"
      ];
    };
  };
}
