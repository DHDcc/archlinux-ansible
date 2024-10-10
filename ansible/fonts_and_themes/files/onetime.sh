#!/usr/bin/env bash

wallpaperPath="$HOME/.config/swww/wallpapers/ggirl.png"
hyprlandConf="$HOME/.config/hypr/hyprland.conf"
lineRemoved="/exec-once = \$HOME\/.scripts\/onetime.sh/d"

removeScript(){
	local scriptName="${0##*/}"

	if ls "$HOME/.scripts/${scriptName}"; then
		rm -f "$HOME/.scripts/${scriptName}"
	else 
		exit 1 
	fi
}

swww img "${wallpaperPath}" --transition-fps 170 --transition-type fade --transition-duration 1
kitty -e  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
sed -i "${lineRemoved}" "${hyprlandConf}"

removeScript
