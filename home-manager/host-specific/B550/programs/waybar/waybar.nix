#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.waybar = {
    enable = true;
  };
}
