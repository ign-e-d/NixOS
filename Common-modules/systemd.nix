{ config, pkgs, ... }:
{
  systemd.user.services.NixOS-check-updates = {
    enable = true;
    path = [pkgs.bash pkgs.git pkgs.libnotify pkgs.gnome.zenity pkgs.xorg.xhost];
    wantedBy = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = "yes";
      ExecStart = "${pkgs.bash}/bin/bash /home/a/Documents/Share/NixOS-modules/check-updates.sh";
    };
    environment = {
      DISPLAY = ":0";
      DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/1000/bus";
    };
  };
}

