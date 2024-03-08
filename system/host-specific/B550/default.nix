{ config, pkgs, inputs, ... }:
{
  imports = [
    ../../non-host-specific

    ./boot.nix
    ./configuration.nix
    ./environment.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./nixpkgs.nix
    ./services.nix
    ./sound.nix
    ./system.nix
    ./systemd.nix
    ./time.nix
    ./users.nix
  ];
}
