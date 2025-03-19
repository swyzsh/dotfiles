#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

# Show Workspace 1 as focused on startup
if [ -z "$FOCUSED_WORKSPACE" ] && [ "$1" = "1" ]; then
  sketchybar --set $NAME background.drawing=on            \
                         background.color=$ACCENT_COLOR   \
                         label.color=$BLACK               \
                         icon.color=$BLACK
# Check and show currently focused workspace
elif [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.drawing=on            \
                         background.color=$ACCENT_COLOR   \
                         label.color=$BLACK               \
                         icon.color=$BLACK
# Reset styling for non-focued workspaces
else
  sketchybar --set $NAME background.drawing=on            \
                         background.color=$BLACK          \
                         label.color=$ACCENT_COLOR        \
                         icon.color=$ACCENT_COLOR
fi
