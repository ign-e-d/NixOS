cd /home/a/Documents/Share/NixOS-modules/

git fetch
if [ $? -eq 1 ]; then
  kdialog --error "git fetch failed"
  exit 1
fi

DIFF=$(git diff main origin/main)
if [ $? -eq 1 ]; then
  kdialog --error "git diff failed"
  exit 1
fi

if [[ -z "$DIFF" ]]; then
  kdialog --passivepopup "Configuration is up to date" 20
  exit 0
else
  kdialog --passivepopup "Configuration is outdated" 20
  git pull origin main
  kdialog --yesno "Configuration updated.\nApply new configuration?"
  if [ $? -eq 0 ]; then
    ./apply-configuration.sh
  fi
  ./check-updates.sh
fi
