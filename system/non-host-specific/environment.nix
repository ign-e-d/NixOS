#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
  ];

  environment.systemPackages = with pkgs; [
  ];
}
