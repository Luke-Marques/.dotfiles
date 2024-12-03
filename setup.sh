#!/bin/bash

# Initialize flag variables
SKIP_CASK=false
SETUP_GIT=false

# Parse command line arguments
while [[ $# -gt 0 ]]; do
  case $1 in
    --skip-cask)
      SKIP_CASK=true
      shift  # Remove --skip-cask from processing
      ;;
    --setup-git)
      SETUP_GIT=true
      shift  # Remove --setup-git from processing
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usagee: ./setup.sh [--skip-cask]"
      exit 1
      ;;
  esac
done

# Show hidden files in finder
defaults write com.apple.finder AppleShowAllFiles YES

# Setup default directories
mkdir -p $HOME/Work

## Homebrew

echo ""
echo "Installing Homebrew packages..."

# Set env var to skip cask packages
if [ "$SKIP_CASK" = true ]; then
  echo "Skipping cask installations."
  export HOMEBREW_BUNDLE_CASK_SKIP="kitty"
fi

# Install packages/applications using Homebrew
brew bundle

## Stow Dotfiles

# ZSH
echo ""
echo "Stowing ZSH dotfiles to ${HOME}"
rm $HOME/.zshrc
stow zsh -t $HOME/

# Kitty
echo "Stowing Kitty config to ${XDG_CONFIG_HOME}kitty/"
stow kitty -t $XDG_CONFIG_HOME/

# Helix
echo "Stowing Helix config to ${XDG_CONFIG_HOME}helix/"
stow helix -t $XDG_CONFIG_HOME/

# Zellij
echo "Stowing Zellij config to ${XDG_CONFIG_HOME}zellij/"
stow zellij -t $XDG_CONFIG_HOME/

# Starship
echo "Stowing Starship config to ${XDG_CONFIG_HOME}starship.toml"
stow starship -t $XDG_CONFIG_HOME/

# Yazi
echo "Stowing Yazi config to ${XDG_CONFIG_HOME}yazi/"
stow yazi -t $XDG_CONFIG_HOME/

# GitUI
echo "Stowing GitUI config to ${XDG_CONFIG_HOME}gitui/"
stow gitui -t $XDG_CONFIG_HOME/

# Yazelix
echo "Stowing Yazelix config to ${XDG_CONFIG_HOME}yazelix/"
stow yazelix -t $XDG_CONFIG_HOME/

# Direnv
echo "Stowing Direnv config to ${XDG_CONFIG_HOME}direnv/"
stow direnv -t $XDG_CONFIG_HOME/

# LazyGit
echo "Stowing Lazygit config to ${XDG_CONFIG_HOME}lazygit/"
stow lazygit -t $XDG_CONFIG_HOME/

# Bat
echo "Stowing Bat config to ${XDG_CONFIG_HOME}bat/"
stow bat -t $XDG_CONFIG_HOME/

## ZSH Plugins
echo ""
echo "Installing custom ZSH plugins..."

# Autosuggestions
echo "Cloning zsh-autosuggestions plugin..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax Highlighting
echo "Cloning zsh-syntax-highlighting..."
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Setup git
if [ "$SETUP_GIT" = true ]; then
  source ./git_setup.sh
fi

echo ""
echo "All done."
echo "Enjoy your system!"
