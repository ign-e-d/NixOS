while getopts "t:f:" arg; do
  case $arg in
    t) Text=$OPTARG;;
    f) File=$OPTARG;;
  esac
done

exec konsole -e sh -c "
echo $Text
sudo $File
"
