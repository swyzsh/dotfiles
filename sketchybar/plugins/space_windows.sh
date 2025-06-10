#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

AEROSPACE_FOCUSED_MONITOR=$(aerospace list-monitors --focused | awk '{print $1}')
MAIN_MONITOR=1
SECONDARY_MONITOR=2

reload_workspace_icon() {
  apps=$(aerospace list-windows --workspace "$1" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app; do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi

  sketchybar --animate sin 10 --set space.$1 label="$icon_strip"
}

if [ "$SENDER" = "aerospace_workspace_change" ]; then
  reload_workspace_icon "$AEROSPACE_PREV_WORKSPACE"
  reload_workspace_icon "$AEROSPACE_FOCUSED_WORKSPACE"

  # Current workspace highlighting
  sketchybar --set space.$AEROSPACE_FOCUSED_WORKSPACE \
             icon.highlight=true \
             label.highlight=true \
             background.border_color=$GREY

  # Previous workspace unhighlighting
  sketchybar --set space.$AEROSPACE_PREV_WORKSPACE \
             icon.highlight=false \
             label.highlight=false \
             background.border_color=$BACKGROUND_2

  # Ensure workspaces 1-5 always show on main monitor
  for i in {1..5}; do
    sketchybar --set space.$i display=$MAIN_MONITOR
  done

  # Ensure workspaces 6-10 always show on secondary monitor (if exists)
  if [ -n "$SECONDARY_MONITOR" ]; then
    for i in {6..10}; do
      sketchybar --set space.$i display=$SECONDARY_MONITOR
    done
  fi
fi
