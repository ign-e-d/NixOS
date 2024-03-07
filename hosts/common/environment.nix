#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
  ];

  environment.systemPackages = with pkgs; [
  ];
}
