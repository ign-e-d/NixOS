#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, inputs, ... }:
let
  stylix = pkgs.fetchFromGitHub {
      owner = "danth";
      repo = "stylix";
      rev = "...";
      sha256 = "...";
  };
in
{

}
