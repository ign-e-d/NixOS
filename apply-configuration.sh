#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

./run-as-sudo.sh -t "nixos-rebuild switch" -f "./rebuild.sh"
