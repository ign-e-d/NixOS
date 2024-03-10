#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.waybar.settings = {
    mainBar = {
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
}
