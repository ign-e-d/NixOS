#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
let
  data = {
    font-family = "DroidSansMono Nerd Font";
    font-size = "15px";
    font-weight = "bold";
    text-color = "#cdd6f4";
  };
in
{
  programs.waybar.style = ''
    * {
      font-family: ${data.font-family};
      font-size: ${data.font-size};
      font-weight: ${data.font-weight};
      border-radius: 0px;
    }

    window#waybar {
      background: none;
    }

    #workspaces {
      font-size: 18px;
      padding-left: 15px;
    }

    #workspaces button {
      color: ${data.text-color};
      padding-left: 6px;
      padding-right: 6px;
    }

    #workspaces button.empty {
        color: #6c7086;
    }

    #workspaces button.active {
        color: #b4befe;
    }

    #language, #tray, #pulseaudio, #network, #cpu, #memory, #disk, #clock {
        font-size: ${data.font-size};
        color: ${data.text-color};
    }

    #cpu {
        padding-left: 15px;
        padding-right: 9px;
        margin-left: 7px;
    }
    #memory {
        padding-left: 9px;
        padding-right: 9px;
    }
    #disk {
        padding-left: 9px;
        padding-right: 15px;
    }

    #tray {
        padding: 0 20px;
        margin-left: 7px;
    }

    #pulseaudio {
        padding-left: 15px;
        padding-right: 9px;
        margin-left: 7px;
    }
    #network {
        padding-left: 9px;
        padding-right: 15px;
    }
    
    #clock {
        padding-left: 9px;
        padding-right: 15px;
    }

    #custom-launcher {
        font-size: 20px;
        color: #b4befe;
        font-weight: ${data.font-weight};
        padding-left: 10px;
        padding-right: 15px;
    }
    '';
}
