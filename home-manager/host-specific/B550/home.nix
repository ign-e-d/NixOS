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
    godot_4
    
    swww
    hyprshot
    dunst
    libnotify
    networkmanager

    qt5.qtwayland
  ];

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };


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
