#!/bin/bash

directory=~/Wallpaper-Bank/wallpapers

if [ -d "$directory" ]; then
    random_background=$(ls $directory/*.png | shuf -n 1)

    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload $random_background


    for monitor in $(hyprctl monitors | grep Monitor | awk '{print $2}'); do
        hyprctl hyprpaper wallpaper "$monitor, $random_background"
    done

fi
