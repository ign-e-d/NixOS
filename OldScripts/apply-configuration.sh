nixos-rebuild switch
exit 0

#pkexec nixos-rebuild switch --verbose
#echo $(kdialog --password "sudo password required") | sudo -S neofetch

if [ $? -eq 0 ]; then
  kdialog --passivepopup "Configuration applied" 20
  ./systemctl-reload.sh
  exit 0
else
  kdialog --yesno "Configuration failed.\nTry again?"
  if [ $? -eq 0 ]; then
    ./apply-configuration.sh
  fi
  exit 1
fi
