#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

pkexec systemctl daemon-reload
systemctl --user reenable NixOS-check-updates.service
systemctl --user restart NixOS-check-updates.service
