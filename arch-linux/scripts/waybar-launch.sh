#!/bin/bash
killall -q waybar

if [[ $USER = "suedyash" ]]
then
    waybar -c ~/.config/waybar/config & -s ~/.config/waybar/style.css
else
    waybar &
fi