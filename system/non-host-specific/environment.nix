#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  environment.variables = {
    LANG = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
  };

  environment.systemPackages = with pkgs; [
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
