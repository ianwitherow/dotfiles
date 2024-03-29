#!/bin/bash

echo ""

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
		echo "$(printf '\033[1;31m')Failed to install Homebrew. Try running this script again as sudo (sudo \!\!).$(printf '\033[0m')"
		exit 1
	fi
fi

###################################
# Add and Update apt repositories
###################################
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	echo "Updating apt..."
	sudo apt-get install -y software-properties-common
	sudo add-apt-repository -y ppa:neovim-ppa/unstable # Need this for neovim. Stable did not work, but unstable did
	sudo apt-get update
fi


###################################
# Install curl
###################################
curl_installed=false
if ! command -v curl >/dev/null; then
	# check if running on macOS
	if [[ "$OSTYPE" == "darwin"* ]]; then
		echo "Installing curl on macOS using Homebrew..."
		brew install -y curl

		# check if running on Linux
	elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
		echo "Installing curl on Linux using apt-get..."
		sudo apt-get -y install curl

		echo "curl installation complete."
	fi
fi

if command -v curl &> /dev/null; then
	curl_installed=true
fi


###################################
# Install Git
###################################
if ! command -v git &> /dev/null; then
	# check if running on macOS
	if [[ "$OSTYPE" == "darwin"* ]]; then
		echo "Git not found. Installing Git on macOS using Homebrew..."
		brew install -y git
		echo "Git installation complete."
		# check if running on Linux
	elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
		echo "Git not found. Installing Git on Linux using apt-get..."
		sudo apt-get -y install git
		echo "Git installation complete."
	fi
else
	echo "Git is already installed."
fi

# clone dotfiles repository if it doesn't already exist
if [ ! -d "$HOME/dotfiles" ]; then
	echo "Cloning dotfiles repository..."
	git clone https://github.com/ianwitherow/dotfiles ~/dotfiles
fi


zsh_installed=false
###################################
# Install ZSH
###################################
if ! command -v zsh &> /dev/null; then
	# check if running on macOS
	if [[ "$OSTYPE" == "darwin"* ]]; then
		echo "Zsh not found. Installing Zsh on macOS using Homebrew..."
		brew install -y zsh
		zsh_installed=true
		# check if running on Linux
	elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
		echo "Zsh not found. Installing Zsh on Linux using apt-get..."
		sudo apt-get -y install zsh
		zsh_installed=true
	fi
else
	echo "Zsh is already installed."
	zsh_installed=true
fi
echo "Zsh installation complete."


###################################
# Install oh-my-zsh
###################################
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	# install Oh My Zsh
	echo "Installing Oh My Zsh..."
	if [ "$curl_installed" = true ]; then
		sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	else
		sh -c "$(wget -qO- https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	fi
else
	# Oh My Zsh is already installed
	echo "Oh My Zsh is already installed."
fi

# zsh-syntax-highlighting plugin
omzsh_dir=$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
if [ ! -d "$omzsh_dir" ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $omzsh_dir
fi

###################################
# Install Neovim
###################################
if ! command -v nvim >/dev/null; then
	# check if running on macOS
	if [[ "$OSTYPE" == "darwin"* ]]; then
		echo "Installing Neovim on macOS using Homebrew..."
		brew install -y neovim

		# check if running on Linux
	elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
		echo "Installing Neovim on Linux using apt-get..."
		sudo apt-get -y install neovim

		echo "Neovim installation complete."
	fi
fi


###################################
# Install NVM
###################################
if [ -d "$HOME/.nvm" ]; then
	echo "NVM is already installed."
else
	echo "NVM not found. Installing..."
	if [ "$curl_installed" = true ]; then
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
	else
		wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | bash
	fi

	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

	# install latest stable version of Node.js and npm
	nvm install node
	echo "Node.js and npm installation complete."
fi


if ! command -v diff-so-fancy >/dev/null; then
	echo "Installing diff-so-fancy..."
	npm install -g diff-so-fancy
fi

###################################
# Copy dotfiles
###################################
echo "Copying files and directories..."
# copy files and directories.
# Exclude install.sh, .git, and dotfiles dir
find ~/dotfiles -mindepth 1 -maxdepth 1 ! \( -name 'install.sh' -o -name '.git' -o -name 'dotfiles' \) -exec cp -r {} ~ \;
echo "Copy complete."

###################################
# Done!
###################################
echo ""
echo "$(printf '\033[0;34m')╔═════════════════════════╗$(printf '\033[0m')"
echo "$(printf '\033[0;34m')║                         ║$(printf '\033[0m')"
echo "$(printf '\033[0;34m')║  $(printf '\033[1;33m')* * * * * * * * * * *$(printf '\033[0m')$(printf '\033[0;34m')  ║$(printf '\033[0m')"
echo "$(printf '\033[0;34m')║  $(printf '\033[1;33m')* $(printf '\033[1;32m')      Done!       $(printf '\033[1;33m')* $(printf '\033[0m')$(printf '\033[0;34m') ║$(printf '\033[0m')"
echo "$(printf '\033[0;34m')║  $(printf '\033[1;33m')* * * * * * * * * * *$(printf '\033[0m')$(printf '\033[0;34m')  ║$(printf '\033[0m')"
echo "$(printf '\033[0;34m')║                         ║$(printf '\033[0m')"
echo "$(printf '\033[0;34m')╚═════════════════════════╝$(printf '\033[0m')"
echo ""

# Tell user to run zsh if necessary
if command -v zsh >/dev/null 2>&1; then
	# Zsh is installed
	if [[ "$SHELL" != *"zsh"* ]]; then
		# current shell is not Zsh
		echo ""
		echo "Run $(printf '\033[1;32m')zsh$(printf '\033[0m') to switch to the new hotness."
	fi
fi
