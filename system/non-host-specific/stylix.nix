#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
    stylix.enable = true;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    stylix.cursor.package = pkgs.vanilla-dmz;
    stylix.cursor.name = "DMZ-White";
    stylix.cursor.size = 24;

    stylix.targets.grub.useImage = true;

    stylix.image = /home/a/NixOS/pictures/wallpaper2.jpg;
}
