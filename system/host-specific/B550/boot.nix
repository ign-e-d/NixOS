#
# This file is intended for host-specific settings.
#

{ config, pkgs, ... }:
{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      gfxmodeEfi = "1920x1080";
    };
  };

  boot.supportedFilesystems = [
    "ntfs"
  ];

  boot.kernelParams = [
    "video=DP-1:1920x1080@60"
    "video=HDMI-A-1:1920x1080@75"
  ];

  boot.initrd.kernelModules = [ "amdgpu" ];
  # boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linux_latest;
  boot.kernelPackages = pkgs.linuxPackagesFor pkgs.linux_xanmod_latest;
}
