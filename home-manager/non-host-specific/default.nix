{ config, pkgs, inputs, ... }:
{
  imports = [
    ./home.nix
    ./programs
  ];
}
