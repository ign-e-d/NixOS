{ config, pkgs, inputs, ... }:
{
  imports = [
    ./environment.nix
    ./hardware.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./nixpkgs.nix
    ./sound.nix
    ./system.nix
    ./systemd.nix
    ./time.nix
    ./users.nix
  ];
}
