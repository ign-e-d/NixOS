#
# This file is intended for non-host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  stylix.targets.kitty.enable = false;
  stylix.targets.helix.enable = false;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Classic";
}


