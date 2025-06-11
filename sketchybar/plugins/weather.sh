source "$CONFIG_DIR/colors.sh"

sketchybar --set $NAME \
  label="Loading..." \
  icon.color=$BLUE

# fetch weather data
LOCATION="NewDelhi"
REGION=""
LANG="en"

# Line below replaces spaces with +
WEATHER_JSON=$(curl -s --max-time 10 --user-agent "curl/7.68.0" "https://wttr.in/$LOCATION?0pq&format=j1&lang=$LANG")

if [ $? -ne 0 ] || [ -z "$WEATHER_JSON" ]; then
  sketchybar --set $NAME \
    label="$LOCATION" \
    icon.color=0xffff6b6b
  exit 0
fi

if ! echo "$WEATHER_JSON" | jq empty 2>/dev/null; then
  sketchybar --set $NAME \
    label="Invalid data" \
    icon.color=0xffff6b6b
  exit 0
fi

TEMPERATURE=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].temp_C // "N/A"' 2>/dev/null)
if [ "$TEMPERATURE" = "null" ] || [ "$TEMPERATURE" = "N/A" ]; then
  TEMPERATURE="--"
fi

WEATHER_DESCRIPTION=$(echo "$WEATHER_JSON" | jq -r '.current_condition[0].weatherDesc[0].value // "Unknown"' 2>/dev/null | sed 's/\(.\{16\}\).*/\1.../')
if [ "$WEATHER_DESCRIPTION" = "null" ]; then
  WEATHER_DESCRIPTION="Unknown"
fi

sketchybar --set $NAME \
  label="$TEMPERATURE$(echo '°')C • $WEATHER_DESCRIPTION" \
  icon.color=$BLUE

