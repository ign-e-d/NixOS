{ config, pkgs, inputs, ... }:
{
  imports = [
    ../../non-host-specific

    ./programs
    ./home.nix
  ];
}
