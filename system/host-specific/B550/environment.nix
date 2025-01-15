#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    (dmenu.overrideAttrs (oldAttrs: rec {
      src = ../../../dmenu-5.3;
    }))
    (slstatus.overrideAttrs (oldAttrs: rec {
      src = ../../../slstatus-1.0;
    }))
    # dwm-status
    # (dwmblocks.overrideAttrs (oldAttrs: rec {
    #   src = ../../../dwmblocks;
    # }))
  ];
}
