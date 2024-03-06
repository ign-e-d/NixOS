#! /usr/bin/env nix-shell
#! nix-shell -i bash figlet -p bash figlet

figlet "#$HOSTNAME"

cat << EOF

This simple script will do several things:
1. Execute "sudo nixos-rebuild switch --flake .#$HOSTNAME";
2. Reenable NixOS-check-updates.service;
3. Restart NixOS-check-updates.service;
4. Commit changes in configuration and push to repository.

EOF



echo '1. Execute "sudo nixos-rebuild switch --flake .#$HOSTNAME"'
sudo nixos-rebuild switch --flake .#$HOSTNAME &>logs/nixos-rebuild.log || (cat nixos-rebuild.log | grep --color error && false)
if [ $? -eq 1 ]; then
  kdialog --title "Stage #1" --yesno "Failed\nRead logs at ~/NixOS/logs\n\nTry again?"
  if [ $? -eq 0 ]; then
    bash /home/a/NixOS/rebuild-wrap.sh
  fi
  exit 0
fi



echo "2. Reenable NixOS-check-updates.service"
systemctl --user reenable NixOS-check-updates.service &>logs/NixOS-check-updates-reenable.log
if [ $? -eq 1 ]; then
  kdialog --title "Stage #2" --error "Failed\nRead logs at ~/NixOS/logs"
  exit 1
fi



echo "3. Restart NixOS-check-updates.service"
systemctl --user restart NixOS-check-updates.service &>logs/NixOS-check-updates-restart.log
if [ $? -eq 1 ]; then
  kdialog --title "Stage #3" --error "Failed\nRead logs at ~/NixOS/logs"
  exit 1
fi



echo "4. Commit changes in configuration and push to repository"
git fetch
git diff -U0 main origin/main
GEN=`readlink /nix/var/nix/profiles/system | cut -d- -f2`
git commit -am "$GEN"
kdialog --title "Stage #4" --yesno "Do you want to push to repository?"
if [ $? -eq 0 ]; then
  git push -u origin
fi



kdialog --title "nixos-rebuild.sh" --msgbox "Executed successfully"
exit 0
