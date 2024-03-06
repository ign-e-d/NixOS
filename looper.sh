COUNT=0

while true; do
    if [[ "$COUNTER" -eq 3 ]]; then
        kdialog --title "looper.sh" --passivepopup "Exited with error"
        exit 1
    fi
    sleep 3
    /home/a/NixOS/check-updates.sh wait
    if [ $? -eq 0 ]; then
        exit 0
    fi
    COUNTER=$[COUNTER + 1]
done
