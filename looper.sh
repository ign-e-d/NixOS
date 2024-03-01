while true; do
    /home/a/NixOS/check-updates.sh wait
    if [ $? -eq 0 ]; then
        break
    fi
    sleep 1
done
