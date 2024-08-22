#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.nh = {
    enable = true;
  };
}
