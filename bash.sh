#!/bin/bash

# Path'i tanımladık artık burası inotifywait ile sürekli monitor edilecek.
path="/home/ubuntu/Documents/Bsm"

# Olayları tutacak dosya adını tanımladık
log_file="log_kayit.txt"

# İzlenecek olayları tanımladık
events="CREATE,DELETE,MODIFY,MOVE"

# İzlemeyi başlattık.
inotifywait -m -e "$events" --format '%w%f %e' "$path" |
    while read file event; do
        # Olayları log dosyasına ekledik.
        echo "$(date): $file $event" >> "$log_file"
    done