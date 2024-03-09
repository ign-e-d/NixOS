#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
let
  startupScript = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swww}/bin/swww init &
    sleep 1
    ${pkgs.swww}/bin/swww img /home/a/Pictures/wallpaper.jpg &
  '';
in
{
  programs.waybar = {
    enable = true;
    style = ''
      * {   
        font-family: DroidSansMono Nerd Font;
        font-size: 15px;
        border-radius: 0px;
      }

      window#waybar {
        background-color: rgba(50, 50, 50, 0.9);
        color: #ffffff;
        transition-property: background-color;
        transition-duration: .5s;
      }

          #clock,
          #workspaces,
          #custom-launcher {
            color: #e5e5e5;
            border-radius: 6px;
            padding: 2px 10px;
            background-color: #252733;
            border-radius: 8px;
            font-size: 16px;

            margin-left: 4px;
            margin-right: 4px;

            margin-top: 8.5px;
            margin-bottom: 8.5px;
          }
    '';
    settings.mainBar = {
      position= "top";
      layer= "top";
      height= 5;
      margin-top= 0;
      margin-bottom= 0;
      margin-left= 0;
      margin-right= 0;
      modules-left = ["custom/launcher" "hyprland/workspaces"];
      modules-center= [
        "clock"
      ];
      "hyprland/workspaces" = {
        format = "{name}";
        all-outputs = true;
        on-click = "activate";
        format-icons = {
          active = " 󱎴";
          default = "󰍹";
        };
        persistent-workspaces = {
          "1" = [];
          "2" = [];
          "3" = [];
          "4" = [];
          "5" = [];
          "6" = [];
          "7" = [];
          "8" = [];
          "9" = [];
        };
      };
      "custom/launcher" = {
        format = "󱄅";
        on-click = "rofi -show drun &";
      };
      clock = {
          format = " {:%H:%M}";
          tooltip= "true";
          tooltip-format= "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt= " {:%d/%m}";
      };
    };
  };

  programs.wofi = {
    enable = true;
  };

  programs.hyprlock = {
    enable = true;
    general = {
      
    };
    backgrounds = [
      {
        path = "/home/a/Pictures/screenlock.png";
        color = "rgba(25, 20, 20, 1.0)";
      }
    ];
    input-fields = [
      {
        placeholder_text = "";
      }
    ];
    labels = [
      {
        text = "$USER";
        color = "rgba(0, 0, 0, 1.0)";
      }
    ];
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
      "$menu" = "${pkgs.wofi}/bin/wofi --show drun";
      "$rebuild" = "/home/a/NixOS/scripts/kitty-wrap.sh";
      "$check-updates" = "/home/a/NixOS/scripts/check-updates.sh";
      "$waybar" = "${pkgs.waybar}/bin/waybar";
      "$lockScreen" = "${pkgs.hyprlock}/bin/hyprlock";

      # Some default env vars.
      env = [
        "XCURSOR_SIZE,24"
#        "QT_QPA_PLATFORMTHEME,qt5ct"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];

      input = {
        kb_layout = "us,ru,fi";
        kb_options = "grp:alt_shift_toggle";
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
      ];
    };
  };
}
