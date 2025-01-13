#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (dmenu.overrideAttrs (oldAttrs: rec {
      src = ../../../dmenu-5.3;
    }))
    (slock.overrideAttrs (oldAttrs: rec {
      src = ../../../slock-1.5;
    }))
    dwm-status
    # (dwmblocks.overrideAttrs (oldAttrs: rec {
    #   src = ../../../dwmblocks;
    # }))
  ];
}
