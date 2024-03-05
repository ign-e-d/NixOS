{ config, pkgs, inputs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./configuration.nix
    ./services.nix
    ./boot.nix
    ./networking.nix
  ];
}
