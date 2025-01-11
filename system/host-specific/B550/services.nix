#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "amdgpu" ];

  services.xserver.windowManager.dwm.enable = true;

  # services.xserver.windowManager.dwm.package = pkgs.dwm.override {
  #   conf = ../../../dwm-6.5/config.def.h;
  #   patches = [
  #     (pkgs.fetchpatch {
  #       url = "https://dwm.suckless.org/patches/movestack/dwm-movestack-6.1.diff";
  #       hash = "sha256-PUd+P1WF4Ac5azB6tpYjbPo6XTrsqw/G9Y3mjvhHjmM=";
  #     })
  #   ];
  # };

  services.xserver.windowManager.dwm.package = pkgs.dwm.overrideAttrs {
    src = ../../../dwm-6.5;
  };
}
