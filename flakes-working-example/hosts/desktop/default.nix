{ config, pkgs, inputs, ... }:
{
  imports = [
    ./services.nix
    ./boot.nix
  ];
}
