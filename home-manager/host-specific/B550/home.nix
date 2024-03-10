#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    blender
    swww

    qt5.qtwayland
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.lightly
    #catppuccin-kvantum
    (catppuccin-kvantum.override {
      accent = "Peach";
      variant = "Frappe";
    })
  ];

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.catppuccin-kvantum;
      name = "kvantum";
    };
  };

  #xdg.configFile = {
  #  "Kvantum/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue.kvconfig".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue.kvconfig";
  #  "Kvantum/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue.svg".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue.svg";
  #};

  xdg.configFile = {
    "Kvantum/Catppuccin-Frappe-Peach/Catppuccin-Frappe-Peach/Catppuccin-Frappe-Peach.kvconfig".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Frappe-Peach/Cattpuccin-Frappe-Peach.kvconfig";
    "Kvantum/Catppuccin-Frappe-Peach/Catppuccin-Frappe-Peach/Catppuccin-Frappe-Peach.svg".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Frappe-Peach/Cattpuccin-Frappe-Peach.svg";
  };
}
