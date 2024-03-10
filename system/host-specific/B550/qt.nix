#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  #qt = {
  #  enable = true;
  #  platformTheme = "kde";
  #  style = {
  #    name = "adwaita-dark";
  #    package = pkgs.adwaita-qt;
  #  };
  #};

  environment.systemPackages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qt5ct
  ];

  nixpkgs.config.qt5 = {
    enable = true;
    platformTheme = "qt5ct";
    style = {
      package = pkgs.utterly-nord-plasma;
      name = "Utterly Nord Plasma";
    };
  };

  environment.variables.QT_QPA_PLATFORMTHEME = "qt5ct";
}
