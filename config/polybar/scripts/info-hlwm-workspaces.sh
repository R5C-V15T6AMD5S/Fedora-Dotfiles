#!/usr/bin/env bash

# Multi monitor support. Needs MONITOR environment variable to be set for each instance of polybar
# If MONITOR environment variable is not set this will default to monitor 0
# Check https://github.com/polybar/polybar/issues/763
MON_IDX="0"
mapfile -t MONITOR_LIST < <(polybar --list-monitors | cut -d":" -f1)
for (( i=0; i<$((${#MONITOR_LIST[@]})); i++ )); do
  [[ ${MONITOR_LIST[${i}]} == "$MONITOR" ]] && MON_IDX="$i"
done;

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<< "$(herbstclient tag_status "${MON_IDX}")"
        {
            for i in "${tags[@]}" ; do
                # Read the prefix from each tag and render them according to that prefix
                case ${i:0:1} in
                    '.')
                        # the tag is empty
                        echo -n "%{F#999}"  # Gray color for empty tags
                        ;;
                    ':')
                        # the tag is not empty
                        echo -n "%{F#FFF}"  # White color for non-empty tags
                        ;;
                    '+')
                        # the tag is viewed on the specified MONITOR, but this monitor is not focused.
                        echo -n "%{F#00F}"  # Blue color for viewed tags on another monitor
                        ;;
                    '#')
                        # the tag is viewed on the specified MONITOR and it is focused.
                        echo -n "%{F#0F0}"  # Green color for focused tags
                        ;;
                    '-')
                        # the tag is viewed on a different MONITOR, but this monitor is not focused.
                        echo -n "%{F#F00}"  # Red color for tags viewed on another monitor
                        ;;
                    '%')
                        # the tag is viewed on a different MONITOR and it is focused.
                        echo -n "%{F#FF0}"  # Yellow color for focused tags on another monitor
                        ;;
                    '!')
                        # the tag contains an urgent window
                        echo -n "%{F#F0F}"  # Magenta color for urgent tags
                        ;;
                esac

                # focus the monitor of the current bar before switching tags
                echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:}  ${i:1}  %{A -u -o F- B-}"
            done

            # reset foreground and background color to default
            echo "%{F-}%{B-}"
        } | tr -d "\n"

    echo

    # wait for next event from herbstclient --idle
    read -r || break
done
} 2>/dev/null

