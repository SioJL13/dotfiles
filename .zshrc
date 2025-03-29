# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Initialize zplug
source ~/.zplug/init.zsh

# Starship prompt
eval "$(starship init zsh)"

# ALIAS for mise
alias use-local-mise='export MISE_CONFIG=./mise.local.toml'

# bat configuration
export BAT_THEME="Monokai Extended"
export BAT_STYLE="full"
export BAT_PAGER="less -RF"
export BAT_CONFIG_PATH="~/.config/bat/config"

# Use bat instead of cat
alias cat='bat'
