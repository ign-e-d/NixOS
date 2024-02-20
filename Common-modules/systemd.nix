{ config, pkgs, ... }:
{
  systemd.user.services.NixOS-check-updates = {
    enable = true;
    path = [pkgs.bash pkgs.git pkgs.coreutils pkgs.libsForQt5.kdialog pkgs.polkit pkgs.systemd];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      ExecStartPre = "${pkgs.coreutils}/bin/sleep 20";
      ExecStart = "${pkgs.bash}/bin/bash /home/a/Documents/Share/NixOS-modules/check-updates.sh";
    };
    environment = {
      DISPLAY = ":0";
      DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/1000/bus";
    };
  };
}

