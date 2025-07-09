#!/usr/bin/env bash

scriptName="${0##*/}"

setWallpaper(){
  local wallpaperPath="$HOME/.config/swww/wallpapers/ggirl.png"
  swww img "${wallpaperPath}" --transition-fps 60 --transition-type fade --transition-duration 1
}

removeScriptFromHyprlandConfigFile(){
  local hyprlandConfigFile="$HOME/.config/hypr/hyprland.conf"
  local lineRemoved="/exec-once = \$HOME\/.scripts\/${scriptName}/d"

  sed -i "${lineRemoved}" "${hyprlandConfigFile}"
}

removeScript(){
  local scriptPath="$HOME/.scripts/${scriptName}"
  if ls "${scriptPath}"; then
    rm -f "${scriptPath}"
  fi
}

setWallpaper
removeScriptFromHyprlandConfigFile
removeScript
