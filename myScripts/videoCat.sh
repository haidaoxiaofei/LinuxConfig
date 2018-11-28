#!/bin/bash

for FILE in $@; do
  avconv -i $FILE -map 0 -f mpegts -bsf h264_mp4toannexb -c:v copy -y $FILE.tmp
  IN=$IN\|$FILE.tmp
done

IN=${IN#\|}
avconv -i concat:$IN -c copy out.mp4

for FILE in $@; do
  rm $FILE.tmp
done

rm *.mp4concatpipe
