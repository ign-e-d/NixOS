#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  # environment.variables = {
  #   LANG = "en_GB.UTF-8";
  # };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
  ];

  environment.systemPackages = with pkgs; [
    st
    dmenu
    wireshark
  ];

  security.wrappers = {
    dumpcap = {
      program = "dumpcap";
      owner = "root";
      group = "wireshark";
      setuid = true;
      setgid = false;
      permissions = "u+rx,g+x";
      source = "${pkgs.wireshark}/bin/dumpcap";
    };
  };

  users.extraGroups.wireshark.gid = 500;
}
