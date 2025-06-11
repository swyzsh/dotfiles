#!/bin/sh

sketchybar --add event aerospace_workspace_change

# Get monitor information
MAIN_MONITOR=1
SECONDARY_MONITOR=2

# Main monitor: always show workspaces 1-5
for i in {1..5}; do
  space=(
    space="$i"
    icon="$i"
    icon.highlight_color=$YELLOW
    icon.padding_left=10
    icon.padding_right=10
    display=$MAIN_MONITOR
    padding_left=2
    padding_right=2
    label.padding_right=20
    label.color=$GREY
    label.highlight_color=$WHITE
    label.font="sketchybar-app-font:Regular:16.0"
    label.y_offset=-1
    background.color=$BACKGROUND_1
    background.border_color=$BACKGROUND_2
    script="$PLUGIN_DIR/space.sh"
  )

  sketchybar --add space space.$i left \
             --set space.$i "${space[@]}" \
             --subscribe space.$i mouse.clicked

  # Set initial window icons
  apps=$(aerospace list-windows --workspace $i | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
  icon_strip=" "
  if [ "${apps}" != "" ]; then
    while read -r app; do
      icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
    done <<< "${apps}"
  else
    icon_strip=" —"
  fi
  sketchybar --set space.$i label="$icon_strip"
done

# Secondary monitor: always show workspaces 6-10
  for i in {6..10}; do
    space=(
      space="$i"
      icon="$i"
      icon.highlight_color=$YELLOW
      icon.padding_left=10
      icon.padding_right=10
      display=$SECONDARY_MONITOR
      padding_left=2
      padding_right=2
      label.padding_right=20
      label.color=$GREY
      label.highlight_color=$WHITE
      label.font="sketchybar-app-font:Regular:16.0"
      label.y_offset=-1
      background.color=$BACKGROUND_1
      background.border_color=$BACKGROUND_2
      script="$PLUGIN_DIR/space.sh"
    )

    sketchybar --add space space.$i left \
               --set space.$i "${space[@]}" \
               --subscribe space.$i mouse.clicked

    # Set initial window icons
    apps=$(aerospace list-windows --workspace $i | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
    icon_strip=" "
    if [ "${apps}" != "" ]; then
      while read -r app; do
        icon_strip+=" $($CONFIG_DIR/plugins/icon_map.sh "$app")"
      done <<< "${apps}"
    else
      icon_strip=" —"
    fi
    sketchybar --set space.$i label="$icon_strip"
  done

space_change_handler=(
  icon.drawing=off
  label.drawing=off
  display=active
  padding_left=$PADDINGS
  padding_right=$PADDINGS
  script="$PLUGIN_DIR/space_windows.sh"
)

sketchybar --add item space_change_handler left \
           --set space_change_handler "${space_change_handler[@]}" \
           --subscribe space_change_handler aerospace_workspace_change
