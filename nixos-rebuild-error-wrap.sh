#! /usr/bin/env nix-shell
#! nix-shell -i bash git kdialog figlet -p bash git kdialog figlet

me=$(basename "$0")
config_folder="/home/a/NixOS"

$config_folder/nixos-rebuild.sh

# Error handling
if [ $? = 0 ]; then
  kdialog --title "$me" --msgbox "Executed succesfully"
  exit 0
else
  kdialog --title "$me" --yesno "Failed\n\nTry again?"
  if [ $? = 0 ]; then
    $config_folder/konsole-wrap.sh
  fi
  exit 1
fi
