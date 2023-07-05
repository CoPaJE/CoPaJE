#!/usr/bin/env bash

# run gource to export a video of the repo and use their faces as avatars

mkdir -p site

gource \
    -s 1.5s \
    -1280x720 \
    --user-image-dir colaboradores \
    --auto-skip-seconds .1 \
    --multi-sampling \
    --stop-at-end \
    --key \
    --highlight-users \
    --date-format "%d/%m/%y %H:%M" \
    --hide mouse \
    --file-idle-time 0 \
    --max-files 0  \
    --background-colour 000000 \
    --font-size 25 \
    --output-ppm-stream - \
    --output-framerate 60 \
    --logo overrides/favicon/android-chrome-192x192.png \
    | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -crf 21 site/gource.mp4