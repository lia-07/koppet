# assumes last line from mount is most recently mounted volume, works for now
maybe_last_mount=$(mount | tail -n1)
disk_path=$(echo $maybe_last_mount | sed -nE 's#^([^ ]+) on (.+) (type [^ ]+ )?\((.+)\)$#\1#p')
mount_path=$(echo $maybe_last_mount | sed -nE 's#^([^ ]+) on (.+) (type [^ ]+ )?\((.+)\)$#\2#p')

while true; do
    read -p "Is this your device: '$disk_path — $mount_path'? (y/n)" ans
    case $ans in
        [Yy]* ) echo "Okay. Proceeding..."; break;;
        [Nn]* ) echo "Weird. You may need to edit this script."; exit;;
        * ) echo "Please provide a valid answer.";;
    esac
done

for fullpath in $KOPPET_ARTICLES_DIR/*.md; do
    filename=$(basename "$fullpath")
    name="${filename%.*}"
    echo "Converting '$name' to EPUB..."
    pandoc "$fullpath" -o "$TMPDIR/$name.epub"
    echo "Converting '$name' to KEPUB..."
    # shut up kepubify
    kepubify "$TMPDIR/$name.epub" -o "$TMPDIR/$name.kepub.epub" > /dev/null
    echo "Sending '$name' to device..."
    cp "$TMPDIR/$name.kepub.epub" "$mount_path/Articles/$name.kepub.epub"
    echo "Cleaning up..."
    rm "$TMPDIR/$name.epub"
    rm "$TMPDIR/$name.kepub.epub"
done

echo "Ejecting device now..."
diskutil eject $disk_path > dev/null
