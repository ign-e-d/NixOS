#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    blender
    swww

    utterly-nord-plasma
  ];

      # https://discourse.nixos.org/t/guide-to-installing-qt-theme/35523/2
    xdg.configFile = {
      "Kvantum/Utterly-Nord-Solid-Plasma/Utterly-Nord-Solid/Utterly-Nord-Solid.kvconfig".source = "${pkgs.utterly-nord-plasma}/share/Kvantum/Utterly-Nord-Solid/Utterly-Nord-Solid.kvconfig";
      "Kvantum/Utterly-Nord-Solid-Plasma/Utterly-Nord-Solid/Utterly-Nord-Solid.svg".source = "${pkgs.utterly-nord-plasma}/share/Kvantum/Utterly-Nord-Solid/Utterly-Nord-Solid.svg";
      "Kvantum/Utterly-Nord-Solid-Plasma/Utterly-Nord-Solid/Nord.patchconfig".source = "${pkgs.utterly-nord-plasma}/share/Kvantum/Utterly-Nord-Solid/Nord.patchconfig";
      "Kvantum/kvantum.kvconfig".text = "[General]\ntheme=Utterly-Nord-Solid";
    };
}
