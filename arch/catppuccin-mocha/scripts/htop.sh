#!/bin/bash
killall htop

if [[ $USER = "suedyash" ]]
then
    alacritty -e htop
fi