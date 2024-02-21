konsole -geometry 600x500+0+0 -e sh -c /home/a/Documents/Share/NixOS-modules/rebuild.sh

if [ $? -eq 1 ]; then #TODO: Rewrite
  kdialog --title "rebuild-wrap.sh" --error "konsole -geometry 600x500+0+0 -e sh -c '/home/a/Documents/Share/NixOS-modules/rebuild.sh'\nFail"
  exit 1
fi
