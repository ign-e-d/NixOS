#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "DroidSansMono" "FiraCode" ]; })
  ];
}
