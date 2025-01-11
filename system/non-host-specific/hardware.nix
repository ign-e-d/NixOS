#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  hardware.bluetooth.enable = true;

  hardware.graphics.enable = true;
  # hardware.opengl.driSupport = true; no longer has any effect
  hardware.graphics.enable32Bit = true;
  # hardware.graphics.extraPackages = with pkgs; [ 11.01.25 doesnt exist anymore?
  #   rocm-opencl-icd
  #   rocm-opencl-runtime
  # ];

  hardware.steam-hardware.enable = true;
}
