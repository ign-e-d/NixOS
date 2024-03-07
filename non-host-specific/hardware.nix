#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  hardware.bluetooth.enable = true;

  hardware.opengl.enable = true;
  hardware.opengl.driSupport = true;
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages = with pkgs; [
    rocm-opencl-icd
    rocm-opencl-runtime
  ];

  hardware.steam-hardware.enable = true;
}
