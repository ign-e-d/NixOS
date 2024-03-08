#
# This file is intended for non-host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Ignatov Egor";
    userEmail = "ign-e-d@proton.me";
  };
}
