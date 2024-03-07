#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
}
