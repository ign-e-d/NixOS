#
# This file is intended for host-specific settings.
#

{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.slock = {
    enable = true;
    package = pkgs.slock.overrideAttrs {
      src = ../../../slock-1.5;
    };
  };
}
