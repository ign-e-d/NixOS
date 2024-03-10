{ config, pkgs, inputs, ... }:
{
  imports = [
    ./waybar.nix
    ./waybar-style.nix
    ./waybar-settings.nix
  ];
}
