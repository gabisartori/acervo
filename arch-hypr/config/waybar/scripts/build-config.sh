WAYBAR=$XDG_CONFIG_HOME/waybar

APPS=$WAYBAR/apps
SCRIPTS=$WAYBAR/scripts
CONF=$WAYBAR/conf

# List of favorite apps
FAVORITES=(
  "$APPS/browser.jsonc"
  "$APPS/file-manager.jsonc"
  "$APPS/terminal.jsonc"
)

CONFIG_BOTTOM=(
  "$CONF/bottom.jsonc"
  "$CONF/favorites.jsonc"
)

CONFIG_TOP=(
  "$CONF/top.jsonc"
)

# Merge FAVORITES into CONFIG
BOTTOM_FILES=("${FAVORITES[@]}" "${CONFIG_BOTTOM[@]}")

TOP_FILES=("${CONFIG_TOP[@]}")

# Create top bar config
jq -s 'add' "${TOP_FILES[@]}" > $WAYBAR/config.jsonc

# Create bottom bar config
jq -s 'add' "${BOTTOM_FILES[@]}" > $WAYBAR/config-bottom.jsonc

. $WAYBAR/scripts/launch-waybar.sh </dev/null &>/dev/null &
