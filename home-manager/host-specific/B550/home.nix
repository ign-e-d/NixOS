#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
let
  catppuccin-accent = "Peach";
  catppuccin-variant = "Latte";
in
{
  home.packages = with pkgs; [
    blender
    swww
    hyprshot

    airshipper

    qt5.qtwayland
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
  };

  gtk = {
    enable = true;
    theme = {
      package = pkgs.adw-gtk3;
      name = "adw-gtk3";
    };
  };
}
