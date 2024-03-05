{ config, pkgs, ... }:
# add array of modules to import
{
  imports =
    [
      (./. + "/boot.nix")
      (./. + "/services.nix")
      (./. + "/networking.nix")

      (../Common-modules + "/environment.nix")
      (../Common-modules + "/hardware.nix")
      (../Common-modules + "/home-manager.nix")
      (../Common-modules + "/i18n.nix")
      (../Common-modules + "/nix.nix")
      (../Common-modules + "/nixpkgs.nix")
      (../Common-modules + "/sound.nix")
      (../Common-modules + "/system.nix")
      (../Common-modules + "/systemd.nix")
      (../Common-modules + "/time.nix")
      (../Common-modules + "/users.nix")
    ];
}
