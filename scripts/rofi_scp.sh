#!/usr/bin/env bash

# Define your browser
DMBROWSER="firefox --private-window"

# Defines SCP Series
declare -a series=(
    "Series I - The Original                  [001-999]"
    "Series II - Folktales and Urban Legends  [1000-1999]"
    "Series III - Science Fiction             [2000-2999]"
    "Series IV - Unspeakable Horrors          [3000-3999]"
    "Series V - History                       [4000-4999]"
    "Series VI - Mystery                      [5000-5999]"
    "Series VII - Nature                      [6000-6999]"
    "Series VIII - Luck                       [7000-7999]"
    "Series IX - Fantasy                      [8000-8999]"
)

# Defines Links for SCP Series
declare -a series_links=(
    "Series I - https://scp-wiki.wikidot.com/scp-series"
    "Series II - https://scp-wiki.wikidot.com/scp-series-2"
    "Series III - https://scp-wiki.wikidot.com/scp-series-3"
    "Series IV - https://scp-wiki.wikidot.com/scp-series-4"
    "Series V - https://scp-wiki.wikidot.com/scp-series-5"
    "Series VI - https://scp-wiki.wikidot.com/scp-series-6"
    "Series VII - https://scp-wiki.wikidot.com/scp-series-7"
    "Series VIII - https://scp-wiki.wikidot.com/scp-series-8"
    "Series IX - https://scp-wiki.wikidot.com/scp-series-9"
)

while true; do
    serieslist=$(printf '%s\n' "${series[@]}" | rofi -dmenu -i -p 'SCP Foundation') || exit

    # Compare series and series_links
    for i in "${!series[@]}"; do
        if [[ "${series[$i]}" = "$serieslist" ]]; then
            series_url="${series_links[$i]#* - }"
            scp_entries=$(curl -s "$series_url" | grep -Po 'scp-[0-9]+">([^<]+)</a> - ([^<]+)' | sed 's/[^ ]*">\(.*\)<\/a> - \(.*\)/\1 - \2/')

            IFS=$'\n' read -rd '' -a scp_array <<<"$scp_entries"
            chosen_entry=$(printf '%s\n' "${scp_array[@]}" | rofi -dmenu -i -p "Choose an SCP item") || exit
            scp_number=$(echo "$chosen_entry" | cut -d '-' -f 2)
            scp_name=$(echo "$chosen_entry" | cut -d ' ' -f 3-)

            scp_site="https://scp-wiki.wikidot.com/scp-$scp_number"
            
            $DMBROWSER "$scp_site"
            exit
        fi
    done
done


