me=$(basename "$0")
config_folder="/home/a/NixOS"

counter=0
limit=3

# Trying run check-updates.sh $limit times
while true; do
    if [[ "$counter" = "$limit" ]]; then
        kdialog --title "$me" --passivepopup "Counter overflow"
        exit 1
    fi
    sleep 3
    $config_folder/check-updates.sh wait
    if [ $? = 0 ]; then
        exit 0
    fi
    counter=$[counter + 1]
done
