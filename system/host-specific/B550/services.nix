#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "amdgpu" ];

  services.xserver.windowManager.dwm.enable = true;

  services.xserver.windowManager.dwm.package = pkgs.dwm.override {
    conf = ../../../dwm-6.5/config.def.h;
  };
}
