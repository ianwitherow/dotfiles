#!/bin/bash


###################################
# Install Homebrew if macos
###################################
if [[ "$OSTYPE" == "darwin"* ]]; then
	if [[ $(command -v brew) == "" ]]; then
		echo "Homebrew not found. Installing Homebrew..."
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> $HOME/.zprofile
		eval "$(/opt/homebrew/bin/brew shellenv)"
	else
		echo "Homebrew is installed."
	fi
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
	if [[ $(command -v brew) == "" ]]; then
		echo ""
		echo ""
		echo "\e[1;32mFailed to install Homebrew. Try running this script again as sudo (sudo !!)\e[0m"
		exit 1
	fi
fi


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

# zsh-syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

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
	echo "NVM not found. Installing..."
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
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


echo "\e[1;32mDone!\e[0m"

# Tell user to run zsh if necessary
if command -v zsh >/dev/null 2>&1; then
	# Zsh is installed
	if [[ "$SHELL" != *"zsh"* ]]; then
		# current shell is not Zsh
		echo "Run \e[1;32mzsh\e[0m to switch to the new hotness."
	fi
fi
