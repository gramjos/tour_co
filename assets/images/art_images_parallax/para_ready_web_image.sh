#!/usr/local/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <size>"
    exit 1
fi

# Assign the command line argument to a variable
SIZE=$1

# Iterate over all files in the current directory
for FILE in *; do
    # Check if the file is not a PDF and is an image
    if [[ $FILE != *.pdf && ( $FILE == *.jpg || $FILE == *.jpeg || $FILE == *.png || $FILE == *.gif || $FILE == *.bmp || $FILE == *.tiff ) ]]; then
        # Get the file name without the extension
        BASENAME="${FILE%.*}"
        # Create the new file name with .webp extension
        NEWFILE="${BASENAME}_${SIZE}.webp"
        echo "Converting and resizing $FILE to $SIZE..."
        cwebp -resize "${SIZE%x*}" "${SIZE#*x}" "$FILE" -o "$NEWFILE"
    else
        echo "Skipping $FILE (not an image or is a PDF)"
    fi
done

echo "Done converting and resizing images."

