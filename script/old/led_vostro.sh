#!/bin/bash


# Turn on/off or toggle touchpad led for vostro 3350

if [[ $1 == "0" ]]; then
    echo 0 > /sys/module/dell_laptop/drivers/platform\:dell-laptop/dell-laptop/leds/dell-laptop\:\:touchpad/brightness
elif [[ $1 == "1" ]]; then
    echo 1 > /sys/module/dell_laptop/drivers/platform\:dell-laptop/dell-laptop/leds/dell-laptop\:\:touchpad/brightness
fi

