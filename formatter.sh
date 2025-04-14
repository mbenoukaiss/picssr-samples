#!/bin/bash

round() {
  printf "%.${2}f" "${1}"
}

for FILE in samples/*.heic; do
    echo $filename
    LAT=$(round $(exiftool -n -p '$GPSLatitude' $FILE) 5)
    LON=$(round $(exiftool -n -p '$GPSLongitude' $FILE) 5)

    NAME="formatted/sample;${LAT/./,};${LON/./,}.jpg"
echo $NAME
    sips -s format jpeg -s formatOptions best $FILE --out $NAME
done


