#!/usr/bin/env bash

focused_space=$(aerospace list-workspaces --focused | awk '{print 1}')

update_icon_strip() {
  local space="$1"
  icon_strip=" "
  apps=$(aerospace list-windows --workspace "$space" | awk '{print $3}' | sort | uniq)

  if [ -n "$apps" ]; then
    while IFS= read -r app; do
      icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map_fn.sh "$app")"
    done <<< "$apps"
  else
    icon_strip=" —"
  fi

  sketchybar --set space.$space label="$icon_strip"
}

if [ "SENDER" = "front_app_switched" ]; then
  update_icon_strip "$focused_space"
elif [ "SENDER" = "aerospace_workspace_change" ]; then
  current_spaces=$(aerospace list-workspaces --all | awk '{print $1}')
  for space in $current_spaces; do
    update_icon_strip "$space"
  done
else 
  current_spaces=$(aerospace list-workspaces --all | awk '{print $1}')
  for space in $current_spaces; do
    update_icon_strip "$space"
  done
fi
