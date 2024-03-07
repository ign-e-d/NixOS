#! /usr/bin/env nix-shell
#! nix-shell -i bash git figlet -p bash git figlet

set -e

me=$(basename "$0")
config_folder="/home/a/NixOS"

figlet "#$HOSTNAME"

echo "-----------------------------------------------------------"
echo "This simple script will do several things:"
echo "1. Execute sudo nixos-rebuild switch --flake $config_folder#$HOSTNAME;"
echo "2. Reenable NixOS-check-updates.service;"
echo "3. Restart NixOS-check-updates.service;"
echo "4. Commit changes in configuration and push to repository."
echo "-----------------------------------------------------------"

echo ""
echo "1. Execute sudo nixos-rebuild switch --flake $config_folder#$HOSTNAME"
sudo nixos-rebuild switch --flake $config_folder#$HOSTNAME

echo ""
echo "2. Reenable NixOS-check-updates.service"
systemctl --user reenable NixOS-check-updates.service

echo ""
echo "3. Restart NixOS-check-updates.service"
systemctl --user restart NixOS-check-updates.service

echo ""
echo "4. Commit changes in configuration and push to repository"
read -r -p "Do you want to commit changes and push to repository? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  git -C $config_folder fetch
  git -C $config_folder diff -U0 main origin/main
  current_generation=`readlink /nix/var/nix/profiles/system | cut -d- -f2`
  git -C $config_folder commit -am "$current_generation"
  git -C $config_folder push -u origin
fi

exit 0