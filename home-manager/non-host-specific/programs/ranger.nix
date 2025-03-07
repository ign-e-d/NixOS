#
# This file is intended for non-host-specific home-manager settings.
#

{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.ranger = {
    enable = true;

    extraPackages = [
      pkgs.w3m
    ];

    rifle = [
      {
        condition = "ext pdf";
        command = "firefox -- \"$@\"";
      }
    ];
  };
}
