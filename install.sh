#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make FISH the default shell environment
fish fish.fish

# Set macOS preferences
# We will run this last because this will reload the shell
source .macos


# Symlink Mackup.cfg into the home directory
ln Mackup.cfg ~/.mackup.cfg
mackup restore