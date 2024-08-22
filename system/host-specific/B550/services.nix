#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Hyprland
  services.displayManager.sddm.wayland.enable = true;

  # services.xserver.displayManager.sddm.theme = "${import ./sddm.nix { inherit pkgs; }}";
}
