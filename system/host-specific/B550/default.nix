{ config, pkgs, inputs, ... }:
{
  imports = [
    ../../non-host-specific

    ./boot.nix
    ./configuration.nix
    ./environment.nix
    ./fonts.nix
    ./hardware-configuration.nix
    ./hardware.nix
    ./i18n.nix
    ./networking.nix
    ./nix.nix
    ./nixpkgs.nix
    ./programs.nix
    ./qt.nix
    ./services.nix
    ./sound.nix
    ./stylix.nix
    ./system.nix
    ./systemd.nix
    ./time.nix
    ./users.nix
    ./virtualisation.nix
    ./xdg.nix
  ];
}
