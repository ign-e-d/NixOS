me=$(basename "$0")
config_folder=$(dirname "$(dirname "$0")")

# Fetch remote repository state
git -C $config_folder fetch
if [ $? != 0 ]; then
  kdialog --title "$me" --error "Failed"
  exit 1
fi

# Find differences between local and remote repositories
DIFF=$(git -C $config_folder diff main origin/main)
if [ $? != 0 ]; then
  kdialog --title "$me" --error "Failed"
  exit 1
fi

# If no differences - exit, otherwise suggest to pull remote repository
if [[ -z "$DIFF" ]]; then
  kdialog --title "$me" --msgbox "Configuration is up to date"
  exit 0
else
  kdialog --title "$me" --warningyesno "Configuration is outdated.\nDo you want to download new configuration?"
  if [ $? = 0 ]; then
      git -C $config_folder pull origin main
      if [ $? != 0 ]; then
        kdialog --title "$me" --error "Failed"
        exit 1
      fi
  else
    exit 0
  fi
  $config_folder/scripts/check-updates.sh
fi
