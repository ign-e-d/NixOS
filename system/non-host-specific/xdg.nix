#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  xdg = {
    mime = {
      enable = true;
      defaultApplications = {
        "application/pdf" = "firefox.desktop";
        "image/png" = "feh.desktop";
        "image/jpg" = "feh.desktop";
        "image/jpeg" = "feh.desktop";
      };
    };
    # autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
        pkgs.libsForQt5.xdg-desktop-portal-kde
        pkgs.lxqt.xdg-desktop-portal-lxqt
      ];
    };
  };
}
