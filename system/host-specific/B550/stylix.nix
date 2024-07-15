#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
    stylix.enable = true;

#    stylix.polarity = "dark";

    #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    stylix.image = /home/a/NixOS/pictures/wallpaper.jpg;
}
