cd /home/a/Documents/Share/NixOS-modules/

git fetch
if [ $? -eq 128 ]; then
  kdialog --title "check-updates.sh" --error "git fetch\nFail"
  exit 1
fi

DIFF=$(git diff main origin/main)
if [ $? -eq 1 ]; then
  kdialog --title "check-updates.sh" --error "git diff main origin/main\nFail"
  exit 1
fi

if [[ -z "$DIFF" ]]; then
  kdialog --title "check-updates.sh" --msgbox "Configuration is up to date"
  exit 0
else
  kdialog --title "check-updates.sh" --warningyesno "Configuration is outdated.\nDo you want to download new configuration?"
  if [ $? -eq 0 ]; then
      git pull origin main
      if [ $? -eq 1 ]; then
        kdialog --title "check-updates.sh" --error "git pull origin main\nFail"
        exit 1
      fi
  else
    exit 0
  fi
  ./check-updates.sh
fi
