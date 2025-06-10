#!/bin/bash

update() {
  if [ "$SENDER" = "space_change" ]; then
    source "$CONFIG_DIR/colors.sh"
    COLOR=$BACKGROUND_2
    if [ "$SELECTED" = "true" ]; then
      COLOR=$GREY
    fi
    sketchybar --set space.$(aerospace list-workspaces --focused) \
               icon.highlight=true \
               label.highlight=true \
               background.border_color=$GREY
  fi
}

set_space_label() {
  sketchybar --set $NAME icon="$1"
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    echo ''
  else
    # Only allow switching to workspace, no creation/destruction
    aerospace workspace ${NAME#*.}
  fi
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked ;;
  *) update ;;
esac
