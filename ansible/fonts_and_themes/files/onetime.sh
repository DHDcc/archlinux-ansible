#!/usr/bin/env bash

setWallpaper(){
  local wallpaperPath="$HOME/.config/swww/wallpapers/ggirl.png"
  swww img "${wallpaperPath}" --transition-fps 120 --transition-type fade --transition-duration 1
}

zsh4humans(){
  local zsh4humansURL="https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install"
  kitty -e  sh -c "$(curl -fsSL ${zsh4humansURL})"
}

removeScriptFromHyprlandConfigFile(){
  local hyprlandConfigFile="$HOME/.config/hypr/hyprland.conf"
  local lineRemoved="/exec-once = \$HOME\/.scripts\/onetime.sh/d"

  sed -i "${lineRemoved}" "${hyprlandConfigFile}"
}

removeScript(){
  local scriptName="${0##*/}"

  if ls "$HOME/.scripts/${scriptName}"; then
	rm -f "$HOME/.scripts/${scriptName}"
  else 
 	exit 1 
  fi
}

setWallpaper
zsh4humans
removeScriptFromHyprlandConfigFile
removeScript
