#
# This file is intended for host-specific home-manager settings.
#

{ config, pkgs, inputs, ... }:
{
  programs.waybar.style = ''
    * {
    font-family: DroidSansMono Nerd Font;
    font-size: 15px;
    border-radius: 0px;
    }

    window#waybar {
    background-color: rgba(50, 50, 50, 0.9);
    color: #ffffff;
    transition-property: background-color;
    transition-duration: .5s;
    }

        #clock,
        #workspaces,
        #custom-launcher {
        color: #e5e5e5;
        border-radius: 6px;
        padding: 2px 10px;
        background-color: #252733;
        border-radius: 8px;
        font-size: 16px;

        margin-left: 4px;
        margin-right: 4px;

        margin-top: 8.5px;
        margin-bottom: 8.5px;
        }
    '';
}
