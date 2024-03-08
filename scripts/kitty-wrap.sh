#! /usr/bin/env nix-shell
#! nix-shell -i bash git kdialog figlet xorg.xrandr kitty -p bash git kdialog figlet xorg.xrandr kitty

config_folder=$(dirname "$(dirname "$0")")

# Rebuild script in separate kitty window
kitty --start-as maximized $config_folder/scripts/error-wrap.sh
