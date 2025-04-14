#!/bin/bash

round() {
  printf "%.${2}f" "${1}"
}

for FILE in $(find ./original -iname "*.heic"); do
    echo $filename
    LAT=$(round $(exiftool -n -p '$GPSLatitude' $FILE) 5)
    LON=$(round $(exiftool -n -p '$GPSLongitude' $FILE) 5)

    NAME="samples/sample;${LAT/./,};${LON/./,}.jpg"

    sips -s format jpeg -s formatOptions best $FILE --out $NAME
done


