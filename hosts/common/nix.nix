#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
