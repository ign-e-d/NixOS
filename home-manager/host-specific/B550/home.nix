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

    qt5.qtwayland
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.lightly
    (catppuccin-kvantum.override {
      accent = catppuccin-accent;
      variant = catppuccin-variant;
    })
    #nordic
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.catppuccin-kvantum;
      name = "kvantum";
    };
  };

  xdg.configFile = {
    "Kvantum/Catppuccin-${catppuccin-variant}-${catppuccin-accent}/Catppuccin-${catppuccin-variant}-${catppuccin-accent}/Catppuccin-${catppuccin-variant}-${catppuccin-accent}.kvconfig".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-${catppuccin-variant}-${catppuccin-accent}/Cattpuccin-${catppuccin-variant}-${catppuccin-accent}.kvconfig";
    "Kvantum/Catppuccin-${catppuccin-variant}-${catppuccin-accent}/Catppuccin-${catppuccin-variant}-${catppuccin-accent}/Catppuccin-${catppuccin-variant}-${catppuccin-accent}.svg".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-${catppuccin-variant}-${catppuccin-accent}/Cattpuccin-${catppuccin-variant}-${catppuccin-accent}.svg";
  };

  #xdg.configFile = {
  #  "Kvantum/Nordic/Nordic.kvconfig".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Nordic/Nordic.kvconfig";
  #  "Kvantum/Nordic/Nordic.svg".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Nordic/Nordic.svg";
  #};

}
