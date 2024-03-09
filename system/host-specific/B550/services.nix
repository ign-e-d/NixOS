#
# This file is intended for host-specific settings.
#

{ config, pkgs, inputs, ... }:
{
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Hyprland testing
  services.xserver.displayManager.sddm.wayland.enable = true;


  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages."${pkgs.system}".hyprland;
    xwayland.enable = true;
  };
}
