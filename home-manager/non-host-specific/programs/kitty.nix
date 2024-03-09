#
# This file is intended for non-host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.kitty = {
    enable = true;
    theme = "Gruvbox Dark";
    font = {
      name = "DroidSansMonoNerdFontComplete-Regular";
      size = 12;
    };
  };
}
