#! /usr/bin/env nix-shell
#! nix-shell -i maim xclip -p maim xclip

maim -s | xclip -selection clipboard -t image/png
