systemctl --user reenable NixOS-check-updates.service
systemctl --user restart NixOS-check-updates.service

kdialog --passivepopup "Service reloaded"
