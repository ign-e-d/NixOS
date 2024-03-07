#
# This file is intended for non-host-specific settings.
#

{ config, pkgs, ... }:
{
  systemd.user.services.NixOS-check-updates = {
    enable = true;
    path = [
      pkgs.bash
      pkgs.coreutils
      pkgs.git
      pkgs.libsForQt5.kdialog
      pkgs.libsForQt5.konsole
      pkgs.systemd
      ];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      ExecStart = "${pkgs.bash}/bin/bash /home/a/NixOS/scripts/looper.sh";
    };
    # Maybe deprecated settings?
    environment = {
      DISPLAY = ":0";
      DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/1000/bus";
    };
    #restartIfChanged = true; maybe useful in future
  };
}

