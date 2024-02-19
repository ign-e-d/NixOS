{ config, pkgs, ... }:
{
  imports =
    [
      /home/a/Documents/Share/NixOS-modules/Notebook-modules/boot.nix
      /home/a/Documents/Share/NixOS-modules/Notebook-modules/services.nix

      /home/a/Documents/Share/NixOS-modules/Common-modules/environment.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/hardware.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/home-manager.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/i18n.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/networking.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/nix.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/nixpkgs.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/sound.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/system.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/time.nix
      /home/a/Documents/Share/NixOS-modules/Common-modules/users.nix
    ];
}
