#! /usr/bin/env nix-shell
#! nix-shell -i bash git -p bash git

pkexec nixos-rebuild switch --flake ~/NixOS/#$HOSTNAME
