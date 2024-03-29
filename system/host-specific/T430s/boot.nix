#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  boot.loader = {
    grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
      gfxmodeEfi = "1600x900";
    };
  };

  boot.supportedFilesystems = [
    "ntfs"
  ];
}
