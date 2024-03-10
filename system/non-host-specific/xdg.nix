#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
#        pkgs.xdg-desktop-portal-hyprland
        pkgs.libsForQt5.xdg-desktop-portal-kde
      ];
    };
  };
}
