#! /usr/bin/env nix-shell
#! nix-shell -i maim xclip -p maim xclip

maim -s /home/a/Pictures/$(date +%s).png
