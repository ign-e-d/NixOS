#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
  ];

  environment.systemPackages = with pkgs; [
    wireshark
    libratbag
    piper
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
