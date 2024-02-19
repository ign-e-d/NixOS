xhost +
sleep 10s

#zenity --notification --text='123'
#echo "1"

cd /home/a/Documents/Share/NixOS-modules/

git fetch

if [[ `git diff main origin/main` ]]; then
  zenity --notification --text="Configuration is outdated"
  git pull origin main
  zenity --notification --text="You can rebuild the system"
  ./check-updates.sh
else
  zenity --notification --text="Configuration is up to date"
fi

