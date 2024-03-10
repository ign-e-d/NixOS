#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.hyprlock = {
    enable = true;
    general = {
      
    };
    backgrounds = [
      {
        path = "/home/a/NixOS/pictures/screenlock.png";
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
        text = "";
        color = "rgba(0, 0, 0, 1.0)";
      }
    ];
  };
}
