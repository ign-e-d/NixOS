#! /usr/bin/env nix-shell
#! nix-shell -i bash git kdialog figlet xorg.xrandr konsole -p bash git kdialog figlet xorg.xrandr konsole

config_folder="/home/a/NixOS"

# Screen resolution
read W H < <(xrandr --current | grep -oP '\d+x\d+' | tr x ' ')

# Rebuild script in separate konsole
konsole -geometry $W\x$H+0+0 -e sh -c $config_folder/scripts/nixos-rebuild-error-wrap.sh
