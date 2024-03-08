#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  users.users.a = {
    isNormalUser = true;
    description = "a";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      glibcLocalesUtf8
    ];
  };
}
