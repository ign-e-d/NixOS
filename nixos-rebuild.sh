#! /usr/bin/env nix-shell
#! nix-shell -i bash figlet -p bash figlet

figlet "#$HOSTNAME"

echo "sudo nixos-rebuild switch --flake .#$HOSTNAME"

sudo nixos-rebuild switch --flake .#$HOSTNAME

if [ $? -eq 0 ]; then
  kdialog --title "rebuild.sh" --msgbox "nixos-rebuild switch\nExecuted successfully"
else
  kdialog --title "rebuild.sh" --yesno "nixos-rebuild switch\nFail\nTry again?"
  if [ $? -eq 0 ]; then
    bash /home/a/NixOS/rebuild-wrap.sh
  fi
  exit 0
fi

systemctl --user reenable NixOS-check-updates.service
if [ $? -eq 1 ]; then
  kdialog --title "rebuild.sh" --error "systemctl --user reenable NixOS-check-updates.service\nFail"
  exit 1
fi

systemctl --user restart NixOS-check-updates.service
if [ $? -eq 1 ]; then
  kdialog --title "rebuild.sh" --error "systemctl --user restart NixOS-check-updates.service\nFail"
  exit 1
fi

exit 0
