{ config, pkgs, inputs, ... }:
{
  imports = [
    ./services.nix
    ./boot.nix
    ./networking.nix
  ];
}
