#!/usr/bin/env bash

sketchybar --add event aerospace_workspace_change
sketchybar --add event front_app_switched

current_spaces=$(aerospace list-workspaces --all | awk '{print $1}')

for space in $current_spaces; do
  sketchybar --add item space.$space left                                     \
             --subscribe space.$space aerospace_workspace_change              \
             --set space.$space                                               \
                              icon=$space                                     \
                              label=" —"                                      \
                              label.font="sketchybar-app-font:Regular:16.0"   \
                              label.padding_right=20                          \
                              label.y_offset=-1                               \
                              click_script="aerospace workspace \"$space\""   \
                              script="$PLUGIN_DIR/aerospace.sh \"$space\""
done

sketchybar --add item update_workspace_icons left                                             \
           --subscribe update_workspace_icons aerospace_workspace_change front_app_switched   \
           --set update_workspace_icons                                                       \
                              drawing=off                                                     \
                              script="$PLUGIN_DIR/space_icons.sh"
