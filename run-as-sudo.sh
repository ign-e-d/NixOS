#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

while getopts "t:f:" arg; do
  case $arg in
    t) Text=$OPTARG;;
    f) File=$OPTARG;;
  esac
done

konsole -geometry 600x500+0+0 -e sh -c "echo $Text && $File"
