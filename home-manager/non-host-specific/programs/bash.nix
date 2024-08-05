#
# This file is intended for non-host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      function lk {
        cd "$(walk "$@")"
      }
    '';
  };
}
