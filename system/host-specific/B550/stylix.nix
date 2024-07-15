#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
    stylix.enable = true;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    stylix.cursor.package = pkgs.bibata-cursors;
    stylix.cursor.name = "Bibata-Modern-Ice";

    stylix.image = /home/a/NixOS/pictures/wallpaper.jpg;
}
