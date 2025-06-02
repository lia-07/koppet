for fullpath in $KOPPET_ARTICLES_DIR/*.md; do
    filename=$(basename "$fullpath")
    name="${filename%.*}"
    echo "Converting '$name' to EPUB..."
    pandoc "$fullpath" -o "$TMPDIR/$name.epub"
    echo "Converting '$name' to KEPUB..."
    kepubify "$TMPDIR/$name.epub" -o "$TMPDIR/$name.kepub.epub" > /dev/null
    echo "Sending '$name' to Kobo..."
    cp "$TMPDIR/$name.kepub.epub" "/Volumes/NO NAME/Articles/$name.kepub.epub"
    echo "Cleaning up..."
    rm "$TMPDIR/$name.epub"
    rm "$TMPDIR/$name.kepub.epub"
done
echo "Ejecting Kobo now..."
diskutil eject /dev/disk8
