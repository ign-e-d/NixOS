#! /usr/bin/env nix-shell
#! nix-shell -i bash git figlet -p bash git figlet nh

set -e

me=$(basename "$0")
config_folder=$(dirname "$(dirname "$0")")

figlet "#$HOSTNAME"

git -C $config_folder add -A
git -C $config_folder status

echo ""
read -r -p "sudo nix flake update $config_folder/ ? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  sudo nix flake update $config_folder/
fi

echo ""
echo "sudo nixos-generate-config --show-hardware-config > $config_folder/system/host-specific/$HOSTNAME/hardware-configuration.nix"
sudo nixos-generate-config --show-hardware-config > $config_folder/system/host-specific/$HOSTNAME/hardware-configuration.nix

echo ""
echo "nh os switch $config_folder -- --impure"
nh os switch $config_folder -- --impure # todo fix and remove impure

echo ""
read -r -p "Do you want to commit changes and push to repository? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
  git -C $config_folder fetch
  git -C $config_folder diff -U0 main origin/main
  current_generation=`readlink /nix/var/nix/profiles/system | cut -d- -f2`
  git -C $config_folder add -A
  git -C $config_folder commit -m "$HOSTNAME-$current_generation"
  git -C $config_folder push -u origin
fi

exit 0
