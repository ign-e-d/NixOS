#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  system.stateVersion = "24.11";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";
}
