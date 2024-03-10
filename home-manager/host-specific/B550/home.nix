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
    catppuccin-kvantum
  ];

  #home.pointerCursor = {
    #gtk.enable = true;
    # x11.enable = true;
    #package = pkgs.bibata-cursors;
    #name = "Bibata-Modern-Classic";
    #size = 16;
  #};

  #gtk = {
  #  enable = true;
  #  theme = {
  #    package = pkgs.flat-remix-gtk;
  #    name = "Flat-Remix-GTK-Grey-Darkest";
  #  };

  #  iconTheme = {
  #    package = pkgs.gnome.adwaita-icon-theme;
  #    name = "Adwaita";
  #  };

  #  font = {
  #    name = "Sans";
  #    size = 11;
  #  };
  #};

  qt = {
    enable = true;
    platformTheme = "qtct";
    style = {
      package = pkgs.catppuccin-kvantum;
      name = "kvantum";
    };
  };

  xdg.configFile = {
    "Kvantum/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue.kvconfig".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue.kvconfig";
    "Kvantum/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue.svg".source = "${pkgs.catppuccin-kvantum}/share/Kvantum/Catppuccin-Frappe-Blue/Catppuccin-Frappe-Blue.svg";
  };

#  qt = {
#    enable = true;
#    platformTheme = "kde";
#    style = {
#      package = pkgs.libsForQt5.breeze-qt5;
#      name = "breeze";
#    };
#  };
}
