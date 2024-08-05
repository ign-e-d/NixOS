#
# This file is intended for non-host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export WALK_EDITOR=hx

      function lk {
        cd "$(walk --icons --fuzzy "$@")"
      }
    '';
  };
}
