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



###################################
# Install ZSH and oh-my-zsh
###################################
# check if Zsh is already installed
if ! command -v zsh &> /dev/null; then
    # check if running on macOS
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "Zsh not found. Installing Zsh and Oh My Zsh on macOS using Homebrew..."
        brew install zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # check if running on Linux
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "Zsh not found. Installing Zsh and Oh My Zsh on Linux using apt-get..."
        sudo apt-get install zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    else
        echo "Unsupported operating system."
        exit 1
    fi
else
    echo "Zsh is already installed."
fi
echo "Zsh installation complete."


###################################
# Install zsh-syntax-highlighting
###################################
# set the destination directory to the user's home directory
DEST_DIR="$HOME/zsh-syntax-highlighting"
# check if the repository is already cloned
if [ -d "$DEST_DIR" ]; then
    echo "zsh-syntax-highlighting is already present"
else
    # clone the repository
    echo "Cloning zsh-syntax-highlighting from GitHub..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$DEST_DIR"
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
find ~/dotfiles ! -name 'install.sh' -exec cp -r {} ~ \;
echo "Copy complete."

echo "Done!"

