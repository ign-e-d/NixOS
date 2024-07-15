#
# This file is intended for host-specific settings.
#

{ config, pkgs, inputs, outputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      inputs.stylix.nixosModules.stylix
    ];

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    backupFileExtension = "backup2";
    users.a = {
      imports = [
        ../../../home-manager/host-specific/B550
        #inputs.stylix.homeManagerModules.stylix
      ];
    };
  };
}
