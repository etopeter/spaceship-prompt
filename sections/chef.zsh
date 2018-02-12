#
# Chef
#
# Chef environment from CHEF_ENV variable

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_CHEF_SHOW="${SPACESHIP_CHEF_SHOW=true}"
SPACESHIP_CHEF_PREFIX="${SPACESHIP_CHEF_PREFIX=""}"
SPACESHIP_CHEF_SUFFIX="${SPACESHIP_CHEF_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_CHEF_SYMBOL="${SPACESHIP_CHEF_SYMBOL=""}" 
SPACESHIP_CHEF_COLOR="${SPACESHIP_CHEF_COLOR="cyan"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current Chef environment
spaceship_chef() {
  [[ $SPACESHIP_CHEF_SHOW == false ]] && return

  spaceship::exists knife || return

  # Show Chef status only for Chef & Terraform specific folders
  [[ -f Berksfile || -f metadata.rb || -d .terraform || -f main.tf || -f variables.tf ]] || return

  [[ -z $CHEF_ENV ]] && return

  spaceship::section \
    "$SPACESHIP_CHEF_COLOR" \
    "$SPACESHIP_CHEF_PREFIX" \
    "${SPACESHIP_CHEF_SYMBOL}${CHEF_ENV}" \
    "$SPACESHIP_CHEF_SUFFIX"
}
