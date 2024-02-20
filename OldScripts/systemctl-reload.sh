pkexec systemctl daemon-reload
systemctl --user reenable NixOS-check-updates.service
systemctl --user restart NixOS-check-updates.service
