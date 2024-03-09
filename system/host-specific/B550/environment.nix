#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  environment.systemPackages = with pkgs; [
    kdePackages.qt6ct
    kdePackages.breeze
    qt6.qtwayland
  ];

  # fix
  nixpkgs.config.qt6 = {
    enable = true;
    platformTheme = "qt6ct";
    style = {
      package = pkgs.catppuccin-kvantum;
      name = "kvantum";
    };
  };
}
