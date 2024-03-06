while true; do
    sleep 1
    /home/a/NixOS/check-updates.sh wait
    if [ $? -eq 0 ]; then
        break
    fi
    # TODO add counter to 10 and break after
done
