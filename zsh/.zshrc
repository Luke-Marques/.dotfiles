# ZSH Configuration

# --- ZSH PLUGINS ---------------------------------------------------------------------

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
)

# --- CONDA ---------------------------------------------------------------------------

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/k1763489/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/k1763489/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/k1763489/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/k1763489/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# --- JULIA ---------------------------------------------------------------------------

# !! Contents within this block are managed by juliaup !!
path=('/Users/k1763489/.juliaup/bin' $path)
export PATH

# --- PIPX ----------------------------------------------------------------------------

# Created by `pipx` on 2024-02-19 16:12:22
export PATH="$PATH:/Users/k1763489/.local/bin"

# --- GO ------------------------------------------------------------------------------

# Add go to Path
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# --- HOMEBREW ------------------------------------------------------------------------

export PATH="$PATH:/$HOME/homebrew/bin"
alias brew="~/homebrew/bin/brew"
export DYLD_LIBRARY_PATH="$(brew --prefix)lib:$DYLD_LIBRARY_PATH"

# --- ENVIRONMENT VARIABLES -----------------------------------------------------------

# Set config dotfiles location
export XDG_CONFIG_HOME=$HOME/.config/

# --- ALIASES -------------------------------------------------------------------------

# Include custom aliases from file
if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

# Add love2d alias
alias love="/Applications/love.app/Contents/MacOS/love"

# --- PROMPT CONFIGURATION ------------------------------------------------------------

# Set up Starship prompt
eval "$(starship init zsh)"

# # Set up oh-my-zsh
# export ZSH="$HOME/.oh-my-zsh"
# ZSH_THEME="bureau"
# source $ZSH/oh-my-zsh.sh

# --- NEOFETCH ------------------------------------------------------------------------

neofetch

# --- FIN -----------------------------------------------------------------------------

. "$HOME/.cargo/env"
