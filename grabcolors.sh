#! /bin/bash
## grabcolors.sh ( from colr by dkeg )

export bg="#$(xrdb -query | grep "background" | cut -d '#' -f2)"
export fg="#$(xrdb -query | grep "foreground" | cut -d '#' -f2)"
export colo0="#$(xrdb -query | grep "color0:" | cut -d '#' -f2)"
export colo1="#$(xrdb -query | grep "color1:" | cut -d '#' -f2)"
export colo2="#$(xrdb -query | grep "color2:" | cut -d '#' -f2)"
export colo3="#$(xrdb -query | grep "color3:" | cut -d '#' -f2)"
export colo4="#$(xrdb -query | grep "color4:" | cut -d '#' -f2)"
export colo5="#$(xrdb -query | grep "color5:" | cut -d '#' -f2)"
export colo6="#$(xrdb -query | grep "color6:" | cut -d '#' -f2)"
export colo7="#$(xrdb -query | grep "color7:" | cut -d '#' -f2)"
export colo8="#$(xrdb -query | grep "color8:" | cut -d '#' -f2)"
export colo9="#$(xrdb -query | grep "color9:" | cut -d '#' -f2)"
export colo10="#$(xrdb -query | grep "color10:" | cut -d '#' -f2)"
export colo11="#$(xrdb -query | grep "color11:" | cut -d '#' -f2)"
export colo12="#$(xrdb -query | grep "color12:" | cut -d '#' -f2)"
export colo13="#$(xrdb -query | grep "color13:" | cut -d '#' -f2)"
export colo14="#$(xrdb -query | grep "color14:" | cut -d '#' -f2)"
export colo15="#$(xrdb -query | grep "color15:" | cut -d '#' -f2)"

