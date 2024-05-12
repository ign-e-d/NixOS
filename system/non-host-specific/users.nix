#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  users.groups.wireshark = {};

  users.users.a = {
    isNormalUser = true;
    description = "a";
    extraGroups = [ "networkmanager" "wheel" "wireshark" "audio" ];
    packages = with pkgs; [
      glibcLocalesUtf8
    ];
  };
}
