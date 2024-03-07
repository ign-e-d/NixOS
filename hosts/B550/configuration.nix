#
# This file is intended for host-specific settings.
#

{ config, pkgs, inputs, outputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      a = import ../../home-manager;
    };
  };
}
