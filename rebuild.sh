sudo nixos-rebuild switch

if [ $? -eq 0 ]; then
  kdialog --passivepopup "Configuration applied"
  ./systemctl-reload.sh
  exit 0
else
  kdialog --yesno "Configuration failed.\nTry again?"
  if [ $? -eq 0 ]; then
    ./apply-configuration.sh
  fi
  exit 1
fi
