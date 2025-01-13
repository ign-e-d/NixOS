#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (dmenu.overrideAttrs (oldAttrs: rec {
      src = ../../../dmenu-5.3;
    }))
    (dwmblocks.overrideAttrs (oldAttrs: rec {
      src = ../../../dwmblocks;
    }))
  ];
}
