#
# This file is intended for non-host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  stylix.targets.gtk.enable = false;
  # stylix.targets.kde.enable = false;
  stylix.targets.kitty.enable = false;
  stylix.targets.helix.enable = false;
}


