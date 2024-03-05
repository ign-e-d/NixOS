{ config, pkgs, ... }:
{
  system.stateVersion = "23.11";
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://channels.nixos.org/nixos-unstable";
}
