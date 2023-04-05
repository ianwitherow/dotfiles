#!/bin/bash

###################################
# Install Git
###################################
# check if Git is already installed
if ! command -v git &> /dev/null; then
    # check if running on macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Git not found. Installing Git on macOS using Homebrew..."
        brew install git
    # check if running on Linux
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Git not found. Installing Git on Linux using apt-get..."
        sudo apt-get install git
    else
        echo "Unsupported operating system."
        exit 1
    fi
else
    echo "Git is already installed."
fi
echo "Git installation complete."

# clone dotfiles repository if it doesn't already exist
if [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/ianwitherow/dotfiles ~/dotfiles
fi


zsh_installed=false
###################################
# Install ZSH
###################################
# check if Zsh is already installed
if ! command -v zsh &> /dev/null; then
    # check if running on macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Zsh not found. Installing Zsh on macOS using Homebrew..."
        brew install zsh
		  zsh_installed=true
    # check if running on Linux
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Zsh not found. Installing Zsh on Linux using apt-get..."
        sudo apt-get install zsh
		  zsh_installed=true
    else
        echo "Unsupported operating system."
        exit 1
    fi
else
    echo "Zsh is already installed."
	 zsh_installed=true
fi
echo "Zsh installation complete."


###################################
# Install oh-my-zsh
###################################
# check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  # install Oh My Zsh
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  # Oh My Zsh is already installed
  echo "Oh My Zsh is already installed."
fi


###################################
# Install Neovim
###################################
# check if running on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
  echo "Installing Neovim on macOS using Homebrew..."
  brew install neovim
# check if running on Linux
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Installing Neovim on Linux using apt-get..."
  sudo apt-get install neovim
else
  echo "Unsupported operating system."
  exit 1
fi
echo "Neovim installation complete."


###################################
# Install NVM
###################################
if command -v nvm &> /dev/null; then
    echo "NVM is already installed."
else
    # check if running on macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "NVM not found. Installing NVM on macOS..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
    # check if running on Linux
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "NVM not found. Installing NVM on Linux..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
    else
        echo "Unsupported operating system."
        exit 1
    fi
fi

# install latest stable version of Node.js and npm
nvm install node

echo "Node.js and npm installation complete."

echo "Installing diff-so-fancy..."
npm install -g diff-so-fancy

###################################
# Copy dotfiles
###################################
# copy files and directories, excluding install.sh
echo "Copying files and directories..."
find ~/dotfiles -mindepth 1 -maxdepth 1 ! \( -name 'install.sh' -o -name '.git' -o -name 'dotfiles' \) -exec cp -r {} ~ \;
echo "Copy complete."

# Start zsh
if command -v zsh >/dev/null 2>&1; then
  # Zsh is installed
  if [[ "$SHELL" != *"zsh"* ]]; then
    # Zsh is not the default shell
    echo "Zsh is installed, but not the default shell. Changing shell to Zsh..."
    chsh -s $(which zsh)
    echo "Shell changed. Starting Zsh..."
  else
    # Zsh is already the default shell
    echo "Zsh is already the default shell. Starting Zsh..."
  fi
  zsh
else
  # Zsh is not installed
  echo "Zsh is not installed. Aborting."
fi

echo "Done!"

