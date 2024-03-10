#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.waybar.settings = {
    mainBar = {
      position = "top";
      layer = "top";
      height = 5;
      margin-top = 0;
      margin-bottom = 0;
      margin-left = 0;
      margin-right = 0;

      modules-left = [
        "hyprland/workspaces"
      ];

      modules-center = [
        "clock"
      ];

      modules-right= [
        "tray"
        "hyprland/language"
        "cpu"
        "memory"
        "disk"
        "pulseaudio" 
        "network"
      ];

      "hyprland/workspaces"= {
        active-only= false;
        disable-scroll= true;
        format = "{icon}";
        on-click= "activate";
        format-icons= {
            "1"= "󰈹";
            "2"= "";
            urgent= "";
            default = "";
            sort-by-number= true;
        };
        persistent-workspaces = {
            "1"= [];
            "2"= [];
        };
      };

      clock = {
        format = " {:%H:%M:%S}";
        tooltip = "true";
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = " {:%d/%m}";
        interval = 1;
      };

      "hyprland/language" = {
        format = "{short}";
      };

      memory= {
        format= "󰟜 {}%";
        format-alt= "󰟜 {used} GiB"; # 
        interval= 2;
      };

      cpu= {
        format= " {usage}%";
        format-alt= " {avg_frequency} GHz";
        interval= 2;
      };

      disk = {
        format = "󰋊 {percentage_used}%";
        interval= 60;
      };
      
      network = {
        format-ethernet = "󰀂 ";
        tooltip-format = "Connected to {essid} {ifname} via {gwaddr}";
        format-linked = "{ifname} (No IP)";
        format-disconnected = "󰖪 ";
      };

      tray= {
        icon-size= 20;
        spacing= 8;
      };

      pulseaudio= {
        format= "{icon} {volume}%";
        format-muted= "󰖁 {volume}%";
        format-icons= {
            default = [" "];
            muted = ["󰖁 "];
        };
        scroll-step= 5;
        on-click= "${pkgs.pamixer}/bin/pamixer -t";
      };
    };
  };
}
