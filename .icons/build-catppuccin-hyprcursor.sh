#!/bin/bash

for dir in src/*; do
  echo "Creating $(basename $dir)"

  mkdir -p "build/$(basename $dir)" # Create the directory if it doesn't exist

  # Copy the template files
  cp -R "template/hyprcursors" "build/$(basename $dir)/"

  # Create the manifest file
  echo -e "name = $(basename $dir)\ndescription = based on Volantes Cursors\nversion = 0.2.0\ncursors_directory = hyprcursors" > "build/$(basename $dir)/manifest.hl"


  # Copy the SVG files
  for file in $dir/*.svg; do
    subdir=$(echo $(basename $file) | sed -n 's/\([a-z_\-]*\)\(\-[0-9]*\)\?\.svg/\1/p') # Extract the subdirectory name
    mkdir -p "build/$(basename $dir)/hyprcursors/$subdir" # Create the subdirectory if it doesn't exist
    cp $file "build/$(basename $dir)/hyprcursors/$subdir/$(basename $file)" # Copy the SVG file to the subdirectory
  done

  # Package files
  echo "Packing $(basename $dir)"
  mkdir -p "dist" # Create the directory if it doesn't exist
  hyprcursor-util --create "build/$(basename $dir)" --output "dist" &> /dev/null
  echo "Done"
  echo ""
done
