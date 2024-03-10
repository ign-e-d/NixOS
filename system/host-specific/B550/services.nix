#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Hyprland
  services.xserver.displayManager.sddm.wayland.enable = true;
}
