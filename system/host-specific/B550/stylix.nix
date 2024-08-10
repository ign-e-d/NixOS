#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
    stylix.enable = true;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

    # stylix.fonts = {
    #   monospace = {
    #     package = pkgs.nerdfonts.override {fonts = [ "DroidSansMono" ]; };
    #     name = "DroidSansMNerdFontMono";
    #   };
    # };

    stylix.targets.grub.useImage = true;

    stylix.image = /home/a/NixOS/pictures/wallpaper2.jpg;
}
