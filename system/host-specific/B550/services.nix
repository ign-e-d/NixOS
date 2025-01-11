#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "amdgpu" ];

  services.xserver.windowManager.dwm.enable = true;

  services.xserver.windowManager.dwm.package = pkgs.dwm.override {
    conf = ../../../dwm-6.5/config.def.h;
    # patches = [
    #   (pkgs.fetchpatch {
    #     url = "https://dwm.suckless.org/patches/movestack/dwm-movestack-20211115-a786211.diff";
    #     hash = "17k56aj0f6h5zkvjq4wdwcz4k6jr5m2wn4ma7w5ysgjxxp6xmn4w";
    #   })
    # ];
  };
}
