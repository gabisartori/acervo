APPS="apps"
SCRIPTS="scripts"

# List of favorite apps
FAVORITES=(
  "../apps/browser.jsonc"
  "../apps/file-manager.jsonc"
  "../apps/terminal.jsonc"
)

CONFIG_BOTTOM=(
  "../conf/bottom.jsonc"
  "../conf/favorites.jsonc"
)

CONFIG_TOP=(
  "../conf/top.jsonc"
)

# Merge FAVORITES into CONFIG
BOTTOM_FILES=("${FAVORITES[@]}" "${CONFIG_BOTTOM[@]}")

TOP_FILES=("${CONFIG_TOP[@]}")

# Create top bar config
jq -s 'add' "${TOP_FILES[@]}" > ../config.jsonc

# Create bottom bar config
jq -s 'add' "${BOTTOM_FILES[@]}" > ../config-bottom.jsonc
