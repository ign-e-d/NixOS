#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    blender
    swww
  ];
}
