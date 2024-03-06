# Screen resolution
read W H < <(xrandr --current | grep -oP '\d+x\d+' | tr x ' ')

# Rebuild script in separate konsole
konsole -geometry $W\x$H+0+0 -e sh -c /home/a/NixOS/nixos-rebuild.sh

if [ $? -eq 1 ]; then
  kdialog --title "rebuild-wrap.sh" --error "konsole -geometry 600x500+0+0 -e sh -c '/home/a/NixOS/nixos-rebuild.sh'\nFail"
  exit 1
fi
