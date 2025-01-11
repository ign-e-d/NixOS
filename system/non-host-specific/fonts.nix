#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.droid-sans-mono
  ];
}
