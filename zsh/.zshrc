# ZSH Configuration

# --- Oh My ZSH -----------------------------------------------------------------------

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

# --- Pyenv ---------------------------------------------------------------------------

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# --- Poetry --------------------------------------------------------------------------

export PATH="$HOME/.local/bin:$PATH"

# --- Spark ---------------------------------------------------------------------------

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home

# --- ZSH PLUGINS ---------------------------------------------------------------------

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
)
source $ZSH/oh-my-zsh.sh

# --- PIPX ----------------------------------------------------------------------------

# Created by `pipx` on 2024-02-19 16:12:22
export PATH="$PATH:/Users/k1763489/.local/bin"

# --- ENVIRONMENT VARIABLES -----------------------------------------------------------

# Set config dotfiles location
export XDG_CONFIG_HOME=$HOME/.config/

# Set default editor
export EDITOR=hx
export VISUAL="$EDITOR"

# Set bat theme
export BAT_THEME="kanagawa"

# --- ALIASES -------------------------------------------------------------------------

# Include custom aliases from file
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

# --- ZOXIDE --------------------------------------------------------------------------

eval "$(zoxide init zsh)"

# --- DIRENV --------------------------------------------------------------------------

eval "$(direnv hook zsh)"

# --- PROMPT CONFIGURATION ------------------------------------------------------------

# Set up Starship prompt
eval "$(starship init zsh)"

# --- FIN -----------------------------------------------------------------------------
