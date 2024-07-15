{ config, pkgs, inputs, ... }:
{
  imports = [
    ../../non-host-specific

    ./home.nix
  ];
}
