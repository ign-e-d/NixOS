#
# This file is intended for host-specific settings.
#

{
  config,
  pkgs,
  inputs,
  outputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    inputs.stylix.nixosModules.stylix
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
    users.a = {
      imports = [
        # ../../../home-manager/host-specific/T430s
        ./home-manager-T430s
      ];
    };
  };
}
