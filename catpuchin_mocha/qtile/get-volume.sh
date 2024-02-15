#!/bin/zsh
#muted=$(pactl get-sink-mute @DEFAULT_SINK@)
#volume=$(amixer sget PCM | awk -F"[][]" '/Left:/ { print $2 }')

#if [[ $muted = *"yes"* ]] || [[ $volume == '0%' ]]
#then
#    print -1
#else
#    printf '%s%s%s' '[' $volume ']'
#fi
volume=$(amixer sget PCM | awk -F"[][]" '/Left:/ { print $2 }')
printf '%s%s%s' $volume